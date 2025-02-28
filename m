Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BBACC282C5
	for <webhook@archiver.kernel.org>; Fri, 28 Feb 2025 21:09:46 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.4949.1740776982471113996
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 28 Feb 2025 13:09:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KgmxNzRH;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5494bc4d741so1738182e87.2
        for <Openembedded-core@lists.openembedded.org>; Fri, 28 Feb 2025 13:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740776980; x=1741381780; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wmixAaZOsVM/A5z17935IUyuvzBSwUc+wQQKc8Lrdj0=;
        b=KgmxNzRHfGTUN/TyZtGaA8lfR69T/rMhEvv+tol+jyskNrGCRlpNTzLcroX722DfKk
         Jl7HFmREHHy/jEJufI9FZTDWfluepN8EytLFM8oyYAUnmQ0XhWmnlxEZiEag/atwCPKD
         XwbcbhaNANiYpU/yEIG0jp/GaOqZv0oxNqTkfX9xmp50Q546XHe4etBSD2FMgWbp9ZdK
         othVVsY9C00n+CtkKmBzV8PsN4FV4kXdeSPBAAnPFwXdIZoI+C34RAL8nc8yoJ2h201s
         xUFFzXvlAtoI0QSWbRurChSkL5//lLNKXZoUGtxvkYtwFtPWoRNwdB0kDmiL0b9Ej/sB
         ThQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740776980; x=1741381780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wmixAaZOsVM/A5z17935IUyuvzBSwUc+wQQKc8Lrdj0=;
        b=rwJUyNi2CuUho2x1SMtVNzm41YqTWQLkGZDZaxRox+5B5FruAEsbbRapce9uUdFopm
         3vXQFQJn74drpAglCXAbE6CRUpkSLkCQI/IgaN39cyD+/Fi6QFuqyQd1CzczJERDQ77G
         U7szV6rq0f2Ph5n1Tx17Kh+VDisF1Rl/XTJvbSygvYCQrUufTkMeL0cd4tIydyRrmBaE
         ebg3JmLEakS8RelP+Sj2LDHU9bMkiNUk/5X7MWyRiutEXNhYeUJ9k16Rtne2aXVLNZpq
         JxoLf91o07fA2DqNRfOxtkAahJEzg6kUprJiXnHsxn6TIwUiZ0oBYmvChyID37+37wKT
         ohPw==
X-Forwarded-Encrypted: i=1; AJvYcCU79rl6LUZ61xAACCmNF/zKMzG5rKhGigIo6Z+EpBTMa2TH6Juf3thtC1GUQIbjIEglKNHisCMr1r7TuVAUkGK6hA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw0UXw5y3TndzYuMIqq3Tw9H5HBj6e6mhuYo/71RCnM9TYybc5a
	CjnERZqz/qzIV+2QCxUpxDCPaoUSoNJcN9oqDXlYAZsytHciDD6ehO0ssmv3RCSr41twemNaM17
	FIjQq7cYwILtNLuNZ1PmmZA8TCLY=
X-Gm-Gg: ASbGncvAKgz7yCHJBcnhm7rWnvPHajwEFE4SMs6rLTeIWtlb0c82j7x4SRJwCBhC8uF
	TAY7SCq7IH2UOAzosVOk4MYAE9ZPt64qPOzgqvYqThWz7dllpbtt3ZTLUR/1+U5bUpKzpRVWKzn
	2HxRMsCg==
X-Google-Smtp-Source: AGHT+IH6M/7emSnSvh656cFN433GhMFt7zExG0hDWLcZm5whvnQl5FTEFo2JKcQHiUV149GYb8FtevO9GLY2ZTt5i4k=
X-Received: by 2002:a05:6512:398e:b0:545:bda:f10 with SMTP id
 2adb3069b0e04-5494c120a54mr2066656e87.21.1740776980095; Fri, 28 Feb 2025
 13:09:40 -0800 (PST)
