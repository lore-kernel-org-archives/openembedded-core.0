Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8DBFC77B7D
	for <webhook@archiver.kernel.org>; Wed, 10 May 2023 15:05:09 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web11.19886.1683731106344736540
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 May 2023 08:05:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=R8makKNa;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-38e3228d120so3685368b6e.3
        for <openembedded-core@lists.openembedded.org>; Wed, 10 May 2023 08:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683731105; x=1686323105;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ky5pjowIB5/JWJ9blxQtknxa+JqoaqX+TTWTa77JI2Q=;
        b=R8makKNaX+dT7sIhWvhxHlxglwIEqZxadHxbvB8s68lG7FtkqxLFeAPxRMCXlA8V0a
         UJmBSDt/64FoiAboArhpbjEMRoREM1aMxV827a0zfejTNbmd0CcRlvFfAN0Oq2Np0VH8
         AOyYQLMqDT3rgLIt99WWXbMbm4KbV+Nu9F3aOTPszNavjLHcYP/kXWCU4VjWzR6cUPbV
         FGP6bG/lfvj/gA6zOjcfWNB64Sk0/o6EQDZsDZYVifSZwjmI6MsK2w20qaFe5LBOiWch
         4ogZnImEm6IeZ28achIHZMjcG5OvpSZKiU6CJ1Ypo/l+Z0xHuWJl9YwWsvWN2J9RrXFb
         PGaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683731105; x=1686323105;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ky5pjowIB5/JWJ9blxQtknxa+JqoaqX+TTWTa77JI2Q=;
        b=dUTMG6jR06w9cTmHZEXDi7n3qyb2B5aXxxHhS9x/IAKSE3ixzIek9kWJYY1nP9iBs5
         v3gJRZno/32wi1U903NZRcLw4HqsRDi6450fx6/ZJ5EWBo9VHBIz1IgYkakJcH3E8Pwn
         4gk3GJlmitjpEpSlLCk8y5C+XR0KVrCPtd1AFn7aMU8sv+KI17GbeVDjgh2NJlRBEygb
         y7QkFSqRkA0mLHU71mrQrLh7Wm8XBRCXB0QjZMECv8aaJtUo6ncwcBdx/XYg1VDv6hD7
         eDKUYNuYNvwBHZyRJRbVqpC23OiESJHQaqZzgcS4LOmLyLagN3+PlOKqwH5QrJGyCkp2
         UXTg==
X-Gm-Message-State: AC+VfDxPiTFFCM2zf4YrVaqeTtVW4xreYD0stjkstDWTtt1kGOLWGVC0
	ZTkfPjGVPan3hSBh4oN5zpvB7thqO4ivgPNPVehdP/5r
X-Google-Smtp-Source: ACHHUZ4Cpj86zeRj58yJY8hfkQZCc+63/VmOh5zd6b3DRsh5OJ3Jc8tXe9Txjz9iou2ZVjSk4d2LIyGv3RHa6/Rvl3Y=
X-Received: by 2002:a05:6808:246:b0:37a:dc7a:9cb with SMTP id
 m6-20020a056808024600b0037adc7a09cbmr3139194oie.27.1683731105494; Wed, 10 May
 2023 08:05:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230510112603.1720223-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20230510112603.1720223-1-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 10 May 2023 08:04:39 -0700
Message-ID: <CAMKF1soShQAh8LgR8juuRc1TXPUu-eyA0XCWH2Z2wj82yttMOA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] qemu: Further updates to the ppc patch after
 upstream discussion
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 May 2023 15:05:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181112

On Wed, May 10, 2023 at 4:26=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> After someone tested real hardware, the patch needs tweaks to match the 3=
.0 ISA
> behaviour. It won't change much from our perspective but may as well keep=
 the
