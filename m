Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1Tkvtr-0006aP-RZ
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Dec 2012 13:03:56 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 18 Dec 2012 03:47:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,308,1355126400"; d="scan'208";a="258889629"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by orsmga002.jf.intel.com with ESMTP; 18 Dec 2012 03:48:11 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Dec 2012 13:48:42 +0200
Message-Id: <b90a2121344594bc7ad70614a388361b4ce86ced.1355830852.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1355830852.git.constantinx.musca@intel.com>
References: <cover.1355830852.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1355830852.git.constantinx.musca@intel.com>
References: <cover.1355830852.git.constantinx.musca@intel.com>
Subject: [PATCH v2 2/7] udev: use nonarch_base_libdir for files that don't vary by arch
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
X-List-Received-Date: Tue, 18 Dec 2012 12:03:56 -0000

fix-udev-paths.patch: added
- Adapt udev to use nonarch_base_libdir

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/recipes-core/udev/udev.inc                  |  8 +-
 meta/recipes-core/udev/udev/fix-udev-paths.patch | 94 ++++++++++++++++++++++++
 meta/recipes-core/udev/udev_182.bb               |  2 +-
 3 files changed, 100 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-core/udev/udev/fix-udev-paths.patch

diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
index 4705b9b..0851645 100644
--- a/meta/recipes-core/udev/udev.inc
+++ b/meta/recipes-core/udev/udev.inc
@@ -18,6 +18,7 @@ RDEPENDS_libudev = "${PN} (= ${EXTENDPKGV})"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/hotplug/udev-${PV}.tar.gz \
            file://0001-Fixing-keyboard_force_release.sh-shell-script-path.patch \
+           file://fix-udev-paths.patch \
            file://run.rules \
            file://udev.rules \
            file://devfs-udev.rules \
@@ -32,7 +33,7 @@ inherit autotools pkgconfig update-rc.d
 
 # udevd/udevadm -> /sbin/, libudev.so.* -> /lib/
 sbindir = "${base_sbindir}"
-libexecdir = "${base_libdir}" 
+libexecdir = "${base_libdir}"
 EXTRA_OECONF = "--disable-introspection \
                 --with-rootlibdir=${base_libdir} \
                 --with-pci-ids-path=${datadir}/pci.ids \
@@ -41,6 +42,7 @@ EXTRA_OECONF = "--disable-introspection \
                 ac_cv_file__usr_share_misc_pci_ids=yes \
                 --sbindir=${base_sbindir} \
                 --libexecdir=${base_libdir} \
+                --with-nonarch_rootlibdir=${nonarch_base_libdir} \
                 --with-rootlibdir=${base_libdir} \
                 --with-rootprefix= \
                "
@@ -55,7 +57,7 @@ INITSCRIPT_PARAMS_udev = "start 03 S ."
 INITSCRIPT_NAME_udev-cache = "udev-cache"
 INITSCRIPT_PARAMS_udev-cache = "start 36 S ."
 
-FILES_${PN} += "${libexecdir} ${libdir}/ConsoleKit"
+FILES_${PN} += "${nonarch_base_libdir} ${libexecdir} ${libdir}/ConsoleKit"
 RRECOMMENDS_${PN} += "udev-utils"
 
 FILES_${PN}-dbg += "${libexecdir}/.debug"
@@ -72,7 +74,7 @@ FILES_libgudev-dev = "${includedir}/gudev* ${libdir}/libgudev*.so ${libdir}/libg
                      ${libdir}/libgudev*.a ${libdir}/pkgconfig/gudev*.pc"
 FILES_udev-cache = "${sysconfdir}/init.d/udev-cache ${sysconfdir}/default/udev-cache"
 
-FILES_udev-acl = "${base_libdir}/udev/udev-acl ${base_libdir}/udev/rules.d/70-acl.rules"
+FILES_udev-acl = "${base_libdir}/udev/udev-acl ${nonarch_base_libdir}/udev/rules.d/70-acl.rules"
 
 FILES_udev-utils = "${bindir}/udevinfo ${bindir}/udevtest ${base_sbindir}/udevadm"
 
