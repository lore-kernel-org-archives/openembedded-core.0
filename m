Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QjSDU-0001ZN-Ae
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 10:33:17 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Jul 2011 01:28:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,233,1309762800"; d="scan'208";a="29753330"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.254])
	by orsmga001.jf.intel.com with ESMTP; 20 Jul 2011 01:28:53 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2011 01:28:26 -0700
Message-Id: <c1e38312fe3efff38610002ac534d90e32a2f669.1311150183.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311150183.git.sgw@linux.intel.com>
References: <cover.1311150183.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311150183.git.sgw@linux.intel.com>
References: <cover.1311150183.git.sgw@linux.intel.com>
Subject: [PATCH 39/50] uclibc_0.9.32: Implement sync_file_range2.
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
X-List-Received-Date: Wed, 20 Jul 2011 08:33:18 -0000

From: Khem Raj <raj.khem@gmail.com>

On some arches e.g. arm, ppc sync_file_range2 is used
instead of sync_file_range so we should consider that

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../uclibc/uclibc-0.9.32/sync_file_range2.patch    |   40 ++++++++++++++++++++
 meta/recipes-core/uclibc/uclibc_0.9.32.bb          |    3 +-
 2 files changed, 42 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-core/uclibc/uclibc-0.9.32/sync_file_range2.patch

diff --git a/meta/recipes-core/uclibc/uclibc-0.9.32/sync_file_range2.patch b/meta/recipes-core/uclibc/uclibc-0.9.32/sync_file_range2.patch
new file mode 100644
index 0000000..b5e972e
--- /dev/null
+++ b/meta/recipes-core/uclibc/uclibc-0.9.32/sync_file_range2.patch
@@ -0,0 +1,40 @@
+Index: git/libc/sysdeps/linux/common/sync_file_range.c
+===================================================================
+--- git.orig/libc/sysdeps/linux/common/sync_file_range.c	2011-07-19 14:23:35.000000000 -0700
++++ git/libc/sysdeps/linux/common/sync_file_range.c	2011-07-19 15:04:38.631808666 -0700
+@@ -11,7 +11,8 @@
+ #if defined __USE_GNU
+ #include <fcntl.h>
+ 
+-#if defined __NR_sync_file_range && defined __UCLIBC_HAS_LFS__
++#if defined __UCLIBC_HAS_LFS__
++#if defined __NR_sync_file_range
+ #define __NR___syscall_sync_file_range __NR_sync_file_range
+ static __inline__ _syscall6(int, __syscall_sync_file_range, int, fd,
+ 		off_t, offset_hi, off_t, offset_lo,
+@@ -23,5 +24,23 @@
+ 		__LONG_LONG_PAIR((long)(nbytes >> 32), (long)(nbytes & 0xffffffff)),
+ 		flags);
+ }
+-#endif
+-#endif
++#elif defined __NR_sync_file_range2
++#define __NR___syscall_sync_file_range2 __NR_sync_file_range2
++static __inline__ _syscall6(int, __syscall_sync_file_range2, int, fd,
++		unsigned int, flags, off_t, offset_hi, off_t, offset_lo,
++		off_t, nbytes_hi, off_t, nbytes_lo)
++int sync_file_range(int fd, off64_t offset, off64_t nbytes, unsigned int flags)
++{
++	return __syscall_sync_file_range2(fd, flags,
++		__LONG_LONG_PAIR((long)(offset >> 32), (long)(offset & 0xffffffff)),
++		__LONG_LONG_PAIR((long)(nbytes >> 32), (long)(nbytes & 0xffffffff)));
++}
++#else
++int sync_file_range(int fd, off64_t offset, off64_t nbytes, unsigned int flags)
++{
++	__set_errno (ENOSYS);
++	return -1
++}
++#endif /* __NR_sync_file_range */
++#endif /* __UCLIBC_HAS_LFS__ */
++#endif /* __USE_GNU */
diff --git a/meta/recipes-core/uclibc/uclibc_0.9.32.bb b/meta/recipes-core/uclibc/uclibc_0.9.32.bb
index b959279..8dcb260 100644
--- a/meta/recipes-core/uclibc/uclibc_0.9.32.bb
+++ b/meta/recipes-core/uclibc/uclibc_0.9.32.bb
@@ -1,7 +1,7 @@
 SRCREV="9152c4d67c763fde5712e2d181d92c0d7e1e2ab9"
 
 require uclibc.inc
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 PROVIDES += "virtual/${TARGET_PREFIX}libc-for-gcc"
 
 SRC_URI = "git://uclibc.org/uClibc.git;branch=${PV};protocol=git \
@@ -28,5 +28,6 @@ SRC_URI = "git://uclibc.org/uClibc.git;branch=${PV};protocol=git \
 	file://0001-mips-signalfd.h-SFD_NONBLOCK-for-mips-is-0200-unlike.patch \
 	file://uclibc-execvpe.patch \
 	file://uclibc_scheduler_update.patch \
+	file://sync_file_range2.patch \
 	"
 S = "${WORKDIR}/git"
-- 
1.7.3.4



