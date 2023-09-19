Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C792CE79A8
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 16:30:39 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.14478.1695141037143684579
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Sep 2023 09:30:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hKJQYumX;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2c00b37ad84so38142641fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Sep 2023 09:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695141035; x=1695745835; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kSvjhHePdRBrcvaq7XguXhjMWDYjYEzD1CKhPbcgcJM=;
        b=hKJQYumXB9Ejgs6k1wYf/fBitYr39mhAK1uM4ZR309hUmcDaqlzfVNPo1L6u9ps7VB
         aRFz0OIoct3s0NmJX2cUZYRT3lUFnTp4eWwJ26c3WAY1xkQ+EeO/viL71OL5xjTeQOnb
         9BbzxSeQgOU91L8+f+r8W5N8ma6JfR5I3rFGNj2Cq6RE3zt00R2e17c0CCn4xOwgvAQl
         fpxdOl/C50oAzZAs5erTkuJUJlAm0S8Pg4i/+czpOHw2m/8gfb+0SvwenfNHsEFZUkul
         msZ5MCGM4TEofKrJEz+S6kiO+lblyr9SLJQ+TYoHaAe1CAWP4cPC8uraxAQyndx4F1CM
         pzLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695141035; x=1695745835;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kSvjhHePdRBrcvaq7XguXhjMWDYjYEzD1CKhPbcgcJM=;
        b=mt0kGgJa0+OJNr/lWs0UFhnklMZjCmtZ9qlL/pOskOVRQ0cIn6Uba26s1M/Q2tmD/I
         q64GrvscfX005SBwCSIjpAxv9weGRKm9Y/uUkJBLu4BI9QXij3LHFf1yNjPoxmA2WpDa
         8wBZQBfpnyr+TbTCxalU631fD3ACKbvOugCElFbkuvQ5vhFxqeB5JVZNDvwQ9RoB1hcD
         BnYhrb3h2Jz4PET3XnHQD1Znlk0Diz/nUCvSsPy1VHItGib1sG3SZzg9SSTv8abP+5af
         LtsleouQ5oBrkpHjOvfeCVFFsfnNRCb9QP4rEXnbGwmJIQ09Hh7Pu/LN/skI1CFxl8B3
         6evg==
X-Gm-Message-State: AOJu0YyddS8cLkQjJib4NoD5t4zOKwyM6JBuogIDVRQPFacvxkWXi8Z/
	MXOgifTM08FcPhTeY7dTiwy9rohQ4QotDgN5vBM=
X-Google-Smtp-Source: AGHT+IHAU3l7qCPmp15YyvyL54HvuSBvmMhQRAuxy4oR+5aioqOeSF4x/ktwP/nOXhaN1kflN6Tlpn3u2QkhHKfYPbg=
X-Received: by 2002:a05:651c:2c5:b0:2c0:2e25:5730 with SMTP id
 f5-20020a05651c02c500b002c02e255730mr1387774ljo.5.1695141034991; Tue, 19 Sep
 2023 09:30:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230919114941.1819808-1-f_l_k@t-online.de> <CANNYZj_+k_AjWNXMK-uPFpH3uNL_aYFeCkXw=+3UCUKnmnGMcg@mail.gmail.com>
 <9RH81S.9NI7WQZ7L6QX@t-online.de> <CANNYZj967eyFsoO2uuQ0U185MFe9Dk9NXwDMWdp3Z-FYrPQkfA@mail.gmail.com>
 <202309191559576fcd373c@mail.local>
In-Reply-To: <202309191559576fcd373c@mail.local>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 19 Sep 2023 18:30:23 +0200
Message-ID: <CANNYZj-g6JvuMm3pRHJLHxhkVn_gw__E29iLksd8RWGSvdywew@mail.gmail.com>
Subject: Re: [oe-core][PATCH] vte: upgrade 2.72.2 -> 2.74.0
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Sep 2023 16:30:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187873

On Tue, 19 Sept 2023 at 17:59, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
> > Having gpl3-only recipes in core is not a problem. Ability to build
> > basic images without gpl3 items is tested, since that kind of thing is
>
> I don't think we test this anymore.

We do:
https://git.yoctoproject.org/poky/tree/meta/lib/oeqa/selftest/cases/incompatible_lic.py?h=master-next#n135
(the test in NoGPL3InImagesTests class)

You were probably thinking of meta-gplv2 tests.

Alex

