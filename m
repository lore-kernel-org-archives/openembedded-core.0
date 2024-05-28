Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75E75C25B7C
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 12:30:22 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web10.20708.1716899413695134033
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 May 2024 05:30:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=CRfB1Hc9;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.181, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-627f46fbe14so7758517b3.2
        for <openembedded-core@lists.openembedded.org>; Tue, 28 May 2024 05:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1716899413; x=1717504213; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U56F7G4UmLOU3k1CCwHpf5bBfpJBYEzHTCfzwIUqiCE=;
        b=CRfB1Hc903S2v2qbp6k/lTPvA0itPxdTi9F5HwSNNsL4Em+jsynXhn/tQwLPNyFUKh
         oSx6+VUXASOQyaLq0iezQUzTnPT0gnKJXVZLGtfaCusY+BYiR60k5CvZs/9qJ5I2QiM0
         EX8+NKfFS45InUm40fU1NCSrBmL59LnyxIxcIcwIobww29YZY9ceNWrQEG5f0P6mEVW8
         Y+PqGOMSOrTO5u5aL2DZjzwlLNOnVded5GiGRLfkiBRFXjRkNJS/+6PC8mEvpzpFA9dA
         6MxVYNdNxN3A3C70G5lJMUFuhxg71KdbvQtfSnRzFj/IscPHWR4o6s6PUfDG3F4P4JXY
         3Khg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716899413; x=1717504213;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U56F7G4UmLOU3k1CCwHpf5bBfpJBYEzHTCfzwIUqiCE=;
        b=Qu9ibty2vbrrO7vqngTnBlVEUDbhDo3Cs7uYbY3IK4qFbezPwy0wfXOuMG0jZT6iwX
         n3WINDp9MBJspNwL06328zqT2naLupFtvaVzG0qYuvra3PLVI5NfUxnHYepr5V9ruPRR
         lFlwQx/6dnTCbAFwgfEt9RZn9/2FRQpF/6HEsb1IVDxM0Za5gEzmbp4We/7LiDHQxRJQ
         u60Ios7F4/Vh7Y/oXsuRs8XAGDi5qocnMIXUPuTIsB1ITWS2GbyIseEOqw8K4SZdmtyX
         XvaCG4BfDTURCIwTtvlVa3lRD0AWSD+W58PRoze2F6SuTAdBfKXPie7ImvFz0G6fQgVG
         IiWA==
X-Gm-Message-State: AOJu0Yz6K+LdEyOs26OU4J6CE9MyoJPpvXL9ZE+seqJQA0NkWrnHKwJ9
	aNxVFH3gUEUx6fbQEpRa0uNIL7o/F9J/n3JSd6zrVqJLnN29xB3Vday9dGDO3O/IPj44f6+kxHl
	Eq/QoNOJIcSks/mXCQo4BRgR3cnUj7lxz2PmtOQfsv9Z6pY95
X-Google-Smtp-Source: AGHT+IEN21M9ZuxX7mpIjSE45g6ldvrC5ZQKf/cRfosimRnw+HNKbh2N/iYmBhIgZVXPohkpHPO56wlv8OHXpORZBMM=
X-Received: by 2002:a81:6d01:0:b0:61b:1e81:4eb8 with SMTP id
 00721157ae682-62a08d74106mr107633117b3.9.1716899410979; Tue, 28 May 2024
 05:30:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240524201214.3858538-1-mark.hatle@amd.com> <20240524201214.3858538-3-mark.hatle@amd.com>
 <6329d594-c463-4813-849f-1bf14c018e8e@kernel.crashing.org>
In-Reply-To: <6329d594-c463-4813-849f-1bf14c018e8e@kernel.crashing.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 28 May 2024 05:29:59 -0700
Message-ID: <CAOSpxdYdsFALME99_sS+HTerCpTERx0Zr1eg8brE+3cPx_n=7w@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap 2/2] gcc: Fix for CVE-2024-0151
To: mark.hatle@kernel.crashing.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 May 2024 12:30:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199972

On Mon, May 27, 2024 at 1:15=E2=80=AFPM Mark Hatle via lists.openembedded.o=
rg
<mark.hatle=3Dkernel.crashing.org@lists.openembedded.org> wrote:
>
> I just realized that somehow I entered the wrong CVE in the body of the p=
atch
> itself.
>
> This IS CVE-2024-0151, but somehow I entered CVE-2023-4039 is the patch b=
ody.
>
> Steve can you fix this as part of the merge, or do you want me to send a =
V2 or a
> follow on to fix this?