> patch in sync.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-devtools/qemu/qemu/ppc.patch | 89 +++++++++++------------
>  1 file changed, 44 insertions(+), 45 deletions(-)
>
> diff --git a/meta/recipes-devtools/qemu/qemu/ppc.patch b/meta/recipes-dev=
tools/qemu/qemu/ppc.patch
> index 1fe6a3b4139..22d26e23d9b 100644
> --- a/meta/recipes-devtools/qemu/qemu/ppc.patch
> +++ b/meta/recipes-devtools/qemu/qemu/ppc.patch
> @@ -1,11 +1,12 @@
> -From d92b63b7d15d4fd202c5802dfe444a96f5d8109c Mon Sep 17 00:00:00 2001
> +From 31f02021ac17442c514593f7b9ed750ea87c21b1 Mon Sep 17 00:00:00 2001
>  From: Richard Purdie <richard.purdie@linuxfoundation.org>
>  Date: Sat, 6 May 2023 07:42:35 +0100
>  Cc: V=C3=ADctor Colombo <victor.colombo@eldorado.org.br>
>  Cc: Matheus Ferst <matheus.ferst@eldorado.org.br>
>  Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
>  Cc: Richard Henderson <richard.henderson@linaro.org>
> -Subject: [PATCH v2] target/ppc: Fix fallback to MFSS for MFFS* instructi=
ons on
> +Cc: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> +Subject: [PATCH v3] target/ppc: Fix fallback to MFSS for MFFS* instructi=
ons on
>   pre 3.0 ISAs
>
>  The following commits changed the code such that the fallback to MFSS fo=
r MFFSCRN,
> @@ -22,25 +23,23 @@ instructions which is used in glibc libm functions fo=
r example.
>  The fallback for MFFSCDRN and MFFSCDRNI added in a later patch was also =
missing.
>
>  This patch restores the fallback to MFSS for these instructions on pre 3=
.0s ISAs
> -as the hardware decoder would, fixing the segfaulting libm code. It and =
also ensures
> -the MFSS instruction is used for currently reserved bits to handle other=
 potential
> -ISA additions more correctly.
> -
> -Upstream-Status: Submitted [https://lore.kernel.org/qemu-devel/202305060=
65240.3177798-1-richard.purdie@linuxfoundation.org/]

I think you dropped this line accidentally.

