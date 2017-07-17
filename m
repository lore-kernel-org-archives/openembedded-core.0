Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2507A77E87
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jul 2017 16:20:22 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Jul 2017 09:20:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,375,1496127600"; d="scan'208";a="993935884"
Received: from swold-mobl2.amr.corp.intel.com ([10.252.133.170])
	by orsmga003.jf.intel.com with ESMTP; 17 Jul 2017 09:20:16 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Mon, 17 Jul 2017 09:20:15 -0700
Message-Id: <1500308415-19435-2-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.7.5
In-Reply-To: <1500308415-19435-1-git-send-email-sgw@linux.intel.com>
References: <1500308415-19435-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 2/2 v4] pkgconfig: allow kernel to be build with esdk
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
X-List-Received-Date: Mon, 17 Jul 2017 16:20:22 -0000

When the kernel's menuconfig target is called while using the esdk or an
esdk-based container, the pkg-config info that is found is not correct.
The pkg-config info is for the target, but we need the eSDK's information
in order to build the host based menuconfig.

The new pkg-config-esdk script checks both that it's in SDK and being
called from the check-lxdialog script in order to limit the scope of when
the pkg-config automagically switches to pkg-config-native.

The pkg-config-esdk is only installed as pkg-config inside the eSDK, which
is why we use the sstate post install script and check for if we are in the
esdk environment using the WITHIN_EXT_SDK

[YOCTO #11155]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../pkgconfig/pkgconfig/pkg-config-esdk.in         | 24 ++++++++++++++++++++++
 meta/recipes-devtools/pkgconfig/pkgconfig_git.bb   | 16 +++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-esdk.in

diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-esdk.in b/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-esdk.in
new file mode 100644
index 0000000..4fc9b0a
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
+	# in this case check if we are in the esdk
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
+pkg-config.real "$@"
diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
index e634021..52ef2a9 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
@@ -12,6 +12,7 @@ SRCREV = "edf8e6f0ea77ede073f07bff0d2ae1fc7a38103b"
 PV = "0.29.2+git${SRCPV}"
 
 SRC_URI = "git://anongit.freedesktop.org/pkg-config \
+           file://pkg-config-esdk.in \
            file://pkg-config-native.in \
            file://fix-glib-configure-libtool-usage.patch \
            file://0001-glib-gettext.m4-Update-AM_GLIB_GNU_GETTEXT-to-match-.patch \
@@ -54,4 +55,19 @@ do_install_append_class-native () {
         -e "s|@LIBDIR_NATIVE@|${PKG_CONFIG_LIBDIR}|" \
         < ${WORKDIR}/pkg-config-native.in > ${B}/pkg-config-native
     install -m755 ${B}/pkg-config-native ${D}${bindir}/pkg-config-native
+    sed -e "s|@PATH_NATIVE@|${PKG_CONFIG_PATH}|" \
+        -e "s|@LIBDIR_NATIVE@|${PKG_CONFIG_LIBDIR}|" \
+        < ${WORKDIR}/pkg-config-esdk.in > ${B}/pkg-config-esdk
+    install -m755 ${B}/pkg-config-esdk ${D}${bindir}/pkg-config-esdk
 }
+
+pkgconfig_sstate_fixup_esdk () {
+	if [ "${BB_CURRENTTASK}" = "populate_sysroot_setscene" -a "${WITHIN_EXT_SDK}" = "1" ] ; then
+		pkgconfdir="${SSTATE_INSTDIR}/recipe-sysroot-native/${bindir_native}"
+		mv $pkgconfdir/pkg-config $pkgconfdir/pkg-config.real
+		lnr $pkgconfdir/pkg-config-esdk $pkgconfdir/pkg-config
+		sed -i -e "s|^pkg-config|pkg-config.real|" $pkgconfdir/pkg-config-native
+	fi
+}
+
+SSTATEPOSTUNPACKFUNCS_append_class-native = " pkgconfig_sstate_fixup_esdk"
-- 
2.7.5


