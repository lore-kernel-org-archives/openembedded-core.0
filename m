Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2401FC433EF
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 20:16:50 +0000 (UTC)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com
 [209.85.217.49])
 by mx.groups.io with SMTP id smtpd.web12.1992.1645129008559689368
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 12:16:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=loCNG3Hb;
 spf=pass (domain: gmail.com, ip: 209.85.217.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f49.google.com with SMTP id d26so2803448vsh.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 12:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Yayg24kuOojHFxreFW1pyk4SgnZErvoNSq5TFTwxaE4=;
        b=loCNG3HbQdpvtfRAG3nFhypeHyodWpmBGqhEGnxu8MPms4yZ426WT7yo8SUQgGVpJH
         feAPBb1SaKOP3kAmhrRZtE7ckOnIYCjmQ7KAcnKNphLxQCS6PNpi0v0GA38d3KDlcPvr
         LGztgqfxazqhlEoPNjI/c4yO/H5E2ELEesjh0HAm7bUWWggfBwH9cvfz9vIH61k/CGrF
         UlaTLY3GNsFFbI/jfz4+DVNrzqEF8tEBm6qflYsz4gMZIyHQZCaOkXQj8hTKu9DDfTO4
         nauxwHq7x3HHvO+JsSMbvfAM+TZzJdmFTWZktt3fqaw6AuWa5U25fKrNnz4I8ZGa5wp2
         sTUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Yayg24kuOojHFxreFW1pyk4SgnZErvoNSq5TFTwxaE4=;
        b=YGSb6K0f8JKqa6MnhRh4moa198m/YEfeA+ixevwUwnB7h3pazbnLotkvZlSPx0CKby
         aIhIl7yur7sRsXxovG/xUtFJqsQ4lXUZDdxH+plQu+zKiQwPVi7smNGMmbFbJDDQ4NDx
         YZr5YhoFggSOwBPhohpIhMGhT5NnCwSk+eZgbAxhVMiViJAyJsR3SUnrVjFx7Ic/GAPX
         b4DcidJ9h+CuZpXfCEoXRIKsejTWwy9IlBtJmyjqmM5I1hDQal+mkccWj1aO1MZIGyZ/
         wWs5+JRkEYZQR8qc2gaembmxSkHKC80Uo8fmOhkqkdyhtHwXvFg3emx2ehZFyKV0+E96
         8erQ==
X-Gm-Message-State: AOAM533/U0PXQf3oW/C+cn4EiRbG+o5592NEndO2e2r5EBrwkCArbQD0
	uiYRpXudDvjJM8lNV9Ry4rcdR2imfJR/CCQp8wQ=
X-Google-Smtp-Source: 
 ABdhPJz8kQpi5XqfmoX1y4p4V6XgF0e1xzHZiPUeUAXaYHZs39IypTZAIYYmVlGIzEEucMuDAebl/6Kquzk0qCy1O2I=
X-Received: by 2002:a05:6102:cd0:b0:310:4636:78c5 with SMTP id
 g16-20020a0561020cd000b00310463678c5mr2006867vst.45.1645129007723; Thu, 17
 Feb 2022 12:16:47 -0800 (PST)
MIME-Version: 1.0
References: <20220217160939.1424397-1-alex@linutronix.de>
 <20220217160939.1424397-2-alex@linutronix.de>
 <0d022bb4-9fe0-effa-d6b9-50812f060cdc@gmail.com>
 <16D4AB147C5087DA.27018@lists.openembedded.org>
 <CANNYZj8gG9vxKmU=5AU_7RV51Zji1b=mOT8fcdDqvvo-N9-Z-g@mail.gmail.com>
 <83fae3c2-2583-f6de-6b17-65193de1969e@gmail.com>
 <16D4AB76A8A77679.6551@lists.openembedded.org>
In-Reply-To: <16D4AB76A8A77679.6551@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 17 Feb 2022 21:16:36 +0100
Message-ID: 
 <CANNYZj_ukmN6dTh78zJh6TEuqze=b=vMTmeDp82AXj95WmM2_Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 02/28] weston-init: replace deprecated/disabled
 fbdev with drm backend
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>,
 OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 20:16:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161860

On Thu, 17 Feb 2022 at 21:04, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
>
> On Thu, 17 Feb 2022 at 21:03, Khem Raj <raj.khem@gmail.com> wrote:
> > what qemu targets are exercised by AB for full runtime tests ?
>
> x86/x86-64/x86-x32/arm/arm64/mips32/mips64/ppc32

As for risc-v, qemuriscv.inc has:
QB_GRAPHICS = "-device bochs-display"

If I remember right, that driver has kms/drm support, so it should
work like every other target, subject to bugs.

Alex

