Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RWZhD-0002KN-Ir
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 21:27:00 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 02 Dec 2011 12:20:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,285,1320652800"; d="scan'208";a="43396293"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by AZSMGA002.ch.intel.com with ESMTP; 02 Dec 2011 12:20:13 -0800
From: nitin.a.kamble@intel.com
To: hjl.tools@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Fri,  2 Dec 2011 12:20:08 -0800
Message-Id: <cb27217f54fa11f44ecd79c8bdbb516b3d51fcf0.1322856805.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <a92d45d71d2d4aec2774e8feb23fcfdffaa8b2bc.1322856805.git.nitin.a.kamble@intel.com>
References: <a92d45d71d2d4aec2774e8feb23fcfdffaa8b2bc.1322856805.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1322856805.git.nitin.a.kamble@intel.com>
References: <cover.1322856805.git.nitin.a.kamble@intel.com>
Subject: [PATCH 10/11] libaio: patch source code for x32
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

This Fixes bug: [YOCTO #1417]

Properly load arguments 5 an 6 for x86-64 syscall
Use asm ("r10") and asm ("r8") to load arguments 5 an 6 for x86-64
syscall so that it works with both x32 and x86-64.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
Signed-Off-By: H.J. Lu <hjl.tools@gmail.com>
---
 .../libaio/libaio/libaio_fix_for_x32.patch         |   61 ++++++++++++++++++++
 meta/recipes-extended/libaio/libaio_0.3.109.bb     |    5 +-
 2 files changed, 64 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/libaio/libaio/libaio_fix_for_x32.patch

diff --git a/meta/recipes-extended/libaio/libaio/libaio_fix_for_x32.patch b/meta/recipes-extended/libaio/libaio/libaio_fix_for_x32.patch
new file mode 100644
index 0000000..508f5a1
--- /dev/null
+++ b/meta/recipes-extended/libaio/libaio/libaio_fix_for_x32.patch
@@ -0,0 +1,61 @@
+Upstream-Status: Pending
+
+Properly load arguments 5 an 6 for x86-64 syscall
+Use asm ("r10") and asm ("r8") to load arguments 5 an 6 for x86-64
+syscall so that it works with both x32 and x86-64.
+
+Received this patch from H.J. Lu <hjl.tools@gmail.com>
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2011/12/02
+
+--- libaio-0.3.109/src/syscall-x86_64.h.x32	2009-10-09 11:17:02.000000000 -0700
++++ libaio-0.3.109/src/syscall-x86_64.h	2011-12-02 09:09:07.537603224 -0800
+@@ -1,8 +1,18 @@
++#ifndef __NR_io_setup
+ #define __NR_io_setup		206
++#endif
++#ifndef __NR_io_destroy
+ #define __NR_io_destroy		207
++#endif
++#ifndef __NR_io_getevents
+ #define __NR_io_getevents	208
++#endif
++#ifndef __NR_io_submit
+ #define __NR_io_submit		209
++#endif
++#ifndef __NR_io_cancel
+ #define __NR_io_cancel		210
++#endif
+ 
+ #define __syscall_clobber "r11","rcx","memory" 
+ #define __syscall "syscall"
+@@ -42,10 +52,11 @@ return __res;								\
+ type fname (type1 arg1, type2 arg2, type3 arg3, type4 arg4)		\
+ {									\
+ long __res;								\
+-__asm__ volatile ("movq %5,%%r10 ;" __syscall				\
++register long __a4 asm ("r10") = (long) arg4;				\
++__asm__ volatile (__syscall						\
+ 	: "=a" (__res)							\
+ 	: "0" (__NR_##sname),"D" ((long)(arg1)),"S" ((long)(arg2)),	\
+-	  "d" ((long)(arg3)),"g" ((long)(arg4)) : __syscall_clobber,"r10" ); \
++	  "d" ((long)(arg3)),"r" (__a4)); \
+ return __res;								\
+ } 
+ 
+@@ -54,10 +65,11 @@ return __res;								\
+ type fname (type1 arg1,type2 arg2,type3 arg3,type4 arg4,type5 arg5)	\
+ {									\
+ long __res;								\
+-__asm__ volatile ("movq %5,%%r10 ; movq %6,%%r8 ; " __syscall		\
++register long __a4 asm ("r10") = (long) arg4;				\
++register long __a5 asm ("r8") = (long) arg5;				\
++__asm__ volatile ( __syscall						\
+ 	: "=a" (__res)							\
+ 	: "0" (__NR_##sname),"D" ((long)(arg1)),"S" ((long)(arg2)),	\
+-	  "d" ((long)(arg3)),"g" ((long)(arg4)),"g" ((long)(arg5)) :	\
+-	__syscall_clobber,"r8","r10" );					\
++	  "d" ((long)(arg3)),"r" (__a4),"r" (__a5));			\
+ return __res;								\
+ }
diff --git a/meta/recipes-extended/libaio/libaio_0.3.109.bb b/meta/recipes-extended/libaio/libaio_0.3.109.bb
index 869b2da..161b712 100644
--- a/meta/recipes-extended/libaio/libaio_0.3.109.bb
+++ b/meta/recipes-extended/libaio/libaio_0.3.109.bb
@@ -5,12 +5,13 @@ HOMEPAGE = "http://lse.sourceforge.net/io/aio.html"
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/liba/libaio/libaio_${PV}.orig.tar.gz \
            file://00_arches.patch \
            file://toolchain.patch \
-           file://destdir.patch"
+           file://destdir.patch \
+           file://libaio_fix_for_x32.patch"
 
 SRC_URI[md5sum] = "435a5b16ca6198eaf01155263d855756"
 SRC_URI[sha256sum] = "bf4a457253cbaab215aea75cb6e18dc8d95bbd507e9920661ff9bdd288c8778d"
-- 
1.7.6.4



