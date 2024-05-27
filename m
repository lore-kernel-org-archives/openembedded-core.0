Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2342CC25B74
	for <webhook@archiver.kernel.org>; Mon, 27 May 2024 20:15:07 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web10.6314.1716840900921587079
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 May 2024 13:15:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 44RKEwsD031365;
	Mon, 27 May 2024 15:14:59 -0500
Received: from [192.168.3.156] ([192.168.3.156])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 44RKEwkF003784;
	Mon, 27 May 2024 15:14:58 -0500
Message-ID: <6329d594-c463-4813-849f-1bf14c018e8e@kernel.crashing.org>
Date: Mon, 27 May 2024 15:14:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap 2/2] gcc: Fix for CVE-2024-0151
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <20240524201214.3858538-1-mark.hatle@amd.com>
 <20240524201214.3858538-3-mark.hatle@amd.com>
Cc: "'steve@sakoman.com'" <steve@sakoman.com>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <20240524201214.3858538-3-mark.hatle@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 20:15:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199940

I just realized that somehow I entered the wrong CVE in the body of the patch 
itself.

This IS CVE-2024-0151, but somehow I entered CVE-2023-4039 is the patch body.

Steve can you fix this as part of the merge, or do you want me to send a V2 or a 
follow on to fix this?

--Mark

