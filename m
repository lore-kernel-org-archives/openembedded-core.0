Return-Path: <tomi.belan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2BC8C04AA5
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 21:10:24 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web09.16591.1661375416844920073
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 14:10:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=a5ZEuB+c;
 spf=pass (domain: gmail.com, ip: 209.85.167.174,
 mailfrom: tomi.belan@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id t140so11994201oie.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 14:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=Bte3nGowBQDvaQUV4xAOu9tI9Bbcxe45CNiR7TV6de4=;
        b=a5ZEuB+cp8MaF9Fmk5bADHwvoUU8z2N9p5kKcT3jeJ3/S4xai19VZtfD1qahO5LXUW
         wBoV2MpOgTtYGYYQ5Cgxn1ETp/zp1owlCCEuIHoeV3UjrXPHzHdS50TMy3pFzItyCIiR
         tNZpbeNKNPsW4K5G75WRCWa88RowHqf2uM0tkELpUNuqR4S0sCwK/TuWuDnqp/1jKJmb
         DmvNHaoteyx880kybOCVsJUZe2a3sL3CMu7fL2Uf8qVYXH/A3us0xfikacV4huiLbew4
         51tpOX3hxEkX293z+KGc0IMhjZHT4AE790dAD6Gh0Xs69FhmE+d/ZoQ6I2qlTsuiP0an
         RMrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=Bte3nGowBQDvaQUV4xAOu9tI9Bbcxe45CNiR7TV6de4=;
        b=pJU3YK62F8MPu0Ry+pM0cVYPhhYRKCw3qqy0l0zeCr6iUAY13457hrayTbFwnFZ6R9
         r2WRAzYlqPkSFf5JL6yNO3mMO2cHz2yDPrIizr9xKGpPlIiZLBUPqBOv3ThopzfJA5KQ
         s4oBro1+hsRvyE+/ZCifE66Mc6KJ/Li7/CQC38bgjqKpcUjjMarbcdWMXw09aVOf1EXe
         DtoKemq0dSiYMvKol3x4/MJMOvQ6YbPp1lXvhzdwoQz/2zSVszhNaGxrEfucLpiTJMG7
         7zVPoAfPcXHW20DzzAWwekI8ll0Wxzo+LHdkxkTZBWJ9SmWI44rBaKDEjxLsUFhRYcSA
         AoUg==
X-Gm-Message-State: ACgBeo3TXC3o36xEA3U93A0Pipvr6hFYyXQq2HJgSz8bwOmyRLWrVKai
	Nrc3ENLmqWG2Q+EFpxpPCorpzv+IJWsOYugv5MY=
X-Google-Smtp-Source: 
 AA6agR4EIDjp8XVaslkYMNwiKVVtUUp17w072TA82bK66d3HCTq0kYktPQA7ypW4pPYVz8xU+K4RbXEJ7BwyR/feV2I=
X-Received: by 2002:aca:3056:0:b0:345:64e9:7435 with SMTP id
 w83-20020aca3056000000b0034564e97435mr412607oiw.19.1661375416170; Wed, 24 Aug
 2022 14:10:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220824165136.11510-1-tomi.belan@gmail.com>
 <20220824223956.75729556@booty>
In-Reply-To: <20220824223956.75729556@booty>
From: Tomi Belan <tomi.belan@gmail.com>
Date: Wed, 24 Aug 2022 23:09:51 +0200
Message-ID: 
 <CACUV5oe6k9MLOGatqE4xC9TkB6sFb8FeG9qxs4F2ERyr_Upqrg@mail.gmail.com>
Subject: Re: [OE-core] [pseudo][PATCH] pseudo_util: Fix resolving relative
 paths from "/"
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Aug 2022 21:10:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169829

On Wed, Aug 24, 2022 at 10:40 PM Luca Ceresoli
<luca.ceresoli@bootlin.com> wrote:
> > canonical and yet starts with a slash. This happens when pseudo_cwd is "/" or
>                     ^^^^^^
> starts -> ends?

Oops, yes, of course. Good catch.

Should I send a v2 patch? :)
The corrected commit message line should be:
---
canonical and yet ends with a slash. This happens when pseudo_cwd is "/" or
---

Tomi

