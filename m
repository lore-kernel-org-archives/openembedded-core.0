Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RTWKT-000652-0n
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Nov 2011 11:14:53 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 24 Nov 2011 02:08:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,564,1315206000"; d="scan'208";a="78785632"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.50])
	by azsmga001.ch.intel.com with ESMTP; 24 Nov 2011 02:08:17 -0800
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Nov 2011 18:08:14 +0800
Message-Id: <581c2b3527336aaa4430c74f11b10a83bf996426.1322128490.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1322128489.git.dexuan.cui@intel.com>
References: <cover.1322128489.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1322128489.git.dexuan.cui@intel.com>
References: <cover.1322128489.git.dexuan.cui@intel.com>
Subject: [PATCH 4/4] coreutils: build and install hostname
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
X-List-Received-Date: Thu, 24 Nov 2011 10:14:54 -0000

busybox's hostname doesn't work with pseudo somehow, so let's use the version
of coreutils. This is needed for the self-hosted-image work.

Also add a patch to disable building the doc and manual: we don't really need
them and this causes compilation error in the cross-compiling case.

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../coreutils/coreutils-8.14/disable_doc_man.patch |   36 ++++++++++++++++++++
 meta/recipes-core/coreutils/coreutils_8.14.bb      |    9 +++--
 2 files changed, 41 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-core/coreutils/coreutils-8.14/disable_doc_man.patch

diff --git a/meta/recipes-core/coreutils/coreutils-8.14/disable_doc_man.patch b/meta/recipes-core/coreutils/coreutils-8.14/disable_doc_man.patch
new file mode 100644
index 0000000..c9dc92c
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils-8.14/disable_doc_man.patch
@@ -0,0 +1,36 @@
+Upstream-Status: Inappropriate [embedded specific]
+
+We don't really need to build the doc and manual.
+
+Morever, we get this failure in do_compile:
+help2man: can't get `--help' info from hostname.td/hostname
+
+This is because help2man tries to invoke "hostname --help", but in the
+cross-compile case, the target binary may not be execuable on the host.
+
+Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
+
+diff -Nru coreutils-8.14/Makefile.am coreutils-8.14/Makefile.am
+--- coreutils-8.14.orig/Makefile.am	2011-10-10 15:30:55.000000000 +0800
++++ coreutils-8.14/Makefile.am	2011-11-24 17:29:26.398593744 +0800
+@@ -17,7 +17,7 @@
+ 
+ ALL_RECURSIVE_TARGETS =
+ 
+-SUBDIRS = lib src doc man po tests gnulib-tests
++SUBDIRS = lib src po tests gnulib-tests
+ 
+ changelog_etc =				\
+   ChangeLog-2005			\
+diff -Nru coreutils-8.14.orig/Makefile.in coreutils-8.14/Makefile.in
+--- coreutils-8.14.orig/Makefile.in	2011-10-12 17:21:46.000000000 +0800
++++ coreutils-8.14/Makefile.in	2011-11-24 17:29:14.868593748 +0800
+@@ -1453,7 +1453,7 @@
+ 
+ # Some tests always need root privileges, others need them only sometimes.
+ ALL_RECURSIVE_TARGETS = install-root check-root distcheck-hook
+-SUBDIRS = lib src doc man po tests gnulib-tests
++SUBDIRS = lib src po tests gnulib-tests
+ changelog_etc = \
+   ChangeLog-2005			\
+   ChangeLog-2006			\
diff --git a/meta/recipes-core/coreutils/coreutils_8.14.bb b/meta/recipes-core/coreutils/coreutils_8.14.bb
index 01face0..ec41fe2 100644
--- a/meta/recipes-core/coreutils/coreutils_8.14.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.14.bb
@@ -7,7 +7,7 @@ BUGTRACKER = "http://debbugs.gnu.org/coreutils"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504\
                     file://src/ls.c;startline=5;endline=16;md5=e1a509558876db58fb6667ba140137ad"
-PR = "r1"
+PR = "r2"
 DEPENDS = "gmp"
 DEPENDS_virtclass-native = ""
 
@@ -15,10 +15,13 @@ inherit autotools gettext
 
 SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://remove-usr-local-lib-from-m4.patch \
+           file://disable_doc_man.patch \
           "
 SRC_URI[md5sum] = "bcb135ce553493a45aba01b39eb3920a"
 SRC_URI[sha256sum] = "0d120817c19292edb19e92ae6b8eac9020e03d51e0af9cb116cf82b65d18b02d"
 
+EXTRA_OECONF += "--enable-install-program=hostname"
+
 EXTRA_OECONF_virtclass-native = "--without-gmp"
 
 # [ gets a special treatment and is not included in this
@@ -29,9 +32,8 @@ bindir_progs = "base64 basename chcon cksum comm csplit cut dir dircolors dirnam
                 sha384sum sha512sum shred shuf sort split stat stdbuf sum tac tail tee test timeout\
                 tr truncate tsort tty unexpand uniq unlink uptime users vdir wc who whoami yes df"
 
-# hostname gets a special treatment and is not included in this
 base_bindir_progs = "cat chgrp chmod chown cp date dd echo false kill ln ls mkdir \
-                     mknod mv pwd rm rmdir sleep stty sync touch true uname"
+                     mknod mv pwd rm rmdir sleep stty sync touch true uname hostname"
 
 sbindir_progs= "chroot"
 
@@ -71,7 +73,6 @@ pkg_prerm_${PN} () {
 	for i in ${sbindir_progs}; do update-alternatives --remove $i $i.${PN}; done
 
 	# The special cases
-	update-alternatives --remove hostname hostname.${PN}
 	update-alternatives --remove uptime uptime.${PN}
 	update-alternatives --remove '[' 'lbracket.${PN}'
 }
-- 
1.7.6



