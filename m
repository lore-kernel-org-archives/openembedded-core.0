Return-Path: <alexis.cellier@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A263C282C6
	for <webhook@archiver.kernel.org>; Fri, 28 Feb 2025 17:28:40 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web11.21997.1740763717759900418
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 28 Feb 2025 09:28:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Cn7pY4x/;
 spf=pass (domain: smile.fr, ip: 209.85.218.44, mailfrom: alexis.cellier@smile.fr)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so457053166b.3
        for <Openembedded-core@lists.openembedded.org>; Fri, 28 Feb 2025 09:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1740763716; x=1741368516; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Or2/JIJLvpZjdqwsnomt7vxmBasxa4bJe4tWnWOiWPo=;
        b=Cn7pY4x/gvCJpr1yCDZcnzG9y2iBGCLLg7u9j8xkXX61Oaa0T0kpXjytp3fetrEZd3
         byGG8o8b/GDD2UmcQW+YhIRTO7rY9KM00GMoy+LcShffPJMzXK/kl4ERhA5y1qkKOyO/
         D2O9QkPlyYlS4kWaulxCi15RreQ7X9Z7MCwRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740763716; x=1741368516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Or2/JIJLvpZjdqwsnomt7vxmBasxa4bJe4tWnWOiWPo=;
        b=aFeQd+2nKS9NE5MzueSH22XLC5ccpnoCIHwEA3nmAQu0mxwiNwmXqY5zYs+VVd5kKK
         bmtPffaBfom85HbH8XIobbC2KKGewhELiso121y4zJYY4z1wWGmQEg8FkxrCSs/Jmqri
         HK0wDXmHJ48Oisx3695Htg6IZes3FUGn2hV6mO1ArPCY7/iQ/OcRz4gmil+Z13hNAVpS
         QpcBxBrp44TxXJ/+qsHuDzGKnsisSy37axUYBKrsWxn9ckK+IkxwDhp8ciADud4eOVGP
         AZdw2SCaKts4U+me2MVznl4JyOabFLNbl2aHSViNnCP2Z6avFZ69LDweHkXldgAoBRd5
         ymSA==
X-Forwarded-Encrypted: i=1; AJvYcCVQInjy09icln+h6CSh3HOXOk+dnoEvzf5xk0B+hDEOGszoTI8PRWU70UhdLumm9NCGm8r9gPuktTLIMxl7T0+fTg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxAZ/NJLufOq/SqAoC05oSS8zr5LsMLadTCA9DcWSDTmRrCG4eY
	Rzc2jzFyozg8va7zXqvUINBx2ny/eUbnrJunoWY9rDv+8Q2DLNP+diAMKtaqzn50dOJDuuCD7Wi
	53RDxpffRf7Ma69bOu9f4QjluOFz1aH6Zfdr3ng==
X-Gm-Gg: ASbGnct+ihYIGuyLsaJ4kKdnAj2DSsjEPGSKZm4oKlcLOZ4/9ECZcl/U1GoBCnj6KcQ
	BeW81eZzCpFrnYhQvnp8WFXTd0uwfdOP67indYJhxMDziY+9uJ9UeAfdsBSp8+O2JXTQPExxZJm
	pkAxKNPB5M
X-Google-Smtp-Source: AGHT+IHmlM+2AoqmvEFVEONy48/xH4m7EBUzjhAW+CFXeucqXOectLeMhb37H821ZxoEd0+deSABfsLERCFXUlUtarU=
X-Received: by 2002:a17:907:60d4:b0:abc:a40:4195 with SMTP id
 a640c23a62f3a-abf25d92160mr400200866b.9.1740763715736; Fri, 28 Feb 2025
 09:28:35 -0800 (PST)
