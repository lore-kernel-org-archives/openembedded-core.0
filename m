Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RWZhD-0002KL-Ol
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 21:27:00 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 02 Dec 2011 12:20:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,285,1320652800"; d="scan'208";a="43396294"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by AZSMGA002.ch.intel.com with ESMTP; 02 Dec 2011 12:20:13 -0800
From: nitin.a.kamble@intel.com
To: hjl.tools@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Fri,  2 Dec 2011 12:20:09 -0800
Message-Id: <6a3108ac14517d67ab0739086666ddcfe025b848.1322856805.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <a92d45d71d2d4aec2774e8feb23fcfdffaa8b2bc.1322856805.git.nitin.a.kamble@intel.com>
References: <a92d45d71d2d4aec2774e8feb23fcfdffaa8b2bc.1322856805.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1322856805.git.nitin.a.kamble@intel.com>
References: <cover.1322856805.git.nitin.a.kamble@intel.com>
Subject: [PATCH 11/11] libatomics-ops: patch source code for x32
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
X-List-Received-Date: Fri, 02 Dec 2011 20:27:00 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

This Fixes bug: [YOCTO #1418]

Remove the `q' suffix on x86-64 atomic instructions.

We don't need the `q' suffix on x86_64 atomic instructions for AO_t,
which is defined as "unsigned long".  "unsigned long" is 32bit for x32
and 64bit for x86-64. The register operand in x86-64 atomic instructions
is sufficient to properly determine the register size.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
Signed-off-by: H.J. Lu <hjl.tools@gmail.com>
---
 .../libatomics-ops_fix_for_x32.patch               |   41 ++++++++++++++++++++
 .../pulseaudio/libatomics-ops_1.2.bb               |    5 +-
 2 files changed, 44 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-multimedia/pulseaudio/libatomics-ops/libatomics-ops_fix_for_x32.patch

diff --git a/meta/recipes-multimedia/pulseaudio/libatomics-ops/libatomics-ops_fix_for_x32.patch b/meta/recipes-multimedia/pulseaudio/libatomics-ops/libatomics-ops_fix_for_x32.patch
new file mode 100644
index 0000000..1768606
--- /dev/null
+++ b/meta/recipes-multimedia/pulseaudio/libatomics-ops/libatomics-ops_fix_for_x32.patch
@@ -0,0 +1,41 @@
+Upstream-Status: Pending
+
+Remove the `q' suffix on x86-64 atomic instructions.
+
+We don't need the `q' suffix on x86_64 atomic instructions for AO_t,
+which is defined as "unsigned long".  "unsigned long" is 32bit for x32
+and 64bit for x86-64. The register operand in x86-64 atomic instructions
+is sufficient to properly determine the register size.
+
+Received this patch from H.J. Lu <hjl.tools@gmail.com>
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/12/02
+
+--- libatomic_ops-1.2/src/atomic_ops/sysdeps/gcc/x86_64.h.x32	2005-09-28 17:16:38.000000000 -0700
++++ libatomic_ops-1.2/src/atomic_ops/sysdeps/gcc/x86_64.h	2011-12-02 09:29:54.265251875 -0800
+@@ -60,7 +60,7 @@ AO_fetch_and_add_full (volatile AO_t *p,
+ {
+   AO_t result;
+ 
+-  __asm__ __volatile__ ("lock; xaddq %0, %1" :
++  __asm__ __volatile__ ("lock; xadd %0, %1" :
+ 			"=r" (result), "=m" (*p) : "0" (incr), "m" (*p)
+ 			: "memory");
+   return result;
+@@ -111,7 +111,7 @@ AO_int_fetch_and_add_full (volatile unsi
+ AO_INLINE void
+ AO_or_full (volatile AO_t *p, AO_t incr)
+ {
+-  __asm__ __volatile__ ("lock; orq %1, %0" :
++  __asm__ __volatile__ ("lock; or %1, %0" :
+ 			"=m" (*p) : "r" (incr), "m" (*p) : "memory");
+ }
+ 
+@@ -136,7 +136,7 @@ AO_compare_and_swap_full(volatile AO_t *
+ 		  	     AO_t old, AO_t new_val) 
+ {
+   char result;
+-  __asm__ __volatile__("lock; cmpxchgq %3, %0; setz %1"
++  __asm__ __volatile__("lock; cmpxchg %3, %0; setz %1"
+ 	    	       : "=m"(*addr), "=q"(result)
+ 		       : "m"(*addr), "r" (new_val), "a"(old) : "memory");
+   return (int) result;
diff --git a/meta/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bb b/meta/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bb
index c84917a..184c167 100644
--- a/meta/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bb
+++ b/meta/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bb
@@ -6,12 +6,13 @@ LICENSE = "GPLv2 & MIT"
 LIC_FILES_CHKSUM = "file://doc/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://doc/LICENSING.txt;md5=607073e04548eac7d1f763e480477bab \
 		   "
-PR = "r7"
+PR = "r8"
 
 SRC_URI = "http://www.hpl.hp.com/research/linux/atomic_ops/download/libatomic_ops-${PV}.tar.gz \
            file://fedora/libatomic_ops-1.2-ppclwzfix.patch \
            file://gentoo/libatomic_ops-1.2-mips.patch \
-           file://doublefix.patch"
+           file://doublefix.patch \
+           file://libatomics-ops_fix_for_x32.patch"
 
 SRC_URI[md5sum] = "1b65e48271c81e3fa2d7a9a69bab7504"
 SRC_URI[sha256sum] = "a3d8768aa8fd2f6ae79be2d756b3a6b48816b3889ae906be3d5ffb2de5a5c781"
-- 
1.7.6.4



