Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RZ5DX-000497-AA
	for openembedded-core@openembedded.org; Fri, 09 Dec 2011 19:30:45 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Dec 2011 10:23:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="100564237"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.35])
	by fmsmga002.fm.intel.com with ESMTP; 09 Dec 2011 10:23:51 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Fri,  9 Dec 2011 10:23:39 -0800
Message-Id: <2f2356128ec56b43a886c8004ad5c8aafb433153.1323454935.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1323454935.git.sgw@linux.intel.com>
References: <cover.1323454935.git.sgw@linux.intel.com>
In-Reply-To: <cover.1323454935.git.sgw@linux.intel.com>
References: <cover.1323454935.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 06/15] pulseaudio: fix compilation with x32 toolchain
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
X-List-Received-Date: Fri, 09 Dec 2011 18:30:45 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

This commit makes assembly syntax compatible with x32 toolchain
to avoid x32 gcc errors.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../pulseaudio/pulseaudo_fix_for_x32.patch         |  225 ++++++++++++++++++++
 .../pulseaudio/pulseaudio_1.1.bb                   |    3 +-
 2 files changed, 227 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/pulseaudo_fix_for_x32.patch

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/pulseaudo_fix_for_x32.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/pulseaudo_fix_for_x32.patch
new file mode 100644
index 0000000..22fe2e7
--- /dev/null
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio/pulseaudo_fix_for_x32.patch
@@ -0,0 +1,225 @@
+UpstreamStatus: Pending
+
+This patch makes assembly syntax compatible to the x32 toolchain.
+
+This fixes compilations errors with x32 gcc.
+
+Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com> 2011/12/03
+Index: pulseaudio-1.1/src/pulsecore/svolume_mmx.c
+===================================================================
+--- pulseaudio-1.1.orig/src/pulsecore/svolume_mmx.c
++++ pulseaudio-1.1/src/pulsecore/svolume_mmx.c
+@@ -107,7 +107,7 @@ static void pa_volume_s16ne_mmx(int16_t 
+         " test $1, %2                   \n\t" /* check for odd samples */
+         " je 2f                         \n\t"
+ 
+-        " movd (%1, %3, 4), %%mm0       \n\t" /* |  v0h  |  v0l  | */
++        " movd (%q1, %3, 4), %%mm0       \n\t" /* |  v0h  |  v0l  | */
+         " movw (%0), %w4                \n\t" /*     ..  |  p0   | */
+         " movd %4, %%mm1                \n\t"
+         VOLUME_32x16 (%%mm1, %%mm0)
+@@ -122,7 +122,7 @@ static void pa_volume_s16ne_mmx(int16_t 
+         " je 4f                         \n\t"
+ 
+         "3:                             \n\t" /* do samples in groups of 2 */
+-        " movq (%1, %3, 4), %%mm0       \n\t" /* |  v1h  |  v1l  |  v0h  |  v0l  | */
++        " movq (%q1, %3, 4), %%mm0       \n\t" /* |  v1h  |  v1l  |  v0h  |  v0l  | */
+         " movd (%0), %%mm1              \n\t" /*              .. |   p1  |  p0   | */
+         VOLUME_32x16 (%%mm1, %%mm0)
+         " movd %%mm0, (%0)              \n\t" /*              .. | p1*v1 | p0*v0 | */
+@@ -135,8 +135,8 @@ static void pa_volume_s16ne_mmx(int16_t 
+         " je 6f                         \n\t"
+ 
+         "5:                             \n\t" /* do samples in groups of 4 */
+-        " movq (%1, %3, 4), %%mm0       \n\t" /* |  v1h  |  v1l  |  v0h  |  v0l  | */
+-        " movq 8(%1, %3, 4), %%mm2      \n\t" /* |  v3h  |  v3l  |  v2h  |  v2l  | */
++        " movq (%q1, %3, 4), %%mm0       \n\t" /* |  v1h  |  v1l  |  v0h  |  v0l  | */
++        " movq 8(%q1, %3, 4), %%mm2      \n\t" /* |  v3h  |  v3l  |  v2h  |  v2l  | */
+         " movd (%0), %%mm1              \n\t" /*              .. |   p1  |  p0   | */
+         " movd 4(%0), %%mm3             \n\t" /*              .. |   p3  |  p2   | */
+         VOLUME_32x16 (%%mm1, %%mm0)
+@@ -180,7 +180,7 @@ static void pa_volume_s16re_mmx(int16_t 
+         " test $1, %2                   \n\t" /* check for odd samples */
+         " je 2f                         \n\t"
+ 
+-        " movd (%1, %3, 4), %%mm0       \n\t" /* |  v0h  |  v0l  | */
++        " movd (%q1, %3, 4), %%mm0       \n\t" /* |  v0h  |  v0l  | */
+         " movw (%0), %w4                \n\t" /*     ..  |  p0   | */
+         " rorw $8, %w4                  \n\t"
+         " movd %4, %%mm1                \n\t"
+@@ -197,7 +197,7 @@ static void pa_volume_s16re_mmx(int16_t 
+         " je 4f                         \n\t"
+ 
+         "3:                             \n\t" /* do samples in groups of 2 */
+-        " movq (%1, %3, 4), %%mm0       \n\t" /* |  v1h  |  v1l  |  v0h  |  v0l  | */
++        " movq (%q1, %3, 4), %%mm0       \n\t" /* |  v1h  |  v1l  |  v0h  |  v0l  | */
+         " movd (%0), %%mm1              \n\t" /*              .. |   p1  |  p0   | */
+         SWAP_16 (%%mm1)
+         VOLUME_32x16 (%%mm1, %%mm0)
+@@ -212,8 +212,8 @@ static void pa_volume_s16re_mmx(int16_t 
+         " je 6f                         \n\t"
+ 
+         "5:                             \n\t" /* do samples in groups of 4 */
+-        " movq (%1, %3, 4), %%mm0       \n\t" /* |  v1h  |  v1l  |  v0h  |  v0l  | */
+-        " movq 8(%1, %3, 4), %%mm2      \n\t" /* |  v3h  |  v3l  |  v2h  |  v2l  | */
++        " movq (%q1, %3, 4), %%mm0       \n\t" /* |  v1h  |  v1l  |  v0h  |  v0l  | */
++        " movq 8(%q1, %3, 4), %%mm2      \n\t" /* |  v3h  |  v3l  |  v2h  |  v2l  | */
+         " movd (%0), %%mm1              \n\t" /*              .. |   p1  |  p0   | */
+         " movd 4(%0), %%mm3             \n\t" /*              .. |   p3  |  p2   | */
+         SWAP_16_2 (%%mm1, %%mm3)
+Index: pulseaudio-1.1/src/pulsecore/svolume_sse.c
+===================================================================
+--- pulseaudio-1.1.orig/src/pulsecore/svolume_sse.c
++++ pulseaudio-1.1/src/pulsecore/svolume_sse.c
+@@ -92,7 +92,7 @@ static void pa_volume_s16ne_sse2(int16_t
+         " test $1, %2                   \n\t" /* check for odd samples */
+         " je 2f                         \n\t"
+ 
+-        " movd (%1, %3, 4), %%xmm0      \n\t" /* |  v0h  |  v0l  | */
++        " movd (%q1, %3, 4), %%xmm0      \n\t" /* |  v0h  |  v0l  | */
+         " movw (%0), %w4                \n\t" /*     ..  |   p0  | */
+         " movd %4, %%xmm1               \n\t"
+         VOLUME_32x16 (%%xmm1, %%xmm0)
+@@ -107,7 +107,7 @@ static void pa_volume_s16ne_sse2(int16_t
+         " je 4f                         \n\t"
+ 
+         "3:                             \n\t" /* do samples in groups of 2 */
+-        " movq (%1, %3, 4), %%xmm0      \n\t" /* |  v1h  |  v1l  |  v0h  |  v0l  | */
++        " movq (%q1, %3, 4), %%xmm0      \n\t" /* |  v1h  |  v1l  |  v0h  |  v0l  | */
+         " movd (%0), %%xmm1             \n\t" /*              .. |   p1  |  p0   | */
+         VOLUME_32x16 (%%xmm1, %%xmm0)
+         " movd %%xmm0, (%0)             \n\t" /*              .. | p1*v1 | p0*v0 | */
+@@ -123,7 +123,7 @@ static void pa_volume_s16ne_sse2(int16_t
+          * that the array is 16 bytes aligned, we probably have to do the odd values
+          * after this then. */
+         "5:                             \n\t" /* do samples in groups of 4 */
+-        " movdqu (%1, %3, 4), %%xmm0    \n\t" /* |  v3h  |  v3l  ..  v0h  |  v0l  | */
++        " movdqu (%q1, %3, 4), %%xmm0    \n\t" /* |  v3h  |  v3l  ..  v0h  |  v0l  | */
+         " movq (%0), %%xmm1             \n\t" /*              .. |   p3  ..  p0   | */
+         VOLUME_32x16 (%%xmm1, %%xmm0)
+         " movq %%xmm0, (%0)             \n\t" /*              .. | p3*v3 .. p0*v0 | */
+@@ -136,8 +136,8 @@ static void pa_volume_s16ne_sse2(int16_t
+         " je 8f                         \n\t"
+ 
+         "7:                             \n\t" /* do samples in groups of 8 */
+-        " movdqu (%1, %3, 4), %%xmm0    \n\t" /* |  v3h  |  v3l  ..  v0h  |  v0l  | */
+-        " movdqu 16(%1, %3, 4), %%xmm2  \n\t" /* |  v7h  |  v7l  ..  v4h  |  v4l  | */
++        " movdqu (%q1, %3, 4), %%xmm0    \n\t" /* |  v3h  |  v3l  ..  v0h  |  v0l  | */
++        " movdqu 16(%q1, %3, 4), %%xmm2  \n\t" /* |  v7h  |  v7l  ..  v4h  |  v4l  | */
+         " movq (%0), %%xmm1             \n\t" /*              .. |   p3  ..  p0   | */
+         " movq 8(%0), %%xmm3            \n\t" /*              .. |   p7  ..  p4   | */
+         VOLUME_32x16 (%%xmm1, %%xmm0)
+@@ -176,7 +176,7 @@ static void pa_volume_s16re_sse2(int16_t
+         " test $1, %2                   \n\t" /* check for odd samples */
+         " je 2f                         \n\t"
+ 
+-        " movd (%1, %3, 4), %%xmm0      \n\t" /* |  v0h  |  v0l  | */
++        " movd (%q1, %3, 4), %%xmm0      \n\t" /* |  v0h  |  v0l  | */
+         " movw (%0), %w4                \n\t" /*     ..  |   p0  | */
+         " rorw $8, %w4                  \n\t"
+         " movd %4, %%xmm1               \n\t"
+@@ -193,7 +193,7 @@ static void pa_volume_s16re_sse2(int16_t
+         " je 4f                         \n\t"
+ 
+         "3:                             \n\t" /* do samples in groups of 2 */
+-        " movq (%1, %3, 4), %%xmm0      \n\t" /* |  v1h  |  v1l  |  v0h  |  v0l  | */
++        " movq (%q1, %3, 4), %%xmm0      \n\t" /* |  v1h  |  v1l  |  v0h  |  v0l  | */
+         " movd (%0), %%xmm1             \n\t" /*              .. |   p1  |  p0   | */
+         SWAP_16 (%%xmm1)
+         VOLUME_32x16 (%%xmm1, %%xmm0)
+@@ -211,7 +211,7 @@ static void pa_volume_s16re_sse2(int16_t
+          * that the array is 16 bytes aligned, we probably have to do the odd values
+          * after this then. */
+         "5:                             \n\t" /* do samples in groups of 4 */
+-        " movdqu (%1, %3, 4), %%xmm0    \n\t" /* |  v3h  |  v3l  ..  v0h  |  v0l  | */
++        " movdqu (%q1, %3, 4), %%xmm0    \n\t" /* |  v3h  |  v3l  ..  v0h  |  v0l  | */
+         " movq (%0), %%xmm1             \n\t" /*              .. |   p3  ..  p0   | */
+         SWAP_16 (%%xmm1)
+         VOLUME_32x16 (%%xmm1, %%xmm0)
+@@ -226,8 +226,8 @@ static void pa_volume_s16re_sse2(int16_t
+         " je 8f                         \n\t"
+ 
+         "7:                             \n\t" /* do samples in groups of 8 */
+-        " movdqu (%1, %3, 4), %%xmm0    \n\t" /* |  v3h  |  v3l  ..  v0h  |  v0l  | */
+-        " movdqu 16(%1, %3, 4), %%xmm2  \n\t" /* |  v7h  |  v7l  ..  v4h  |  v4l  | */
++        " movdqu (%q1, %3, 4), %%xmm0    \n\t" /* |  v3h  |  v3l  ..  v0h  |  v0l  | */
++        " movdqu 16(%q1, %3, 4), %%xmm2  \n\t" /* |  v7h  |  v7l  ..  v4h  |  v4l  | */
+         " movq (%0), %%xmm1             \n\t" /*              .. |   p3  ..  p0   | */
+         " movq 8(%0), %%xmm3            \n\t" /*              .. |   p7  ..  p4   | */
+         SWAP_16_2 (%%xmm1, %%xmm3)
+Index: pulseaudio-1.1/src/pulsecore/sconv_sse.c
+===================================================================
+--- pulseaudio-1.1.orig/src/pulsecore/sconv_sse.c
++++ pulseaudio-1.1/src/pulsecore/sconv_sse.c
+@@ -54,8 +54,8 @@ static void pa_sconv_s16le_from_f32ne_ss
+         " je 2f                         \n\t"
+ 
+         "1:                             \n\t"
+-        " movups (%2, %0, 2), %%xmm0    \n\t" /* read 8 floats */
+-        " movups 16(%2, %0, 2), %%xmm2  \n\t"
++        " movups (%q2, %0, 2), %%xmm0    \n\t" /* read 8 floats */
++        " movups 16(%q2, %0, 2), %%xmm2  \n\t"
+         " minps  %%xmm5, %%xmm0         \n\t" /* clamp to 1.0 */
+         " minps  %%xmm5, %%xmm2         \n\t"
+         " maxps  %%xmm6, %%xmm0         \n\t" /* clamp to -1.0 */
+@@ -72,8 +72,8 @@ static void pa_sconv_s16le_from_f32ne_ss
+ 
+         " packssdw %%mm1, %%mm0         \n\t" /* pack parts */
+         " packssdw %%mm3, %%mm2         \n\t"
+-        " movq     %%mm0, (%3, %0)      \n\t"
+-        " movq    %%mm2, 8(%3, %0)     \n\t"
++        " movq     %%mm0, (%q3, %0)      \n\t"
++        " movq    %%mm2, 8(%q3, %0)     \n\t"
+ 
+         " add $16, %0                   \n\t"
+         " dec %1                        \n\t"
+@@ -85,12 +85,12 @@ static void pa_sconv_s16le_from_f32ne_ss
+         " je 4f                         \n\t"
+ 
+         "3:                             \n\t"
+-        " movss (%2, %0, 2), %%xmm0     \n\t"
++        " movss (%q2, %0, 2), %%xmm0     \n\t"
+         " minss  %%xmm5, %%xmm0         \n\t"
+         " maxss  %%xmm6, %%xmm0         \n\t"
+         " mulss  %%xmm7, %%xmm0         \n\t"
+         " cvtss2si %%xmm0, %4           \n\t"
+-        " movw  %w4, (%3, %0)           \n\t"
++        " movw  %w4, (%q3, %0)           \n\t"
+         " add $2, %0                    \n\t"
+         " dec %1                        \n\t"
+         " jne 3b                        \n\t"
+@@ -119,8 +119,8 @@ static void pa_sconv_s16le_from_f32ne_ss
+         " je 2f                         \n\t"
+ 
+         "1:                             \n\t"
+-        " movups (%2, %0, 2), %%xmm0    \n\t" /* read 8 floats */
+-        " movups 16(%2, %0, 2), %%xmm2  \n\t"
++        " movups (%q2, %0, 2), %%xmm0    \n\t" /* read 8 floats */
++        " movups 16(%q2, %0, 2), %%xmm2  \n\t"
+         " minps  %%xmm5, %%xmm0         \n\t" /* clamp to 1.0 */
+         " minps  %%xmm5, %%xmm2         \n\t"
+         " maxps  %%xmm6, %%xmm0         \n\t" /* clamp to -1.0 */
+@@ -132,7 +132,7 @@ static void pa_sconv_s16le_from_f32ne_ss
+         " cvtps2dq %%xmm2, %%xmm2       \n\t"
+ 
+         " packssdw %%xmm2, %%xmm0       \n\t"
+-        " movdqu   %%xmm0, (%3, %0)     \n\t"
++        " movdqu   %%xmm0, (%q3, %0)     \n\t"
+ 
+         " add $16, %0                   \n\t"
+         " dec %1                        \n\t"
+@@ -144,12 +144,12 @@ static void pa_sconv_s16le_from_f32ne_ss
+         " je 4f                         \n\t"
+ 
+         "3:                             \n\t"
+-        " movss (%2, %0, 2), %%xmm0     \n\t"
++        " movss (%q2, %0, 2), %%xmm0     \n\t"
+         " minss  %%xmm5, %%xmm0         \n\t"
+         " maxss  %%xmm6, %%xmm0         \n\t"
+         " mulss  %%xmm7, %%xmm0         \n\t"
+         " cvtss2si %%xmm0, %4           \n\t"
+-        " movw  %w4, (%3, %0)           \n\t"
++        " movw  %w4, (%q3, %0)           \n\t"
+         " add $2, %0                    \n\t"
+         " dec %1                        \n\t"
+         " jne 3b                        \n\t"
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb
index 4c8b46f..93db782 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_1.1.bb
@@ -1,6 +1,6 @@
 require pulseaudio.inc
 
-PR = "r4"
+PR = "r5"
 
 DEPENDS += "libjson gdbm speex libxml-parser-perl-native"
 
@@ -8,6 +8,7 @@ inherit gettext perlnative
 
 SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/pulseaudio-${PV}.tar.xz \
   file://volatiles.04_pulse \
+  file://pulseaudo_fix_for_x32.patch \
 "
 
 SRC_URI[md5sum] = "17d21df798cee407b769c6355fae397a"
-- 
1.7.6.4



