Received: from esa6.hc324-48.eu.iphmx.com (esa6.hc324-48.eu.iphmx.com [207.54.71.69])
 by mx.groups.io with SMTP id smtpd.web09.5433.1612515139472499056
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Feb 2021 00:52:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1 header.b=lkHFyzpG;
 spf=pass (domain: bmw.de, ip: 207.54.71.69, mailfrom: prvs=6636a3d1c=michael.ho@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1612515139; x=1644051139;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=wRIna/UkuwG00i4aFZ5nLpdFMEx/5mNHx9sSgoiGQ5E=;
  b=lkHFyzpGVajvJhQgDtfZFnDuqJCthHLjhdyvjvQTxC/hP36/fKEdnvnT
   pHB8dYZVSqVW2K6lEIIttGMDNmaRXpUPZpQXEyDnEHuQh6zOHy/0lPMfp
   4dZdfq2rE36QWXpEt6m4zpFD/1ePrjNo21Vl04JyKwLhQrj1MorOhME2p
   U=;
Received: from esagw5.bmwgroup.com (HELO esagw5.muc) ([160.46.252.46]) by
 esa6.hc324-48.eu.iphmx.com with ESMTP/TLS; 05 Feb 2021 09:52:17 +0100
Received: from esabb2.muc ([160.50.100.34])  by esagw5.muc with ESMTP/TLS;
 05 Feb 2021 09:52:17 +0100
Received: from smucm09k.bmwgroup.net (HELO smucm09k.europe.bmw.corp) ([160.48.96.43])
 by esabb2.muc with ESMTP/TLS; 05 Feb 2021 09:52:17 +0100
Received: from michael-pcx.bmw-carit.intra (192.168.221.44) by
 smucm09k.europe.bmw.corp (160.48.96.43) with Microsoft SMTP Server (TLS;
 Fri, 5 Feb 2021 09:52:17 +0100
From: "Michael Ho" <Michael.Ho@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Michael Ho <Michael.Ho@bmw.de>
Subject: [PATCH] rootfs.py: expose prepared_index and ipk_repo_workdir for OpkgPM
Date: Fri, 5 Feb 2021 09:51:46 +0100
Message-ID: <1612515106-377011-2-git-send-email-michael.ho@bmw.de>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612515106-377011-1-git-send-email-michael.ho@bmw.de>
References: <1612515106-377011-1-git-send-email-michael.ho@bmw.de>
MIME-Version: 1.0
Return-Path: michael.ho@bmw.de
X-ClientProxiedBy: smucm07k.europe.bmw.corp (160.48.96.35) To
 smucm09k.europe.bmw.corp (160.48.96.43)
Content-Type: text/plain

From: Michael Ho <Michael.Ho@bmw.de>

The OpkgPM class has several constructor options that allows for skipping
the ipk repository set up and controlling the ipk repository directory. This
commit exposes these option via the OpkgRootfs class so others can make use
of them if they wish to.

Adds the bitbake variables "IPKGREPO_TARGET_PREPARED" and "IPKGREPO_TARGET"
to act as the interfaces.

Signed-off-by: Michael Ho <Michael.Ho@bmw.de>
---
 meta/lib/oe/package_manager/ipk/rootfs.py | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/package_manager/ipk/rootfs.py b/meta/lib/oe/package_manager/ipk/rootfs.py
index 26dbee6..6313b72 100644
--- a/meta/lib/oe/package_manager/ipk/rootfs.py
+++ b/meta/lib/oe/package_manager/ipk/rootfs.py
@@ -129,6 +129,14 @@ class PkgRootfs(DpkgOpkgRootfs):
         self.manifest = PkgManifest(d, manifest_dir)
         self.opkg_conf = self.d.getVar("IPKGCONF_TARGET")
         self.pkg_archs = self.d.getVar("ALL_MULTILIB_PACKAGE_ARCHS")
+        self.opkg_repo = self.d.getVar("IPKGREPO_TARGET")
+        self.opkg_repo_prepared = self.d.getVar("IPKGREPO_TARGET_PREPARED")
+
+        kwargs = {}
+        if self.opkg_repo:
+            kwargs["ipk_repo_workdir"] = self.opkg_repo
+        if self.opkg_repo_prepared:
+            kwargs["prepare_index"] = False
 
         self.inc_opkg_image_gen = self.d.getVar('INC_IPK_IMAGE_GEN') or ""
         if self._remove_old_rootfs():
@@ -136,12 +144,14 @@ class PkgRootfs(DpkgOpkgRootfs):
             self.pm = OpkgPM(d,
                              self.image_rootfs,
                              self.opkg_conf,
-                             self.pkg_archs)
+                             self.pkg_archs,
+                             **kwargs)
         else:
             self.pm = OpkgPM(d,
                              self.image_rootfs,
                              self.opkg_conf,
-                             self.pkg_archs)
+                             self.pkg_archs,
+                             **kwargs)
             self.pm.recover_packaging_data()
 
         bb.utils.remove(self.d.getVar('MULTILIB_TEMP_ROOTFS'), True)
-- 
2.7.4

