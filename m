Return-Path: <alexis.cellier@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC088C282C1
	for <webhook@archiver.kernel.org>; Fri, 28 Feb 2025 15:57:19 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.19237.1740758230373434307
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 28 Feb 2025 07:57:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=MHd3xXX1;
 spf=pass (domain: smile.fr, ip: 209.85.218.41, mailfrom: alexis.cellier@smile.fr)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-abf4802b242so36335866b.1
        for <Openembedded-core@lists.openembedded.org>; Fri, 28 Feb 2025 07:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1740758228; x=1741363028; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=31b8iASADDcXoTv1oPkruPMw+0zXZ9FtyqeFpOMPiaA=;
        b=MHd3xXX1qp9h38vHh5Fej2xG+WkSn0bxXBKOhm5mANgUvmUu/iRL+MJZ5P0miDcpE8
         eFAbIx1oO0GC5AKfRDx7sa3NtCv8FSJngOYn81opB8wypWED5epa0mNdPe7cd6dIBwyw
         sq413oxDvTJXF0PL+zLvkibVxM5YbCTGWSbg8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740758228; x=1741363028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=31b8iASADDcXoTv1oPkruPMw+0zXZ9FtyqeFpOMPiaA=;
        b=pCLBKkSK+DRFNTxq1q3/lxtemGoM68MiQ9q37k/5JhTh8nGvX8bM+rI+71M7I+MiTx
         rzzlKuN3nFoUAeoNhiR8ueS2eQuKugPmsAKEz0V41ld/MrL7ph7pUdgU35fWM8zRHWsx
         zS8sPoF55ivNcWjsX2sj5wNBj141D5Wr7LWqP6dLUif3ag071lihf9doD7E/5eJ9Pj3w
         RoQq3SUg5FTO5cKtTKFHAEXXV+A8/E48qbR4AqDb3CG+nLZrIthUTFg8q95v1k3HEP0Y
         lVKQHGZ7Eily8H9Jtm/pUvhD7DJscZmCZasLlBFMUlopGGHWGEVFisy+EtBeOKqOFbWD
         MCPA==
X-Forwarded-Encrypted: i=1; AJvYcCVZV+2wKLWQENie4284niAy7+r2I2y8MiYu7e5XDxRJskJwUlMCHZKzR3mW4LOIj18NK6I7X8iTUNA0KjSBRHbHdQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwmHB++Qk+V1NZMMJLUFIUb7lEDSEgZM7aWG72ffXk1Cx3en5p0
	iWw9PCZYesLX3Sy/4lXdjXBAV8TnUBcw/mmyU5+VZx3ixzdroVf9WRy2XK+vnXoouMFJFyi6B58
	k5utLhLGxKoQb9vaieTLXf7N3SUktvoniEbjo/g==
X-Gm-Gg: ASbGncuQ238Ei4pvXm203w0ut4wHgQxo8nno3oAWxvKJ1AQaanSX1AlwK4seuiXq6F1
	7TNqF6D2ovYp8sIybsSKUtC5Mxq/5SOhFFUq5Jkgy/GZP/XyJvOEIljXJhZK4CDB1GkDvFacrs8
	2LBCyGiUOXRCD5elxqzp3egyhm0o4=
X-Google-Smtp-Source: AGHT+IF5aGxRnaMJmBcwIWqtYqqjFf+s6+tJ45Y0uEhylSfVoVRF+7+XJJPjVWAD756shSZ7G2pyVIJ3FKefPSv0QzE=
X-Received: by 2002:a17:907:3f17:b0:aaf:ada2:181e with SMTP id
 a640c23a62f3a-abf260d54ddmr400523466b.26.1740758228425; Fri, 28 Feb 2025
 07:57:08 -0800 (PST)
MIME-Version: 1.0
References: <20250219103908.42513-1-uvv.mail@gmail.com> <71BF1160-E808-4212-B790-5462F95BFBA4@arm.com>
 <1825F47182B39BA0.23135@lists.openembedded.org> <ae46ffa2-b88d-4ec5-822a-08c00e2baa46@gmail.com>
 <CAO5Uq5SCkF9n9ngCvcNSkHLNSPQpKxwXv+o+OfLP+VkMeq3TQA@mail.gmail.com>
 <A5978220-EBAF-4C51-8587-76498A346624@arm.com> <2b44ca06-2d0c-4df9-9d3b-76ac5dcf41cc@gmail.com>
In-Reply-To: <2b44ca06-2d0c-4df9-9d3b-76ac5dcf41cc@gmail.com>
From: Alexis CELLIER <alexis.cellier@smile.fr>
Date: Fri, 28 Feb 2025 16:56:55 +0100
X-Gm-Features: AQ5f1Jol_IGGygQUB91WDYvdx57s1dnLW1SlVxICGToJJ1A_kBSURjmnVBbV_K0
Message-ID: <CAEs58j4Am9k-pA+sAcRkb0xF2_QGo7R+39L3_=cEPMp9gPQvZA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v6] systemd: Build the systemctl executable
To: uvv.mail@gmail.com
Cc: Ross Burton <Ross.Burton@arm.com>, 
	"Openembedded-core@lists.openembedded.org" <Openembedded-core@lists.openembedded.org>, 
	Alex Kiernan <alex.kiernan@gmail.com>, Mikko Rapeli <mikko.rapeli@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Feb 2025 15:57:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212069

