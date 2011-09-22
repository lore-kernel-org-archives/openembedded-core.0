Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1R6cLK-0001qE-IY
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 08:01:06 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 21 Sep 2011 22:55:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="52521158"
Received: from yocto-build3.sh.intel.com ([10.239.48.58])
	by orsmga001.jf.intel.com with ESMTP; 21 Sep 2011 22:55:33 -0700
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Sep 2011 13:51:24 +0800
Message-Id: <f277242f36a8881f3241489183cfe1e0b4e20671.1316670532.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1316670532.git.edwin.zhai@intel.com>
References: <cover.1316670532.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1316670532.git.edwin.zhai@intel.com>
References: <cover.1316670532.git.edwin.zhai@intel.com>
Subject: [PATCH 1/1] qemugl: Use local variable rather than "push" to save register
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
X-List-Received-Date: Thu, 22 Sep 2011 06:01:07 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

New gcc uses "%esp" rather than "%ebp" to index local variable in stack, and
push between save-to/restore-from stack decrease "%esp", which leads wrong
index. Saving registers via local variables to make gcc aware of this and avoid
stack disorder.

[YOCTO #1442] got fixed

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../mesa/qemugl/call_opengl_fix.patch              |   58 ++++++++++++++++++++
 meta/recipes-graphics/mesa/qemugl_git.bb           |    5 +-
 2 files changed, 61 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/qemugl/call_opengl_fix.patch

diff --git a/meta/recipes-graphics/mesa/qemugl/call_opengl_fix.patch b/meta/recipes-graphics/mesa/qemugl/call_opengl_fix.patch
new file mode 100644
index 0000000..c5e3592
--- /dev/null
+++ b/meta/recipes-graphics/mesa/qemugl/call_opengl_fix.patch
@@ -0,0 +1,58 @@
+Save registers via local variables instead of simple "push", so that gcc become
+aware of this operation and avoid stack disorder.
+
+opengl calling (in call_opengl_qemu) includes 4 steps:
+1. prepare opengl parameters on stack
+2. save some "input" register by push
+3. load "input" register with parameters on stack via same index as step 1
+4. issue "int 0x99" to trap into qemu, who will get parameter in the registers
+
+New gcc uses "%esp" rather than "%ebp" to index local variable in stack, which
+leads wrong index in step 3, as push decrease "%esp" automatically. Saving
+registers via local variables to fix it.
+
+Upstream-Status: Pending
+
+Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
+Index: git/opengl_client.c
+===================================================================
+--- git.orig/opengl_client.c	2011-09-19 19:44:51.000000000 +0800
++++ git/opengl_client.c	2011-09-22 10:11:04.000000000 +0800
+@@ -1076,23 +1076,29 @@
+ {
+ #if defined(__i386__)
+   int ret;
++  int bx, cx, dx, si;
+ #ifdef WIN32
+   __asm__ ("pushl %0;pushl %%fs:0;movl %%esp,%%fs:0;" : : "g" (win32_sigsegv_handler));
+ #endif
+-  __asm__ ("push %ebx");
+-  __asm__ ("push %ecx");
+-  __asm__ ("push %edx");
+-  __asm__ ("push %esi");
++  /* save registers before opengl call */
++  __asm__ ("mov %%ebx, %0"::"m"(bx));
++  __asm__ ("mov %%ecx, %0"::"m"(cx));
++  __asm__ ("mov %%edx, %0"::"m"(dx));
++  __asm__ ("mov %%esi, %0"::"m"(si));
++
+   __asm__ ("mov %0, %%eax"::"m"(func_number));
+   __asm__ ("mov %0, %%ebx"::"m"(pid));
+   __asm__ ("mov %0, %%ecx"::"m"(ret_string));
+   __asm__ ("mov %0, %%edx"::"m"(args));
+   __asm__ ("mov %0, %%esi"::"m"(args_size));
+   __asm__ ("int $0x99");
+-  __asm__ ("pop %esi");
+-  __asm__ ("pop %edx");
+-  __asm__ ("pop %ecx");
+-  __asm__ ("pop %ebx");
++
++  /* restore registers */
++  __asm__ ("mov %0, %%ebx"::"m"(bx));
++  __asm__ ("mov %0, %%ecx"::"m"(cx));
++  __asm__ ("mov %0, %%edx"::"m"(dx));
++  __asm__ ("mov %0, %%esi"::"m"(si));
++
+   __asm__ ("mov %%eax, %0"::"m"(ret));
+ #ifdef WIN32
+   __asm__ ("movl (%%esp),%%ecx;movl %%ecx,%%fs:0;addl $8,%%esp;" : : : "%ecx");
diff --git a/meta/recipes-graphics/mesa/qemugl_git.bb b/meta/recipes-graphics/mesa/qemugl_git.bb
index 9d5115f..1658759 100644
--- a/meta/recipes-graphics/mesa/qemugl_git.bb
+++ b/meta/recipes-graphics/mesa/qemugl_git.bb
@@ -11,13 +11,14 @@ COMPATIBLE_HOST = '(x86_64.*|i.86.*)-(linux|freebsd.*)'
 
 SRC_URI = "git://git.o-hand.com/qemugl.git;protocol=git \
            file://versionfix.patch \
-           file://remove-x11r6-lib-dir.patch"
+           file://remove-x11r6-lib-dir.patch \
+           file://call_opengl_fix.patch"
 S = "${WORKDIR}/git"
 
 SRCREV = "d888bbc723c00d197d34a39b5b7448660ec1b1c0"
 
 PV = "0.0+git${SRCPV}"
-PR = "r7"
+PR = "r8"
 
 DEFAULT_PREFERENCE = "-1"
 
-- 
1.7.1



