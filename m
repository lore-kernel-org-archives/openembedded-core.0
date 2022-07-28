Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55C1DC04A68
	for <webhook@archiver.kernel.org>; Thu, 28 Jul 2022 21:04:49 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.746.1659042288152316244
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jul 2022 14:04:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=J5nmLmHx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id
 2-20020a1c0202000000b003a3a22178beso1618131wmc.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jul 2022 14:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=IozpOH06AKuwkou670R+9va+tKFunY66Wxw4CD6yBk8=;
        b=J5nmLmHxIHEJyZKN/1aBEfCUEYOTLg4bmXtbclZntseUQkndEy4SihV9FWG2v8cPCS
         svQn+45c0i49aH/lJk5/sDjKl/uTGJ1jgye1e6gEMp5So3IeAuXBapXuGgejeRV66TyM
         Pxur/P1fl3cWsIdzZbfwBIK+HjSfQxI36y6+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=IozpOH06AKuwkou670R+9va+tKFunY66Wxw4CD6yBk8=;
        b=7aRRpb8vspRyXQBALGD+2HAVk+h0k7y/sRAk/R1FdluOAhJmlO/WbxGxxSckY8dgwI
         PFkWPmtYUZtUVVqA12fMEKqgrU7UT+bxbRFr9gDZisIp+ASy8RFi5trexxWxkzZ3Bkn1
         SLuLW31KKQpiYMwBSB2TPq+zagxVH5kh/tupjTb1ZeyvQyvZyj/ikClFLgtrFzMy7T0c
         yJDSUOO2QpZpXGYZOHIuOV6tIpODbjtXK8WwzhjaBm7QXINkBozu21QWdgQzDIE4KjZI
         8tQXgBnA0YDOndSSCSZFwtKZPEpFh3db5J9n1alvNBld3Fh08rJb0ROaL3CIILrHEcyk
         Coow==
X-Gm-Message-State: AJIora++z/UyD/H1YMamX3//nNBSnE5aLYUurdxhlRDH2itUaitnqCpc
	w6QW3Ugk1hvVrG8xcOkIe3blb7Nrnd6QEw==
X-Google-Smtp-Source: 
 AGRyM1uSPhrEuCm0A5OzDCFyKWHZRXk91G+WIAkGKs1ufsd4FhgrQ3OV+gqlk/FGaYC20AacGSknpw==
X-Received: by 2002:a05:600c:3d06:b0:3a3:58f6:9d96 with SMTP id
 bh6-20020a05600c3d0600b003a358f69d96mr703191wmb.195.1659042286006;
        Thu, 28 Jul 2022 14:04:46 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8ec8:b67:91aa:e08?
 ([2001:8b0:aba:5f3c:8ec8:b67:91aa:e08])
        by smtp.gmail.com with ESMTPSA id
 f11-20020a05600c4e8b00b003a31673515bsm7874013wmq.7.2022.07.28.14.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jul 2022 14:04:32 -0700 (PDT)
Message-ID: 
 <d02a0a5846ef0b3388c09cabc51d9704c92a3e56.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH RFC v2] rust: Rework and improve so SDK and
 target versions work
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Randy MacLeod <randy.macleod@windriver.com>, Khem Raj
 <raj.khem@gmail.com>,  Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>,
 Otavio Salvador <otavio.salvador@ossystems.com.br>
Date: Thu, 28 Jul 2022 22:04:18 +0100
In-Reply-To: <170619B45B2205EB.3760@lists.openembedded.org>
References: <170565F8EFEFBFA3.20615@lists.openembedded.org>
	 <170619B45B2205EB.3760@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Jul 2022 21:04:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168618

On Thu, 2022-07-28 at 21:56 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Tue, 2022-07-26 at 15:02 +0100, Richard Purdie via
> lists.openembedded.org wrote:
> > This patch:
> > * Uses RUST_{BUILD|HOST|TARGET}_SYS everywhere consistently within rust=
 context
