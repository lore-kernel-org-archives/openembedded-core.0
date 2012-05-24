Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXQ2h-00056a-G0
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 06:52:55 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 23 May 2012 21:42:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="144034679"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.24])
	by orsmga001.jf.intel.com with ESMTP; 23 May 2012 21:42:42 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 May 2012 21:42:17 -0700
Message-Id: <28942804a08a959caee7e841e7b97e6b70df1853.1337834073.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1337834073.git.sgw@linux.intel.com>
References: <cover.1337834073.git.sgw@linux.intel.com>
In-Reply-To: <cover.1337834073.git.sgw@linux.intel.com>
References: <cover.1337834073.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 14/28] ncurses: Avoid occasional builling failure when having parallel processable task
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
X-List-Received-Date: Thu, 24 May 2012 04:52:56 -0000

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

ncurses failure non-gplv3 build (race issue) like the following \
error information:

| tic: error while loading shared libraries: /srv/home/pokybuild \
/yocto-autobuilder/yocto-slave/nightly-non-gpl3/build/build/tmp/\
work/x86_64-linux/ncurses-native-5.9-r8.1/ncurses-5.9/narrowc/lib\
/libtinfo.so.5: file too short
| ? tic could not build /srv/home/pokybuild/yocto-autobuilder/\
yocto-slave/nightly-non-gpl3/build/build/tmp/work/x86_64-linux/\
ncurses-native-5.9-r8.1/image/srv/home/pokybuild/yocto-autobuilder\
/yocto-slave/nightly-non-gpl3/build/build/tmp/sysroots/x86_64-linux\
/usr/share/terminfo
| make[1]: *** [install.data] Error 1

This is a race issue which is caused by
install.libs and install.data:

1) install.data needs run tic
2) tic needs libtinfo.so
3) install.libs would regenerate libtinfo.so
4) but install.data doesn't depend on install.libs, and they can run
   parallelly

So there would be errors in a very critical condition: tic is begining
to run at the same time when install.libs is generating libtinfo.so, and
this libtinfo.so is not integrity, then there would be the  above error.

Let task install.libs run before install.data for fixing this bug.

[YOCTO #2298]

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/recipes-core/ncurses/ncurses.inc |   23 ++++++++++++++++++-----
 1 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index ae99e2c..b031119 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://ncurses/base/version.c;beginline=1;endline=27;md5=cbc
 SECTION = "libs"
 DEPENDS = "ncurses-native"
 DEPENDS_virtclass-native = ""
-INC_PR = "r8"
+INC_PR = "r9"
 
 inherit autotools binconfig multilib_header
 
@@ -107,10 +107,15 @@ do_test() {
         diff curses-narrowc.h curses-widec.h
 }
 
+# Split original _install_opts to two parts.
+# One is the options to install contents, the other is the parameters \
+# when running command "make install"
 _install_opts = "\
+  install.libs install.includes install.man \
+"
+_install_cfgs = "\
   DESTDIR='${D}' \
   PKG_CONFIG_LIBDIR='${libdir}/pkgconfig' \
-  install.libs install.includes install.man \
 "
 
 python do_install () {
@@ -122,11 +127,19 @@ shell_do_install() {
         # Order of installation is important; widec installs a 'curses.h'
         # header with more definitions and must be installed last hence.
         # Compatibility of these headers will be checked in 'do_test()'.
-        oe_runmake -C narrowc ${_install_opts} \
-                install.data install.progs
+        oe_runmake -C narrowc ${_install_cfgs} ${_install_opts} \
+                install.progs
+
+        # The install.data should run after install.libs, otherwise
+        # there would be a race issue in a very critical conditon, since
+        # tic will be run by install.data, and tic needs libtinfo.so
+        # which would be regenerated by install.libs.
+        oe_runmake -C narrowc ${_install_cfgs} \
+                install.data
+
 
         ! ${ENABLE_WIDEC} || \
-            oe_runmake -C widec ${_install_opts}
+            oe_runmake -C widec ${_install_cfgs} ${_install_opts}
 
         cd narrowc
 
-- 
1.7.7.6



