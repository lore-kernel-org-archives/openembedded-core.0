Return-Path: <sgw@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 600DF78334
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 14:03:01 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Jun 2017 07:03:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,340,1493708400"; d="scan'208";a="99405962"
Received: from swold-mobl2.amr.corp.intel.com ([10.255.230.86])
	by orsmga002.jf.intel.com with ESMTP; 14 Jun 2017 07:03:02 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Wed, 14 Jun 2017 07:03:01 -0700
Message-Id: <1497448981-8637-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] pkg-config: allow kernel to be build with esdk
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
X-List-Received-Date: Wed, 14 Jun 2017 14:03:02 -0000

When the kernel's menuconfig target is called while using the esdk or an
esdk-based container, the pkg-config info that is found is not correct.
The pkg-config info is for the target, but we need the eSDK's information
in order to build the host based menuconfig.

The new pkg-config script checks both that it's in SDK and being called
from the check-lxdialog script in order to limit the scope of when the
pkg-config automagically switches to pkg-config-native.

This script also replaces the default pkg-config-native script.

[YOCTO #11155]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../pkgconfig/pkgconfig/pkg-config.in              | 22 ++++++++++++++++++++++
 meta/recipes-devtools/pkgconfig/pkgconfig_git.bb   | 14 ++++++++++----
 2 files changed, 32 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config.in

diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config.in b/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config.in
new file mode 100644
index 0000000..dabec47
--- /dev/null
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config.in
@@ -0,0 +1,22 @@
+#!/bin/sh
+
+do_native=0
+
+parentpid=`ps -o ppid= -p $$`
+parentpid_info=`ps -wo comm= -o args= -p $parentpid`
+
+# in this case we are in the esdk and being called from
+# the kernel's make menuconfig
+if [ "pkg-config-native" = "`basename $0`" ] ||
+   ([ "$OE_SKIP_SDK_CHECK" = "1" ] &&
+    ( echo $parentpid_info | grep -q check-lxdialog )) ; then
+	do_native=1
+fi
+
+if [ $do_native -eq 1 ] ; then
+	PKG_CONFIG_PATH="@PATH_NATIVE@"
+	PKG_CONFIG_LIBDIR="@LIBDIR_NATIVE@"
+	unset PKG_CONFIG_SYSROOT_DIR
+fi
+
+pkg-config.real "$@"
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
index e634021..3ec7458 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
@@ -12,6 +12,7 @@ SRCREV = "edf8e6f0ea77ede073f07bff0d2ae1fc7a38103b"
 PV = "0.29.2+git${SRCPV}"
 
 SRC_URI = "git://anongit.freedesktop.org/pkg-config \
+           file://pkg-config.in \
            file://pkg-config-native.in \
            file://fix-glib-configure-libtool-usage.patch \
            file://0001-glib-gettext.m4-Update-AM_GLIB_GNU_GETTEXT-to-match-.patch \
@@ -47,11 +48,16 @@ FILES_${PN} += "${datadir}/aclocal/pkg.m4"
 # specifying an appropriate provide.
 RPROVIDES_${PN} += "pkgconfig(pkg-config)"
 
+do_install_append () {
+	mv ${D}${bindir}/pkg-config ${D}${bindir}/pkg-config.real
+	sed -e "s|@PATH_NATIVE@|${PKG_CONFIG_PATH}|" \
+		-e "s|@LIBDIR_NATIVE@|${PKG_CONFIG_LIBDIR}|" \
+		< ${WORKDIR}/pkg-config.in > ${B}/pkg-config
+	install -m755 ${B}/pkg-config ${D}${bindir}/pkg-config
+}
+
 # Install a pkg-config-native wrapper that will use the native sysroot instead
 # of the MACHINE sysroot, for using pkg-config when building native tools.
 do_install_append_class-native () {
-    sed -e "s|@PATH_NATIVE@|${PKG_CONFIG_PATH}|" \
-        -e "s|@LIBDIR_NATIVE@|${PKG_CONFIG_LIBDIR}|" \
-        < ${WORKDIR}/pkg-config-native.in > ${B}/pkg-config-native
-    install -m755 ${B}/pkg-config-native ${D}${bindir}/pkg-config-native
+	install -m755 ${B}/pkg-config ${D}${bindir}/pkg-config-native
 }
-- 
2.7.4


