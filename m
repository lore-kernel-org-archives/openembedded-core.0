Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1005DC43334
	for <webhook@archiver.kernel.org>; Tue,  5 Jul 2022 09:22:47 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.82300.1657012961376892671
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 02:22:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bUIb3PL6;
 spf=pass (domain: gmail.com, ip: 209.85.208.175,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id n15so13733350ljg.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jul 2022 02:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qoI3qWlGUHGApqvExBDY0fMZz/aYRJVJn3CHO51r2CU=;
        b=bUIb3PL6bYyIRMyEv2EiFI0b15OGAZ773bLsYQci9/VRvEJMLau22KxliNy6CwmFY/
         +I2BaMByYYzdS7uL5wFISxHJ2iT1nIVFQM72bHtFtUxhajS1PpPmOOzZdj3z5oPuvAuH
         39CDAR5qbTaDbUVVTKQZZccdtuslP4LSfeilA1UfmOuo+AKyWTAuEGczi8DK7ehc02HZ
         taCle/AlXdl9PiLmdvH4gmrqwvmtbQFKGmQXyWPa8De2Mkc/aMq9Jt4ooKEqboEdew3a
         jXNSrN9bRvLct+C3qB3rwlZlo/NMfM1abxwFb4IiijKDZdfLZ84uUCJzphMTYgzT+YVb
         A/og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qoI3qWlGUHGApqvExBDY0fMZz/aYRJVJn3CHO51r2CU=;
        b=W2zx6190/oWmdpHaOkDIULbGdOZk44eC3OIl6eTM+uAVk62/19mFpxqokRfWoOptst
         hELj6csRFlwXOrMBggeyaVzHKU6whEeqgDJJX3vjU2MalVW4EOvZpGi4tsk1sSR44KBt
         KVBQ87S7/c4gB2bkP43Jfy/g7r6sQfX+8qMBXqAzf9Ut1LnRWWwras4GXPVRWU1dfyA0
         L+qRLktJBSzEBJ/eJX3UWwYM3medgJ9lGgm72kVOpzW4e+hy+s7SYqz16SygkgftUHwk
         nZbFawnuDKvblWK2fsXsIz6uUGldquS5sR7GRAVZvJJ6ZhL4T01RvZlRR1JXUw05iEr0
         8mrQ==
X-Gm-Message-State: AJIora8oYgHEjZblZNBi8bFYhUYztU0xBZyWb1WS7xrT01SZJn2d2o6K
	y8X3nPNNA6ATFlivAPIIWap0prAcXdvobnjCxPw=
X-Google-Smtp-Source: 
 AGRyM1uj9EZunYxs1ARCfMxVrzsWpXjVLD3klv0ph9krbVH8dfy+E2gLs1VxSxkBJlf/UE86eFBuvJMSXeAJa8zrkLc=
X-Received: by 2002:a2e:8013:0:b0:25b:ef62:831d with SMTP id
 j19-20020a2e8013000000b0025bef62831dmr17635935ljg.68.1657012959535; Tue, 05
 Jul 2022 02:22:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220701192449.1358325-1-alex@linutronix.de>
 <329d53233a9966693bc19f821f7f3996a187eced.camel@linuxfoundation.org>
 <CAJ86T=XPx1sVqmaJd+C2q81PV-jgjDK9x=cjrEzqRnGjqEghLw@mail.gmail.com>
 <CANNYZj-+2QvuXUT9Vshdq5T6-uLEV5p92QeAqw+kbajPm+UKyQ@mail.gmail.com>
 <481775663c6c797dde9596268fde594bc567a12d.camel@linuxfoundation.org>
In-Reply-To: 
 <481775663c6c797dde9596268fde594bc567a12d.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 5 Jul 2022 11:22:28 +0200
Message-ID: 
 <CANNYZj9=bj7uoGfk=buWpMjXR9N-o6ckewEDbNzXQoMMyaHw8w@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH] bitbake-layers: add layer
 repositories/revisions save and restore tooling (aka 'layer configuration')
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Andre McCurdy <armccurdy@gmail.com>,
 Adrian Freihofer <adrian.freihofer@gmail.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Jul 2022 09:22:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167646

On Tue, 5 Jul 2022 at 10:51, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:

> As for kconfig, I don't think we need another config file format. I
> have proven that json can encapsulate all the complexities of the
> configurations of the autobuilder and kas has also proven the same
> think with yaml. Yes, the menus are nice but at some point users will
> need to see our config files so I don't think its a much of a win as
> people think, unless the entire project used it which it doesn't and is
> unlikely to.

What is more important to me is that each machine, distro and
templateconf comes with a *description* right next to the actual .conf
file. They all must have conf-notes.txt, and that should be a
requirement for YP compatibility actually. Then if anyone wants to
write a tool that discovers the available items and presents a UI for
choosing them, the documentation for each of the item is already in
place and not maintained separately (which inevitably results in
things getting out of sync).

Alex

