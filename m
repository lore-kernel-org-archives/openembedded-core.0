Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 263E1CE9D5C
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 15:28:21 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.92372.1767713293057483568
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jan 2026 07:28:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Mjcoxv5I;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-bde0f62464cso853752a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 07:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767713292; x=1768318092; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qx/j/TZVECEGAbM9e/6IqKSdBxKuuSFafhUUxwd/pFU=;
        b=Mjcoxv5I0zrtYbftAg332MRTrugkgLtNBZII+5/DdE81lgP0MFKOpAN5z/w9UnW8dW
         397aCFJD8+Mis9ZXlm82v69DSsixmbNhVP+2Zl/WF2JH+mQFLETLpCRXVUmWuz2Jf2Ad
         I+ydnuuxhPpPu9rCmDsXVIonu6qlgYMS3vW0yCmH6lYERJwYr4QORHRNBAYRnh3FaaIn
         bmSieErLn2DN+7ckgpcQnIsHWKCOGdmDbdeV2YU4pA9/xdqcZDnkHSQ5kadz8txQUwve
         7o18SaEKnyG9hizYIRKnG0X750xhOStvJ05DVyeRwcUIfCS+hGONBlVYx5+1bDi7TxLc
         8vkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767713292; x=1768318092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qx/j/TZVECEGAbM9e/6IqKSdBxKuuSFafhUUxwd/pFU=;
        b=OqnE+STPuYq/fHAxMsFBU+pOG9FodGWh1lmMSBkdTM8cz08P2ojs916VCCGicjnvSE
         d2vkGDgVesIm105rSgnGu05qAbQ3e20UDIOzjge/dyDOmglz/TJXzyY35BNFedUdTwlg
         wAFLmHDjCVMT54slQhXgwwVM/79EX5c4mr8KicIXC2PeN5UH0S4HuKb8VwGDI/XjqE31
         GRP03zo9bMEk3bi3lxdPycSDdENURW8JnB2zbdiK/G8xoe5t03AeQTVHriGHWpT0946B
         nRWsraQoqjnVTTsjpLlcvmzOmcAeEkNJs41Bo98XIQbyKxmQbhAauSSmL3QkotfF2m1L
         lV8A==
X-Gm-Message-State: AOJu0Yxwm5R8DNP/gj+eZTkavFB8ACRs5BuJUhTLmM6wXwL4GFcjWoDw
	zQFSZFf2Fje8qEtIMz5WLpBjX2UJZAfCiHmBW6YAM80mjwCNt0LU/Sl2wcb4pHtHvLEW7sBoIjn
	ZWb/4IIRilFEBkn6UgsanSz4wlROofpY93k6pomY=
X-Gm-Gg: AY/fxX5o09MufOWSGysmgtMsXndjo6bVu4XEiWUmQY4fTCatxxhwZaV7tzKTh3t5zOb
	ox1xLtjnZfTLPwAKOTyHFCb5RIP3+cvi8q6el0F5J0IrS1b6vudwGbqbv710/aqkYgcBg2Rv4KS
	wbmu0lmxRk491sPevMtfxPjRlOmcHGFzL3S3UvbnqvVbdSNehVdBHiFD4r28//0AgJjtt/xYzmc
	oETzHgmcZfEfEXZhhKo+bDklCm5X0EpVJhRon8j7y2d4BSPlFiiQr5fxgecTC2CPmztl/g1YyB6
	VfWiiq0=
X-Google-Smtp-Source: AGHT+IE8JwK3Fd7YAczL0dJih1gV1hn29LAOf6jo6qOZ985flG9TyOkf1wAl99i+8li8zAEf6Yjjof5TcUFDdLLRugk=
X-Received: by 2002:a17:90b:134e:b0:34e:63c1:4a08 with SMTP id
 98e67ed59e1d1-34f5f32e632mr2745466a91.20.1767713292324; Tue, 06 Jan 2026
 07:28:12 -0800 (PST)
