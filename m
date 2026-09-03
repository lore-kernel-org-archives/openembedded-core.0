Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78688C61DD3
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 21:34:39 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.507.1788471275660378710
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Sep 2026 14:34:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=jHZTyrxB;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49954b88fffso2716855e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 14:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1788471274; x=1789076074; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7MITHwqt4EMOdfUi77t2KJ1h6AUG/2AZbESJ8/ubep8=;
        b=jHZTyrxBtvf/ZWowEZeaX4fPNFT+A0LDYyvFKjnun+lLo8/neEeO8dBLOetGJyK67B
         oeGzJOkPWirUwtDEjMPiLvl270vvt24Yne3oUsHf8yXoVzivc+XVfn+Evpry2mnjEQ97
         ddQrppB9UMoTuYC23p+7nuiU65CGtUe131/lA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788471274; x=1789076074;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7MITHwqt4EMOdfUi77t2KJ1h6AUG/2AZbESJ8/ubep8=;
        b=dUfj2U/olQieQC9G21wcXGm6PLbK2+/ulMxijHYgnFrfptCzdcoRD8sYCAvJz1gJ4O
         0I3ZzadOqcNGQD1BYJWXQQXghUhcTZhBVPLCyVrxWgLzUpM1TfxwXSCbTb7fQdBhU/oA
         J11if7XklcAsUFHQBWpdhsRXRE8GxzGG1tuRyTGOX/ENIdkBJVD4ONmbWCe4xNM1afiz
         G8qhjvmNN7hlszab0UoWfIyptGLNqJ2jx1jILe+xQxJ4ybMTGhwskik0Ww0xvVprkpxV
         k0oxwMOC3nMfzOKMSx7GAqr7KmossImPxQ3TXfzNmjlQ1bGHIgYA4WHfc1e8vg9fgB57
         zwaw==
X-Forwarded-Encrypted: i=1; AKwUvBzXd8NI8d4o71mn7CeT6n807yjkK9mS75O03S0bt8I3yyd2Uh5MrTDQgZ0K15eXsTww0UoV/9+gUHineCCrXclCUA==@lists.openembedded.org
X-Gm-Message-State: AFuF++kU92uCBKrpqVezchViWCOQ6+W+iS5N4dACUIRcTlsxFEt4aqfX
	CawM/gCF0vwlzUiTHCB2sZZal2H+EF5pB0sz0cxcrkWLaF61wm6RdPeLB34iVeuEU+M=
X-Gm-Gg: AYBFou2E0ZTZ8WWq8zYv/CcROMjm7Jb6+wjemI37C+74ZSomQ2JDKtmZFxNKmZRn4oo
	OLbbuZhyDc4rlGt92tV3z1s7nK2DmvWGtGIcStrxkSexBnZk7ZwCZGwR/AH6PArTLKuNU0d8W2m
	GxNzCwL+EVtwDM4Vxv6te+qRODsDOUSxN+YDCrm85FnXXm2EfxIvNp7JCNNRuneRwlBooAVGoVO
	Y9m/sDr3R7vRmzpqT3WhQV1XVGAImAxpGICZ3eWEMFkPmjc4oUDfdkbrHPqTGZQDiXVCYNbHkTM
	wLKBSLNvUBgW7smr2U/bX+1COQ1iMKoqdtEjjiOaqw9GUdA+idG0II4Pd19eL9wIbx4kuiRLJri
	QGOhaBdfrahWyLFftHk6vTnB4cV34Y44c9eGP9yOYJ72yGiRdvH3iyb9PU5puCSXBPpHueWLW1U
	es9HmoExXsRInSzwVACvxbjKuedlF+C4Jn5K4uDpm0vguYihBMhcI0WJ7ZLq0wHfvAbT9TCwczH
	iZR2d0sq4id4rF2xyFc+zFIBUIyCmMebS+DzoZF8TVj/buW8N4=
X-Received: by 2002:a05:600c:8b76:b0:49c:f4e1:3135 with SMTP id 5b1f17b1804b1-49cf8259953mr14339785e9.14.1788471273674;
        Thu, 03 Sep 2026 14:34:33 -0700 (PDT)
Received: from localhost (2a01cb001331aa00939d825f00cb3861.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:939d:825f:cb:3861])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7703cc7sm16034745e9.4.2026.09.03.14.34.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 14:34:33 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 03 Sep 2026 23:34:32 +0200
Message-Id: <DL605KBROWS4.DZGC5ES0FPEB@smile.fr>
Subject: Re: [OE-core] [wrynose][PATCH] kernel-yocto-rust: skip recipe for
 riscv64 when Rust support is enabled
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <Sundeep.Kokkonda@windriver.com>
To: <Harish.Sadineni@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260811115855.4033577-1-Harish.Sadineni@windriver.com>
In-Reply-To: <20260811115855.4033577-1-Harish.Sadineni@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Sep 2026 21:34:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245050

On Tue Aug 11, 2026 at 1:58 PM CEST, Harish via lists.openembedded.org Sadi=
neni wrote:
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>
> Kernel Rust support on riscv64 requires building the kernel with Clang.
> Since Wrynose does not provide Clang toolchian support for kernel
> builds, skip the recipe when TARGET_ARCH is riscv64.

Hello,

OE-Core/wrynose indeed does not but meta-clang seem to do that:
https://github.com/kraj/meta-clang/blob/wrynose/conf/nonclangable.conf#L369

Wouldn't this patch needlessly prevent user from using meta-clang to get
a RISCV rust-enabled kernel?

I wonder if we need a patch more like master's:
2b228490b7e (kernel-yocto-rust: Add clang toolchain check for riscv64, 2026=
-08-05)

What do you think?

>
> This avoids attempting an unsupported kernel Rust build and provides a
> clear parse-time error explaining the limitation.
>
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---
>  meta/classes-recipe/kernel-yocto-rust.bbclass | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/meta/classes-recipe/kernel-yocto-rust.bbclass b/meta/classes=
-recipe/kernel-yocto-rust.bbclass
> index 49f2bfc1ae..6be97c2db8 100644
> --- a/meta/classes-recipe/kernel-yocto-rust.bbclass
> +++ b/meta/classes-recipe/kernel-yocto-rust.bbclass
> @@ -25,3 +25,12 @@ do_kernel_configme:append () {
>  # More details in: https://lists.openembedded.org/g/openembedded-core/me=
ssage/229336
>  # Disable ccache for kernel build if kernel rust support is enabled to w=
orkaround this.
>  CCACHE_DISABLE ?=3D "1"
> +
> +python () {
> +    if d.getVar('TARGET_ARCH') =3D=3D 'riscv64' :
> +        raise bb.parse.SkipRecipe(
> +            "Rust support in the kernel on riscv64 requires kernel to bu=
ild with clang, "
> +            "Wrynose doesn't have clang toolchain support for kernel. Se=
e "
> +            "https://docs.kernel.org/rust/arch-support.html for details.=
"
> +        )
> +}

Regards,
--=20
Yoann Congal
Smile ECS


