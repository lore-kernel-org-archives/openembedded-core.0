Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 532C8C43334
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 14:35:39 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.7163.1654698933198134179
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:35:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112
 header.b=XwiOt6ss;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.218.42,
 mailfrom: brgl@bgdev.pl)
Received: by mail-ej1-f42.google.com with SMTP id u12so41890679eja.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 07:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z3jjqZXK7c/1AJSZaXwWkz6SzN46gAoMLvG1cwki15U=;
        b=XwiOt6ssF8OiSji6lLSTiKnJpxjtsZiSyyFEGMNwyRKZzgXS/+Vi00fvCU5xaAxUlx
         145sHsJpfvFwpMOYnKMM15N9lGAdSKBdU1NFyL1Ve0JGcSsdfsY2wBoescb5MlpsXvS1
         dTORORV4H2gJSBPdIwQYxW5ab43rdGC5XAYQvQW6LrjuGXOKcHtfH7DekKtaoWesgS5Z
         zbZkLGAsmAOVZguN3SOEaRPYF2Ut9MAVHQH/PvPmoPspRsC595MY9Un92k2bwbal4aMz
         jAqzbX/GeH/X/5l7njC8eSvsMKo6p733vJRN37DBLjq6/TRqlidSX4gdr/fK81DYUcuH
         geWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z3jjqZXK7c/1AJSZaXwWkz6SzN46gAoMLvG1cwki15U=;
        b=Rq55tkEqvPxgTIRT3MBDH6D72+hUoMSdwbiYgDeFyleHwTa+RUCZDTtVH6wo1ySuKU
         iWfJPBRu/IjJ4aN10BFAx5LCFcCleOuXhweLPnMZir7jWaRuIl5hWDCP1CLf8G6nMlFl
         5TB1PMbEo7VzTENBbAq8i09YjiNa7VNVDTQ/c3VGx4UXqEcHGucUT6+ThK5BKjaJ0tFI
         MooISSXwNvDcyAVUVyP/erQa96JeImGeybsGWNIKcpnwdCUL/X3F3y/SF8Qz2HQ4BSrY
         JAYgvXWuVMPHyE4kHlpDNyBW5Xv2Aa2y6fAb+jlFRxjHqRJA4O2Y+85V3Qt8OJwPqRpc
         MqOQ==
X-Gm-Message-State: AOAM533isDb5Kj3RHq2+CQ8dbnbOW7ApS2TC2rofeZiYz0NZCNL1oQb3
	3afPUngredZoUzBaLVAjbWaMVnhZ9PeC7HclVer3wQ==
X-Google-Smtp-Source: 
 ABdhPJzuda21YA/Q2mafR5cd2gstVyTnpdrviuaVDWd5G4DinXpDk86VzCcNMiV1lP/M4zC+1ziSNFRRPqOzziSoDG4=
X-Received: by 2002:a17:907:92c:b0:710:786a:470f with SMTP id
 au12-20020a170907092c00b00710786a470fmr22721077ejc.736.1654698931100; Wed, 08
 Jun 2022 07:35:31 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAMRc=Meo0zQbMsG_feDcPXwruGkphWEePspjUMOMBD3t+8tiGQ@mail.gmail.com>
 <581f3396-dbef-0360-dd61-fb1ba387d30c@windriver.com>
In-Reply-To: <581f3396-dbef-0360-dd61-fb1ba387d30c@windriver.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 8 Jun 2022 16:35:20 +0200
Message-ID: 
 <CAMRc=MewokSYOKHBcGtW88snonNUh-OSu3HZdcYvDYZyf1bUwQ@mail.gmail.com>
Subject: Re: [OE-core] Rust recipe fails to build project on kirkstone but
 works on dunfell
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	"Gowda, Naveen" <naveen.gowda@windriver.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jun 2022 14:35:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166710

On Wed, Jun 8, 2022 at 3:21 AM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>

[snip]

>
> Naveen or I will take a look at some point and at least let you know if
> we can reproduce the error.
> Can you try using the master branch to use rust_1.60 ?
> I doubt it will help but it might be easy to check.
>

Actually, the reason seems to be with outdated packages. I updated my
recipe to a newer version and hit a bunch of different issues but they
seem to be in cargo and not in oe-core (for reference:
https://github.com/rust-lang/cargo/pull/10730).

Bart

