Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Stw3g-0004Xn-8e
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jul 2012 09:31:00 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 25 Jul 2012 00:19:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="172897576"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.97])
	by azsmga001.ch.intel.com with ESMTP; 25 Jul 2012 00:19:28 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jul 2012 00:19:08 -0700
Message-Id: <f6f60b6a4cdd2b1206007205147bca95b8466ac8.1343200454.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1343200454.git.sgw@linux.intel.com>
References: <cover.1343200454.git.sgw@linux.intel.com>
In-Reply-To: <cover.1343200454.git.sgw@linux.intel.com>
References: <cover.1343200454.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 14/28] cups_1.4.6.bb: Fix build on ppc64
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Jul 2012 07:31:00 -0000

From: Khem Raj <raj.khem@gmail.com>

ppc64 uses lib64 and usr/lib64 for library paths
so we need to train cups build system

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../cups/cups-1.4.6/cups_serverbin.patch           |   32 ++++++++++++++++++++
 meta/recipes-extended/cups/cups14.inc              |   26 ++++++++--------
 meta/recipes-extended/cups/cups_1.4.6.bb           |    7 ++--
 3 files changed, 49 insertions(+), 16 deletions(-)
 create mode 100644 meta/recipes-extended/cups/cups-1.4.6/cups_serverbin.patch

diff --git a/meta/recipes-extended/cups/cups-1.4.6/cups_serverbin.patch b/meta/recipes-extended/cups/cups-1.4.6/cups_serverbin.patch
new file mode 100644
index 0000000..f7b44a7
--- /dev/null
+++ b/meta/recipes-extended/cups/cups-1.4.6/cups_serverbin.patch
@@ -0,0 +1,32 @@
+Make CUPS_SERVERBIN relative to libdir otherwise on 64bit arches
+e.g. ppc64 where base libdir is lib64 this does not go well
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Inappropriate [OE config specific]
+
+Index: cups-1.4.6/config-scripts/cups-directories.m4
+===================================================================
+--- cups-1.4.6.orig/config-scripts/cups-directories.m4	2009-04-12 16:04:51.000000000 -0700
++++ cups-1.4.6/config-scripts/cups-directories.m4	2012-07-21 12:12:05.896405923 -0700
+@@ -397,7 +397,7 @@
+ 	*)
+ 		# All others
+ 		INSTALL_SYSV="install-sysv"
+-		CUPS_SERVERBIN="$exec_prefix/lib/cups"
++		CUPS_SERVERBIN="$libdir/cups"
+ 		;;
+ esac
+ 
+Index: cups-1.4.6/configure
+===================================================================
+--- cups-1.4.6.orig/configure	2012-07-21 12:13:34.512405950 -0700
++++ cups-1.4.6/configure	2012-07-21 12:14:05.724406017 -0700
+@@ -11181,7 +11181,7 @@
+ 	*)
+ 		# All others
+ 		INSTALL_SYSV="install-sysv"
+-		CUPS_SERVERBIN="$exec_prefix/lib/cups"
++		CUPS_SERVERBIN="$libdir/cups"
+ 		;;
+ esac
+ 
diff --git a/meta/recipes-extended/cups/cups14.inc b/meta/recipes-extended/cups/cups14.inc
index 4f2b0a1..0517007 100644
--- a/meta/recipes-extended/cups/cups14.inc
+++ b/meta/recipes-extended/cups/cups14.inc
@@ -27,7 +27,7 @@ EXTRA_OECONF = " \
 do_configure() {
 	gnu-configize
 	libtoolize --force
-	DSOFLAGS="${LDFLAGS}" oe_runconf
+	DSOFLAGS="${LDFLAGS}" SERVERBIN="${libdir}/cups" oe_runconf
 }
 
 do_compile () {
@@ -66,24 +66,24 @@ python do_package_append() {
 
 PACKAGES =+ "${PN}-lib ${PN}-libimage"
 
-FILES_${PN} += "${exec_prefix}/lib/cups/backend \
-		${exec_prefix}/lib/cups/cgi-bin \
-		${exec_prefix}/lib/cups/filter \
-		${exec_prefix}/lib/cups/monitor \
-		${exec_prefix}/lib/cups/notifier \
-		${exec_prefix}/lib/cups/daemon \
+FILES_${PN} += "${libdir}/cups/backend \
+		${libdir}/cups/cgi-bin \
+		${libdir}/cups/filter \
+		${libdir}/cups/monitor \
+		${libdir}/cups/notifier \
+		${libdir}/cups/daemon \
 	       "
 
 FILES_${PN}-lib = "${libdir}/libcups.so.*"
 
 FILES_${PN}-libimage = "${libdir}/libcupsimage.so.*"
 
-FILES_${PN}-dbg += "${exec_prefix}/lib/cups/backend/.debug \
-                    ${exec_prefix}/lib/cups/cgi-bin/.debug \
-                    ${exec_prefix}/lib/cups/filter/.debug \
-                    ${exec_prefix}/lib/cups/monitor/.debug \
-                    ${exec_prefix}/lib/cups/notifier/.debug \
-                    ${exec_prefix}/lib/cups/daemon/.debug \
+FILES_${PN}-dbg += "${libdir}/cups/backend/.debug \
+                    ${libdir}/cups/cgi-bin/.debug \
+                    ${libdir}/cups/filter/.debug \
+                    ${libdir}/cups/monitor/.debug \
+                    ${libdir}/cups/notifier/.debug \
+                    ${libdir}/cups/daemon/.debug \
                    "
 
 #package the html for the webgui inside the main packages (~1MB uncompressed)
diff --git a/meta/recipes-extended/cups/cups_1.4.6.bb b/meta/recipes-extended/cups/cups_1.4.6.bb
index 9825138..8485180 100644
--- a/meta/recipes-extended/cups/cups_1.4.6.bb
+++ b/meta/recipes-extended/cups/cups_1.4.6.bb
@@ -1,13 +1,14 @@
 require cups14.inc
 
-PR = "r4"
+PR = "r5"
 DEPENDS += "libusb \
        ${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=956e7600195e6139f12de8c2a5bbefa9"
 SRC_URI += " \
-	file://use_echo_only_in_init.patch \
-    file://0001-don-t-try-to-run-generated-binaries.patch \
+            file://use_echo_only_in_init.patch \
+            file://0001-don-t-try-to-run-generated-binaries.patch \
+            file://cups_serverbin.patch \
 	"
 
 SRC_URI[md5sum] = "de8fb5a29c36554925c0c6a6e2c0dae1"
-- 
1.7.7.6



