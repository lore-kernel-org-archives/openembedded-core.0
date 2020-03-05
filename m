Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3B83D60644
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2020 21:18:42 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id c144so3367294pfb.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Mar 2020 13:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=uUeeEbg6MztGgLdwZu3eFvCe27/n0JS8LevnckoD9nQ=;
	b=TX59EQHjS44SSBAaf5RWreGD+O3YXgonOJJKqViKFYMW/JsHjX6oFEUenW3PVr0pLZ
	NSsMj5x+QmlUmIwQhRVseUCe6oSYQeq/VHGNSuoPhWmJ+jQ3Y8639rOPyOCi1HgpeAs6
	NH/isqdJvenKGYm6gdgYaS8e188PaaMk+rXsDFZStVia/apR/Kg4pOOlVB5QnnoI6Kjs
	VRQIDtYAZVr4SWB3wimrA1XG4tbmM0IJNe+rtAVk0DhUu+++KSSl3i8e3BAcKi0Cta2C
	y08OVisb3VxzVudh0r640Dw7enmk11GXCa5r3nmRmnyqrAJgJDAMFJy7UuPJJfr9Wiyx
	WGxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=uUeeEbg6MztGgLdwZu3eFvCe27/n0JS8LevnckoD9nQ=;
	b=LArH4Ka8y/wyKt/O0ZucGTIELTXuhpA8gWJbdBxwKGZ330Vod5KDLlMSwDggGklIFu
	tCrGHJsak/k7Rc1HUFV7BU5axqWcC3SgDHmp7ywAdLhA9cNGfHA13JOpS/9TzOPVxaPH
	rkwJLgIyvKSkvQaU1KPe+eyduiUZjWJwDSNZC9p3fZbVXjhqLb+ccAOod2qKKwB6lHa8
	jIm/3aE+yi9ZHWYM/HBbjyqQ8WeBayEgXwwrj1qvCfxTSbxHmxvbs7rthmP8vw6RqSvv
	oaV9Rr2sgOjPQBjDxE64mFLnUaoUXdPgwxL7MrML72q2IaXrixGQOEMe9mnSFbsGikdY
	HKlw==
X-Gm-Message-State: ANhLgQ0KUUQTYKrMOQLCwA1JUSTD/paOCSdBc4+ZfvIGgZekiVt7HK0g
	Hwg4JNNBORSqzbgavwmMumgX2MCKlJc=
X-Google-Smtp-Source: ADFU+vunWvZLnxi2dWO9alg7ErBcDBs83FYjKSs1gYjWjBDMcwZ1pmBiw/A3UrbPbX0cf9UAxRVTRg==
X-Received: by 2002:aa7:9890:: with SMTP id r16mr313232pfl.178.1583443123391; 
	Thu, 05 Mar 2020 13:18:43 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::1c34])
	by smtp.gmail.com with ESMTPSA id
	k2sm15047102pfh.16.2020.03.05.13.18.42
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Mar 2020 13:18:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Mar 2020 13:18:55 -0800
Message-Id: <20200305211855.1015522-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [PATCH] pulseaudio: Fix inline assembly syntax for arm
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
X-List-Received-Date: Thu, 05 Mar 2020 21:18:43 -0000
Content-Transfer-Encoding: 8bit

