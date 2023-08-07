Return-Path: <jstephan@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59A32C00528
	for <webhook@archiver.kernel.org>; Mon,  7 Aug 2023 13:34:13 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.34490.1691415246626986217
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Aug 2023 06:34:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=IbEcKgWY;
 spf=pass (domain: baylibre.com, ip: 209.85.167.49, mailfrom: jstephan@baylibre.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-4fe5ab64a26so4833651e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 06:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1691415245; x=1692020045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t05d2hRsOzLMK68yUcaUPPRe9OnM1pjdzm0h+uxzYbU=;
        b=IbEcKgWYTTZs4wec8h49qmOkFpSZEsIXuUPiz0ewMj7y+WqhvZINqdbgpaSBVSRlKS
         ehkAOkT8ZMjXaUSKLLYY7Ud5ij8nuoEPr+nf3iuWOPUyCKOu6vVPkQl84ON6HE8mEGT/
         1LlH0iBVBc1TxIiP0ad7jy7duev8yL7y8BroXdDYEPSEiJ1nn/DfCYiWzPZdbQmx6vEP
         PHUUL1HXW51GYxubDwC4Tbgm3x/qrdZKKGfQQ+AclH2FetgQO3KzMEtV4PvXo35ajjh8
         TCCLbABuqM9AzQvZR9Nfo4YvfRshacH6Tj7ULjdtykxlrTbyx8q4mvooGyWHH3wWc3NA
         UnQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691415245; x=1692020045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t05d2hRsOzLMK68yUcaUPPRe9OnM1pjdzm0h+uxzYbU=;
        b=UoR+lUdS/w3JTKpuRmsOL6i/4zeS9rszZE7rmmnsq068dOC2zhIQDRbi71xUO/bzLB
         vLel79JRziJBRRBOsRW/3E6s72u6WgleISEZPaeE8EWW6gp9ijrOn/YjSupmcVsMmj+x
         J8QuHFpiB3nYmGgg1TA4qt7is0iYJX9eOVGUgkt55S6O5uBWa3Y3s8D5pfedIOOpIaoV
         AkDo80DSYr2d0bU3QIP1/Zb8/mpG2AZFnafT0MB6wo7LxxtaWJLMh09cvooktYBCvuqP
         eRV+yWpq/d1UJIsto8WgxqpVsh8aVMLgpgNeBxCxkPUb/H8Si0VzsgOjJjzuhNUzrbDg
         LpOg==
X-Gm-Message-State: AOJu0YyVryCdz6tmqmtmVXeV7mhR3DirDuTAmBDP6bqOZ4+hEzVWoj3i
	fPcH5zYVppi+mRr7EecWaXC9sfVSvfcdOJAJoKn5kkahIeAYBqmHj0k=
X-Google-Smtp-Source: AGHT+IFFzZjTBrf6xaZya+scfKCJpj75TS5cOh9b70I2dBJrzSTdtDcsVoqs6oyMzTGh8ApDaxUlo5oBer6dyVJs32g=
X-Received: by 2002:a05:6512:1193:b0:4fe:5a25:2678 with SMTP id
 g19-20020a056512119300b004fe5a252678mr8115745lfr.8.1691415244624; Mon, 07 Aug
 2023 06:34:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230803132908.4134002-1-jstephan@baylibre.com>
 <20230803132908.4134002-2-jstephan@baylibre.com> <CANNYZj8=HDJrMyF21pGbNRD3L6G-_cVdMMQ=_CU0ev_GgAzjcA@mail.gmail.com>
In-Reply-To: <CANNYZj8=HDJrMyF21pGbNRD3L6G-_cVdMMQ=_CU0ev_GgAzjcA@mail.gmail.com>
From: Julien Stephan <jstephan@baylibre.com>
Date: Mon, 7 Aug 2023 15:33:52 +0200
Message-ID: <CAEHHSvZj4AL5BRx34o9K9Dm7oCbg=A_i-5eVCy9gintwviRY0g@mail.gmail.com>
Subject: Re: [OE-core] [RESEND 1/1] libexif: add ptest support
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 13:34:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185597

Le jeu. 3 ao=C3=BBt 2023 =C3=A0 15:51, Alexander Kanavin
<alex.kanavin@gmail.com> a =C3=A9crit :
>
> What do the tests actually do? If they test libexif functionality in
> isolation, is there a need to run them, if upstream does this anyway?
> ptests are primarily meant for integration testing, e.g. exposing
> issues that arise in a complete customized system.
>
> Alex

Hi Alexander,

Didn't catch this before, makes sense. I thought we would like to have
ptest enabled for as many packages as possible.
From libexif github pages:

> The short test programs in the test directory illustrates how to create
> valid EXIF data from scratch, how to save EXIF data and how to load EXIF
> data from data in memory. To run the test programs, just run make check.
> There are also a few simple example programs available in the
> contrib/examples/ directory.  Don't hesitate to contact
> us at <libexif-devel@lists.sourceforge.net> if you have any questions
> on how to use libexif.

So what should we do about this patch? just drop it?
Best

Julien

>
> On Thu, 3 Aug 2023 at 15:29, Julien Stephan <jstephan@baylibre.com> wrote=
:
> >
> > adds ptest support for libexif
> >
> > Ptest was executed on a core-image-minimal:
> > root@qemux86-64:~# ptest-runner libexif
> > START: ptest-runner
> > 2023-07-12T15:45
> > BEGIN: /usr/lib/libexif/ptest
> > [...]
> > i=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > All 13 tests passed
> > (1 test was not run)
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > [...]
> > DURATION: 35
> > END: /usr/lib/libexif/ptest
> > 2023-07-12T15:45
> > STOP: ptest-runner
> > TOTAL: 1 FAIL: 0
> >
> > Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> > ---
> >  .../distro/include/ptest-packagelists.inc     |  1 +
> >  ...-serial-tests-config-needed-by-ptest.patch | 26 ++++++++++++++++
> >  .../recipes-support/libexif/libexif/run-ptest |  3 ++
> >  .../recipes-support/libexif/libexif_0.6.24.bb | 30 ++++++++++++++++++-
> >  4 files changed, 59 insertions(+), 1 deletion(-)
> >  create mode 100644 meta/recipes-support/libexif/libexif/0001-Add-seria=
l-tests-config-needed-by-ptest.patch
> >  create mode 100644 meta/recipes-support/libexif/libexif/run-ptest
> >
> > diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/con=
f/distro/include/ptest-packagelists.inc
> > index 6250cf081e0..bbbef5b0431 100644
> > --- a/meta/conf/distro/include/ptest-packagelists.inc
> > +++ b/meta/conf/distro/include/ptest-packagelists.inc
> > @@ -75,6 +75,7 @@ PTESTS_FAST =3D "\
> >      slang \
> >      wayland \
> >      zlib \
> > +    libexif \
> >  "
> >  PTESTS_FAST:append:libc-glibc =3D " glibc-tests"
> >  PTESTS_PROBLEMS:remove:libc-glibc =3D "glibc-tests"
> > diff --git a/meta/recipes-support/libexif/libexif/0001-Add-serial-tests=
-config-needed-by-ptest.patch b/meta/recipes-support/libexif/libexif/0001-A=
dd-serial-tests-config-needed-by-ptest.patch
> > new file mode 100644
> > index 00000000000..505aa073309
> > --- /dev/null
> > +++ b/meta/recipes-support/libexif/libexif/0001-Add-serial-tests-config=
-needed-by-ptest.patch
> > @@ -0,0 +1,26 @@
> > +From 1ee7217c8ae724d793f9a9876c3608057a2ccbf8 Mon Sep 17 00:00:00 2001
> > +From: Julien Stephan <jstephan@baylibre.com>
> > +Date: Tue, 11 Jul 2023 16:07:54 +0200
> > +Subject: [PATCH] Add serial-tests config needed by ptest
> > +
> > +Add serial-tests support, ptest needs it.
> > +
> > +Upstream-Status: Inappropriate [oe specific]
> > +
> > +Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> > +---
> > + configure.ac | 1 +
> > + 1 file changed, 1 insertion(+)
> > +
> > +diff --git a/configure.ac b/configure.ac
> > +index cd48047..5413907 100644
> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -16,6 +16,7 @@ AM_INIT_AUTOMAKE([
> > +   dist-zip
> > +   check-news
> > +   subdir-objects
> > ++  serial-tests
> > + ])
> > + AM_MAINTAINER_MODE
> > +
> > diff --git a/meta/recipes-support/libexif/libexif/run-ptest b/meta/reci=
pes-support/libexif/libexif/run-ptest
> > new file mode 100644
> > index 00000000000..2d23159eb03
> > --- /dev/null
> > +++ b/meta/recipes-support/libexif/libexif/run-ptest
> > @@ -0,0 +1,3 @@
> > +#!/bin/sh
> > +
> > +make -o Makefile runtest-TESTS
> > diff --git a/meta/recipes-support/libexif/libexif_0.6.24.bb b/meta/reci=
pes-support/libexif/libexif_0.6.24.bb
> > index 367f012f8cf..27e369a89a5 100644
> > --- a/meta/recipes-support/libexif/libexif_0.6.24.bb
> > +++ b/meta/recipes-support/libexif/libexif_0.6.24.bb
> > @@ -11,12 +11,40 @@ def version_underscore(v):
> >      return "_".join(v.split("."))
> >
> >  SRC_URI =3D "${GITHUB_BASE_URI}/download/v${PV}/libexif-${PV}.tar.bz2 =
\
> > +           file://0001-Add-serial-tests-config-needed-by-ptest.patch \
> > +           file://run-ptest \
> >             "
> >
> >  SRC_URI[sha256sum] =3D "d47564c433b733d83b6704c70477e0a4067811d184ec56=
5258ac563d8223f6ae"
> >
> > -inherit autotools gettext github-releases
> > +inherit autotools gettext github-releases ptest
> >
> >  EXTRA_OECONF +=3D "--disable-docs"
> >
> > +do_compile_ptest() {
> > +    oe_runmake -C test buildtest-TESTS
> > +}
> > +
> > +do_install_ptest() {
> > +    install ${B}/test/test*[!\.o] ${D}${PTEST_PATH}
> > +    for f in ${D}${PTEST_PATH}/test*; do
> > +        sed -i "s/\(LD_LIBRARY_PATH=3D\).*\(:\$LD_LIBRARY_PATH\)\"/\1.=
\2/" $f
> > +    done
> > +
> > +    install ${B}/test/Makefile ${D}${PTEST_PATH}
> > +    sed -i -e "/^srcdir/c srcdir =3D \$\{PWD\}" ${D}${PTEST_PATH}/Make=
file
> > +
> > +    install -d ${D}${PTEST_PATH}/nls
> > +    install ${B}/test/nls/*[!\.o] ${D}${PTEST_PATH}/nls
> > +    install -d ${D}${PTEST_PATH}/.libs
> > +    install ${B}/test/.libs/* ${D}${PTEST_PATH}/.libs
> > +
> > +    install ${S}/test/*.sh ${D}${PTEST_PATH}
> > +
> > +    install -d ${D}${PTEST_PATH}/testdata
> > +    install ${S}/test/testdata/* ${D}${PTEST_PATH}/testdata
> > +}
> > +
> > +RDEPENDS:${PN}-ptest +=3D "make bash"
> > +
> >  BBCLASSEXTEND =3D "native nativesdk"
> > --
> > 2.41.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#185477): https://lists.openembedded.org/g/openembed=
ded-core/message/185477
> > Mute This Topic: https://lists.openembedded.org/mt/100525801/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alex.kanavin@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

