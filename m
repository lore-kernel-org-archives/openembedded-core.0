Return-Path: <Jian.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id ABC3B736B6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 08:07:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tAB87B2o017863
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 00:07:11 -0800 (PST)
Received: from localhost.localdomain (128.224.153.43) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 11 Nov 2015 00:07:10 -0800
From: Jian Liu <jian.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Nov 2015 16:07:07 +0800
Message-ID: <1447229227-9024-1-git-send-email-jian.liu@windriver.com>
X-Mailer: git-send-email 1.7.0.5
MIME-Version: 1.0
Subject: [PATCH] sdk.py: fix conflicts of packages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Nov 2015 08:07:14 -0000
Content-Type: text/plain

If packages are conveyed to smart to install at the same time,
conflicts will not happen.
Try to install packages into sdk image at the same time

Signed-off-by: Jian Liu <jian.liu@windriver.com>
---
 sdk.py |  108 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 96 insertions(+), 12 deletions(-)

diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index c57a441..f62d948 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -107,10 +107,38 @@ class RpmSdk(Sdk):
         pm.dump_all_available_pkgs()
         pm.update()
 
-        for pkg_type in self.install_order:
-            if pkg_type in pkgs_to_install:
-                pm.install(pkgs_to_install[pkg_type],
-                           [False, True][pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY])
+        except_pkgs = self.d.getVar('SDKIMAGE_INSTALL_COMPLEMENTARY', True).replace("*","").split()
+
+        # Here is only a workaround. 
+        # The packages are separated into 3 parts --- 
+        # -- attempt only (in pkgs_to_install)
+        # -- must install (in pkgs_to_install)
+        # -- comlementary (add -dev and -dbg after the packages in pkgs_to_install)
+        # If pkgs_to_install contains libxml2-dev and lib32-libxml2, the result will be
+        # libxml2-dev is installed but lib32-libxml2-dev will not be.
+        # Reason is that smart can not handle conflicts unless lib32-libxml2-dev and libxml2-dev
+        # is installed at the same time. That is "pm.install('lib32-libxml2-dev libxml2-dev').
+        # But the situation is "pm.install('lib32-libxml2-dev'); pm.install('libxml2-dev')"
+        # Here try to put lib32-libxml2-dev and libxml2-dev in comlementary packages, so that 
+        # they can be installed at the same time
+        pkgs = []
+        pkgs_attempt = []
+        for pkg_type in pkgs_to_install:
+            for pkg in pkgs_to_install[pkg_type]:
+                for except_pkg in except_pkgs:
+                    if "packagegroup" not in pkg and pkg.endswith(except_pkg):
+                        pkg = pkg[:-len(except_pkg)]
+
+                if pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY:
+                    if pkg not in pkgs_attempt:
+                        pkgs_attempt.append(pkg)
+                else:
+                    if pkg not in pkgs_attempt:
+                        pkgs.append(pkg)
+
+        pm.install(pkgs)
+
+        pm.install(pkgs_attempt, True)
 
     def _populate(self):
         bb.note("Installing TARGET packages")
@@ -184,10 +212,38 @@ class OpkgSdk(Sdk):
 
         pm.update()
 
-        for pkg_type in self.install_order:
-            if pkg_type in pkgs_to_install:
-                pm.install(pkgs_to_install[pkg_type],
-                           [False, True][pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY])
+        except_pkgs = self.d.getVar('SDKIMAGE_INSTALL_COMPLEMENTARY', True).replace("*","").split()
+
+        # Here is only a workaround. 
+        # The packages are separated into 3 parts --- 
+        # -- attempt only (in pkgs_to_install)
+        # -- must install (in pkgs_to_install)
+        # -- comlementary (add -dev and -dbg after the packages in pkgs_to_install)
+        # If pkgs_to_install contains libxml2-dev and lib32-libxml2, the result will be
+        # libxml2-dev is installed but lib32-libxml2-dev will not be.
+        # Reason is that smart can not handle conflicts unless lib32-libxml2-dev and libxml2-dev
+        # is installed at the same time. That is "pm.install('lib32-libxml2-dev libxml2-dev').
+        # But the situation is "pm.install('lib32-libxml2-dev'); pm.install('libxml2-dev')"
+        # Here try to put lib32-libxml2-dev and libxml2-dev in comlementary packages, so that 
+        # they can be installed at the same time
+        pkgs = []
+        pkgs_attempt = []
+        for pkg_type in pkgs_to_install:
+            for pkg in pkgs_to_install[pkg_type]:
+                for except_pkg in except_pkgs:
+                    if "packagegroup" not in pkg and pkg.endswith(except_pkg):
+                        pkg = pkg[:-len(except_pkg)]
+
+                if pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY:
+                    if pkg not in pkgs_attempt:
+                        pkgs_attempt.append(pkg)
+                else:
+                    if pkg not in pkgs_attempt:
+                        pkgs.append(pkg)
+
+        pm.install(pkgs)
+
+        pm.install(pkgs_attempt, True)
 
     def _populate(self):
         bb.note("Installing TARGET packages")
@@ -260,10 +316,38 @@ class DpkgSdk(Sdk):
         pm.write_index()
         pm.update()
 
-        for pkg_type in self.install_order:
-            if pkg_type in pkgs_to_install:
-                pm.install(pkgs_to_install[pkg_type],
-                           [False, True][pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY])
+        except_pkgs = self.d.getVar('SDKIMAGE_INSTALL_COMPLEMENTARY', True).replace("*","").split()
+
+        # Here is only a workaround. 
+        # The packages are separated into 3 parts --- 
+        # -- attempt only (in pkgs_to_install)
+        # -- must install (in pkgs_to_install)
+        # -- comlementary (add -dev and -dbg after the packages in pkgs_to_install)
+        # If pkgs_to_install contains libxml2-dev and lib32-libxml2, the result will be
+        # libxml2-dev is installed but lib32-libxml2-dev will not be.
+        # Reason is that smart can not handle conflicts unless lib32-libxml2-dev and libxml2-dev
+        # is installed at the same time. That is "pm.install('lib32-libxml2-dev libxml2-dev').
+        # But the situation is "pm.install('lib32-libxml2-dev'); pm.install('libxml2-dev')"
+        # Here try to put lib32-libxml2-dev and libxml2-dev in comlementary packages, so that 
+        # they can be installed at the same time
+        pkgs = []
+        pkgs_attempt = []
+        for pkg_type in pkgs_to_install:
+            for pkg in pkgs_to_install[pkg_type]:
+                for except_pkg in except_pkgs:
+                    if "packagegroup" not in pkg and pkg.endswith(except_pkg):
+                        pkg = pkg[:-len(except_pkg)]
+
+                if pkg_type == Manifest.PKG_TYPE_ATTEMPT_ONLY:
+                    if pkg not in pkgs_attempt:
+                        pkgs_attempt.append(pkg)
+                else:
+                    if pkg not in pkgs_attempt:
+                        pkgs.append(pkg)
+
+        pm.install(pkgs)
+
+        pm.install(pkgs_attempt, True)
 
     def _populate(self):
         bb.note("Installing TARGET packages")

