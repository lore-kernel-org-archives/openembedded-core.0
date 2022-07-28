Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 533DFC04A68
	for <webhook@archiver.kernel.org>; Thu, 28 Jul 2022 20:56:19 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.646.1659041774574721606
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jul 2022 13:56:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eZm6mlPn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id a11so1627071wmq.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jul 2022 13:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=UnqLnie2UW1tOp9TkDdyK+4Cs+lNPV/1KNRtozppI8o=;
        b=eZm6mlPn76/mOygoKhjYj+R1ap/KdEhe7HZOMKtqD4tWWJhApU1CVTpIHV/Ux3jB7F
         qrihbjQsgA9B3ad/nPefJyRH4YBdBAssFEbyebc1vlFCol/lsWzJpwoCZS6JwM00h9t8
         JUgf2o0R9YBVqHCi9fVydXSAFf0CkL1/BE8Ig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=UnqLnie2UW1tOp9TkDdyK+4Cs+lNPV/1KNRtozppI8o=;
        b=QJfBTqS7W/VIarSI3+P5XDmY3fCF6YU8NuEuIKOCZ7EHpivMSgbJLdXlk5q7gyKNpS
         ttSpCi6g/fiZ1+XjLiPy9XOoCZLybfnrgGyzL6Hlo2gmZHyvmHs6MrJfGtKIsdu/cdfj
         W47lCJq3uMJoHdif6usmvz7s4dMR3dUkg+myfxf8COLePll9/R0PNyKedfllZ4dTr8d2
         jBYOvbOU47Qv9RjyT3Hh8/RQyeqD51xkjr57V0fhklwkVoGQ5Z8yuHVTFMwjsWBjyeYC
         buNFEvBATrOIsBePuHDpuVfxxFL8Gij+G0QOP5qkk0+lB2GI7gbn8VXIi6KwWbqBq6Gd
         9GVA==
X-Gm-Message-State: AJIora8nQOZAXxiJHzaK1y79Wtqxm43sEhlWSY9BhxSM5uZUX+gyj9/Z
	+/J3dh0SgV5FWT90u4kd2/AhENqYIUWSTw==
X-Google-Smtp-Source: 
 AGRyM1v0VXfX9Q9YBlKiTX6iugqq6IKV/Dqm6dL05PhrHsLDj0Vt7ejeXJBApf++Q1+BzPxcAr2hFw==
X-Received: by 2002:a05:600c:4ecc:b0:3a3:3861:72c2 with SMTP id
 g12-20020a05600c4ecc00b003a3386172c2mr729487wmq.46.1659041772421;
        Thu, 28 Jul 2022 13:56:12 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8ec8:b67:91aa:e08?
 ([2001:8b0:aba:5f3c:8ec8:b67:91aa:e08])
        by smtp.gmail.com with ESMTPSA id
 t1-20020a5d42c1000000b0021e6b62fde2sm1885012wrr.59.2022.07.28.13.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jul 2022 13:56:01 -0700 (PDT)
Message-ID: 
 <b1d3f38482080241c0d03837978d148599a6e9f0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH RFC v2] rust: Rework and improve so SDK and
 target versions work
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Randy MacLeod <randy.macleod@windriver.com>, Khem Raj
 <raj.khem@gmail.com>,  Sundeep KOKKONDA <sundeep.kokkonda@gmail.com>,
 Otavio Salvador <otavio.salvador@ossystems.com.br>
Date: Thu, 28 Jul 2022 21:56:00 +0100
In-Reply-To: <170565F8EFEFBFA3.20615@lists.openembedded.org>
References: <170565F8EFEFBFA3.20615@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Jul 2022 20:56:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168617

On Tue, 2022-07-26 at 15:02 +0100, Richard Purdie via
lists.openembedded.org wrote:
> This patch:
> * Uses RUST_{BUILD|HOST|TARGET}_SYS everywhere consistently within rust c=
ontext
> * Moves the on target libraries to rust's "sysroot" layout so the SDK can=
 find
