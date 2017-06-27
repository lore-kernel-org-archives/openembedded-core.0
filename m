Return-Path: <sgw@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id B275077E09
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 23:35:45 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga105.jf.intel.com with ESMTP; 27 Jun 2017 16:35:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,272,1496127600"; d="scan'208";a="1187707092"
Received: from swold-mobl2.amr.corp.intel.com ([10.254.71.172])
	by fmsmga002.fm.intel.com with ESMTP; 27 Jun 2017 16:35:43 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Tue, 27 Jun 2017 16:35:42 -0700
Message-Id: <1498606542-15110-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.7.5
Subject: [PATCH v3] pkg-config-native: allow kernel to be build with esdk
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
X-List-Received-Date: Tue, 27 Jun 2017 23:35:53 -0000

When the kernel's menuconfig target is called while using the esdk or an
esdk-based container, the pkg-config info that is found is not correct.
The pkg-config info is for the target, but we need the eSDK's information
in order to build the host based menuconfig.

The new pkg-config-native script checks both that it's in SDK and being
called from the check-lxdialog script in order to limit the scope of when
the pkg-config automagically switches to pkg-config-native.

The pkg-config-esdk is only installed as pkg-config inside the eSDK, which
is why we use the sstate post install script and check for if we are in the
esdk environment.

Added an SDK_ARCH conversion to handle older 32bit installs since I now
use the ARCH based name for pkg-config

[YOCTO #11155]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../pkgconfig/pkgconfig/pkg-config-esdk.in         | 24 ++++++++++++++++++++++
 .../pkgconfig/pkgconfig/pkg-config-native.in       |  2 +-
 meta/recipes-devtools/pkgconfig/pkgconfig_git.bb   | 17 +++++++++++++++
 3 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-esdk.in

diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-esdk.in b/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-esdk.in
new file mode 100644
index 0000000..948cc7a
--- /dev/null
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-esdk.in
@@ -0,0 +1,24 @@
+#! /bin/sh
+
+# Orignal pkg-config-native action when called as pkg-config-native
+# NO Change here
+if [ "pkg-config-native" = "`basename $0`" ] ; then
+	PKG_CONFIG_PATH="@PATH_NATIVE@"
+	PKG_CONFIG_LIBDIR="@LIBDIR_NATIVE@"
+	unset PKG_CONFIG_SYSROOT_DIR
+else
+	# in this case we are in the esdk
+	if [ "$OE_SKIP_SDK_CHECK" = "1" ] ; then
+		parentpid=`ps -o ppid= -p $$`
+		parentpid_info=`ps -wo comm= -o args= -p $parentpid`
+
+		# check if we are being called from  the kernel's make menuconfig
+		if ( echo $parentpid_info | grep -q check-lxdialog ) ; then
+			PKG_CONFIG_PATH="@PATH_NATIVE@"
+			PKG_CONFIG_LIBDIR="@LIBDIR_NATIVE@"
+			unset PKG_CONFIG_SYSROOT_DIR
+		fi
+	fi
+fi
+
+@SDK_ARCH@-pc-linux-gnu-pkg-config "$@"
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-native.in b/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-native.in
index 5e44bb4..3490d24 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-native.in
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-native.in
@@ -4,4 +4,4 @@ PKG_CONFIG_PATH="@PATH_NATIVE@"
 PKG_CONFIG_LIBDIR="@LIBDIR_NATIVE@"
 unset PKG_CONFIG_SYSROOT_DIR
 
-pkg-config "$@"
+@SDK_ARCH@-pc-linux-gnu-pkg-config "$@"
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
index e634021..980c613 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
@@ -12,6 +12,7 @@ SRCREV = "edf8e6f0ea77ede073f07bff0d2ae1fc7a38103b"
 PV = "0.29.2+git${SRCPV}"
 
 SRC_URI = "git://anongit.freedesktop.org/pkg-config \
+           file://pkg-config-esdk.in \
            file://pkg-config-native.in \
            file://fix-glib-configure-libtool-usage.patch \
            file://0001-glib-gettext.m4-Update-AM_GLIB_GNU_GETTEXT-to-match-.patch \
@@ -52,6 +53,22 @@ RPROVIDES_${PN} += "pkgconfig(pkg-config)"
 do_install_append_class-native () {
     sed -e "s|@PATH_NATIVE@|${PKG_CONFIG_PATH}|" \
         -e "s|@LIBDIR_NATIVE@|${PKG_CONFIG_LIBDIR}|" \
+        -e "s|@SDK_ARCH@|${SDK_ARCH}|" \
         < ${WORKDIR}/pkg-config-native.in > ${B}/pkg-config-native
     install -m755 ${B}/pkg-config-native ${D}${bindir}/pkg-config-native
+    sed -e "s|@PATH_NATIVE@|${PKG_CONFIG_PATH}|" \
+        -e "s|@LIBDIR_NATIVE@|${PKG_CONFIG_LIBDIR}|" \
+        -e "s|@SDK_ARCH@|${SDK_ARCH}|" \
+        < ${WORKDIR}/pkg-config-esdk.in > ${B}/pkg-config-esdk
+    install -m755 ${B}/pkg-config-esdk ${D}${bindir}/pkg-config-esdk
+}
+
+PKGCONFIGBIN = "${COMPONENTS_DIR}/${BUILD_ARCH}/${PN}/${bindir_native}"
+
+pkgconfig_sstate_postinst () {
+	if [ "$OE_SKIP_SDK_CHECK" = "1" -a "${BB_CURRENTTASK}" = "populate_sysroot" -o "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ] ; then
+		rm -rf ${PKGCONFIGBIN}/pkg-config
+		lnr ${PKGCONFIGBIN}/pkg-config-esdk ${PKGCONFIGBIN}/pkg-config
+	fi
 }
+SSTATEPOSTINSTFUNCS += "pkgconfig_sstate_postinst"
-- 
2.7.5


