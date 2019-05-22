Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id CF2987E3B8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 10:58:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 4588kw5gN7z4q
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 12:58:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1558522728;
	bh=DtiCx6eAaVe02dh5YCy8QGvN/O990hpA5BkLc08ea98=;
	h=From:To:Subject:Date:From;
	b=oKXeQAbAGeFfkjic3uO7X2s75W11sXcgWTgaZTn46HTru0SWzmeEQdWoXKqgc6+iW
	8TdYOSVVVFOBV14Hj6gnZqEPqyRC3EbRD8pU21MfK4MIZwrxQhtSIwt4aBSH1O/pdK
	lxuWEDafXZJCnv2IElxogswxQg3Y6TgmkdMErKdnZ6FdFg5UTLcl+jV3We7h9mNtXK
	WGmk4gpHbCEBqPA8MJS40+Mwqcb8CyePK3h9e3b4h0C+zfK3m1uUnZUZW1e4hMbxqn
	2qjR+yYV82J1G3l7Y0xWVmpsw6HQFMaXXlP1zLWht214zMfETo3dsoFVQObWpxIgjH
	sAoNNpIYAJ+habtT7FFr6kc+tBRQHx42pwOJAhWorSvOw3i63Psbkgh/FbykbxfneS
	BXttGy4qSurRC7SytlhX8tSxARohFaOh7vsDxuXQJopeWqJM8+3R2fRFPiDTUOyAtP
	yBajWVlwocEiLEFwJNLnK2lTo2xFtHjM2SthzqtgSHDjlWGkEVZ7pPbtUbE9K6+D9F
	jWQxzfA16vU48XUjKAGMFY9wrQ8GMPrkifTlQex2Yc8pnRytJrYUJ5X0V7fyJ4w7ec
	ViIO6w82hXo0k3JEBrXsr1bOi5x5zAKUqBqtFO0FNxGV5JwCbuN2ESLowEfJMFYrnY
	EWWs9dZkaEbvu/khl4fEZYK4=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 May 2019 13:58:46 +0300
Message-Id: <20190522105847.6512-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] dpkg: Remove workaround patches for no longer supported host distributions
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
X-List-Received-Date: Wed, 22 May 2019 10:58:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../0005-dpkg-compiler.m4-remove-Wvla.patch   |  40 -------
 .../dpkg/dpkg/glibc2.5-sync_file_range.patch  | 100 ------------------
 meta/recipes-devtools/dpkg/dpkg_1.19.4.bb     |   3 +-
 3 files changed, 1 insertion(+), 142 deletions(-)
 delete mode 100644 meta/recipes-devtools/dpkg/dpkg/0005-dpkg-compiler.m4-remove-Wvla.patch
 delete mode 100644 meta/recipes-devtools/dpkg/dpkg/glibc2.5-sync_file_range.patch

