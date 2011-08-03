Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qojji-0004Tu-3X
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 00:16:22 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 03 Aug 2011 15:11:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,312,1309762800"; 
   d="scan'208";a="3912954"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.76])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Aug 2011 15:11:51 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Aug 2011 15:11:07 -0700
Message-Id: <b218ee9ca19aeab9e2c7b9bf3c62b72731264164.1312407628.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1312407628.git.sgw@linux.intel.com>
References: <cover.1312407628.git.sgw@linux.intel.com>
In-Reply-To: <cover.1312407628.git.sgw@linux.intel.com>
References: <cover.1312407628.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL v2 23/33] eglibc: fix build for armv4 machines
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
X-List-Received-Date: Wed, 03 Aug 2011 22:16:22 -0000

From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>

eglibc builds for arm-eabi unconditionally enables the libc-do-syscall.S
file, which contains thumb assembly. It's unused in arm-eabi-nothumb case,
so just ifdef the actual code.

V2: use the patch from oe.dev.

The patch is submitted to sourceware bugzilla by Khem Raj back in October
of 2010, but the status is still UNCONFIRMED and the patch isn't commited.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>
---
 .../eglibc-2.12/armv4-eabi-compile-fix.patch       |   25 ++++++++++++++++++++
 .../eglibc-2.13/armv4-eabi-compile-fix.patch       |   25 ++++++++++++++++++++
 meta/recipes-core/eglibc/eglibc_2.12.bb            |    3 +-
 meta/recipes-core/eglibc/eglibc_2.13.bb            |    3 +-
 4 files changed, 54 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.12/armv4-eabi-compile-fix.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.13/armv4-eabi-compile-fix.patch

diff --git a/meta/recipes-core/eglibc/eglibc-2.12/armv4-eabi-compile-fix.patch b/meta/recipes-core/eglibc/eglibc-2.12/armv4-eabi-compile-fix.patch
new file mode 100644
index 0000000..c2407ee
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.12/armv4-eabi-compile-fix.patch
@@ -0,0 +1,25 @@
+Source: http://sourceware.org/bugzilla/show_bug.cgi?id=12097
+Upstream-Status: Submitted
+
+The patch should be merged into glibc-ports
+
+-Khem
+Index: libc/ports/sysdeps/unix/sysv/linux/arm/eabi/libc-do-syscall.S
+===================================================================
+--- libc.orig/ports/sysdeps/unix/sysv/linux/arm/eabi/libc-do-syscall.S
++++ libc/ports/sysdeps/unix/sysv/linux/arm/eabi/libc-do-syscall.S
+@@ -16,6 +16,8 @@
+    Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
+    02111-1307 USA.  */
+ 
++#if defined(__thumb__)
++
+ #include <sysdep.h>
+ 
+ /* Out-of-line syscall stub.  We expect the system call number in ip
+@@ -41,3 +43,5 @@ ENTRY (__libc_do_syscall)
+ 	pop	{r7, pc}
+ 	.fnend
+ END (__libc_do_syscall)
++
++#endif /* __thumb__ */
diff --git a/meta/recipes-core/eglibc/eglibc-2.13/armv4-eabi-compile-fix.patch b/meta/recipes-core/eglibc/eglibc-2.13/armv4-eabi-compile-fix.patch
new file mode 100644
index 0000000..c2407ee
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.13/armv4-eabi-compile-fix.patch
@@ -0,0 +1,25 @@
+Source: http://sourceware.org/bugzilla/show_bug.cgi?id=12097
+Upstream-Status: Submitted
+
+The patch should be merged into glibc-ports
+
+-Khem
+Index: libc/ports/sysdeps/unix/sysv/linux/arm/eabi/libc-do-syscall.S
+===================================================================
+--- libc.orig/ports/sysdeps/unix/sysv/linux/arm/eabi/libc-do-syscall.S
++++ libc/ports/sysdeps/unix/sysv/linux/arm/eabi/libc-do-syscall.S
+@@ -16,6 +16,8 @@
+    Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
+    02111-1307 USA.  */
+ 
++#if defined(__thumb__)
++
+ #include <sysdep.h>
+ 
+ /* Out-of-line syscall stub.  We expect the system call number in ip
+@@ -41,3 +43,5 @@ ENTRY (__libc_do_syscall)
+ 	pop	{r7, pc}
+ 	.fnend
+ END (__libc_do_syscall)
++
++#endif /* __thumb__ */
diff --git a/meta/recipes-core/eglibc/eglibc_2.12.bb b/meta/recipes-core/eglibc/eglibc_2.12.bb
index 1ada892..ce16bd6 100644
--- a/meta/recipes-core/eglibc/eglibc_2.12.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.12.bb
@@ -1,7 +1,7 @@
 require eglibc.inc
 
 DEPENDS += "gperf-native"
-PR = "r20"
+PR = "r21"
 
 SRCREV = "14158"
 
@@ -11,6 +11,7 @@ SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};proto=http
            file://IO-acquire-lock-fix.patch \
            file://shorten-build-commands.patch \
            file://mips-rld-map-check.patch \
+           file://armv4-eabi-compile-fix.patch \
            file://etc/ld.so.conf \
            file://generate-supported.mk \
 	  "
diff --git a/meta/recipes-core/eglibc/eglibc_2.13.bb b/meta/recipes-core/eglibc/eglibc_2.13.bb
index 41fe7c7..ddca50f 100644
--- a/meta/recipes-core/eglibc/eglibc_2.13.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.13.bb
@@ -3,7 +3,7 @@ require eglibc.inc
 SRCREV = "14157"
 
 DEPENDS += "gperf-native"
-PR = "r9"
+PR = "r10"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_13"
@@ -13,6 +13,7 @@ SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};proto=http
            file://shorten-build-commands.patch \
            file://mips-rld-map-check.patch \
            file://stack-protector-test.patch \
+           file://armv4-eabi-compile-fix.patch \
            file://etc/ld.so.conf \
            file://generate-supported.mk \
            file://glibc_bug_fix_12454.patch \
-- 
1.7.3.4



