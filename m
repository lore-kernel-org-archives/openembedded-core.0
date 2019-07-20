Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id CDAD67D5C3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Jul 2019 06:16:36 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id f17so11089827pfn.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2019 23:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zHtFtG6pt5zSqKJNxQoCE01P3cuD45tesE6aK55qqT4=;
	b=AoK/90sHu18Q/qMgh3WL5Pe5h3ASgGO7RBMhjcDkx8PFJQQpqzuAsnRNl/K7nMw5Yz
	DpNtnr1IUpfFUwIjeB1FfGNr5VHkd5Yy/wQi4ruezbPXcItwvm0MBlMXK6phwtf8qOD3
	FGhQEMwCZf7cT7UNSy4/0hNVFajtsamktUhW6Tg7kSdbivEsmKCANCfN/1tO+M4M4/bO
	fE3J8rV9XlnpGD1jsJJAbrVj+xVKpmPNY5OKuoiW0/Lfs20izIKFmE87oATu3Q8hAQV6
	0ST0fmY1WUp2bgRtK9hyXnQh26Sat8AHX529mRrxe6xli1jGeWkEsvYdUW5acq2Mu51O
	4eNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zHtFtG6pt5zSqKJNxQoCE01P3cuD45tesE6aK55qqT4=;
	b=fjwNd08VCWDdsZbVrtENJdy+AKfzC29MCno8VUhv6rDW+k0lUreR+MzcG/sIoI0HxU
	JCksxMLNIvIXuPSjKUAc5/CzcKjLMiCPCmJ1qBmD7oLGtbu18i3q1jMB/0z6OBeLfXMR
	XS65+imzw3PFPrOVxWQZlnt01+pG03D3NITgoBuAHwbSADY5GcCtWNa8eVOm87tTsGBe
	mfFLwPtcIX7o09AtTiB+eJWoNBwdT29NwnENtP7Y4MjK3HdceA2NQjUpbKL0tiQGlpUe
	+fo1jnOmWiuZmc6WVaID0LQPj0RySgLj6JdhvOwyfrj8iiTVDDoej6qqARSwLWD2n1AV
	xeJQ==
X-Gm-Message-State: APjAAAXDajTYEya2Uy9fkxwKH8KvxquVm27n85JC/1R8tzH6eG0ZUmTd
	I2O/7ID+r7BqGVXNiK+ZUDNbqAZCZbw=
X-Google-Smtp-Source: APXvYqzyO+mFgcBdXHh7G3S5jsAmvgzUb8e5j9QGEwM9hHrGM8L9FTJTXqLHb5YRXG3FJIs+Pq6wkw==
X-Received: by 2002:a63:dd17:: with SMTP id t23mr31209365pgg.295.1563603397271;
	Fri, 19 Jul 2019 23:16:37 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net (c-73-71-176-3.hsd1.ca.comcast.net.
	[73.71.176.3]) by smtp.gmail.com with ESMTPSA id
	a128sm33380576pfb.185.2019.07.19.23.16.35
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 19 Jul 2019 23:16:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Jul 2019 23:16:28 -0700
Message-Id: <20190720061628.30213-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [PATCH] mpeg2dec: Fix PIE build and avoid relocation in text section on ARM
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
X-List-Received-Date: Sat, 20 Jul 2019 06:16:36 -0000
Content-Transfer-Encoding: 8bit

This a backport from upstream

Fixes package_qa on arm

ERROR: QA Issue: ELF binary 'TOPDIR/build/tmpfs/work/armv7vet2hf-neon-yoe-linux-gnueabi/mpeg2dec/0.5.1-r0/packages-split/libmpeg2/usr/lib/libmpeg2.so.0.1.0' has relocations in .text [textrel]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-1206-from-upstream-to-fix-PIE-build.patch | 156 ++++++++++++++++++
 .../mpeg2dec/mpeg2dec_0.5.1.bb                |   1 +
 2 files changed, 157 insertions(+)
 create mode 100644 meta/recipes-multimedia/mpeg2dec/files/0001-Import-revision-1206-from-upstream-to-fix-PIE-build.patch

