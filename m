Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C5BAC3ABC9
	for <webhook@archiver.kernel.org>; Sat, 10 May 2025 22:13:21 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web11.19693.1746915195710248779
 for <openembedded-core@lists.openembedded.org>;
 Sat, 10 May 2025 15:13:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iz2yrVBB;
 spf=pass (domain: gmail.com, ip: 209.85.167.170, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-401c43671ecso1868575b6e.0
        for <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 15:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746915195; x=1747519995; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q/yeBT0z0epi7aqJizTEQ77GpuCDmTHGqYRBn27rmfo=;
        b=iz2yrVBBMPTIRVbPCPryG6p4R7BEsVWyBtpWA+0mo4cvek0K4oOCa2acW+9Sb3fmmw
         fjM5GxyQjEcLsmxHWTQh1VlQMeDGte5vJdY8ti67z9I+KGiZ/fAY46J4aHrqA817K1Tb
         2C6iNIJi9NoE7vcfe7Daayb+wTwZ+70Cf+fw5jukgLvX5Qs04OsEF8iTRemuPo+Sh8Pm
         kUbn+4koHTV0hikBXcT+sOOD8kOKEPWbsJqPHfVxUgW13G/EixwohH8shB9ojmk2Myfl
         giA55XNLs3XbSFmH9ne5YWeSKhBBFq9hU2+5Z+HxjsnoY/BDuiWtU38d87kDt6njL9T9
         oBiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746915195; x=1747519995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q/yeBT0z0epi7aqJizTEQ77GpuCDmTHGqYRBn27rmfo=;
        b=m6YhduRAEyBh8delLnrsxGjPR2DZe2T+YM23s6dgEjCchRVcZX44DjhW9P7xdUgqQI
         OOud7UL1tKc9CjM+wH5GDmqlU5htNScn3UPDKPcwylJK8vv8M+BgHLmBa9qmJ31WA7H5
         4SAQgl94GkRh+7iweogsNwoKyDmUEtqhGuVka2aBS/yPYQJtpAU3qnV27ikfMp79naGx
         1OkhblyHziwATJmGLBFOl/P8ntX36vgszjfmhaAdFduo6zLQ5qHDaCnNcqgZr1vgkkzf
         fLRrVLMP9BpoXpcXEtmH+/BEoShn4RCtW543RE/T9XKvhNSYrSoHMJ8I8MprHrENjNTL
         9L4Q==
X-Gm-Message-State: AOJu0YwjkZ3aJA9rYzGEmqXs6Boft/OYekZfpA7+/oNH9sDgJLGxqvNd
	zLfZ5icTKw4iSziDGkux1263KN+k/5rY5T03FI4jtHklsHVoqQPtuvd8Szn9Pr4ahx7h9/7/NuQ
	5iSm93ZZFX5zRxlnmrVz52QS3f5g=
X-Gm-Gg: ASbGncusNH1OfCGSHDTJmoUH1rdCNdMPdZisVC05GtR3eh85pBvvCWIfqbV98UDYfRu
	r40j4CwPl+WuiZBQQCqH/PjkYV7vjrNA3idx7d7/0MrydyEgHWwG3l1gX7cVSM0sCkgyBiL1OgP
	iGbNUOCco2V22K2BGLHTrerTz7U2/ketVmWnnJvKpnkA==
X-Google-Smtp-Source: AGHT+IFvkd4MAKGvNZoo8tCpYiOnySDeLYAiJ4SN7oOc7QxUWHg1bxpGITwBjf1wA7dYubKSMXMEBmKPS2lBveyolRo=
X-Received: by 2002:a05:6808:3988:b0:400:7dd3:2dbe with SMTP id
 5614622812f47-403779e8bdfmr7247185b6e.14.1746915194811; Sat, 10 May 2025
 15:13:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1spkq=LkQf7qHmBB_DPD+4s73iXiCe54-kA+qfdnwFiT0A@mail.gmail.com>
 <29977.1746888734129629150@lists.openembedded.org> <CAMKF1sqHqP9O5po2Z7Egr18rjuksWJ3dv0oQgkDYN9w9VLCvbg@mail.gmail.com>
 <CAMKF1spoD=skyc4MG5XAMVBub9ZMQiMVLL61=hCvsSMsNOWcEQ@mail.gmail.com>
In-Reply-To: <CAMKF1spoD=skyc4MG5XAMVBub9ZMQiMVLL61=hCvsSMsNOWcEQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 10 May 2025 15:12:48 -0700
X-Gm-Features: AX0GCFuCYzQNBTxu2VKa_GXlVqmz8b-CwLbdN5B_ZxqLoT-RYk7ULzwCYwuQjjo
Message-ID: <CAMKF1sr4_8V+tKwtaAst9TsQkhoyVUHChJm3Hx5bY0_pFuvOWA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] compiler-rt-sanitizers, compiler-rt: skip for armv5
To: hongxu.jia@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 10 May 2025 22:13:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216280

