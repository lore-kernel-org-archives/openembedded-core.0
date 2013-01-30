Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1U0gyF-0008MH-Gq
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Jan 2013 00:21:35 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 30 Jan 2013 15:05:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,572,1355126400"; d="scan'208";a="278792259"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.123])
	by orsmga002.jf.intel.com with ESMTP; 30 Jan 2013 15:05:50 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	dvhart@linux.intel.com
Date: Wed, 30 Jan 2013 15:05:49 -0800
Message-Id: <1359587149-27928-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [PATCH] module.bbclass: Allow for modules to be packaged seperate from ${PN}
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Jan 2013 23:21:35 -0000

This patch will allow recipes that provide kernel modules to package
the module or modules in specific packages. That list is contained in
MODULE_PACKAGES, this defaults to  to preserve the current behavior.
The package can also define MODULE_FILES to specify files.

[YOCTO #3803]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/module.bbclass | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
index c933d32..e2174a1 100644
--- a/meta/classes/module.bbclass
+++ b/meta/classes/module.bbclass
@@ -1,4 +1,3 @@
-RDEPENDS_${PN} += "kernel-image"
 DEPENDS += "virtual/kernel"
 
 inherit module-base
@@ -25,7 +24,7 @@ module_do_install() {
 	           modules_install
 }
 
-pkg_postinst_${PN}_append () {
+module_pkg_postinst () {
 if [ -z "$D" ]; then
 	depmod -a ${KERNEL_VERSION}
 else
@@ -33,7 +32,7 @@ else
 fi
 }
 
-pkg_postrm_${PN}_append () {
+module_pkg_postrm () {
 if [ -z "$D" ]; then
 	depmod -a ${KERNEL_VERSION}
 else
@@ -43,4 +42,16 @@ fi
 
 EXPORT_FUNCTIONS do_compile do_install
 
-FILES_${PN} = "/etc /lib/modules"
+MODULE_PACKAGES ?= "${PN}"
+
+python __anonymous() {
+    for package in d.getVar("MODULE_PACKAGES", True).split():
+        d.appendVar("RDEPENDS_%s" % package, " kernel-image")
+        files = d.getVar("MODULE_FILES_%s" % package, True) or "/etc /lib/modules"
+        d.appendVar("FILES_%s" % package, " " + files)
+        d.appendVar('pkg_postinst_%s' %  package, " " + d.getVar('module_pkg_postinst', True))
+        d.appendVar('pkg_postrm_%s' %  package, " " + d.getVar('module_pkg_postrm', True))
+        if not package in d.getVar("PACKAGES", True):
+            d.prependVar("PACKAGES", package + " ")
+}
+         	
-- 
1.8.0.2



