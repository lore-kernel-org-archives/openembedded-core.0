Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D876C3DA59
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 21:26:23 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.3440.1721078777959484227
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 14:26:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KzsmzA1t;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: jpewhacker@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2eeb1051360so40962101fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 14:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721078776; x=1721683576; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8jOgelbOmZ1+aoSaGav+agiWfj22J8aN0vb481ILol8=;
        b=KzsmzA1t64NXe9WN5jBwaA8FevyG/Lv2w07EXR+z7pHIM2ABq2g1Aoak6mElQuCjMH
         hArfUqnTeu1EQ8xJuXsmK+zNvgQ3h8QprUOZf9WCzMHwhdCkoo4hSyRQLQDPEyO3NvE6
         1YyJfBDDZZ5csCX1gmirCzsEXwS7rHcWgl8g2oOj86V0tUS3zIaMOEbSt+hHX7kxkxwg
         2aiU6iN3v3Ws6AS0ie6qxZliDbxmRe/5UvgCwn5G4ONajS2UkKmY6NxVVnkD+v5E+qtp
         zz1iEcKeQtMhn3+q2oIZiWP5R1b8LbupmGaDgMHlnC9+qItvUxAELqSnSiOKuIfvcjsS
         3FhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721078776; x=1721683576;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8jOgelbOmZ1+aoSaGav+agiWfj22J8aN0vb481ILol8=;
        b=NcoVleZumBuKPRxUAD4hCm0UyhUA7+RJspsNqLBZmjQGMWecYT8F/8s9TP6xZBnbVF
         h7RZznS6N7B24m/HjgEN1d/ifm1WOJkQNxZL1gCziNC7u+9pA/L0Nls8bjheSG0+CUsV
         RaLI3m+WdYCnkFf0IjmXpMfQoD79dV7E7QEW6XBpcLpdoVygBxsjuUskUGk1FrxqGYuz
         cvSPxYFd2rMUQteNaxKjVqGNyhhTuuws5EAZUhhE2vUEOWJHd899cFEnC//KSj8Mh/Rf
         Dfl3lcBfMhc/rMGzJwOIyYdLy7LaPIObHkbHJwSOv5++EHCWai+qNsRCzCKuLfiFnhZP
         grvw==
X-Gm-Message-State: AOJu0YwUNTm7subJ7Z1+Q+kilgeeYZ0P2+0UUDQPQFM0ngzqRujJCyfN
	3rjERMe3X9qhfPTfjZSsn00qjHsoDSziFYLprWuWJicg1fDJC5CWaEVD4sRK+l+K2XSOnYmAfGs
	78iYPLJ4nZfqjj4y25DAFCkvz2PU=
X-Google-Smtp-Source: AGHT+IES8rcuv5DSa5fG5nGKLzlHMhTnHQnotj5cZnqvizAD7dAwF7hTL0g8oS8Ho/4X+s6tE0u97Moi8zcMEpYTm94=
X-Received: by 2002:a2e:9f4e:0:b0:2ec:4e59:a3de with SMTP id
 38308e7fff4ca-2eef415fec9mr1757451fa.10.1721078775770; Mon, 15 Jul 2024
 14:26:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240703140059.4096394-1-JPEWhacker@gmail.com>
 <20240712160304.3514496-1-JPEWhacker@gmail.com> <54c574fdb35ef25b71baaf1e1adfa8bd909a5f39.camel@linuxfoundation.org>
 <CAJdd5GaA4tByvK04pNycoApWYHeznYVe=y1ckSWsUVu=jwmjnQ@mail.gmail.com> <330caeaef519ceaf40dceac15ccd00be2ed38d60.camel@linuxfoundation.org>
In-Reply-To: <330caeaef519ceaf40dceac15ccd00be2ed38d60.camel@linuxfoundation.org>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 15 Jul 2024 15:26:03 -0600
Message-ID: <CAJdd5GZV2Ygb4iAPtRgyHt_40nBAonzfS6=XzmH9KwxOyUfyag@mail.gmail.com>
Subject: Re: [OE-core][PATCH v6 00/12] Add SPDX 3.0 support
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 21:26:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202071

On Mon, Jul 15, 2024 at 3:07=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2024-07-15 at 14:40 -0600, Joshua Watt wrote:
> > On Sat, Jul 13, 2024 at 12:44=E2=80=AFAM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Fri, 2024-07-12 at 09:58 -0600, Joshua Watt via
> > > lists.openembedded.org wrote:
> > > > This patch series add support for SPDX 3.0 and sets it as the
> > > > default.
> > > > Currently it is not possible to have SPDX 2.2 and SPDX 3.0
> > > > enabled at
> > > > the same time
> > > >
> > > > v2: Added tests and addressed feedback
> > > > v3: Fixed several oe-selftest and build failures
> > > > v4: Fixed silly typo mistake in staging.bbclass
> > > > v5: Reworked to make SPDX 3 output reproducible by default.
> > > > Variables
> > > >     that introduce non-reproducible output are documented as
> > > > such.
> > > > v6: Many changes:
> > > >   * Fixed bug where building baremetal images would break SPDX
> > > > 2.2
> > > >   * Most SPDX code is now in python library files instead of
> > > > tasks
> > > >   * Removed dependency on pacakge_write_* tasks
> > > >   * Fixed sstate selftest cases to account for SPDX 3.0 task
> > > > names
> > >
> > > This had a lot of failures in testing I'm afraid:
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/713=
4
> >
> > This appears to be caused because the SPDX tasks are not running for
> > some recipes (e.g. automake). It looks like this like:
> >
> >   do_create_rootfs_spdx[recrdeptask] +=3D "do_create_spdx
> > do_create_package_spdx"
> >
> > is not actually strong enough to make sure the SPDX tasks for
> > automake
> > run for e.g. core-image-sato-sdk, but I don't know why. I'll keep
> > looking, but if anyone happens to know off the top of their head let
> > me know
>
> Can you be specific about which tasks you mean when you say "make sure
> the SPDX tasks for automake run"? Do you mean do_create_spdx,
> do_create_package_spdx or a different one?

Specifically, do_create_package_spdx must be run for each package
installed in the rootfs before do_create_rootfs_spdx runs. I thought
that

  do_create_rootfs_spdx[recrdeptask] +=3D "do_create_spdx do_create_package=
_spdx"

would do this (the do_create_spdx is probably not necessary), since
AFIACT, this is also how the packages get generated before being
installed in the root file system via manipulation of
do_rootfs[recrdeptask], but I think I'm missing something?

>
> Cheers,
>
> Richard

