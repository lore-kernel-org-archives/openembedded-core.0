Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5552A65D4F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 09:15:45 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sA79Fiub009236
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Nov 2014 01:15:45 -0800 (PST)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.163.178) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Fri, 7 Nov 2014 01:15:44 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Nov 2014 17:15:45 +0800
Message-ID: <1415351745-6915-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [PATCH][v2] ncurses, busybox, cml1.bbclass: Fix menuconfig display corruption
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
X-List-Received-Date: Fri, 07 Nov 2014 09:15:45 -0000
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
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta/classes/cml1.bbclass                          |  5 +-
 .../busybox/busybox/busybox-cross-menuconfig.patch | 71 ++++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.22.1.bb        |  1 +
 3 files changed, 75 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/busybox/busybox/busybox-cross-menuconfig.patch

diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
index b5adc47..43acfd5 100644
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
diff --git a/meta/recipes-core/busybox/busybox/busybox-cross-menuconfig.patch b/meta/recipes-core/busybox/busybox/busybox-cross-menuconfig.patch
new file mode 100644
index 0000000..781f5af
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/busybox-cross-menuconfig.patch
@@ -0,0 +1,71 @@
+From: Jason Wessel <jason.wessel@windriver.com>
+Date: Sun, 3 Mar 2013 12:31:40 -0600
+Subject: [PATCH] menuconfig,check-lxdiaglog.sh: Allow specification of ncurses location
+
+Upstream-status: Submitted 
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
diff --git a/meta/recipes-core/busybox/busybox_1.22.1.bb b/meta/recipes-core/busybox/busybox_1.22.1.bb
index 82f7f68..7a50a30 100644
--- a/meta/recipes-core/busybox/busybox_1.22.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.22.1.bb
@@ -31,6 +31,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://login-utilities.cfg \
            file://0001-build-system-Specify-nostldlib-when-linking-to-.o-fi.patch \
            file://recognize_connmand.patch \
+           file://busybox-cross-menuconfig.patch \
 "
 
 SRC_URI_append_mips = " \
-- 
2.1.0


