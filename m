Return-Path: <philip.lorenz@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E14ECC25B78
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 14:32:52 +0000 (UTC)
Received: from esa12.hc324-48.eu.iphmx.com (esa12.hc324-48.eu.iphmx.com [207.54.72.34])
 by mx.groups.io with SMTP id smtpd.web10.23520.1716906762248759957
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 May 2024 07:32:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=MmvJ0eNv;
 spf=pass (domain: bmw.de, ip: 207.54.72.34, mailfrom: prvs=8715eaed1=philip.lorenz@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1716906763; x=1748442763;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rahpJDOp3eJhKjyw/Iep7sAOa5i6/ZkaXDYduCZPH1k=;
  b=MmvJ0eNvpdixZqpeSi79cUDpw5HEM6ydzBImuQxqelk2Tq8YltC0hIeY
   J2Ba60fEb5IqaCBUbIM7G+tRcBqwu+JA4MnmE7y8ATb3lvIfSaJ7XRKHq
   LS4Ec81htAeeuLGHFBGkl6JzLa4Evm0tWf3puf+SaYcQWksupiDbjeFSq
   s=;
X-CSE-ConnectionGUID: 8FwZIfmVSLOGsoboGsxeXQ==
X-CSE-MsgGUID: Rcx9Bn5bS9qIz8NO6SCHEg==
Received: from esagw5.bmwgroup.com (HELO esagw5.muc) ([160.46.252.46]) by
 esa12.hc324-48.eu.iphmx.com with ESMTP/TLS; 28 May 2024 16:32:39 +0200
Received: from esabb1.muc ([160.50.100.31])  by esagw5.muc with ESMTP/TLS;
 28 May 2024 16:32:39 +0200
Received: from smucmp10e.bmwgroup.net (HELO SMUCMP10E.europe.bmw.corp) ([10.30.13.87])
 by esabb1.muc with ESMTP/TLS; 28 May 2024 16:32:39 +0200
Received: from localhost.localdomain (10.30.85.210) by SMUCMP10E.europe.bmw.corp
 (2a03:1e80:a15:58f::2027) with Microsoft SMTP Server (version=TLS;
 Tue, 28 May 2024 16:32:38 +0200
From: Philip Lorenz <philip.lorenz@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Philip Lorenz <philip.lorenz@bmw.de>
Subject: [scarthgap][PATCH 2/2] ipk: Fix clean up of extracted IPK payload
Date: Tue, 28 May 2024 16:30:58 +0200
Message-ID: <20240528143058.85909-2-philip.lorenz@bmw.de>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240528143058.85909-1-philip.lorenz@bmw.de>
References: <20240528143058.85909-1-philip.lorenz@bmw.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp10b.europe.bmw.corp (2a03:1e80:a15:58f::2000) To
 SMUCMP10E.europe.bmw.corp (2a03:1e80:a15:58f::2027)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 May 2024 14:32:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199975

It turns out that the IPK payload tarball was actually cleaned up in the
concrete package manager implementation (most likely because at some
point Debian and IPK packages used different compression algorithms).

Globbing removes this ambiguity so move the removal of the payload into
the common extract method.

Signed-off-by: Philip Lorenz <philip.lorenz@bmw.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1e2b02a54f482159e21902eeb997b21e00e9588e)
---
 meta/lib/oe/package_manager/ipk/__init__.py | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/package_manager/ipk/__init__.py b/meta/lib/oe/package_manager/ipk/__init__.py
index 0f0038d00d9..47e72cc7a65 100644
--- a/meta/lib/oe/package_manager/ipk/__init__.py
+++ b/meta/lib/oe/package_manager/ipk/__init__.py
@@ -159,6 +159,7 @@ class OpkgDpkgPM(PackageManager):
         bb.note("Extracted %s to %s" % (pkg_path, tmp_dir))
         bb.utils.remove(os.path.join(tmp_dir, "debian-binary"))
         bb.utils.remove(os.path.join(tmp_dir, "control.tar.gz"))
+        bb.utils.remove(os.path.join(tmp_dir, data_tar))
         os.chdir(current_dir)
 
         return tmp_dir
@@ -511,7 +512,4 @@ class OpkgPM(OpkgDpkgPM):
             bb.fatal("Unable to get information for package '%s' while "
                      "trying to extract the package."  % pkg)
 
-        tmp_dir = super(OpkgPM, self).extract(pkg, pkg_info)
-        bb.utils.remove(os.path.join(tmp_dir, "data.tar.zst"))
-
-        return tmp_dir
+        return super(OpkgPM, self).extract(pkg, pkg_info)
-- 
2.45.1