MIME-Version: 1.0
References: <20260106143712.843971-1-joaomarcos.costa@bootlin.com> <20260106143712.843971-3-joaomarcos.costa@bootlin.com>
In-Reply-To: <20260106143712.843971-3-joaomarcos.costa@bootlin.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 6 Jan 2026 10:28:01 -0500
X-Gm-Features: AQt7F2qptX5a7FrYxrFMP71aDueyTgzzBXg22DqnqeOnS0KmGrfdD5voSFVWUT0
Message-ID: <CADkTA4MpUSoTk-igh-Z2pcUQx7peJwZriiSbYmNpUJfPQqA4cg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v1 2/2] linux-yocto/6.12: riscv: relocate
 KERNEL_FEATURES_RISCV into recipe
To: joaomarcos.costa@bootlin.com
Cc: openembedded-core@lists.openembedded.org, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 15:28:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228902

On Tue, Jan 6, 2026 at 9:37=E2=80=AFAM Joao Marcos Costa via
lists.openembedded.org
<joaomarcos.costa=3Dbootlin.com@lists.openembedded.org> wrote:
>
> In a custom linux recipe that requires linux-yocto.inc, the metadata
> files (*.scc) end up in KERNEL_FEATURES. However, the custom recipe's
> FILESPATH does not contain the path to oe-core's linux-yocto directory
> (as expected), which leads to the error below:
>
> ERROR: linux-custom-6.12.15+git-r0 do_kernel_metadata:
> Feature 'arch/riscv/tunes/riscv-isa-clear.scc' not found, this will cause=
 configuration failures.
> ERROR: linux-custom-6.12.15+git-r0 do_kernel_metadata:
> Check the SRC_URI for meta-data repositories or directories that may be m=
issing
>
> Move KERNEL_FEATURES_RISCV - along with the appends - out of the common
> definitions.

We shouldn't do this either.

It dooms us to carry it along with each versioned linux-yocto recipe,
which we don't
want.

Maybe a new .inc that all the linux-yocto recipe's inherit could work,
since it is
then something smaller to carry along.

Bruce

