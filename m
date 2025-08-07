Return-Path: <max.oss.09@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0558EC87FCF
	for <webhook@archiver.kernel.org>; Thu,  7 Aug 2025 12:37:50 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.50928.1754570261847006257
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Aug 2025 05:37:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a7AoYBi8;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: max.oss.09@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3b78d337dd9so562535f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Aug 2025 05:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754570260; x=1755175060; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S9E+0v2ucxe8Rl9qk5gSyFwvJkXSz4CfWc5Tz+6MmVw=;
        b=a7AoYBi825oFL+9GuHcbBf9qhnaHVQiS1R+VoozHxLVgk3GgpkO1YJGW1zxrFVD+ZT
         4ypqGkW26iG3yaMinXwAB+bQrEHzk2H4y5b+Ev9efbO7c/qhUo5n29yYRYLigPZWuT61
         tSUO+yIgiH/O0sxZPi8Mv6FlibDkZMWgAuCK/if5aTqq/uhl6rv/GNId22Od0Wwls5ct
         TjENHBG318Sa65x5RfA6VjiNnFKFwhEEKTAN7g4x6QkwrXqEyM/DGGrEh4rMc9v3Qgsf
         UhnulHnaWLldKA9xxE6yw4BjYXRm/leQOLmEaAzlwouwEwGDhlptJmQy86lRlJdqta0f
         QPaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754570260; x=1755175060;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S9E+0v2ucxe8Rl9qk5gSyFwvJkXSz4CfWc5Tz+6MmVw=;
        b=G43ZlTWqRcTNfaZpHaimqQ0Uiclnrb9GDBUltjV3dlaOO9FjLqoTPtRbJRdn0DlyZW
         wPFDhKH+bUXIeJPzhWEbph6Spm0YSCaGo3qFjzi+MTTklX90Vkas4pMslBplt1Ja8ncF
         OMWLXdSeVKY3EKl4q9S2WkV5hi3+vcslzLIBdruAChSd+jJXHU7t25fHfvnX4a/cMSsA
         KtNwwdsupq4+1DFjbnKswquGKQpabr7u8Vn5md1kHoW7oPC4Ubqr1xwgcFN+aFoAnAfz
         RSy9y6COzl4HaDYpDNf9ZfKK6S8yO5toPP9Jd3m1uwaNYYNAXHN/W9+Dp9TOnXuSYXRo
         WUYw==
X-Forwarded-Encrypted: i=1; AJvYcCWvPbTSamRX1Em0460siNkhoabUBhfeIHbp0dGpuX/ohwxm5ZMAVs0f6MFOfD/Kdl0qzLxGhexCNIv8X9r8sxQAow==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwwmR7ggBH1E0VJNAf7kqMnO+YQGeBnq4hirsRdd4gvT7ikx5Ev
	LTlzji5SA2Ntfmo6nOCNxCNc3fAXpu/1aU7u/df3lPG4w8otUL4qppH15YNQSbYAITrmhGxyOHl
	iKYyOD1IL06P6SN5AFFiv0usTNX993Mk=
X-Gm-Gg: ASbGncuLswiM0Q30/nW3DcY71FneFc0AoF+X3SuyfOjHPmBVmPeZDKORt+1/yUaAMhQ
	+0npqDRhYrj1uFnHee5qp9rcETjxmKpe3X7zAlnlLXBN/KtH9qd6feH4FaPQvZkQrck50PBdUk0
	2tezjomjSTTHR2XcvYXB+gg0kBkIz3WlLM2mWvPE5h4eEpojGwOg2Y6jS0Bz6zmboKgNIIX6pC0
	rRUicnf
X-Google-Smtp-Source: AGHT+IHG2vbg8/PaH9vqypac3aVBsxX8Kv7+ZqlVsuihwH5IvfXYDilds1ypcKsaqiuDxuqRQEscDQ9kxCGCUtAABhw=
X-Received: by 2002:a05:6000:2308:b0:3a4:dc93:1e87 with SMTP id
 ffacd0b85a97d-3b8f48d5a80mr5282269f8f.1.1754570260022; Thu, 07 Aug 2025
 05:37:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250724170600.1113476-1-raj.khem@gmail.com> <CAEHkU3V3tOfwAimXsEtj1vfKynQUB_+Ydq+x+ow5--pTYbrmHw@mail.gmail.com>
 <DBW6F58396OI.1148NBNN3G87Z@bootlin.com>
In-Reply-To: <DBW6F58396OI.1148NBNN3G87Z@bootlin.com>
From: Max Krummenacher <max.oss.09@gmail.com>
Date: Thu, 7 Aug 2025 14:37:29 +0200
X-Gm-Features: Ac12FXycKCZjTY0LUnusGYa3SwjMC_V-K5qmNEwRq7ZM5gxb2WvFKFjmghoEH6A
Message-ID: <CAEHkU3VBhgMO-DBWV9ToJzw3Q14T70zUx42mDe=7agaB_BukeQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4] feature-arm-crypto: Add +nocrypto to -mcpu
 when crypto not in features
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: raj.khem@gmail.com, openembedded-core@lists.openembedded.org, 
	Quentin Schulz <quentin.schulz@cherry.de>, Ryan Eatmon <reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Aug 2025 12:37:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221568

Hi Mathieu

On Thu, Aug 7, 2025 at 1:58=E2=80=AFPM Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
>
> On Thu Aug 7, 2025 at 1:49 PM CEST, Max Krummenacher via lists.openembedd=
ed.org wrote:
> > This breaks machines which set `DEFAULTTUNE ?=3D "aarch64"` and use gcc
> > as e.g. done for TI SoC [1].
> > For that tune the `TUNE_CCARGS_MARCH` is not set at all resulting in a
> > lone `+nocrypto`
> > in the compiler arguments. Note that for gcc additionally
> > `-march=3Daarch64` is not an allowed argument.
> >
> > I don't really know what is a good way forward. Of course one could
> > not use aarch64 as a default tune
> > to work around the issue.
> >
> > Any ideas?
> >
> > Regards
> > Max
> >
> > | checking for aarch64-tdx-linux-gcc... aarch64-tdx-linux-gcc
> > +nocrypto -mbranch-protection=3Dstandard -fstack-protector-strong  -O2
> > -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-secur=
ity
> > --sysroot=3D...aarch64-tdx-linux/libgcc-initial/15.1.0/recipe-sysroot
> > | checking for suffix of object files... configure: error: in
> > `...aarch64-tdx-linux/libgcc-initial/15.1.0/gcc-15.1.0/build.aarch64-td=
x-linux.aarch64-tdx-linux/libgcc':
> > | configure: error: cannot compute suffix of object files: cannot compi=
le
> >
> > [1] https://git.yoctoproject.org/meta-ti/tree/meta-ti-bsp/conf/machine/=
include/k3.inc#n6
>
> Hi Max,
>
> Can you try this fix commit?
>
> https://lists.openembedded.org/g/openembedded-core/message/221498

This fixes the issue in our setup as well.
Thanks for the pointer and sorry for the noise.

Regards
Max

>
> It will probably land in master in the coming days.
>
> Best regards,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

