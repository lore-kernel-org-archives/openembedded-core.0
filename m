Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91A89C001DE
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 07:36:15 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.2555.1690788973418966360
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 00:36:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=q3/ypdxz;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-4fe2503e3easo3449558e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 00:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690788971; x=1691393771;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KPYIDMdNzuv9Jv1u/esZg/HAfZ8z6TLlLIgYNKfA0/A=;
        b=q3/ypdxzTFdMxgQYv/SOrQRYvAPC4fN8kGR14UyO35Fe1e5xqUzznJr0fZh/L920y+
         0N9P2mD0E7wl5h6yE+AKJAl6LBSHVVMCv24Fclw0OziA4ykGDSzci4aWxs1TwvBloDm4
         jltGCxHGu9p1oqKMJk7AtPXrCnL/oXTq/4sbnsJuzf1RSCgPUlIUOESAvhZI9tf67uDY
         ayBUcz3Px1yS6NzACZnI1hCKAlk3Xqf9SiK/w+AUCdLmdyMV9UYzha6A7huBjYOuwD01
         u/FLplciUWmJKL2UZRT46nF+GumKn21HEMu29Qm9KDrDkL1U4mJR7DPfphHwtpXXuAO8
         hz7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690788971; x=1691393771;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KPYIDMdNzuv9Jv1u/esZg/HAfZ8z6TLlLIgYNKfA0/A=;
        b=G3TTFOPzjfvf1Hazpw/zn4ZxyfqSHm7InomWpoeJTDqrxEj7fs51iwNTxehN58BcfK
         5h47Vk1BzwYLvMQX3qYCkxLUhuBR4FJIf5DfgscBF2znV2qiKaU8b620+jhDhXfokm3U
         X809tXZg+HPhe+dR+Tt+Ti1fIBUOSKDMJjHTwBGxpRiRnrVFd2ea7GHDVWS0DMaGx3kX
         UQ7PThl295H/xb6W5/PVJjbQW4quOq/AC/HwAN5Oq1i+8+ePexnC2mYUq9AfArBJx+x+
         KSiylQMw87hTkfstgUDmHsVK/hRlFbub/0crSIHarQh9SlcA0zERsXUYGCHmdLiOELkz
         yfxg==
X-Gm-Message-State: ABy/qLbCPFwbpnmHhqg1+NFO21OV7aEfMgAHtpUdDAWNWglswOxUxQIY
	OPJ+ln6kEjmCz9gmfKzTnZSvjehLek5DpjfkGHE=
X-Google-Smtp-Source: APBJJlGGLr8nC+3W50ymAIXx2MdEGvWsK8dvd4khRodvPt/oCL788gjUzTwLA0Bao3gPtCG6xQgL4VWjlMUSW3jw6q0=
X-Received: by 2002:a05:6512:2529:b0:4fe:181f:272c with SMTP id
 be41-20020a056512252900b004fe181f272cmr6004961lfb.41.1690788971123; Mon, 31
 Jul 2023 00:36:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230727143627.3718496-1-alex@linutronix.de> <20230727143627.3718496-12-alex@linutronix.de>
 <20230728131317ca8fba29@mail.local> <17760BA193C3A223.27447@lists.openembedded.org>
 <CANNYZj_=kDrFgL8nEv8vJsu6zvOra+V92=GjCGj-j2YVhhiOSQ@mail.gmail.com>
 <202307302036342002024f@mail.local> <1776DE5455DFB899.15684@lists.openembedded.org>
In-Reply-To: <1776DE5455DFB899.15684@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 31 Jul 2023 09:35:59 +0200
Message-ID: <CANNYZj-37vFJLXEmH8jODbS5zG_GRGf6KWQpJ8zYnEqGaYLy1A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 12/21] util-linux: upgrade 2.38.1 -> 2.39.1
To: alex.kanavin@gmail.com
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 07:36:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185123

I looked into it. Yes it's a race in a badly written shell script:
https://github.com/util-linux/util-linux/issues/2399

I'll see if the test can be easily skipped until upstream sorts it out.

Alex

On Mon, 31 Jul 2023 at 07:59, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
>
> On Sun, 30 Jul 2023 at 22:36, Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> > This is not 100% reproducible and so difficult to bisect. This is the
> > log:
> >
> > diff-{{{
> > --- /usr/lib/util-linux/ptest/tests/expected/lsfd/option-inet
> > +++ /usr/lib/util-linux/ptest/tests/output/lsfd/option-inet
> > @@ -5,10 +5,10 @@
> >      3     TCPv6 state=listen laddr=[::1]:34567
> >      4     TCPv6 state=established laddr=[::1]:23456 raddr=[::1]:34567
> >      5     TCPv6 state=established laddr=[::1]:34567 raddr=[::1]:23456
> > -    3       UDP state=close laddr=127.0.0.1:34567
> > -    4       UDP state=established laddr=127.0.0.1:23456 raddr=127.0.0.1:34567
> > -    3 UDPLITEv6 state=close laddr=[::1]:34567
> > -    4 UDPLITEv6 state=established laddr=[::1]:23456 raddr=[::1]:34567
> > +    3       UDP socket:[33864]
> > +    4       UDP socket:[33865]
> > +    3 UDPLITEv6 socket:[31413]
> > +    4 UDPLITEv6 socket:[31414]
> >  # --inet=4
> >      3  TCP state=listen laddr=127.0.0.1:34567
> >      4  TCP state=established laddr=127.0.0.1:23456 raddr=127.0.0.1:34567
> > }}}-diff
> >
> > FAIL:          lsfd: --inet option                                 (lsfd/option-inet)
> >
> >
> > All the occurrences are on the arm workers, ubuntu1804-arm-1 and
> > ubuntu2204-arm-1 for now.
>
> Thanks, I'll try to narrow it further. May be that it's the update
> itself, and not interaction with something else in the branch. Does
> look like a race condition as well.
>
> Alex
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185118): https://lists.openembedded.org/g/openembedded-core/message/185118
> Mute This Topic: https://lists.openembedded.org/mt/100391613/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

