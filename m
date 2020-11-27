Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web10.16537.1606468768976797322
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2020 01:19:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.78,373,1599494400"; 
   d="scan'208";a="101818477"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 27 Nov 2020 17:19:09 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id 667FB4CE5CEB
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2020 17:19:08 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 27 Nov 2020 17:19:08 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] pulseaudio: upgrade 13.0 -> 14.0
Date: Fri, 27 Nov 2020 17:19:07 +0800
Message-ID: <1606468747-124294-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 667FB4CE5CEB.A8F15
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

0001-remap-arm-Adjust-inline-asm-constraints.patch
0001-remap_neon-use-register-r12-instead-of-r7.patch
Removed since these are included in 14.0.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...ap-arm-Adjust-inline-asm-constraints.patch | 114 ------------------
 ..._neon-use-register-r12-instead-of-r7.patch |  48 --------
 ...{pulseaudio_13.0.bb => pulseaudio_14.0.bb} |   6 +-
 3 files changed, 2 insertions(+), 166 deletions(-)
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-remap-arm-Adjust-inline-asm-constraints.patch
 delete mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-remap_neon-use-register-r12-instead-of-r7.patch
 rename meta/recipes-multimedia/pulseaudio/{pulseaudio_13.0.bb => pulseaudio_14.0.bb} (57%)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-remap-arm-Adjust-inline-asm-constraints.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-remap-arm-Adjust-inline-asm-constraints.patch