MIME-Version: 1.0
References: <20250219103908.42513-1-uvv.mail@gmail.com> <71BF1160-E808-4212-B790-5462F95BFBA4@arm.com>
 <1825F47182B39BA0.23135@lists.openembedded.org> <ae46ffa2-b88d-4ec5-822a-08c00e2baa46@gmail.com>
 <CAO5Uq5SCkF9n9ngCvcNSkHLNSPQpKxwXv+o+OfLP+VkMeq3TQA@mail.gmail.com>
 <A5978220-EBAF-4C51-8587-76498A346624@arm.com> <2b44ca06-2d0c-4df9-9d3b-76ac5dcf41cc@gmail.com>
 <CAEs58j4Am9k-pA+sAcRkb0xF2_QGo7R+39L3_=cEPMp9gPQvZA@mail.gmail.com> <CAO5Uq5RSbdizd0sSvXQCM_PxChPW8o8dALiEdswkE8=bfOa7Pw@mail.gmail.com>
In-Reply-To: <CAO5Uq5RSbdizd0sSvXQCM_PxChPW8o8dALiEdswkE8=bfOa7Pw@mail.gmail.com>
From: Alexis CELLIER <alexis.cellier@smile.fr>
Date: Fri, 28 Feb 2025 18:28:24 +0100
X-Gm-Features: AQ5f1JrA_pxgC3k-sPQDsJpckNZBGav0wQQHSTBXgs0tthXBiK-KeXtmJ5QTXEI
Message-ID: <CAEs58j5SjjjihUkEkLQtrPxW_4CmZXLtRKobWG3sEK7hmGuWVQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v6] systemd: Build the systemctl executable
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: uvv.mail@gmail.com, Ross Burton <Ross.Burton@arm.com>, 
	"Openembedded-core@lists.openembedded.org" <Openembedded-core@lists.openembedded.org>, 
	Mikko Rapeli <mikko.rapeli@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Feb 2025 17:28:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212073

On Fri, Feb 28, 2025 at 5:33=E2=80=AFPM Alex Kiernan <alex.kiernan@gmail.co=
m> wrote:
>
> On Fri, Feb 28, 2025 at 3:57=E2=80=AFPM Alexis CELLIER <alexis.cellier@sm=
ile.fr> wrote:
> >
> > On Wed, Feb 26, 2025 at 11:43=E2=80=AFAM Vyacheslav Yurkov via
> > lists.openembedded.org <uvv.mail=3Dgmail.com@lists.openembedded.org>
> > wrote:
> > >
> > > On 25.02.2025 15:48, Ross Burton wrote:
> > > > On 20 Feb 2025, at 15:33, Vyacheslav Yurkov <uvv.mail@gmail.com> wr=
ote:
> > > >> Isn't is supposed to be created on first boot?
> > > >
> > > > Yes, ish, but our rootfs is read only at this point:
> > > >
> > > > [    7.639766] systemd[1]: System cannot boot: Missing /etc/machine=
-id and /etc is mounted read-only.
> > > > [    7.641135] systemd[1]: Booting up is supported only when:
> > > > [    7.641844] systemd[1]: 1) /etc/machine-id exists and is populat=
ed.
> > > > [    7.642588] systemd[1]: 2) /etc/machine-id exists and is empty.
> > > > [    7.643279] systemd[1]: 3) /etc/machine-id is missing and /etc i=
s writable.
> > > >
> > > > On 20 Feb 2025, at 16:03, Alex Kiernan <alex.kiernan@gmail.com> wro=
te:
> > > >> I do know that it was a horrible thing to get right when I rewrote=
 the
