Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RWZhC-0002KL-Oz
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 21:26:59 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 02 Dec 2011 12:20:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,285,1320652800"; d="scan'208";a="43396290"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by AZSMGA002.ch.intel.com with ESMTP; 02 Dec 2011 12:20:12 -0800
From: nitin.a.kamble@intel.com
To: hjl.tools@gmail.com,
	openembedded-core@lists.openembedded.org
Date: Fri,  2 Dec 2011 12:20:06 -0800
Message-Id: <b05531b69f374074b00203c155d66a955d067d94.1322856805.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <a92d45d71d2d4aec2774e8feb23fcfdffaa8b2bc.1322856805.git.nitin.a.kamble@intel.com>
References: <a92d45d71d2d4aec2774e8feb23fcfdffaa8b2bc.1322856805.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1322856805.git.nitin.a.kamble@intel.com>
References: <cover.1322856805.git.nitin.a.kamble@intel.com>
Subject: [PATCH 08/11] liboil: patch source code for x32
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
X-List-Received-Date: Fri, 02 Dec 2011 20:26:59 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Make the assembly syntax compatible with x32 gcc. Othewise x32 gcc throws errors.

This Fixes bug: [YOCTO #1412]

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../liboil/liboil-0.3.17/liboil_fix_for_x32.patch  |  222 ++++++++++++++++++++
 meta/recipes-support/liboil/liboil_0.3.17.bb       |    3 +-
 2 files changed, 224 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-support/liboil/liboil-0.3.17/liboil_fix_for_x32.patch

diff --git a/meta/recipes-support/liboil/liboil-0.3.17/liboil_fix_for_x32.patch b/meta/recipes-support/liboil/liboil-0.3.17/liboil_fix_for_x32.patch
new file mode 100644
index 0000000..473380e
--- /dev/null
+++ b/meta/recipes-support/liboil/liboil-0.3.17/liboil_fix_for_x32.patch
@@ -0,0 +1,222 @@
+Upstream-Status: Pending
+
+Make the assembly syntax compatible with x32 gcc. Othewise x32 gcc throws errors.
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
+2011/12/01
+
+
+Index: liboil-0.3.17/liboil/amd64/wavelet.c
+===================================================================
+--- liboil-0.3.17.orig/liboil/amd64/wavelet.c
++++ liboil-0.3.17/liboil/amd64/wavelet.c
+@@ -21,14 +21,14 @@ deinterleave2_asm (int16_t *d1, int16_t 
+   asm volatile ("\n"
+       "  sub $2, %%rcx\n"
+       "1:\n"
+-      "  movw (%1,%%rcx,4), %%ax\n"
+-      "  movw %%ax, (%0,%%rcx,2)\n"
+-      "  movw 2(%1,%%rcx,4), %%ax\n"
+-      "  movw %%ax, (%2,%%rcx,2)\n"
+-      "  movw 4(%1,%%rcx,4), %%ax\n"
+-      "  movw %%ax, 2(%0,%%rcx,2)\n"
+-      "  movw 6(%1,%%rcx,4), %%ax\n"
+-      "  movw %%ax, 2(%2,%%rcx,2)\n"
++      "  movw (%q1,%%rcx,4), %%ax\n"
++      "  movw %%ax, (%q0,%%rcx,2)\n"
++      "  movw 2(%q1,%%rcx,4), %%ax\n"
++      "  movw %%ax, (%q2,%%rcx,2)\n"
++      "  movw 4(%q1,%%rcx,4), %%ax\n"
++      "  movw %%ax, 2(%q0,%%rcx,2)\n"
++      "  movw 6(%q1,%%rcx,4), %%ax\n"
++      "  movw %%ax, 2(%q2,%%rcx,2)\n"
+       "  sub $2, %%rcx\n"
+       "  jge 1b\n"
+       : "+r" (d1), "+r" (s_2xn), "+r" (d2), "+c" (n)
+@@ -53,20 +53,20 @@ deinterleave2_mmx (int16_t *d1, int16_t 
+   asm volatile ("\n"
+       "  xor %%rcx, %%rcx\n"
+       "1:\n"
+-      "  movq (%1,%%rcx,4), %%mm0\n"
+-      "  movq 8(%1,%%rcx,4), %%mm1\n"
++      "  movq (%q1,%%rcx,4), %%mm0\n"
++      "  movq 8(%q1,%%rcx,4), %%mm1\n"
+       "  pslld $16, %%mm0\n"
+       "  pslld $16, %%mm1\n"
+       "  psrad $16, %%mm0\n"
+       "  psrad $16, %%mm1\n"
+       "  packssdw %%mm1, %%mm0\n"
+-      "  movq %%mm0, (%0,%%rcx,2)\n"
+-      "  movq (%1,%%rcx,4), %%mm0\n"
+-      "  movq 8(%1,%%rcx,4), %%mm1\n"
++      "  movq %%mm0, (%q0,%%rcx,2)\n"
++      "  movq (%q1,%%rcx,4), %%mm0\n"
++      "  movq 8(%q1,%%rcx,4), %%mm1\n"
+       "  psrad $16, %%mm0\n"
+       "  psrad $16, %%mm1\n"
+       "  packssdw %%mm1, %%mm0\n"
+-      "  movq %%mm0, (%2,%%rcx,2)\n"
++      "  movq %%mm0, (%q2,%%rcx,2)\n"
+       "  add $4, %%rcx\n"
+       "  cmp %3, %%ecx\n"
+       "  jl 1b\n"
+@@ -93,10 +93,10 @@ deinterleave2_mmx_2 (int16_t *d1, int16_
+   asm volatile ("\n"
+       "  xor %%rcx, %%rcx\n"
+       "1:\n"
+-      "  pshufw $0xd8, (%1,%%rcx,4), %%mm0\n"
+-      "  movd %%mm0, (%0,%%rcx,2)\n"
+-      "  pshufw $0x8d, (%1,%%rcx,4), %%mm0\n"
+-      "  movd %%mm0, (%2,%%rcx,2)\n"
++      "  pshufw $0xd8, (%q1,%%rcx,4), %%mm0\n"
++      "  movd %%mm0, (%q0,%%rcx,2)\n"
++      "  pshufw $0x8d, (%q1,%%rcx,4), %%mm0\n"
++      "  movd %%mm0, (%q2,%%rcx,2)\n"
+       "  add $2, %%rcx\n"
+       "  cmp %3, %%ecx\n"
+       "  jl 1b\n"
+@@ -123,16 +123,16 @@ deinterleave2_mmx_3 (int16_t *d1, int16_
+   asm volatile ("\n"
+       "  xor %%rcx, %%rcx\n"
+       "1:\n"
+-      "  movq (%1,%%rcx,4), %%mm1\n"
+-      "  movq (%1,%%rcx,4), %%mm2\n"
+-      "  movq 8(%1,%%rcx,4), %%mm0\n"
++      "  movq (%q1,%%rcx,4), %%mm1\n"
++      "  movq (%q1,%%rcx,4), %%mm2\n"
++      "  movq 8(%q1,%%rcx,4), %%mm0\n"
+       "  punpcklwd %%mm0, %%mm1\n"
+       "  punpckhwd %%mm0, %%mm2\n"
+       "  movq %%mm1, %%mm0\n"
+       "  punpcklwd %%mm2, %%mm0\n"
+       "  punpckhwd %%mm2, %%mm1\n"
+-      "  movq %%mm0, (%0,%%rcx,2)\n"
+-      "  movq %%mm1, (%2,%%rcx,2)\n"
++      "  movq %%mm0, (%q0,%%rcx,2)\n"
++      "  movq %%mm1, (%q2,%%rcx,2)\n"
+       "  add $4, %%rcx\n"
+       "  cmp %3, %%ecx\n"
+       "  jl 1b\n"
+@@ -159,26 +159,26 @@ deinterleave2_mmx_4 (int16_t *d1, int16_
+   asm volatile ("\n"
+       "  xor %%rcx, %%rcx\n"
+       "1:\n"
+-      "  movq (%1,%%rcx,4), %%mm1\n"
++      "  movq (%q1,%%rcx,4), %%mm1\n"
+       "  movq %%mm1, %%mm2\n"
+-      "  movq 8(%1,%%rcx,4), %%mm0\n"
+-      "   movq 16(%1,%%rcx,4), %%mm5\n"
++      "  movq 8(%q1,%%rcx,4), %%mm0\n"
++      "   movq 16(%q1,%%rcx,4), %%mm5\n"
+       "  punpcklwd %%mm0, %%mm1\n"
+       "   movq %%mm5, %%mm6\n"
+       "  punpckhwd %%mm0, %%mm2\n"
+-      "   movq 24(%1,%%rcx,4), %%mm4\n"
++      "   movq 24(%q1,%%rcx,4), %%mm4\n"
+       "  movq %%mm1, %%mm0\n"
+       "   punpcklwd %%mm4, %%mm5\n"
+       "  punpcklwd %%mm2, %%mm0\n"
+       "   punpckhwd %%mm4, %%mm6\n"
+       "  punpckhwd %%mm2, %%mm1\n"
+       "   movq %%mm5, %%mm4\n"
+-      "  movq %%mm0, (%0,%%rcx,2)\n"
++      "  movq %%mm0, (%q0,%%rcx,2)\n"
+       "   punpcklwd %%mm6, %%mm4\n"
+-      "  movq %%mm1, (%2,%%rcx,2)\n"
++      "  movq %%mm1, (%q2,%%rcx,2)\n"
+       "   punpckhwd %%mm6, %%mm5\n"
+-      "   movq %%mm4, 8(%0,%%rcx,2)\n"
+-      "   movq %%mm5, 8(%2,%%rcx,2)\n"
++      "   movq %%mm4, 8(%q0,%%rcx,2)\n"
++      "   movq %%mm5, 8(%q2,%%rcx,2)\n"
+       "  add $8, %%rcx\n"
+       "  cmp %3, %%ecx\n"
+       "  jl 1b\n"
+@@ -252,13 +252,13 @@ interleave2_mmx (int16_t *d_2xn, int16_t
+   asm volatile ("\n"
+       "  xor %%rcx, %%rcx\n"
+       "1:\n"
+-      "  movq (%1,%%rcx,2), %%mm0\n"
+-      "  movq (%2,%%rcx,2), %%mm1\n"
++      "  movq (%q1,%%rcx,2), %%mm0\n"
++      "  movq (%q2,%%rcx,2), %%mm1\n"
+       "  movq %%mm0, %%mm2\n"
+       "  punpckhwd %%mm1, %%mm0\n"
+       "  punpcklwd %%mm1, %%mm2\n"
+-      "  movq %%mm2, (%0,%%rcx,4)\n"
+-      "  movq %%mm0, 8(%0,%%rcx,4)\n"
++      "  movq %%mm2, (%q0,%%rcx,4)\n"
++      "  movq %%mm0, 8(%q0,%%rcx,4)\n"
+       "  add $4, %%rcx\n"
+       "  cmp %3, %%ecx\n"
+       "  jl 1b\n"
+@@ -285,12 +285,12 @@ lift_add_shift1_mmx (int16_t *d, int16_t
+   asm volatile ("\n"
+       "  xor %%rcx, %%rcx\n"
+       "1:\n"
+-      "  movq (%2,%%rcx,2), %%mm1\n"
+-      "  movq (%3,%%rcx,2), %%mm2\n"
++      "  movq (%q2,%%rcx,2), %%mm1\n"
++      "  movq (%q3,%%rcx,2), %%mm2\n"
+       "  paddw %%mm2, %%mm1\n"
+       "  psraw $1, %%mm1\n"
+-      "  paddw (%1,%%rcx,2), %%mm1\n"
+-      "  movq %%mm1, (%0,%%rcx,2)\n"
++      "  paddw (%q1,%%rcx,2), %%mm1\n"
++      "  movq %%mm1, (%q0,%%rcx,2)\n"
+       "  add $4, %%rcx\n"
+       "  cmp %4, %%ecx\n"
+       "  jl 1b\n"
+@@ -317,13 +317,13 @@ lift_sub_shift1_mmx (int16_t *d, int16_t
+   asm volatile ("\n"
+       "  xor %%rcx, %%rcx\n"
+       "1:\n"
+-      "  movq (%2,%%rcx,2), %%mm1\n"
+-      "  movq (%3,%%rcx,2), %%mm2\n"
+-      "  movq (%1,%%rcx,2), %%mm0\n"
++      "  movq (%q2,%%rcx,2), %%mm1\n"
++      "  movq (%q3,%%rcx,2), %%mm2\n"
++      "  movq (%q1,%%rcx,2), %%mm0\n"
+       "  paddw %%mm2, %%mm1\n"
+       "  psraw $1, %%mm1\n"
+       "  psubw %%mm1, %%mm0\n"
+-      "  movq %%mm0, (%0,%%rcx,2)\n"
++      "  movq %%mm0, (%q0,%%rcx,2)\n"
+       "  add $4, %%rcx\n"
+       "  cmp %4, %%ecx\n"
+       "  jl 1b\n"
+@@ -350,12 +350,12 @@ lift_add_shift2_mmx (int16_t *d, int16_t
+   asm volatile ("\n"
+       "  xor %%rcx, %%rcx\n"
+       "1:\n"
+-      "  movq (%2,%%rcx,2), %%mm1\n"
+-      "  movq (%3,%%rcx,2), %%mm2\n"
++      "  movq (%q2,%%rcx,2), %%mm1\n"
++      "  movq (%q3,%%rcx,2), %%mm2\n"
+       "  paddw %%mm2, %%mm1\n"
+       "  psraw $2, %%mm1\n"
+-      "  paddw (%1,%%rcx,2), %%mm1\n"
+-      "  movq %%mm1, (%0,%%rcx,2)\n"
++      "  paddw (%q1,%%rcx,2), %%mm1\n"
++      "  movq %%mm1, (%q0,%%rcx,2)\n"
+       "  add $4, %%rcx\n"
+       "  cmp %4, %%ecx\n"
+       "  jl 1b\n"
+@@ -382,13 +382,13 @@ lift_sub_shift2_mmx (int16_t *d, int16_t
+   asm volatile ("\n"
+       "  xor %%rcx, %%rcx\n"
+       "1:\n"
+-      "  movq (%2,%%rcx,2), %%mm1\n"
+-      "  movq (%3,%%rcx,2), %%mm2\n"
+-      "  movq (%1,%%rcx,2), %%mm0\n"
++      "  movq (%q2,%%rcx,2), %%mm1\n"
++      "  movq (%q3,%%rcx,2), %%mm2\n"
++      "  movq (%q1,%%rcx,2), %%mm0\n"
+       "  paddw %%mm2, %%mm1\n"
+       "  psraw $2, %%mm1\n"
+       "  psubw %%mm1, %%mm0\n"
+-      "  movq %%mm0, (%0,%%rcx,2)\n"
++      "  movq %%mm0, (%q0,%%rcx,2)\n"
+       "  add $4, %%rcx\n"
+       "  cmp %4, %%ecx\n"
+       "  jl 1b\n"
diff --git a/meta/recipes-support/liboil/liboil_0.3.17.bb b/meta/recipes-support/liboil/liboil_0.3.17.bb
index 10a845e..b1e21ab 100644
--- a/meta/recipes-support/liboil/liboil_0.3.17.bb
+++ b/meta/recipes-support/liboil/liboil_0.3.17.bb
@@ -10,12 +10,13 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ad80780d9c5205d63481a0184e199a15 \
                     file://testsuite/trans.c;endline=29;md5=380ecd43121fe3dcc0d8d7e5984f283d"
 
 DEPENDS = "glib-2.0"
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "http://liboil.freedesktop.org/download/${BPN}-${PV}.tar.gz \
            file://no-tests.patch \
            file://fix-unaligned-whitelist.patch \
            file://0001-Fix-enable-vfp-flag.patch \
+           file://liboil_fix_for_x32.patch \
           "
 
 SRC_URI[md5sum] = "47dc734f82faeb2964d97771cfd2e701"
-- 
1.7.6.4