diff --git a/meta/recipes-devtools/dpkg/dpkg/0005-dpkg-compiler.m4-remove-Wvla.patch b/meta/recipes-devtools/dpkg/dpkg/0005-dpkg-compiler.m4-remove-Wvla.patch
deleted file mode 100644
index b368508862..0000000000
--- a/meta/recipes-devtools/dpkg/dpkg/0005-dpkg-compiler.m4-remove-Wvla.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 0ad7bba80d5b9035089ff2b2f77a774b5b201915 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 26 Aug 2015 16:28:59 +0300
-Subject: [PATCH 5/5] dpkg-compiler.m4: remove -Wvla
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Remove the -Wvla flag from the set of compiler warning flags, since gcc
-on old host systems such as CentOS 5.8 doesn't support it, and it
-causes a build error for dpkg-native.
-
-Upstream-Status: Pending
-
-Signed-off-by: Donn Seeley <donn.seeley@windriver.com>
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
-
-Update patch context for dpkg 1.19.4.
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
- m4/dpkg-compiler.m4 | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/m4/dpkg-compiler.m4 b/m4/dpkg-compiler.m4
-index a6192f6..4c7bf2e 100644
---- a/m4/dpkg-compiler.m4
-+++ b/m4/dpkg-compiler.m4
-@@ -67,7 +67,6 @@ AC_DEFUN([DPKG_CHECK_COMPILER_WARNINGS], [
-   DPKG_CHECK_COMPILER_FLAG([-Wshift-negative-value])
-   DPKG_CHECK_COMPILER_FLAG([-Wsizeof-array-argument])
-   DPKG_CHECK_COMPILER_FLAG([-Wswitch-bool])
--  DPKG_CHECK_COMPILER_FLAG([-Wvla])
-   DPKG_CHECK_COMPILER_FLAG([-Wwrite-strings])
- 
-   AC_LANG_CASE(
--- 
-2.1.4
-
diff --git a/meta/recipes-devtools/dpkg/dpkg/glibc2.5-sync_file_range.patch b/meta/recipes-devtools/dpkg/dpkg/glibc2.5-sync_file_range.patch
deleted file mode 100644
index 5debcc5209..0000000000
--- a/meta/recipes-devtools/dpkg/dpkg/glibc2.5-sync_file_range.patch
+++ /dev/null
@@ -1,100 +0,0 @@
-From 9d260d408f9e17abd1d1dccd685bd7e80a3655a9 Mon Sep 17 00:00:00 2001
-From: Donn Seeley <donn.seeley@windriver.com>
-Date: Tue, 25 Feb 2014 17:44:04 +0800
-Subject: [PATCH] dpkg: fix a link problem for dpkg-native on CentOS 5.8
-
-CentOS 5.8 kernels and headers support the sync_file_range() system call,
-but glibc 2.5 doesn't provide the syscall stub.  It appears that this
-problem is known but will never be fixed:
-
-  https://bugzilla.redhat.com/show_bug.cgi?id=518581
-
-  Bug 518581 - [RHEL5] glibc misses sync_file_range syscall interface
-
-  Status:       CLOSED CANTFIX
-  Last Closed:  2009-11-22 22:19:55
-
-  Kirby Zhou 2009-08-20 23:37:55 EDT
-
-  Description of problem:
-
-  glibc misses sync_file_range syscall interface.  The header file and
-  man page both say 'sync_file_range' should exist.  From man page,
-  sync_file_range should exist sinc kernel-2.6.17
-
-  Andreas Schwab 2009-08-21 03:24:24 EDT
-
-  It has only been added to glibc 2.6, and cannot be backported due to
-  ABI breakage.  You can always fall back to syscall(3).
-
-  Ulrich Drepper 2009-11-22 22:19:55 EST
-
-  As comment #1 says, no chance to backport this.
-
-  See the syscall man page for instructions.
-
-  Jon E 2010-03-19 10:32:37 EDT
-
-  then why document it if it's broken and you're not going to fix it?
-  .. might want to FTFM over at sync_file_range(2) - in the meantime -
-  borrowing from glibc 2.6 .. any thoughts on this implementation for a
-  hacky workaround for those still on your "ancient releases" .. (eg:
-  RHEL5.3)?:
-
-  #ifdef ULI_WONT_FIX_THIS_IN_GLIBC2.5
-  #define NR_sync_file_range 277
-  int sync_file_range (int fd, __off64_t from, __off64_t to, unsigned int flags)
-  {
-    return syscall (NR_sync_file_range, fd,
-                           __LONG_LONG_PAIR ((long) (from >> 32), (long) from),
-                           __LONG_LONG_PAIR ((long) (to >> 32), (long) to),
-                           flags);
-  }
-  #endif
-
-  assuming of course that you're on an x86_64 and include/asm-
-  x86_64/unistd.h has the correct entry
-
-  (fwiw - fio is starting to use this now)
-
-Rather than attempting to provide an implementation using syscall(),
-we take the more conservative route and ignore header support for
-sync_file_range() flags when the glibc version is <= 2.5.
-
-Upstream-Status: Inappropriate [everyone else builds on newer hosts :-)]
-
-Signed-off-by: Donn Seeley <donn.seeley@windriver.com>
-Signed-off-by: Lei Liu <lei.liu2@windriver.com>
-
-Update patch context for dpkg 1.19.4.
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
- src/archives.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/archives.c b/src/archives.c
-index 8476a5c..b05a63f 100644
---- a/src/archives.c
-+++ b/src/archives.c
-@@ -68,7 +68,7 @@ fd_writeback_init(int fd)
-   /* Ignore the return code as it should be considered equivalent to an
-    * asynchronous hint for the kernel, we are doing an fsync() later on
-    * anyway. */
--#if defined(SYNC_FILE_RANGE_WRITE)
-+#if defined(SYNC_FILE_RANGE_WRITE) && __GLIBC_PREREQ(2, 6)
-   sync_file_range(fd, 0, 0, SYNC_FILE_RANGE_WRITE);
- #elif defined(HAVE_POSIX_FADVISE)
-   posix_fadvise(fd, 0, 0, POSIX_FADV_DONTNEED);
-@@ -1093,7 +1093,7 @@ tarobject(struct tar_archive *tar, struct tar_entry *ti)
-   return 0;
- }
- 
--#if defined(SYNC_FILE_RANGE_WAIT_BEFORE)
-+#if defined(SYNC_FILE_RANGE_WAIT_BEFORE) && __GLIBC_PREREQ(2, 6)
- static void
- tar_writeback_barrier(struct fsys_namenode_list *files, struct pkginfo *pkg)
- {
--- 
-2.16.2
-
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.19.4.bb b/meta/recipes-devtools/dpkg/dpkg_1.19.4.bb
index c3dbda77a4..77fbfb5c91 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.19.4.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.19.4.bb
@@ -9,12 +9,11 @@ SRC_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/${BPN}_${PV}.tar.xz \
            file://0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch \
            file://0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch \
            file://0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch \
-           file://0005-dpkg-compiler.m4-remove-Wvla.patch \
            file://0006-add-musleabi-to-known-target-tripets.patch \
            file://0007-dpkg-deb-build.c-Remove-usage-of-clamp-mtime-in-tar.patch \
            file://0001-dpkg-Support-muslx32-build.patch \
            "
-SRC_URI_append_class-native = " file://glibc2.5-sync_file_range.patch \
+SRC_URI_append_class-native = " \
                                 file://tweak-options-require-tar-1.27.patch \
 "
 
-- 
2.17.1


