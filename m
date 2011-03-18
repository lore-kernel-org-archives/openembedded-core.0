Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Q0cV3-00005q-KF
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Mar 2011 17:26:06 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 18 Mar 2011 09:24:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,205,1299484800"; d="scan'208";a="404761690"
Received: from nbuild2.sc.intel.com (HELO localhost) ([172.25.110.37])
	by azsmga001.ch.intel.com with ESMTP; 18 Mar 2011 09:24:17 -0700
Message-Id: <cc66cf92d7818af44e24f6ba0a5615e3e5e8ad44.1300465259.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1300465259.git.nitin.a.kamble@intel.com>
References: <cover.1300465259.git.nitin.a.kamble@intel.com>
Old-Date: Thu, 17 Mar 2011 10:25:04 -0700
Date: Fri, 18 Mar 2011  9:24:17 -0700
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Nitin A Kamble <nitin.a.kamble@intel.com>
Subject: [PATCH 6/7] coreutils-6.9: fix man page building for the gplv2 recipe
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
X-List-Received-Date: Fri, 18 Mar 2011 16:26:06 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Added a new patch:
   coreutils-6.9/fix_for_manpage_building.patch
And the target recipe now depends on the native recipe for the manpage
generation.

Similar fix may be needed to the GPLv3 version of this recipe.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../coreutils-6.9/fix_for_manpage_building.patch   |   83 ++++++++++++++++++++
 meta/recipes-core/coreutils/coreutils_6.9.bb       |   10 ++-
 2 files changed, 90 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-core/coreutils/coreutils-6.9/fix_for_manpage_building.patch

