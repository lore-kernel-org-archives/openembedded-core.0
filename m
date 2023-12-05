Return-Path: <h4nn35.work@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2528EC4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 09:44:19 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web10.96911.1701769454771094662
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Dec 2023 01:44:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OEukoYnW;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: h4nn35.work@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-5d05ff42db0so60915147b3.2
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 01:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701769454; x=1702374254; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c0Bflh7Y9YLA9suZk3QZxXjwwMy5XD+TH48lOGeQs7k=;
        b=OEukoYnW+2V1nJy7z45W6m/HEFiKNeA6bLkvBwAD2hcpcMdWbI7OBDcXnQQgA54j3b
         pw1iXG1A42yoLYt3bWC5qbjKwRSGNsPVg2/WN+L/IOvxOVFY6ysJQAQC5MlllVNr78b2
         oAOJh432nuvPppVz/s20ETBABlcSgeInbUSFb2V6wRX7ehT6IsY9Jdzr6Zh2KMl5bH1+
         rRiVLmgppJbW1pMYtaObTRfEdvJIBuPGg4NOeTYwBfkqnUvBqBF8awrQltSZ/mcRBJqS
         23mdH81Z9gAlNSdOr8XlHkREEK0gLTx0F188Ss70vI8G6v3ye+Ip+VrInxQfHBE/lJRw
         JU0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701769454; x=1702374254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c0Bflh7Y9YLA9suZk3QZxXjwwMy5XD+TH48lOGeQs7k=;
        b=NzGStj+yhxRYrseJypNBDZjboCFIDBz3CYKkrb25voa60Z9xLD3OLOj8Eubet3B9uY
         0EJ4fZKPgQiMI26pdMKQEfstb6HOWyVWhE2ZnYG/x9QuOjTGOzITkuQNY4PvRm9iwuXd
         2UkyWuw6DPkOCN3wNlltmSF/p6CVDt/5+PHuLftmhjKfAycYZQii9ZR4r749QHC1e4ho
         qcsw4woiDwZHZ4cwOzeDZqgFv3/RSkieJ25PExfQ7hTxFvGCMi0DX9eir44jioaIXh0Z
         Opa/bvh3mI+bhqdMd7I9eMI3hBseiThFYYfW+FbTmOMJ3GEV8D1wdmCIR9nFRGLupYrv
         KjJg==
X-Gm-Message-State: AOJu0YwisI0lrax+wdAi4C9Q9c6wLUUESHhMnYtXRDeRNHRO628KCsHp
	+EO6DZ6c/XfKwZ31PS3XGO1RVbMajGh6K+a9qA==
X-Google-Smtp-Source: AGHT+IH4Jj2TMcco4Oqdp3o2IubhEQM/SJeHOgqHlqFLGE2cH2G/F5WKRrsBL0wmlKYmCmy5l0nOjkJamWKNrD8XPtc=
X-Received: by 2002:a81:4ccd:0:b0:5d3:e2a2:8bcd with SMTP id
 z196-20020a814ccd000000b005d3e2a28bcdmr3810438ywa.5.1701769453835; Tue, 05
 Dec 2023 01:44:13 -0800 (PST)
MIME-Version: 1.0
References: <20231201105359.409068-1-johannes.pointner@br-automation.com>
 <20231202151311e74fca40@mail.local> <CAHvQdo2FqMHUaKOpXHcOimVGQk40b=6A9xRXVh-zHwEQ_SvQwA@mail.gmail.com>
 <CANNYZj99HsYjDgWeKwK8KsU1=cZDZ8g3rtc7vGiY9NizdA+_7g@mail.gmail.com>
In-Reply-To: <CANNYZj99HsYjDgWeKwK8KsU1=cZDZ8g3rtc7vGiY9NizdA+_7g@mail.gmail.com>
From: Johannes Pointner <h4nn35.work@gmail.com>
Date: Tue, 5 Dec 2023 10:44:02 +0100
Message-ID: <CAHvQdo1+2xLfA4DMHbS3x6MparmAT+EAGUUNwJ1p+kst9dUOug@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ldconfig-native: Add usrmerge support
To: Alexander Kanavin <alex.kanavin@gmail.com>, alexandre.belloni@bootlin.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 09:44:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191811

On Mon, Dec 4, 2023 at 11:00=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Generally if you mark something as inappropriate, it's best to write
> an extended description of why in the patch. The barrier to adding
> patches that we can never upstream is high.
>
Thanks, I understand that, but ldconfig-native seemed very special to me, s=
o
I tried to take an example from the existing patches.

So the next step would be a v2 with a better explanation and obviously a
fixed sendemail.from?
Or are there any other things I should change?

Hannes
> Alex
>
> On Mon, 4 Dec 2023 at 07:53, Johannes Pointner <h4nn35.work@gmail.com> wr=
ote:
> >
> > Hello,
> >
> > On Sat, Dec 2, 2023 at 4:13=E2=80=AFPM Alexandre Belloni via
> > lists.openembedded.org
> > <alexandre.belloni=3Dbootlin.com@lists.openembedded.org> wrote:
> > >
> > > On 01/12/2023 11:53:59+0100, Johannes Pointner via lists.openembedded=
.org wrote:
> > > > If DISTRO_FEATURE usrmerge is enabled, SLIBDIR is just a symlink to=
 LIBDIR,
