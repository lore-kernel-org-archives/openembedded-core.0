Return-Path: <armccurdy@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0899CC433EF
	for <webhook@archiver.kernel.org>; Tue, 30 Nov 2021 21:46:02 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.83058.1638308760501141446
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Nov 2021 13:46:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kNA8lGiG;
 spf=pass (domain: gmail.com, ip: 209.85.167.43,
 mailfrom: armccurdy@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id r26so57348391lfn.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Nov 2021 13:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jACHsqN9OxhnmBINsj4zVPbG4BTt13PLItT80n2BOdw=;
        b=kNA8lGiGFksD2XQ6Yn1z1RLBGMU+FNfZ7iSHpsy2raeNEDwJaFtqr5FmlT4zxoZ2Ti
         y77UbvbbMq4o09MLuh7yEspDi+MC4jqpciXuNPN0L5ftoo0X2gpaivOrQLfl1IVYMsO9
         ZLe7ubOrfORGVP0mSw7n77Kj/Jhpy7O/C2hQxWN16Qr2rAuWVv5L4IhRC8M50IvoGQjn
         aiaSrNuaQujBWs9dhDjjJ2wMYMEGPvseBoBb1t1n53fDEztfLSfhsJiV+xCxBmOxcCID
         3RIjUJGXmpF6HFQKLkQzsfu8WAIY56pfXGgvzYc9UZM4KgCkh5m0NfzDhPBoMNtqaR4s
         QIPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jACHsqN9OxhnmBINsj4zVPbG4BTt13PLItT80n2BOdw=;
        b=BYn145Dx8czLaUMTvOFO4BOD4evJRteSR9XJsxjxTIwqk4tRAPr5f4ZBMYrVOJkYkJ
         9nM4DXuJa0/SibqpjMYT+NO/+yJUosFtquYlAYwwTMRKDbNWWnBJ6BiKBNCTDy7Hzhvv
         yds4fviU58+Hh09wtPBytGeurcJR4t/SzbN5WhFmZmpwWWJ4FISqE8mgpiJieGwldQ3X
         /jclLEODejl/+8aRfcsixlGWHsd/D22KPWFpoAExtksLM1TyHDYMdEaKHgbDx0/jMrZ0
         V7OOKZiWAGzVgETBDt2sjDr/xgNfNEURZsjYa+mcd5oYwfF98XkqnuiDNmjXU0+Z4U9d
         j52Q==
X-Gm-Message-State: AOAM531YGDJtGT8JoKXP+Rq19tMH+HKGgzM4wX0OKfj0AN0o3lPO84Gp
	ivChmhQhtuZhF4SLyj0TBlFBtDkw6tAq+QOCHow=
X-Google-Smtp-Source: 
 ABdhPJzp43x02nbs6r5UmvVOdc3uCQNjpkYyjoZqclgJn6bkZI2onSYPcfuO1k8y5dHZzzspJj3uy45RAyd3G0mWHrI=
X-Received: by 2002:a05:6512:3182:: with SMTP id
 i2mr1660216lfe.241.1638308758569;
 Tue, 30 Nov 2021 13:45:58 -0800 (PST)
MIME-Version: 1.0
References: <20211130165313.3816904-1-ross.burton@arm.com>
 <20211130165313.3816904-2-ross.burton@arm.com>
 <CAJ86T=V_9Y=xCbswnjV5ZkfihQ-KOWk13xYW7FNQaj7ahBUcjw@mail.gmail.com>
 <CAAnfSTsvgBF1EUZ3t+FNAwGB9j0p8y41c2Mgfv2DMHoMVJWnfg@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTsvgBF1EUZ3t+FNAwGB9j0p8y41c2Mgfv2DMHoMVJWnfg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 30 Nov 2021 13:45:41 -0800
Message-ID: 
 <CAJ86T=WH+HJPV7MMJFcuNyx+VmgUvPRD=wfHCTcKGyyJ3GTANw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 2/2] vim: set PACKAGECONFIG idiomatically
To: Ross Burton <ross@burtonini.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Nov 2021 21:46:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158997

On Tue, Nov 30, 2021 at 1:20 PM Ross Burton <ross@burtonini.com> wrote:
>
> On Tue, 30 Nov 2021 at 19:32, Andre McCurdy <armccurdy@gmail.com> wrote:
> > This isn't equivalent - it will cause a change in behaviour for anyone
> > using PACKAGECONFIG += "foo" from a .bbappend.
>
> Correct, but this is likely the only recipe in the greater ecosystem
> which has this behaviour, so I'm not that bothered to be honest. :)

The only recipe? There are many recipes which set a default
PACKAGECONFIG with ?= and many which set it with ??=. Your change is
effectively switching the vim recipe from one approach to the other.
The fact that adding PACKAGECONFIG options from a .bbappend with +=
sometimes works OK and sometimes not is a source of confusion for new
users.

You are right that no one seems to care though...

