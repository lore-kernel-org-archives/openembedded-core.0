Return-Path: <Ming.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A36C17023D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jun 2014 10:28:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s5KAS42o025699
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jun 2014 03:28:04 -0700 (PDT)
Received: from PEK-MLIU3-D1.corp.ad.wrs.com (128.224.163.186) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.169.1; Fri, 20 Jun 2014 03:28:03 -0700
From: Ming Liu <ming.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 20 Jun 2014 18:28:00 +0800
Message-ID: <1403260081-669-1-git-send-email-ming.liu@windriver.com>
X-Mailer: git-send-email 1.8.4.1
MIME-Version: 1.0
Subject: [PATCH 1/2] mesa.inc: add MLPREFIX in RPROVIDES/RREPLACES/RCONFLICTS processing
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
X-List-Received-Date: Fri, 20 Jun 2014 10:28:10 -0000
Content-Type: text/plain

It also avoids following QA warnings:
......
WARNING: Multilib QA Issue: lib32-mesa package lib32-mesa-megadriver -
suspicious values 'mesa-driver-nouveau-vieux mesa-driver-r200
mesa-driver-i965 mesa-driver-radeon mesa-driver-swrast mesa-driver-i915'
in RPROVIDES
WARNING: Multilib QA Issue: lib32-mesa package lib32-mesa-megadriver -
suspicious values 'mesa-driver-nouveau-vieux mesa-driver-r200
mesa-driver-i965 mesa-driver-radeon mesa-driver-swrast mesa-driver-i915'
in RREPLACES
WARNING: Multilib QA Issue: lib32-mesa package lib32-mesa-megadriver -
suspicious values 'mesa-driver-nouveau-vieux mesa-driver-r200
mesa-driver-i965 mesa-driver-radeon mesa-driver-swrast mesa-driver-i915'
in RCONFLICTS

Signed-off-by: Ming Liu <ming.liu@windriver.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 453510a..ad3b741 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -105,6 +105,7 @@ do_install_append () {
 # they don't get Debian-renamed (which would remove the -mesa suffix), and
 # RPROVIDEs/RCONFLICTs on the generic libgl name.
 python __anonymous() {
+    ml = d.getVar('MLPREFIX', True)
     pkgconfig = (d.getVar('PACKAGECONFIG', True) or "").split()
     for p in (("egl", "libegl", "libegl1"),
               ("dri", "libgl", "libgl1"),
@@ -113,8 +114,8 @@ python __anonymous() {
               ("gles", "libgles3",)):
         if not p[0] in pkgconfig:
             continue
-        fullp = p[1] + "-mesa"
-        pkgs = " ".join(p[1:])
+        fullp = ml + p[1] + "-mesa"
+        pkgs = ml + (" " + ml).join(p[1:])
         d.setVar("DEBIAN_NOAUTONAME_" + fullp, "1")
         d.appendVar("RREPLACES_" + fullp, pkgs)
         d.appendVar("RPROVIDES_" + fullp, pkgs)
@@ -122,15 +123,16 @@ python __anonymous() {
         
         # For -dev, the first element is both the Debian and original name
         fullp += "-dev"
-        pkgs = p[1] + "-dev"
+        pkgs = ml + p[1] + "-dev"
         d.setVar("DEBIAN_NOAUTONAME_" + fullp, "1")
         d.appendVar("RREPLACES_" + fullp, pkgs)
         d.appendVar("RPROVIDES_" + fullp, pkgs)
         d.appendVar("RCONFLICTS_" + fullp, pkgs)
 }
 
-python mesa_populate_packages() {
-    pkgs = ['mesa', 'mesa-dev', 'mesa-dbg']
+python mesa_populate_packages() { 
+    ml = d.getVar('MLPREFIX', True)
+    pkgs = [ml + 'mesa', ml + 'mesa-dev', ml + 'mesa-dbg']
     for pkg in pkgs:
         d.setVar("RPROVIDES_%s" % pkg, pkg.replace("mesa-", "mesa-dri-"))
         d.setVar("RCONFLICTS_%s" % pkg, pkg.replace("mesa-", "mesa-dri-"))
@@ -139,11 +141,11 @@ python mesa_populate_packages() {
     import re
     dri_drivers_root = os.path.join(d.getVar('libdir', True), "dri")
     dri_pkgs = os.listdir(d.getVar('PKGD', True) + dri_drivers_root)
-    lib_name = d.expand("${MLPREFIX}mesa-megadriver")
+    lib_name = ml + 'mesa-megadriver'
     for p in dri_pkgs:
         m = re.match('^(.*)_dri\.so$', p)
         if m:
-            pkg_name = " mesa-driver-%s" % legitimize_package_name(m.group(1))
+            pkg_name = " %smesa-driver-%s" % (ml, legitimize_package_name(m.group(1)))
             d.appendVar("RPROVIDES_%s" % lib_name, pkg_name)
             d.appendVar("RCONFLICTS_%s" % lib_name, pkg_name)
             d.appendVar("RREPLACES_%s" % lib_name, pkg_name)
-- 
1.8.4.1


