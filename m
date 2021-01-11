Received: from esa5.hc324-48.eu.iphmx.com (esa5.hc324-48.eu.iphmx.com [207.54.71.60])
 by mx.groups.io with SMTP id smtpd.web10.33316.1610369184997225537
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jan 2021 04:46:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=VwPLA6cT;
 spf=pass (domain: bmw.de, ip: 207.54.71.60, mailfrom: prvs=638ffc773=michael.ho@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1610369185; x=1641905185;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=7SioFzv5bxviF9HR+oBXK9LNJK/f1vGscdCv6Fahezs=;
  b=VwPLA6cTqN2MM5SYEUyN7FZsCyJsbb0vuCvZpo+nSdcZ+vsLFv8qH+w5
   qIWJsq6oG4rP1t5SLrMfdUfqK+bL2XSroX9V1cu37CqSlnvmbTWpF/aJi
   RSn7l0uSDgWvG1SDw9v9ukX48XlRuM0zfeFPX3xgTjd8cgK641QFeKsGn
   0=;
Received: from esagw5.bmwgroup.com (HELO esagw5.muc) ([160.46.252.46]) by
 esa5.hc324-48.eu.iphmx.com with ESMTP/TLS; 11 Jan 2021 13:46:20 +0100
Received: from esabb5.muc ([160.50.100.47])  by esagw5.muc with ESMTP/TLS;
 11 Jan 2021 13:46:20 +0100
Received: from smucm09k.bmwgroup.net (HELO smucm09k.europe.bmw.corp) ([160.48.96.43])
 by esabb5.muc with ESMTP/TLS; 11 Jan 2021 13:46:20 +0100
Received: from michael-pcx.bmw-carit.intra (192.168.221.33) by
 smucm09k.europe.bmw.corp (160.48.96.43) with Microsoft SMTP Server (TLS;
 Mon, 11 Jan 2021 13:46:20 +0100
From: "Michael Ho" <Michael.Ho@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Michael Ho <Michael.Ho@bmw.de>
Subject: [dunfell][PATCH] rootfs_ipk: allow do_populate_sdk in parallel to do_rootfs
Date: Mon, 11 Jan 2021 13:46:06 +0100
Message-ID: <1610369166-221356-1-git-send-email-michael.ho@bmw.de>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Return-Path: michael.ho@bmw.de
X-ClientProxiedBy: SMUCM28L.europe.bmw.corp (160.46.167.38) To
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
 meta/classes/package_ipk.bbclass | 1 +
 meta/classes/rootfs_ipk.bbclass  | 4 ++--
 meta/lib/oe/sdk.py               | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index c008559..54da32e 100644
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
 
diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index d02a274..3d6141b 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -219,7 +219,7 @@ class OpkgSdk(Sdk):
     def __init__(self, d, manifest_dir=None):
         super(OpkgSdk, self).__init__(d, manifest_dir)
 
-        self.target_conf = self.d.getVar("IPKGCONF_TARGET")
+        self.target_conf = self.d.getVar("IPKGCONF_SDK_TARGET")
         self.host_conf = self.d.getVar("IPKGCONF_SDK")
 
         self.target_manifest = OpkgManifest(d, self.manifest_dir,
@@ -400,7 +400,7 @@ def sdk_list_installed_packages(d, target, rootfs_dir=None):
         os_var = ["SDK_OS", None][target is True]
         return RpmPkgsList(d, rootfs_dir).list_pkgs()
     elif img_type == "ipk":
-        conf_file_var = ["IPKGCONF_SDK", "IPKGCONF_TARGET"][target is True]
+        conf_file_var = ["IPKGCONF_SDK", "IPKGCONF_SDK_TARGET"][target is True]
         return OpkgPkgsList(d, rootfs_dir, d.getVar(conf_file_var)).list_pkgs()
     elif img_type == "deb":
         return DpkgPkgsList(d, rootfs_dir).list_pkgs()
-- 
2.7.4

