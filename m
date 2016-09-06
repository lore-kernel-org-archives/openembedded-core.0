Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6BA2E77300
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Sep 2016 11:32:38 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id a6so6762732wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Sep 2016 04:32:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=iBoAaUd9eohFZySD3JTFk4KhpaUVJjIt2GiJq09yb0g=;
	b=FPukwLEZFO1RPMG8Or8H1CNego6zzWQBtIvybDkov/QWww7Ci3aBBtvt/rTNDcK14Y
	5mmN6HQ0emg2dmVE6Ltt5uN8xv0V3sZA9yM+80Hr8mSbkUK3DmPPlbs80XetmzHpdDeR
	ZAxRlf8K3fqloHDeKUE93GJmoOyS417HwTu0wMZjDFYI+JY5rfO0Dun30kOMLG879Pg6
	Z1BWLQX356tZgnh7a1/K/uH8gV3LYosAWgNpV53Ghqc4oJqyeLSeXS6eb35WwJoZbxsm
	hKArEtbfqRSi1eHDO8/jdfdwT63YtAtJR3g1dLso9r6CPTdiQZQVEFcoD7TYZPz0EjEg
	YwRQ==
X-Gm-Message-State: AE9vXwMV3dlbm4e5XkhbYqMS5kgdmkWF9JkoN2dQXo0sHqaKAupfBol7Kt5atEC8R5VAHA==
X-Received: by 10.194.119.197 with SMTP id kw5mr14944245wjb.143.1473161558100; 
	Tue, 06 Sep 2016 04:32:38 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	ex14sm32943440wjc.30.2016.09.06.04.32.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Sep 2016 04:32:36 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Sep 2016 12:32:35 +0100