diff --git a/meta/recipes-core/udev/udev/fix-udev-paths.patch b/meta/recipes-core/udev/udev/fix-udev-paths.patch
new file mode 100644
index 0000000..85c79fe
--- /dev/null
+++ b/meta/recipes-core/udev/udev/fix-udev-paths.patch
@@ -0,0 +1,94 @@
+Move rules and other files that don't vary by architecture
+to ${nonarch_base_libdir}
+
+Upstream-Status: Inappropriate [configuration]
+Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
+
+Index: udev-182/Makefile.am
+===================================================================
+--- udev-182.orig/Makefile.am
++++ udev-182/Makefile.am
+@@ -19,7 +19,7 @@ AM_CPPFLAGS = \
+ 	-include $(top_builddir)/config.h \
+ 	-I$(top_srcdir)/src \
+ 	-DSYSCONFDIR=\""$(sysconfdir)"\" \
+-	-DPKGLIBEXECDIR=\""$(libexecdir)/udev"\"
++	-DPKGLIBEXECDIR=\""$(rootlib_execdir)/udev"\"
+ 
+ AM_CFLAGS = \
+ 	${my_CFLAGS} \
+@@ -48,12 +48,13 @@ UNINSTALL_EXEC_HOOKS =
+ DISTCHECK_HOOKS =
+ DISTCLEAN_LOCAL_HOOKS =
+ 
+-udevhomedir = $(libexecdir)/udev
++udevhomedir = $(nonarch_rootlib_execdir)/udev
+ udevhome_SCRIPTS =
+ dist_udevhome_SCRIPTS =
+ dist_udevhome_DATA =
+ dist_man_MANS =
+ 
++pkglibexecdir = $(rootlib_execdir)/udev
+ SED_PROCESS = \
+ 	$(AM_V_GEN)$(MKDIR_P) $(dir $@) && $(SED) \
+ 	-e 's,@VERSION\@,$(VERSION),g' \
+@@ -63,7 +64,7 @@ SED_PROCESS = \
+ 	-e 's,@libdir\@,$(libdir),g' \
+ 	-e 's,@includedir\@,$(includedir),g' \
+ 	-e 's,@bindir\@,$(bindir),g' \
+-	-e 's,@pkglibexecdir\@,$(libexecdir)/udev,g' \
++	-e 's,@pkglibexecdir\@,$(nonarch_rootlib_execdir)/udev,g' \
+ 	< $< > $@ || rm $@
+ 
+ %.pc: %.pc.in Makefile
+@@ -144,7 +145,7 @@ udev-confdirs:
+ 
+ INSTALL_DATA_HOOKS += udev-confdirs
+ 
+-udevrulesdir = $(libexecdir)/udev/rules.d
++udevrulesdir = $(nonarch_rootlib_execdir)/udev/rules.d
+ dist_udevrules_DATA = \
+ 	rules/42-usb-hid-pm.rules \
+ 	rules/50-udev-default.rules \
+@@ -524,7 +525,7 @@ CLEANFILES += \
+ 	src/keymap/keys-from-name.gperf \
+ 	src/keymap/keyboard-force-release.sh
+ 
+-udevkeymapdir = $(libexecdir)/udev/keymaps
++udevkeymapdir = $(nonarch_rootlib_execdir)/udev/keymaps
+ dist_udevkeymap_DATA = \
+ 	src/keymap/keymaps/acer \
+ 	src/keymap/keymaps/acer-aspire_5720 \
+@@ -584,7 +585,7 @@ dist_udevkeymap_DATA = \
+ 	src/keymap/keymaps/toshiba-satellite_m30x \
+ 	src/keymap/keymaps/zepto-znote
+ 
+-udevkeymapforcereldir = $(libexecdir)/udev/keymaps/force-release
++udevkeymapforcereldir = $(nonarch_rootlib_execdir)/udev/keymaps/force-release
+ dist_udevkeymapforcerel_DATA = \
+ 	src/keymap/force-release-maps/dell-touchpad \
+ 	src/keymap/force-release-maps/hp-other \
+Index: udev-182/configure.ac
+===================================================================
+--- udev-182.orig/configure.ac
++++ udev-182/configure.ac
+@@ -37,6 +37,11 @@ AC_ARG_WITH([rootlibdir],
+        [], [with_rootlibdir=$libdir])
+ AC_SUBST([rootlib_execdir], [$with_rootlibdir])
+ 
++AC_ARG_WITH([nonarch_rootlibdir],
++       AS_HELP_STRING([--with-nonarch_rootlibdir=DIR], [rootfs directory to install shared libraries]),
++       [], [with_nonarch_rootlibdir=$libdir])
++AC_SUBST([nonarch_rootlib_execdir], [$with_nonarch_rootlibdir])
++
+ AC_ARG_WITH([selinux],
+        AS_HELP_STRING([--with-selinux], [enable SELinux support]),
+        [], [with_selinux=no])
+@@ -212,6 +217,7 @@ AC_MSG_RESULT([
+         bindir:                  ${bindir}
+         libdir:                  ${libdir}
+         rootlibdir:              ${rootlib_execdir}
++        nonarch_rootlibdir:      ${nonarch_rootlib_execdir}
+         libexecdir:              ${libexecdir}
+         datarootdir:             ${datarootdir}
+         mandir:                  ${mandir}
diff --git a/meta/recipes-core/udev/udev_182.bb b/meta/recipes-core/udev/udev_182.bb
index c41de9f..0ae9f8c 100644
--- a/meta/recipes-core/udev/udev_182.bb
+++ b/meta/recipes-core/udev/udev_182.bb
@@ -1,6 +1,6 @@
 include udev.inc
 
-PR = "r2"
+PR = "r3"
 
 # module-init-tools from kmod_git will provide libkmod runtime
 DEPENDS += "module-init-tools"
-- 
1.7.11.7