> > > >> shell script in python (which I'm very glad to see the back of):
> > > >>
> > > >>     # If we populate the systemd links we also create /etc/machine=
-id, which
> > > >>     # allows systemd to boot with the filesystem read-only before =
generating
> > > >>     # a real value and then committing it back.
> > > >>     #
> > > >>     # For the stateless configuration, where /etc is generated at =
runtime
> > > >>     # (for example on a tmpfs), this script shouldn't run at all a=
nd we
> > > >>     # allow systemd to completely populate /etc.
> > > >>
> > > >> It may be that this behaviour was wrong in some cases, but at the =
same
> > > >> time, I remember spending a lot of time getting this right!
> > > > It certainly looks like it=E2=80=99s =E2=80=9Ctricky=E2=80=9D to ge=
t the right semantics here because the range of potential use-cases is too =
great.
> > > >
> > > > I believe we should be writing /etc/machine-id at rootfs time if sy=
stemd is being used.  Currently this is done in the systemctl class if it w=
rites links, and then in the rootfs class if the rootfs is read-only.
> > > >
> > > > I think we should consolidate those into the rootfs class, and give=
 the user the choice of whether to treat the image as booted or not by writ=
ing either =E2=80=9C=E2=80=9D or =E2=80=9Cuninitialized=E2=80=9D to the fil=
e as per https://www.freedesktop.org/software/systemd/man/latest/machine-id=
.html#First%20Boot%20Semantics.
> > > >
> > > > tl;dr: if it contains =E2=80=9Cuninitialized=E2=80=9D then this is =
the first boot, otherwise it=E2=80=99s not.  By always touching the file we=
 break the ability for anyone to use systemd-first-boot or ConditionFirstBo=
ot in their own units, which seems wrong.
> > > >
> > > > We=E2=80=99re about a week from feature freeze and getting this mer=
ged would be great, do you think you can finish this off Slava?
> > > >
> > > > Thanks,
> > > > Ross
> > >
> > > I definitely gonna try. But I might be missing something, because I
> > > thought it sums up as follows:
> > >
> > > RO rootfs -> empty machine-id
> > > RW rootfs -> no machine-id
> > >
> > > And it does work that way when I rebuild my image with or without RO =
rootfs.
> >
> > At the moment on master, as systemd-systemctl python script touch the
> > file, we can end up with an empty file independently of the
> > IMAGE_FEATURE read-only-rootfs. So we do break the ability of
> > firstboot in any case.
> > Also, if you boot with your rootfs in ro (KERNEL_ARGS, wic, ...)
> > without setting read-only-rootfs, with fstab that will remount your
> > rootfs in rw (so you do not have a read-only rootfs), not having the
> > /etc/machine-id file will make systemd fail (no not having
> > /etc/machine-id seems dangerous te me).
> >
> > So why not put "uninitialized" in /etc/machine-id all the time
> > (probably in rootfs post commands, if the file does not exist yet, to
> > allow user to put a predefine one), it allows firstboot and prevent
> > the dangerous case of not having the file. The only strange case would
> > be when you do have a read-only filesystem, as you will always have a
> > first boot.
> > But if we do not want that strange behaviour by default, we can empty
> > /etc/machine-id in case of read-only-rootfs (in rootfs post commands),
> > or we let the decision to the user by letting him choose using the
> > systemd PACKAGECONFIG to enable/disable the firstboot support.
> >
>
> firstboot usage, really doesn't feel like a piece of package
> configuration to me, possibly distro config, but having a
> (potentially) interactive boot seems like an outlier in the OE world
> (though I'm not saying it shouldn't be supported).

It is already a PACKAGECONFIG of systemd, not enabled by default (not
sure it was clear in my previous message).

> Today we call the systemctl script as part of rootfs construction
> which may touch /etc/machine-id, removing it from there and having it
> obviously in one place as part of rootfs construction seems like it
> ought to be an improvement.

I do agree.

I do have a question, it is possible to not end up with the
/etc/machine-id file, i.e. not having the python script called (on
master)?
If it is not possible, it means there is now way to have the first
boot mechanism working (without tweaks), and so there is no risk to
create an empty file in all cases (if the file does not exist, to
avoid breaking builds that were embedding it in some way) no? And then
we could move the discussion about the first boot support (empty or
"uninitalized") in another thread as it is not the point of this patch
(and avoid blocking it)?
But if it is possible, no idea. Break the support but add
documentation, a new image feature, or a distro feature (so systemd
PACKAGECONFIG could adapt its default value)?

> > > Richard, could you please point me out which test actually failed? I
> > > looked at the logs, but most of them were "Skipped".
> > > Does the test explicitly remount rootfs as RO perhaps?
> > >
> > > The other option to have a real machine ID will probably mean to buil=
d
> > > machine id and leave it up to a user to decide whether they want to h=
ave
> > > such image. But I don't think it's wise to add this option now so it
> > > ends up in the next release.
> > >
> > > Slava
> >
> > Regards,
> >
> > --
> > Alexis Cellier
> > Smile ECS Developer
>
>
>
> --
> Alex Kiernan

Regards,

--=20
Alexis Cellier
Smile ECS Developer

