Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QDAlu-0001pg-5z
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Apr 2011 09:29:03 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 22 Apr 2011 00:24:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,253,1301900400"; d="scan'208";a="913034158"
Received: from unknown (HELO localhost) ([10.255.12.237])
	by fmsmga001.fm.intel.com with ESMTP; 22 Apr 2011 00:24:38 -0700
Message-Id: <6b829b06310fa5439b9cbfc3274a44e5465db7ae.1303453279.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303453279.git.sgw@linux.intel.com>
References: <cover.1303453279.git.sgw@linux.intel.com>
Old-Date: Mon, 18 Apr 2011 08:23:27 -0600
Date: Fri, 22 Apr 2011  0:24:38 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Fri, 22 Apr 2011 09:33:35 +0200
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 09/33] Control over when package init scripts are run
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
X-List-Received-Date: Fri, 22 Apr 2011 07:29:03 -0000

From: Gary Thomas <gary@mlbassoc.com>

When a package is built, some installation scripts must be
performed on the target.  In the case of a complete image,
these scripts are run by a separate step at init time, but
only during the first boot (other package install scripts
can just be run when the package is installed on the target).

This patch lets the distribution (or user) decide when these
postponed install scripts should run.  The default is normally
near the end of init, but there may be times when it's beneficial
to run them earlier so the "when" can be overridden.

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/rootfs_rpm.bbclass          |   11 ++++++++---
 meta/recipes-devtools/opkg/opkg.inc      |    4 ++++
 meta/recipes-devtools/opkg/opkg_0.1.8.bb |   13 ++++---------
 meta/recipes-devtools/opkg/opkg_svn.bb   |   13 ++++---------
 4 files changed, 20 insertions(+), 21 deletions(-)

diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index aa1b339..3a11858 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -26,6 +26,11 @@ RPM_POSTPROCESS_COMMANDS = ""
 #
 #IMAGE_LOCALES="en-gb"
 
+# 
+# Allow distributions to alter when [postponed] package install scripts are run
+#
+POSTINSTALL_INITPOSITION ?= "98"
+
 rpmlibdir = "/var/lib/rpm"
 opkglibdir = "${localstatedir}/lib/opkg"
 
@@ -116,7 +121,7 @@ EOF
 	install -d ${IMAGE_ROOTFS}/${sysconfdir}/rcS.d
 	# Stop $i getting expanded below...
 	i=\$i