diff --git a/meta/recipes-core/coreutils/coreutils-6.9/fix_for_manpage_building.patch b/meta/recipes-core/coreutils/coreutils-6.9/fix_for_manpage_building.patch
new file mode 100644
index 0000000..67e1279
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils-6.9/fix_for_manpage_building.patch
@@ -0,0 +1,83 @@
+Use native coreutils binaries to build manpages in cross environment.
+This avoids man page build issues like this:
+
+| Making all in man
+| make[1]: Entering directory `/build_disk/poky_build/build1/tmp/work/i586-poky-linux/coreutils-6.9-r0/coreutils-6.9/man'
+| Updating man page cut.1
+| Updating man page dir.1
+| Updating man page expand.1
+| Updating man page fold.1
+| Updating man page install.1
+| Updating man page join.1
+| Updating man page pr.1
+| Updating man page ls.1
+| Updating man page sort.1
+| Updating man page unexpand.1
+| Updating man page uniq.1
+| Updating man page who.1
+| Updating man page vdir.1
+| help2man: can't get `--help' info from dir.td/dir
+| help2man: can't get `--help' info from cut.td/cut
+| make[1]: *** [dir.1] Error 126
+| make[1]: *** Waiting for unfinished jobs....
+| help2man: can't get `--help' info from fold.td/fold
+| help2man: can't get `--help' info from install.td/install
+| help2man: can't get `--help' info from expand.td/expand
+| help2man: can't get `--help' info from join.td/join
+| make[1]: *** [cut.1] Error 126
+| make[1]: *** [fold.1] Error 126
+| make[1]: *** [install.1] Error 126
+| help2man: can't get `--help' info from sort.td/sort
+| make[1]: *** [expand.1] Error 126
+| help2man: can't get `--help' info from pr.td/pr
+| make[1]: *** [join.1] Error 126
+| help2man: can't get `--help' info from ls.td/ls
+| help2man: can't get `--help' info from unexpand.td/unexpand
+| help2man: can't get `--help' info from uniq.td/uniq
+| help2man: can't get `--help' info from who.td/who
+| make[1]: *** [sort.1] Error 126
+| make[1]: *** [pr.1] Error 126
+| help2man: can't get `--help' info from vdir.td/vdir
+| make[1]: *** [ls.1] Error 126
+| make[1]: *** [uniq.1] Error 126
+| make[1]: *** [unexpand.1] Error 126
+| make[1]: *** [who.1] Error 126
+| make[1]: *** [vdir.1] Error 126
+| make[1]: Leaving directory `/build_disk/poky_build/build1/tmp/work/i586-poky-linux/coreutils-6.9-r0/coreutils-6.9/man'
+| make: *** [all-recursive] Error 1
+| FATAL: oe_runmake failed
+| ERROR: Function 'do_compile' failed (see /build_disk/poky_build/build1/tmp/work/i586-poky-linux/coreutils-6.9-r0/temp/log.do_compile.12780 for further information)
+NOTE: package coreutils-6.9-r0: task do_compile: Failed
+ERROR: Task 8 (/home/nitin/prj/poky.git/meta/recipes-core/coreutils/coreutils_6.9.bb, do_compile) failed with exit code '1'
+
+
+This patch is made for gplv2 coreutils the recipe
+Nitin A Kamble <nitin.a.kamble@intel.com>
+2011/03/17
+
+Index: man/Makefile.am
+===================================================================
+--- a/man.orig/Makefile.am
++++ b/man/Makefile.am
+@@ -167,7 +167,7 @@ mapped_name = `echo $*|sed 's/install/gi
+ 	            $(PERL) -- $(srcdir)/help2man		\
+ 	             --source='$(PACKAGE_STRING)'		\
+ 	             --include=$(srcdir)/$*.x			\
+-	             --output=$t/$@ $t/$*;			\
++	             --output=$t/$@ $*;			\
+ 	       }						\
+ 	    && sed 's|$*\.td/||g' $t/$@ > $@			\
+ 	    && chmod a-w $@					\
+Index: man/Makefile.in
+===================================================================
+--- a/man.orig/Makefile.in
++++ b/man/Makefile.in
+@@ -865,7 +865,7 @@ yes.1:		$(common_dep)	$(srcdir)/yes.x		.
+ 	            $(PERL) -- $(srcdir)/help2man		\
+ 	             --source='$(PACKAGE_STRING)'		\
+ 	             --include=$(srcdir)/$*.x			\
+-	             --output=$t/$@ $t/$*;			\
++	             --output=$t/$@ $*;			\
+ 	       }						\
+ 	    && sed 's|$*\.td/||g' $t/$@ > $@			\
+ 	    && chmod a-w $@					\
diff --git a/meta/recipes-core/coreutils/coreutils_6.9.bb b/meta/recipes-core/coreutils/coreutils_6.9.bb
index 60ea903..2d7fded 100644
--- a/meta/recipes-core/coreutils/coreutils_6.9.bb
+++ b/meta/recipes-core/coreutils/coreutils_6.9.bb
@@ -8,12 +8,13 @@ BUGTRACKER = "http://debbugs.gnu.org/coreutils"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
                     file://src/ls.c;startline=4;endline=16;md5=482a96d4f25010a4e13f8743e0c3685e"
-PR = "r0"
-DEPENDS = "perl-native"
+PR = "r1"
+DEPENDS = "perl-native coreutils-native-${PV} gettext "
+DEPENDS_virtclass-native = "perl-native gettext-native"
 
 inherit autotools gettext
 
-SRC_URI = "http://ftp.gnu.org/gnu/coreutils/${BP}.tar.bz2 \
+SRC_URI_BASE = "http://ftp.gnu.org/gnu/coreutils/${BP}.tar.bz2 \
            file://gnulib_m4.patch \
            file://futimens.patch \
            file://coreutils-ls-x.patch \
@@ -23,6 +24,9 @@ SRC_URI = "http://ftp.gnu.org/gnu/coreutils/${BP}.tar.bz2 \
            file://coreutils-fix-install.patch \
            file://man-touch.patch"
 
+SRC_URI = "${SRC_URI_BASE} file://fix_for_manpage_building.patch"
+SRC_URI_virtclass-native = "${SRC_URI_BASE}"
+
 # [ gets a special treatment and is not included in this
 bindir_progs = "base64 basename cksum comm csplit cut dir dircolors dirname du \
                 env expand expr factor fmt fold groups head hostid id install \
-- 
1.7.3.4



