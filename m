Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1RiI58-0001Vq-B2
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 05:04:06 +0100
Received: from localhost (c-76-115-40-64.hsd1.or.comcast.net [76.115.40.64])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 3F8ED30227
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jan 2012 22:56:42 -0500 (EST)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jan 2012 19:56:51 -0800
Message-Id: <d6b83555761bcd968e26c8018d3567cbf0bb51db.1325649220.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1325649220.git.scott.a.garman@intel.com>
References: <cover.1325649220.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1325649220.git.scott.a.garman@intel.com>
References: <cover.1325649220.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 3F8ED30227.6857F
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 1/7] ncurses: move libraries to base_libdir
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
X-List-Received-Date: Wed, 04 Jan 2012 04:04:06 -0000

Various utilities (including bash and the util-linux programs) located
in base_bindir (/bin) or base_sbindir (/sbin) dynamically link against
many of the ncurses libraries. So move these libraries from libdir
(/usr/lib) to base_libdir (/lib).

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 meta/recipes-core/ncurses/ncurses.inc |   27 ++++++++++++++++++---------
 1 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 583dad7..8321d7b 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -26,6 +26,9 @@ ENABLE_WIDEC ?= "true"
 # builds.
 BUILD_CPPFLAGS += "-D_GNU_SOURCE"
 
+# tic from the -native build cannot run without setting this explicitly
+BUILD_LDFLAGS_virtclass-native += "-Wl,-rpath,${base_libdir}"
+
 # Helper function for do_configure to allow multiple configurations
 # $1 the directory to run configure in
 # $@ the arguments to pass to configure
@@ -41,6 +44,7 @@ ncurses_configure() {
 	        --enable-hard-tabs \
 	        --enable-xmc-glitch \
 	        --enable-colorfgbg \
+	        --libdir=${base_libdir} \
 	        --with-termpath='${sysconfdir}/termcap:${datadir}/misc/termcap' \
 	        --with-terminfo-dirs='${sysconfdir}/terminfo:${datadir}/terminfo' \
 	        --with-shared \
@@ -120,7 +124,6 @@ do_install() {
         ! ${ENABLE_WIDEC} || \
             oe_runmake -C widec ${_install_opts}
 
-
         cd narrowc
 
         # include some basic terminfo files
@@ -155,28 +158,29 @@ do_install() {
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
 
 
@@ -210,6 +214,10 @@ FILES_${PN} = "\
   ${datadir}/tabset \
 "
 
+FILES_${PN}-dev += "\
+ ${base_libdir}/*.so \
+"
+
 # This keeps only tput/tset in ncurses
 # clear/reset are in already busybox
 FILES_${PN}-tools = "\
@@ -223,6 +231,7 @@ FILES_${PN}-tools = "\
   ${bindir}/tack \
   ${bindir}/tabs \
 "
+
 # 'reset' is a symlink to 'tset' which is in the 'ncurses' package
 RDEPENDS_${PN}-tools = "${PN}"
 
-- 
1.7.5.4



