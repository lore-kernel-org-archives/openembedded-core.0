Return-Path: <philip.lorenz@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E23C5C41513
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 14:32:52 +0000 (UTC)
Received: from esa12.hc324-48.eu.iphmx.com (esa12.hc324-48.eu.iphmx.com [207.54.72.34])
 by mx.groups.io with SMTP id smtpd.web10.23520.1716906762248759957
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 May 2024 07:32:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=Q8Dzyh35;
 spf=pass (domain: bmw.de, ip: 207.54.72.34, mailfrom: prvs=8715eaed1=philip.lorenz@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1716906762; x=1748442762;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=206klXMOQo8OKIeQjkmRPItept8jObZ/31Q8ochwiws=;
  b=Q8Dzyh35+bkFV1Vv9i1z2R7Q2ODch8DMxVTtZXmCR7rVuVHBuxAytnah
   fIq5Twik/zRKrLxf9pratkaAU7Fdbea3ScMZaC66R8bBb6vq6dnABhsEa
   XkNl2YFFpqED3PUKNkZs4kPlBz4j5BZ6sQcLPCJ4uE5pADewo6EuNHuPB
   U=;
X-CSE-ConnectionGUID: 8FwZIfmVSLOGsoboGsxeXQ==
X-CSE-MsgGUID: FfEYs216Sdqt+4wqLZsKPg==
Received: from esagw5.bmwgroup.com (HELO esagw5.muc) ([160.46.252.46]) by
 esa12.hc324-48.eu.iphmx.com with ESMTP/TLS; 28 May 2024 16:32:38 +0200
Received: from esabb2.muc ([160.50.100.34])  by esagw5.muc with ESMTP/TLS;
 28 May 2024 16:32:39 +0200
Received: from smucmp10e.bmwgroup.net (HELO SMUCMP10E.europe.bmw.corp) ([10.30.13.87])
 by esabb2.muc with ESMTP/TLS; 28 May 2024 16:32:39 +0200
Received: from localhost.localdomain (10.30.85.210) by SMUCMP10E.europe.bmw.corp
 (2a03:1e80:a15:58f::2027) with Microsoft SMTP Server (version=TLS;
 Tue, 28 May 2024 16:32:38 +0200
From: Philip Lorenz <philip.lorenz@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Philip Lorenz <philip.lorenz@bmw.de>
Subject: [scarthgap][PATCH 1/2] lib/package_manager/ipk: Do not hardcode payload compression algorithm
Date: Tue, 28 May 2024 16:30:57 +0200
Message-ID: <20240528143058.85909-1-philip.lorenz@bmw.de>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp10b.europe.bmw.corp (2a03:1e80:a15:58f::2000) To
 SMUCMP10E.europe.bmw.corp (2a03:1e80:a15:58f::2027)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 May 2024 14:32:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199974

The chosen payload compression algorithm can be changed by overriding
`OPKGBUILDCMD`. Ensure that package extraction deals with this by
globbing for "data.tar.*" to select the actual payload tarball.

Signed-off-by: Philip Lorenz <philip.lorenz@bmw.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2ad05635a6da403b4fadcc126fe7734067c12c73)
---
 meta/lib/oe/package_manager/ipk/__init__.py | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager/ipk/__init__.py b/meta/lib/oe/package_manager/ipk/__init__.py
index 8cc9953a027..0f0038d00d9 100644
--- a/meta/lib/oe/package_manager/ipk/__init__.py
+++ b/meta/lib/oe/package_manager/ipk/__init__.py
@@ -4,6 +4,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
+import glob
 import re
 import shutil
 import subprocess
@@ -134,11 +135,16 @@ class OpkgDpkgPM(PackageManager):
         tmp_dir = tempfile.mkdtemp()
         current_dir = os.getcwd()
         os.chdir(tmp_dir)
-        data_tar = 'data.tar.zst'
 
         try:
             cmd = [ar_cmd, 'x', pkg_path]
             output = subprocess.check_output(cmd, stderr=subprocess.STDOUT)
+            data_tar = glob.glob("data.tar.*")
+            if len(data_tar) != 1:
+                bb.fatal("Unable to extract %s package. Failed to identify "
+                         "data tarball (found tarballs '%s').",
+                         pkg_path, data_tar)
+            data_tar = data_tar[0]
             cmd = [tar_cmd, 'xf', data_tar]
             output = subprocess.check_output(cmd, stderr=subprocess.STDOUT)
         except subprocess.CalledProcessError as e:
-- 
2.45.1


