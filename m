Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95008C63704
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:14 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.30796.1650899326238310241
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 08:08:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=oHy90Yuy;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.53,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f53.google.com with SMTP id l7so30264037ejn.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 08:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5eWxGT1nCH626n5mXU5lHnnEcPaBIJGSIzQOaNFSFbA=;
        b=oHy90Yuy5PQyy+e37ZEkiw2S6USfyXK2FA24RJio6oKeedZw/NdaEmzCXyaYFotlrg
         0N4BhmiPGn8mI4X+rbUze+fOTl0Epw3NFtSlBA8wkExzVNHXIpHzDk1vpxhWnoqhR6Ti
         GhRMKQtm7+bcUQzptWIer1OVrPzOcY5Jc75e1P4cGo3ihLf176GGBQ9p7dBpBNYGY0BF
         kTfOy0eJMmXpSENUeDOVVt75xdsra+gGQccvGOQWELMVGAwqr48AE9ivwZBUoLoKurJY
         jsQQiFN7V55aOaLHARW95/PbkVcorD9sbYPvduQXl9C9v/lFcik18r7mEex4SbYmBY/w
         4dmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5eWxGT1nCH626n5mXU5lHnnEcPaBIJGSIzQOaNFSFbA=;
        b=sq9861820P2u4XR92QSWZ+2IwJ1iaV/WmE5/wFnnEM5oH8LmDEPpIgPPPnUkXJp6iT
         ISyeZGrKtNgvDye0UdMm1g6UED0Xa1+7PdGrCnGRgfdFCJin0b1fArwFmS7UTb5kfTbG
         NSiIU1W9WaeZx2MmBcBDgDW2WgtTrZy8OYtinGYMVFFZZfrM/DRanv+NuHQtJw0aUG1s
         3Z9fbdv50hTuzDKSdf93Evm54MsLb0uCTPlOYPrOLhgUuD/aAtzPRHxAXHWeqZtb0nAO
         ImGAO915srfezxcIOks8TS6KrDc8w2VPAsW/ercV4PrSO0CwkRRBkfgzbXpExdlhCTvK
         TL9Q==
X-Gm-Message-State: AOAM530dJ47kYwLvAdG7J531X7xYDLBpbqwInngRUb4Zb6V/uMDt2hvp
	ZjFSZ+qLe27TSTyJm0RMtCOztipzU/kFn32B2hItwg==
X-Google-Smtp-Source: 
 ABdhPJyq4g/r8u9CqvBxN4xPaRdbOVxIslZ4yohggMxj0KQN/ruNuScJAlQ1g5XLOVjKwPEGuKUb7CNgB4xSFbE91uA=
X-Received: by 2002:a17:906:9c83:b0:6df:839a:a6d0 with SMTP id
 fj3-20020a1709069c8300b006df839aa6d0mr16601970ejc.419.1650899324462; Mon, 25
 Apr 2022 08:08:44 -0700 (PDT)
MIME-Version: 1.0
References: 
 <9d7e2301b84cc6cd46bdd831fdac6debfb3ee512.camel@linuxfoundation.org>
 <18138.1650867331399896737@lists.openembedded.org>
 <16E92852A324797A.4937@lists.openembedded.org>
In-Reply-To: <16E92852A324797A.4937@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Mon, 25 Apr 2022 05:08:31 -1000
Message-ID: 
 <CAOSpxdYNDNkJWRAW7Wfu36Eq=o52uib_fo2z2b1rD2VvXQ94=A@mail.gmail.com>
Subject: Re: [OE-core] [master][kirkstone] lua: fix CVE-2022-28805
To: steve@sakoman.com
Cc: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>,
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164827

On Mon, Apr 25, 2022 at 3:57 AM Steve Sakoman via
lists.openembedded.org <steve=sakoman.com@lists.openembedded.org>
wrote:
>
> On Sun, Apr 24, 2022 at 8:15 PM Ranjitsinh Rathod
> <ranjitsinhrathod1991@gmail.com> wrote:
> >
> > Hi Steve,
> >
> > Can you please cherry-pick this on the dunfell branch as well for this Lua CVE? or should I send a patch for this?
>
> Yes, of course!  Thanks for the reminder.

Heh, now I know why I "forgot" to take this patch in dunfell -- there
is no lua recipe in dunfell :-)

It was moved from meta-oe to oe-core post dunfell release. So, you
should probably submit this patch for the meta-openembedded dunfell
branch using the meta-openembedded mailing list!

Steve

Steve

