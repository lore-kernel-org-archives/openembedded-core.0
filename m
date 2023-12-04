Return-Path: <h4nn35.work@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B322EC10F13
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 06:53:29 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web10.63990.1701672799813458979
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Dec 2023 22:53:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L/iF+MlC;
 spf=pass (domain: gmail.com, ip: 209.85.219.181, mailfrom: h4nn35.work@gmail.com)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-db544987c79so2486472276.2
        for <openembedded-core@lists.openembedded.org>; Sun, 03 Dec 2023 22:53:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701672799; x=1702277599; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BCD4DxSUnkCtBJV6lHNnze2BS+rY8oHabif4ru+xL80=;
        b=L/iF+MlCtEnpTcuNsmnkmfbkFgrAk8CgGZRoaEjgHKWUQq6uL/t/VS22J0lN0eZevn
         H/1RJlN9jLK6DNWqbN94ba+Dgg6Kgj345UC7bo8iW9ohb0N5qAsO5LVRGyAFMGkCH8HL
         XP+0nkrXJAmGvhJ2GazpsDH6gJDRIVfgj1mXcNc4weyMyGebLG8FwhpyeTqLWpGFYqbF
         VHn8STGNf0Ge5xCb7M6eKZmd51XPl8h/Kq7YnbVTWLVe8bGaZyG+NDR+Gdh0HOIM+8WN
         lFgSfXHwS1vT5337VDo7e4ZlUPLXD/bwpS6DxMyVgyzHIkcNiJNKAkcZg/K7ItKiJaqb
         9qkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701672799; x=1702277599;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BCD4DxSUnkCtBJV6lHNnze2BS+rY8oHabif4ru+xL80=;
        b=SATv3e7fRpuL1TsAUA4U6nhiqYGYzaZZnbuWjCWXWtM/r69fXUfeLgI0+4nH2zc8Th
         zVY1tctJGKKNH/6tiWcnubX5kEUQH/pf/qzQbBbUQTiz/G4mpacNxd/XpPDoyCB5Vd1F
         OT6L+b5Bluud+U/v95avRBasqYYzJCKSS2guKoi6l54cyOpBfy029qyqcG7qkc1JDGdg
         4nRzJScQU9GMoffEaazJTuUsIQc9bX4vCQN6j7dSA9J3qqHhnWd19Du6LZs8iY/xHy4j
         PxQJdqpLCCcgxRhIaTMV/VQsmr0+DrzB6G8+94tfIcgA9QyRK2vbES3bCHkLxwLEg9Ev
         91SQ==
X-Gm-Message-State: AOJu0Yyc/1vKIoTwG60zxmLwvWoRuVqiyTRTXaExlupjio/rFtp4uvpv
	xvoVeq0iPISvTWFAxhScLG7TmVXCWXSYllUD+rak3rGwAw==
X-Google-Smtp-Source: AGHT+IH172yMO1tHdi+M/7nouDCSM9GohyVDKHebLrBgT1F+6aPcqKk14Oho8QRsvPeJrupngVYmDuH0feC54kthFLs=
X-Received: by 2002:a25:ad21:0:b0:db8:498f:1740 with SMTP id
 y33-20020a25ad21000000b00db8498f1740mr2194446ybi.83.1701672798905; Sun, 03
 Dec 2023 22:53:18 -0800 (PST)
MIME-Version: 1.0
References: <20231201105359.409068-1-johannes.pointner@br-automation.com> <20231202151311e74fca40@mail.local>
In-Reply-To: <20231202151311e74fca40@mail.local>
From: Johannes Pointner <h4nn35.work@gmail.com>
Date: Mon, 4 Dec 2023 07:53:06 +0100
Message-ID: <CAHvQdo2FqMHUaKOpXHcOimVGQk40b=6A9xRXVh-zHwEQ_SvQwA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ldconfig-native: Add usrmerge support
To: alexandre.belloni@bootlin.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 06:53:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191722

Hello,

On Sat, Dec 2, 2023 at 4:13=E2=80=AFPM Alexandre Belloni via
lists.openembedded.org
<alexandre.belloni=3Dbootlin.com@lists.openembedded.org> wrote:
>
> On 01/12/2023 11:53:59+0100, Johannes Pointner via lists.openembedded.org=
 wrote:
