Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FEE9C282C6
	for <webhook@archiver.kernel.org>; Fri, 28 Feb 2025 16:33:30 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.20383.1740760407607851820
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 28 Feb 2025 08:33:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FsyQYruq;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30b7f91218cso22371261fa.3
        for <Openembedded-core@lists.openembedded.org>; Fri, 28 Feb 2025 08:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740760405; x=1741365205; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IcyeM/B16ze8Or4azYb0Lf7aflfBw2mk4zYnnfjVjlw=;
        b=FsyQYruqEOZIHqyqEZzHEPy0AWA7v0DVGH7yWL0ODlgwNExLTtrTRBAivsYs/KyD8e
         rnsIRMTsVW7odba5R0V6AkwWcNv/T6CEFYMbxqB3WcEseaRWM0iyRAhPPpEmvdP0NBNs
         MEvvCXgSkjUPMv4/qbN/VosTYM37aABuXDAYkRXJ1Ed1pfCZvZRZundDymQU/8HPtf/G
         QvQSqy641p4GSy2oApgeVMkimk0GHRcLqs4CshudjnNTzhzHo4LIj3qdV3egvTPd1Hfi
         KFPE7w+4kUzg1z9oqz91rl/ZEiyFyqzasJgFD+NxRIIY7VxoVHuu2hIo4scpH7HPM2mr
         RFNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740760405; x=1741365205;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IcyeM/B16ze8Or4azYb0Lf7aflfBw2mk4zYnnfjVjlw=;
        b=PLLrzrZ6htiN8WMxOkrQwl/0x1ffARhZ7kzs4/epZ+JQvDn0RFI46fSEUguwt4x7jL
         bLEV7+unwGmvupbd1IvxB+CFwoemR3xLHGbQIhBcxQErwBegXHiyxiW8XPV9JmBV+kiL
         NCZakaRHgi+U+ckWJ9C4ILDV9dew1T8JzAxWGgIZ8Li1M1hs+6zVCh2fkZYAkuiaBlX6
         R7a1vxtg5kj/DiaUC8zvvnB+Ws6SyHuVavypt3RAiwIXnAEAHOfxeC61Z4bEBy6g67SR
         HfzAIievyAboID/3IuVxipP2D0SIvcbx93sC4PpMq4yWCljKhqqe0tP9Ma1UrEap75Ac
         3EBw==
X-Forwarded-Encrypted: i=1; AJvYcCU7YGkinndO/KHZU+aRFbg2dNz+ZIBRcMm6c8up+1FcEFWLdGwQ9JV6GOdFjTgHbs17U+j2gjFCkdoTESOxvcKaIA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxTpeUKB0Irhy1Z7R3W4mxJyAOJi7JOpqOcmbetPw5pFoO2Faxc
	Gu0vExaciLk5q9OYdjAtZHIaVEvGyd2es8MsQeDXPcEescxxquPj/sgPS4En33BLCkjJtvvZ9Ih
	O6e8XM7nN97zi483aMmiWVrUAWi0=
X-Gm-Gg: ASbGnctuoB7tpMfLi6olsY2ZTiYO/pQ6dkORRCr2ymrxipTXys/y9Kq5hCRqpIS4WRo
	FTpGnwEYr9RY0+XKyKrbwPKfKXJCngKdlsLIX4f+q39SliAUOq1V9mPQJDGKfqlr5EdQbI+fHj7
	pUzKSLEA==
X-Google-Smtp-Source: AGHT+IHy/a6agRTbexkxlbeCCaZMCtJWpSRHnG5ml4KwdfaoGl50WvxiYUn/RYaU3IJHAKf0fW/qTaPN34IB7j66QS0=
X-Received: by 2002:a2e:9096:0:b0:308:fd11:76ef with SMTP id
 38308e7fff4ca-30b932f07a0mr14867781fa.23.1740760405076; Fri, 28 Feb 2025
 08:33:25 -0800 (PST)
MIME-Version: 1.0
References: <20250219103908.42513-1-uvv.mail@gmail.com> <71BF1160-E808-4212-B790-5462F95BFBA4@arm.com>
 <1825F47182B39BA0.23135@lists.openembedded.org> <ae46ffa2-b88d-4ec5-822a-08c00e2baa46@gmail.com>
 <CAO5Uq5SCkF9n9ngCvcNSkHLNSPQpKxwXv+o+OfLP+VkMeq3TQA@mail.gmail.com>
 <A5978220-EBAF-4C51-8587-76498A346624@arm.com> <2b44ca06-2d0c-4df9-9d3b-76ac5dcf41cc@gmail.com>
 <CAEs58j4Am9k-pA+sAcRkb0xF2_QGo7R+39L3_=cEPMp9gPQvZA@mail.gmail.com>
In-Reply-To: <CAEs58j4Am9k-pA+sAcRkb0xF2_QGo7R+39L3_=cEPMp9gPQvZA@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Fri, 28 Feb 2025 16:33:13 +0000
X-Gm-Features: AQ5f1Jp3IPVDj1DBZxae9t4I7JPHoPJrVoW2sGpqGTdJIu2O89aZcwIVj6R_dBU
Message-ID: <CAO5Uq5RSbdizd0sSvXQCM_PxChPW8o8dALiEdswkE8=bfOa7Pw@mail.gmail.com>
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
 <openembedded-core@lists.openembedded.org>; Fri, 28 Feb 2025 16:33:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212071

