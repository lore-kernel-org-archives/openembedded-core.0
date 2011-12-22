Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rddc1-0005NF-6N
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 09:02:49 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 21 Dec 2011 23:55:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="89233757"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.90])
	by orsmga001.jf.intel.com with ESMTP; 21 Dec 2011 23:55:38 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Dec 2011 23:55:18 -0800
Message-Id: <be1461e4a665328a3f97fb6e516cfce663b1c48d.1324540323.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1324540322.git.sgw@linux.intel.com>
References: <cover.1324540322.git.sgw@linux.intel.com>
In-Reply-To: <cover.1324540322.git.sgw@linux.intel.com>
References: <cover.1324540322.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 12/26] ncurses: move libraries to base_libdir
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
X-List-Received-Date: Thu, 22 Dec 2011 08:02:49 -0000

From: Scott Garman <scott.a.garman@intel.com>

Various utilities (including bash and the util-linux programs) located
in base_bindir (/bin) or base_sbindir (/sbin) dynamically link against
many of the ncurses libraries. So move these libraries from libdir
(/usr/lib) to base_libdir (/lib).

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 meta/recipes-core/ncurses/ncurses.inc |   26 +++++++++++++++++---------
 1 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 583dad7..8c55631 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -26,6 +26,8 @@ ENABLE_WIDEC ?= "true"
 # builds.
 BUILD_CPPFLAGS += "-D_GNU_SOURCE"
 
+BUILD_LDFLAGS += "-Wl,-rpath,${base_libdir}"
+
 # Helper function for do_configure to allow multiple configurations
 # $1 the directory to run configure in
 # $@ the arguments to pass to configure
@@ -41,6 +43,7 @@ ncurses_configure() {
 	        --enable-hard-tabs \
 	        --enable-xmc-glitch \
 	        --enable-colorfgbg \
+	        --libdir=${base_libdir} \
 	        --with-termpath='${sysconfdir}/termcap:${datadir}/misc/termcap' \
 	        --with-terminfo-dirs='${sysconfdir}/terminfo:${datadir}/terminfo' \
 	        --with-shared \
@@ -120,7 +123,6 @@ do_install() {
         ! ${ENABLE_WIDEC} || \
             oe_runmake -C widec ${_install_opts}
 
-
         cd narrowc
 
         # include some basic terminfo files
@@ -155,28 +157,29 @@ do_install() {
         # else when '-Wl,--no-copy-dt-needed-entries' has been set in
         # linker flags.
         for i in libncurses libncursesw; do
-		f=${D}${libdir}/$i.so
+                f=${D}${base_libdir}/$i.so
                 test -h $f || continue
                 rm -f $f
                 echo '/* GNU ld script */'  >$f
                 echo "INPUT($i.so.5 AS_NEEDED(-ltinfo))" >>$f
         done
-	# Make sure that libcurses is linked so that it gets -ltinfo
-	# also, this should be addressed upstream really.
-	ln -sf libncurses.so ${D}${libdir}/libcurses.so
+
+        # Make sure that libcurses is linked so that it gets -ltinfo
+        # also, this should be addressed upstream really.
+        ln -sf libncurses.so ${D}${base_libdir}/libcurses.so
 
         # create libtermcap.so linker script for backward compatibility
-        f=${D}${libdir}/libtermcap.so
+        f=${D}${base_libdir}/libtermcap.so
         echo '/* GNU ld script */' >$f
         echo 'INPUT(AS_NEEDED(-ltinfo))' >>$f
 
-	oe_multilib_header curses.h
+        oe_multilib_header curses.h
 }
 
 python populate_packages_prepend () {
-        libdir = bb.data.expand("${libdir}", d)
+        base_libdir = bb.data.expand("${base_libdir}", d)
         pnbase = bb.data.expand("${PN}-lib%s", d)
-        do_split_packages(d, libdir, '^lib(.*)\.so\..*', pnbase, 'ncurses %s library', prepend=True, extra_depends = '', allow_links=True)
+        do_split_packages(d, base_libdir, '^lib(.*)\.so\..*', pnbase, 'ncurses %s library', prepend=True, extra_depends = '', allow_links=True)
 }
 
 
@@ -210,6 +213,10 @@ FILES_${PN} = "\
   ${datadir}/tabset \
 "
 
+FILES_${PN}-dev += "\
+ ${base_libdir}/*.so \
+"
+
 # This keeps only tput/tset in ncurses
 # clear/reset are in already busybox
 FILES_${PN}-tools = "\
@@ -223,6 +230,7 @@ FILES_${PN}-tools = "\
   ${bindir}/tack \
   ${bindir}/tabs \
 "
+
 # 'reset' is a symlink to 'tset' which is in the 'ncurses' package
 RDEPENDS_${PN}-tools = "${PN}"
 
-- 
1.7.6.4



