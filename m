Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id B52AA7720E
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Sep 2016 14:33:29 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id c133so6645482wmd.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Sep 2016 07:33:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=sIBxdDyTIK+V5LXMjY68kVwvqEXskiDMrMETT8WriNE=;
	b=NmRNpGYewWVca7Az0xCCwDsI3N9PlWA0NnMfx8V7FkXjlZgBreX9LVtF8h7gpULY4/
	POouGf5BeDmC/kaBpjkOnRDg0U0rObntV4py5ioPvH2bu3DBxjx1lfpUkxAYrEwwMI8F
	y4jh/Dj5mkfI10xkBCHu3RTMtphtOTp+AkAGNce7IqdHaXLGvA57D5odlFL0MsIx2y9p
	VOm9EJhCNstMke6cxvXO915giUntBikMWuqwXki6eh86tWqD86wII+Jp9/uMxCqJ7NQ/
	CRYDlQnzwj3LwyJPl+Pj3FAeGxUEotsRKDlgFh6VsGvoLwF+UOrPO+qjMIdviGbAaEOt
	kvyA==
X-Gm-Message-State: AE9vXwO7wk7SlklK4sgrtWgXuAR2xcXCq2duPuJwpXMX/UBTVbfR9uQBBIMw6RjISAWpEg==
X-Received: by 10.28.149.137 with SMTP id x131mr4055291wmd.79.1472913209872;
	Sat, 03 Sep 2016 07:33:29 -0700 (PDT)
Received: from localhost (sushi.andred.org. [85.214.105.253])
	by smtp.gmail.com with ESMTPSA id
	jd4sm15832552wjb.6.2016.09.03.07.33.28
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 03 Sep 2016 07:33:29 -0700 (PDT)
Message-ID: <1472913207.20786.6.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Date: Sat, 03 Sep 2016 15:33:27 +0100
In-Reply-To: <1472832102-8067-4-git-send-email-Zubair.Kakakhel@imgtec.com>
References: <1472832102-8067-1-git-send-email-Zubair.Kakakhel@imgtec.com>
	<1472832102-8067-4-git-send-email-Zubair.Kakakhel@imgtec.com>
X-Mailer: Evolution 3.20.5-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] libffi: Add patch for MIPS soft float
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
X-List-Received-Date: Sat, 03 Sep 2016 14:33:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Zubair,

It looks like you are a few days to late - a slightly different patch was
applied upstream:

https://github.com/libffi/libffi/pull/272

It'd be good if you could update your OE patch to reference that one
instead, so that we get a real backport (unless it has problems of
course...)

On a slightly related similar note, are you in a position to fix mips16e
support as well?

Cheers,
Andre'