>
> Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto.inc     | 16 ----------------
>  meta/recipes-kernel/linux/linux-yocto_6.12.bb | 16 ++++++++++++++++
>  2 files changed, 16 insertions(+), 16 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-ker=
nel/linux/linux-yocto.inc
> index 4d0a726bb6..389329030d 100644
> --- a/meta/recipes-kernel/linux/linux-yocto.inc
> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> @@ -37,22 +37,6 @@ KERNEL_FEATURES:append =3D " ${@bb.utils.contains('MAC=
HINE_FEATURES', 'efi', 'cfg/
>  KERNEL_FEATURES:append =3D " ${@bb.utils.contains('MACHINE_FEATURES', 'n=
uma', 'features/numa/numa.scc', '', d)}"
>  KERNEL_FEATURES:append =3D " ${@bb.utils.contains('MACHINE_FEATURES', 'v=
fat', 'cfg/fs/vfat.scc', '', d)}"
>
> -KERNEL_FEATURES_RISCV =3D "\
> -    arch/riscv/tunes/riscv-isa-clear.scc \
> -    ${@bb.utils.contains(    'TUNE_FEATURES', 'rv 32 i m a', 'arch/riscv=
/tunes/riscv-isa-rv32i.scc',  '', d)} \
> -    ${@bb.utils.contains(    'TUNE_FEATURES', 'rv 64 i m a', 'arch/riscv=
/tunes/riscv-isa-rv64i.scc',  '', d)} \
> -    ${@bb.utils.contains(    'TUNE_FEATURES', 'f d',         'arch/riscv=
/tunes/riscv-isa-fpu.scc',    '', d)} \
> -    ${@bb.utils.contains(    'TUNE_FEATURES', 'c',           'arch/riscv=
/tunes/riscv-isa-c.scc',      '', d)} \
> -    ${@bb.utils.contains(    'TUNE_FEATURES', 'v',           'arch/riscv=
/tunes/riscv-isa-v.scc',      '', d)} \
> -    ${@bb.utils.contains_any('TUNE_FEATURES', 'b zba',       'arch/riscv=
/tunes/riscv-isa-zba.scc',    '', d)} \
> -    ${@bb.utils.contains_any('TUNE_FEATURES', 'b zbb',       'arch/riscv=
/tunes/riscv-isa-zbb.scc',    '', d)} \
> -    ${@bb.utils.contains(    'TUNE_FEATURES', 'zbc',         'arch/riscv=
/tunes/riscv-isa-zbc.scc',    '', d)} \
> -    ${@bb.utils.contains(    'TUNE_FEATURES', 'zicbom',      'arch/riscv=
/tunes/riscv-isa-zicbom.scc', '', d)} \
> -    "
> -
> -KERNEL_FEATURES:append:riscv32 =3D " ${KERNEL_FEATURES_RISCV}"
> -KERNEL_FEATURES:append:riscv64 =3D " ${KERNEL_FEATURES_RISCV}"
> -
>  # A KMACHINE is the mapping of a yocto $MACHINE to what is built
>  # by the kernel. This is typically the branch that should be built,
>  # and it can be specific to the machine or shared
> diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb b/meta/recipes=
-kernel/linux/linux-yocto_6.12.bb
> index 84419f8c78..22fa4ba5e0 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
> @@ -76,4 +76,20 @@ KERNEL_FEATURES:append:powerpc64le =3D " arch/powerpc/=
powerpc-debug.scc"
>  # ERROR: modpost: __ex_table+0x17a4 references non-executable section '.=
debug_loclists'
>  # Check again during next major version upgrade
>  KERNEL_FEATURES:remove:riscv32 =3D "features/debug/debug-kernel.scc"
> +KERNEL_FEATURES_RISCV =3D "\
> +    arch/riscv/tunes/riscv-isa-clear.scc \
> +    ${@bb.utils.contains(    'TUNE_FEATURES', 'rv 32 i m a', 'arch/riscv=
/tunes/riscv-isa-rv32i.scc',  '', d)} \
> +    ${@bb.utils.contains(    'TUNE_FEATURES', 'rv 64 i m a', 'arch/riscv=
/tunes/riscv-isa-rv64i.scc',  '', d)} \
> +    ${@bb.utils.contains(    'TUNE_FEATURES', 'f d',         'arch/riscv=
/tunes/riscv-isa-fpu.scc',    '', d)} \
> +    ${@bb.utils.contains(    'TUNE_FEATURES', 'c',           'arch/riscv=
/tunes/riscv-isa-c.scc',      '', d)} \
> +    ${@bb.utils.contains(    'TUNE_FEATURES', 'v',           'arch/riscv=
/tunes/riscv-isa-v.scc',      '', d)} \
> +    ${@bb.utils.contains_any('TUNE_FEATURES', 'b zba',       'arch/riscv=
/tunes/riscv-isa-zba.scc',    '', d)} \
> +    ${@bb.utils.contains_any('TUNE_FEATURES', 'b zbb',       'arch/riscv=
/tunes/riscv-isa-zbb.scc',    '', d)} \
> +    ${@bb.utils.contains(    'TUNE_FEATURES', 'zbc',         'arch/riscv=
/tunes/riscv-isa-zbc.scc',    '', d)} \
> +    ${@bb.utils.contains(    'TUNE_FEATURES', 'zicbom',      'arch/riscv=
/tunes/riscv-isa-zicbom.scc', '', d)} \
> +    "
> +
> +KERNEL_FEATURES:append:riscv32 =3D " ${KERNEL_FEATURES_RISCV}"
> +KERNEL_FEATURES:append:riscv64 =3D " ${KERNEL_FEATURES_RISCV}"
> +
>  INSANE_SKIP:kernel-vmlinux:qemuppc64 =3D "textrel"
> --
> 2.47.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#228891): https://lists.openembedded.org/g/openembedde=
d-core/message/228891
> Mute This Topic: https://lists.openembedded.org/mt/117105622/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

