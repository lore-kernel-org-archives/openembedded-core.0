Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B42AEB64D9
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 22:43:26 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.8091.1688769795766754643
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jul 2023 15:43:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=SYlKATko;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-4fbbfaacfc1so3925868e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Jul 2023 15:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688769794; x=1691361794;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Novo4C1S+MQqTZvhILISmIc/Cbt8Dwz4s4/W2w9eEaE=;
        b=SYlKATkoTOcGe3akgiWvAkaeHfGH0FG9LCG/lf414O8LDu+eCAJW6u4ioliqC2NU7A
         AJx7wA/YdD1/QrMI8tIv0ns3blcWY4MAVJwjkBdgtVWlmjNQXpDEZtCrZbDy7++zwys4
         AXbDgKMCOZf0MHh4UfWMzf0+DF6Q2cMuw8IMi063wWKVJDDFs2I6Pz1sU3gUSSd92vtx
         JnZ7oaCsAcxd6i/5sjuYB/EeJPFWvWs1Iu+z3CtktnLPteWebJcSi3Ay7P5c9GHuoCWC
         bUsRCOIksMwohF2kdgU31PzcuaTF4ENRaK7uGKrPxaDWaYK5asznCwfg6FHk7Xqwthrc
         UMDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688769794; x=1691361794;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Novo4C1S+MQqTZvhILISmIc/Cbt8Dwz4s4/W2w9eEaE=;
        b=RUzEGasS2Mxjs+N3Jh0ReuYfP2qz9Hjwahk1zD7UsNiyRt5RgraLyC0JGR9DHWK1ds
         uaSFSDmTpPD+qDbZCFm2anJqaijHsyq43IZjq33Ewkk4evABXRBA7nplUq88zbnHoEIf
         Wi+F1o3YzL69ZGI5QLiEhu3oPfhXp9V9CMfQNtDaJzIsVq1Zd6cZ7Gg+VUJpycG7+nT1
         u8AdRKMXac0hBaTeUl2xIMwc3mtgN1hBgcrjW2+GQI1H/yP7vUoER3poujjOMiqJrS06
         v8N+6iMPmIeiktn7vgon/Xcv8StLsYF0aNkkNEO3o/DTQX3L22i+Ct0OAOo+G1WDKYWb
         Xulg==
X-Gm-Message-State: ABy/qLbBxIudxXKSzXromwyIgwRaozY2B/HSO4Aqlfk5N7fjh41w/fCU
	I7pe17oETS4aZFjDtLVbmLK1aSOusbIGC3OJ6YE=
X-Google-Smtp-Source: APBJJlFH/yikL/ikuYk2BDsqVq3djT0A7FsQxcndyMHF76vokPK1Gjlk13z5lagaNJAgMZk00F7t3W4W9ZbuaKGGaZc=
X-Received: by 2002:a05:6512:3f19:b0:4f8:586a:8af6 with SMTP id
 y25-20020a0565123f1900b004f8586a8af6mr5365100lfa.4.1688769793437; Fri, 07 Jul
 2023 15:43:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230707132649.3841870-1-alex@linutronix.de> <386DC5D1-AEB1-4799-94F5-C999E1DD8C10@arm.com>
 <176F9F2A43D46D21.7961@lists.openembedded.org> <CANNYZj9vYiAWsfmj9Q3_-25jUjiq0iPpVtQvuOJ2AM4p+gp+3g@mail.gmail.com>
 <176FAB1AAF8FB18E.3387@lists.openembedded.org> <ac5d0d60-6a48-8aa9-05d9-888763ffefb0@baylibre.com>
In-Reply-To: <ac5d0d60-6a48-8aa9-05d9-888763ffefb0@baylibre.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 8 Jul 2023 00:43:02 +0200
Message-ID: <CANNYZj__syMeHd81Jic06529GxEVzBdm_JbfL1h40NHO7-kZ1A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3: rework ptest handling
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: Ross Burton <Ross.Burton@arm.com>, OE-core <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jul 2023 22:43:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184018

On Fri, 7 Jul 2023 at 21:46, Trevor Gamblin <tgamblin@baylibre.com> wrote:
> FYI I didn't see the junit output option anywhere. Are you referring to
> an extra module?

If you run 'python3 -m test --help' you should see it:

  --junit-xml FILENAME  writes JUnit-style XML results to the specified file

Alex

