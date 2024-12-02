Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A765E69EA1
	for <webhook@archiver.kernel.org>; Mon,  2 Dec 2024 23:50:59 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web10.7560.1733183457546720664
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Dec 2024 15:50:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C6EQ+YRv;
 spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-71d4c462ab1so1824435a34.0
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Dec 2024 15:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733183457; x=1733788257; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WAHGVBfw/Jvt+MPti92qQLDkYKvvXgV6s2btVRbsB3Q=;
        b=C6EQ+YRvbhd1IWapcvPZl3fEQgCRQI6jVG4Jatcib09A24dW5vRDNKC183SEBt+1V9
         zylYNpgTpzGfJbN62CDHg077l+mnnBQo+sljjN2MabfZYhPvZc4UMArPrHjKup50REpO
         ORfnJc0pF6t1Jv24Vq9pGC0EcHexdZ3lVw+M4dVwgROR0n7l+McftAtOp1Tscn9Hpwl2
         4MYA86OIIg0BpS79DSXx+pL2JJ2TX8n8cv+gtw20Ny99NLgTUvYO5KYdW91JAEGFEi4B
         +F2ceDMf9m804OG+YTrFUK4Es41FE/RFZETFkgv5u5y1KJRb45nI39Za4u5YE9DIL8A0
         sH4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733183457; x=1733788257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WAHGVBfw/Jvt+MPti92qQLDkYKvvXgV6s2btVRbsB3Q=;
        b=tPQ2XxHne/LW7vnAU94ITSStJKVPTymNmQQ+PTId93qxNFlaywKDP7GGIWYms9rdWG
         TNJTxSPR3QvN5EMDV8WWICMrdWCseSpIjeBz+iAa0EqcK3slE/RnmwJSW1Y86KvzR5Ip
         9lag6OZktfSfoYEKZkDJBEYYgOI8SMnaPzYqyaxEUR2WMXUO94ojRoV0OVVImH/WY3xp
         /lE/xAIThQbKURNtrM903Z73NJYyb9yqCHVOSRla4zaXlFoJPavgP8vaQPgHVQZ6MVUW
         0s4OVYFTBM0H4DOuJZ0aRYHM91sSo8gxZvxZLbosEWv+miD94oaMQAzzP7j32n3qBYxb
         lDsg==
X-Forwarded-Encrypted: i=1; AJvYcCW/aXTMhRybeqRzgQ0NnCqW4J7BUMmBtylREvRUR2mf8FECdc66QUXNRNlM+enAbB4x4mAkpm0WYSQRSe+28E29Xg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxz1GzLgudgGijiEf/QHFQWVOWSkQzcs6RO6fC9hEBBf9x3Hy9Z
	pFmxKeTHdKrhQ92up8plT+0KFmDHyuaBoeC+1YZFT0miw/ZybsC3YXCxGideItCEGzu2GoLtQuq
	2mc+4UuiqdSrz9pievYx20KhF/HyPjw==
X-Gm-Gg: ASbGncsNdgObO6h/YjlfBgDPa7DzOYJ8owUJSFRGrnPFOWYn6mWmmBP/HCkQ5F/0Fm/
	cIKfSh0Dig+SUjSAFx7OZSG3hvvy/S1ew+Yn/MEOIm/FD6A==
X-Google-Smtp-Source: AGHT+IETkQmw7s9Fdq/bxg/x0zhvSaq+XWWA388udQi1onMFF7HKpSqZhg/5d8RDGMZmsdbttk2tlFQ4lEMrEkAUlDo=
X-Received: by 2002:a05:6830:6319:b0:718:615:462d with SMTP id
 46e09a7af769-71dad652c35mr630894a34.13.1733183456713; Mon, 02 Dec 2024
 15:50:56 -0800 (PST)
MIME-Version: 1.0
References: <20241202043514.3046780-1-Deepthi.Hemraj@windriver.com> <5a5f693b-6def-4763-89d0-91168d1085a4@windriver.com>
In-Reply-To: <5a5f693b-6def-4763-89d0-91168d1085a4@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 2 Dec 2024 15:50:30 -0800
Message-ID: <CAMKF1sqcPw0_=9XRfmyAGuc-3ny_p9uswUxM_0uOotGdoundJg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc-sanitizers: Add riscv64 as compatible host
To: randy.macleod@windriver.com
Cc: Deepthi.Hemraj@windriver.com, openembedded-core@lists.openembedded.org, 
	Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Dec 2024 23:50:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208166

