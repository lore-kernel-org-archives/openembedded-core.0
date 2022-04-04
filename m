Return-Path: <sundeep.kokkonda@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2704AC4167B
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:41 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.38277.1649089315967658685
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Apr 2022 09:21:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZdvzUALX;
 spf=pass (domain: gmail.com, ip: 209.85.216.47,
 mailfrom: sundeep.kokkonda@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id
 o5-20020a17090ad20500b001ca8a1dc47aso3842182pju.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Apr 2022 09:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=SNT2X0M9sEP9UrNQmewrmY5hMbUM7t5EPrj3W1P0LF4=;
        b=ZdvzUALXE37F1IScbE8V92aouI9KqX91A9Cz9byylFU86AbBIgWWy/H2YDuYzY7tYH
         rn6P1OvoY5qMZbqhuL0k6evrCCNFaLQcwQiRXT4eRFY5B8lkZqBRzBmEAkZoEnLnU5dT
         g55tlPOfGXwDyEZKKZIVk43GNkPmv30AyC1mmL2tfRjYvla4kPpsrxaEhJEwxH9zpcAL
         r4rPbMnsmrXq98RiMitmZcFdAYSSHIlp9gbAPgJDiqbCGW+Yh1o31TXA5evt8DQR48zL
         dCdhVeFy1lt6CNQlt+hZ9mfikv8xIMZOW+0hQ5WNMjuaGXkzswnBU60FKyzQ077g5chi
         6cuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
         :message-id:mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=SNT2X0M9sEP9UrNQmewrmY5hMbUM7t5EPrj3W1P0LF4=;
        b=RBvEcB5siLD/pYeZjLbRHDm0G5STmNSq04p0h4GYtMwE17Hdf0ZfjPJsb55q9AsHgs
         hKE8TP0A36jBJnCZLuhPb8tuc7U/TUyHoi7Nrat9RCBDw2QA92p/K1gyQV8CXOVlNPiA
         sZEK6ppgMDQNKZugBE4simDt3Eej3Xs2J3Oe0lhSEFVXpPZDxSqdpKLn4fzjPxbNHRhM
         7UkH7lkqCPT2rjcuUbTprTy9YxceDhEzFkpNE8RuoVAY0Yc+oZ3ZjC05QIz7elWnF2Vw
         5pIYwMOiaYVy8MRNHgAZ708AemjNdwv/5Snc8GU+ziydgTQpctaNCQORJpvMgCu2xCy5
         7ahw==
X-Gm-Message-State: AOAM533Jx80yvzOwAy9lZIXDRXUzeuLKFSk/jLNxdSAXSpWsFdSwA08g
	yK+x3R8EN/adP7wH08NnY+Y=
X-Google-Smtp-Source: 
 ABdhPJyHio3pWgSM0DIGjLHmnPlVRYN5Xz1jCPBBY6p3p65yY86GCIc2YWXzJip+PcW/j8GSmVQyFQ==
X-Received: by 2002:a17:903:124a:b0:154:c7a4:9374 with SMTP id
 u10-20020a170903124a00b00154c7a49374mr452710plh.68.1649089315280;
        Mon, 04 Apr 2022 09:21:55 -0700 (PDT)
Received: from SundeepGBF6NW2 ([103.197.112.115])
        by smtp.gmail.com with ESMTPSA id
 q22-20020a056a00085600b004fb308e393csm13844885pfk.178.2022.04.04.09.21.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Apr 2022 09:21:54 -0700 (PDT)
From: <sundeep.kokkonda@gmail.com>
To: "'Alexander Kanavin'" <alex.kanavin@gmail.com>
Cc: "'OE-core'" <openembedded-core@lists.openembedded.org>
References: 
 <CANNYZj_ed8mxVVmvyqVYAvGq4+Ghh+_5=jUX8czUX0VuhsLORA@mail.gmail.com>
 <12323.1649088402646367791@lists.openembedded.org>
 <CANNYZj8448no5kcOvpkQPiAqDoLoKufQhxBmAxctFLiB_e26gg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8448no5kcOvpkQPiAqDoLoKufQhxBmAxctFLiB_e26gg@mail.gmail.com>
Subject: RE: [OE-core] meta: rust: Bug fix for target definitions returning
 'NoneType'
Date: Mon, 4 Apr 2022 21:51:49 +0530
Message-ID: <19dc01d84840$190144d0$4b03ce70$@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQLt99rU2Fe9h9NjuoCO2MCXXHFewwKyU99KArTnH1KqiVaFcA==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164005

Hi Alex,

Commit message updated.


Thanks,
Sundeep K.

-----Original Message-----
From: Alexander Kanavin <alex.kanavin@gmail.com>=20
Sent: Monday, April 4, 2022 9:38 PM
To: Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] meta: rust: Bug fix for target definitions =
returning 'NoneType'

Thanks for the explanations! Can you place this information into the =
commit message?

Alex