> > If DISTRO_FEATURE usrmerge is enabled, SLIBDIR is just a symlink to LIB=
DIR,
> > therefore don't add SLIBDIR for parsing in this case.
> >
> > Signed-off-by: Johannes Pointner <johannes.pointner@br-automation.com>
> > ---
> >  .../ldconfig-add-usrmerge-support.patch       | 37 +++++++++++++++++++
> >  .../glibc/ldconfig-native_2.12.1.bb           |  1 +
> >  2 files changed, 38 insertions(+)
> >  create mode 100644 meta/recipes-core/glibc/ldconfig-native-2.12.1/ldco=
nfig-add-usrmerge-support.patch
> >
> > diff --git a/meta/recipes-core/glibc/ldconfig-native-2.12.1/ldconfig-ad=
d-usrmerge-support.patch b/meta/recipes-core/glibc/ldconfig-native-2.12.1/l=
dconfig-add-usrmerge-support.patch
> > new file mode 100644
> > index 0000000000..3041d433fd
> > --- /dev/null
> > +++ b/meta/recipes-core/glibc/ldconfig-native-2.12.1/ldconfig-add-usrme=
rge-support.patch
> > @@ -0,0 +1,37 @@
> > +From 6e543f39f6bec6eb2e02eea02029c7f4ec533b66 Mon Sep 17 00:00:00 2001
> > +From: Johannes Pointner <johannes.pointner@br-automation.com>
> > +Date: Fri, 1 Dec 2023 11:02:39 +0100
> > +Subject: [PATCH] ldconfig: add usrmerge support
> > +
> > +Check whether SLIBDIR is a symlink, which is the case if usrmerge
> > +is enabled, and if so, ignore it.
> > +
> > +Upstream-Status: Inappropriate [embedded specific]
>
> I'm not sure how this is embedded specific, why doesn't it affect desktop
> distribution that have usrmerge (e.g. Fedora) ?
Because this is just a workaround for the standalone ldconfig-native.
https://lists.openembedded.org/g/openembedded-core/message/191566
I also looked at the reason for the patches that are already used by
ldconfig-native.
But I am open to suggestions, what would you prefer?
>
> > +
> > +Signed-off-by: Johannes Pointner <johannes.pointner@br-automation.com>
> > +---
> > + ldconfig.c | 8 +++++++-
> > + 1 file changed, 7 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/ldconfig.c b/ldconfig.c
> > +index e826410..72ac67b 100644
> > +--- a/ldconfig.c
> > ++++ b/ldconfig.c
> > +@@ -1371,10 +1371,16 @@ main (int argc, char **argv)
> > +
> > +   if (!opt_only_cline)
> > +     {
> > ++      struct stat buf;
> > ++      int ret;
> > +       parse_conf (config_file, true);
> > +
> > +       /* Always add the standard search paths.  */
> > +-      add_system_dir (SLIBDIR);
> > ++      /* Check whether SLIBDIR is a symlink, which is the case if usr=
merge
> > ++       is enabled, and if so, ignore it. */
> > ++      ret =3D lstat(SLIBDIR ,&buf);
> > ++      if(ret =3D=3D -1 || !S_ISLNK(buf.st_mode))
> > ++        add_system_dir (SLIBDIR);
> > +       if (strcmp (SLIBDIR, LIBDIR))
> > +     add_system_dir (LIBDIR);
> > +       add_system_dir (SLIBDIR32);
> > diff --git a/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb b/meta/r=
ecipes-core/glibc/ldconfig-native_2.12.1.bb
> > index 4db67c3ad4..85fc87257d 100644
> > --- a/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb
> > +++ b/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb
> > @@ -16,6 +16,7 @@ SRC_URI =3D "file://ldconfig-native-2.12.1.tar.bz2 \
> >             file://add-64-bit-flag-for-ELF64-entries.patch \
> >             file://no-aux-cache.patch \
> >             file://add-riscv-support.patch \
> > +           file://ldconfig-add-usrmerge-support.patch \
> >  "
> >
> >
> > --
> > 2.43.0
> >
> >
>
> >
> >
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191702): https://lists.openembedded.org/g/openembedde=
d-core/message/191702
> Mute This Topic: https://lists.openembedded.org/mt/102912756/3617353
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [h4=
nn35.work@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

