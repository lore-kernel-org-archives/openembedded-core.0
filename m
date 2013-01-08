Received: from 204-228-134-225.ip.xmission.com ([204.228.134.225]
	helo=ibapah.eng.bsdi.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <donn.seeley@windriver.com>) id 1TsdqF-0007sp-1q
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 19:24:04 +0100
Received: from ibapah.eng.bsdi.com (localhost [127.0.0.1])
	by ibapah.eng.bsdi.com (8.14.5/8.14.5) with ESMTP id r08Huv1l013540
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Jan 2013 10:56:57 -0700 (MST)
	(envelope-from donn.seeley@windriver.com)
Message-Id: <201301081756.r08Huv1l013540@ibapah.eng.bsdi.com>
From: Donn Seeley <donn.seeley@windriver.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Date: Tue, 08 Jan 2013 10:56:57 -0700
Subject: anyone interested in CentOS 5 fixes for dpkg-native?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Jan 2013 18:24:05 -0000
Content-Type: multipart/mixed; boundary="----- =_aaaaaaaaaa0"
Content-ID: <13537.1357667787.0@ibapah.eng.bsdi.com>

------- =_aaaaaaaaaa0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <13537.1357667787.1@ibapah.eng.bsdi.com>

We recently tried to build using 'PACKAGE_CLASSES = package_deb' and
found that our ancient CentOS 5 build VMs couldn't compile and link
dpkg-native.  (We support CentOS 5 for very conservative customers, so
we run test builds with it regularly.)

Given that package_deb isn't used frequently and that CentOS 5 is so
old, I thought that I would ask first before submitting fixes for that
configuration.  Do we want the patches in oe-core?

I'll attach the patches that I made,

Donn
From 17e5e8823d39544f6b661a80068f9dc26b5429c6 Mon Sep 17 00:00:00 2001
From: Donn Seeley <donn.seeley@windriver.com>
Date: Sat, 29 Dec 2012 15:13:40 -0700
Subject: [PATCH 1/2] Fix a build error for dpkg-native on CentOS 5.8. [ Defect: WIND00392830 ]

CQID: WIND00392830

Remove the -Wvla flag from the set of compiler warning flags, since gcc
on ancient host systems such as CentOS 5.8 doesn't support it.

Signed-off-by: Donn Seeley <donn.seeley@windriver.com>
---
 recipes-devtools/dpkg/dpkg_1.15.8.7.bbappend     |    5 +++++
 recipes-devtools/dpkg/files/no-vla-warning.patch |   22 ++++++++++++++++++++++
 2 files changed, 27 insertions(+), 0 deletions(-)
 create mode 100644 recipes-devtools/dpkg/dpkg_1.15.8.7.bbappend
 create mode 100644 recipes-devtools/dpkg/files/no-vla-warning.patch