-	cat > ${IMAGE_ROOTFS}${sysconfdir}/rcS.d/S98configure << EOF
+	cat > ${IMAGE_ROOTFS}${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}configure << EOF
 #!/bin/sh
 for i in /etc/rpm-postinsts/*.sh; do
 	echo "Running postinst $i..."
@@ -127,9 +132,9 @@ for i in /etc/rpm-postinsts/*.sh; do
 		echo "ERROR: postinst $i failed."
 	fi
 done
-rm -f ${sysconfdir}/rcS.d/S98configure
+rm -f ${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}configure
 EOF
-	chmod 0755 ${IMAGE_ROOTFS}${sysconfdir}/rcS.d/S98configure
+	chmod 0755 ${IMAGE_ROOTFS}${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}configure
 
 	install -d ${IMAGE_ROOTFS}/${sysconfdir}
 	echo ${BUILDNAME} > ${IMAGE_ROOTFS}/${sysconfdir}/version
diff --git a/meta/recipes-devtools/opkg/opkg.inc b/meta/recipes-devtools/opkg/opkg.inc
index c317491..50f1afc 100644
--- a/meta/recipes-devtools/opkg/opkg.inc
+++ b/meta/recipes-devtools/opkg/opkg.inc
@@ -34,3 +34,7 @@ BBCLASSEXTEND = "native nativesdk"
 
 PKGSUFFIX = ""
 PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
+
+# Define a variable to allow distros to run configure earlier.
+# (for example, to enable loading of ethernet kernel modules before networking starts)
+POSTINSTALL_INITPOSITION ?= "98"
diff --git a/meta/recipes-devtools/opkg/opkg_0.1.8.bb b/meta/recipes-devtools/opkg/opkg_0.1.8.bb
index 6815474..18cf042 100644
--- a/meta/recipes-devtools/opkg/opkg_0.1.8.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.1.8.bb
@@ -13,7 +13,7 @@ SRC_URI = "http://opkg.googlecode.com/files/opkg-${PV}.tar.gz \
            file://headerfix.patch \
 "
 
-PR = "r3"
+PR = "r4"
 
 PACKAGES =+ "libopkg${PKGSUFFIX}-dev libopkg${PKGSUFFIX} update-alternatives-cworth${PKGSUFFIX}"
 
@@ -26,11 +26,6 @@ do_install_append() {
 	install -d ${D}${localstatedir}/lib/opkg
 }
 
-# Define a variable to allow distros to run configure earlier.
-# (for example, to enable loading of ethernet kernel modules before networking starts)
-OPKG_INIT_POSITION = "98"
-OPKG_INIT_POSITION_slugos = "41"
-
 pkg_postinst_${PN} () {
 #!/bin/sh
 if [ "x$D" != "x" ]; then
@@ -38,9 +33,9 @@ if [ "x$D" != "x" ]; then
 	# this happens at S98 where our good 'ole packages script used to run
 	echo "#!/bin/sh
 opkg-cl configure
-rm -f /${sysconfdir}/rcS.d/S${OPKG_INIT_POSITION}configure
-" > $D${sysconfdir}/rcS.d/S${OPKG_INIT_POSITION}configure
-	chmod 0755 $D${sysconfdir}/rcS.d/S${OPKG_INIT_POSITION}configure
+rm -f /${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}configure
+" > $D${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}configure
+	chmod 0755 $D${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}configure
 fi
 
 update-alternatives --install ${bindir}/opkg opkg ${bindir}/opkg-cl 100
diff --git a/meta/recipes-devtools/opkg/opkg_svn.bb b/meta/recipes-devtools/opkg/opkg_svn.bb
index 76ec838..d8af823 100644
--- a/meta/recipes-devtools/opkg/opkg_svn.bb
+++ b/meta/recipes-devtools/opkg/opkg_svn.bb
@@ -16,7 +16,7 @@ SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;proto=http \
 S = "${WORKDIR}/trunk"
 
 PV = "0.1.8+svnr${SRCPV}"
-PR = "r1"
+PR = "r2"
 
 PACKAGES =+ "libopkg${PKGSUFFIX}-dev libopkg${PKGSUFFIX} update-alternatives-cworth${PKGSUFFIX}"
 
@@ -29,11 +29,6 @@ do_install_append() {
 	install -d ${D}${localstatedir}/lib/opkg
 }
 
-# Define a variable to allow distros to run configure earlier.
-# (for example, to enable loading of ethernet kernel modules before networking starts)
-OPKG_INIT_POSITION = "98"
-OPKG_INIT_POSITION_slugos = "41"
-
 pkg_postinst_${PN} () {
 #!/bin/sh
 if [ "x$D" != "x" ]; then
@@ -41,9 +36,9 @@ if [ "x$D" != "x" ]; then
 	# this happens at S98 where our good 'ole packages script used to run
 	echo "#!/bin/sh
 opkg-cl configure
-rm -f /${sysconfdir}/rcS.d/S${OPKG_INIT_POSITION}configure
-" > $D${sysconfdir}/rcS.d/S${OPKG_INIT_POSITION}configure
-	chmod 0755 $D${sysconfdir}/rcS.d/S${OPKG_INIT_POSITION}configure
+rm -f /${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}configure
+" > $D${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}configure
+	chmod 0755 $D${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}configure
 fi
 
 update-alternatives --install ${bindir}/opkg opkg ${bindir}/opkg-cl 100
-- 
1.7.1