MIME-Version: 1.0
References: <20250219103908.42513-1-uvv.mail@gmail.com> <71BF1160-E808-4212-B790-5462F95BFBA4@arm.com>
 <1825F47182B39BA0.23135@lists.openembedded.org> <ae46ffa2-b88d-4ec5-822a-08c00e2baa46@gmail.com>
 <CAO5Uq5SCkF9n9ngCvcNSkHLNSPQpKxwXv+o+OfLP+VkMeq3TQA@mail.gmail.com>
 <A5978220-EBAF-4C51-8587-76498A346624@arm.com> <2b44ca06-2d0c-4df9-9d3b-76ac5dcf41cc@gmail.com>
 <CAEs58j4Am9k-pA+sAcRkb0xF2_QGo7R+39L3_=cEPMp9gPQvZA@mail.gmail.com>
 <CAO5Uq5RSbdizd0sSvXQCM_PxChPW8o8dALiEdswkE8=bfOa7Pw@mail.gmail.com> <CAEs58j5SjjjihUkEkLQtrPxW_4CmZXLtRKobWG3sEK7hmGuWVQ@mail.gmail.com>
In-Reply-To: <CAEs58j5SjjjihUkEkLQtrPxW_4CmZXLtRKobWG3sEK7hmGuWVQ@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Fri, 28 Feb 2025 21:09:28 +0000
X-Gm-Features: AQ5f1JoiIrhF33N6H-_n4DBkOo4NTVpov88tRYCs2qXK-fwASczVaQ_K_U80-ig
Message-ID: <CAO5Uq5Q9HM089R7VmEJ3HwCMcoCayhWxvJ4wX-7f2RvsMWVQwA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v6] systemd: Build the systemctl executable
To: Alexis CELLIER <alexis.cellier@smile.fr>
Cc: uvv.mail@gmail.com, Ross Burton <Ross.Burton@arm.com>, 
	"Openembedded-core@lists.openembedded.org" <Openembedded-core@lists.openembedded.org>, 
	Mikko Rapeli <mikko.rapeli@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Feb 2025 21:09:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212079

On Fri, Feb 28, 2025 at 5:28=E2=80=AFPM Alexis CELLIER <alexis.cellier@smil=
e.fr> wrote:
>
> On Fri, Feb 28, 2025 at 5:33=E2=80=AFPM Alex Kiernan <alex.kiernan@gmail.=
com> wrote:
> >
> > On Fri, Feb 28, 2025 at 3:57=E2=80=AFPM Alexis CELLIER <alexis.cellier@=
smile.fr> wrote:
> > >
> > > On Wed, Feb 26, 2025 at 11:43=E2=80=AFAM Vyacheslav Yurkov via
> > > lists.openembedded.org <uvv.mail=3Dgmail.com@lists.openembedded.org>
> > > wrote:
> > > >
> > > > On 25.02.2025 15:48, Ross Burton wrote:
> > > > > On 20 Feb 2025, at 15:33, Vyacheslav Yurkov <uvv.mail@gmail.com> =
wrote:
> > > > >> Isn't is supposed to be created on first boot?
> > > > >
> > > > > Yes, ish, but our rootfs is read only at this point:
> > > > >
> > > > > [    7.639766] systemd[1]: System cannot boot: Missing /etc/machi=
ne-id and /etc is mounted read-only.
> > > > > [    7.641135] systemd[1]: Booting up is supported only when:
> > > > > [    7.641844] systemd[1]: 1) /etc/machine-id exists and is popul=
ated.
> > > > > [    7.642588] systemd[1]: 2) /etc/machine-id exists and is empty=
.
> > > > > [    7.643279] systemd[1]: 3) /etc/machine-id is missing and /etc=
 is writable.