On Mon, Dec 2, 2024 at 3:14=E2=80=AFPM Randy MacLeod via
lists.openembedded.org
<randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
>
> On 2024-12-01 11:35 p.m., Deepthi.Hemraj@windriver.com wrote:
>
> From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
>
> RISC-V offers several virtual memory address schemes (Sv39, Sv48, and Sv5=
7),
> but ASan currently supports only Sv39 on RISC-V64.
> For RISC-V64 Sv39, ASan uses custom allocator configurations
> tuned to manage large allocations efficiently.
> These tunings are incompatible with larger address spaces like
> Sv48/Sv57 due to differences in region sizes and alignment.
>
> For riscv64, Asan's tuning for Sv39 can be enabled in qemu
> by using the appropriate flag in the command line as shown below:
> runqemu nographic qemuparams=3D"-cpu rv64,sv39=3Dtrue"
>
> Additionally, the COMPATIBLE_HOST list in gcc-sanitizers has been
> updated to include riscv64. All necessary tests were successfully
> conducted on both hardware(Microchip PolarFire SoC)
> and the qemurisv64 environment, with ASan effectively
> detecting memory errors in both scenarios.
>
>
> Hi Deepthi,
>
>
> Nice! Thanks for confirming that the qemu command line option allows gcc-=
sanitizers to
>
> work without any code changes.
>
>
> One concern is testing: testers would have know that this flag was needed=
 for gcc-sanitizers.
>
> You could add a comment or documentation note as a hint but that doesn't =
automate and is error prone for people.
>
> I did note that "spacemonkeydelivers" (!) maintains that :
>
> "Indeed ASAN was ported to RISC-V when Sv39 was the default addressing mo=
de, and changes to run it in Sv48/Sv57 must be made.
> The issue is related to the way how the address space is split between st=
ack, heap and shadow versions of them."
> https://github.com/google/sanitizers/issues/1707#issuecomment-1852404560

its ok to use Sv39, other modes are not as common yet.

>
> so I don't think we've gotten to the best possible general purpose fix bu=
t rather a (helpful) work-around.
>
> I don't think we should merge this since there's more work to do for a pr=
oper fix.
>
> ../Randy
>
>
>
>
> Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
> ---
>  meta/recipes-devtools/gcc/gcc-sanitizers.inc | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipes-=
devtools/gcc/gcc-sanitizers.inc
> index 524ebd4ba4..8c98e9cf8a 100644
> --- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
> +++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
> @@ -73,13 +73,14 @@ RRECOMMENDS:${PN}:append:x86 =3D " liblsan"
>  RRECOMMENDS:${PN}:append:x86-64 =3D " liblsan libtsan"
>  RRECOMMENDS:${PN}:append:powerpc64 =3D " liblsan libtsan"
>  RRECOMMENDS:${PN}:append:aarch64 =3D " liblsan libtsan"
> +RRECOMMENDS:${PN}:append:riscv64 =3D " liblsan libtsan"
>
>  do_package_write_ipk[depends] +=3D "virtual/${MLPREFIX}${TARGET_PREFIX}c=
ompilerlibs:do_packagedata"
>  do_package_write_deb[depends] +=3D "virtual/${MLPREFIX}${TARGET_PREFIX}c=
ompilerlibs:do_packagedata"
>  do_package_write_rpm[depends] +=3D "virtual/${MLPREFIX}${TARGET_PREFIX}c=
ompilerlibs:do_packagedata"
>
>  # Only x86, powerpc, sparc, s390, arm, aarch64 and loongarch64 are suppo=
rted
> -COMPATIBLE_HOST =3D '(x86_64|i.86|powerpc|sparc|s390|arm|aarch64|loongar=
ch64).*-linux'
> +COMPATIBLE_HOST =3D '(x86_64|i.86|powerpc|sparc|s390|arm|aarch64|loongar=
ch64|riscv64).*-linux'
>  # musl is currently broken entirely
>  COMPATIBLE_HOST:libc-musl =3D 'null'
>
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#208161): https://lists.openembedded.org/g/openembedde=
d-core/message/208161
> Mute This Topic: https://lists.openembedded.org/mt/109874858/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

