Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37B80C4332F
	for <webhook@archiver.kernel.org>; Tue,  1 Nov 2022 18:24:22 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web08.10085.1667327057870740426
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 11:24:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eh+z4xGt;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id a15so22135668ljb.7
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 11:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mi72GEqvRPBrBu5tIA2w4/So5Q5ox/Pkxu7MLtDKszI=;
        b=eh+z4xGtBe2nirr/DojE3Nd7c1Q3WP7hcss1WSjhiCoTnbxM4/AdR6x7HEFscI+9AM
         1xaLRhBFLaCLuHUwe3WXUQA7mdr86/mpj9JoFJPUiiqQve++EhKQnIDRHs6A9y1K0fXM
         bYdYouEFedWppRANH9H4poTF/YS/o1jwFh+p6FA1QS5fHx6SNYBnMBN9O2tGEiIZbhmz
         cvEWpZwrgY9ybIOJVxgV0A4m9aPMfSj46z4/CxTUc6d8v6MictwMMIrqMHFLSR9l5gIs
         Vxt1gkh0ILwp3xvzufUH74nELBcl+aOGUBUgSyvlsUHgm0+EMzcsr+3x9y/powGBZWW4
         l67w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mi72GEqvRPBrBu5tIA2w4/So5Q5ox/Pkxu7MLtDKszI=;
        b=eHmwxolcTDxm5tqwwbp7bmNBJ98PlBAkmJ6jwTF9ew4ctUaq3tkZQ75UwhZ4uI4/Bh
         SGG7r4aK88bk90AkNK684zMRRkPdBRTb0Uz9V3mHgYp64hzRQ7YvDx9u/P/esq7N3+l6
         CsXkty8OBZ49j6v0daCC9qiOPqxqBiUzaSCay78oo29VpsaHFTWXbz+4nSqfuS5hKjyr
         9ufNNceawVLFZAT58p5yzjcxiWI7NVtVgm71JhP0tHIQnL3B9vVwXcO2mwii+h42kWYh
         g3TXSx1kaGsUyyXZ/LdWOn4EMQa0kY0tOg0OL90eHpkBbOOWfuPBG1psnAUeHL7BQp5q
         eKAg==
X-Gm-Message-State: ACrzQf2ykYKzAweGL/os+8gdWqXLFjEXgtO7Z7GISuJhY3f77UWkirwE
	rvvNwb36WLaA1iP8Jt7Dvx5KOIrYbYSfuAkLg7M=
X-Google-Smtp-Source: AMsMyM68FM54lP81Tv9GXTdnsZdJAxXcdxF/6tulN/duVc3wlExkrj6dWzbgRPJfZlZNryNwPYH4AVXcptjaqmahuyc=
X-Received: by 2002:a05:651c:23a5:b0:26d:d196:d04 with SMTP id
 bk37-20020a05651c23a500b0026dd1960d04mr1209040ljb.403.1667327056198; Tue, 01
 Nov 2022 11:24:16 -0700 (PDT)
MIME-Version: 1.0
References: <20221021233726.1751124-1-sean.anderson@seco.com>
 <20221021233726.1751124-7-sean.anderson@seco.com> <f8039bfc391404e83464c6894ce3ebf5496f1da1.camel@linuxfoundation.org>
 <dbd14d02-ad22-1036-d659-f71eb09a0e83@seco.com> <514b492351ff6be577b80881adbc6b508fc04071.camel@linuxfoundation.org>
 <b0708cba-a038-7031-58b0-c08ef0fe6625@seco.com> <1c053ef1a0c03728cb09f5259a1d52adc631460c.camel@linuxfoundation.org>
 <cf9846db-f142-e8bd-3fbc-51a430b5684d@seco.com> <3720dadc9a760c068eed340cd7877c92b6ffd482.camel@linuxfoundation.org>
 <3b106bb0-ecdb-efb1-1a54-7ad6ae345852@seco.com> <42bd04f74f012c2bf921c486087a6659c9534756.camel@linuxfoundation.org>
 <3eccb82e-73ac-1e79-8a99-0d6b3cc7839d@seco.com> <ea92c4e3fda1e06defc28532e8f0b1c7205e09c1.camel@linuxfoundation.org>
 <c4d27774-ec17-e171-6470-1730441b5b02@seco.com> <172387EDE52D4BA6.10252@lists.openembedded.org>
In-Reply-To: <172387EDE52D4BA6.10252@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 1 Nov 2022 19:24:04 +0100
Message-ID: <CANNYZj_D7EKk=aYUYEK4UO9U0JLF+kkz7ajhx3o+QUgMXv3gWw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 6/6] u-boot: Rework signing to remove interdependencies
To: sean.anderson@seco.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 18:24:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172379

On Tue, 1 Nov 2022 at 19:02, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
> > You can set up something like pwbot [3], which integrates with patchwork
> > and your repository. It produces messages like [4] automatically when it
> > notices they have been merged into the repositiry, and marks them as
> > "Accepted" in patchwork. This is even lower effort for your maintainers.
>
> You are very much welcome to set these things up for the project and
> maintain them.

And by the way, this is a serious offer. We do not have a maintainer
for patchwork, and we are looking for one, as seen here:
https://git.yoctoproject.org/poky/tree/MAINTAINERS.md?h=master-next

Alex

