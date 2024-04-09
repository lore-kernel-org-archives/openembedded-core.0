Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F14FC67861
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 10:02:39 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.132361.1712656958085109677
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Apr 2024 03:02:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CTAuEPsz;
 spf=pass (domain: gmail.com, ip: 209.85.208.182, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d47a92cfefso68316041fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 03:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712656956; x=1713261756; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c3uYSWRB9zwUHb8go2TUssn4fk+x+35fJPyx61IKJDQ=;
        b=CTAuEPsznU9sinwln4cLVV6xShPHjZQQ4obK9IalQwPfTg4R5oTyTkqGmh371l5MPh
         Sc9YDMon720kIyy9Y2MLvfC68zI4o1SOKCGfEoh1e/uGj4x85F1hFhV6NFBdFU5Y+nyR
         GO4cUcE+6yZwTk/f/FVAw5iGa18hAqJh4ECI1dM01QQSoEeJyBnNMg9GFd8OA9g3Rb4x
         j27FoR8RWJeGMpn2GD+J9rYR/pE883qOheSRL5oRz1NKdjJiA/mGbDuy9EwWFAQW49Es
         hCuakCZXChbK5MtevU0zTuaoSBkSgFn9uTRrlDP1rfYLcQ8A9UbNTICSVhd8ixjW9tn+
         laAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712656956; x=1713261756;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c3uYSWRB9zwUHb8go2TUssn4fk+x+35fJPyx61IKJDQ=;
        b=ScB4FtSSnCOYw8BZOQVhlF/BrhWcCCRPg4JWXawjNX0eplyiIbSO7q+rko27FQAg2U
         bRUQkFDJqQAxqQKDDP/RzwVId5QT0BjU9TozhErqhdqRMI4BAVDfmcQGtJJu3AnfiW+b
         zg+nKRnoGndyHJk9X1z3j2DdAZSFY/Ee0JHiAj6Zfba+MW2SzUiUNAnLu/9l1+c7pE/a
         PhoogvP7xzbMxVI3KNi+YmzBBNL8ZMqzTSULODr2Ck3oToR6XBelb0a0iwn277mTmCeR
         lqvMwWLRaxi0e7ZB5Vp1iOaZccebIDtKhdGDRZX087mr+KYogyghbP+tyP4wiGv+Fmhx
         +89g==
X-Gm-Message-State: AOJu0YyZsZzZXuMy0X7i7XLWqt7pGgIotFunDM5Gf9Voq0UaIOfUqmSo
	NGLbTt1zSeZg2LP6eAIJ755JAwLs6yxSxROM0sXYG7ou4bB6Zu8aIiN/0YGSaa3gXnfvNC380kP
	6iy71IkLdSaew69rikuBKPmRBKSM=
X-Google-Smtp-Source: AGHT+IHHXDzLay7SACyxUFlW0wUTOsucQcsfEUBqU3pMqt2eoet71nFKFc5wnue2FXhb8j3Tx6NengC+UvSp7VFFyWg=
X-Received: by 2002:a2e:9b0b:0:b0:2d7:1830:d5f9 with SMTP id
 u11-20020a2e9b0b000000b002d71830d5f9mr7113777lji.31.1712656955473; Tue, 09
 Apr 2024 03:02:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240408070450.27686-1-peter.marko@siemens.com>
 <CANNYZj-HosUT6unGOohfRA22x9MWbUgYDn5N=mWjELVkTjBQsg@mail.gmail.com> <AS1PR10MB569732EB0A58FF2C515A9B25FD072@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB569732EB0A58FF2C515A9B25FD072@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 9 Apr 2024 12:02:23 +0200
Message-ID: <CANNYZj_T8-xbkc39KkXn_6pum=G2sC2ApLb9Txd_h-t3W6WwRA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] systemd: make predictable name mac policy opt-out
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 10:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198062

On Tue, 9 Apr 2024 at 11:57, Marko, Peter <Peter.Marko@siemens.com> wrote:
>
> -----Original Message-----
> From: Alexander Kanavin <alex.kanavin@gmail.com>
> Sent: Tuesday, April 9, 2024 11:16
> To: Marko, Peter (ADV D EU SK BFS1) <Peter.Marko@siemens.com>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core][PATCH] systemd: make predictable name mac policy opt-out
>
> > On Mon, 8 Apr 2024 at 09:06, Peter Marko via lists.openembedded.org <peter.marko=siemens.com@lists.openembedded.org> wrote:
> > > -           file://0001-NamePolicy.patch \
> > > +           ${@bb.utils.contains('PACKAGECONFIG',
> > > + 'predictable-if-mac', 'file://0001-NamePolicy.patch', '', d)} \
> >
> > Conditional patches are terrible for maintainability. Please make it a proper meson option, and submit upstream.
> >
> > Alex
>
> This patch has status upstream inappropriate.
> Pushing something like that to upstream doesn't sound like a good plan.

It's inappropriate as it is now, but with a meson option it would be
very appropriate.

> What about reverting the inappropriate patch completely instead?

I'm okay with that too. Please work this out with the patch author.

Alex

