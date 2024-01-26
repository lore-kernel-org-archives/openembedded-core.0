Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1598C47422
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 18:55:43 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web11.1075.1706295342961034974
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 10:55:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AMgEGcco;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-20503dc09adso437892fac.2
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 10:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706295342; x=1706900142; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cr7Q1j6ZAFgRGO+J9GE9wHaNK2SmRge1BZg28OBmhjQ=;
        b=AMgEGccoY6zx3MM4b95ra9MZYDq3BNkBdnz8dtk75zRUGc3/EoV3nTPipaKm6i70FF
         d9DE19b/0RdRTA39HuQQqrl5jTrwLzCPgT/IQcP8XoTOFFGDV/+J8+WOvcVE16wL5M5V
         lE6fEB4DUHoiZiYi+Alb6L3QMZYI/PmCupZWJsH0j3ICrMVlOWzrZ41+l4Yv5uRSfRbO
         G4Ha58zEAMwDebLgWTgNV3x79jMc5A1RPRwH4czNNcgEEgJE9MzDbX61D7DJFuA9o1vH
         uWHIoJ0nqxsrNrko3EoJWqcn9OMiB5ZtK6bEtxMJaL6UgoAfedNq2IMgQSRH1C5swlSY
         nV2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706295342; x=1706900142;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cr7Q1j6ZAFgRGO+J9GE9wHaNK2SmRge1BZg28OBmhjQ=;
        b=lK7BB0T1e5ZA6pOeOKgWdvnAYFj86tskOAONJFXPvFhcjFcHA1Od4ALnsErHb9mh2p
         b1kz1unAbGCCHghQ6r/B5L9Jd1zMsZE5qc83n55DJN530Mq46fIhL5TVU3utUZOGKUqz
         tR+IAaGczUUE399o46qvVibb15dGwZri6WdeNdpaWNcwM+V3pbQbFwAdebvwPkaL2LUK
         1lC1ONWKTL/B/TtfGoYhOHMFTHuYQSAmJniTq6Ib6sEtnN8VA5QVv7lwHXQoISHXoMoW
         wj3sgvF8IR0/NEDgkaKSfd/MMFCwvS+EE/XvO4xo4J3PrTAI4gM9CfcIiQt4joV1LG2z
         U4pA==
X-Gm-Message-State: AOJu0YwnoaE4tsb6kS9+k+NB8VKF/Fcg4KS1y1IoCApCzAAjMFXlD/fT
	oOp6jW0hbzNEv4f0sxVVlcndfYg1jzynjeDPdfL4zTYYlf/rU0W/ahAF0tyTWtLzogz7E+kdo2j
	APP+kVVPtsPkizLFEJm9hnjaEcWMX9K6TKRVnDg==
X-Google-Smtp-Source: AGHT+IEqZEJfGrPfIEr4eHf1UBDXT2j3wdq31OFkY6y0bSz3m8TLDnYGN+MbAdyG6HaoxzNSCcDnfX1oDWVAYB55mbk=
X-Received: by 2002:a05:6871:54b:b0:215:8:c544 with SMTP id
 t11-20020a056871054b00b002150008c544mr98789oal.36.1706295342214; Fri, 26 Jan
 2024 10:55:42 -0800 (PST)
MIME-Version: 1.0
References: <436ae552-2fad-8de3-9435-b03df2d2a823@crashcourse.ca>
In-Reply-To: <436ae552-2fad-8de3-9435-b03df2d2a823@crashcourse.ca>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 26 Jan 2024 10:55:16 -0800
Message-ID: <CAMKF1sqO+izPybMT2j+S699RRgB7psge1hYA2r455C6z8AW7Lg@mail.gmail.com>
Subject: Re: [OE-core] trying to create simple example of "externalsrc" recipe
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 18:55:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194402