Ensures that gcc can use right operand constraints

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ap-arm-Adjust-inline-asm-constraints.patch | 114 ++++++++++++++++++
 .../pulseaudio/pulseaudio_13.0.bb             |   1 +
 2 files changed, 115 insertions(+)
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-remap-arm-Adjust-inline-asm-constraints.patch

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-remap-arm-Adjust-inline-asm-constraints.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-remap-arm-Adjust-inline-asm-constraints.patch
new file mode 100644
index 0000000000..95133fd9d4
--- /dev/null
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-remap-arm-Adjust-inline-asm-constraints.patch
@@ -0,0 +1,114 @@
+From 3450d1fcfe8a8f84553ab299cd96ae0705ddffbe Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 5 Mar 2020 11:48:28 -0800
+Subject: [PATCH] remap/arm: Adjust inline asm constraints
+
+gcc10 can effectively emit single precision registers if right
+operand modifier constraint is not in use
+
+This results in assembler rejecting the code
+
+/tmp/ccEG4QpI.s:646: Error: VFP/Neon double precision register expected -- `vtbl.8 d3,{d0,d1},s8'
+/tmp/ccEG4QpI.s:678: Error: invalid instruction shape -- `vmul.f32 d0,d0,s8'
+
+Therefore add %P qualifier to request double registers sinece 'w' could
+mean variable could be stored in s0..s14 and GCC defaults to printing out s0..s14.
+Note those registers map to d0..d7 also.
+
+Output generated is exactly same with gcc9, and it also now compiles
+with gcc10
+
+Its not documented well in gcc docs and there is a ticket for that
+https://gcc.gnu.org/bugzilla/show_bug.cgi?id=84343
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/merge_requests/261]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/pulsecore/remap_neon.c | 22 +++++++++++-----------
+ 1 file changed, 11 insertions(+), 11 deletions(-)
+
+diff --git a/src/pulsecore/remap_neon.c b/src/pulsecore/remap_neon.c
+index 41208986d..ca3b95b48 100644
+--- a/src/pulsecore/remap_neon.c
++++ b/src/pulsecore/remap_neon.c
+@@ -189,7 +189,7 @@ static void remap_ch4_to_mono_float32ne_neon(pa_remap_t *m, float *dst, const fl
+             "vadd.f32   d0, d0, d1              \n\t"
+             "vadd.f32   d2, d2, d3              \n\t"
+             "vadd.f32   d0, d0, d2              \n\t"
+-            "vmul.f32   d0, d0, %[quart]        \n\t"
++            "vmul.f32   d0, d0, %P[quart]       \n\t"
+             "vst1.32    {d0}, [%[dst]]!         \n\t"
+             : [dst] "+r" (dst), [src] "+r" (src) /* output operands */
+             : [quart] "w" (quart) /* input operands */
+@@ -276,7 +276,7 @@ static void remap_arrange_stereo_s16ne_neon(pa_remap_t *m, int16_t *dst, const i
+     for (; n >= 2; n -= 2) {
+         __asm__ __volatile__ (
+             "vld1.s16   d0, [%[src]]!           \n\t"
+-            "vtbl.8     d0, {d0}, %[t]          \n\t"
++            "vtbl.8     d0, {d0}, %P[t]         \n\t"
+             "vst1.s16   d0, [%[dst]]!           \n\t"
+             : [dst] "+r" (dst), [src] "+r" (src) /* output operands */
+             : [t] "w" (t) /* input operands */
+@@ -287,7 +287,7 @@ static void remap_arrange_stereo_s16ne_neon(pa_remap_t *m, int16_t *dst, const i
+     if (n > 0) {
+         __asm__ __volatile__ (
+             "vld1.32   d0[0], [%[src]]!         \n\t"
+-            "vtbl.8    d0, {d0}, %[t]           \n\t"
++            "vtbl.8    d0, {d0}, %P[t]          \n\t"
+             "vst1.32   d0[0], [%[dst]]!         \n\t"
+             : [dst] "+r" (dst), [src] "+r" (src) /* output operands */
+             : [t] "w" (t) /* input operands */
+@@ -302,8 +302,8 @@ static void remap_arrange_ch2_ch4_s16ne_neon(pa_remap_t *m, int16_t *dst, const
+     for (; n > 0; n--) {
+         __asm__ __volatile__ (
+             "vld1.32    d0[0], [%[src]]!           \n\t"
+-            "vtbl.8     d0, {d0}, %[t]          \n\t"
+-            "vst1.s16   d0, [%[dst]]!           \n\t"
++            "vtbl.8     d0, {d0}, %P[t]            \n\t"
++            "vst1.s16   d0, [%[dst]]!              \n\t"
+             : [dst] "+r" (dst), [src] "+r" (src) /* output operands */
+             : [t] "w" (t) /* input operands */
+             : "memory", "d0" /* clobber list */
+@@ -317,7 +317,7 @@ static void remap_arrange_ch4_s16ne_neon(pa_remap_t *m, int16_t *dst, const int1
+     for (; n > 0; n--) {
+         __asm__ __volatile__ (
+             "vld1.s16   d0, [%[src]]!           \n\t"
+-            "vtbl.8     d0, {d0}, %[t]          \n\t"
++            "vtbl.8     d0, {d0}, %P[t]         \n\t"
+             "vst1.s16   d0, [%[dst]]!           \n\t"
+             : [dst] "+r" (dst), [src] "+r" (src) /* output operands */
+             : [t] "w" (t) /* input operands */
+@@ -332,7 +332,7 @@ static void remap_arrange_stereo_float32ne_neon(pa_remap_t *m, float *dst, const
+     for (; n > 0; n--) {
+         __asm__ __volatile__ (
+             "vld1.f32   d0, [%[src]]!           \n\t"
+-            "vtbl.8     d0, {d0}, %[t]          \n\t"
++            "vtbl.8     d0, {d0}, %P[t]         \n\t"
+             "vst1.s16   {d0}, [%[dst]]!         \n\t"
+             : [dst] "+r" (dst), [src] "+r" (src) /* output operands */
+             : [t] "w" (t) /* input operands */
+@@ -349,8 +349,8 @@ static void remap_arrange_ch2_ch4_any32ne_neon(pa_remap_t *m, float *dst, const
+     for (; n > 0; n--) {
+         __asm__ __volatile__ (
+             "vld1.f32   d0, [%[src]]!           \n\t"
+-            "vtbl.8     d1, {d0}, %[t0]         \n\t"
+-            "vtbl.8     d2, {d0}, %[t1]         \n\t"
++            "vtbl.8     d1, {d0}, %P[t0]        \n\t"
++            "vtbl.8     d2, {d0}, %P[t1]        \n\t"
+             "vst1.s16   {d1,d2}, [%[dst]]!      \n\t"
+             : [dst] "+r" (dst), [src] "+r" (src) /* output operands */
+             : [t0] "w" (t0), [t1] "w" (t1) /* input operands */
+@@ -366,8 +366,8 @@ static void remap_arrange_ch4_float32ne_neon(pa_remap_t *m, float *dst, const fl
+     for (; n > 0; n--) {
+         __asm__ __volatile__ (
+             "vld1.f32   {d0,d1}, [%[src]]!      \n\t"
+-            "vtbl.8     d2, {d0,d1}, %[t0]      \n\t"
+-            "vtbl.8     d3, {d0,d1}, %[t1]      \n\t"
++            "vtbl.8     d2, {d0,d1}, %P[t0]     \n\t"
++            "vtbl.8     d3, {d0,d1}, %P[t1]     \n\t"
+             "vst1.s16   {d2,d3}, [%[dst]]!      \n\t"
+             : [dst] "+r" (dst), [src] "+r" (src) /* output operands */
+             : [t0] "w" (t0), [t1] "w" (t1) /* input operands */
+-- 
+2.25.1
+
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_13.0.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_13.0.bb
index 7f8ebc2090..601499b6da 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_13.0.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_13.0.bb
@@ -3,6 +3,7 @@ require pulseaudio.inc
 SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/${BP}.tar.xz \
            file://0001-client-conf-Add-allow-autospawn-for-root.patch \
            file://0002-do-not-display-CLFAGS-to-improve-reproducibility-bui.patch \
+           file://0001-remap-arm-Adjust-inline-asm-constraints.patch \
            file://volatiles.04_pulse \
            "
 SRC_URI[md5sum] = "e41d606f90254ed45c90520faf83d95c"
-- 
2.25.1