deleted file mode 100644
index 95133fd9d4..0000000000
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-remap-arm-Adjust-inline-asm-constraints.patch
+++ /dev/null
@@ -1,114 +0,0 @@
-From 3450d1fcfe8a8f84553ab299cd96ae0705ddffbe Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 5 Mar 2020 11:48:28 -0800
-Subject: [PATCH] remap/arm: Adjust inline asm constraints
-
-gcc10 can effectively emit single precision registers if right
-operand modifier constraint is not in use
-
-This results in assembler rejecting the code
-
-/tmp/ccEG4QpI.s:646: Error: VFP/Neon double precision register expected -- `vtbl.8 d3,{d0,d1},s8'
-/tmp/ccEG4QpI.s:678: Error: invalid instruction shape -- `vmul.f32 d0,d0,s8'
-
-Therefore add %P qualifier to request double registers sinece 'w' could
-mean variable could be stored in s0..s14 and GCC defaults to printing out s0..s14.
-Note those registers map to d0..d7 also.
-
-Output generated is exactly same with gcc9, and it also now compiles
-with gcc10
-
-Its not documented well in gcc docs and there is a ticket for that
-https://gcc.gnu.org/bugzilla/show_bug.cgi?id=84343
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/merge_requests/261]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/pulsecore/remap_neon.c | 22 +++++++++++-----------
- 1 file changed, 11 insertions(+), 11 deletions(-)
-
-diff --git a/src/pulsecore/remap_neon.c b/src/pulsecore/remap_neon.c
-index 41208986d..ca3b95b48 100644
---- a/src/pulsecore/remap_neon.c
-+++ b/src/pulsecore/remap_neon.c
-@@ -189,7 +189,7 @@ static void remap_ch4_to_mono_float32ne_neon(pa_remap_t *m, float *dst, const fl
-             "vadd.f32   d0, d0, d1              \n\t"
-             "vadd.f32   d2, d2, d3              \n\t"
-             "vadd.f32   d0, d0, d2              \n\t"
--            "vmul.f32   d0, d0, %[quart]        \n\t"
-+            "vmul.f32   d0, d0, %P[quart]       \n\t"
-             "vst1.32    {d0}, [%[dst]]!         \n\t"
-             : [dst] "+r" (dst), [src] "+r" (src) /* output operands */
-             : [quart] "w" (quart) /* input operands */
-@@ -276,7 +276,7 @@ static void remap_arrange_stereo_s16ne_neon(pa_remap_t *m, int16_t *dst, const i
-     for (; n >= 2; n -= 2) {
-         __asm__ __volatile__ (
-             "vld1.s16   d0, [%[src]]!           \n\t"
--            "vtbl.8     d0, {d0}, %[t]          \n\t"
-+            "vtbl.8     d0, {d0}, %P[t]         \n\t"
-             "vst1.s16   d0, [%[dst]]!           \n\t"
-             : [dst] "+r" (dst), [src] "+r" (src) /* output operands */
-             : [t] "w" (t) /* input operands */
-@@ -287,7 +287,7 @@ static void remap_arrange_stereo_s16ne_neon(pa_remap_t *m, int16_t *dst, const i
-     if (n > 0) {
-         __asm__ __volatile__ (
-             "vld1.32   d0[0], [%[src]]!         \n\t"
--            "vtbl.8    d0, {d0}, %[t]           \n\t"
-+            "vtbl.8    d0, {d0}, %P[t]          \n\t"
-             "vst1.32   d0[0], [%[dst]]!         \n\t"
-             : [dst] "+r" (dst), [src] "+r" (src) /* output operands */
-             : [t] "w" (t) /* input operands */
-@@ -302,8 +302,8 @@ static void remap_arrange_ch2_ch4_s16ne_neon(pa_remap_t *m, int16_t *dst, const
-     for (; n > 0; n--) {
-         __asm__ __volatile__ (
-             "vld1.32    d0[0], [%[src]]!           \n\t"
--            "vtbl.8     d0, {d0}, %[t]          \n\t"
--            "vst1.s16   d0, [%[dst]]!           \n\t"
-+            "vtbl.8     d0, {d0}, %P[t]            \n\t"
-+            "vst1.s16   d0, [%[dst]]!              \n\t"
-             : [dst] "+r" (dst), [src] "+r" (src) /* output operands */
-             : [t] "w" (t) /* input operands */
-             : "memory", "d0" /* clobber list */
-@@ -317,7 +317,7 @@ static void remap_arrange_ch4_s16ne_neon(pa_remap_t *m, int16_t *dst, const int1
-     for (; n > 0; n--) {
-         __asm__ __volatile__ (
-             "vld1.s16   d0, [%[src]]!           \n\t"
--            "vtbl.8     d0, {d0}, %[t]          \n\t"
-+            "vtbl.8     d0, {d0}, %P[t]         \n\t"
-             "vst1.s16   d0, [%[dst]]!           \n\t"
-             : [dst] "+r" (dst), [src] "+r" (src) /* output operands */
-             : [t] "w" (t) /* input operands */
-@@ -332,7 +332,7 @@ static void remap_arrange_stereo_float32ne_neon(pa_remap_t *m, float *dst, const
-     for (; n > 0; n--) {
-         __asm__ __volatile__ (
-             "vld1.f32   d0, [%[src]]!           \n\t"
--            "vtbl.8     d0, {d0}, %[t]          \n\t"
-+            "vtbl.8     d0, {d0}, %P[t]         \n\t"
-             "vst1.s16   {d0}, [%[dst]]!         \n\t"
-             : [dst] "+r" (dst), [src] "+r" (src) /* output operands */
-             : [t] "w" (t) /* input operands */
-@@ -349,8 +349,8 @@ static void remap_arrange_ch2_ch4_any32ne_neon(pa_remap_t *m, float *dst, const
-     for (; n > 0; n--) {
-         __asm__ __volatile__ (
-             "vld1.f32   d0, [%[src]]!           \n\t"
--            "vtbl.8     d1, {d0}, %[t0]         \n\t"
--            "vtbl.8     d2, {d0}, %[t1]         \n\t"
-+            "vtbl.8     d1, {d0}, %P[t0]        \n\t"
-+            "vtbl.8     d2, {d0}, %P[t1]        \n\t"
-             "vst1.s16   {d1,d2}, [%[dst]]!      \n\t"
-             : [dst] "+r" (dst), [src] "+r" (src) /* output operands */
-             : [t0] "w" (t0), [t1] "w" (t1) /* input operands */
-@@ -366,8 +366,8 @@ static void remap_arrange_ch4_float32ne_neon(pa_remap_t *m, float *dst, const fl
-     for (; n > 0; n--) {
-         __asm__ __volatile__ (
-             "vld1.f32   {d0,d1}, [%[src]]!      \n\t"
--            "vtbl.8     d2, {d0,d1}, %[t0]      \n\t"
--            "vtbl.8     d3, {d0,d1}, %[t1]      \n\t"
-+            "vtbl.8     d2, {d0,d1}, %P[t0]     \n\t"
-+            "vtbl.8     d3, {d0,d1}, %P[t1]     \n\t"
-             "vst1.s16   {d2,d3}, [%[dst]]!      \n\t"
-             : [dst] "+r" (dst), [src] "+r" (src) /* output operands */
-             : [t0] "w" (t0), [t1] "w" (t1) /* input operands */
--- 
-2.25.1
-
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-remap_neon-use-register-r12-instead-of-r7.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-remap_neon-use-register-r12-instead-of-r7.patch
deleted file mode 100644
index aaa162f9b0..0000000000
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-remap_neon-use-register-r12-instead-of-r7.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 4a1668f341f0228904105f77fe5871b9d59b2663 Mon Sep 17 00:00:00 2001
-From: Tanu Kaskinen <tanuk@iki.fi>
-Date: Mon, 13 Jul 2020 12:42:14 +0300
-Subject: [PATCH] remap_neon: use register r12 instead of r7
-
-When the Thumb instructions set is used and frame pointers are enabled
-(-fno-omit-frame-pointer), r7 can't be used, because it's used for the
-frame pointer. Trying to use r7 caused the compilation to fail.
-
-Thanks to Andre McCurdy for suggesting[1] this fix, all I had to do was to
-test that it works. The code builds now, and cpu-remap-test also
-succeeds.
-
-[1] https://lists.openembedded.org/g/openembedded-core/message/136786
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/merge_requests/324]
-
-Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
----
- src/pulsecore/remap_neon.c | 10 +++++++---
- 1 file changed, 7 insertions(+), 3 deletions(-)
-
-diff --git a/src/pulsecore/remap_neon.c b/src/pulsecore/remap_neon.c
-index ca3b95b48..6f71345f8 100644
---- a/src/pulsecore/remap_neon.c
-+++ b/src/pulsecore/remap_neon.c
-@@ -52,11 +52,15 @@ static void remap_mono_to_stereo_float32ne_generic_arm(pa_remap_t *m, float *dst
-         __asm__ __volatile__ (
-             "ldm        %[src]!, {r4,r6}        \n\t"
-             "mov        r5, r4                  \n\t"
--            "mov        r7, r6                  \n\t"
--            "stm        %[dst]!, {r4-r7}        \n\t"
-+
-+            /* We use r12 instead of r7 here, because r7 is reserved for the
-+             * frame pointer when using Thumb. */
-+            "mov        r12, r6                 \n\t"
-+
-+            "stm        %[dst]!, {r4-r6,r12}    \n\t"
-             : [dst] "+r" (dst), [src] "+r" (src) /* output operands */
-             : /* input operands */
--            : "memory", "r4", "r5", "r6", "r7" /* clobber list */
-+            : "memory", "r4", "r5", "r6", "r12" /* clobber list */
-         );
-     }
- 
--- 
-2.20.1
-
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_13.0.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb
similarity index 57%
rename from meta/recipes-multimedia/pulseaudio/pulseaudio_13.0.bb
rename to meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb
index 53e9a2357d..ac0c82e37d 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_13.0.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb
@@ -3,10 +3,8 @@ require pulseaudio.inc
 SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/${BP}.tar.xz \
            file://0001-client-conf-Add-allow-autospawn-for-root.patch \
            file://0002-do-not-display-CLFAGS-to-improve-reproducibility-bui.patch \
-           file://0001-remap-arm-Adjust-inline-asm-constraints.patch \
-           file://0001-remap_neon-use-register-r12-instead-of-r7.patch \
            file://volatiles.04_pulse \
            "
-SRC_URI[md5sum] = "e41d606f90254ed45c90520faf83d95c"
-SRC_URI[sha256sum] = "961b23ca1acfd28f2bc87414c27bb40e12436efcf2158d29721b1e89f3f28057"
+SRC_URI[md5sum] = "84a7776e63dd55c40db8fbd7c7e2e18e"
+SRC_URI[sha256sum] = "a834775d9382b055504e5ee7625dc50768daac29329531deb6597bf05e06c261"
 UPSTREAM_CHECK_REGEX = "pulseaudio-(?P<pver>\d+(\.(?!99)\d+)+)\.tar"
-- 
2.25.1