Message-Id: <20160906113235.7130-1-git@andred.net>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [PATCH] libffi: backport patch to fix building MIPS soft float
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
X-List-Received-Date: Tue, 06 Sep 2016 11:32:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Upstream-Status: Backport [https://github.com/libffi/libffi/commit/2ded2a4f494165c93293afc14ab0be1243cf8c49]

Signed-off-by: André Draszik <git@andred.net>
---
 .../0001-mips-fix-MIPS-softfloat-build-issue.patch | 177 +++++++++++++++++++++
 meta/recipes-support/libffi/libffi_3.2.1.bb        |   1 +
 2 files changed, 178 insertions(+)
 create mode 100644 meta/recipes-support/libffi/libffi/0001-mips-fix-MIPS-softfloat-build-issue.patch

diff --git a/meta/recipes-support/libffi/libffi/0001-mips-fix-MIPS-softfloat-build-issue.patch b/meta/recipes-support/libffi/libffi/0001-mips-fix-MIPS-softfloat-build-issue.patch
new file mode 100644
index 0000000..61c9eb3
--- /dev/null
+++ b/meta/recipes-support/libffi/libffi/0001-mips-fix-MIPS-softfloat-build-issue.patch
@@ -0,0 +1,177 @@
+From 655e82c92d5c3875aee04322f1993d6b0774a7bf Mon Sep 17 00:00:00 2001
+From: Yousong Zhou <yszhou4tech@gmail.com>
+Date: Mon, 15 Aug 2016 15:00:13 +0800
+Subject: [PATCH] mips: fix MIPS softfloat build issue
+
+The patch for o32.S is taken from OpenWrt packages repo 3a7a4bf "libffi:
+fix MIPS softfloat build issue with current binutils"
+
+Signed-off-by: Felix Fietkau <nbd@openwrt.org>
+Signed-off-by: Yousong Zhou <yszhou4tech@gmail.com>
+---
+Upstream-Status: Backport [https://github.com/libffi/libffi/commit/2ded2a4f494165c93293afc14ab0be1243cf8c49]
+ src/mips/n32.S | 17 +++++++++++++++++
+ src/mips/o32.S | 17 +++++++++++++++++
+ 2 files changed, 34 insertions(+)
+
+diff --git a/src/mips/n32.S b/src/mips/n32.S
+index c6985d3..8f25994 100644
+--- a/src/mips/n32.S
++++ b/src/mips/n32.S
+@@ -107,6 +107,16 @@ loadregs:
+ 
+ 	REG_L	t6, 3*FFI_SIZEOF_ARG($fp)  # load the flags word into t6.
+ 
++#ifdef __mips_soft_float
++	REG_L	a0, 0*FFI_SIZEOF_ARG(t9)
++	REG_L	a1, 1*FFI_SIZEOF_ARG(t9)
++	REG_L	a2, 2*FFI_SIZEOF_ARG(t9)
++	REG_L	a3, 3*FFI_SIZEOF_ARG(t9)
++	REG_L	a4, 4*FFI_SIZEOF_ARG(t9)
++	REG_L	a5, 5*FFI_SIZEOF_ARG(t9)
++	REG_L	a6, 6*FFI_SIZEOF_ARG(t9)
++	REG_L	a7, 7*FFI_SIZEOF_ARG(t9)
++#else
+ 	and	t4, t6, ((1<<FFI_FLAG_BITS)-1)
+ 	REG_L	a0, 0*FFI_SIZEOF_ARG(t9)
+ 	beqz	t4, arg1_next
+@@ -193,6 +203,7 @@ arg7_next:
+ arg8_doublep:	
+  	l.d	$f19, 7*FFI_SIZEOF_ARG(t9)	
+ arg8_next:	
++#endif
+ 
+ callit:		
+ 	# Load the function pointer
+@@ -214,6 +225,7 @@ retint:
+ 	b	epilogue
+ 
+ retfloat:
++#ifndef __mips_soft_float
+ 	bne     t6, FFI_TYPE_FLOAT, retdouble
+ 	jal	t9
+ 	REG_L	t4, 4*FFI_SIZEOF_ARG($fp)
+@@ -272,6 +284,7 @@ retstruct_f_d:
+ 	s.s	$f0, 0(t4)
+ 	s.d	$f2, 8(t4)
+ 	b	epilogue
++#endif
+ 
+ retstruct_d_soft:
+ 	bne	t6, FFI_TYPE_STRUCT_D_SOFT, retstruct_f_soft
+@@ -429,6 +442,7 @@ ffi_closure_N32:
+ 	REG_S	a6, A6_OFF2($sp)
+ 	REG_S	a7, A7_OFF2($sp)
+ 
++#ifndef __mips_soft_float
+ 	# Store all possible float/double registers.
+ 	s.d	$f12, F12_OFF2($sp)
+ 	s.d	$f13, F13_OFF2($sp)
+@@ -438,6 +452,7 @@ ffi_closure_N32:
+ 	s.d	$f17, F17_OFF2($sp)
+ 	s.d	$f18, F18_OFF2($sp)
+ 	s.d	$f19, F19_OFF2($sp)
++#endif
+ 
+ 	# Call ffi_closure_mips_inner_N32 to do the real work.
+ 	LA	t9, ffi_closure_mips_inner_N32
+@@ -458,6 +473,7 @@ cls_retint:
+ 	b	cls_epilogue
+ 
+ cls_retfloat:
++#ifndef __mips_soft_float
+ 	bne     v0, FFI_TYPE_FLOAT, cls_retdouble
+ 	l.s	$f0, V0_OFF2($sp)
+ 	b	cls_epilogue
+@@ -500,6 +516,7 @@ cls_retstruct_f_d:
+ 	l.s	$f0, V0_OFF2($sp)
+ 	l.d	$f2, V1_OFF2($sp)
+ 	b	cls_epilogue
++#endif
+ 	
+ cls_retstruct_small2:	
+ 	REG_L	v0, V0_OFF2($sp)
+diff --git a/src/mips/o32.S b/src/mips/o32.S
+index eb27981..429dd0a 100644
+--- a/src/mips/o32.S
++++ b/src/mips/o32.S
+@@ -82,13 +82,16 @@ sixteen:
+ 		
+ 	ADDU	$sp, 4 * FFI_SIZEOF_ARG		# adjust $sp to new args
+ 
++#ifndef __mips_soft_float
+ 	bnez	t0, pass_d			# make it quick for int
++#endif
+ 	REG_L	a0, 0*FFI_SIZEOF_ARG($sp)	# just go ahead and load the
+ 	REG_L	a1, 1*FFI_SIZEOF_ARG($sp)	# four regs.
+ 	REG_L	a2, 2*FFI_SIZEOF_ARG($sp)
+ 	REG_L	a3, 3*FFI_SIZEOF_ARG($sp)
+ 	b	call_it
+ 
++#ifndef __mips_soft_float
+ pass_d:
+ 	bne	t0, FFI_ARGS_D, pass_f
+ 	l.d	$f12, 0*FFI_SIZEOF_ARG($sp)	# load $fp regs from args
+@@ -130,6 +133,7 @@ pass_f_d:
+  #	bne	t0, FFI_ARGS_F_D, call_it
+ 	l.s	$f12, 0*FFI_SIZEOF_ARG($sp)	# load $fp regs from args
+ 	l.d	$f14, 2*FFI_SIZEOF_ARG($sp)	# passing double and float
++#endif
+ 
+ call_it:	
+ 	# Load the function pointer
+@@ -158,14 +162,23 @@ retfloat:
+ 	bne     t2, FFI_TYPE_FLOAT, retdouble
+ 	jalr	t9
+ 	REG_L	t0, SIZEOF_FRAME + 4*FFI_SIZEOF_ARG($fp)
++#ifndef __mips_soft_float
+ 	s.s	$f0, 0(t0)
++#else
++	REG_S	v0, 0(t0)
++#endif
+ 	b	epilogue
+ 
+ retdouble:	
+ 	bne	t2, FFI_TYPE_DOUBLE, noretval
+ 	jalr	t9
+ 	REG_L	t0, SIZEOF_FRAME + 4*FFI_SIZEOF_ARG($fp)
++#ifndef __mips_soft_float
+ 	s.d	$f0, 0(t0)
++#else
++	REG_S	v1, 4(t0)
++	REG_S	v0, 0(t0)
++#endif
+ 	b	epilogue
+ 	
+ noretval:	
+@@ -261,9 +274,11 @@ $LCFI7:
+ 	li	$13, 1		# FFI_O32
+ 	bne	$16, $13, 1f	# Skip fp save if FFI_O32_SOFT_FLOAT
+ 	
++#ifndef __mips_soft_float
+ 	# Store all possible float/double registers.
+ 	s.d	$f12, FA_0_0_OFF2($fp)
+ 	s.d	$f14, FA_1_0_OFF2($fp)
++#endif
+ 1:	
+ 	# Call ffi_closure_mips_inner_O32 to do the work.
+ 	la	t9, ffi_closure_mips_inner_O32
+@@ -281,6 +296,7 @@ $LCFI7:
+ 	li	$13, 1		# FFI_O32
+ 	bne	$16, $13, 1f	# Skip fp restore if FFI_O32_SOFT_FLOAT
+ 
++#ifndef __mips_soft_float
+ 	li	$9, FFI_TYPE_FLOAT
+ 	l.s	$f0, V0_OFF2($fp)
+ 	beq	$8, $9, closure_done
+@@ -288,6 +304,7 @@ $LCFI7:
+ 	li	$9, FFI_TYPE_DOUBLE
+ 	l.d	$f0, V0_OFF2($fp)
+ 	beq	$8, $9, closure_done
++#endif
+ 1:	
+ 	REG_L	$3, V1_OFF2($fp)
+ 	REG_L	$2, V0_OFF2($fp)
+-- 
+2.9.3
+
diff --git a/meta/recipes-support/libffi/libffi_3.2.1.bb b/meta/recipes-support/libffi/libffi_3.2.1.bb
index 0aff3f5..43eee8e 100644
--- a/meta/recipes-support/libffi/libffi_3.2.1.bb
+++ b/meta/recipes-support/libffi/libffi_3.2.1.bb
@@ -12,6 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3610bb17683a0089ed64055416b2ae1b"
 SRC_URI = "ftp://sourceware.org/pub/libffi/${BP}.tar.gz \
            file://not-win32.patch \
 	   file://0001-mips-Use-compiler-internal-define-for-linux.patch \
+           file://0001-mips-fix-MIPS-softfloat-build-issue.patch \
 	   "
 
 SRC_URI[md5sum] = "83b89587607e3eb65c70d361f13bab43"
-- 
2.9.3