On Mon, 4 Apr 2022 at 18:06, Sundeep KOKKONDA =
<sundeep.kokkonda@gmail.com> wrote:
>
> Hello Alex,
>
> Steps to reproduce:
>
> Set MACHINE ?=3D "qemuarm" in local.conf bitbake core-image-minimal=20
> -cpopulate_sdk
>
>
> Complete Error:
>
> ERROR: rust-cross-canadian-arm-1.59.0-r0 do_rust_gen_targets: Error =
executing a python function in exec_func_python() autogenerated:
>
> The stack trace of python calls that resulted in this =
exception/failure was:
> File: 'exec_func_python() autogenerated', lineno: 2, function: =
<module>
>      0001:
>  *** 0002:do_rust_gen_targets(d)
>      0003:
> File: =
'/ala-lpggp31/skokkonda/yocto/poky/meta/recipes-devtools/rust/rust-cross-=
canadian-common.inc', lineno: 31, function: do_rust_gen_targets
>      0027:
>      0028:LLVM_TARGET[x86_64] =3D "${RUST_HOST_SYS}"
>      0029:python do_rust_gen_targets () {
>      0030:    wd =3D d.getVar('WORKDIR') + '/targets/'
>  *** 0031:    rust_gen_target(d, 'TARGET', wd, =
d.getVar('TARGET_LLVM_FEATURES') or "", d.getVar('TARGET_LLVM_CPU'), =
d.getVar('TARGET_ARCH'))
>      0032:    rust_gen_target(d, 'HOST', wd, "", "generic", =
d.getVar('HOST_ARCH'))
>      0033:    rust_gen_target(d, 'BUILD', wd, "", "generic", =
d.getVar('BUILD_ARCH'))
>      0034:}
>      0035:
> File: =
'/ala-lpggp31/skokkonda/yocto/poky/meta/recipes-devtools/rust/rust-common=
.inc', lineno: 330, function: rust_gen_target
>      0326:    # build tspec
>      0327:    tspec =3D {}
>      0328:    tspec['llvm-target'] =3D d.getVarFlag('LLVM_TARGET', =
arch_abi)
>      0329:    tspec['data-layout'] =3D d.getVarFlag('DATA_LAYOUT', =
arch_abi)
>  *** 0330:    tspec['max-atomic-width'] =3D =
int(d.getVarFlag('MAX_ATOMIC_WIDTH', arch_abi))
>      0331:    tspec['target-pointer-width'] =3D =
d.getVarFlag('TARGET_POINTER_WIDTH', arch_abi)
>      0332:    tspec['target-c-int-width'] =3D =
d.getVarFlag('TARGET_C_INT_WIDTH', arch_abi)
>      0333:    tspec['target-endian'] =3D d.getVarFlag('TARGET_ENDIAN', =
arch_abi)
>      0334:    tspec['arch'] =3D arch_to_rust_target_arch(rust_arch)
> Exception: TypeError: int() argument must be a string, a bytes-like =
object or a number, not 'NoneType'
>
> ERROR: Logfile of failure stored in:=20
> /ala-lpggp31/skokkonda/yocto/poky/build_arm/tmp/work/x86_64-nativesdk-
> pokysdk-linux/rust-cross-canadian-arm/1.59.0-r0/temp/log.do_rust_gen_t
> argets.168831
> ERROR: Task =
(/ala-lpggp31/skokkonda/yocto/poky/meta/recipes-devtools/rust/rust-cross-=
canadian_1.59.0.bb:do_rust_gen_targets) failed with exit code '1'
> .
>
> I took local variables from rust_gen_target function for arm and =
aarch64 targets. Refer below, the tspec varibles for 'arm' generated =
with NoneType.
>
> Locals at rust_gen_target for arm::
> arch =3D  arm
> rust_arch =3D  arm
> arch_abi =3D  arm
> tspec['data-layout'] =3D  None
> Type of tspec['data-layout'] =3D  <class 'NoneType'>=20
> tspec['data-layout'] =3D  None Type of tspec['data-layout'] =3D  =
<class=20
> 'NoneType'>
> DEBUG: Python function do_rust_gen_targets finished
>
> Locals at rust_gen_target  for aarch64::
> arch =3D  aarch64
> rust_arch =3D  aarch64
> arch_abi =3D  aarch64
> tspec['data-layout'] =3D  aarch64-unknown-linux-gnu Type of=20
> tspec['data-layout'] =3D  <class 'str'> tspec['data-layout'] =3D =20
> e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128
> Type of tspec['data-layout'] =3D  <class 'str'>=20
> tspec['max-atomic-width'] =3D  128 Type of tspec['max-atomic-width'] =
=3D =20
> <class 'int'> tspec['target-pointer-width'] =3D  64 Type of=20
> tspec['target-pointer-width'] =3D  <class 'str'>=20
> tspec['target-c-int-width'] =3D  32 Type of =
tspec['target-c-int-width']=20
> =3D  <class 'str'> tspec['target-endian'] =3D  little Type of=20
> tspec['target-endian'] =3D  <class 'str'> tspec['arch'] =3D  aarch64 =
Type=20
> of tspec['arch'] =3D  <class 'str'>
>
> Reason for changing arm-eabi to arm:
> I noticed that the previous change introduced this bug, so I reverted =
the arm-eabi to arm and the issue is fixed.
>
>
> --
> Thanks,
> Sundeep K.
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164003):=20
> https://lists.openembedded.org/g/openembedded-core/message/164003
> Mute This Topic: https://lists.openembedded.org/mt/90172076/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub=20
> [alex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


