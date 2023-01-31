Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C98F1C38142
	for <webhook@archiver.kernel.org>; Tue, 31 Jan 2023 15:14:34 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.14590.1675178066048198905
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Jan 2023 07:14:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZPMSQah1;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id bk15so42503626ejb.9
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Jan 2023 07:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zL62Oi8gi5o39MYVBpt6UmseluyOj8wS+13cIuRlzTE=;
        b=ZPMSQah15t0EynwW7RmbLjW2d5oDGZW5OiPnH7/iyrnfGc3Rg/RRBU0OaUBOzcB3tf
         SmGHl8j+ZYian4vX+wAE/VTBhlVn/Tw2laaJWCTQvH0N6+aBDUG+QXnSvb3NjuU1Vy+x
         K5/W6XOLtCDPkNEaFLnhqixP1V3EKE8hGsJ81GY7I37AbU4J6MLGmOSXUMBAiugvpYYk
         nI1OKZcyTJSEQmjCh4fDs02DbTjstbstEKt2xEHETAJF8/E2M7E9N8rLpM7pBrh0ippr
         xYcI+IiJhVZv+EYvLqvzo2HsbN43LvPpDu3BOzmqOEGNDjSXT9Qjw6TDZ1SjFzlsqPLB
         Ck6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zL62Oi8gi5o39MYVBpt6UmseluyOj8wS+13cIuRlzTE=;
        b=gMXdidnxlTe9y6aTmJd7KgLMi5MYDG+wJfdOEs3LLleUhDV+jRwOklUFHTalYiLEGO
         Cu/okNap9IRo2eKmHLffaDuvjNVATrQeBbbs/X13GTf3IwskitH1bnBiWIqXJSNX014X
         YkS3toIcWPfjTyYAcTR2luVzfWqZdCDQavSjJBWR2P5WbqjSAkzBSIVlx11Rtf6SeTQs
         tJnMB96IiCllVKMvGzsUOQA2xIu6qRLQH+SvWOVPIp+LuQAIA1hOY58/glW1Wg3FNVDD
         iS4nN1FUHMCjP7gxSrpLncEnue7gmx4XZ2Je1OTV2XiS0FQkx8SFzc2SLW0iP5n9Fq/d
         pKtg==
X-Gm-Message-State: AO0yUKU+ro1EkoiJ0CE93Q1TOqYbuzQMOJwRcRAjoqk3QIvSfWUYC0x0
	wbn9bag1xLOLRsEWXHclFytcCL2QyInvqJBnelk=
X-Google-Smtp-Source: AK7set8zJG1d/L2LLlg2j2zJS9B8SR9pukhEg6R9vHZuWTqdkE1+XSL2xb9YWmBWGLiZxD478TmoBejhv865KnK6AYk=
X-Received: by 2002:a17:906:768e:b0:88a:bec0:11df with SMTP id
 o14-20020a170906768e00b0088abec011dfmr1760348ejm.178.1675178064358; Tue, 31
 Jan 2023 07:14:24 -0800 (PST)
MIME-Version: 1.0
References: <aba59b60b8eb52c2963aaaafa0308fbbf80443db.camel@linuxfoundation.org>
In-Reply-To: <aba59b60b8eb52c2963aaaafa0308fbbf80443db.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 31 Jan 2023 16:14:12 +0100
Message-ID: <CANNYZj-o537KRKz8J9zn5EspbakeK-SxbCEPpKKad1xkCgRVCQ@mail.gmail.com>
Subject: Re: [OE-core] Current QA failure challenges (perf, QA http-server,
 asyncio prserv, bitbake runCommand timeout, unfsd test issue)
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>, 
	Bruce Ashfield <bruce.ashfield@gmail.com>, Joshua Watt <JPEWhacker@gmail.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Jan 2023 15:14:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176521

On Sun, 29 Jan 2023 at 16:41, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> http-server in dnf tests breaking
> =================================
>
> We've started seeing a lot of short packets with the http-server used
> by the dnf package manager tests. dnf retries and succeeds leaving a
> failure in the logs which parse_logs picks up.
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/6592/steps/14/logs/stdio
> Central error: 2023-01-29T11:43:32+0000 INFO Error during transfer: Curl error (18): Transferred a partial file for http://192.168.7.1:36183/cortexa15t2hf_neon/libc6-2.36-r0.cortexa15t2hf_neon.rpm [transfer closed with 15758 bytes remaining to read]
> https://autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/6592/steps/14/logs/stdio
> Central error: 2023-01-29T11:07:31+0000 INFO Error during transfer: Curl error (18): Transferred a partial file for http://192.168.7.3:42417/core2_32/busybox-1.35.0-r0.core2_32.rpm [transfer closed with 14627 bytes remaining to read]
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/6598/steps/13/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/59/builds/6532
>
> and a load more. Why the sudden increase in frequency, not sure. Could
> be 6.1 kernel related.


I ran this locally three times with master and it wouldn't reproduce.
Probably build host has something to do with it too?

Alex