I'll fix it!

Steve

> --Mark
>
> On 5/24/24 3:12 PM, Mark Hatle via lists.openembedded.org wrote:
> > Fix for insufficient argument checking in Secure state Entry functions
> > in software using Cortex-M Security Extensions (CMSE), that has been
> > compiled using toolchains that implement 'Arm v8-M Security Extensions
> > Requirements on Development Tools' prior to version 1.4, allows an
> > attacker to pass values to Secure state that are out of range for types
> > smaller than 32-bits. Out of range values might lead to incorrect
> > operations in secure state.
> >
> > Signed-off-by: Mark Hatle <mark.hatle@amd.com>
> > ---
> >   meta/recipes-devtools/gcc/gcc-13.2.inc        |   1 +
> >   .../gcc/gcc/CVE-2024-0151.patch               | 315 +++++++++++++++++=
+
> >   2 files changed, 316 insertions(+)
> >   create mode 100644 meta/recipes-devtools/gcc/gcc/CVE-2024-0151.patch
> >
> > diff --git a/meta/recipes-devtools/gcc/gcc-13.2.inc b/meta/recipes-devt=
ools/gcc/gcc-13.2.inc
> > index 603377a49a..abf177822b 100644
> > --- a/meta/recipes-devtools/gcc/gcc-13.2.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-13.2.inc
> > @@ -68,6 +68,7 @@ SRC_URI =3D "${BASEURI} \
> >              file://CVE-2023-4039.patch \
> >              file://0026-aarch64-Fix-loose-ldpstp-check-PR111411.patch =
\
> >              file://0027-Fix-gcc-vect-module-testcases.patch \
> > +           file://CVE-2024-0151.patch \
> >   "
> >   SRC_URI[sha256sum] =3D "e275e76442a6067341a27f04c5c6b83d8613144004c04=
13528863dc6b5c743da"
> >
> > diff --git a/meta/recipes-devtools/gcc/gcc/CVE-2024-0151.patch b/meta/r=
ecipes-devtools/gcc/gcc/CVE-2024-0151.patch
> > new file mode 100644
> > index 0000000000..01d55b5cdb
> > --- /dev/null
> > +++ b/meta/recipes-devtools/gcc/gcc/CVE-2024-0151.patch
> > @@ -0,0 +1,315 @@
> > +arm: Zero/Sign extends for CMSE security
> > +
> > +This patch makes the following changes:
> > +
> > +1) When calling a secure function from non-secure code then any argume=
nts
> > +   smaller than 32-bits that are passed in registers are zero- or sign=
-extended.
> > +2) After a non-secure function returns into secure code then any retur=
n value
> > +   smaller than 32-bits that is passed in a register is  zero- or sign=
-extended.
> > +
> > +This patch addresses the following CVE-2024-0151.
> > +
> > +gcc/ChangeLog:
> > +        PR target/114837
> > +        * config/arm/arm.cc (cmse_nonsecure_call_inline_register_clear=
):
> > +          Add zero/sign extend.
> > +        (arm_expand_prologue): Add zero/sign extend.
> > +
> > +gcc/testsuite/ChangeLog:
> > +
> > +        * gcc.target/arm/cmse/extend-param.c: New test.
> > +        * gcc.target/arm/cmse/extend-return.c: New test.
> > +
> > +CVE: CVE-2023-4039
> > +Upstream-Status: Backport [https://gcc.gnu.org/pipermail/gcc-patches/2=
024-April/649973.html]
> > +Signed-off-by: Mark Hatle <mark.hatle@amd.com>
> > +
> > +diff --git a/gcc/config/arm/arm.cc b/gcc/config/arm/arm.cc
> > +index 0217abc218d60956ce727e6d008d46b9176dddc5..ea0c963a4d67ecd70e1571=
624e84dfe46d757df9 100644
> > +--- a/gcc/config/arm/arm.cc
> > ++++ b/gcc/config/arm/arm.cc
> > +@@ -19210,6 +19210,30 @@ cmse_nonsecure_call_inline_register_clear (vo=
id)
> > +       end_sequence ();
> > +       emit_insn_before (seq, insn);
> > +
> > ++      /* The AAPCS requires the callee to widen integral types narrow=
er
> > ++         than 32 bits to the full width of the register; but when han=
dling
> > ++         calls to non-secure space, we cannot trust the callee to hav=
e
> > ++         correctly done so.  So forcibly re-widen the result here.  *=
/
> > ++      tree ret_type =3D TREE_TYPE (fntype);
> > ++      if ((TREE_CODE (ret_type) =3D=3D INTEGER_TYPE
> > ++          || TREE_CODE (ret_type) =3D=3D ENUMERAL_TYPE
> > ++          || TREE_CODE (ret_type) =3D=3D BOOLEAN_TYPE)
> > ++          && known_lt (GET_MODE_SIZE (TYPE_MODE (ret_type)), 4))
> > ++        {
> > ++          machine_mode ret_mode =3D TYPE_MODE (ret_type);
> > ++          rtx extend;
> > ++          if (TYPE_UNSIGNED (ret_type))
> > ++            extend =3D gen_rtx_ZERO_EXTEND (SImode,
> > ++                                          gen_rtx_REG (ret_mode, R0_R=
EGNUM));
> > ++          else
> > ++            extend =3D gen_rtx_SIGN_EXTEND (SImode,
> > ++                                          gen_rtx_REG (ret_mode, R0_R=
EGNUM));
> > ++          emit_insn_after (gen_rtx_SET (gen_rtx_REG (SImode, R0_REGNU=
M),
> > ++                                         extend), insn);
> > ++
> > ++        }
> > ++
> > ++
> > +       if (TARGET_HAVE_FPCXT_CMSE)
> > +         {
> > +           rtx_insn *last, *pop_insn, *after =3D insn;
> > +@@ -23652,6 +23676,51 @@ arm_expand_prologue (void)
> > +
> > +   ip_rtx =3D gen_rtx_REG (SImode, IP_REGNUM);
> > +
> > ++  /* The AAPCS requires the callee to widen integral types narrower
> > ++     than 32 bits to the full width of the register; but when handlin=
g
> > ++     calls to non-secure space, we cannot trust the callee to have
> > ++     correctly done so.  So forcibly re-widen the result here.  */
> > ++  if (IS_CMSE_ENTRY (func_type))
> > ++    {
> > ++      function_args_iterator args_iter;
> > ++      CUMULATIVE_ARGS args_so_far_v;
> > ++      cumulative_args_t args_so_far;
> > ++      bool first_param =3D true;
> > ++      tree arg_type;
> > ++      tree fndecl =3D current_function_decl;
> > ++      tree fntype =3D TREE_TYPE (fndecl);
> > ++      arm_init_cumulative_args (&args_so_far_v, fntype, NULL_RTX, fnd=
ecl);
> > ++      args_so_far =3D pack_cumulative_args (&args_so_far_v);
> > ++      FOREACH_FUNCTION_ARGS (fntype, arg_type, args_iter)
> > ++    {
> > ++      rtx arg_rtx;
> > ++
> > ++      if (VOID_TYPE_P (arg_type))
> > ++        break;
> > ++
> > ++      function_arg_info arg (arg_type, /*named=3D*/true);
> > ++      if (!first_param)
> > ++        /* We should advance after processing the argument and pass
> > ++           the argument we're advancing past.  */
> > ++        arm_function_arg_advance (args_so_far, arg);
> > ++      first_param =3D false;
> > ++      arg_rtx =3D arm_function_arg (args_so_far, arg);
> > ++      gcc_assert (REG_P (arg_rtx));
> > ++      if ((TREE_CODE (arg_type) =3D=3D INTEGER_TYPE
> > ++          || TREE_CODE (arg_type) =3D=3D ENUMERAL_TYPE
> > ++          || TREE_CODE (arg_type) =3D=3D BOOLEAN_TYPE)
> > ++          && known_lt (GET_MODE_SIZE (GET_MODE (arg_rtx)), 4))
> > ++        {
> > ++          if (TYPE_UNSIGNED (arg_type))
> > ++            emit_set_insn (gen_rtx_REG (SImode, REGNO (arg_rtx)),
> > ++                           gen_rtx_ZERO_EXTEND (SImode, arg_rtx));
> > ++          else
> > ++            emit_set_insn (gen_rtx_REG (SImode, REGNO (arg_rtx)),
> > ++                           gen_rtx_SIGN_EXTEND (SImode, arg_rtx));
> > ++        }
> > ++    }
> > ++    }
> > ++
> > +   if (IS_STACKALIGN (func_type))
> > +     {
> > +       rtx r0, r1;
> > +diff --git a/gcc/testsuite/gcc.target/arm/cmse/extend-param.c b/gcc/te=
stsuite/gcc.target/arm/cmse/extend-param.c
> > +new file mode 100644
> > +index 0000000000000000000000000000000000000000..01fac7862385f871f3ecc2=
46ede95eea180be025
> > +--- /dev/null
> > ++++ b/gcc/testsuite/gcc.target/arm/cmse/extend-param.c
> > +@@ -0,0 +1,96 @@
> > ++/* { dg-do compile } */
> > ++/* { dg-options "-mcmse" } */
> > ++/* { dg-final { check-function-bodies "**" "" "" } } */
> > ++
> > ++#include <arm_cmse.h>
> > ++#include <stdbool.h>
> > ++
> > ++#define ARRAY_SIZE (256)
> > ++char array[ARRAY_SIZE];
> > ++
> > ++enum offset
> > ++{
> > ++    zero =3D 0,
> > ++    one =3D 1,
> > ++    two =3D 2
> > ++};
> > ++
> > ++/*
> > ++**__acle_se_unsignSecureFunc:
> > ++**  ...
> > ++**  uxtb    r0, r0
> > ++**  ...
> > ++*/
> > ++__attribute__((cmse_nonsecure_entry)) char unsignSecureFunc (unsigned=
 char index) {
> > ++    if (index >=3D ARRAY_SIZE)
> > ++      return 0;
> > ++    return array[index];
> > ++}
> > ++
> > ++/*
> > ++**__acle_se_signSecureFunc:
> > ++**  ...
> > ++**  sxtb    r0, r0
> > ++**  ...
> > ++*/
> > ++__attribute__((cmse_nonsecure_entry)) char signSecureFunc (signed cha=
r index) {
> > ++    if (index >=3D ARRAY_SIZE)
> > ++      return 0;
> > ++    return array[index];
> > ++}
> > ++
> > ++/*
> > ++**__acle_se_shortUnsignSecureFunc:
> > ++**  ...
> > ++**  uxth    r0, r0
> > ++**  ...
> > ++*/
> > ++__attribute__((cmse_nonsecure_entry)) char shortUnsignSecureFunc (uns=
igned short index) {
> > ++    if (index >=3D ARRAY_SIZE)
> > ++      return 0;
> > ++    return array[index];
> > ++}
> > ++
> > ++/*
> > ++**__acle_se_shortSignSecureFunc:
> > ++**  ...
> > ++**  sxth    r0, r0
> > ++**  ...
> > ++*/
> > ++__attribute__((cmse_nonsecure_entry)) char shortSignSecureFunc (signe=
d short index) {
> > ++    if (index >=3D ARRAY_SIZE)
> > ++      return 0;
> > ++    return array[index];
> > ++}
> > ++
> > ++/*
> > ++**__acle_se_enumSecureFunc:
> > ++**  ...
> > ++**  uxtb    r0, r0
> > ++**  ...
> > ++*/
> > ++__attribute__((cmse_nonsecure_entry)) char enumSecureFunc (enum offse=
t index) {
> > ++
> > ++  // Compiler may optimize away bounds check as value is an unsigned =
char.
> > ++
> > ++  // According to AAPCS caller will zero extend to ensure value is < =
256.
> > ++
> > ++  if (index >=3D ARRAY_SIZE)
> > ++    return 0;
> > ++  return array[index];
> > ++
> > ++}
> > ++
> > ++/*
> > ++**__acle_se_boolSecureFunc:
> > ++**  ...
> > ++**  uxtb    r0, r0
> > ++**  ...
> > ++*/
> > ++__attribute__((cmse_nonsecure_entry)) char boolSecureFunc (bool index=
) {
> > ++
> > ++  if (index >=3D ARRAY_SIZE)
> > ++    return 0;
> > ++  return array[index];
> > ++
> > ++}
> > +\ No newline at end of file
> > +diff --git a/gcc/testsuite/gcc.target/arm/cmse/extend-return.c b/gcc/t=
estsuite/gcc.target/arm/cmse/extend-return.c
> > +new file mode 100644
> > +index 0000000000000000000000000000000000000000..cf731ed33df7e6dc101320=
c1970016f01b14c59a
> > +--- /dev/null
> > ++++ b/gcc/testsuite/gcc.target/arm/cmse/extend-return.c
> > +@@ -0,0 +1,92 @@
> > ++/* { dg-do compile } */
> > ++/* { dg-options "-mcmse" } */
> > ++/* { dg-final { check-function-bodies "**" "" "" } } */
> > ++
> > ++#include <arm_cmse.h>
> > ++#include <stdbool.h>
> > ++
> > ++enum offset
> > ++{
> > ++    zero =3D 0,
> > ++    one =3D 1,
> > ++    two =3D 2
> > ++};
> > ++
> > ++typedef unsigned char __attribute__ ((cmse_nonsecure_call)) ns_unsign=
_foo_t (void);
> > ++typedef signed char __attribute__ ((cmse_nonsecure_call)) ns_sign_foo=
_t (void);
> > ++typedef unsigned short __attribute__ ((cmse_nonsecure_call)) ns_short=
_unsign_foo_t (void);
> > ++typedef signed short __attribute__ ((cmse_nonsecure_call)) ns_short_s=
ign_foo_t (void);
> > ++typedef enum offset __attribute__ ((cmse_nonsecure_call)) ns_enum_foo=
_t (void);
> > ++typedef bool __attribute__ ((cmse_nonsecure_call)) ns_bool_foo_t (voi=
d);
> > ++
> > ++/*
> > ++**unsignNonsecure0:
> > ++**  ...
> > ++**  bl      __gnu_cmse_nonsecure_call
> > ++**  uxtb    r0, r0
> > ++**  ...
> > ++*/
> > ++unsigned char unsignNonsecure0 (ns_unsign_foo_t * ns_foo_p)
> > ++{
> > ++  return ns_foo_p ();
> > ++}
> > ++
> > ++/*
> > ++**signNonsecure0:
> > ++**  ...
> > ++**  bl      __gnu_cmse_nonsecure_call
> > ++**  sxtb    r0, r0
> > ++**  ...
> > ++*/
> > ++signed char signNonsecure0 (ns_sign_foo_t * ns_foo_p)
> > ++{
> > ++  return ns_foo_p ();
> > ++}
> > ++
> > ++/*
> > ++**shortUnsignNonsecure0:
> > ++**  ...
> > ++**  bl      __gnu_cmse_nonsecure_call
> > ++**  uxth    r0, r0
> > ++**  ...
> > ++*/
> > ++unsigned short shortUnsignNonsecure0 (ns_short_unsign_foo_t * ns_foo_=
p)
> > ++{
> > ++  return ns_foo_p ();
> > ++}
> > ++
> > ++/*
> > ++**shortSignNonsecure0:
> > ++**  ...
> > ++**  bl      __gnu_cmse_nonsecure_call
> > ++**  sxth    r0, r0
> > ++**  ...
> > ++*/
> > ++signed short shortSignNonsecure0 (ns_short_sign_foo_t * ns_foo_p)
> > ++{
> > ++  return ns_foo_p ();
> > ++}
> > ++
> > ++/*
> > ++**enumNonsecure0:
> > ++**  ...
> > ++**  bl      __gnu_cmse_nonsecure_call
> > ++**  uxtb    r0, r0
> > ++**  ...
> > ++*/
> > ++unsigned char __attribute__((noipa)) enumNonsecure0 (ns_enum_foo_t * =
ns_foo_p)
> > ++{
> > ++  return ns_foo_p ();
> > ++}
> > ++
> > ++/*
> > ++**boolNonsecure0:
> > ++**  ...
> > ++**  bl      __gnu_cmse_nonsecure_call
> > ++**  uxtb    r0, r0
> > ++**  ...
> > ++*/
> > ++unsigned char boolNonsecure0 (ns_bool_foo_t * ns_foo_p)
> > ++{
> > ++  return ns_foo_p ();
> > ++}
> > +\ No newline at end of file
> >
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199940): https://lists.openembedded.org/g/openembedde=
d-core/message/199940
> Mute This Topic: https://lists.openembedded.org/mt/106288402/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