On Fri, Feb 28, 2025 at 3:57=E2=80=AFPM Alexis CELLIER <alexis.cellier@smil=
e.fr> wrote:
>
> On Wed, Feb 26, 2025 at 11:43=E2=80=AFAM Vyacheslav Yurkov via
> lists.openembedded.org <uvv.mail=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > On 25.02.2025 15:48, Ross Burton wrote:
> > > On 20 Feb 2025, at 15:33, Vyacheslav Yurkov <uvv.mail@gmail.com> wrot=
e:
> > >> Isn't is supposed to be created on first boot?
> > >
> > > Yes, ish, but our rootfs is read only at this point:
> > >
> > > [    7.639766] systemd[1]: System cannot boot: Missing /etc/machine-i=
d and /etc is mounted read-only.
> > > [    7.641135] systemd[1]: Booting up is supported only when:
> > > [    7.641844] systemd[1]: 1) /etc/machine-id exists and is populated=
.
> > > [    7.642588] systemd[1]: 2) /etc/machine-id exists and is empty.
> > > [    7.643279] systemd[1]: 3) /etc/machine-id is missing and /etc is =
writable.
> > >
> > > On 20 Feb 2025, at 16:03, Alex Kiernan <alex.kiernan@gmail.com> wrote=
:
> > >> I do know that it was a horrible thing to get right when I rewrote t=
he
> > >> shell script in python (which I'm very glad to see the back of):
> > >>
> > >>     # If we populate the systemd links we also create /etc/machine-i=
d, which
> > >>     # allows systemd to boot with the filesystem read-only before ge=
nerating
> > >>     # a real value and then committing it back.
> > >>     #
> > >>     # For the stateless configuration, where /etc is generated at ru=
ntime
> > >>     # (for example on a tmpfs), this script shouldn't run at all and=
 we
> > >>     # allow systemd to completely populate /etc.
> > >>
> > >> It may be that this behaviour was wrong in some cases, but at the sa=
me
> > >> time, I remember spending a lot of time getting this right!
> > > It certainly looks like it=E2=80=99s =E2=80=9Ctricky=E2=80=9D to get =
the right semantics here because the range of potential use-cases is too gr=
eat.
> > >
> > > I believe we should be writing /etc/machine-id at rootfs time if syst=
emd is being used.  Currently this is done in the systemctl class if it wri=
tes links, and then in the rootfs class if the rootfs is read-only.
> > >
> > > I think we should consolidate those into the rootfs class, and give t=
he user the choice of whether to treat the image as booted or not by writin=
g either =E2=80=9C=E2=80=9D or =E2=80=9Cuninitialized=E2=80=9D to the file =
as per https://www.freedesktop.org/software/systemd/man/latest/machine-id.h=
tml#First%20Boot%20Semantics.
> > >
> > > tl;dr: if it contains =E2=80=9Cuninitialized=E2=80=9D then this is th=
e first boot, otherwise it=E2=80=99s not.  By always touching the file we b=
reak the ability for anyone to use systemd-first-boot or ConditionFirstBoot=
 in their own units, which seems wrong.
> > >
> > > We=E2=80=99re about a week from feature freeze and getting this merge=
d would be great, do you think you can finish this off Slava?
> > >
> > > Thanks,
> > > Ross
> >
> > I definitely gonna try. But I might be missing something, because I
> > thought it sums up as follows:
> >
> > RO rootfs -> empty machine-id
> > RW rootfs -> no machine-id
> >
> > And it does work that way when I rebuild my image with or without RO ro=
otfs.
>
> At the moment on master, as systemd-systemctl python script touch the
> file, we can end up with an empty file independently of the
> IMAGE_FEATURE read-only-rootfs. So we do break the ability of
> firstboot in any case.
> Also, if you boot with your rootfs in ro (KERNEL_ARGS, wic, ...)
> without setting read-only-rootfs, with fstab that will remount your
> rootfs in rw (so you do not have a read-only rootfs), not having the
> /etc/machine-id file will make systemd fail (no not having
> /etc/machine-id seems dangerous te me).
>
> So why not put "uninitialized" in /etc/machine-id all the time
> (probably in rootfs post commands, if the file does not exist yet, to
> allow user to put a predefine one), it allows firstboot and prevent
> the dangerous case of not having the file. The only strange case would
> be when you do have a read-only filesystem, as you will always have a
> first boot.
> But if we do not want that strange behaviour by default, we can empty
> /etc/machine-id in case of read-only-rootfs (in rootfs post commands),
> or we let the decision to the user by letting him choose using the
> systemd PACKAGECONFIG to enable/disable the firstboot support.
>

firstboot usage, really doesn't feel like a piece of package
configuration to me, possibly distro config, but having a
(potentially) interactive boot seems like an outlier in the OE world
(though I'm not saying it shouldn't be supported).

Today we call the systemctl script as part of rootfs construction
which may touch /etc/machine-id, removing it from there and having it
obviously in one place as part of rootfs construction seems like it
ought to be an improvement.

> > Richard, could you please point me out which test actually failed? I
> > looked at the logs, but most of them were "Skipped".
> > Does the test explicitly remount rootfs as RO perhaps?
> >
> > The other option to have a real machine ID will probably mean to build
> > machine id and leave it up to a user to decide whether they want to hav=
e
> > such image. But I don't think it's wise to add this option now so it
> > ends up in the next release.
> >
> > Slava
>
> Regards,
>
> --
> Alexis Cellier
> Smile ECS Developer



--=20
Alex Kiernan