On Wed, Feb 26, 2025 at 11:43=E2=80=AFAM Vyacheslav Yurkov via
lists.openembedded.org <uvv.mail=3Dgmail.com@lists.openembedded.org>
wrote:
>
> On 25.02.2025 15:48, Ross Burton wrote:
> > On 20 Feb 2025, at 15:33, Vyacheslav Yurkov <uvv.mail@gmail.com> wrote:
> >> Isn't is supposed to be created on first boot?
> >
> > Yes, ish, but our rootfs is read only at this point:
> >
> > [    7.639766] systemd[1]: System cannot boot: Missing /etc/machine-id =
and /etc is mounted read-only.
> > [    7.641135] systemd[1]: Booting up is supported only when:
> > [    7.641844] systemd[1]: 1) /etc/machine-id exists and is populated.
> > [    7.642588] systemd[1]: 2) /etc/machine-id exists and is empty.
> > [    7.643279] systemd[1]: 3) /etc/machine-id is missing and /etc is wr=
itable.
> >
> > On 20 Feb 2025, at 16:03, Alex Kiernan <alex.kiernan@gmail.com> wrote:
> >> I do know that it was a horrible thing to get right when I rewrote the
> >> shell script in python (which I'm very glad to see the back of):
> >>
> >>     # If we populate the systemd links we also create /etc/machine-id,=
 which
> >>     # allows systemd to boot with the filesystem read-only before gene=
rating
> >>     # a real value and then committing it back.
> >>     #
> >>     # For the stateless configuration, where /etc is generated at runt=
ime
> >>     # (for example on a tmpfs), this script shouldn't run at all and w=
e
> >>     # allow systemd to completely populate /etc.
> >>
> >> It may be that this behaviour was wrong in some cases, but at the same
> >> time, I remember spending a lot of time getting this right!
> > It certainly looks like it=E2=80=99s =E2=80=9Ctricky=E2=80=9D to get th=
e right semantics here because the range of potential use-cases is too grea=
t.
> >
> > I believe we should be writing /etc/machine-id at rootfs time if system=
d is being used.  Currently this is done in the systemctl class if it write=
s links, and then in the rootfs class if the rootfs is read-only.
> >
> > I think we should consolidate those into the rootfs class, and give the=
 user the choice of whether to treat the image as booted or not by writing =
either =E2=80=9C=E2=80=9D or =E2=80=9Cuninitialized=E2=80=9D to the file as=
 per https://www.freedesktop.org/software/systemd/man/latest/machine-id.htm=
l#First%20Boot%20Semantics.
> >
> > tl;dr: if it contains =E2=80=9Cuninitialized=E2=80=9D then this is the =
first boot, otherwise it=E2=80=99s not.  By always touching the file we bre=
ak the ability for anyone to use systemd-first-boot or ConditionFirstBoot i=
n their own units, which seems wrong.
> >
> > We=E2=80=99re about a week from feature freeze and getting this merged =
would be great, do you think you can finish this off Slava?
> >
> > Thanks,
> > Ross
>
> I definitely gonna try. But I might be missing something, because I
> thought it sums up as follows:
>
> RO rootfs -> empty machine-id
> RW rootfs -> no machine-id
>
> And it does work that way when I rebuild my image with or without RO root=
fs.

At the moment on master, as systemd-systemctl python script touch the
file, we can end up with an empty file independently of the
IMAGE_FEATURE read-only-rootfs. So we do break the ability of
firstboot in any case.
Also, if you boot with your rootfs in ro (KERNEL_ARGS, wic, ...)
without setting read-only-rootfs, with fstab that will remount your
rootfs in rw (so you do not have a read-only rootfs), not having the
/etc/machine-id file will make systemd fail (no not having
/etc/machine-id seems dangerous te me).

So why not put "uninitialized" in /etc/machine-id all the time
(probably in rootfs post commands, if the file does not exist yet, to
allow user to put a predefine one), it allows firstboot and prevent
the dangerous case of not having the file. The only strange case would
be when you do have a read-only filesystem, as you will always have a
first boot.
But if we do not want that strange behaviour by default, we can empty
/etc/machine-id in case of read-only-rootfs (in rootfs post commands),
or we let the decision to the user by letting him choose using the
systemd PACKAGECONFIG to enable/disable the firstboot support.

> Richard, could you please point me out which test actually failed? I
> looked at the logs, but most of them were "Skipped".
> Does the test explicitly remount rootfs as RO perhaps?
>
> The other option to have a real machine ID will probably mean to build
> machine id and leave it up to a user to decide whether they want to have
> such image. But I don't think it's wise to add this option now so it
> ends up in the next release.
>
> Slava

Regards,

--=20
Alexis Cellier
Smile ECS Developer

