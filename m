Return-Path: <geissonator@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BED6D6261B
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 17:57:31 +0000 (UTC)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43268.1769104646908911838
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jan 2026 09:57:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O3bAKOXh;
 spf=pass (domain: gmail.com, ip: 209.85.222.50, mailfrom: geissonator@gmail.com)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-94803734b11so813827241.2
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 09:57:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769104646; cv=none;
        d=google.com; s=arc-20240605;
        b=FUzNNsmcO1T1ChzeWLCfcNh6dStegZ3Cw6WjE5cLc80937bUKzTD9uTmekj3nkrDFE
         0Nv9nIqX3sZY3MKtRucJoQ8quBgG6bGB75KnEk4IgunNgYl44FOLhSWMyiMj+yYwBcsZ
         0nN9N7b1mMzzroL8x1d79vc8NPje4gjVZ4U5nmxPkP1dBZ8JvjO7FLgoQjHoWaF4TEDN
         0kDlgI7+bpnhZ0aF1u/xvGKErUzO6p1yHI6jooAZXqM3cLt9QOK1fFgV5meC3Cm5I3SH
         5pAqDGMhtasm1C7GjQmQmAdWHJbvkSbZ1yrsnVDUDHaCVaJfCXalCsTH8VPiV+d2fhVh
         PcyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=84Cl8fESCI5CtC3DosyvZzvIeO3EdwuQBKB64jYzkFc=;
        fh=IxSGd4rLH4VSwpCp+Omt0JTL4MREEYFYyLCOY2HpVDw=;
        b=NFJaI35YvBuZSPer8PyFHNdDEaZUm7F9xo1+1Jq1ZWlp6W9M2AUl465y/Woy424Z/G
         Hgg7O4xN3oy1FSvgRHM1TD5w3/8xE3hkjOAKrgjBBnatm8Uud8w7IEMxY9/wR1ErlZ0H
         hnUZnR0UvPi/AdNAd2mO48WNG8/hmgN1344u8DoWFM7E54NEZEs90sYr9gA3IB8uhJ4v
         OECbnwplI2Wjzvu8qlgJroVz+9A4YOz/2R88tP2qefr27DZztZpfDqQc4F+hgDNRM58z
         UREEPX8DsjEGOvWJRVXLcAvH3hmYF0NWmPGCI9ZHsmnaKQUJ1aybVJV1/j6LeX6ehgm0
         fPLA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769104646; x=1769709446; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=84Cl8fESCI5CtC3DosyvZzvIeO3EdwuQBKB64jYzkFc=;
        b=O3bAKOXhShciVJwNqkcnFvb5KnyfjJ4/mldbCDf9Vota000U9H5pJ3lRB96tKuAHpn
         VQ4V5N9BvZt/ZNNMrFyx2ww/APM3FQuhqdXytDNtWVk+ok5dvhlavD+m3s7Smx2fAAes
         82NzS/WrsF4mq+ma2CZ5j+O8hX/zz10ArqoVRGITYTNZrLuXtI5ds6j/VEJDROttB8So
         Fj+qlU+OkOLem9GMyVvj+DqIv0RUYgWsWZQ2WLuzQqUTTePFTWQRFDkouNWl0aqiY1Nt
         cl0kUahIui1mKywzPO9H0OSheACZVXIHyau0w8W9sB2klJUDA8wv5uYuDe0RthPTEDes
         k8Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769104646; x=1769709446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=84Cl8fESCI5CtC3DosyvZzvIeO3EdwuQBKB64jYzkFc=;
        b=PMbD/Uhc7Il+vf1gHBAfhCmT3cHRgpQcajQna9dEnQ5cw3ktW7fg1hyl3GAFjVrGsV
         GYjAE61RZWhDJ+Xpwj3/BNQT9HaIcDafQliHpTyGY1n82ULD+d+7D6YZ5dT1rWal2hnx
         isKz5fu8fJNU1X0WDi1yjfrUgI7rwjwE9pWr56fe2NcP/ihb9NisdmGpwJnqlPIZZTTO
         au2Xfxcw4RKoVcO68nfqYvugi9Shp6puNKiIaaVtNoSYDnMUrpbTWBtGvVLopVBduQlX
         mlCEfZsYkUccVxWyBvvM2rimxeb4JUvjSvguGe0+/KJ+mGhaAXMzJvAKdd1invKKTfKW
         3qAA==
