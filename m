Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C028EB64D8
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 16:17:03 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
 by mx.groups.io with SMTP id smtpd.web10.2830.1687364219571336837
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jun 2023 09:16:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=M5RzaiOT;
 spf=pass (domain: gmail.com, ip: 209.85.166.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-34207e81c98so29425795ab.2
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 09:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687364219; x=1689956219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7VNv7962RyxcK7mwOvYrEYaayIBAfRIlvcvzEAuCMs0=;
        b=M5RzaiOT3ymaDLpt/+d49JhQBVQnnuL1DYuMmiAso5/k96Et0Kl1kdh+nbU3GFJiz0
         VXQwWrd/9EekMYxK0ywZIRSvzos+BC01b/P1kXiJG2aHlh4LMBA+s7+yn7X505QDmV6d
         CTiaoUcOsKHCKQuKgR616RtGGtkIP+cgXG8heYxgj4aLQ5IWcaHnSHnRYpnwB6QGbtk6
         P2YUl8Mz5zOJt0k0gfpt9eST5qQvu2cWPObm5XJSvbrAO4mNQAmiFL3qezD5J5nZqjxR
         BaUoHBM4Fjc7vc86BdKa1fuPFCROO3g3wRL9g2jBsgdDioQGf0kF2La9nlumlxO9VWew
         /GYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687364219; x=1689956219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7VNv7962RyxcK7mwOvYrEYaayIBAfRIlvcvzEAuCMs0=;
        b=EWyWaeD7/BhrkCwQyMrtqaV+Gg1T2VHc2tdPESs4KuNahBnZ/F/reISeEw5iwDQCRz
         GTktZaNrc5V0dVieWQClYOfKRyq4lYWh105sjTWgrDByiiMPCfGIA2aSYNzph/bXS8RD
         B9JbIvabN8MwzNEjhK7rnX3J03aDaXlVjb/Ql3bu8qOxam+p8ebfy0alkMrmQpuQD6R8
         /+m/3VT95piFET/oYF79Qbn30QcRdMizbAlu3KiwwM2FngSYlnyzdY/Avli8/BSIaWgQ
         zgXyPjgkzUwcKMogwDY0NfSyC1DZ+dkizrk8Iw+RQGfP/Z0CgX+7SX6khAY+duSAdUGN
         wUCA==
X-Gm-Message-State: AC+VfDymTtdqvuR0X4KUg8q5M0ztduBJ/+nUAWVOO9jlC4K+/lkzjWM3
	31U41dEl/Hi8mWkSFUk578rNT5Zf/QhyLIeLfRk=
X-Google-Smtp-Source: ACHHUZ6+amMeGTZLBVIVHusVA0MSunFxiNk3yKcOXhmEjcf8vcm4zM0qIstZC7p7wXuD4kQGqRREDwulzFqv/nUleZk=
X-Received: by 2002:a92:c10e:0:b0:335:7be2:26ca with SMTP id
 p14-20020a92c10e000000b003357be226camr16013836ile.19.1687364218825; Wed, 21
 Jun 2023 09:16:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230530170949.12045-1-liu.ming50@gmail.com> <ac8e3e09-f847-b131-98c6-cad0cdbdf4ad@bootlin.com>
In-Reply-To: <ac8e3e09-f847-b131-98c6-cad0cdbdf4ad@bootlin.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 21 Jun 2023 12:17:11 -0400
Message-ID: <CADkTA4OsL0HeFhjeU1vRTADqir_OyqHTMQetn-Q8-6woimRUMQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel.bbclass: introduce KERNEL_LOCALVERSION
To: michael.opdenacker@bootlin.com
Cc: Ming Liu <liu.ming50@gmail.com>, francesco.dolcini@toradex.com, 
	max.krummenacher@toradex.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 16:17:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183187

On Wed, Jun 21, 2023 at 12:03=E2=80=AFPM Michael Opdenacker via
lists.openembedded.org
<michael.opdenacker=3Dbootlin.com@lists.openembedded.org> wrote:
>
> Greetings,
>
> On 30.05.23 at 19:09, Ming Liu wrote:
> > From: Ming Liu <liu.ming50@gmail.com>
> >
> > Just like UBOOT_LOCALVERSION, an end user can set KERNEL_LOCALVERSION
> > to append a string to the name of the local version of the kernel
> > image.
>
>
> How is this supposed to be used?
>
> I added the following to my conf/local.conf file:
> KERNEL_LOCALVERSION =3D "no-networking"
>
> But when I run "uname -a" on the qemux86-64 target, I get:
> Linux qemux86-64 6.1.33-yocto-standard #1 SMP PREEMPT_DYNAMIC Thu Jun 15
> 03:08:03 UTC 2023 x86_64 GNU/Linux
>
> So, my string is not there!

linux-yocto uses a different mechanism for setting this (and will
continue to use that existing mechanism).

So this would work in absence of a kernel recipe using CONFIG_LOCALVERSION.

Bruce

>
> I'm using the latest Poky master branch for testing.
> Thanks in advance
> Cheers
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#183186): https://lists.openembedded.org/g/openembedde=
d-core/message/183186
> Mute This Topic: https://lists.openembedded.org/mt/99224358/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