On Fri, Jan 26, 2024 at 4:46=E2=80=AFAM Robert P. J. Day <rpjday@crashcours=
e.ca> wrote:
>
>
>   i've been trying to put together a really basic example of a recipe
> using "externalsrc" that refers to some local source, and cannot get
> it to work. so here's what i'm trying.
>
>   as a demo, i selected a random simple OE recipe -- in this case,
> "dmidecode", whose recipe you can see here (and which seems
> conveniently simple for demonstration purposes):
>
> https://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools=
/dmidecode/dmidecode_3.5.bb?h=3Dmaster
>
> so to start, since the SRC_URI is a tarball, i downloaded the tarball
> so that i have the equivalent local source here:
>
>   $ ls /home/rpjday/oe/srcs/dmidecode-3.5
>   AUTHORS       dmioem.h     Makefile     util.c
>   biosdecode.c  dmiopt.c     man          util.h
>   config.h      dmiopt.h     NEWS         version.h
>   dmidecode.c   dmioutput.c  ownership.c  vpddecode.c
>   dmidecode.h   dmioutput.h  README       vpdopt.c
>   dmioem.c      LICENSE      types.h      vpdopt.h
>   $
>
>   as my first test, i set the build to the source directory in my
> dmid_1.0.bb recipe file:
>
>   inherit externalsrc
>   EXTERNALSRC =3D "/home/rpjday/oe/srcs/dmidecode-3.5"
>   EXTERNALSRC_BUILD =3D "${EXTERNALSRC}"
>
>   do_install() {
>     oe_runmake \
>         DESTDIR=3D"${D}" \
>         prefix=3D"${prefix}" \
>         sbindir=3D"${sbindir}" \
>         docdir=3D"${docdir}/${BPN}" \
>         mandir=3D"${mandir}" \
>         install
>
> then ran:
>
>   $ bitbake dmid
>
> sure enough, that build in the source directory, generating:
>
>   AUTHORS       dmidecode.o  dmioutput.h  ownership*   version.h
>   biosdecode*   dmioem.c     dmioutput.o  ownership.c  vpddecode*
>   biosdecode.c  dmioem.h     LICENSE      ownership.o  vpddecode.c
>   biosdecode.o  dmioem.o     Makefile     README       vpddecode.o
>   config.h      dmiopt.c     man/         types.h      vpdopt.c
>   dmidecode*    dmiopt.h     NEWS         util.c       vpdopt.h
>   dmidecode.c   dmiopt.o     oe-logs@     util.h       vpdopt.o
>   dmidecode.h   dmioutput.c  oe-workdir@  util.o
>
>   great, but i really want to build out-of-tree to preserve the
> pristine state of the source, so i followed the instructions and
> allowed EXTERNALSRC_BUILD to default to ${WORKDIR}/${BPN}-${PV}:
>
>   inherit externalsrc
>   EXTERNALSRC =3D "/home/rpjday/oe/srcs/dmidecode-3.5"
>   # EXTERNALSRC_BUILD =3D "${EXTERNALSRC}"
>
> so I did a "make clean" in the source directory to start with the
> pristine source (also deleted the "oe-" symlinks), then:
>
> $ bitbake dmid
> ... snip ...
> | NOTE: make -j 8
> DESTDIR=3D/home/rpjday/oe/builds/qemux86/tmp/work/core2-64-poky-linux/dmi=
d/1.0/image
> prefix=3D/usr sbindir=3D/usr/sbin docdir=3D/usr/share/doc/dmid
> mandir=3D/usr/share/man install
> | make: *** No rule to make target 'install'.  Stop.
> | ERROR: oe_runmake failed
>
>   from "bitbake -e dmid", i can see:
>
> S=3D"/home/rpjday/oe/srcs/dmidecode-3.5"
> WORKDIR=3D"/home/rpjday/oe/builds/qemux86/tmp/work/core2-64-poky-linux/dm=
id/1.0"
> B=3D"/home/rpjday/oe/builds/qemux86/tmp/work/core2-64-poky-linux/dmid/1.0=
/dmid-1.0"
>
> but there is nothing unloaded into the B directory; hence, the
> failure. in fact, the log file for the compile step is:
>
> DEBUG: Executing python function externalsrc_compile_prefunc
> NOTE: dmid: compiling from external source tree
> /home/rpjday/oe/srcs/dmidecode-3.5
> DEBUG: Python function externalsrc_compile_prefunc finished
> DEBUG: Executing python function fetcher_hashes_dummyfunc
> DEBUG: Python function fetcher_hashes_dummyfunc finished
> DEBUG: Executing shell function do_compile
> NOTE: nothing to compile
> DEBUG: Shell function do_compile finished
>
>   so ... what have i overlooked? did i grab an inappropriate sample
> recipe that does not support building out-of-tree? the build directory
> is empty, so i'm perusing the externalsrc.bbclass to see what i have
> misunderstood.

externalsrc is as good as the components build system since that's
what it relies on
so if the makery for that component does not support building out of
source tree then
externalsrc will fail doing so too, in such cases you set
EXTERNALSRC_BUILD =3D "${EXTERNALSRC}"
which is what you did in step 1.

Default is B =3D S in bitbake.conf, so that's what will be used for bare
make based recipes like dmidecode.

The example you chose, does require you to build inside the source
tree. If you want a
sample where S !=3D B then use something other than dmidecode, maybe
something like
https://github.com/jameskbride/cmake-hello-world

>
> rday
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194356): https://lists.openembedded.org/g/openembedde=
d-core/message/194356
> Mute This Topic: https://lists.openembedded.org/mt/103974993/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

