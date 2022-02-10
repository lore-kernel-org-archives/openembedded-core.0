Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94A6DC433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Feb 2022 16:30:55 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web09.12366.1644510654303964287
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Feb 2022 08:30:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=Y20wP7uG;
 spf=pass (domain: burtonini.com, ip: 209.85.160.180,
 mailfrom: ross@burtonini.com)
Received: by mail-qt1-f180.google.com with SMTP id g4so5184325qto.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Feb 2022 08:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ey2j1lWBNNL8FXlCEbMkO8TuYcnvj8mJHz6kS3OxJmA=;
        b=Y20wP7uGfj6L8kd1BG0aGPMg5SqT+YIt2yLJKsNq+qrONNXSADznWhlb0nk53sk9+A
         aZp2iwhi6eRzJfoqQcdl4Dxctt6vzqZTN3LrhzMlKRZbIfnQVB14H6IS3OqePuZP0nbO
         A4N5avS7AzlcpCiqEWU+SHPxebig1VVZoVjA0ngaBzkDz2hiHIQAoXoNLrsmJFkLrjVm
         n9yvaqX3BMeguVGH/fsOxnogbh+l0Il2d+ozp0UPV3unnbPfrGP9daUj9+1vfidvudIo
         1BkhZAbn0D6GFJ6DDXjwIaNZaaSBwKeJIYSa4syTX+EVMGpcL5sbk6pzkMGPFa7QPi/f
         GbPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ey2j1lWBNNL8FXlCEbMkO8TuYcnvj8mJHz6kS3OxJmA=;
        b=mkKCvc9Ya1HmIsYA6w6a1AILOXVuxKJr5v4WzGu+oBfDI13Ip8BX0IuGR9ACUAhUCQ
         65C+N9gqefj/8Pstva9VBZbsgR8NcekIvp1W3JbJBUIB5jnL0pOariJI9VPdR1WhQtgH
         LKaQ5ENUjeilBKZxrLCMfVsUnvLKujm8xxrgvY7O6Zkiz1poMBxzQIHFQw8uES2MQvic
         YgO59bK0X3viFGUEO5DcJdXkjzdvlFvfWtSG2wMTPfLN5+S9k7WP8gWjDgY/XQQmBNop
         EsW6AD6fxkDp4K+Roy7+1iXC0baIwxz+3ARNwTRCKoqua0jIp69tB5Wc2wxv9Kc3DSoD
         M0+g==
X-Gm-Message-State: AOAM531bh9HZ7ijkIN1FYnPN2au+PJMVb0pCykPDGo7PX5+kkrI0H4ig
	Rpxjfr9ZXCtu8sWv94BCqjqj385MT+3okPF7xVeOVQ==
X-Google-Smtp-Source: 
 ABdhPJwaVAIyc+1QgiMsuyZYrLAsrfqdwK68qiuluk3r90fSbKmL/eeHd/GI7AR2IOQeXwjlFbVU4uPzc44h1zwj0Bg=
X-Received: by 2002:ac8:59c6:: with SMTP id f6mr5358873qtf.343.1644510653422;
 Thu, 10 Feb 2022 08:30:53 -0800 (PST)
MIME-Version: 1.0
References: <20220125095922.70163-1-rybczynska@gmail.com>
 <CAAnfSTvkWktcmBBGWVXxuBRgeu6iBMoi7bt2iniNyuNRG3cPKA@mail.gmail.com>
 <CAApg2=Q30WinT=S6buUNmtZOj5dyPRLNmEfhU7fYvqPhDQf5vA@mail.gmail.com>
In-Reply-To: 
 <CAApg2=Q30WinT=S6buUNmtZOj5dyPRLNmEfhU7fYvqPhDQf5vA@mail.gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Thu, 10 Feb 2022 16:30:42 +0000
Message-ID: 
 <CAAnfSTt0GOdUuUYROGnZcea-W9w2hqdKTX6F7Ey=ZBaFuPSzBw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cve-check: add json format
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, ross.burton@arm.com,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Feb 2022 16:30:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161622

On Thu, 10 Feb 2022 at 16:28, Marta Rybczynska <rybczynska@gmail.com> wrote:
>> This isn't part of the standard Python library, you'll have to
>> replicate the logic.
>
> Do you mean copying part of the class or reimplementing it?

Reimplement, unless it's so complicated that we need to embed a copy.
As this is just dictionary merging, I suspect its easier to just
handcode it.

Ross

