Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6495278231
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Jun 2017 00:24:12 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Jun 2017 17:24:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,381,1493708400"; d="scan'208";a="103089560"
Received: from swold-mobl2.amr.corp.intel.com ([10.252.133.197])
	by orsmga002.jf.intel.com with ESMTP; 23 Jun 2017 17:24:13 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Fri, 23 Jun 2017 17:24:12 -0700
Message-Id: <1498263852-28043-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.7.5
Subject: [PATCH v2] pkg-config-native: allow kernel to be build with esdk
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
X-List-Received-Date: Sat, 24 Jun 2017 00:24:14 -0000

When the kernel's menuconfig target is called while using the esdk or an
esdk-based container, the pkg-config info that is found is not correct.
The pkg-config info is for the target, but we need the eSDK's information
in order to build the host based menuconfig.

The new pkg-config-native script checks both that it's in SDK and being
called from the check-lxdialog script in order to limit the scope of when
the pkg-config automagically switches to pkg-config-native.

[YOCTO #11155]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../pkgconfig/pkgconfig/pkg-config-native.in       | 25 ++++++++++++++++++----
 meta/recipes-devtools/pkgconfig/pkgconfig_git.bb   | 10 +++++----
 2 files changed, 27 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-native.in b/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-native.in
index 5e44bb4..26da5b6 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-native.in
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-native.in
@@ -1,7 +1,24 @@
 #! /bin/sh
 
-PKG_CONFIG_PATH="@PATH_NATIVE@"
-PKG_CONFIG_LIBDIR="@LIBDIR_NATIVE@"
-unset PKG_CONFIG_SYSROOT_DIR
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
 
-pkg-config "$@"
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
index e634021..37f1f74 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
@@ -50,8 +50,10 @@ RPROVIDES_${PN} += "pkgconfig(pkg-config)"
 # Install a pkg-config-native wrapper that will use the native sysroot instead
 # of the MACHINE sysroot, for using pkg-config when building native tools.
 do_install_append_class-native () {
-    sed -e "s|@PATH_NATIVE@|${PKG_CONFIG_PATH}|" \
-        -e "s|@LIBDIR_NATIVE@|${PKG_CONFIG_LIBDIR}|" \
-        < ${WORKDIR}/pkg-config-native.in > ${B}/pkg-config-native
-    install -m755 ${B}/pkg-config-native ${D}${bindir}/pkg-config-native
+	mv ${D}${bindir}/pkg-config ${D}${bindir}/pkg-config.real
+	sed -e "s|@PATH_NATIVE@|${PKG_CONFIG_PATH}|" \
+		-e "s|@LIBDIR_NATIVE@|${PKG_CONFIG_LIBDIR}|" \
+		< ${WORKDIR}/pkg-config-native.in > ${B}/pkg-config-native
+	install -m755 ${B}/pkg-config-native ${D}${bindir}/pkg-config-native
+	ln -s pkg-config-native ${D}${bindir}/pkg-config
 }
-- 
2.7.5


