Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 555A3C5AD49
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 23:21:37 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web10.7897.1749252096055079289
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 16:21:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V/9AfBqu;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-70e64b430daso25114297b3.3
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 16:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749252095; x=1749856895; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+5B1juTCi6cL3e9pNlr/z4j+EQOtuhUGrYhl9QaDNxo=;
        b=V/9AfBqumEcipvMuezL2u8QgkENqupNo6KOirHmU5yt+4vr2SiqbYp6WB7rHpguS98
         kX2uVv+l6GVWcIjbrrGRR46wSRlzRutGUUHixHICubcy78rMSJXi81zETuWDwaOh39Ra
         3XYPg/sJx7mEVJQG/pw2SFn/9SRvzLJpeL6CdBGsry0xOOqf3RQ4IMibvLubZa4DJ6tU
         2N3HmO0rCqlh1F0+8F52YGTbV/dmcYVfgcHKtZlOMDDs9nHk1m7oYSiQcCgM2wxkoyOs
         z6WrpCtG5ZG1KG3N6YzJJXCBKQwzBgWKJRrsrPSLNZYIOZEdMHyrXaE2CbC8p/7R88xj
         aq2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749252095; x=1749856895;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+5B1juTCi6cL3e9pNlr/z4j+EQOtuhUGrYhl9QaDNxo=;
        b=KIblwBXi7QdKTBR2pa9fLcyjoKUGuvIsIfZ9rS0kIW+5M34PZ0F7z1b4PKdnq9XC84
         nF1feoPDcNvVs9DS/WSSNWS/GVAwe6nWHusBub9H0EKbyI2yIMDBrBb5L6m9S0mO5UTk
         gWa1D4/gpgkmBF3lGnXlC/OQz9tvkw+h01/PXqhG8zpkqE+FDcOiFKxZRG0b+Nq+9pFh
         q6k4VHsJVVCID6gzi4Ty4NpPd9zC1THaSgtm7O3HCZGZhEK3jjTwiPloXZGVFabrNl2x
         LwSyqqsCS8NnuJkR6F82f3iVSIz7W/IBY7iA5M3AWz6lKuiPXow8npi4UfGLkoNyU+WZ
         +g6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWwWW2B0l0gpn8AO1SmYALzuUmwACqR0LQwRN1wQcOj9C4kdS6r15AT9N7htFkkS/FHRH3uozPOwEzOtSXPsO53QQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzzdDMlJrIhnfBrdblBLfvF6YYf8nrASK/AiN0t/aJnkRjeB9zn
	RzhCo5cUlzkArp5wzFcpoHPv2Ucby0Y5Gtj1UB6Wv7TJIRS1au9aJnryok/XztLaOyQAgVmAAh9
	4wr/ugqi4C58rJejBpDOWmPZP48aeHi6N7xzw+zk=
X-Gm-Gg: ASbGncvDrdQeMGF/dWbzPi3bPXCaLqbx0nRy5BG/H7+YmWNAkBWEPxeI5tUeYaNoqcB
	eE/4XbdG/bstDoYP7Fvy3dMxPptmFMgB7FgFvZb7UB+I9VQZuSltIYHhZJ7zDIqWzU9zev2nNSC
	zgy2sYU0mOqKhr7nDlmDVJoxcS/9IBmmRcKlqsE/AsiXJcOTn1mUWOog==
X-Google-Smtp-Source: AGHT+IF5EPlohMnMtkR+VM7ks66u/xes/vh7nz/GRXXdAoyVYW0R8wL4o+34zg4oals8risLFuN3qHJKYFO599HIe9M=
X-Received: by 2002:a05:690c:6403:b0:70e:73ae:766c with SMTP id
 00721157ae682-710f76873c6mr76840987b3.22.1749252095125; Fri, 06 Jun 2025
 16:21:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250530032047.1369164-1-sandeep.gundlupet-raju@amd.com>
 <8607D12C-E6E5-41DF-9809-6E748E1D749D@arm.com> <18462F4E324B73C9.10724@lists.openembedded.org>
 <1195a8d4-f134-4fe7-8169-2fb0b6f2fb6b@amd.com>
In-Reply-To: <1195a8d4-f134-4fe7-8169-2fb0b6f2fb6b@amd.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 6 Jun 2025 16:21:09 -0700
X-Gm-Features: AX0GCFuU4vIUx5ELGJRCfHYiuD1b4NG6FZ6HlE0MtQyupo_IPD78x5RrRf3ruJY
Message-ID: <CAMKF1sq7FSejf79sUhHyPbMmNnNeH1xs9ACXrd2R4WBDTxYn5Q@mail.gmail.com>
Subject: Re: [OE-core][scarthgap,master][PATCH] tune-cortexr52: Add support
 for ARM Cortex-R52 32-bit
To: "Gundlupet Raju, Sandeep" <sandeep.gundlupet-raju@amd.com>
Cc: ross.burton@arm.com, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, Jon Mason <Jon.Mason@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 23:21:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218189

Hi Sandeep

On Fri, Jun 6, 2025 at 10:35=E2=80=AFAM Gundlupet Raju, Sandeep
<sandeep.gundlupet-raju@amd.com> wrote:
>
>
> On 6/5/2025 9:31 AM, Sandeep Gundlupet Raju via lists.openembedded.org
> wrote:
> >
> > On 6/5/2025 8:12 AM, Ross Burton via lists.openembedded.org wrote:
> >> On 30 May 2025, at 04:20, Sandeep Gundlupet Raju via
> >> lists.openembedded.org
> >> <sandeep.gundlupet-raju=3Damd.com@lists.openembedded.org> wrote:
> >>> Add tune variant for ARM Cortex-R52 32-bit in GCC as there is no
> >>> support for Cortex-R52 32-bit toolchain.
> >> This is the wrong fix as the existing tune file is just wrong.
> >>
> >> The cortexr52 tune says:
> >>
> >> TUNE_FEATURES:tune-cortexr52 =3D "aarch64 crc simd cortexr52=E2=80=9D
> >>
> >> But the Cortex R52 Technical Reference Manual[1] says "The
> >> Cortex=C2=AE-R52 processor implements the Armv8-R AArch32 architecture=
=E2=80=9D,
> >> so there is no 64-bit R52.
> >>
> >> The solution here is to stop it claiming to be 64-bit at all.

Looking at web for docs I see

Cortex-r82 which is based on ARMv8-R with aarch64 ISA

https://developer.arm.com/Processors/Cortex-R82

Cortex-r52 which is under question here says its ARMv8-R but with 32bit ISA

https://developer.arm.com/Processors/Cortex-R52

So I think we should remove aarch64 from this tune, that will be right
thing to do for r52


> >>
> >> Ross
> >>
> >> [1]
> >> https://developer.arm.com/documentation/100026/0104/The-Cortex-R52-pro=
cessor/Supported-standards/Arm-architecture?lang=3Den
> > [Sandeep]: Ross, Thanks for the reference point. I can send a v2 patch
> > by removing 64-bit references. But I won't able to test all the use
> > cases.
> [Sandeep]: I had a chat with Khem and he said we can enable 64-bit ISA
> optionally. I will wait for Khem to reply wiht right pointers. This is
> blocking some of our deliverables to build r52-bit baremetal and zephyr
> application.
> >>
> >>
> >>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#218036): https://lists.openembedded.org/g/openembed=
ded-core/message/218036
> > Mute This Topic: https://lists.openembedded.org/mt/113374193/3619217
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
sandeep.gundlupet-raju@amd.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

