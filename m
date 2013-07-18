Return-Path: <Sen.Zhang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C673B6AFB4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 08:54:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6I8sq1t019171
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 18 Jul 2013 01:54:52 -0700 (PDT)
Received: from [128.224.162.230] (128.224.162.230) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Thu, 18 Jul 2013 01:54:50 -0700
Message-ID: <51E7ADF6.3040506@windriver.com>
Date: Thu, 18 Jul 2013 16:57:26 +0800
From: Jesse Zhang <sen.zhang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130311 Thunderbird/17.0.4
MIME-Version: 1.0
To: Paul Barker <paul@paulbarker.me.uk>
References: <cover.1374050133.git.sen.zhang@windriver.com>
	<c95d46b97c8167bddcffb4495438227b668e87cb.1374050133.git.sen.zhang@windriver.com>
	<1374057911.2651.118.camel@phil-desktop.brightsign>
	<CANyK_8fG5LJRBVzRQZG6BVbn-AjTgY0CMwStL47qgu0eVvMcig@mail.gmail.com>
In-Reply-To: <CANyK_8fG5LJRBVzRQZG6BVbn-AjTgY0CMwStL47qgu0eVvMcig@mail.gmail.com>
X-Originating-IP: [128.224.162.230]
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] libatomics-ops: force omit frame pointer for x86 builds
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
X-List-Received-Date: Thu, 18 Jul 2013 08:54:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On 07/17/2013 07:08 PM, Paul Barker wrote:
> If this is on x86, standard Linux desktop/server distros may have ran
> into the same problem. Maybe worth having a look if/how they handle
> this.