> > > > therefore don't add SLIBDIR for parsing in this case.
> > > >
> > > > Signed-off-by: Johannes Pointner <johannes.pointner@br-automation.c=
om>
> > > > ---
> > > >  .../ldconfig-add-usrmerge-support.patch       | 37 +++++++++++++++=
++++
> > > >  .../glibc/ldconfig-native_2.12.1.bb           |  1 +
> > > >  2 files changed, 38 insertions(+)
> > > >  create mode 100644 meta/recipes-core/glibc/ldconfig-native-2.12.1/=
ldconfig-add-usrmerge-support.patch
> > > >
> > > > diff --git a/meta/recipes-core/glibc/ldconfig-native-2.12.1/ldconfi=
g-add-usrmerge-support.patch b/meta/recipes-core/glibc/ldconfig-native-2.12=
.1/ldconfig-add-usrmerge-support.patch
> > > > new file mode 100644
> > > > index 0000000000..3041d433fd
> > > > --- /dev/null
> > > > +++ b/meta/recipes-core/glibc/ldconfig-native-2.12.1/ldconfig-add-u=
srmerge-support.patch
> > > > @@ -0,0 +1,37 @@
> > > > +From 6e543f39f6bec6eb2e02eea02029c7f4ec533b66 Mon Sep 17 00:00:00 =
2001
> > > > +From: Johannes Pointner <johannes.pointner@br-automation.com>
> > > > +Date: Fri, 1 Dec 2023 11:02:39 +0100
> > > > +Subject: [PATCH] ldconfig: add usrmerge support
> > > > +
> > > > +Check whether SLIBDIR is a symlink, which is the case if usrmerge
> > > > +is enabled, and if so, ignore it.
> > > > +
> > > > +Upstream-Status: Inappropriate [embedded specific]
> > >
> > > I'm not sure how this is embedded specific, why doesn't it affect des=
ktop
> > > distribution that have usrmerge (e.g. Fedora) ?
> > Because this is just a workaround for the standalone ldconfig-native.
> > https://lists.openembedded.org/g/openembedded-core/message/191566
> > I also looked at the reason for the patches that are already used by
> > ldconfig-native.
> > But I am open to suggestions, what would you prefer?
> > >
> > > > +
> > > > +Signed-off-by: Johannes Pointner <johannes.pointner@br-automation.=
com>
> > > > +---
> > > > + ldconfig.c | 8 +++++++-
> > > > + 1 file changed, 7 insertions(+), 1 deletion(-)
> > > > +
> > > > +diff --git a/ldconfig.c b/ldconfig.c
> > > > +index e826410..72ac67b 100644
> > > > +--- a/ldconfig.c
> > > > ++++ b/ldconfig.c
> > > > +@@ -1371,10 +1371,16 @@ main (int argc, char **argv)
> > > > +
> > > > +   if (!opt_only_cline)
> > > > +     {
> > > > ++      struct stat buf;
> > > > ++      int ret;
> > > > +       parse_conf (config_file, true);
> > > > +
> > > > +       /* Always add the standard search paths.  */
> > > > +-      add_system_dir (SLIBDIR);
> > > > ++      /* Check whether SLIBDIR is a symlink, which is the case if=
 usrmerge
> > > > ++       is enabled, and if so, ignore it. */
> > > > ++      ret =3D lstat(SLIBDIR ,&buf);
> > > > ++      if(ret =3D=3D -1 || !S_ISLNK(buf.st_mode))
> > > > ++        add_system_dir (SLIBDIR);
> > > > +       if (strcmp (SLIBDIR, LIBDIR))
> > > > +     add_system_dir (LIBDIR);
> > > > +       add_system_dir (SLIBDIR32);
> > > > diff --git a/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb b/me=
ta/recipes-core/glibc/ldconfig-native_2.12.1.bb
> > > > index 4db67c3ad4..85fc87257d 100644
> > > > --- a/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb
> > > > +++ b/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb
> > > > @@ -16,6 +16,7 @@ SRC_URI =3D "file://ldconfig-native-2.12.1.tar.bz=
2 \
> > > >             file://add-64-bit-flag-for-ELF64-entries.patch \
> > > >             file://no-aux-cache.patch \
> > > >             file://add-riscv-support.patch \
> > > > +           file://ldconfig-add-usrmerge-support.patch \
> > > >  "
> > > >
> > > >
> > > > --
> > > > 2.43.0
> > > >
> > > >
> > >
> > > >
> > > >
> > > >
> > >
> > >
> > > --
> > > Alexandre Belloni, co-owner and COO, Bootlin
> > > Embedded Linux and Kernel engineering
> > > https://bootlin.com
> > >
> > >
> > >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#191722): https://lists.openembedded.org/g/openembed=
ded-core/message/191722
> > Mute This Topic: https://lists.openembedded.org/mt/102912756/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