diff --git a/layers/wr-base/recipes-devtools/dpkg/dpkg_1.15.8.7.bbappend b/layers/wr-base/recipes-devtools/dpkg/dpkg_1.15.8.7.bbappend
new file mode 100644
index 0000000..a7a0d13
--- /dev/null
+++ b/layers/wr-base/recipes-devtools/dpkg/dpkg_1.15.8.7.bbappend
@@ -0,0 +1,5 @@
+PRINC = "1"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/files"
+
+SRC_URI += "file://no-vla-warning.patch"
diff --git a/layers/wr-base/recipes-devtools/dpkg/files/no-vla-warning.patch b/layers/wr-base/recipes-devtools/dpkg/files/no-vla-warning.patch
new file mode 100644
index 0000000..2cfdaaf
--- /dev/null
+++ b/layers/wr-base/recipes-devtools/dpkg/files/no-vla-warning.patch
@@ -0,0 +1,22 @@
+Remove the -Wvla flag from the set of compiler warning flags, since gcc
+on ancient host systems such as CentOS 5.8 doesn't support it, and it
+causes a build error for dpkg-native.
+
+Upstream-Status: Inappropriate [everyone else builds on newer hosts :-)]
+
+Signed-off-by: Donn Seeley <donn.seeley@windriver.com>
+---
+ m4/dpkg-compiler.m4 |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/m4/dpkg-compiler.m4
++++ b/m4/dpkg-compiler.m4
+@@ -13,7 +13,7 @@ AC_DEFUN([DPKG_COMPILER_WARNINGS],
+ 
+ WFLAGS="-Wall -Wextra -Wno-unused-parameter -Wno-missing-field-initializers \
+ 	 -Wmissing-declarations -Wmissing-format-attribute \
+-	 -Wvla -Winit-self -Wwrite-strings -Wcast-align -Wshadow"
++	 -Winit-self -Wwrite-strings -Wcast-align -Wshadow"
+ WCFLAGS="-Wdeclaration-after-statement -Wnested-externs -Wbad-function-cast \
+ 	 -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition"
+ # Temporarily here until #542031 gets fixed in ncurses
-- 
1.7.6.5

From 7ffe5061c73930eca4fc536955c6a3919973f86c Mon Sep 17 00:00:00 2001
From: Donn Seeley <donn.seeley@windriver.com>
Date: Wed, 2 Jan 2013 23:07:06 -0700
Subject: [PATCH 2/2] Fix a link problem for dpkg-native on CentOS 5.8. [ Defect: WIND00392830 ]

CQID: WIND00392830

CentOS 5.8 provides the kernel support and headers for the
sync_file_range() syscall, but glibc 2.5 doesn't implement the
sync_file_range() syscall stub, so we can't link dpkg-native.  Add a
patch that makes dpkg require a glibc version >= 2.6 in order to use
sync_file_range().

Signed-off-by: Donn Seeley <donn.seeley@windriver.com>
---
 recipes-devtools/dpkg/dpkg_1.15.8.7.bbappend       |    3 +-
 .../dpkg/files/glibc2.5-sync_file_range.patch      |   85 ++++++++++++++++++++
 2 files changed, 87 insertions(+), 1 deletions(-)
 create mode 100644 recipes-devtools/dpkg/files/glibc2.5-sync_file_range.patch

diff --git a/layers/wr-base/recipes-devtools/dpkg/dpkg_1.15.8.7.bbappend b/layers/wr-base/recipes-devtools/dpkg/dpkg_1.15.8.7.bbappend
index a7a0d13..9dab245 100644
--- a/layers/wr-base/recipes-devtools/dpkg/dpkg_1.15.8.7.bbappend
+++ b/layers/wr-base/recipes-devtools/dpkg/dpkg_1.15.8.7.bbappend
@@ -2,4 +2,5 @@ PRINC = "1"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/files"
 
-SRC_URI += "file://no-vla-warning.patch"
+SRC_URI += "file://no-vla-warning.patch \
+            file://glibc2.5-sync_file_range.patch"
diff --git a/layers/wr-base/recipes-devtools/dpkg/files/glibc2.5-sync_file_range.patch b/layers/wr-base/recipes-devtools/dpkg/files/glibc2.5-sync_file_range.patch
new file mode 100644
index 0000000..b01788a
--- /dev/null
+++ b/layers/wr-base/recipes-devtools/dpkg/files/glibc2.5-sync_file_range.patch
@@ -0,0 +1,85 @@
+CentOS 5.8 kernels and headers support the sync_file_range() system call,
+but glibc 2.5 doesn't provide the syscall stub.  It appears that this
+problem is known but will never be fixed:
+
+  https://bugzilla.redhat.com/show_bug.cgi?id=518581
+
+  Bug 518581 - [RHEL5] glibc misses sync_file_range syscall interface 
+
+  Status:       CLOSED CANTFIX 
+  Last Closed:  2009-11-22 22:19:55
+
+  Kirby Zhou 2009-08-20 23:37:55 EDT
+
+  Description of problem:
+
+  glibc misses sync_file_range syscall interface.  The header file and
+  man page both say 'sync_file_range' should exist.  From man page,
+  sync_file_range should exist sinc kernel-2.6.17
+
+  Andreas Schwab 2009-08-21 03:24:24 EDT
+
+  It has only been added to glibc 2.6, and cannot be backported due to
+  ABI breakage.  You can always fall back to syscall(3).
+
+  Ulrich Drepper 2009-11-22 22:19:55 EST
+
+  As comment #1 says, no chance to backport this.
+
+  See the syscall man page for instructions.
+
+  Jon E 2010-03-19 10:32:37 EDT
+
+  then why document it if it's broken and you're not going to fix it?
+  .. might want to FTFM over at sync_file_range(2) - in the meantime -
+  borrowing from glibc 2.6 .. any thoughts on this implementation for a
+  hacky workaround for those still on your "ancient releases" .. (eg:
+  RHEL5.3)?:
+
+  #ifdef ULI_WONT_FIX_THIS_IN_GLIBC2.5
+  #define NR_sync_file_range 277
+  int sync_file_range (int fd, __off64_t from, __off64_t to, unsigned int flags)
+  {
+    return syscall (NR_sync_file_range, fd,
+                           __LONG_LONG_PAIR ((long) (from >> 32), (long) from),
+                           __LONG_LONG_PAIR ((long) (to >> 32), (long) to),
+                           flags);
+  }
+  #endif
+
+  assuming of course that you're on an x86_64 and include/asm-
+  x86_64/unistd.h has the correct entry
+
+  (fwiw - fio is starting to use this now)
+
+Rather than attempting to provide an implementation using syscall(),
+we take the more conservative route and ignore header support for
+sync_file_range() flags when the glibc version is <= 2.5.
+
+Upstream-Status: Inappropriate [everyone else builds on newer hosts :-)]
+
+Signed-off-by: Donn Seeley <donn.seeley@windriver.com>
+---
+ src/archives.c |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+--- a/src/archives.c
++++ b/src/archives.c
+@@ -85,7 +85,7 @@ static int safe_read(int fd, void *buf, 
+ static inline void
+ fd_writeback_init(int fd)
+ {
+-#if defined(SYNC_FILE_RANGE_WRITE)
++#if defined(SYNC_FILE_RANGE_WRITE) && __GLIBC_PREREQ(2, 6)
+   sync_file_range(fd, 0, 0, SYNC_FILE_RANGE_WRITE);
+ #elif defined(HAVE_POSIX_FADVISE)
+   posix_fadvise(fd, 0, 0, POSIX_FADV_DONTNEED);
+@@ -862,7 +862,7 @@ tarobject(void *ctx, struct tar_entry *t
+   return 0;
+ }
+ 
+-#if defined(SYNC_FILE_RANGE_WAIT_BEFORE)
++#if defined(SYNC_FILE_RANGE_WAIT_BEFORE) && __GLIBC_PREREQ(2, 6)
+ static void
+ tar_writeback_barrier(struct fileinlist *files, struct pkginfo *pkg)
+ {
-- 
1.7.6.5


------- =_aaaaaaaaaa0--
