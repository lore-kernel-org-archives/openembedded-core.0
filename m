Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A45CDC6379F
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 18:22:51 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.18768.1677176570466975417
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Feb 2023 10:22:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CFpnUDwN;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id a10so11793465ljq.1
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 10:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7O4YoZtr9IxHSAPAb0PMaw/IjbGcQpjmBoGq6x4RZR8=;
        b=CFpnUDwN5jbpU4XtGbe1g/u28Io3LfHNmU1CmHq+cxyWCfhYLa3O3J0n26GSAi51PG
         Wlgkw9uO4Jcr6cq65bTsqwpARbdlWwHEYKtx3WnnbEvvlxYrmd108vUrdPBI5HKhQnAc
         sV7tjoflVZWkIim3k/pi5+5ZcYp4y4YE5TYq0lXXP25c4BBGyR72fc4yKRcmNXT1ukoy
         NaWwuUNPlAzQmtaeoS7FsYpK4KPpcajuT415DaGvjv0Mm8arnwcOcmbrZ0tlygkFZjMR
         6CreMEv7bpDWqYLeAfMexoecaaXLzNi/JQVjlZzz/A4IwF/Tga9ZhkZbgepKbAME8Ja1
         GcqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7O4YoZtr9IxHSAPAb0PMaw/IjbGcQpjmBoGq6x4RZR8=;
        b=JMx95Ip5TWTzLOTe9G1Q/yHUewH+l6sTFUUMYV/w3tKTYvBEa9E5dBAg5tGmebzMbX
         BNK+xyRFCBi8Ri9//qCPGpX/TrBczfn8w7AsVoy6bI6qkMpIvW1CBSnuzuqe6J7sL3FU
         +V0wywKPcPD3IvDUWtSEBr6JNBewsQzjOSykXgJUqu7SFDfaM/0aXj8q1EGRyr2VzFVA
         qUtzAZb0J3VgQcQL1tRDNcr23FiX066BWMkXBatCucSYQ6kMeqchT8FQoewF4skkVjPe
         1qF2XVChFGANzfHg9KEJecYDHJpESNF0lDS5+F8RxdQG2MfPXS3I7QQVcMn34a1e3fKt
         25/g==
X-Gm-Message-State: AO0yUKW8xZSMSWG2ITCB+Bj+ojiqW6N9aikzBvdWFAT3AQzZonuUgirQ
	opbe+YWTtPfmJL54Bo2+qC1okoZBRe+aHHVdcIU=
X-Google-Smtp-Source: AK7set+UCcl4Ca2Z43/jrPeoFYt3W3SW1cDZtZ1Y//DAcJJ3N9wKlkHwMqhSow97YYQODeU+A0JFXuU0bYCLEx6NxmI=
X-Received: by 2002:a2e:a4ba:0:b0:295:9a96:a5fd with SMTP id
 g26-20020a2ea4ba000000b002959a96a5fdmr1691264ljm.5.1677176568482; Thu, 23 Feb
 2023 10:22:48 -0800 (PST)
MIME-Version: 1.0
References: <66b9a05e-00fe-a3f7-82e1-2cb9459d87f8@bootlin.com> <CAMKF1srkaS9byR-TmRKxbr3Nka4BJ5VEhwkU6nSmrAD53VLzhA@mail.gmail.com>
In-Reply-To: <CAMKF1srkaS9byR-TmRKxbr3Nka4BJ5VEhwkU6nSmrAD53VLzhA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 23 Feb 2023 19:22:36 +0100
Message-ID: <CANNYZj9v5gskXjCPRvvaixnyZeV4A1mSdACUkME8etUc28BBHg@mail.gmail.com>
Subject: Re: [docs] [OE-core] Difference between INIT_MANAGER="none" and INIT_MANAGER="sysvinit"?
To: Khem Raj <raj.khem@gmail.com>
Cc: michael.opdenacker@bootlin.com, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 18:22:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177619

none is a confusing name though. Should it be dropped and nodistro
tweaked to use sysvinit?

Alex

On Thu, 23 Feb 2023 at 18:39, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Thu, Feb 23, 2023 at 9:09 AM Michael Opdenacker via
> lists.openembedded.org
> <michael.opdenacker=bootlin.com@lists.openembedded.org> wrote:
> >
> > Greetings
> >
> > I'm trying to document the possible values of INIT_MANAGER.
> >
> > I'm using the master branch of Poky, and whether I'm using
> > INIT_MANAGER="none" or INIT_MANAGER="sysvinit" in conf/local.conf, I'm
> > getting the exact same "core-image-minimal" image (it's not even rebuilt).
> >
> > Anyway, ./meta/conf/distro/include/init-manager-sysvinit.inc and
> > ./meta/conf/distro/include/init-manager-none.inc look very similar and
> > even seem to be equivalent as I'm getting the same image anyway.
> >
> > So, what's the use of INIT_MANAGER = "none"?
> >
>
> It basically sets a nodistro default which is sysvinit like atm.
>
> > Thanks in advance
> > Cheers
> > Michael.
> >
> > --
> > Michael Opdenacker, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
> >
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#3731): https://lists.yoctoproject.org/g/docs/message/3731
> Mute This Topic: https://lists.yoctoproject.org/mt/97188247/1686489
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

