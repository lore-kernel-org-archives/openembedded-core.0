Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D64096E374
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2014 09:40:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s1P9emQm029908
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2014 01:40:48 -0800 (PST)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 25 Feb 2014 01:40:48 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 25 Feb 2014 17:44:04 +0800
Message-ID: <39e2106910eb0189f8724ca7679ddad873647fbe.1393321369.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1393321369.git.liezhi.yang@windriver.com>
References: <cover.1393321369.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] dpkg: fix a link problem for dpkg-native on CentOS 5.8
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
X-List-Received-Date: Tue, 25 Feb 2014 09:40:48 -0000
Content-Type: text/plain

From: Donn Seeley <donn.seeley@windriver.com>

[ CQID: WIND00392830 ]

CentOS 5.8 provides the kernel support and headers for the
sync_file_range() syscall, but glibc 2.5 doesn't implement the
sync_file_range() syscall stub, so we can't link dpkg-native. Add a
patch that makes dpkg require a glibc version >= 2.6 in order to use
sync_file_range().

Signed-off-by: Donn Seeley <donn.seeley@windriver.com>
Signed-off-by: Lei Liu <lei.liu2@windriver.com>
Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
Signed-off-by: Jeff Polk <jeff.polk@windriver.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../dpkg/dpkg/glibc2.5-sync_file_range.patch       | 86 ++++++++++++++++++++++
 meta/recipes-devtools/dpkg/dpkg_1.17.4.bb          |  1 +
 2 files changed, 87 insertions(+)
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/glibc2.5-sync_file_range.patch

diff --git a/meta/recipes-devtools/dpkg/dpkg/glibc2.5-sync_file_range.patch b/meta/recipes-devtools/dpkg/dpkg/glibc2.5-sync_file_range.patch
new file mode 100644
index 0000000..d56b8a6
--- /dev/null
+++ b/meta/recipes-devtools/dpkg/dpkg/glibc2.5-sync_file_range.patch
@@ -0,0 +1,86 @@
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
+Signed-off-by: Lei Liu <lei.liu2@windriver.com>
+---
+ src/archives.c |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+--- a/src/archives.c
++++ b/src/archives.c
+@@ -75,7 +75,7 @@
+   /* Ignore the return code as it should be considered equivalent to an
+    * asynchronous hint for the kernel, we are doing an fsync() later on
+    * anyway. */
+-#if defined(SYNC_FILE_RANGE_WRITE)
++#if defined(SYNC_FILE_RANGE_WRITE) && __GLIBC_PREREQ(2, 6)
+   sync_file_range(fd, 0, 0, SYNC_FILE_RANGE_WRITE);
+ #elif defined(HAVE_POSIX_FADVISE)
+   posix_fadvise(fd, 0, 0, POSIX_FADV_DONTNEED);
+@@ -1179,7 +1179,7 @@
+   return 0;
+ }
+ 
+-#if defined(SYNC_FILE_RANGE_WAIT_BEFORE)
++#if defined(SYNC_FILE_RANGE_WAIT_BEFORE) && __GLIBC_PREREQ(2, 6)
+ static void
+ tar_writeback_barrier(struct fileinlist *files, struct pkginfo *pkg)
+ {
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.17.4.bb b/meta/recipes-devtools/dpkg/dpkg_1.17.4.bb
index b27e6f4..5e407ba 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.17.4.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.17.4.bb
@@ -10,6 +10,7 @@ SRC_URI += "file://noman.patch \
             file://fix-abs-redefine.patch \
             file://arch_pm.patch \
             file://dpkg-configure.service \
+            file://glibc2.5-sync_file_range.patch \
            "
 
 SRC_URI[md5sum] = "cc25086e1e3bd9512a95f14cfe9002e1"
-- 
1.8.3.1