> +as the hardware decoder would, fixing the segfaulting libm code. It does=
n't have
> +the fallback for 3.0 onwards to match hardware behaviour.
>
>  Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>  ---
> - target/ppc/insn32.decode           | 19 ++++++++++++-------
> - target/ppc/translate/fp-impl.c.inc | 30 ++++++++++++++++++++++++------
> - 2 files changed, 36 insertions(+), 13 deletions(-)
> + target/ppc/insn32.decode           | 20 +++++++++++++-------
> + target/ppc/translate/fp-impl.c.inc | 22 ++++++++++++++++------
> + 2 files changed, 29 insertions(+), 13 deletions(-)
>
> +v3 - drop fallback to MFFS for 3.0 ISA to match hardware
>  v2 - switch to use decodetree pattern groups per feedback
>
>  diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
> -index f8f589e9fd..3c4e2c2fc2 100644
> +index f8f589e9fd..4fcf3af8d0 100644
>  --- a/target/ppc/insn32.decode
>  +++ b/target/ppc/insn32.decode
> -@@ -390,13 +390,18 @@ SETNBCR         011111 ..... ..... ----- 011110000=
0 -   @X_bi
> +@@ -390,13 +390,19 @@ SETNBCR         011111 ..... ..... ----- 011110000=
0 -   @X_bi
>
>   ### Move To/From FPSCR
>
> @@ -51,9 +50,11 @@ index f8f589e9fd..3c4e2c2fc2 100644
>  -MFFSCRNI        111111 ..... 10111 ---.. 1001000111 -   @X_imm2
>  -MFFSCDRNI       111111 ..... 10101 --... 1001000111 -   @X_imm3
>  -MFFSL           111111 ..... 11000 ----- 1001000111 -   @X_t
> -+{
> ++{
>  +  # Before Power ISA v3.0, MFFS bits 11~15 were reserved and should be =
ignored
> ++  MFFS_ISA207     111111 ..... ----- ----- 1001000111 .   @X_t_rc
>  +  [
> ++    MFFS            111111 ..... 00000 ----- 1001000111 .   @X_t_rc
>  +    MFFSCE          111111 ..... 00001 ----- 1001000111 -   @X_t
>  +    MFFSCRN         111111 ..... 10110 ..... 1001000111 -   @X_tb
>  +    MFFSCDRN        111111 ..... 10100 ..... 1001000111 -   @X_tb
> @@ -61,84 +62,82 @@ index f8f589e9fd..3c4e2c2fc2 100644
>  +    MFFSCDRNI       111111 ..... 10101 --... 1001000111 -   @X_imm3
>  +    MFFSL           111111 ..... 11000 ----- 1001000111 -   @X_t
>  +  ]
> -+  MFFS            111111 ..... ----- ----- 1001000111 .   @X_t_rc
>  +}
>
>   ### Decimal Floating-Point Arithmetic Instructions
>
>  diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/f=
p-impl.c.inc
> -index 57d8437851..10dfd91aa4 100644
> +index 57d8437851..874774eade 100644
>  --- a/target/ppc/translate/fp-impl.c.inc
>  +++ b/target/ppc/translate/fp-impl.c.inc
> -@@ -584,7 +584,10 @@ static bool trans_MFFSCE(DisasContext *ctx, arg_X_t=
 *a)
> - {
> -     TCGv_i64 fpscr;
> +@@ -568,6 +568,22 @@ static void store_fpscr_masked(TCGv_i64 fpscr, uint=
64_t clear_mask,
> +     gen_helper_store_fpscr(cpu_env, fpscr_masked, st_mask);
> + }
>
> --    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
> ++static bool trans_MFFS_ISA207(DisasContext *ctx, arg_X_t_rc *a)
> ++{
>  +    if (!(ctx->insns_flags2 & PPC2_ISA300)) {
> -+        return false;
> ++        /*
> ++         * Before Power ISA v3.0, MFFS bits 11~15 were reserved, any in=
struction
> ++         * with OPCD=3D63 and XO=3D583 should be decoded as MFFS.
> ++         */
> ++        return trans_MFFS(ctx, a);
>  +    }
> ++    /*
> ++     * For Power ISA v3.0+, return false and let the pattern group
> ++     * select the correct instruction.
> ++     */
> ++    return false;
> ++}
>  +
> + static bool trans_MFFS(DisasContext *ctx, arg_X_t_rc *a)
> + {
> +     REQUIRE_FPU(ctx);
> +@@ -584,7 +600,6 @@ static bool trans_MFFSCE(DisasContext *ctx, arg_X_t =
*a)
> + {
> +     TCGv_i64 fpscr;
> +
> +-    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
>       REQUIRE_FPU(ctx);
>
>       gen_reset_fpstatus();
> -@@ -597,7 +600,10 @@ static bool trans_MFFSCRN(DisasContext *ctx, arg_X_=
tb *a)
> +@@ -597,7 +612,6 @@ static bool trans_MFFSCRN(DisasContext *ctx, arg_X_t=
b *a)
>   {
>       TCGv_i64 t1, fpscr;
>
>  -    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
> -+    if (!(ctx->insns_flags2 & PPC2_ISA300)) {
> -+        return false;
> -+    }
> -+
>       REQUIRE_FPU(ctx);
>
>       t1 =3D tcg_temp_new_i64();
> -@@ -614,7 +620,10 @@ static bool trans_MFFSCDRN(DisasContext *ctx, arg_X=
_tb *a)
> +@@ -614,7 +628,6 @@ static bool trans_MFFSCDRN(DisasContext *ctx, arg_X_=
tb *a)
>   {
>       TCGv_i64 t1, fpscr;
>
>  -    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
> -+    if (!(ctx->insns_flags2 & PPC2_ISA300)) {
> -+        return false;
> -+    }
> -+
>       REQUIRE_FPU(ctx);
>
>       t1 =3D tcg_temp_new_i64();
> -@@ -631,7 +640,10 @@ static bool trans_MFFSCRNI(DisasContext *ctx, arg_X=
_imm2 *a)
> +@@ -631,7 +644,6 @@ static bool trans_MFFSCRNI(DisasContext *ctx, arg_X_=
imm2 *a)
>   {
>       TCGv_i64 t1, fpscr;
>
>  -    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
> -+    if (!(ctx->insns_flags2 & PPC2_ISA300)) {
> -+        return false;
> -+    }
> -+
>       REQUIRE_FPU(ctx);
>
>       t1 =3D tcg_temp_new_i64();
> -@@ -647,7 +659,10 @@ static bool trans_MFFSCDRNI(DisasContext *ctx, arg_=
X_imm3 *a)
> +@@ -647,7 +659,6 @@ static bool trans_MFFSCDRNI(DisasContext *ctx, arg_X=
_imm3 *a)
>   {
>       TCGv_i64 t1, fpscr;
>
>  -    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
> -+    if (!(ctx->insns_flags2 & PPC2_ISA300)) {
> -+        return false;
> -+    }
> -+
>       REQUIRE_FPU(ctx);
>
>       t1 =3D tcg_temp_new_i64();
> -@@ -661,7 +676,10 @@ static bool trans_MFFSCDRNI(DisasContext *ctx, arg_=
X_imm3 *a)
> +@@ -661,7 +672,6 @@ static bool trans_MFFSCDRNI(DisasContext *ctx, arg_X=
_imm3 *a)
>
>   static bool trans_MFFSL(DisasContext *ctx, arg_X_t *a)
>   {
>  -    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
> -+    if (!(ctx->insns_flags2 & PPC2_ISA300)) {
> -+        return false;
> -+    }
> -+
>       REQUIRE_FPU(ctx);
>
>       gen_reset_fpstatus();
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181107): https://lists.openembedded.org/g/openembedde=
d-core/message/181107
> Mute This Topic: https://lists.openembedded.org/mt/98803453/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

