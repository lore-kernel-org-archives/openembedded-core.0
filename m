Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26981ECAAD5
	for <webhook@archiver.kernel.org>; Fri,  2 Sep 2022 16:50:27 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web08.1007.1662137417463762873
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Sep 2022 09:50:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EUopUYCf;
 spf=pass (domain: gmail.com, ip: 209.85.167.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id q7so4114041lfu.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Sep 2022 09:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=kgYKqFIscooRBpLs9HpghSuQbHyxmGjH2LutpDCiVmg=;
        b=EUopUYCfkql/HiEFwnSIWMtU/EmrjwQr8079a1HL3MREBRpT9UdU/pVHL6yqCZQwiC
         58q/j9yb/TQI3XlTvbHvLXA7alkFbPRKaMlXdQQBe6qb1E/CVE36sdtysfeq6yROu/5o
         3Pz9WEUczCCn4ooeqCdedxmq6JBV5dFev3zQQi3pf0gIuvr3bp3IVJ5Z2l5Rn2JR7MYX
         8AzhPTDDn2RvQNx/9XJy6rfdbtY68bpiy9MFhYYMmtm1d7s8fq7liNAs7LAexBKq8fv5
         AyXIiQvnamamTcUHVmjU+5e4rvaD6hM1dD3J/8dXz8izGIxniS0mJFlbUwuyRmwSQ+lt
         ONKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=kgYKqFIscooRBpLs9HpghSuQbHyxmGjH2LutpDCiVmg=;
        b=ij3V+QV1PWWDwLegAJPerupp8sY5eLRXvlFNsTfFi3hFkpRnGtGl6DYidOHnWUS2OG
         sV9fFFrt0DOul5BrSSWTzi2BBPOlUnJkWpR1gcjhfoi0+B1OZZmPoQbVLmUoFhlOlMSP
         rh6ln0dAD4FI/U+ZNewJeR6SfCxKpNB5lFoFnwk/W5ZbX7Qtkv3ebzKYPjLRw9WTUHta
         oxQlpEc4Etc8fkemsPQCOOzeQCFwWv04C1TBSc8LlznNpxmMaHMxW5ZnIhaiJjx1FlVw
         IDabH+Kc6lAeYDt5/3A7kev7sQMVql4Ml9+F2vgZiagskZYIDEB9vGgnHz6H7d650tJs
         9h3w==
X-Gm-Message-State: ACgBeo3OovXx40FVfwrxbB2HQ3spK9PUq6h/mtSO0fY+yr9kddfIowRF
	fvOPEUKvyqhXuTBIfYT8WH3mqiCfIkoTEC8SXZA=
X-Google-Smtp-Source: 
 AA6agR4bE9OF3IRUNVKp0wNQgkIhikOD24DPeJEA+IO0UuL7L6yPjRjvYvHlYUIQ5wSK+TY4ptpMCUH2agC2E7UuuDE=
X-Received: by 2002:a05:6512:13a4:b0:479:3b9f:f13c with SMTP id
 p36-20020a05651213a400b004793b9ff13cmr11939084lfa.380.1662137415483; Fri, 02
 Sep 2022 09:50:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220901142328.268769-1-alex@linutronix.de>
 <d9ec6fa663d94bcc9229066100a140fc@axis.com>
 <CANNYZj9cXbFogXaJdTeb2r89-AaPyL3txoJ4xn3ER=Dq7jy0mA@mail.gmail.com>
 <813962d42b7c46c9a0a8565de787d981@axis.com>
 <CANNYZj-rx80UFnEAEiVux7Wysvvj2PK05CC6hbosm5=6ymr=xQ@mail.gmail.com>
 <67b62aafd6e543138160018db7334da3@axis.com>
In-Reply-To: <67b62aafd6e543138160018db7334da3@axis.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 2 Sep 2022 18:50:02 +0200
Message-ID: 
 <CANNYZj81LoXjxCGY=36_WeR7a-gueC_TQiZ34-8Jaq6KHkdcCQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] scripts/oe-setup-builddir: migrate
 build/conf/templateconf.cfg to new template locations
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Sep 2022 16:50:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170259

On Fri, 2 Sept 2022 at 17:41, Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
> So based on the documentation, the officially supported ways to
> configure the template directory is to either specify TEMPLATECONF
> explicitly or by modifying .templateconf to set a default value.

Okay, I read that section, and I still think the requirement to have
.templateconf next to oe-init-build-env makes it altogether
impractical as a way to change the default from what poky/oe-core
prescribes, unless you want to maintain yet another custom script
doing non-standard magic before a build can start. I'm going to modify
the section so that TEMPLATECONF passed in explicitly is emphasized as
the standard method to set the template, and .templateconf is
described as primarily a fallback to the standard core/poky template.

Maybe we can decouple .templateconf from oe-init-build-env but I don't know how.

Alex

