Return-Path: <anibal.limon@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 42D2E75C51
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 21:18:02 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP; 26 May 2016 14:18:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,370,1459839600"; d="scan'208";a="111191754"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.164])
	by fmsmga004.fm.intel.com with ESMTP; 26 May 2016 14:18:03 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 May 2016 16:18:45 -0500
Message-Id: <1464297525-16174-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH] dpkg: Upgrade to 1.18.7
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
X-List-Received-Date: Thu, 26 May 2016 21:18:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Rebased patches:

0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch
add_armeb_triplet_entry.patchadd_armeb_triplet_entry.patch

Patches removed already in upstream:

	[1] 0001-When-running-do_package_write_deb-we-have-trees-of-h.patch
	[2] fix-abs-redefine.patch

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>

[1] https://anonscm.debian.org/cgit/dpkg/dpkg.git/commit/dpkg-deb/build.c?id=7a91341446851cd3594a8b752823b8c1f26d652a
[2] https://anonscm.debian.org/cgit/dpkg/dpkg.git/commit/lib/dpkg/i18n.h?id=ecd4baa091619cbbdd70043129dd992573580371
---
 meta/recipes-devtools/dpkg/dpkg.inc                |  2 -
 ...g-do_package_write_deb-we-have-trees-of-h.patch | 71 ----------------------
 ...tinsts-expect-D-to-be-set-when-running-in.patch | 36 +++++++----
 .../dpkg/dpkg/add_armeb_triplet_entry.patch        | 22 ++++---
 .../dpkg/dpkg/fix-abs-redefine.patch               | 40 ------------
 .../dpkg/{dpkg_1.18.4.bb => dpkg_1.18.7.bb}        |  6 +-
 6 files changed, 40 insertions(+), 137 deletions(-)
 delete mode 100644 meta/recipes-devtools/dpkg/dpkg/0001-When-running-do_package_write_deb-we-have-trees-of-h.patch
 delete mode 100644 meta/recipes-devtools/dpkg/dpkg/fix-abs-redefine.patch
 rename meta/recipes-devtools/dpkg/{dpkg_1.18.4.bb => dpkg_1.18.7.bb} (79%)

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index 3d9e7e3..c2215ce 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -4,8 +4,6 @@ SECTION = "base"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/d/dpkg/dpkg_${PV}.tar.xz"
 
-SRC_URI_append_class-native = " file://0001-When-running-do_package_write_deb-we-have-trees-of-h.patch"
-
 DEPENDS = "zlib bzip2 perl ncurses"
 DEPENDS_class-native = "bzip2-replacement-native zlib-native virtual/update-alternatives-native gettext-native perl-native"
 RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives} xz run-postinsts perl"
diff --git a/meta/recipes-devtools/dpkg/dpkg/0001-When-running-do_package_write_deb-we-have-trees-of-h.patch b/meta/recipes-devtools/dpkg/dpkg/0001-When-running-do_package_write_deb-we-have-trees-of-h.patch
deleted file mode 100644
index 49ef853..0000000
--- a/meta/recipes-devtools/dpkg/dpkg/0001-When-running-do_package_write_deb-we-have-trees-of-h.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From e391bdba238d1371fc5b67cdae08b06eb5ada5c2 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 26 Aug 2015 15:48:13 +0300
-Subject: [PATCH] When running do_package_write_deb, we have trees of
- hardlinked files such as the dbg source files in ${PN}-dbg. If something
- makes another copy of one of those files (or deletes one), the number of
- links a file has changes and tar can notice this, e.g.:
-
-| DEBUG: Executing python function do_package_deb
-| dpkg-deb: building package `sed-ptest' in `/media/build1/poky/build/tmp/work/i586-poky-linux/sed/4.2.2-r0/deploy-debs/i586/sed-ptest_4.2.2-r0.3_i386.deb'.
-| tar: ./usr/lib/sed/ptest/testsuite/tst-regex2: file changed as we read it
-| dpkg-deb: error: subprocess tar -cf returned error exit status 1
-
-Tar returns an error of 1 when files 'change' and other errors codes
-in other error cases. We tweak dpkg-deb here so that it ignores an exit
-code of 1 from tar. The files don't really change (and we have locking in
-place to avoid that kind of issue).
-
-Upstream-Status: Inappropriate
-RP 2015/3/27
----
- dpkg-deb/build.c | 12 ++++++++----
- 1 file changed, 8 insertions(+), 4 deletions(-)
-
-diff --git a/dpkg-deb/build.c b/dpkg-deb/build.c
-index 2ddeec6..af363f0 100644
---- a/dpkg-deb/build.c
-+++ b/dpkg-deb/build.c
-@@ -452,7 +452,7 @@ static void
- tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
-              struct compress_params *tar_compress_params, int fd_out)
- {
--  int pipe_filenames[2], pipe_tarball[2];
-+  int pipe_filenames[2], pipe_tarball[2], rc;
-   pid_t pid_tar, pid_comp;
- 
-   /* Fork off a tar. We will feed it a list of filenames on stdin later. */
-@@ -493,7 +493,9 @@ tarball_pack(const char *dir, filenames_feed_func *tar_filenames_feeder,
-   /* All done, clean up wait for tar and <compress> to finish their job. */
-   close(pipe_filenames[1]);
-   subproc_reap(pid_comp, _("<compress> from tar -cf"), 0);
--  subproc_reap(pid_tar, "tar -cf", 0);
-+  rc = subproc_reap(pid_tar, "tar -cf", SUBPROC_RETERROR);
-+  if (rc && rc != 1)
-+    ohshite(_("subprocess %s returned error exit status %d"), "tar -cf", rc);
- }
- 
- /**
-@@ -509,7 +511,7 @@ do_build(const char *const *argv)
-   char *debar;
-   char *tfbuf;
-   int arfd;
--  int p1[2], gzfd;
-+  int p1[2], gzfd, rc;
-   pid_t c1, c2;
- 
-   /* Decode our arguments. */
-@@ -590,7 +592,9 @@ do_build(const char *const *argv)
-   }
-   close(p1[0]);
-   subproc_reap(c2, _("<compress> from tar -cf"), 0);
--  subproc_reap(c1, "tar -cf", 0);
-+  rc = subproc_reap(c1, "tar -cf", SUBPROC_RETERROR);
-+  if (rc && rc != 1)
-+    ohshite(_("subprocess %s returned error exit status %d"), "tar -cf", rc);
- 
-   if (lseek(gzfd, 0, SEEK_SET))
-     ohshite(_("failed to rewind temporary file (%s)"), _("control member"));
--- 
-2.7.0
-
diff --git a/meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch b/meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch
index 9f77c6c..80504ce 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch
@@ -8,30 +8,41 @@ Subject: [PATCH 3/5] Our pre/postinsts expect $D to be set when running in a
 Upstream-Status: Inappropriate [OE Specific]
 
 RP 2011/12/07
