Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1S2I9p-0004sq-Cx
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 09:11:37 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 28 Feb 2012 00:02:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="115563799"
Received: from yocto-build3.sh.intel.com ([10.239.48.15])
	by orsmga002.jf.intel.com with ESMTP; 28 Feb 2012 00:01:04 -0800
From: edwin.zhai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Feb 2012 16:00:49 +0800
Message-Id: <ee7e64fd8b69af70c1e5ef5de38e33f56a3b3f85.1330415940.git.edwin.zhai@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1330415940.git.edwin.zhai@intel.com>
References: <cover.1330415940.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1330415940.git.edwin.zhai@intel.com>
References: <cover.1330415940.git.edwin.zhai@intel.com>
Subject: [PATCH 4/5] qemugl: Fix gl apps failure on qemu-x86-64
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
X-List-Received-Date: Tue, 28 Feb 2012 08:11:37 -0000

From: Zhai Edwin <edwin.zhai@intel.com>

Extend commit 028968 to qemu x86-64, where stack disorder happen due to
register handling via push/pop.

[YOCTO #1927] fixed

Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
---
 .../mesa/qemugl/call_opengl_fix.patch              |   40 +++++++++++++++++++-
 meta/recipes-graphics/mesa/qemugl_git.bb           |    2 +-
 2 files changed, 39 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/mesa/qemugl/call_opengl_fix.patch b/meta/recipes-graphics/mesa/qemugl/call_opengl_fix.patch
index c5e3592..342f49b 100644
--- a/meta/recipes-graphics/mesa/qemugl/call_opengl_fix.patch
+++ b/meta/recipes-graphics/mesa/qemugl/call_opengl_fix.patch
@@ -16,8 +16,8 @@ Upstream-Status: Pending
 Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
 Index: git/opengl_client.c
 ===================================================================
---- git.orig/opengl_client.c	2011-09-19 19:44:51.000000000 +0800
-+++ git/opengl_client.c	2011-09-22 10:11:04.000000000 +0800
+--- git.orig/opengl_client.c	2012-02-28 15:26:28.000000000 +0800
++++ git/opengl_client.c	2012-02-28 15:29:18.000000000 +0800
 @@ -1076,23 +1076,29 @@
  {
  #if defined(__i386__)
@@ -56,3 +56,39 @@ Index: git/opengl_client.c
    __asm__ ("mov %%eax, %0"::"m"(ret));
  #ifdef WIN32
    __asm__ ("movl (%%esp),%%ecx;movl %%ecx,%%fs:0;addl $8,%%esp;" : : : "%ecx");
+@@ -1100,20 +1106,27 @@
+   return ret;
+ #elif defined(__x86_64__)
+   int ret;
+-  __asm__ ("push %rbx");
+-  __asm__ ("push %rcx");
+-  __asm__ ("push %rdx");
+-  __asm__ ("push %rsi");
++  long bx, cx, dx, si;
++
++  /* save registers before opengl call */
++  __asm__ ("mov %%rbx, %0"::"m"(bx));
++  __asm__ ("mov %%rcx, %0"::"m"(cx));
++  __asm__ ("mov %%rdx, %0"::"m"(dx));
++  __asm__ ("mov %%rsi, %0"::"m"(si));
++
+   __asm__ ("mov %0, %%eax"::"m"(func_number));
+   __asm__ ("mov %0, %%ebx"::"m"(pid));
+   __asm__ ("mov %0, %%rcx"::"m"(ret_string));
+   __asm__ ("mov %0, %%rdx"::"m"(args));
+   __asm__ ("mov %0, %%rsi"::"m"(args_size));
+   __asm__ ("int $0x99");
+-  __asm__ ("pop %rsi");
+-  __asm__ ("pop %rdx");
+-  __asm__ ("pop %rcx");
+-  __asm__ ("pop %rbx");
++
++  /* restore registers */
++  __asm__ ("mov %0, %%rbx"::"m"(bx));
++  __asm__ ("mov %0, %%rcx"::"m"(cx));
++  __asm__ ("mov %0, %%rdx"::"m"(dx));
++  __asm__ ("mov %0, %%rsi"::"m"(si));
++
+   __asm__ ("mov %%eax, %0"::"m"(ret));
+   return ret;
+ #else
diff --git a/meta/recipes-graphics/mesa/qemugl_git.bb b/meta/recipes-graphics/mesa/qemugl_git.bb
index e3552ec..66f4e17 100644
--- a/meta/recipes-graphics/mesa/qemugl_git.bb
+++ b/meta/recipes-graphics/mesa/qemugl_git.bb
@@ -18,7 +18,7 @@ S = "${WORKDIR}/git"
 SRCREV = "d888bbc723c00d197d34a39b5b7448660ec1b1c0"
 
 PV = "0.0+git${SRCPV}"
-PR = "r8"
+PR = "r9"
 
 DEFAULT_PREFERENCE = "-1"
 
-- 
1.7.1



