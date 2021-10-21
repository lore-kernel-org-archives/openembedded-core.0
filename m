Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCEB1C433EF
	for <webhook@archiver.kernel.org>; Thu, 21 Oct 2021 14:20:19 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.10166.1634826018523794668
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Oct 2021 07:20:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=wHLgotRX;
 spf=pass (domain: burtonini.com, ip: 209.85.221.42,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f42.google.com with SMTP id e12so1396824wra.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Oct 2021 07:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1YFweUlf7j/Kjm7HOkJWv2EwmXSV2VgODhT8S6aCPuM=;
        b=wHLgotRXokK9j7+36X9HdUqkj2ShHT350OZ5/jRvBHcoC1Je5CnRAXsibauoDfYTIP
         V5jL4DfodE80teKRt903y/4WPUm4VZ4k33yVsUexEz8Senh2IQFbH2Ms07BRzLA/mBLs
         D5B10eSJyJVeKsTNki+sIh02llWPpXXLb79u/v2SXUdBYNMyPnRi3nhg+nUCe6PYhmyo
         z4j5wD2dRvNgoZ7A8ykZ3zdKMMaOKgqSvPTDvMsEiNDff9Yp8drayrdScisZVxjV24Ow
         FHSiI2x3H2AdoB9B/Z2RncU+EkbAF8TIp/r+Ku2JI+6+BcwBKLmjtaFp6fMRcAUgtDNd
         lGaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1YFweUlf7j/Kjm7HOkJWv2EwmXSV2VgODhT8S6aCPuM=;
        b=btiv9lYlnNvtWqtsEo0AlI07lE88rgiFm142rkZTHYHA0GMXGu4u3UESWuqWeUO1cf
         58Zzcb8weBbm98Ezod8HhYl/kFt9I5pPmikfsL+K9p7ztnz6xSVVItXtgGDZRte7ohy0
         B3v5MorendxnpKnvZ3kliPNSAiQ1+guAEtsGYnUaoN1VZza72BlFEOdohzKtTsFqgVA7
         0clXRW43QdVLUwplDgC0U92M3Q3mKnhk3XoZ2Id0Guemcs70ZfcKNS2BGri412EwNefL
         uFqbB9G/a8c60mQiRnzmhtnzCNZLevLYUlzbNuT8G6/clW2D6G/VtasOZBB96R5J/Uir
         6QaA==
X-Gm-Message-State: AOAM532JbJNqjAJTVEiQStGCZim7whKYjwsHnpno8teOs9lq61hqX3hP
	wuN6rgL4LOrg+nzEi5Do0a0saGuPx6ZtsbFH6Qzpbw==
X-Google-Smtp-Source: 
 ABdhPJy/LG1g42y5Or1fke0n2pOgBVhafnl4PxnBI1ZKoeQWoaL0Kr3VnvXdqpcy3poWkOOD9CMNGB01HB/J+/FOB4E=
X-Received: by 2002:adf:8b45:: with SMTP id v5mr7646318wra.211.1634826015566;
 Thu, 21 Oct 2021 07:20:15 -0700 (PDT)
MIME-Version: 1.0
References: <20211019192614.153903-1-ross.burton@arm.com>
 <20211019192614.153903-2-ross.burton@arm.com>
 <YXFvkNkKhWFhFzTz@piout.net>
In-Reply-To: <YXFvkNkKhWFhFzTz@piout.net>
From: Ross Burton <ross@burtonini.com>
Date: Thu, 21 Oct 2021 15:20:04 +0100
Message-ID: 
 <CAAnfSTtB9W0++zS4k3Sn_1Qg5EKQDm5Ct0jtcB3_9K7seddBtQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] strace: handle loaded test systems
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Oct 2021 14:20:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157282

Sigh.  I'll just remove the test entirely then.

Ross

On Thu, 21 Oct 2021 at 14:48, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Hi Ross,
>
> On 19/10/2021 20:26:13+0100, Ross Burton wrote:
> > If the host is loaded when running the tests there is a good chance
> > that strace-T.test will fail, as it does a sleep(1) and checks that
> > the nanosleep() call lasted for 0.9-1.1 seconds.
> >
> > Relax the test so that the test passes if the call takes less than two
> > seconds.
> >
> > [ YOCTO #14596 ]
> >
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> >  meta/recipes-devtools/strace/strace/ptest-sleep.patch | 7 +++++++
> >  meta/recipes-devtools/strace/strace_5.14.bb           | 1 +
> >  2 files changed, 8 insertions(+)
> >  create mode 100644 meta/recipes-devtools/strace/strace/ptest-sleep.patch
> >
> > diff --git a/meta/recipes-devtools/strace/strace/ptest-sleep.patch b/meta/recipes-devtools/strace/strace/ptest-sleep.patch
> > new file mode 100644
> > index 0000000000..5629dec319
> > --- /dev/null
> > +++ b/meta/recipes-devtools/strace/strace/ptest-sleep.patch
> > @@ -0,0 +1,7 @@
> > +diff --git a/tests/strace-T.expected b/tests/strace-T.expected
> > +index 1ea020465..f78d3e2c8 100644
> > +--- a/tests/strace-T.expected
> > ++++ b/tests/strace-T.expected
> > +@@ -1 +1 @@
> > +-nanosleep\(\{tv_sec=1, tv_nsec=0\}, NULL\) = 0 <(1\.[01]|0\.9)[[:digit:]]{5}>
> > ++nanosleep\(\{tv_sec=1, tv_nsec=0\}, NULL\) = 0 <(1\.|0\.9)[[:digit:]]{5}>
>
> Those two builds have the patch and reliably failed:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/2425/steps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/2428/steps/12/logs/stdio
>
> > diff --git a/meta/recipes-devtools/strace/strace_5.14.bb b/meta/recipes-devtools/strace/strace_5.14.bb
> > index a81bda04ba..9ae1367337 100644
> > --- a/meta/recipes-devtools/strace/strace_5.14.bb
> > +++ b/meta/recipes-devtools/strace/strace_5.14.bb
> > @@ -13,6 +13,7 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
> >             file://0001-caps-abbrev.awk-fix-gawk-s-path.patch \
> >             file://ptest-spacesave.patch \
> >             file://0001-strace-fix-reproducibilty-issues.patch \
> > +           file://ptest-sleep.patch \
> >             "
> >  SRC_URI[sha256sum] = "901bee6db5e17debad4530dd9ffb4dc9a96c4a656edbe1c3141b7cb307b11e73"
> >
> > --
> > 2.25.1
> >
>
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#157202): https://lists.openembedded.org/g/openembedded-core/message/157202
> > Mute This Topic: https://lists.openembedded.org/mt/86448553/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