diff --git a/meta/recipes-multimedia/mpeg2dec/files/0001-Import-revision-1206-from-upstream-to-fix-PIE-build.patch b/meta/recipes-multimedia/mpeg2dec/files/0001-Import-revision-1206-from-upstream-to-fix-PIE-build.patch
new file mode 100644
index 0000000000..b2544cb44d
--- /dev/null
+++ b/meta/recipes-multimedia/mpeg2dec/files/0001-Import-revision-1206-from-upstream-to-fix-PIE-build.patch
@@ -0,0 +1,156 @@
+From 0cafb99b57f43cf6ac2c6208718e49ad2dbe462d Mon Sep 17 00:00:00 2001
+From: Jan Schmidt <thaytan@noraisin.net>
+Date: Sun, 10 Nov 2013 00:49:52 +1100
+Subject: [PATCH] Import revision 1206 from upstream to fix PIE build.
+
+Functions MC_put_o_16_arm, MC_put_o_8_arm, MC_put_x_16_arm, MC_put_x_8_arm
+in libmpeg2/motion_comp_arm_s.S have addresses in .text, which is bad
+for shared libraries.  Some environments demand that .text actually be
+read-only all the time, yet MC_put_o_16_arm etc require that the addresses
+be modified by the dynamic linking mechanism (dlopen, LoadLibrary, etc.)
+Even in those environments which permit the dynamic linker to modify the
+.text segment, the runtime cost of doing the relocation can be noticeable.
+
+This commit rewrites the linkage, discarding the tables of addresses
+in favor of tables of offsets.  All transfers are local within each individual
+function, so there can be no interference by processing that occurs
+after assembly, such as link-time re-ordering (even of individual functions.)
+
+Patch by John Reiser <jreiser@bitwagon.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Backport [https://code.videolan.org/videolan/libmpeg2/commit/946bf4b518aacc224f845e73708f99e394744499]
+---
+ libmpeg2/motion_comp_arm_s.S | 70 +++++++++++++++++-------------------
+ 1 file changed, 33 insertions(+), 37 deletions(-)
+
+diff --git a/libmpeg2/motion_comp_arm_s.S b/libmpeg2/motion_comp_arm_s.S
+index c921f7c..82143f8 100644
+--- a/libmpeg2/motion_comp_arm_s.S
++++ b/libmpeg2/motion_comp_arm_s.S
+@@ -30,9 +30,13 @@ MC_put_o_16_arm:
+ 	pld [r1]
+         stmfd sp!, {r4-r11, lr} @ R14 is also called LR
+ 	and r4, r1, #3
+-	adr r5, MC_put_o_16_arm_align_jt
+-	add r5, r5, r4, lsl #2
+-	ldr pc, [r5]
++	ldrb r4, [pc, r4]
++	add pc, pc, r4, lsl #2
++	.byte (MC_put_o_16_arm_align0 - 0f)>>2
++	.byte (MC_put_o_16_arm_align1 - 0f)>>2
++	.byte (MC_put_o_16_arm_align2 - 0f)>>2
++	.byte (MC_put_o_16_arm_align3 - 0f)>>2
++0:
+ 
+ MC_put_o_16_arm_align0:
+ 	ldmia r1, {r4-r7}
+@@ -76,11 +80,6 @@ MC_put_o_16_arm_align3:
+ 1:	PROC(24)
+ 	bne 1b
+         ldmfd sp!, {r4-r11, pc} @@ update PC with LR content.
+-MC_put_o_16_arm_align_jt:
+-	.word MC_put_o_16_arm_align0
+-	.word MC_put_o_16_arm_align1
+-	.word MC_put_o_16_arm_align2
+-	.word MC_put_o_16_arm_align3
+ 
+ @ ----------------------------------------------------------------
+ 	.align
+@@ -91,9 +90,14 @@ MC_put_o_8_arm:
+ 	pld [r1]
+         stmfd sp!, {r4-r10, lr} @ R14 is also called LR
+ 	and r4, r1, #3
+-	adr r5, MC_put_o_8_arm_align_jt
+-	add r5, r5, r4, lsl #2
+-	ldr pc, [r5]
++	ldrb r4, [pc, r4]
++	add pc, pc, r4, lsl #2
++	.byte (MC_put_o_8_arm_align0 - 0f)>>2
++	.byte (MC_put_o_8_arm_align1 - 0f)>>2
++	.byte (MC_put_o_8_arm_align2 - 0f)>>2
++	.byte (MC_put_o_8_arm_align3 - 0f)>>2
++0:
++
+ MC_put_o_8_arm_align0:
+ 	ldmia r1, {r4-r5}
+ 	add r1, r1, r2
+@@ -135,12 +139,6 @@ MC_put_o_8_arm_align3:
+ 	bne 1b
+         ldmfd sp!, {r4-r10, pc} @@ update PC with LR content.
+ 
+-MC_put_o_8_arm_align_jt:
+-	.word MC_put_o_8_arm_align0
+-	.word MC_put_o_8_arm_align1
+-	.word MC_put_o_8_arm_align2
+-	.word MC_put_o_8_arm_align3
+-
+ @ ----------------------------------------------------------------
+ .macro	AVG_PW rW1, rW2
+ 	mov \rW2, \rW2, lsl #24
+@@ -160,12 +158,17 @@ MC_put_x_16_arm:
+ 	@@ void func(uint8_t * dest, const uint8_t * ref, int stride, int height)
+ 	pld [r1]
+         stmfd sp!, {r4-r11,lr} @ R14 is also called LR
++	ldr r11, 0f
+ 	and r4, r1, #3
+-	adr r5, MC_put_x_16_arm_align_jt
+-	ldr r11, [r5]
+ 	mvn r12, r11
+-	add r5, r5, r4, lsl #2
+-	ldr pc, [r5, #4]
++	ldrb r4, [pc, r4]
++	add pc, pc, r4, lsl #2
++	.byte (MC_put_x_16_arm_align0 - 0f)>>2
++	.byte (MC_put_x_16_arm_align1 - 0f)>>2
++	.byte (MC_put_x_16_arm_align2 - 0f)>>2
++	.byte (MC_put_x_16_arm_align3 - 0f)>>2
++0:
++	  .word 0x01010101
+ 
+ .macro	ADJ_ALIGN_QW shift, R0, R1, R2, R3, R4
+ 	mov \R0, \R0, lsr #(\shift)
+@@ -238,12 +241,6 @@ MC_put_x_16_arm_align3:
+ 	add r0, r0, r2
+ 	bne 1b
+         ldmfd sp!, {r4-r11,pc} @@ update PC with LR content.
+-MC_put_x_16_arm_align_jt:
+-	.word 0x01010101
+-	.word MC_put_x_16_arm_align0
+-	.word MC_put_x_16_arm_align1
+-	.word MC_put_x_16_arm_align2
+-	.word MC_put_x_16_arm_align3
+ 
+ @ ----------------------------------------------------------------
+ 	.align
+@@ -253,12 +250,17 @@ MC_put_x_8_arm:
+ 	@@ void func(uint8_t * dest, const uint8_t * ref, int stride, int height)
+ 	pld [r1]
+         stmfd sp!, {r4-r11,lr} @ R14 is also called LR
++	ldr r11, 0f
+ 	and r4, r1, #3
+-	adr r5, MC_put_x_8_arm_align_jt
+-	ldr r11, [r5]
+ 	mvn r12, r11
+-	add r5, r5, r4, lsl #2
+-	ldr pc, [r5, #4]
++	ldrb r4, [pc, r4]
++	add pc, pc, r4, lsl #2
++	.byte (MC_put_x_8_arm_align0 - 0f)>>2
++	.byte (MC_put_x_8_arm_align1 - 0f)>>2
++	.byte (MC_put_x_8_arm_align2 - 0f)>>2
++	.byte (MC_put_x_8_arm_align3 - 0f)>>2
++0:
++	  .word 0x01010101
+ 
+ .macro	ADJ_ALIGN_DW shift, R0, R1, R2
+ 	mov \R0, \R0, lsr #(\shift)
+@@ -319,9 +321,3 @@ MC_put_x_8_arm_align3:
+ 	add r0, r0, r2
+ 	bne 1b
+         ldmfd sp!, {r4-r11,pc} @@ update PC with LR content.
+-MC_put_x_8_arm_align_jt:
+-	.word 0x01010101
+-	.word MC_put_x_8_arm_align0
+-	.word MC_put_x_8_arm_align1
+-	.word MC_put_x_8_arm_align2
+-	.word MC_put_x_8_arm_align3
diff --git a/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb b/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb
index 6b59d4f681..00ca3675ca 100644
--- a/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb
+++ b/meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.5.1.bb
@@ -11,6 +11,7 @@ SRC_URI = "http://libmpeg2.sourceforge.net/files/libmpeg2-${PV}.tar.gz \
            file://0001-check-for-available-arm-optimizations.patch \
            file://0002-Set-visibility-of-global-symbols-used-in-ARM-specifi.patch \
            file://61_global-symbol-test.patch \
+           file://0001-Import-revision-1206-from-upstream-to-fix-PIE-build.patch \
            "
 
 S = "${WORKDIR}/libmpeg2-${PV}"
-- 
2.22.0