>   libraries without prompting
> * Moves the target SDK libraries into the target sysroot rather than the =
native one
> * Enables the target rustc compiler to be built
> * Replaces cargo-cross-canadian with nativesdk-cargo
>=20
> * Drops rust-cross-XXX and uses rust-target-config to generate json confi=
g
>   in each WORKDIR
> * Add nativeksdk-rust as the SDK compiler
> * Simplifies rust-cross-canadian-XXX to be the environment and json confi=
g
>   for the target only (no binaries)
> * Drop rust-crosssdk since it isnt needed now
> * Drop a lot of the virtual/ compiler dependency mess since we don't need=
 it
> * Cargo cross-canadian environment config is compiled with rust-cross-can=
adian
> * Adds RUST_{BUILD|HOST|TARGET}_SYS to the variable ignore list for hash =
purposes
>   (since it should be accounted for in the build paths)
> * Adds a slightly hacky approach to make target llvm-config work which re=
moves
>   the need for patching llvm.
> * Drop rust-tools-cross-canadian and just build the tools as part of the =
main
>   rust/nativesdk-rust recipe to avoid rebuilding large chunks of the tool=
chain
>=20
> Work still remaining:
> * Fully clean up the dependency simplification and removal of the virutal=
/
>   code.
> * Remove RUST_TARGETGENS since I think it is the same everywhere now
> * The rust recipe doesn't need to always build stage0
> * The rust recipe doesn't need to always build libstd-rs since
>   we have a separate recipe. May drop the separate recipe and just copy
>   the pieces out of the target rust build
> * Maybe drop RUSTC variable, not sure it is used?
> * Delete now unneeded rust-llvm llcm-config patch
>=20
> Adding to an SDK looks like: TOOLCHAIN_LANGS +=3D "rust"
>=20
> Known issues:
> * rust target compiler fails for musl:
>   https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/5574
>   https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/5588
> * rust target packages have buildpaths warnings:
>   https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/5585/=
steps/11/logs/stdio
> * mips n32 target rust config and libstd-rs fails:
>   https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/5607
> * May be multilib variant issues:
>   https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/5503
>   https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/3280
> * Sundeep reported ld loader symbol relocation issues for libstdc++
> * Breaks mingw build as currently configured
>   https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/5591

The patches in master-next further tweak and improve things. I have
fixed the musl issue and many of the buildpaths ones as well as
multilib and mingw. This means that we have remaining:

1) buildpaths warnings:
https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/5606

https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/5602
https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/3294
[and likely a few more as the build completes]
down to two issues:
stdio: WARNING: rust-1.62.0-r0 do_package_qa: QA Issue: File /usr/bin/clipp=
y-driver in package rust-tools-clippy contains reference to TMPDIR [buildpa=
ths]
stdio: WARNING: rust-1.62.0-r0 do_package_qa: QA Issue: File /usr/lib64/lib=
rustc_driver-ba615092564ddb01.so in package rust contains reference to TMPD=
IR [buildpaths]
stdio: WARNING: lib32-rust-1.62.0-r0 do_package_qa: QA Issue: File /usr/lib=
/librustc_driver-a9887d06b965b287.so in package lib32-rust contains referen=
ce to TMPDIR [buildpaths]
stdio: WARNING: lib32-rust-1.62.0-r0 do_package_qa: QA Issue: File /usr/bin=
/clippy-driver in package lib32-rust-tools-clippy contains reference to TMP=
DIR [buildpaths]

clippy appears to have a sysroot path encoded into it, the rustc-driver
is a path to llvm-config. I did try setting SYSROOT as an environment
variable when building clippy with no success. I also tried making the
llvm-config a script found via PATH but that failed to build. We may
need to patch rust to deal with these.


2) mips n32 issue:
https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/5624/step=
s/25/logs/stdio
| LLVM ERROR: Not supported instr: <MCInst 0 <MCOperand Reg:433> <MCOperand=
 Reg:338>>
| LLVM ERROR: Not supported instr: <MCInst 0 <MCOperand Reg:422> <MCOperand=
 Reg:1>>
| warning: `libc` (lib) generated 2 warnings (2 duplicates)

when building libstd-rs which may mean my guesses at the target data option=
s are still wrong.


3) Sundeep reported ld loader symbol relocation issues for libstdc++



Fixing 1) is the priority as with that we can prepare the series for
submission/review/merging. I'm taking some time away for the next few
days so if anyone else wants to fix those...! :)

3) probably needs retesting against the current patches. For 2), not
sure.

Cheers,

Richard


