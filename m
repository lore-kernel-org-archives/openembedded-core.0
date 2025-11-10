Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAAA2CCF9E3
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 20:21:41 +0000 (UTC)
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.780.1762806096948640366
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Nov 2025 12:21:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dmNYYHiQ;
 spf=pass (domain: gmail.com, ip: 74.125.224.49, mailfrom: jpewhacker@gmail.com)
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-63e1e1bf882so2771649d50.1
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 12:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762806096; x=1763410896; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=311zUhhZHaWPElZZDvgZ+rnlwFtzld6n+ah3Cz96D10=;
        b=dmNYYHiQ3glMWJMlWx7jmUS2bGQVoIQbqq+sv+ZusA8LUSSr8RZX1xkYnRG6XqcwOT
         nYGs+WVi56xDsntdE8gdbnGtmShSo+Rm6pHq2jVEC0hq3X+ewkRjFlooLnhjtwftZlN5
         PgDVhtXTrxn6FrtYZh+++2jr/hOIgSIClnSWITf+cgC4L0Cje3dycdNJ7RXo3V4zwLEP
         r3GgEmu0Uckfu3IewgfdRKlgHOkP/yRklGcA2mBnre06/Y24c2HgyFgTs+qiEvu6pvQQ
         NxpSZ2+imx2i7tYubPqgWN80GAEKGzN15n8dmGX9sc3Q/+uPH2weEJBesbJ7a27mT/ki
         DjeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762806096; x=1763410896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=311zUhhZHaWPElZZDvgZ+rnlwFtzld6n+ah3Cz96D10=;
        b=L2GrQsVnU0j+ef+Jbhleby7mBl5cQDamVhG/ibF1EFDhfsUqjP+gq98FYNS1mI7LIX
         S0nFzAkbREpiMV3rFq4ER6xXGD7y7IsVnemo7YE/g0XjRUHz3Dl1JvCkESQrzNRfnjZd
         9m3UJlnp80uHSC32qVBQBkSjQzkseyM6tctqk+4DuIQjbahdCBkVZYNLLGptC/v9V4vO
         okTqZAC6i/9alG8O2//U3cwEPz4UJO1EaHZm+S9o75NH9lZmt6Do1b8FvvWwLLG2eY8B
         3hnx9tmlgmrdqy3BBfM009eoysWwon93IAo5rCTWsC0syMxgbFYWy+MZMxa9UDIyfskJ
         V3Cg==
X-Gm-Message-State: AOJu0Yxh0ooe8mLOw1lmurNYJrinuhg8jH2xrowWrb945t7scV7XTJjy
	eX2ymNgvnuaqfX0sT2MoDt05sDye1vVyaCH/me81bcbia9qM83zopBCT6oYYH8XuI3opREQRyLg
	NjNgeedQ/XxMXvpmuBLxL6XlIzzFXx/Q=
X-Gm-Gg: ASbGncttV573YC3m6Ty3Flp16vmjLkKaRMdR0erARcwbPcslAKvUDMBBlswY1p2Hcx8
	7ahgc432kzQfE/uzOv4DgR0cm4X2d2zLtWHV2SkI56n1KvX7pmgCItLIEwae63CE5kAWMR6GCOG
	n4LynzluyfpwyRHvK5YvPu46ZInDHZYmLKpgBybYqFfRZEHau+8wCCOwqnzulJ38FG1mDFoaodf
	ZpBWBCMN3LyafD5EeBRlUG9v9GMzOt+mYdvvCPzB0TG6EV0AHARUFQPqbPkQJnB+vhlDMVrF1mJ
	mcWVfpfOIQ==
X-Google-Smtp-Source: AGHT+IEOKmSUSeVAINMIS0RiLY5851xe9FDXjxkV2zjwC/PvApRz+OA69GM29iaEVPxFxAwmMoECWa/9dxdIS/DFJ/o=
X-Received: by 2002:a05:690c:dc1:b0:785:bfd8:c4c5 with SMTP id
 00721157ae682-787d53527c1mr164209347b3.11.1762806095934; Mon, 10 Nov 2025
 12:21:35 -0800 (PST)
MIME-Version: 1.0
References: <b2e867d19c02966f3e11d2c7e6b7765564587df5.camel@emlix.com> <6df562d0-8ce8-481a-a913-11bae6e0abaf@gmail.com>
In-Reply-To: <6df562d0-8ce8-481a-a913-11bae6e0abaf@gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Mon, 10 Nov 2025 13:21:25 -0700
X-Gm-Features: AWmQ_blAnTvE-6VcGiXLcbCcJBtyi442P2YsLl5nNoyQqA-4R24YeItevLhVlwY
Message-ID: <CAJdd5GY8rkuNt2G4tSwG1Bfc3vaG8+ojBb0Hs+nEsj=r3Nt1Lw@mail.gmail.com>
Subject: Re: [OE-core] Thoughts on SPDX for files from meta-layer
To: fbberton@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Nov 2025 20:21:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226138

On Mon, Nov 10, 2025 at 10:18=E2=80=AFAM Fabio Berton via
lists.openembedded.org <fbberton=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Hi Daniel,
>
> I'm working on something similar and have shared what I have so far, http=
s://lists.openembedded.org/g/openembedded-core/topic/rfc_patch_0_1_spdx_add=
/116223136.
>
> Could you please take a look?

You are correct in the observation that Files don't have a download
location, so externalRef would be the correct thing to use instead.
Otherwise, I think you're trying to do something pretty similar to
Daniel. I'll leave some comments in your patch

>
> Best regards,
> Fabio
>
> On 11/5/25 14:54, Daniel Wagenknecht via lists.openembedded.org wrote:
> > Hello,
> >
> > I've looked through the generated SPDX files for a project recently.
> > I' m specifically interested in the downloadLocation property that is
> > set for entries in SRC_URI in recipe scope SPDX files, as our list of
> > upstream sources we need to monitor for security information is based
> > off those values.
> >
> > We'd like to extend the generated SPDX to also cover files from meta-
> > layers, that are provided via file:// entries in SRC_URI. The files
> > provided via this mechanism are mostly configuration files, systemd
> > services, initscripts and the likes, so one could argue that they
> > are not relevant dependencies and thus do not need to be traced in
> > SPDX, but we'd prefer to properly trace them in the SPDX documents.
> >
> > Are there any thoughts on this, prior discussion that I've not found in
> > the mailinglist archive or external resources on how such files should
> > be treated in SPDX in general?
> >
> > I'm considering implementing this as outlined:
> > - for file:// entries in SRC_URI determine which layer provides the
> > file (via bb.fetch2.local.localpath())
> > - check if the layer is modified via oe.buildcfg.is_layer_modified()
> >   -> modified -> abort
> > - retrieve the layers URL. This is more involved since what
> > oe.buildcfg.get_metadata_git_remotes() returns might not be the URL
> > that should be specified in the downloadLocation
> > My approach would be to introduce a per-layer variable that specifies
> > it's public URL.
> >   -> no public URL for the layer found -> abort
> > - create a SPDXRef-Download-recipename-X entry for the file with the
> > downloadLocation set to the layers url with commit and subpath of the
> > file in the repository specified
> >
> > If the layer is modified or a public URL for that layer is not
> > specified the downloadLocation would yield a NOASSERTION value.
> >
> > I'd be glad to get some feedback on those ideas!
> >
> > Sincerely
> > Daniel Wagenknecht
> >
> >
> >
> >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#226132): https://lists.openembedded.org/g/openembedde=
d-core/message/226132
> Mute This Topic: https://lists.openembedded.org/mt/116135395/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JP=
EWhacker@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

