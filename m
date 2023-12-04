Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88E61C4167B
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 10:00:20 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.65468.1701684012997252809
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 02:00:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ij1oJ7bH;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-50be9e6427dso1693062e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 02:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701684011; x=1702288811; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ew/gUYxI0ifWbQ4aRgQNJZBkEBEe5AMdTfdYQ8ZnZ4=;
        b=Ij1oJ7bHIedADiT/zfjzQfr6F2w4+QVD92K0dvfZvp38sou1SnSgQ57lyKxm/0epa5
         J91Tj1Okk1GS1WuNSq5wnJOYD01nTpr/1n/oRJu2j/gE4LkctHSKpuUsUi7ep8pSg9oq
         tLKgP8AYTeE10zIImLv59ENqmSH9+F5ZZGU5UMTbii01CKcZmgLkw1xDrUq5NehVpHjY
         mqL62T1posDYzo4BWy1XfhFdOAqYIXahcZ9N0CxK9yTl4ujijyo4OUhUfmHSAk1hubh1
         /gzuSE+h4CM7oGtfbj/WZY6jtbJxRorYtr/Ifz8VGkp1mdWvcMGEtsfiAfIvr1lQhEeK
         N1gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701684011; x=1702288811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ew/gUYxI0ifWbQ4aRgQNJZBkEBEe5AMdTfdYQ8ZnZ4=;
        b=Q/0dFvgjfilbndXH7+phY7MYGnxtkosIgJIb84H1or1Jk7lTDI87xvhN/r1AeLSGAn
         coWrw8skJ14ZfguiHjVlytIl7iQ0JiHn0/Tq0G0bKu15iwx8pf3wb9FMMOCO71lEozO2
         QM6K/IbUbh3Q1azb7ln0iBaj4j64aXgbqlQmZiST1ECJkjGxyNgB2KFNTEdJd89eue1y
         32n1rTodrMd3SgG0j4+oIl9OXWBsj7/HzllBz4tnEQ9Kk5tZuUnwddg/1vHWUvw1MD5N
         SiJoxiY05MwitAoDQJSyN0pcmuTuLhi9swi8l+F5ZpNE7wMTui+PQPEmag59OfJmr/7P
         VSXA==
X-Gm-Message-State: AOJu0Yw5w3ZTMNy7MPN5mSmmgsFRFdon/kjkAgkSmckOtwScoF7SQX9A
	7gZUGzB515cAMjR9E86gGDADibZg6HAAXyZ4NCg=
X-Google-Smtp-Source: AGHT+IGfq/lAYnactV9mvCQD6H1qBWXg0dQ+7oqgxQChzI1m9FfSTgwHIo04XIzIjB7FtIUTKCnYWjER5wdrWRjYo4Q=
X-Received: by 2002:a05:6512:159b:b0:50b:d764:8044 with SMTP id
 bp27-20020a056512159b00b0050bd7648044mr3267882lfb.119.1701684010675; Mon, 04
 Dec 2023 02:00:10 -0800 (PST)
MIME-Version: 1.0
References: <20231201105359.409068-1-johannes.pointner@br-automation.com>
 <20231202151311e74fca40@mail.local> <CAHvQdo2FqMHUaKOpXHcOimVGQk40b=6A9xRXVh-zHwEQ_SvQwA@mail.gmail.com>
In-Reply-To: <CAHvQdo2FqMHUaKOpXHcOimVGQk40b=6A9xRXVh-zHwEQ_SvQwA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 4 Dec 2023 10:59:59 +0100
Message-ID: <CANNYZj99HsYjDgWeKwK8KsU1=cZDZ8g3rtc7vGiY9NizdA+_7g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ldconfig-native: Add usrmerge support
To: Johannes Pointner <h4nn35.work@gmail.com>
Cc: alexandre.belloni@bootlin.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 10:00:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191730

Generally if you mark something as inappropriate, it's best to write
an extended description of why in the patch. The barrier to adding
patches that we can never upstream is high.

Alex

