Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1ROPOF-0005ag-Bt
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2011 08:49:40 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 Nov 2011 23:43:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,488,1315206000"; d="scan'208";a="83351197"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.14])
	by fmsmga001.fm.intel.com with ESMTP; 09 Nov 2011 23:43:18 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Nov 2011 23:42:49 -0800
Message-Id: <d673f2619250d7f5872d9651b916c371f333d22f.1320910946.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1320910946.git.sgw@linux.intel.com>
References: <cover.1320910946.git.sgw@linux.intel.com>
In-Reply-To: <cover.1320910946.git.sgw@linux.intel.com>
References: <cover.1320910946.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL (v2) 07/33] ncurses: refactor configure to avoid configuring widec when disabled
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
X-List-Received-Date: Thu, 10 Nov 2011 07:49:40 -0000

From: Darren Hart <dvhart@linux.intel.com>

The ENABLE_WIDEC variable can be used to disable ncurses wide character support
when your C library doesn't support it. Currently, the do_configure step
configures for both narrow and wide characters regardless and only checks
ENABLE_WIDEC during compilation. This leads to QA failures with host
contamination during configure if the C library doesn't support wide characters.

Refactor do_configure with a new ncurses_configure helper function and only
configure for wide character support if ENABLE_WIDEC is true.

Ensure that configure errors are propogated back through to do_configure.

Tested with ENABLE_WIDEC as true and false via an ncurses bbappend on i586,
including basic error injection.

V2: INC_PR bump

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 meta/recipes-core/ncurses/ncurses.inc |   66 +++++++++++++++++---------------
 1 files changed, 35 insertions(+), 31 deletions(-)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index be7d387..df9252a 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://ncurses/base/version.c;beginline=1;endline=27;md5=cbc
 SECTION = "libs"
 DEPENDS = "ncurses-native"
 DEPENDS_virtclass-native = ""
-INC_PR = "r1"
+INC_PR = "r2"
 
 inherit autotools binconfig multilib_header
 
@@ -26,6 +26,36 @@ ENABLE_WIDEC = "true"
 # builds.
 BUILD_CPPFLAGS += "-D_GNU_SOURCE"
 
+# Helper function for do_configure to allow multiple configurations
+# $1 the directory to run configure in
+# $@ the arguments to pass to configure
+ncurses_configure() {
+	mkdir -p $1
+	cd $1
+	shift
+	oe_runconf \
+	        --disable-static \
+	        --without-debug \
+	        --without-ada \
+	        --without-gpm \
+	        --enable-hard-tabs \
+	        --enable-xmc-glitch \
+	        --enable-colorfgbg \
+	        --with-termpath='${sysconfdir}/termcap:${datadir}/misc/termcap' \
+	        --with-terminfo-dirs='${sysconfdir}/terminfo:${datadir}/terminfo' \
+	        --with-shared \
+	        --disable-big-core \
+	        --program-prefix= \
+	        --with-ticlib \
+	        --with-termlib=tinfo \
+	        --enable-sigwinch \
+	        --enable-pc-files \
+	        --disable-rpath-hack \
+	        --with-manpage-format=normal \
+	        "$@" || return 1
+	cd ..
+}
+
 # Override the function from the autotools class; ncurses requires a
 # patched autoconf213 to generate the configure script. This autoconf
 # is not available so that the shipped script will be used.
@@ -35,36 +65,10 @@ do_configure() {
         # not the case for /dev/null redirections)
         export cf_cv_working_poll=yes
 
-        for i in \
-        'narrowc' \
-        'widec   --enable-widec --without-progs'; do
-                set -- $i
-                mkdir -p $1
-                cd $1
-                shift
-
-                oe_runconf \
-                        --disable-static \
-                        --without-debug \
-                        --without-ada \
-                        --without-gpm \
-                        --enable-hard-tabs \
-                        --enable-xmc-glitch \
-                        --enable-colorfgbg \
-                        --with-termpath='${sysconfdir}/termcap:${datadir}/misc/termcap' \
-                        --with-terminfo-dirs='${sysconfdir}/terminfo:${datadir}/terminfo' \
-                        --with-shared \
-                        --disable-big-core \
-                        --program-prefix= \
-                        --with-ticlib \
-                        --with-termlib=tinfo \
-                        --enable-sigwinch \
-                        --enable-pc-files \
-                        --disable-rpath-hack \
-                        --with-manpage-format=normal \
-                        "$@"
-                cd ..
-        done
+	ncurses_configure "narrowc" || \
+		return 1
+	! ${ENABLE_WIDEC} || \
+		ncurses_configure "widec" "--enable-widec" "--without-progs"
 }
 
 do_compile() {
-- 
1.7.6.4