On 5/24/24 3:12 PM, Mark Hatle via lists.openembedded.org wrote:
> Fix for insufficient argument checking in Secure state Entry functions
> in software using Cortex-M Security Extensions (CMSE), that has been
> compiled using toolchains that implement 'Arm v8-M Security Extensions
> Requirements on Development Tools' prior to version 1.4, allows an
> attacker to pass values to Secure state that are out of range for types
> smaller than 32-bits. Out of range values might lead to incorrect
> operations in secure state.
> 
> Signed-off-by: Mark Hatle <mark.hatle@amd.com>
> ---
>   meta/recipes-devtools/gcc/gcc-13.2.inc        |   1 +
>   .../gcc/gcc/CVE-2024-0151.patch               | 315 ++++++++++++++++++
>   2 files changed, 316 insertions(+)
>   create mode 100644 meta/recipes-devtools/gcc/gcc/CVE-2024-0151.patch
> 
> diff --git a/meta/recipes-devtools/gcc/gcc-13.2.inc b/meta/recipes-devtools/gcc/gcc-13.2.inc
> index 603377a49a..abf177822b 100644
> --- a/meta/recipes-devtools/gcc/gcc-13.2.inc
> +++ b/meta/recipes-devtools/gcc/gcc-13.2.inc
> @@ -68,6 +68,7 @@ SRC_URI = "${BASEURI} \
>              file://CVE-2023-4039.patch \
>              file://0026-aarch64-Fix-loose-ldpstp-check-PR111411.patch \
>              file://0027-Fix-gcc-vect-module-testcases.patch \
> +           file://CVE-2024-0151.patch \
>   "
>   SRC_URI[sha256sum] = "e275e76442a6067341a27f04c5c6b83d8613144004c0413528863dc6b5c743da"
>   
> diff --git a/meta/recipes-devtools/gcc/gcc/CVE-2024-0151.patch b/meta/recipes-devtools/gcc/gcc/CVE-2024-0151.patch
> new file mode 100644
> index 0000000000..01d55b5cdb
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc/CVE-2024-0151.patch
> @@ -0,0 +1,315 @@
> +arm: Zero/Sign extends for CMSE security
> +
> +This patch makes the following changes:
> +
> +1) When calling a secure function from non-secure code then any arguments
> +   smaller than 32-bits that are passed in registers are zero- or sign-extended.
> +2) After a non-secure function returns into secure code then any return value
> +   smaller than 32-bits that is passed in a register is  zero- or sign-extended.
> +
> +This patch addresses the following CVE-2024-0151.
> +
> +gcc/ChangeLog:
> +        PR target/114837
> +        * config/arm/arm.cc (cmse_nonsecure_call_inline_register_clear):
> +          Add zero/sign extend.
> +        (arm_expand_prologue): Add zero/sign extend.
> +
> +gcc/testsuite/ChangeLog:
> +
> +        * gcc.target/arm/cmse/extend-param.c: New test.
> +        * gcc.target/arm/cmse/extend-return.c: New test.
> +
> +CVE: CVE-2023-4039
> +Upstream-Status: Backport [https://gcc.gnu.org/pipermail/gcc-patches/2024-April/649973.html]
> +Signed-off-by: Mark Hatle <mark.hatle@amd.com>
> +
> +diff --git a/gcc/config/arm/arm.cc b/gcc/config/arm/arm.cc
> +index 0217abc218d60956ce727e6d008d46b9176dddc5..ea0c963a4d67ecd70e1571624e84dfe46d757df9 100644
> +--- a/gcc/config/arm/arm.cc
> ++++ b/gcc/config/arm/arm.cc
> +@@ -19210,6 +19210,30 @@ cmse_nonsecure_call_inline_register_clear (void)
> + 	  end_sequence ();
> + 	  emit_insn_before (seq, insn);
> +
> ++	  /* The AAPCS requires the callee to widen integral types narrower
> ++	     than 32 bits to the full width of the register; but when handling
> ++	     calls to non-secure space, we cannot trust the callee to have
> ++	     correctly done so.  So forcibly re-widen the result here.  */
> ++	  tree ret_type = TREE_TYPE (fntype);
> ++	  if ((TREE_CODE (ret_type) == INTEGER_TYPE
> ++	      || TREE_CODE (ret_type) == ENUMERAL_TYPE
> ++	      || TREE_CODE (ret_type) == BOOLEAN_TYPE)
> ++	      && known_lt (GET_MODE_SIZE (TYPE_MODE (ret_type)), 4))
> ++	    {
> ++	      machine_mode ret_mode = TYPE_MODE (ret_type);
> ++	      rtx extend;
> ++	      if (TYPE_UNSIGNED (ret_type))
> ++		extend = gen_rtx_ZERO_EXTEND (SImode,
> ++					      gen_rtx_REG (ret_mode, R0_REGNUM));
> ++	      else
> ++		extend = gen_rtx_SIGN_EXTEND (SImode,
> ++					      gen_rtx_REG (ret_mode, R0_REGNUM));
> ++	      emit_insn_after (gen_rtx_SET (gen_rtx_REG (SImode, R0_REGNUM),
> ++					     extend), insn);
> ++
> ++	    }
> ++
> ++
> + 	  if (TARGET_HAVE_FPCXT_CMSE)
> + 	    {
> + 	      rtx_insn *last, *pop_insn, *after = insn;
> +@@ -23652,6 +23676,51 @@ arm_expand_prologue (void)
> +
> +   ip_rtx = gen_rtx_REG (SImode, IP_REGNUM);
> +
> ++  /* The AAPCS requires the callee to widen integral types narrower
> ++     than 32 bits to the full width of the register; but when handling
> ++     calls to non-secure space, we cannot trust the callee to have
> ++     correctly done so.  So forcibly re-widen the result here.  */
> ++  if (IS_CMSE_ENTRY (func_type))
> ++    {
> ++      function_args_iterator args_iter;
> ++      CUMULATIVE_ARGS args_so_far_v;
> ++      cumulative_args_t args_so_far;
> ++      bool first_param = true;
> ++      tree arg_type;
> ++      tree fndecl = current_function_decl;
> ++      tree fntype = TREE_TYPE (fndecl);
> ++      arm_init_cumulative_args (&args_so_far_v, fntype, NULL_RTX, fndecl);
> ++      args_so_far = pack_cumulative_args (&args_so_far_v);
> ++      FOREACH_FUNCTION_ARGS (fntype, arg_type, args_iter)
> ++	{
> ++	  rtx arg_rtx;
> ++
> ++	  if (VOID_TYPE_P (arg_type))
> ++	    break;
> ++
> ++	  function_arg_info arg (arg_type, /*named=*/true);
> ++	  if (!first_param)
> ++	    /* We should advance after processing the argument and pass
> ++	       the argument we're advancing past.  */
> ++	    arm_function_arg_advance (args_so_far, arg);
> ++	  first_param = false;
> ++	  arg_rtx = arm_function_arg (args_so_far, arg);
> ++	  gcc_assert (REG_P (arg_rtx));
> ++	  if ((TREE_CODE (arg_type) == INTEGER_TYPE
> ++	      || TREE_CODE (arg_type) == ENUMERAL_TYPE
> ++	      || TREE_CODE (arg_type) == BOOLEAN_TYPE)
> ++	      && known_lt (GET_MODE_SIZE (GET_MODE (arg_rtx)), 4))
> ++	    {
> ++	      if (TYPE_UNSIGNED (arg_type))
> ++		emit_set_insn (gen_rtx_REG (SImode, REGNO (arg_rtx)),
> ++			       gen_rtx_ZERO_EXTEND (SImode, arg_rtx));
> ++	      else
> ++		emit_set_insn (gen_rtx_REG (SImode, REGNO (arg_rtx)),
> ++			       gen_rtx_SIGN_EXTEND (SImode, arg_rtx));
> ++	    }
> ++	}
> ++    }
> ++
> +   if (IS_STACKALIGN (func_type))
> +     {
> +       rtx r0, r1;
> +diff --git a/gcc/testsuite/gcc.target/arm/cmse/extend-param.c b/gcc/testsuite/gcc.target/arm/cmse/extend-param.c
> +new file mode 100644
> +index 0000000000000000000000000000000000000000..01fac7862385f871f3ecc246ede95eea180be025
> +--- /dev/null
> ++++ b/gcc/testsuite/gcc.target/arm/cmse/extend-param.c
> +@@ -0,0 +1,96 @@
> ++/* { dg-do compile } */
> ++/* { dg-options "-mcmse" } */
> ++/* { dg-final { check-function-bodies "**" "" "" } } */
> ++
> ++#include <arm_cmse.h>
> ++#include <stdbool.h>
> ++
> ++#define ARRAY_SIZE (256)
> ++char array[ARRAY_SIZE];
> ++
> ++enum offset
> ++{
> ++    zero = 0,
> ++    one = 1,
> ++    two = 2
> ++};
> ++
> ++/*
> ++**__acle_se_unsignSecureFunc:
> ++**	...
> ++**	uxtb	r0, r0
> ++**	...
> ++*/
> ++__attribute__((cmse_nonsecure_entry)) char unsignSecureFunc (unsigned char index) {
> ++    if (index >= ARRAY_SIZE)
> ++      return 0;
> ++    return array[index];
> ++}
> ++
> ++/*
> ++**__acle_se_signSecureFunc:
> ++**	...
> ++**	sxtb	r0, r0
> ++**	...
> ++*/
> ++__attribute__((cmse_nonsecure_entry)) char signSecureFunc (signed char index) {
> ++    if (index >= ARRAY_SIZE)
> ++      return 0;
> ++    return array[index];
> ++}
> ++
> ++/*
> ++**__acle_se_shortUnsignSecureFunc:
> ++**	...
> ++**	uxth	r0, r0
> ++**	...
> ++*/
> ++__attribute__((cmse_nonsecure_entry)) char shortUnsignSecureFunc (unsigned short index) {
> ++    if (index >= ARRAY_SIZE)
> ++      return 0;
> ++    return array[index];
> ++}
> ++
> ++/*
> ++**__acle_se_shortSignSecureFunc:
> ++**	...
> ++**	sxth	r0, r0
> ++**	...
> ++*/
> ++__attribute__((cmse_nonsecure_entry)) char shortSignSecureFunc (signed short index) {
> ++    if (index >= ARRAY_SIZE)
> ++      return 0;
> ++    return array[index];
> ++}
> ++
> ++/*
> ++**__acle_se_enumSecureFunc:
> ++**	...
> ++**	uxtb	r0, r0
> ++**	...
> ++*/
> ++__attribute__((cmse_nonsecure_entry)) char enumSecureFunc (enum offset index) {
> ++
> ++  // Compiler may optimize away bounds check as value is an unsigned char.
> ++
> ++  // According to AAPCS caller will zero extend to ensure value is < 256.
> ++
> ++  if (index >= ARRAY_SIZE)
> ++    return 0;
> ++  return array[index];
> ++
> ++}
> ++
> ++/*
> ++**__acle_se_boolSecureFunc:
> ++**	...
> ++**	uxtb	r0, r0
> ++**	...
> ++*/
> ++__attribute__((cmse_nonsecure_entry)) char boolSecureFunc (bool index) {
> ++
> ++  if (index >= ARRAY_SIZE)
> ++    return 0;
> ++  return array[index];
> ++
> ++}
> +\ No newline at end of file
> +diff --git a/gcc/testsuite/gcc.target/arm/cmse/extend-return.c b/gcc/testsuite/gcc.target/arm/cmse/extend-return.c
> +new file mode 100644
> +index 0000000000000000000000000000000000000000..cf731ed33df7e6dc101320c1970016f01b14c59a
> +--- /dev/null
> ++++ b/gcc/testsuite/gcc.target/arm/cmse/extend-return.c
> +@@ -0,0 +1,92 @@
> ++/* { dg-do compile } */
> ++/* { dg-options "-mcmse" } */
> ++/* { dg-final { check-function-bodies "**" "" "" } } */
> ++
> ++#include <arm_cmse.h>
> ++#include <stdbool.h>
> ++
> ++enum offset
> ++{
> ++    zero = 0,
> ++    one = 1,
> ++    two = 2
> ++};
> ++
> ++typedef unsigned char __attribute__ ((cmse_nonsecure_call)) ns_unsign_foo_t (void);
> ++typedef signed char __attribute__ ((cmse_nonsecure_call)) ns_sign_foo_t (void);
> ++typedef unsigned short __attribute__ ((cmse_nonsecure_call)) ns_short_unsign_foo_t (void);
> ++typedef signed short __attribute__ ((cmse_nonsecure_call)) ns_short_sign_foo_t (void);
> ++typedef enum offset __attribute__ ((cmse_nonsecure_call)) ns_enum_foo_t (void);
> ++typedef bool __attribute__ ((cmse_nonsecure_call)) ns_bool_foo_t (void);
> ++
> ++/*
> ++**unsignNonsecure0:
> ++**	...
> ++**	bl	__gnu_cmse_nonsecure_call
> ++**	uxtb	r0, r0
> ++**	...
> ++*/
> ++unsigned char unsignNonsecure0 (ns_unsign_foo_t * ns_foo_p)
> ++{
> ++  return ns_foo_p ();
> ++}
> ++
> ++/*
> ++**signNonsecure0:
> ++**	...
> ++**	bl	__gnu_cmse_nonsecure_call
> ++**	sxtb	r0, r0
> ++**	...
> ++*/
> ++signed char signNonsecure0 (ns_sign_foo_t * ns_foo_p)
> ++{
> ++  return ns_foo_p ();
> ++}
> ++
> ++/*
> ++**shortUnsignNonsecure0:
> ++**	...
> ++**	bl	__gnu_cmse_nonsecure_call
> ++**	uxth	r0, r0
> ++**	...
> ++*/
> ++unsigned short shortUnsignNonsecure0 (ns_short_unsign_foo_t * ns_foo_p)
> ++{
> ++  return ns_foo_p ();
> ++}
> ++
> ++/*
> ++**shortSignNonsecure0:
> ++**	...
> ++**	bl	__gnu_cmse_nonsecure_call
> ++**	sxth	r0, r0
> ++**	...
> ++*/
> ++signed short shortSignNonsecure0 (ns_short_sign_foo_t * ns_foo_p)
> ++{
> ++  return ns_foo_p ();
> ++}
> ++
> ++/*
> ++**enumNonsecure0:
> ++**	...
> ++**	bl	__gnu_cmse_nonsecure_call
> ++**	uxtb	r0, r0
> ++**	...
> ++*/
> ++unsigned char __attribute__((noipa)) enumNonsecure0 (ns_enum_foo_t * ns_foo_p)
> ++{
> ++  return ns_foo_p ();
> ++}
> ++
> ++/*
> ++**boolNonsecure0:
> ++**	...
> ++**	bl	__gnu_cmse_nonsecure_call
> ++**	uxtb	r0, r0
> ++**	...
> ++*/
> ++unsigned char boolNonsecure0 (ns_bool_foo_t * ns_foo_p)
> ++{
> ++  return ns_foo_p ();
> ++}
> +\ No newline at end of file
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199861): https://lists.openembedded.org/g/openembedded-core/message/199861
> Mute This Topic: https://lists.openembedded.org/mt/106288402/3616948
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mark.hatle@kernel.crashing.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

