Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 595E36A626
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 15:03:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4TF3tDM016010
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 08:03:55 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Wed, 29 May 2013 08:03:55 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 May 2013 10:09:52 -0500
Message-ID: <1369840203-21898-11-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <1369840203-21898-1-git-send-email-mark.hatle@windriver.com>
References: <1369840203-21898-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 10/21] ncurses, busybox, cml1.bbclass: Fix menuconfig display corruption
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
X-List-Received-Date: Wed, 29 May 2013 15:03:54 -0000
Content-Type: text/plain

From: Jason Wessel <jason.wessel@windriver.com>

Previously there was a change to the ncurses compile to make it more
like the typical way it was compiled on a host system.  This fixed a
whole class of host machines, but masked the real underlying problem
with the display corruption issues and menuconfig.

The corner case that led to the discovery that the wrong curses.h file
was getting used was when there was no curses libraries at all on one
of the development hosts.  What had happened before was that
/usr/include/curses.h on the host system had to match closely enough
to the curses.h in the sysroot and then linking against the sysroot
version of curses.so was ok (meaning no display corruption).  But on
some systems with ncurses.h vs curses.h such as SuSE hosts, there were
still issues.

If we fix the root of the problem and force the mconf and lxdialog to
use the correct headers and libraries from the sysroot there is no
further issues and the menuconfig target works properly.  It also
means we can back out the custom compilation flags to the ncurses
recipe because they are no longer needed.

For the kernel part of the menuconfig / nconfig changes it will be
merged separately and this is all based on:

https://lkml.org/lkml/2013/3/3/103

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 meta/classes/cml1.bbclass                          |  5 +-
 .../busybox-1.20.2/busybox-cross-menuconfig.patch  | 69 ++++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.20.2.bb        |  3 +-
 meta/recipes-core/ncurses/ncurses.inc              | 14 -----
 4 files changed, 74 insertions(+), 17 deletions(-)
 create mode 100644 meta/recipes-core/busybox/busybox-1.20.2/busybox-cross-menuconfig.patch

diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
index bb95639..cd8e599 100644
--- a/meta/classes/cml1.bbclass
+++ b/meta/classes/cml1.bbclass
@@ -9,10 +9,11 @@ addtask configure after do_unpack do_patch before do_compile
 
 inherit terminal
 
-OE_TERMINAL_EXPORTS += "HOST_EXTRACFLAGS HOSTLDFLAGS HOST_LOADLIBES TERMINFO"
+OE_TERMINAL_EXPORTS += "HOST_EXTRACFLAGS HOSTLDFLAGS TERMINFO CROSS_CURSES_LIB CROSS_CURSES_INC"
 HOST_EXTRACFLAGS = "${BUILD_CFLAGS} ${BUILD_LDFLAGS}"
 HOSTLDFLAGS = "${BUILD_LDFLAGS}"