> > * Moves the on target libraries to rust's "sysroot" layout so the SDK c=
an find
> >   libraries without prompting
> > * Moves the target SDK libraries into the target sysroot rather than th=
e native one
> > * Enables the target rustc compiler to be built
> > * Replaces cargo-cross-canadian with nativesdk-cargo
> >=20
> > * Drops rust-cross-XXX and uses rust-target-config to generate json con=
fig
> >   in each WORKDIR
> > * Add nativeksdk-rust as the SDK compiler
> > * Simplifies rust-cross-canadian-XXX to be the environment and json con=
fig
> >   for the target only (no binaries)
> > * Drop rust-crosssdk since it isnt needed now
> > * Drop a lot of the virtual/ compiler dependency mess since we don't ne=
ed it
> > * Cargo cross-canadian environment config is compiled with rust-cross-c=
anadian
> > * Adds RUST_{BUILD|HOST|TARGET}_SYS to the variable ignore list for has=
h purposes
> >   (since it should be accounted for in the build paths)
> > * Adds a slightly hacky approach to make target llvm-config work which =
removes
> >   the need for patching llvm.
> > * Drop rust-tools-cross-canadian and just build the tools as part of th=
e main
> >   rust/nativesdk-rust recipe to avoid rebuilding large chunks of the to=
olchain
> >=20
> > Work still remaining:
> > * Fully clean up the dependency simplification and removal of the virut=
al/
> >   code.
> > * Remove RUST_TARGETGENS since I think it is the same everywhere now
> > * The rust recipe doesn't need to always build stage0
> > * The rust recipe doesn't need to always build libstd-rs since
> >   we have a separate recipe. May drop the separate recipe and just copy
> >   the pieces out of the target rust build
> > * Maybe drop RUSTC variable, not sure it is used?
> > * Delete now unneeded rust-llvm llcm-config patch
> >=20
> > Adding to an SDK looks like: TOOLCHAIN_LANGS +=3D "rust"
> >=20
> > Known issues:
> > * rust target compiler fails for musl:
> >   https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/557=
4
> >   https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/558=
8
> > * rust target packages have buildpaths warnings:
> >   https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/558=
5/steps/11/logs/stdio
> > * mips n32 target rust config and libstd-rs fails:
> >   https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/560=
7
> > * May be multilib variant issues:
> >   https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/550=
3
> >   https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/32=
80
> > * Sundeep reported ld loader symbol relocation issues for libstdc++
> > * Breaks mingw build as currently configured
> >   https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/559=
1
>=20
> The patches in master-next further tweak and improve things. I have
> fixed the musl issue and many of the buildpaths ones as well as
> multilib and mingw. This means that we have remaining:
>=20
> 1) buildpaths warnings:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/5606
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/5602
> https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/3294
> [and likely a few more as the build completes]
> down to two issues:
> stdio: WARNING: rust-1.62.0-r0 do_package_qa: QA Issue: File /usr/bin/cli=
ppy-driver in package rust-tools-clippy contains reference to TMPDIR [build=
paths]
> stdio: WARNING: rust-1.62.0-r0 do_package_qa: QA Issue: File /usr/lib64/l=
ibrustc_driver-ba615092564ddb01.so in package rust contains reference to TM=
PDIR [buildpaths]
> stdio: WARNING: lib32-rust-1.62.0-r0 do_package_qa: QA Issue: File /usr/l=
ib/librustc_driver-a9887d06b965b287.so in package lib32-rust contains refer=
ence to TMPDIR [buildpaths]
> stdio: WARNING: lib32-rust-1.62.0-r0 do_package_qa: QA Issue: File /usr/b=
in/clippy-driver in package lib32-rust-tools-clippy contains reference to T=
MPDIR [buildpaths]
>=20
> clippy appears to have a sysroot path encoded into it, the rustc-driver
> is a path to llvm-config. I did try setting SYSROOT as an environment
> variable when building clippy with no success. I also tried making the
> llvm-config a script found via PATH but that failed to build. We may
> need to patch rust to deal with these.
>=20
>=20
> 2) mips n32 issue:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/5624/st=
eps/25/logs/stdio
> > LLVM ERROR: Not supported instr: <MCInst 0 <MCOperand Reg:433> <MCOpera=
nd Reg:338>>
> > LLVM ERROR: Not supported instr: <MCInst 0 <MCOperand Reg:422> <MCOpera=
nd Reg:1>>
> > warning: `libc` (lib) generated 2 warnings (2 duplicates)
>=20
> when building libstd-rs which may mean my guesses at the target data opti=
ons are still wrong.
>=20
>=20
> 3) Sundeep reported ld loader symbol relocation issues for libstdc++
>=20
>=20
>=20
> Fixing 1) is the priority as with that we can prepare the series for
> submission/review/merging. I'm taking some time away for the next few
> days so if anyone else wants to fix those...! :)
>=20
> 3) probably needs retesting against the current patches. For 2), not
> sure.

4)
https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/5591/step=
s/11/logs/stdio

some kind of llvm-rust relocation error?

Cheers,

Richard