+ALIMON 2016/05/26
+
 ---
- src/script.c | 31 ++-----------------------------
- 1 file changed, 2 insertions(+), 29 deletions(-)
+ src/script.c | 39 +++------------------------------------
+ 1 file changed, 3 insertions(+), 36 deletions(-)
 
 diff --git a/src/script.c b/src/script.c
-index a958145..24c49f9 100644
+index 3c88be8..ce66a86 100644
 --- a/src/script.c
 +++ b/src/script.c
-@@ -100,36 +100,9 @@ maintscript_pre_exec(struct command *cmd)
- 	size_t instdirl = strlen(instdir);
- 
- 	if (*instdir) {
+@@ -97,43 +97,10 @@ setexecute(const char *path, struct stat *stab)
+ static const char *
+ maintscript_pre_exec(struct command *cmd)
+ {
+-	const char *admindir = dpkg_db_get_dir();
+-	const char *changedir = fc_script_chrootless ? instdir : "/";
+-	size_t instdirl = strlen(instdir);
+-
+-	if (*instdir && !fc_script_chrootless) {
 -		if (strncmp(admindir, instdir, instdirl) != 0)
 -			ohshit(_("admindir must be inside instdir for dpkg to work properly"));
 -		if (setenv("DPKG_ADMINDIR", admindir + instdirl, 1) < 0)
 -			ohshite(_("unable to setenv for subprocesses"));
+-		if (setenv("DPKG_ROOT", "", 1) < 0)
+-			ohshite(_("unable to setenv for subprocesses"));
 -
 -		if (chroot(instdir))
 -			ohshite(_("failed to chroot to '%.250s'"), instdir);
--	}
++	if (*instdir) {
++		setenv("D", instdir, 1);
+ 	}
 -	/* Switch to a known good directory to give the maintainer script
 -	 * a saner environment, also needed after the chroot(). */
--	if (chdir("/"))
--		ohshite(_("failed to chdir to '%.255s'"), "/");
+-	if (chdir(changedir))
+-		ohshite(_("failed to chdir to '%.255s'"), changedir);
 -	if (debug_has_flag(dbg_scripts)) {
 -		struct varbuf args = VARBUF_INIT;
 -		const char **argv = cmd->argv;
@@ -44,9 +55,8 @@ index a958145..24c49f9 100644
 -		debug(dbg_scripts, "fork/exec %s (%s )", cmd->filename,
 -		      args.buf);
 -		varbuf_destroy(&args);
-+		setenv("D", instdir, 1);
- 	}
--	if (!instdirl)
+-	}
+-	if (!instdirl || fc_script_chrootless)
 -		return cmd->filename;
 -
 -	assert(strlen(cmd->filename) >= instdirl);
diff --git a/meta/recipes-devtools/dpkg/dpkg/add_armeb_triplet_entry.patch b/meta/recipes-devtools/dpkg/dpkg/add_armeb_triplet_entry.patch
index af275de..dc69eb2 100644
--- a/meta/recipes-devtools/dpkg/dpkg/add_armeb_triplet_entry.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/add_armeb_triplet_entry.patch
@@ -25,14 +25,22 @@ Upstream-Status: Pending
 
 Signed-off-by: Krishnanjanappa, Jagadeesh <jagadeesh.krishnanjanappa@caviumnetworks.com>
 
-diff -Naurp dpkg-1.17.21_org/triplettable dpkg-1.17.21/triplettable
---- dpkg-1.17.21_org/triplettable	2015-04-08 17:08:52.370759171 +0530
-+++ dpkg-1.17.21/triplettable	2015-04-08 17:09:12.406752081 +0530
-@@ -9,6 +9,7 @@ musleabihf-linux-arm	musl-linux-armhf
- musl-linux-<cpu>	musl-linux-<cpu>
- gnueabihf-linux-arm	armhf
+---
+ triplettable | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/triplettable b/triplettable
+index abe4726..1e9c247 100644
+--- a/triplettable
++++ b/triplettable
+@@ -11,6 +11,7 @@ gnueabihf-linux-arm	armhf
  gnueabi-linux-arm	armel
+ gnuabin32-linux-mips64r6el	mipsn32r6el
+ gnuabin32-linux-mips64r6	mipsn32r6
 +gnueabi-linux-armeb	armeb
  gnuabin32-linux-mips64el	mipsn32el
  gnuabin32-linux-mips64	mipsn32
- gnuabi64-linux-mips64el	mips64el
+ gnuabi64-linux-mips64r6el	mips64r6el
+-- 
+2.1.4
+
diff --git a/meta/recipes-devtools/dpkg/dpkg/fix-abs-redefine.patch b/meta/recipes-devtools/dpkg/dpkg/fix-abs-redefine.patch
deleted file mode 100644
index e73311c..0000000
--- a/meta/recipes-devtools/dpkg/dpkg/fix-abs-redefine.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-Upstream-Status: Pending
-
-dpkg defines:
-#define DPKG_BEGIN_DECLS	extern "C" {
-
-That makes header cstdlib included in a extern "C" block which is not supported
-by gcc 4.8. It fails on Fedora 19:
-
-/usr/include/c++/4.8.1/cstdlib: In function ‘long long int std::abs(long long int)’:
-/usr/include/c++/4.8.1/cstdlib:174:20: error: declaration of C function ‘long long int std::abs(long long int)’ conflicts with
-   abs(long long __x) { return __builtin_llabs (__x); }
-                    ^
-/usr/include/c++/4.8.1/cstdlib:166:3: error: previous declaration ‘long int std::abs(long int)’ here
-   abs(long __i) { return __builtin_labs(__i); }
-   ^
-
-Move include gettext.h out of the extern "C" block to fix this issue.
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
---- dpkg-1.17.1/lib/dpkg/i18n.h.orig	2013-08-13 17:31:28.870935573 +0800
-+++ dpkg-1.17.1/lib/dpkg/i18n.h	2013-08-13 17:31:37.893065249 +0800
-@@ -23,8 +23,6 @@
- 
- #include <dpkg/macros.h>
- 
--DPKG_BEGIN_DECLS
--
- /**
-  * @defgroup i18n Internationalization support
-  * @ingroup dpkg-internal
-@@ -33,6 +31,8 @@
- 
- #include <gettext.h>
- 
-+DPKG_BEGIN_DECLS
-+
- /* We need to include this because pgettext() uses LC_MESSAGES, but libintl.h
-  * which gets pulled by gettext.h only includes it if building optimized. */
- #include <locale.h>
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.18.4.bb b/meta/recipes-devtools/dpkg/dpkg_1.18.7.bb
similarity index 79%
rename from meta/recipes-devtools/dpkg/dpkg_1.18.4.bb
rename to meta/recipes-devtools/dpkg/dpkg_1.18.7.bb
index 7876944..5375923 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.18.4.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.18.7.bb
@@ -4,7 +4,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SRC_URI_append_class-native =" file://glibc2.5-sync_file_range.patch "
 SRC_URI += "file://noman.patch \
             file://remove-tar-no-timestamp.patch \
-            file://fix-abs-redefine.patch \
             file://arch_pm.patch \
             file://dpkg-configure.service \
             file://add_armeb_triplet_entry.patch \
@@ -15,6 +14,5 @@ SRC_URI += "file://noman.patch \
 	    file://0006-add-musleabi-to-known-target-tripets.patch \
            "
 
-SRC_URI[md5sum] = "e95b513c89693f6ec3ab53b6b1c3defd"
-SRC_URI[sha256sum] = "fe89243868888ce715bf45861f26264f767d4e4dbd0d6f1a26ce60bbbbf106da"
-
+SRC_URI[md5sum] = "073dbf2129a54b0fc627464bf8af4a1b"
+SRC_URI[sha256sum] = "ace36d3a6dc750a42baf797f9e75ec580a21f92bb9ff96b482100755d6d9b87b"
-- 
2.1.4