-HOST_LOADLIBES = "-lncurses"
+CROSS_CURSES_LIB = "-lncurses -ltinfo"
+CROSS_CURSES_INC = '-DCURSES_LOC="<curses.h>"'
 TERMINFO = "${STAGING_DATADIR_NATIVE}/terminfo"
 
 python do_menuconfig() {
diff --git a/meta/recipes-core/busybox/busybox-1.20.2/busybox-cross-menuconfig.patch b/meta/recipes-core/busybox/busybox-1.20.2/busybox-cross-menuconfig.patch
new file mode 100644
index 0000000..c0784d5
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox-1.20.2/busybox-cross-menuconfig.patch
@@ -0,0 +1,69 @@
+From: Jason Wessel <jason.wessel@windriver.com>
+Date: Sun, 3 Mar 2013 12:31:40 -0600
+Subject: [PATCH] menuconfig,check-lxdiaglog.sh: Allow specification of ncurses location
+
+[ based on: https://lkml.org/lkml/2013/3/3/103 ]
+
+This patch syncs up with the way the menuconfig ncurses / curses
+is detected and the HOST_EXTRACFLAGS works in the Linux kernel
+and it allows the menuconfig to work with a sysroot version
+of the curses libraries.
+
+---
+
+In some cross build environments such as the Yocto Project build
+environment it provides an ncurses library that is compiled
+differently than the host's version.  This causes display corruption
+problems when the host's curses includes are used instead of the
+includes from the provided compiler are overridden.  There is a second
+case where there is no curses libraries at all on the host system and
+menuconfig will just fail entirely.
+
+The solution is simply to allow an override variable in
+check-lxdialog.sh for environments such as the Yocto Project.  Adding
+a CROSS_CURSES_LIB and CROSS_CURSES_INC solves the issue and allowing
+compiling and linking against the right headers and libraries.
+
+Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
+cc: Michal Marek <mmarek@suse.cz>
+cc: linux-kbuild@vger.kernel.org
+---
+ scripts/kconfig/lxdialog/Makefile          |    2 +-
+ scripts/kconfig/lxdialog/check-lxdialog.sh |    8 ++++++++
+ 2 files changed, 9 insertions(+), 1 deletion(-)
+
+--- a/scripts/kconfig/lxdialog/check-lxdialog.sh
++++ b/scripts/kconfig/lxdialog/check-lxdialog.sh
+@@ -4,6 +4,10 @@
+ # What library to link
+ ldflags()
+ {
++	if [ x"$CROSS_CURSES_LIB" != x ]; then
++		echo "$CROSS_CURSES_LIB"
++		exit
++	fi
+ 	for ext in so a dylib ; do
+ 		for lib in ncursesw ncurses curses ; do
+ 			$cc -print-file-name=lib${lib}.${ext} | grep -q /
+@@ -19,6 +23,10 @@ ldflags()
+ # Where is ncurses.h?
+ ccflags()
+ {
++	if [ x"$CROSS_CURSES_INC" != x ]; then
++		echo "$CROSS_CURSES_INC"
++		exit
++	fi
+ 	if [ -f /usr/include/ncursesw/ncurses.h ]; then
+ 		echo '-I/usr/include/ncursesw -DCURSES_LOC="<ncurses.h>"'
+ 	elif [ -f /usr/include/ncursesw/curses.h ]; then
+--- a/scripts/kconfig/lxdialog/Makefile
++++ b/scripts/kconfig/lxdialog/Makefile
+@@ -5,7 +5,7 @@ check-lxdialog  := $(srctree)/$(src)/che
+ 
+ # Use reursively expanded variables so we do not call gcc unless
+ # we really need to do so. (Do not call gcc as part of make mrproper)
+-HOST_EXTRACFLAGS = $(shell $(CONFIG_SHELL) $(check-lxdialog) -ccflags)
++HOST_EXTRACFLAGS += $(shell $(CONFIG_SHELL) $(check-lxdialog) -ccflags)
+ HOST_LOADLIBES   = $(shell $(CONFIG_SHELL) $(check-lxdialog) -ldflags $(HOSTCC))
+ 
+ HOST_EXTRACFLAGS += -DLOCALE
diff --git a/meta/recipes-core/busybox/busybox_1.20.2.bb b/meta/recipes-core/busybox/busybox_1.20.2.bb
index 07d722d..410c701 100644
--- a/meta/recipes-core/busybox/busybox_1.20.2.bb
+++ b/meta/recipes-core/busybox/busybox_1.20.2.bb
@@ -35,7 +35,8 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://fail_on_no_media.patch \
            file://busybox-sulogin-empty-root-password.patch \
            file://inetd.conf \
-           file://inetd"
+           file://inetd \
+           file://busybox-cross-menuconfig.patch"
 
 SRC_URI[tarball.md5sum] = "e025414bc6cd79579cc7a32a45d3ae1c"
 SRC_URI[tarball.sha256sum] = "eb13ff01dae5618ead2ef6f92ba879e9e0390f9583bd545d8789d27cf39b6882"
diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index bcb9c94..8a81381 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -29,19 +29,6 @@ BUILD_CPPFLAGS += "-D_GNU_SOURCE"
 # natives don't generally look in base_libdir
 base_libdir_class-native = "${libdir}"
 
-# Display corruption occurs on 64 bit hosts without these settings
-# This was derrived from the upstream debian ncurses which uses
-# these settings for 32 and 64 bit hosts.
-EXCONFIG_ARGS = ""
-EXCONFIG_ARGS_virtclass-native = " \
-		--disable-lp64 \
-		--with-chtype='long' \
-		--with-mmask-t='long'"
-EXCONFIG_ARGS_virtclass-nativesdk = " \
-		--disable-lp64 \
-		--with-chtype='long' \
-		--with-mmask-t='long'"
-
 # Fall back to the host termcap / terminfo for -nativesdk and -native
 # The reality is a work around for strange problems with things like
 # "bitbake -c menuconfig busybox" where it cannot find the terminfo
@@ -79,7 +66,6 @@ ncurses_configure() {
 	        --enable-sigwinch \
 	        --enable-pc-files \
 	        --disable-rpath-hack \
-		${EXCONFIG_ARGS} \
 	        --with-manpage-format=normal \
 	        "$@" || return 1
 	cd ..
-- 
1.8.1.2.545.g2f19ada


