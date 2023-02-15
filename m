Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFCB3C636D4
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 15:12:58 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.17466.1676473970273593650
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 07:12:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=C2yjtV+6;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id y19so22530410ljq.7
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 07:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JISBD6RkhL0xcAfEjAgkvqomZWHn6X3JcZBZmBoMXp0=;
        b=C2yjtV+64r9yTnGpP+aB+kvrhML68GDGQxfS1WVa226R4qeC867eEzvlxu/qMn2pL8
         g7ygN5RfFKARSkAnBnUzFveoAUnGVmUn61DZ+vIH81Zfp3adzzyC50C67Per1WagvJH8
         sA92DDe1t7vBfgbKeYdxL7SONRWeggvqoSi1z09VFfc+cxZsh6x8P7lqjG84IQvh43wT
         H0Rg66IeSvuP3fkNaLkywE7f3wGE1bboHij+iHNbOHnFlZ3xjpSxk22Bb3lodBU3APxn
         Q3fkkkj5BzaAevoNm6en9HyK75NN6BSkXGmRpDWDrFUoGCVGSXBoEQlqVPhmPUtvpZZj
         f6jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JISBD6RkhL0xcAfEjAgkvqomZWHn6X3JcZBZmBoMXp0=;
        b=OWPcUjoMo0vqKUs8BgAAJEVQvavnJUAOmh19yDTkItncVLThtKmYlbBMWrZ17DLZxw
         JWXFCUWViBhxmBezbYDyHIG5nMfw06yFCwO6QWxxtHNK0Lsy0auI5XrMLKNgq2pM/iNc
         dDZmhmOMXaPTF2C8PIOjnNdOszAwIeJ2+4/s4ekway9zslPNLq62b2uYSRTnawM49649
         D16LH8gE51mgL+Wnh1rFbBKqHWHOdrGoHyalgO6jwO2rXaaZKIykLOgooMcmdMJMaIJ8
         npEdY3LCKgysyEhz4IQAu6cXPgiPIhAAR15qq7vOmaU45qHoPMU/mLd1mi6tXSpBs1ID
         OHIQ==
X-Gm-Message-State: AO0yUKXkS5Ku09bDtq7v8iJBzIPPIof/D2yhqd+j8PAyTysXcn9Kk0Vi
	zpTmKVx1MLR6HofFfzdVNgt6HGT3NJbkf07rluM=
X-Google-Smtp-Source: AK7set8xzVC4FbEh11lM6FpHzDTbW8XWrcINFVGn7aC2OAx7s+ynGha4iJYsBH5qfVXCwkQ6Xk41FtnhIhGTZVGw7SE=
X-Received: by 2002:a2e:b539:0:b0:28e:54f:b187 with SMTP id
 z25-20020a2eb539000000b0028e054fb187mr677002ljm.5.1676473968057; Wed, 15 Feb
 2023 07:12:48 -0800 (PST)
MIME-Version: 1.0
References: <20230203135011.2061939-1-m.felsch@pengutronix.de>
 <12e370a3183d04572da1c5749d8e64dcf5091a0c.camel@linuxfoundation.org>
 <acf8b79c23675a2b4c7225e55e4ab369fbcf7f54.camel@pengutronix.de>
 <7f5ebf2315c969ce7c76d024ec373f45cc8eff3f.camel@linuxfoundation.org>
 <CAP9ODKokQpGL3ttukqRaq3-8m0ci7qp8mckbgudGJx1HOu-fPw@mail.gmail.com>
 <CANNYZj8_RkjMASpozi+oSu3XOHCW04n9YUC5UgHKy+2vm=cDrQ@mail.gmail.com>
 <CAP9ODKqjkCuhyVkfhskOSdF3g57=R9MO6Bcy2R5zBV9fVd6wZQ@mail.gmail.com>
 <CANNYZj_jLK-FXrGx+bF6fXrSsc-so6G_kpyZKNTpatqJKxQeRg@mail.gmail.com> <721e4d45d0d67a03be6ea4953351f5cb0c4ac36d.camel@pengutronix.de>
In-Reply-To: <721e4d45d0d67a03be6ea4953351f5cb0c4ac36d.camel@pengutronix.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 15 Feb 2023 16:12:36 +0100
Message-ID: <CANNYZj8UMuzxfXjXx4-pn+a1RXxmccqsq2uiXceqE8VM2NdTBg@mail.gmail.com>
Subject: Re: [yocto] [OE-core] [PATCH 1/2] barebox: add initial support
To: =?UTF-8?Q?Enrico_J=C3=B6rns?= <ejo@pengutronix.de>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Marco Felsch <m.felsch@pengutronix.de>, 
	openembedded-core@lists.openembedded.org, yocto@pengutronix.de, 
	barebox@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 15:12:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177203

There was a parallel conversation on the irc meanwhile; we've
concluded that Enrico will look into adding qemu based tests for
barebox into oe-selftest like we already have for EFI bootloaders, and
there will be a new patchset then.

Alex

On Wed, 15 Feb 2023 at 16:01, Enrico J=C3=B6rns <ejo@pengutronix.de> wrote:
>
> Am Mittwoch, dem 15.02.2023 um 15:11 +0100 schrieb Alexander Kanavin:
> > On Wed, 15 Feb 2023 at 14:53, Otavio Salvador
> > <otavio.salvador@ossystems.com.br> wrote:
> > > I think the Barebox inside OE-Core allows a bigger integration and
> > > reuse of existing tooling for signing and other classes currently wel=
l
> > > integrated with U-Boot. For me, a critical point for decision is if
> > > Pengutronix will commit to support it.
> >
> > You should be well aware there's a history of people contributing
> > stuff to core and even assigning themselves as maintainers, then
> > disappearing.
>
> If possible I would add my name with the above-mentioned Mailing list to =
the maintainers file.
> This ensures I am responsible but not the only one reading the mails.
>
> > And then it falls (largely) on me to keep things
> > (barely) going. What happens if ptx withdraws its commitment? Can I
> > then send a commit that removes barebox from core? Imagine the angry
> > lynch mob that will show up after my head.
>
> I am fully ok with removing barebox again if we fail maintaining it prope=
rly.
>
> Should I sign this somewhere? ;)
>
> > Adding things to core is a decision that cannot be easily reversed, so
> > I'd rather have barebox in meta-barebox for a while, with any needed
> > fixing to classes and infra in core.
>
> It has been in meta-ptx since 2015 and in meta-barebox since 2016. I woul=
d call that 'a while' :)
>
>
> Best regards, Enrico
>
> --
> Pengutronix e.K.                           | Enrico J=C3=B6rns           =
     |
> Embedded Linux Consulting & Support        | https://www.pengutronix.de/ =
|
> Steuerwalder Str. 21                       | Phone: +49-5121-206917-180  =
|
> 31137 Hildesheim, Germany                  | Fax:   +49-5121-206917-9    =
|
>