Please see
https://patchwork.yoctoproject.org/project/oe-core/list/?series=3D34391

Will be good if you can test it in your env.

On Sat, May 10, 2025 at 2:29=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> I have a couple of patches to fix the compiler-rt builds for < armv6
> which are under test, I will send that later today.
>
> On Sat, May 10, 2025 at 7:59=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wro=
te:
> >
> >
> >
> > On Sat, May 10, 2025 at 7:52=E2=80=AFAM hongxu via lists.openembedded.o=
rg <hongxu.jia=3Deng.windriver.com@lists.openembedded.org> wrote:
> >>
> >> Hi Khem,
> >>
> >> I followed your suggestions to apply the following change on compiler-=
rt recipe and build it for qemuarmv5, the failure remains
> >
> >
> > Right I think the issue is that it also needs arch value set to armv5te=
 from toolchain triple and we use arm-poky-Linux-gnueabi and that confuses =
compiler-rt cmake as well I think it needs to be fixed as well along with h=
ost arch
> >
> >>
> >> --- a/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
> >> +++ b/meta/recipes-devtools/clang/compiler-rt-sanitizers_git.bb
> >> @@ -74,6 +74,7 @@ EXTRA_OECMAKE:append:class-target =3D "\
> >>                 -DCMAKE_AR=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREF=
IX}llvm-ar \
> >>                 -DCMAKE_NM=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREF=
IX}llvm-nm \
> >>                 -DCMAKE_C_COMPILER_TARGET=3D${HOST_ARCH}${HOST_VENDOR}=
-${HOST_OS} \
> >> +               -DCOMPILER_RT_DEFAULT_TARGET_ARCH=3D${@bb.utils.contai=
ns('TUNE_FEATURES', 'armv5 thumb dsp', 'armv5te', '${HOST_ARCH}', d)} \
> >>                 -DCOMPILER_RT_DEFAULT_TARGET_ONLY=3DON \
> >>                 -DCMAKE_POSITION_INDEPENDENT_CODE=3DON \
> >>  "
> >> diff --git a/meta/recipes-devtools/clang/compiler-rt_git.bb b/meta/rec=
ipes-devtools/clang/compiler-rt_git.bb
> >> index 93928541273..8073bc139eb 100644
> >> --- a/meta/recipes-devtools/clang/compiler-rt_git.bb
> >> +++ b/meta/recipes-devtools/clang/compiler-rt_git.bb
> >> @@ -80,6 +80,7 @@ EXTRA_OECMAKE:append:class-target =3D "\
> >>                 -DCMAKE_AR=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREF=
IX}llvm-ar \
> >>                 -DCMAKE_NM=3D${STAGING_BINDIR_TOOLCHAIN}/${TARGET_PREF=
IX}llvm-nm \
> >>                 -DCMAKE_C_COMPILER_TARGET=3D${HOST_ARCH}${HOST_VENDOR}=
-${HOST_OS}${HF} \
> >> +               -DCOMPILER_RT_DEFAULT_TARGET_ARCH=3D${@bb.utils.contai=
ns('TUNE_FEATURES', 'armv5 thumb dsp', 'armv5te', '${HOST_ARCH}', d)} \
> >>                 -DCMAKE_POSITION_INDEPENDENT_CODE=3DON \
> >>  "
> >>
> >> $ echo 'MACHINE =3D "qemuarmv5"' >> conf/local.conf
> >> $ bitbake compiler-rt
> >> ...
> >> /buildarea5/hjia/poky/build/tmp/work-shared/llvm-project-source-20.1.3=
-r0/llvm-project-20.1.3.src/compiler-rt/lib/builtins/arm/sync-ops.h:22:2: e=
rror: #error DMB is only supported on ARMv6+
> >>    22 | #error DMB is only supported on ARMv6+
> >>       |  ^~~~~
> >> ...
> >>
> >> //Hongxu
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#216273): https://lists.openembedded.org/g/openembe=
dded-core/message/216273
> >> Mute This Topic: https://lists.openembedded.org/mt/112897300/1997914
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[raj.khem@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>