On Mon, 4 Dec 2023 at 07:53, Johannes Pointner <h4nn35.work@gmail.com> wrot=
e:
>
> Hello,
>
> On Sat, Dec 2, 2023 at 4:13=E2=80=AFPM Alexandre Belloni via
> lists.openembedded.org
> <alexandre.belloni=3Dbootlin.com@lists.openembedded.org> wrote:
> >
> > On 01/12/2023 11:53:59+0100, Johannes Pointner via lists.openembedded.o=
rg wrote:
> > > If DISTRO_FEATURE usrmerge is enabled, SLIBDIR is just a symlink to L=
IBDIR,
> > > therefore don't add SLIBDIR for parsing in this case.
> > >
> > > Signed-off-by: Johannes Pointner <johannes.pointner@br-automation.com=
>
> > > ---
> > >  .../ldconfig-add-usrmerge-support.patch       | 37 +++++++++++++++++=
++
> > >  .../glibc/ldconfig-native_2.12.1.bb           |  1 +
> > >  2 files changed, 38 insertions(+)
> > >  create mode 100644 meta/recipes-core/glibc/ldconfig-native-2.12.1/ld=
config-add-usrmerge-support.patch
> > >
> > > diff --git a/meta/recipes-core/glibc/ldconfig-native-2.12.1/ldconfig-=
add-usrmerge-support.patch b/meta/recipes-core/glibc/ldconfig-native-2.12.1=
/ldconfig-add-usrmerge-support.patch
> > > new file mode 100644
> > > index 0000000000..3041d433fd
> > > --- /dev/null
> > > +++ b/meta/recipes-core/glibc/ldconfig-native-2.12.1/ldconfig-add-usr=
merge-support.patch
> > > @@ -0,0 +1,37 @@
> > > +From 6e543f39f6bec6eb2e02eea02029c7f4ec533b66 Mon Sep 17 00:00:00 20=
01
> > > +From: Johannes Pointner <johannes.pointner@br-automation.com>
> > > +Date: Fri, 1 Dec 2023 11:02:39 +0100
> > > +Subject: [PATCH] ldconfig: add usrmerge support
> > > +
> > > +Check whether SLIBDIR is a symlink, which is the case if usrmerge
> > > +is enabled, and if so, ignore it.
> > > +
> > > +Upstream-Status: Inappropriate [embedded specific]
> >
> > I'm not sure how this is embedded specific, why doesn't it affect deskt=
op
> > distribution that have usrmerge (e.g. Fedora) ?
> Because this is just a workaround for the standalone ldconfig-native.
> https://lists.openembedded.org/g/openembedded-core/message/191566
> I also looked at the reason for the patches that are already used by
> ldconfig-native.
> But I am open to suggestions, what would you prefer?
> >
> > > +
> > > +Signed-off-by: Johannes Pointner <johannes.pointner@br-automation.co=
m>
> > > +---
> > > + ldconfig.c | 8 +++++++-
> > > + 1 file changed, 7 insertions(+), 1 deletion(-)
> > > +
> > > +diff --git a/ldconfig.c b/ldconfig.c
> > > +index e826410..72ac67b 100644
> > > +--- a/ldconfig.c
> > > ++++ b/ldconfig.c
> > > +@@ -1371,10 +1371,16 @@ main (int argc, char **argv)
> > > +
> > > +   if (!opt_only_cline)
> > > +     {
> > > ++      struct stat buf;
> > > ++      int ret;
> > > +       parse_conf (config_file, true);
> > > +
> > > +       /* Always add the standard search paths.  */
> > > +-      add_system_dir (SLIBDIR);
> > > ++      /* Check whether SLIBDIR is a symlink, which is the case if u=
srmerge
> > > ++       is enabled, and if so, ignore it. */
> > > ++      ret =3D lstat(SLIBDIR ,&buf);
> > > ++      if(ret =3D=3D -1 || !S_ISLNK(buf.st_mode))
> > > ++        add_system_dir (SLIBDIR);
> > > +       if (strcmp (SLIBDIR, LIBDIR))
> > > +     add_system_dir (LIBDIR);
> > > +       add_system_dir (SLIBDIR32);
> > > diff --git a/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb b/meta=
/recipes-core/glibc/ldconfig-native_2.12.1.bb
> > > index 4db67c3ad4..85fc87257d 100644
> > > --- a/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb
> > > +++ b/meta/recipes-core/glibc/ldconfig-native_2.12.1.bb
> > > @@ -16,6 +16,7 @@ SRC_URI =3D "file://ldconfig-native-2.12.1.tar.bz2 =
\
> > >             file://add-64-bit-flag-for-ELF64-entries.patch \
> > >             file://no-aux-cache.patch \
> > >             file://add-riscv-support.patch \
> > > +           file://ldconfig-add-usrmerge-support.patch \
> > >  "
> > >
> > >
> > > --
> > > 2.43.0
> > >
> > >
> >
> > >
> > >
> > >
> >
> >
> > --
> > Alexandre Belloni, co-owner and COO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191722): https://lists.openembedded.org/g/openembedde=
d-core/message/191722
> Mute This Topic: https://lists.openembedded.org/mt/102912756/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