> > > > >
> > > > > On 20 Feb 2025, at 16:03, Alex Kiernan <alex.kiernan@gmail.com> w=
rote:
> > > > >> I do know that it was a horrible thing to get right when I rewro=
te the
> > > > >> shell script in python (which I'm very glad to see the back of):
> > > > >>
> > > > >>     # If we populate the systemd links we also create /etc/machi=
ne-id, which
> > > > >>     # allows systemd to boot with the filesystem read-only befor=
e generating
> > > > >>     # a real value and then committing it back.
> > > > >>     #
> > > > >>     # For the stateless configuration, where /etc is generated a=
t runtime
> > > > >>     # (for example on a tmpfs), this script shouldn't run at all=
 and we
> > > > >>     # allow systemd to completely populate /etc.
> > > > >>
> > > > >> It may be that this behaviour was wrong in some cases, but at th=
e same
> > > > >> time, I remember spending a lot of time getting this right!
> > > > > It certainly looks like it=E2=80=99s =E2=80=9Ctricky=E2=80=9D to =
get the right semantics here because the range of potential use-cases is to=
o great.
> > > > >
> > > > > I believe we should be writing /etc/machine-id at rootfs time if =
systemd is being used.  Currently this is done in the systemctl class if it=
 writes links, and then in the rootfs class if the rootfs is read-only.
> > > > >
> > > > > I think we should consolidate those into the rootfs class, and gi=
ve the user the choice of whether to treat the image as booted or not by wr=
iting either =E2=80=9C=E2=80=9D or =E2=80=9Cuninitialized=E2=80=9D to the f=
ile as per https://www.freedesktop.org/software/systemd/man/latest/machine-=
id.html#First%20Boot%20Semantics.
> > > > >
> > > > > tl;dr: if it contains =E2=80=9Cuninitialized=E2=80=9D then this i=
s the first boot, otherwise it=E2=80=99s not.  By always touching the file =
we break the ability for anyone to use systemd-first-boot or ConditionFirst=
Boot in their own units, which seems wrong.
> > > > >
> > > > > We=E2=80=99re about a week from feature freeze and getting this m=
erged would be great, do you think you can finish this off Slava?
> > > > >
> > > > > Thanks,
> > > > > Ross
> > > >
> > > > I definitely gonna try. But I might be missing something, because I
> > > > thought it sums up as follows:
> > > >
> > > > RO rootfs -> empty machine-id
> > > > RW rootfs -> no machine-id
> > > >
> > > > And it does work that way when I rebuild my image with or without R=
O rootfs.
> > >
> > > At the moment on master, as systemd-systemctl python script touch the
> > > file, we can end up with an empty file independently of the
> > > IMAGE_FEATURE read-only-rootfs. So we do break the ability of
> > > firstboot in any case.
> > > Also, if you boot with your rootfs in ro (KERNEL_ARGS, wic, ...)
> > > without setting read-only-rootfs, with fstab that will remount your
> > > rootfs in rw (so you do not have a read-only rootfs), not having the
> > > /etc/machine-id file will make systemd fail (no not having
> > > /etc/machine-id seems dangerous te me).
> > >
> > > So why not put "uninitialized" in /etc/machine-id all the time
> > > (probably in rootfs post commands, if the file does not exist yet, to
> > > allow user to put a predefine one), it allows firstboot and prevent
> > > the dangerous case of not having the file. The only strange case woul=
d
> > > be when you do have a read-only filesystem, as you will always have a
> > > first boot.
> > > But if we do not want that strange behaviour by default, we can empty
> > > /etc/machine-id in case of read-only-rootfs (in rootfs post commands)=
,
> > > or we let the decision to the user by letting him choose using the
> > > systemd PACKAGECONFIG to enable/disable the firstboot support.
> > >
> >
> > firstboot usage, really doesn't feel like a piece of package
> > configuration to me, possibly distro config, but having a
> > (potentially) interactive boot seems like an outlier in the OE world
> > (though I'm not saying it shouldn't be supported).
>
> It is already a PACKAGECONFIG of systemd, not enabled by default (not
> sure it was clear in my previous message).
>

I didn't look... though that's not unreasonable - I was thinking of it
as PACKAGECONFIG controlling whether firstboot happens.

> > Today we call the systemctl script as part of rootfs construction
> > which may touch /etc/machine-id, removing it from there and having it
> > obviously in one place as part of rootfs construction seems like it
> > ought to be an improvement.
>
> I do agree.
>
> I do have a question, it is possible to not end up with the
> /etc/machine-id file, i.e. not having the python script called (on
> master)?

You can - if you add stateless-rootfs to IMAGE_FEATURES then systemctl
isn't called at image construction time, hence this part of the
comment in the script:

    # For the stateless configuration, where /etc is generated at runtime
    # (for example on a tmpfs), this script shouldn't run at all and we
    # allow systemd to completely populate /etc.

--=20
Alex Kiernan

