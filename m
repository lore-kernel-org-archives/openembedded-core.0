Return-Path: <bbara93@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17A3CC001DB
	for <webhook@archiver.kernel.org>; Mon,  7 Aug 2023 16:51:14 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.39988.1691427066829535434
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Aug 2023 09:51:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=e99ArVxp;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: bbara93@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-51d95aed33aso6297761a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 09:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691427065; x=1692031865;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qzEmXUXVg1sbIske3d0vx2G2ysnWfXibzYjNoi3aIuA=;
        b=e99ArVxpG6fjOq0P6qe/AXG7aPnNrDrPzMEhqDrBjHXNoIdsntgAIosWhFMSZNZsmq
         g3xjtncGQZE6CnPDzk96k1mt6pocpt2blB7fYxaPFKiByfqQw70GHp3OT7eDVsfoXCAc
         9Kj05EbztQwhLrPcxs6aW/B5DmFnziDUO0therkZ7RaD1vitwedyN50ja63ghUCaUXAI
         FRc4C58uzCiNcTR4LbI+n7MpPWP4WkjRB8eJeC0uu7f5YAxTVIGB2BtHXHyZTPOdzqiy
         xpZaXocmhW1luOpvB4kwn6eMEIQBnM2dwDiNc40L5yPxx+O059Zhbi3tUWiAcd7bY8RB
         BNYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691427065; x=1692031865;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qzEmXUXVg1sbIske3d0vx2G2ysnWfXibzYjNoi3aIuA=;
        b=UEONdUP2/Ork7MS6eHAgZNq1pRtP/QY3FtWtwRzJlnZF2r7lsuor/X/Xd1T5Eyx8R9
         o83XaE663xAQ+LwK07iG9MEKY843Ile8D4CyomO3nzgyq/Bluti+leEMJkP7p9GuuuMR
         rtR+DE1bBnpZLZoOBM/omAaNnGhz1jEr/tZDjHpIFNgdV39LVqWwGuG5BIs4XCO6oIa4
         9uUFwnxyT3ovva+t6t+h5ybPm8DAVm7ZHjGCCWwjtIsUFLOrT6jJLFqgh4miTTAruy3h
         puNC9Md3BsuoVwfKebcjZn4xL3th/WTigR4r1lZWSrykj4sR4RQQ8RFmoD7sAwmh/Qb8
         vN+g==
X-Gm-Message-State: AOJu0YyMjshowA6fEmfyz2MpE8YD0EGvL2kimSU0QTa5B5pwqOE2olLH
	p4Tp9rsRQcZbXNRImWpbYoP8VUTAnmCNOC/jfZo=
X-Google-Smtp-Source: AGHT+IGNpSw4P2uEOPvysbIiqKxd3n+5mlKffEMjgp99mm1GLt4TIITmYgffJjBUTs32At4XIN3fnAytnSLC2T7Fa8Q=
X-Received: by 2002:a05:6402:1343:b0:522:45db:48e3 with SMTP id
 y3-20020a056402134300b0052245db48e3mr7541456edw.30.1691427064946; Mon, 07 Aug
 2023 09:51:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230802-rust-vfpv3d16-v1-1-9af645a4b407@skidata.com> <20230807102734f5b9517d@mail.local>
In-Reply-To: <20230807102734f5b9517d@mail.local>
From: Benjamin Bara <bbara93@gmail.com>
Date: Mon, 7 Aug 2023 18:50:53 +0200
Message-ID: <CAJpcXm6u_dodDhEHN-DROvBehEkDbMxNVniiy8aArqU3sn-rfw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rust-target-config: fix target_features for vfpv3d16
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	Benjamin Bara <benjamin.bara@skidata.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 16:51:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185611

Hi!

On Mon, 7 Aug 2023 at 12:27, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
> This causes failures:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/151/builds/304/steps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/147/builds/301/steps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/148/builds/306/steps/13/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/145/builds/299/steps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/154/builds/301/steps/13/logs/stdio

Thank you for the pointers! I guess it would be good to have the content
of summary.txt in case of a failure? Anyways, as the failure occurs for
different targets and the only added "common piece of code" is the
"else" for "-neon", I will add an elif instead which additionally
checks for armv7.
This should leave the other targets as-is.

Thanks and best regards,
Benjamin

