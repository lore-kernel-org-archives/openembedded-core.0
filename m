Received: from esa11.hc324-48.eu.iphmx.com (esa11.hc324-48.eu.iphmx.com [207.54.69.30])
 by mx.groups.io with SMTP id smtpd.web11.33284.1610369132224812695
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jan 2021 04:45:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1 header.b=k8V2byFo;
 spf=pass (domain: bmw.de, ip: 207.54.69.30, mailfrom: prvs=638ffc773=michael.ho@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1610369132; x=1641905132;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=RO1HbAE47+PT6otAp6kkwbCVOyfV0C5tQI4yk1Ot67g=;
  b=k8V2byFoCc4UXz3Sgu2+PmqoQsViW0wkTWi7ttXGyGchaxtNT3MSHYu5
   fuO1upwBq0G9NXG9Mw2+IRbazzIE2tiROp1UD/mI3UL2xC3uiZyhBMxs5
   3/fQBurRQ3cr8Fyw/MZgU2rnEx2UBrOC73prRXf15t4yHpdVBzgac7jKg
   Q=;
Received: from esagw6.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
 esa11.hc324-48.eu.iphmx.com with ESMTP/TLS; 11 Jan 2021 13:45:29 +0100
Received: from esabb1.muc ([160.50.100.31])  by esagw6.muc with ESMTP/TLS;
 11 Jan 2021 13:45:29 +0100
Received: from smucm09k.bmwgroup.net (HELO smucm09k.europe.bmw.corp) ([160.48.96.43])
 by esabb1.muc with ESMTP/TLS; 11 Jan 2021 13:45:29 +0100
Received: from michael-pcx.bmw-carit.intra (192.168.221.45) by
 smucm09k.europe.bmw.corp (160.48.96.43) with Microsoft SMTP Server (TLS;
 Mon, 11 Jan 2021 13:45:29 +0100
From: "Michael Ho" <Michael.Ho@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Michael Ho <Michael.Ho@bmw.de>
Subject: [PATCH] rootfs_ipk: allow do_populate_sdk in parallel to do_rootfs
Date: Mon, 11 Jan 2021 13:45:23 +0100
Message-ID: <1610369123-220800-1-git-send-email-michael.ho@bmw.de>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Return-Path: michael.ho@bmw.de
X-ClientProxiedBy: smucm15m.europe.bmw.corp (160.48.96.69) To
 smucm09k.europe.bmw.corp (160.48.96.43)
Content-Type: text/plain

From: Michael Ho <Michael.Ho@bmw.de>

Switch do_populate_sdk for the ipk package manager to use a separate target
opkg config file and separate the lockfiles restricting do_rootfs and
do_populate_sdk from running in parallel.

This way if an image recipe includes a dependency to do_populate_sdk by
default then it will run in parallel to do_rootfs saving time compared to the
sequential execution.

Signed-off-by: Michael Ho <Michael.Ho@bmw.de>
---
 meta/classes/package_ipk.bbclass       | 1 +
 meta/classes/rootfs_ipk.bbclass        | 4 ++--
 meta/lib/oe/package_manager/ipk/sdk.py | 6 ++++++
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index 79cb36c..d31dba0 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -4,6 +4,7 @@ IMAGE_PKGTYPE ?= "ipk"
 
 IPKGCONF_TARGET = "${WORKDIR}/opkg.conf"
 IPKGCONF_SDK =  "${WORKDIR}/opkg-sdk.conf"
+IPKGCONF_SDK_TARGET = "${WORKDIR}/opkg-sdk-target.conf"
 
 PKGWRITEDIRIPK = "${WORKDIR}/deploy-ipks"
 
diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index f1e0219..245c256 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -14,8 +14,8 @@ do_rootfs[recrdeptask] += "do_package_write_ipk do_package_qa"
 do_rootfs[vardeps] += "PACKAGE_FEED_URIS PACKAGE_FEED_BASE_PATHS PACKAGE_FEED_ARCHS"
 
 do_rootfs[lockfiles] += "${WORKDIR}/ipk.lock"
-do_populate_sdk[lockfiles] += "${WORKDIR}/ipk.lock"
-do_populate_sdk_ext[lockfiles] += "${WORKDIR}/ipk.lock"
+do_populate_sdk[lockfiles] += "${WORKDIR}/sdk-ipk.lock"
+do_populate_sdk_ext[lockfiles] += "${WORKDIR}/sdk-ipk.lock"
 
 OPKG_PREPROCESS_COMMANDS = ""
 
diff --git a/meta/lib/oe/package_manager/ipk/sdk.py b/meta/lib/oe/package_manager/ipk/sdk.py
index 37af034..e2ca415 100644
--- a/meta/lib/oe/package_manager/ipk/sdk.py
+++ b/meta/lib/oe/package_manager/ipk/sdk.py
@@ -14,6 +14,12 @@ class PkgSdk(Sdk):
     def __init__(self, d, manifest_dir=None):
         super(PkgSdk, self).__init__(d, manifest_dir)
 
+        # In sdk_list_installed_packages the call to opkg is hardcoded to
+        # always use IPKGCONF_TARGET and there's no exposed API to change this
+        # so simply override IPKGCONF_TARGET to use this separated config file.
+        ipkgconf_sdk_target = d.getVar("IPKGCONF_SDK_TARGET")
+        d.setVar("IPKGCONF_TARGET", ipkgconf_sdk_target)
+
         self.target_conf = self.d.getVar("IPKGCONF_TARGET")
         self.host_conf = self.d.getVar("IPKGCONF_SDK")
 
-- 
2.7.4