X-Forwarded-Encrypted: i=1; AJvYcCWC55zBhNpwm1AO/WCBM+MgnWr5gbqa2Ev+FFvzGBLsljfFgxC30HQCEzGE+45qv183ZNxclOq58ZdGBQWXHvkSgw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw+2Knrtso/3H7JdtjUrCNLIxoS6e7ZeOho+vVlyGav3k+9v83S
	FQhPNz4Uf2F0q5reVx8yGX9Mq5sO0IS/NLlLvnY4BfXZ3slkPQDXTkGLm5vc2jdsPvgQelcl7Pb
	jCR8dbuHoODlpKaWIAEVoe9WqcnSr1cE=
X-Gm-Gg: AZuq6aLnzf7jrY8HYdwtbdI/DP3bEg+5q0lx7Ff4sjKzXQ5g2wEABqrhVwAxVHsiUdx
	wiZ0qv57Tc3Xub0D54oBI1MGjOYij4uZkct0cXPznN0usZd1IP3QunOBW+RH+iLRkYyvBDKb6Nq
	P2MRL2THTBhsO7VNv7V3fMsUDEoUvGmv2fp7hgtDKNhIfQPs6n15i7ueVTCWRJf4i/sWJ9FwPxL
	lF5Vj7t+d3IjdcAwLFAV1hHk/GyzhMCJW+YocZQ+BcntWXT4H0pScYtRrCespfvpPIjYg9/o0Ha
	+nfSFjCuJocNyVAwEwLE0AbU4zMCxNATWg+XBUo5JfZVSEEQZQXKWobp
X-Received: by 2002:a05:6102:944:b0:5db:d60a:6b1f with SMTP id
 ada2fe7eead31-5f54bc7ff99mr185121137.23.1769104645760; Thu, 22 Jan 2026
 09:57:25 -0800 (PST)
MIME-Version: 1.0
References: <20260116191256.3265364-1-geissonator@yahoo.com>
 <CANNYZj896UuNjPEzb4yOdQHe6dX=2oAxZGf6bF1Av2cGShLpNw@mail.gmail.com> <95b21b1f4a91a3d74faedaf62932a66d7ee26497.camel@pbarker.dev>
In-Reply-To: <95b21b1f4a91a3d74faedaf62932a66d7ee26497.camel@pbarker.dev>
From: Andrew Geissler <geissonator@gmail.com>
Date: Thu, 22 Jan 2026 11:57:09 -0600
X-Gm-Features: AZwV_QjhWEn_BCplIahbzpxtnpsF-9vEudjYNTjpwaxYWfs41X06qdsVoGNddX0
Message-ID: <CALLMt=r5JcF1i1RL2brgfaoZyD3=Ry+xzsFHC7my+b-51kN3yw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] global: convert all http to https
To: Paul Barker <paul@pbarker.dev>
Cc: alex.kanavin@gmail.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 17:57:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229855

Thanks for the reviews and feedback. My git email skills are fairly limited
so I hope my next patch comes through ok.

On Mon, Jan 19, 2026 at 6:41=E2=80=AFAM Paul Barker <paul@pbarker.dev> wrot=
e:
>
> On Mon, 2026-01-19 at 13:29 +0100, Alexander Kanavin via
> lists.openembedded.org wrote:
> > I don't necessarily disagree with the conversion, but I would like
> > proper verification of all links, and not not just 'some random
> > validation'. You can extract all the new links from the patch and
> > write a script that runs wget on them perhaps.

ok, I wrote a script to validate the new SRC_URI updates. It found a
few issues which I documented in the updated commit and just left
those as http.

> >
> > I also want to point out that there's no mechanism to enforce
> > https-only layer metadata. New http links will creep in, there's no
> > test to stop them.

Yeah, be great to get something into CI but hopefully with the vast
majority of examples being https it will naturally work itself out.


> > > For testing I confirmed core-image-minimal still builds and did some
> > > random validation of the links changed (but not every one of them).
>
> Further to what Alex said: This patch needs splitting up to make it
> reviewable. Perhaps one patch changing links in comments, one patch
> changing links in HOMEPAGE/BUGTRACKER variables, and one patch changing
> SRC_URI entries.

ok, for now I changed the patch to just do the SRC_URI updates.

