Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EC2AE6C5EA
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 01:55:11 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web10.9810.1733190902114190086
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Dec 2024 17:55:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nU9CufEL;
 spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-71d5ecf9556so2022770a34.0
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Dec 2024 17:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733190901; x=1733795701; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tiVdg5zqxrw3uqEeosif96TrWkYrGSsN6xw2UOW77xA=;
        b=nU9CufELw596iMgt/9X63NKQG9U1H8vhMchriFHrDjRVQUT6/kN3fJK7E0dqOIVLhg
         3f6RfFtta3pwXRtfmXT7jp9UEf0yU/R6WZbfkZr3ARmCPszETNm1Ei2uGVvaHGJ45w9h
         xwhkZU0mEiLcb2l/BoarvMk+lY/SdRYhz8fB+Sb5I9qSTdRoMxaFVstKNg418nhecAeh
         sox8k5vW/j7B5SS7C3S2euRmSzfwAXDno+KQ5sTcr3CAwckke9vaCv7aQ4mIxNIiOGuU
         fN8eTA7zBSRRLIqi47OpkpHf8tD2tuF+dzT5PTbaN7FGFmPENtQY2sgHG98or2Rtfzpo
         zI9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733190901; x=1733795701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tiVdg5zqxrw3uqEeosif96TrWkYrGSsN6xw2UOW77xA=;
        b=XlUJWd/aPNp1h9POlPUU6WX3cC09Vsr6t2RBC9C8DfO4VA80lgmsKqmY5kGAV40bLb
         O+FFMDxiMcZrTLt/5wwgoeF5lk1aw0NQ/DVIxBE3zafxh/kEQ3f+gcGR5hZEfiyzacgq
         PmAEpdnFOkYE6RCpkCux1J2L5Dl3Q4sT5Cw40IZdRlm0rIrsDJW0At4+uKd4i4Zt+mOE
         wkcTzy1PriP9HPG398zmTsJv/6D7IjN1k9TA9KJynXY00/4uJksxalJYTwNs/RX4gfkL
         5ymY5H7d8zIbp2nOlgpZ8WN6dYFTfHYX4730KmP5GvBPmraAXcy5NMokdX4d4aMKJh96
         ofRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXocI+Y52d/WYxJAPmaNn+Kui5t8f1Pd1YwUcMjOy3hh1KHC1ehtgs/0PiXpoSTufpPxKT8xEPgW+W7tcZNYstgrA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwSiRwvyNe0aQN1C+vnyKwZpte9KfxrgJQifhbZtZXG1i64b14u
	GBn7LLAJCn3gG8/GPZKLCQ6glocUQlTHo2PqaKFp3EqqvPR7SYxJLRQoYrIZCrdERou4yUrnPOS
	DBvW482GjCHtnexG3LkCL6ed07Srh+GkD
X-Gm-Gg: ASbGncvWAmwDXYv9VmHzzs7Rc1LOhq6aiwJEqLBhFYgDgX9JrkAeBl04AS2GQgqiIrj
	6bDiE1MnfPFUwmeJ02F8G2LRyIilLaQ==
X-Google-Smtp-Source: AGHT+IFW+fOjuchsqOCuvxhDU65pTTbU4yEnOrxpMNZZUxV5zC0weB0ADOBA5fsSvuI+tVJuy0XbG6rb55iBQN/Esys=
X-Received: by 2002:a05:6830:258a:b0:710:ea11:3d34 with SMTP id
 46e09a7af769-71dad63756dmr1154752a34.12.1733190901329; Mon, 02 Dec 2024
 17:55:01 -0800 (PST)
MIME-Version: 1.0
References: <20241202043514.3046780-1-Deepthi.Hemraj@windriver.com>
 <5a5f693b-6def-4763-89d0-91168d1085a4@windriver.com> <CAMKF1sqcPw0_=9XRfmyAGuc-3ny_p9uswUxM_0uOotGdoundJg@mail.gmail.com>
 <b0722ab2-7d99-4b0c-aa1f-45413dd75ee6@windriver.com>
In-Reply-To: <b0722ab2-7d99-4b0c-aa1f-45413dd75ee6@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 2 Dec 2024 17:54:35 -0800
Message-ID: <CAMKF1sq20qvm-+p9c4vthyzRGKmmMTsBaLjGtE26xDPJgJ3z2Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc-sanitizers: Add riscv64 as compatible host
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Deepthi.Hemraj@windriver.com, openembedded-core@lists.openembedded.org, 
	Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Dec 2024 01:55:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208170

On Mon, Dec 2, 2024 at 5:14=E2=80=AFPM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> On 2024-12-02 6:50 p.m., Khem Raj wrote:
>
> On Mon, Dec 2, 2024 at 3:14=E2=80=AFPM Randy MacLeod via
> lists.openembedded.org
> <randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
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
>
> its ok to use Sv39, other modes are not as common yet.
>
> Khem,
>
> Are you saying that we should config qemu-native (target?) for riscv64 to=
 default to SV39 ?

yes with 6.6+ kernel it should work ok.

>
> ../Randy
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
>
> --
> # Randy MacLeod
> # Wind River Linux

