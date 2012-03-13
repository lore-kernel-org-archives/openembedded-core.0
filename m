Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1S7HJ1-0003Qu-Ag
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 03:17:43 +0100
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id EC55530514
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Mar 2012 22:08:54 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Mar 2012 19:08:46 -0700
Message-Id: <f876555e0b49baed50840adb1d93e8338ab9d7ef.1331604310.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1331604310.git.scott.a.garman@intel.com>
References: <cover.1331604310.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1331604310.git.scott.a.garman@intel.com>
References: <cover.1331604310.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: EC55530514.17ECE
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 2/3] ncurses: move only libncurses and libtinfo to base_libdir
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
X-List-Received-Date: Tue, 13 Mar 2012 02:17:43 -0000

The previous approach to moving the ncurses libraries to
base_libdir was too aggressive, and it broke curses support
in python.

Instead, move only libncurses, libncursesw, and libtinfo to
base_libdir and leave the remaining libraries in libdir.

Also delete ${libdir}/terminfo as it never gets packaged to
avoid a QA warning.

This fixes [YOCTO #2070] and is a partial fix for [YOCTO #1937].

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 meta/recipes-core/ncurses/ncurses.inc |   40 +++++++++++++++++++++++----------
 1 files changed, 28 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 3b10c43..e450868 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://ncurses/base/version.c;beginline=1;endline=27;md5=cbc
 SECTION = "libs"
 DEPENDS = "ncurses-native"
 DEPENDS_virtclass-native = ""
-INC_PR = "r4"
+INC_PR = "r5"
 
 inherit autotools binconfig multilib_header
 
@@ -44,7 +44,6 @@ ncurses_configure() {
 	        --enable-hard-tabs \
 	        --enable-xmc-glitch \
 	        --enable-colorfgbg \
-	        --libdir=${base_libdir} \
 	        --with-termpath='${sysconfdir}/termcap:${datadir}/misc/termcap' \
 	        --with-terminfo-dirs='${sysconfdir}/terminfo:${datadir}/terminfo' \
 	        --with-shared \
@@ -114,7 +113,12 @@ _install_opts = "\
   install.libs install.includes install.man \
 "
 
-do_install() {
+python do_install () {
+	bb.build.exec_func("shell_do_install", d)
+	oe.path.make_relative_symlink(d.expand("${D}${libdir}/libtinfo.so"))
+}
+
+shell_do_install() {
         # Order of installation is important; widec installs a 'curses.h'
         # header with more definitions and must be installed last hence.
         # Compatibility of these headers will be checked in 'do_test()'.
@@ -147,6 +151,8 @@ do_install() {
                 ln -sf xterm-color ${D}${sysconfdir}/terminfo/x/xterm
         fi
 
+        rm ${D}${libdir}/terminfo
+
         if [ "${PN}" = "ncurses" ]; then
                 mv ${D}${bindir}/clear ${D}${bindir}/clear.${PN}
                 mv ${D}${bindir}/reset ${D}${bindir}/reset.${PN}
@@ -158,7 +164,7 @@ do_install() {
         # else when '-Wl,--no-copy-dt-needed-entries' has been set in
         # linker flags.
         for i in libncurses libncursesw; do
-                f=${D}${base_libdir}/$i.so
+                f=${D}${libdir}/$i.so
                 test -h $f || continue
                 rm -f $f
                 echo '/* GNU ld script */'  >$f
@@ -167,20 +173,33 @@ do_install() {
 
         # Make sure that libcurses is linked so that it gets -ltinfo
         # also, this should be addressed upstream really.
-        ln -sf libncurses.so ${D}${base_libdir}/libcurses.so
+        ln -sf libncurses.so ${D}${libdir}/libcurses.so
 
         # create libtermcap.so linker script for backward compatibility
-        f=${D}${base_libdir}/libtermcap.so
+        f=${D}${libdir}/libtermcap.so
         echo '/* GNU ld script */' >$f
         echo 'INPUT(AS_NEEDED(-ltinfo))' >>$f
 
+        if [ ! -d "${D}${base_libdir}" ]; then
+            # Setting base_libdir to libdir as is done in the -native
+            # case will skip this code
+            mkdir ${D}${base_libdir}
+            mv ${D}${libdir}/libncurses.so.* ${D}${base_libdir}
+            mv ${D}${libdir}/libncursesw.so.* ${D}${base_libdir}
+
+            mv ${D}${libdir}/libtinfo.so.* ${D}${base_libdir}
+            rm ${D}${libdir}/libtinfo.so
+            # We'll turn this into a relative symlink after do_install returns
+            ln -sf ${D}${base_libdir}/libtinfo.so.5 ${D}${libdir}/libtinfo.so
+        fi
+
         oe_multilib_header curses.h
 }
 
 python populate_packages_prepend () {
-        base_libdir = d.expand("${base_libdir}")
+        libdir = d.expand("${libdir}")
         pnbase = d.expand("${PN}-lib%s")
-        do_split_packages(d, base_libdir, '^lib(.*)\.so\..*', pnbase, 'ncurses %s library', prepend=True, extra_depends = '', allow_links=True)
+        do_split_packages(d, libdir, '^lib(.*)\.so\..*', pnbase, 'ncurses %s library', prepend=True, extra_depends = '', allow_links=True)
 }
 
 
@@ -212,10 +231,7 @@ FILES_${PN} = "\
   ${bindir}/ncurses5-config \
   ${bindir}/ncursesw5-config \
   ${datadir}/tabset \
-"
-
-FILES_${PN}-dev += "\
- ${base_libdir}/*.so \
+  ${base_libdir}/* \
 "
 
 # This keeps only tput/tset in ncurses
-- 
1.7.5.4