That's a good idea. I looked but no one seems to have the problem.
Apparently everybody is building with -O2 (which implies
omit-frame-pointer). Gentoo did have a bug report but they used the same
workaround (https://bugs.gentoo.org/show_bug.cgi?id=466860).

But, I looked at the upstream git repo, and it builds fine. I located
two relevant commits and made a patch. Please see the new fix below
(also pushed to my contrib repo).

I'm not sure what the code does exactly, but it at least builds now
with whatever flags.

jesse

From ae44e5c438880d1afada04d06ef0c164c48f8fe9 Mon Sep 17 00:00:00 2001
From: Jesse Zhang <sen.zhang@windriver.com>
Date: Wed, 17 Jul 2013 02:14:02 -0400
Subject: [PATCH] libatomics-ops: backport patch to fix x86 build

Fix failures when building with -fno-omit-frame-pointer (and without
optimization, i.e. -O0):

    In file included from atomic_ops.h:212:0,
                     from atomic_ops_stack.h:32,
                     from atomic_ops_stack.c:23:
    atomic_ops/sysdeps/gcc/x86.h: In function 'AO_compare_double_and_swap_double_full':
    atomic_ops/sysdeps/gcc/x86.h:148:3: error: 'asm' operand has impossible constraints
       __asm__ __volatile__("xchg %%ebx,%6;" /* swap GOT ptr and new_val1 */
       ^

Signed-off-by: Jesse Zhang <sen.zhang@windriver.com>
---
 ...ix-AO_compare_double_and_swap_double_full.patch | 100 +++++++++++++++++++++
 .../pulseaudio/libatomics-ops_7.2.bb               |   1 +
 2 files changed, 101 insertions(+)
 create mode 100644 meta/recipes-multimedia/pulseaudio/libatomics-ops-7.2/fix-AO_compare_double_and_swap_double_full.patch

diff --git a/meta/recipes-multimedia/pulseaudio/libatomics-ops-7.2/fix-AO_compare_double_and_swap_double_full.patch b/meta/recipes-multimedia/pulseaudio/libatomics-ops-7.2/fix-AO_compare_double_and_swap_double_full.patch
new file mode 100644
index 0000000..cb56125
--- /dev/null
+++ b/meta/recipes-multimedia/pulseaudio/libatomics-ops-7.2/fix-AO_compare_double_and_swap_double_full.patch
@@ -0,0 +1,100 @@
+Fix build failure with -fno-omit-frame-pointer
+
+    In file included from atomic_ops.h:212:0,
+                     from atomic_ops_stack.h:32,
+                     from atomic_ops_stack.c:23:
+    atomic_ops/sysdeps/gcc/x86.h: In function 'AO_compare_double_and_swap_double_full':
+    atomic_ops/sysdeps/gcc/x86.h:148:3: error: 'asm' operand has impossible constraints
+       __asm__ __volatile__("xchg %%ebx,%6;" /* swap GOT ptr and new_val1 */
+       ^
+
+Cherry-picked from upstream:
+
+    https://github.com/ivmai/libatomic_ops/commit/613f39d369045e8fc385a439f67a575cddcc6fa1
+    https://github.com/ivmai/libatomic_ops/commit/64d81cd475b07c8a01b91a3be25e20eeca2d27ec
+
+Upstream-Status: backport
+
+Signed-off-by: Jesse Zhang <sen.zhang@windriver.com>
+
+--- a/src/atomic_ops/sysdeps/gcc/x86.h	2013-07-18 02:38:35.182104588 -0400
++++ a/src/atomic_ops/sysdeps/gcc/x86.h	2013-07-18 02:38:46.126104588 -0400
+@@ -137,30 +137,55 @@
+                                        AO_t new_val1, AO_t new_val2)
+ {
+   char result;
+-#if __PIC__
+-  /* If PIC is turned on, we can't use %ebx as it is reserved for the
+-     GOT pointer.  We can save and restore %ebx because GCC won't be
+-     using it for anything else (such as any of the m operands) */
+-  /* We use %edi (for new_val1) instead of a memory operand and swap    */
+-  /* instruction instead of push/pop because some GCC releases have     */
+-  /* a bug in processing memory operands (if address base is %esp) in   */
+-  /* the inline assembly after push.                                    */
+-  __asm__ __volatile__("xchg %%ebx,%6;" /* swap GOT ptr and new_val1 */
+-                       "lock; cmpxchg8b %0; setz %1;"
+-                       "xchg %%ebx,%6;" /* restore ebx and edi */
+-                       : "=m"(*addr), "=a"(result)
+-                       : "m"(*addr), "d" (old_val2), "a" (old_val1),
+-                         "c" (new_val2), "D" (new_val1) : "memory");
+-#else
+-  /* We can't just do the same thing in non-PIC mode, because GCC
+-   * might be using %ebx as the memory operand.  We could have ifdef'd
+-   * in a clobber, but there's no point doing the push/pop if we don't
+-   * have to. */
+-  __asm__ __volatile__("lock; cmpxchg8b %0; setz %1;"
+-                       : "=m"(*addr), "=a"(result)
+-                       : "m"(*addr), "d" (old_val2), "a" (old_val1),
++# ifdef __PIC__
++    AO_t saved_ebx;
++
++    /* If PIC is turned on, we cannot use ebx as it is reserved for the */
++    /* GOT pointer.  We should save and restore ebx.  The proposed      */
++    /* solution is not so efficient as the older alternatives using     */
++    /* push ebx or edi as new_val1 (w/o clobbering edi and temporary    */
++    /* local variable usage) but it is more portable (it works even if  */
++    /* ebx is not used as GOT pointer, and it works for the buggy GCC   */
++    /* releases that incorrectly evaluate memory operands offset in the */
++    /* inline assembly after push).                                     */
++#   ifdef __OPTIMIZE__
++      __asm__ __volatile__("mov %%ebx, %2\n\t" /* save ebx */
++                           "lea %0, %%edi\n\t" /* in case addr is in ebx */
++                           "mov %7, %%ebx\n\t" /* load new_val1 */
++                           "lock; cmpxchg8b (%%edi)\n\t"
++                           "mov %2, %%ebx\n\t" /* restore ebx */
++                           "setz %1"
++                        : "=m" (*addr), "=a" (result), "=m" (saved_ebx)
++                        : "m" (*addr), "d" (old_val2), "a" (old_val1),
++                          "c" (new_val2), "m" (new_val1)
++                        : "%edi", "memory");
++#   else
++      /* A less-efficient code manually preserving edi if GCC invoked   */
++      /* with -O0 option (otherwise it fails while finding a register   */
++      /* in class 'GENERAL_REGS').                                      */
++      AO_t saved_edi;
++      __asm__ __volatile__("mov %%edi, %3\n\t" /* save edi */
++                           "mov %%ebx, %2\n\t" /* save ebx */
++                           "lea %0, %%edi\n\t" /* in case addr is in ebx */
++                           "mov %8, %%ebx\n\t" /* load new_val1 */
++                           "lock; cmpxchg8b (%%edi)\n\t"
++                           "mov %2, %%ebx\n\t" /* restore ebx */
++                           "mov %3, %%edi\n\t" /* restore edi */
++                           "setz %1"
++                        : "=m" (*addr), "=a" (result),
++                          "=m" (saved_ebx), "=m" (saved_edi)
++                        : "m" (*addr), "d" (old_val2), "a" (old_val1),
++                          "c" (new_val2), "m" (new_val1) : "memory");
++#   endif
++# else
++    /* For non-PIC mode, this operation could be simplified (and be     */
++    /* faster) by using ebx as new_val1 (GCC would refuse to compile    */
++    /* such code for PIC mode).                                         */
++    __asm__ __volatile__("lock; cmpxchg8b %0; setz %1"
++                       : "=m" (*addr), "=a" (result)
++                       : "m" (*addr), "d" (old_val2), "a" (old_val1),
+                          "c" (new_val2), "b" (new_val1) : "memory");
+-#endif
++# endif
+   return (int) result;
+ }
+ #define AO_HAVE_compare_double_and_swap_double_full
diff --git a/meta/recipes-multimedia/pulseaudio/libatomics-ops_7.2.bb b/meta/recipes-multimedia/pulseaudio/libatomics-ops_7.2.bb
index f31f983..53e6154 100644
--- a/meta/recipes-multimedia/pulseaudio/libatomics-ops_7.2.bb
+++ b/meta/recipes-multimedia/pulseaudio/libatomics-ops_7.2.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = "file://doc/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 PR = "r1"
 
 SRC_URI = "http://www.hpl.hp.com/research/linux/atomic_ops/download/libatomic_ops-${PV}.tar.gz \
+           file://fix-AO_compare_double_and_swap_double_full.patch \
           "
 
 SRC_URI[md5sum] = "890acdc83a7cd10e2e9536062d3741c8"
-- 
1.7.11.7


