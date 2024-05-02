Return-Path: <philip.lorenz@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 112CBC4345F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 14:28:47 +0000 (UTC)
Received: from esa7.hc324-48.eu.iphmx.com (esa7.hc324-48.eu.iphmx.com [207.54.71.126])
 by mx.groups.io with SMTP id smtpd.web10.6861.1714660123052141932
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 May 2024 07:28:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=FIb7gpm9;
 spf=pass (domain: bmw.de, ip: 207.54.71.126, mailfrom: prvs=8451f0b36=philip.lorenz@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1714660123; x=1746196123;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=koNHgFzP2KhqwE8UfGw1YyF9Nx6ezn+skWt4m9jzY7U=;
  b=FIb7gpm9nKCAz2+XOp/d8YV02VZ0NEBsmGgzZfEVPquaUAJwmN0gy1g0
   TiVNw9PlMoF4vBhH3+MGgdK9jfClXUkcVY9/PusmMZcrxjraAPLOIJ61o
   EDoeI2XVyN3tweXv5MwLq0xPHT5k7z3rLvYYJorK+r8i5eQ3wPtCycAnO
   E=;
X-CSE-ConnectionGUID: oeBCLhbbQ0agXlrV/lp/Vg==
X-CSE-MsgGUID: 8yQj0dSNSGGhvkq15cb0jA==
Received: from esagw3.bmwgroup.com (HELO esagw3.muc) ([160.46.252.35]) by
 esa7.hc324-48.eu.iphmx.com with ESMTP/TLS; 02 May 2024 16:28:40 +0200
Received: from esabb1.muc ([160.50.100.31])  by esagw3.muc with ESMTP/TLS;
 02 May 2024 16:28:40 +0200
Received: from smucmp10e.bmwgroup.net (HELO SMUCMP10E.europe.bmw.corp) ([10.30.13.87])
 by esabb1.muc with ESMTP/TLS; 02 May 2024 16:28:40 +0200
Received: from localhost.localdomain (10.30.85.215) by SMUCMP10E.europe.bmw.corp
 (2a03:1e80:a15:58f::2027) with Microsoft SMTP Server (version=TLS;
 Thu, 2 May 2024 16:28:40 +0200
From: Philip Lorenz <philip.lorenz@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Philip Lorenz <philip.lorenz@bmw.de>
Subject: [PATCH] ipk: Do not hardcode payload compression algorithm
Date: Thu, 2 May 2024 16:27:16 +0200
Message-ID: <20240502142716.2112863-1-philip.lorenz@bmw.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp03c.europe.bmw.corp (2a03:1e80:a15:58f::1:1a) To
 SMUCMP10E.europe.bmw.corp (2a03:1e80:a15:58f::2027)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 14:28:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198927

The chosen payload compression algorithm can be changed by overriding
`OPKGBUILDCMD`. Ensure that package extraction deals with this by
globbing for "data.tar.*" to select the actual payload tarball.

Signed-off-by: Philip Lorenz <philip.lorenz@bmw.de>
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
2.44.0


