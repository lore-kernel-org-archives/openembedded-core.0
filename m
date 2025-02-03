Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F22D4C02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 19:42:42 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web11.97368.1738611762497317751
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 11:42:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AKfSFb4P;
 spf=pass (domain: gmail.com, ip: 209.85.161.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5f4c111991bso2282437eaf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 11:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738611761; x=1739216561; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v6xcIYzEnKgk9lQ6XJHizA2qlPhKZWxWHjIfI1CwreM=;
        b=AKfSFb4PKLj3cvuDpMZgZNF4MNtaezN42Nto5E0vbrHJ03W2q1h2d+DTdJyAQzy7sH
         65V07aK9gThRqTkiS/FCO1Hr+FD2Xmii6PZY/5nHbXWn66bA6XWP+YQq1IBcnwZsvUab
         FJo15JjxlvU3oxILSxzIM2vOTMSVViRCv4iINgx5vpCQn6wD3u31Pxku+j70BnWQqH02
         PUZh/U9zAQtNuCNXGZfN+GSLMoZoT74SLrSYzXzs6I3ZaHSvCB/H645bmqKHVHrpvsiO
         3LLa+Yx2cHEozjP142YkWHHoKs6/5+HhX7yrHJtAnABHBKAQioWwancau4FJNRU4Dk1s
         LLEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738611761; x=1739216561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v6xcIYzEnKgk9lQ6XJHizA2qlPhKZWxWHjIfI1CwreM=;
        b=KaMC6BAVzl4TLzYXZbk0Ulbxu8YqpAUchbBU4ArYM9J1/yR1sQAkSMqTwP/e+To19e
         COvw7GnSBRSlLwJPhmMGPzTno8sdIGpreOBcOpjDSicDwwZFV3Y+N1zrwsiD5J60UtSy
         dTDLcTeg7todz1bwJHYJhZjGc9g6FQpwlx9b0IsR9dobyxuIMKOaXV1mmbOYJ42FCqct
         W6EFmxRQpjNIM0rJ4y2VNsU6uEn713DF5yiX2eemWa0h9ngnK9i7guRQvXiLHRv/Drzy
         KHPNr+uzIuwLNhoO0eVRIltXVbZw5L+MgM37j2mAzCzw29vfhRi1E6jNBHA4lzPswkRF
         sbKA==
X-Gm-Message-State: AOJu0Yx/Hr/3avQnIRQgragKIw8b3TSt+bQIBH7fvL5AiF7QmVBqt+1N
	8hMEbD+eYAcbPr0rnA2WuAFwjM4ucfs7yqY2NYMom/ynB3CaOShEiF3OGDxtGy/J6gkSNxnHDQb
	kpO6f3VAJHocWUhb1gcM0Hmo/y2g=
X-Gm-Gg: ASbGncuY8R8JtZGpndjU4Rs8x+viaJl4lPZul1aDX8NDdPI063b9wtkR85bM9i2Ey4i
	cmfhOMXbfk7Bwoc4BLYGNFD2vl0RNq1NY8ihWAgsTJvex2MkUTZHGf/WpwySz0CoL0nr2fzsG/H
	IEKsALMBNBrdGgohR0HnncFfZHWg==
X-Google-Smtp-Source: AGHT+IFdXjk5zrXGtxh/lAYPHDh3NAP8JL2he4IqmJ8TwDesESPa4MAXgxmzg6kP3Xpj99cUNauma6Dzg32b76xOk7A=
X-Received: by 2002:a05:6871:7983:b0:29e:3d2a:a4a9 with SMTP id
 586e51a60fabf-2b3e74d1c98mr369653fac.5.1738611761549; Mon, 03 Feb 2025
 11:42:41 -0800 (PST)
MIME-Version: 1.0
References: <20250203-b4-support-v2-0-848008ad29ea@cherry.de>
In-Reply-To: <20250203-b4-support-v2-0-848008ad29ea@cherry.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 3 Feb 2025 11:42:15 -0800
X-Gm-Features: AWEUYZm5RlPKghrPE8u9PsA9ayXYtL3WC2oTkR0o68FWsTtFvt9KsPVIrTiBo84
Message-ID: <CAMKF1sqh0VMORr2ivhz82XVt7EuZ_UmUgtFVHOXb0pQwDesnnw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 0/2] add basic b4 config file
To: foss@0leil.net
Cc: openembedded-core@lists.openembedded.org, 
	Quentin Schulz <quentin.schulz@cherry.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 19:42:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210731

On Mon, Feb 3, 2025 at 7:18=E2=80=AFAM Quentin Schulz via
lists.openembedded.org <foss=3D0leil.net@lists.openembedded.org> wrote:
>
> This adds very basic support for using b4 in OE-Core. This essentially
> just automatically adds the proper mailing list when running b4 prep
> --auto-to-cc.
>
> This also adds the b4 wrapper script that poky will need to use in order
> to identify which mailing list a patch needs to be sent to and do some
> additional per-patch checks that aren't necessary when running from
> vanilla OE-Core.
>
> Once this is merged, poky will need to merge OE-Core into itself and
> override with its own .b4-config that makes use of that script.
>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
> Changes in v2:
> - add mention to first patch that running patchtest for b4 prep --check
>   is what we're eventually aiming for,
> - add poky b4 wrapper script (it used to be in the patch series for
>   poky, c.f. https://lore.kernel.org/poky/20250123-b4-support-v1-1-4841f5=
2eccbb@cherry.de/T/#m95d6aa25cc42352416da477cf07d7b3cbd671231
> - poky b4 wrapper script properly identifies patches with files modified
>   in both OE-Core and other repos part of poky,
> - poky b4 wrapper script pretty prints when there's more than one
>   project modified by a script, instead of lazily printing a Python
>   list,
> - Link to v1: https://lore.kernel.org/r/20250117-b4-support-v1-1-fe74a5f5=
0eb6@cherry.de
>
> ---
> Quentin Schulz (2):
>       add basic b4 config file
>       scripts: add b4-wrapper for poky
>
>  .b4-config                 |   3 +
>  scripts/b4-wrapper-poky.py | 170 +++++++++++++++++++++++++++++++++++++++=
++++++

is there anything specific to poky in this script ? if not then it
should not use that in name, it will
make it confusing. In oe-core we do not refer to particular distros if
not needed.

>  2 files changed, 173 insertions(+)
> ---
> base-commit: 30ea609d3357fb3de911f2f6a5e6856c151b976a
> change-id: 20250117-b4-support-10de313f53b7
>
> Best regards,
> --
> Quentin Schulz <quentin.schulz@cherry.de>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#210655): https://lists.openembedded.org/g/openembedde=
d-core/message/210655
> Mute This Topic: https://lists.openembedded.org/mt/110972445/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