On Fr, 2016-09-02 at 17:01 +0100, Zubair Lutfullah Kakakhel wrote:
> The pull request for this patch has already been sent upstream
> to libffi. Add patch until it gets merged upstream
> 
> Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> ---
>  ...ard-float-specific-code-into-ifdef-blocks.patch | 244
> +++++++++++++++++++++
>  meta/recipes-support/libffi/libffi_3.2.1.bb        |   1 +
>  2 files changed, 245 insertions(+)
>  create mode 100644 meta/recipes-support/libffi/libffi/0002-mips-wrap-
> hard-float-specific-code-into-ifdef-blocks.patch
> 
> diff --git a/meta/recipes-support/libffi/libffi/0002-mips-wrap-hard-float-
> specific-code-into-ifdef-blocks.patch b/meta/recipes-
> support/libffi/libffi/0002-mips-wrap-hard-float-specific-code-into-ifdef-
> blocks.patch
> new file mode 100644
> index 0000000..95917b7
> --- /dev/null
> +++ b/meta/recipes-support/libffi/libffi/0002-mips-wrap-hard-float-
> specific-code-into-ifdef-blocks.patch
> @@ -0,0 +1,244 @@
> +From 89494a87a0a5266956b487b9bbd410ea03416d87 Mon Sep 17 00:00:00 2001
> +From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> +Date: Wed, 24 Feb 2016 17:20:50 +0000
> +Subject: [PATCH] mips: wrap hard float specific code into ifdef blocks
> +
> +The hard float parts are already protected and they never get hit,
> +however it's necessary to wrap them into ifdef blocks so the compiler
> +will not complain when building for soft float.
> +
> +Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> +---
> + src/mips/n32.S | 29 ++++++++++++++++++++++-------
> + src/mips/o32.S |  8 ++++++++
> + 2 files changed, 30 insertions(+), 7 deletions(-)
> +
> +diff --git a/src/mips/n32.S b/src/mips/n32.S
> +index c6985d3..ba91820 100644
> +--- a/src/mips/n32.S
> ++++ b/src/mips/n32.S
> +@@ -109,6 +109,7 @@ loadregs:
> + 
> + 	and	t4, t6, ((1<<FFI_FLAG_BITS)-1)
> + 	REG_L	a0, 0*FFI_SIZEOF_ARG(t9)
> ++#ifndef __mips_soft_float
> + 	beqz	t4, arg1_next
> + 	bne	t4, FFI_TYPE_FLOAT, arg1_doublep
> + 	l.s	$f12, 0*FFI_SIZEOF_ARG(t9)
> +@@ -116,10 +117,11 @@ loadregs:
> + arg1_doublep:	
> + 	l.d	$f12, 0*FFI_SIZEOF_ARG(t9)
> + arg1_next:	
> +-	
> ++#endif
> + 	SRL	t4, t6, 1*FFI_FLAG_BITS
> + 	and	t4, ((1<<FFI_FLAG_BITS)-1)
> + 	REG_L	a1, 1*FFI_SIZEOF_ARG(t9)
> ++#ifndef __mips_soft_float
> + 	beqz	t4, arg2_next
> + 	bne	t4, FFI_TYPE_FLOAT, arg2_doublep
> + 	l.s	$f13, 1*FFI_SIZEOF_ARG(t9)	
> +@@ -127,10 +129,11 @@ arg1_next:
> + arg2_doublep:	
> + 	l.d	$f13, 1*FFI_SIZEOF_ARG(t9)	
> + arg2_next:	
> +-	
> ++#endif
> + 	SRL	t4, t6, 2*FFI_FLAG_BITS
> + 	and	t4, ((1<<FFI_FLAG_BITS)-1)
> + 	REG_L	a2, 2*FFI_SIZEOF_ARG(t9)
> ++#ifndef __mips_soft_float
> + 	beqz	t4, arg3_next
> + 	bne	t4, FFI_TYPE_FLOAT, arg3_doublep
> + 	l.s	$f14, 2*FFI_SIZEOF_ARG(t9)	
> +@@ -138,10 +141,11 @@ arg2_next:
> + arg3_doublep:	
> + 	l.d	$f14, 2*FFI_SIZEOF_ARG(t9)	
> + arg3_next:	
> +-	
> ++#endif
> + 	SRL	t4, t6, 3*FFI_FLAG_BITS
> + 	and	t4, ((1<<FFI_FLAG_BITS)-1)
> + 	REG_L	a3, 3*FFI_SIZEOF_ARG(t9)
> ++#ifndef __mips_soft_float
> + 	beqz	t4, arg4_next
> + 	bne	t4, FFI_TYPE_FLOAT, arg4_doublep
> + 	l.s	$f15, 3*FFI_SIZEOF_ARG(t9)	
> +@@ -149,10 +153,11 @@ arg3_next:
> + arg4_doublep:	
> + 	l.d	$f15, 3*FFI_SIZEOF_ARG(t9)	
> + arg4_next:	
> +-	
> ++#endif
> + 	SRL	t4, t6, 4*FFI_FLAG_BITS
> + 	and	t4, ((1<<FFI_FLAG_BITS)-1)
> + 	REG_L	a4, 4*FFI_SIZEOF_ARG(t9)
> ++#ifndef __mips_soft_float
> + 	beqz	t4, arg5_next
> + 	bne	t4, FFI_TYPE_FLOAT, arg5_doublep
> + 	l.s	$f16, 4*FFI_SIZEOF_ARG(t9)	
> +@@ -160,10 +165,11 @@ arg4_next:
> + arg5_doublep:	
> + 	l.d	$f16, 4*FFI_SIZEOF_ARG(t9)	
> + arg5_next:	
> +-	
> ++#endif
> + 	SRL	t4, t6, 5*FFI_FLAG_BITS
> + 	and	t4, ((1<<FFI_FLAG_BITS)-1)
> + 	REG_L	a5, 5*FFI_SIZEOF_ARG(t9)
> ++#ifndef __mips_soft_float
> + 	beqz	t4, arg6_next
> + 	bne	t4, FFI_TYPE_FLOAT, arg6_doublep
> + 	l.s	$f17, 5*FFI_SIZEOF_ARG(t9)	
> +@@ -171,10 +177,11 @@ arg5_next:
> + arg6_doublep:	
> + 	l.d	$f17, 5*FFI_SIZEOF_ARG(t9)	
> + arg6_next:	
> +-	
> ++#endif
> + 	SRL	t4, t6, 6*FFI_FLAG_BITS
> + 	and	t4, ((1<<FFI_FLAG_BITS)-1)
> + 	REG_L	a6, 6*FFI_SIZEOF_ARG(t9)
> ++#ifndef __mips_soft_float
> + 	beqz	t4, arg7_next
> + 	bne	t4, FFI_TYPE_FLOAT, arg7_doublep
> + 	l.s	$f18, 6*FFI_SIZEOF_ARG(t9)	
> +@@ -182,10 +189,11 @@ arg6_next:
> + arg7_doublep:	
> + 	l.d	$f18, 6*FFI_SIZEOF_ARG(t9)	
> + arg7_next:	
> +-	
> ++#endif
> + 	SRL	t4, t6, 7*FFI_FLAG_BITS
> + 	and	t4, ((1<<FFI_FLAG_BITS)-1)
> + 	REG_L	a7, 7*FFI_SIZEOF_ARG(t9)
> ++#ifndef __mips_soft_float
> + 	beqz	t4, arg8_next
> + 	bne	t4, FFI_TYPE_FLOAT, arg8_doublep
> +  	l.s	$f19, 7*FFI_SIZEOF_ARG(t9)	
> +@@ -193,6 +201,7 @@ arg7_next:
> + arg8_doublep:	
> +  	l.d	$f19, 7*FFI_SIZEOF_ARG(t9)	
> + arg8_next:	
> ++#endif
> + 
> + callit:		
> + 	# Load the function pointer
> +@@ -214,6 +223,7 @@ retint:
> + 	b	epilogue
> + 
> + retfloat:
> ++#ifndef __mips_soft_float
> + 	bne     t6, FFI_TYPE_FLOAT, retdouble
> + 	jal	t9
> + 	REG_L	t4, 4*FFI_SIZEOF_ARG($fp)
> +@@ -274,6 +284,7 @@ retstruct_f_d:
> + 	b	epilogue
> + 
> + retstruct_d_soft:
> ++#endif
> + 	bne	t6, FFI_TYPE_STRUCT_D_SOFT, retstruct_f_soft
> + 	jal	t9
> + 	REG_L	t4, 4*FFI_SIZEOF_ARG($fp)
> +@@ -429,6 +440,7 @@ ffi_closure_N32:
> + 	REG_S	a6, A6_OFF2($sp)
> + 	REG_S	a7, A7_OFF2($sp)
> + 
> ++#ifndef __mips_soft_float
> + 	# Store all possible float/double registers.
> + 	s.d	$f12, F12_OFF2($sp)
> + 	s.d	$f13, F13_OFF2($sp)
> +@@ -438,6 +450,7 @@ ffi_closure_N32:
> + 	s.d	$f17, F17_OFF2($sp)
> + 	s.d	$f18, F18_OFF2($sp)
> + 	s.d	$f19, F19_OFF2($sp)
> ++#endif
> + 
> + 	# Call ffi_closure_mips_inner_N32 to do the real work.
> + 	LA	t9, ffi_closure_mips_inner_N32
> +@@ -458,6 +471,7 @@ cls_retint:
> + 	b	cls_epilogue
> + 
> + cls_retfloat:
> ++#ifndef __mips_soft_float
> + 	bne     v0, FFI_TYPE_FLOAT, cls_retdouble
> + 	l.s	$f0, V0_OFF2($sp)
> + 	b	cls_epilogue
> +@@ -502,6 +516,7 @@ cls_retstruct_f_d:
> + 	b	cls_epilogue
> + 	
> + cls_retstruct_small2:	
> ++#endif
> + 	REG_L	v0, V0_OFF2($sp)
> + 	REG_L	v1, V1_OFF2($sp)
> + 	
> +diff --git a/src/mips/o32.S b/src/mips/o32.S
> +index eb27981..1c99c87 100644
> +--- a/src/mips/o32.S
> ++++ b/src/mips/o32.S
> +@@ -90,6 +90,7 @@ sixteen:
> + 	b	call_it
> + 
> + pass_d:
> ++#ifndef __mips_soft_float
> + 	bne	t0, FFI_ARGS_D, pass_f
> + 	l.d	$f12, 0*FFI_SIZEOF_ARG($sp)	# load $fp regs
> from args
> + 	REG_L	a2,   2*FFI_SIZEOF_ARG($sp)	# passing a
> double
> +@@ -130,6 +131,7 @@ pass_f_d:
> +  #	bne	t0, FFI_ARGS_F_D, call_it
> + 	l.s	$f12, 0*FFI_SIZEOF_ARG($sp)	# load $fp regs
> from args
> + 	l.d	$f14, 2*FFI_SIZEOF_ARG($sp)	# passing double
> and float
> ++#endif
> + 
> + call_it:	
> + 	# Load the function pointer
> +@@ -155,6 +157,7 @@ retlonglong:
> + 	b	epilogue
> + 
> + retfloat:
> ++#ifndef __mips_soft_float
> + 	bne     t2, FFI_TYPE_FLOAT, retdouble
> + 	jalr	t9
> + 	REG_L	t0, SIZEOF_FRAME + 4*FFI_SIZEOF_ARG($fp)
> +@@ -167,6 +170,7 @@ retdouble:
> + 	REG_L	t0, SIZEOF_FRAME + 4*FFI_SIZEOF_ARG($fp)
> + 	s.d	$f0, 0(t0)
> + 	b	epilogue
> ++#endif
> + 	
> + noretval:	
> + 	jalr	t9
> +@@ -259,12 +263,14 @@ $LCFI7:
> + 	REG_L	$16, 0($16)	# abi is first member.
> + 
> + 	li	$13, 1		# FFI_O32
> ++#ifndef __mips_soft_float
> + 	bne	$16, $13, 1f	# Skip fp save if
> FFI_O32_SOFT_FLOAT
> + 	
> + 	# Store all possible float/double registers.
> + 	s.d	$f12, FA_0_0_OFF2($fp)
> + 	s.d	$f14, FA_1_0_OFF2($fp)
> + 1:	
> ++#endif
> + 	# Call ffi_closure_mips_inner_O32 to do the work.
> + 	la	t9, ffi_closure_mips_inner_O32
> + 	move	a0, $12	 # Pointer to the ffi_closure
> +@@ -279,6 +285,7 @@ $LCFI7:
> + 	beq	$8, $9, closure_done
> + 
> + 	li	$13, 1		# FFI_O32
> ++#ifndef __mips_soft_float
> + 	bne	$16, $13, 1f	# Skip fp restore if
> FFI_O32_SOFT_FLOAT
> + 
> + 	li	$9, FFI_TYPE_FLOAT
> +@@ -289,6 +296,7 @@ $LCFI7:
> + 	l.d	$f0, V0_OFF2($fp)
> + 	beq	$8, $9, closure_done
> + 1:	
> ++#endif
> + 	REG_L	$3, V1_OFF2($fp)
> + 	REG_L	$2, V0_OFF2($fp)
> + 
> +-- 
> +1.9.1
> +
> diff --git a/meta/recipes-support/libffi/libffi_3.2.1.bb b/meta/recipes-
> support/libffi/libffi_3.2.1.bb
> index 0aff3f5..3b3d9a4 100644
> --- a/meta/recipes-support/libffi/libffi_3.2.1.bb
> +++ b/meta/recipes-support/libffi/libffi_3.2.1.bb
> @@ -12,6 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3610bb17683a0089e
> d64055416b2ae1b"
>  SRC_URI = "ftp://sourceware.org/pub/libffi/${BP}.tar.gz \
>             file://not-win32.patch \
>  	   file://0001-mips-Use-compiler-internal-define-for-linux.patch
> \
> +	   file://0002-mips-wrap-hard-float-specific-code-into-ifdef-
> blocks.patch \
>  	   "
>  
>  SRC_URI[md5sum] = "83b89587607e3eb65c70d361f13bab43"
> -- 
> 1.9.1
> 

