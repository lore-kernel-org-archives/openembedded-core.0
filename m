Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1667C4828F
	for <webhook@archiver.kernel.org>; Sat,  3 Feb 2024 00:24:27 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web11.8261.1706919859581225554
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Feb 2024 16:24:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GnQQPxjj;
 spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6e117eec348so1604341a34.2
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 16:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706919859; x=1707524659; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R7xcvGiLDiPar/a3XT2b6nSucz9XD5KZm2RcrjMfaiY=;
        b=GnQQPxjj0TtZ1qh/cUK/nIT04QP/T9ZnnruQ0ioMNuBn2jRp8ZTdOeBIMYHsiultr0
         eipdxmfJu/hqqtMR9TdjIJp9tgGIKkbZDqZ2TadWoSUwr1FySt6tHeHavOnvIy9NRhT0
         pNaccULNZTKBT1jNA7hQIuOXcX/u2Oo7iO/MDUyRiXdMwhaFO1B4l6CpKaY7tgdLz+H3
         T1f4VvqmXFQ3Rel4F9DQIucqlhCTkeJSewe5+XEbJrtFBa+gLD2Cg6u30NkVSQ6vapbt
         aKe+JAsvbRwtMUJyDeE2xIcNWGfAlf++bG9les0T8//m/MkXb8IraouqiDBKNtEGGlHl
         PKzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706919859; x=1707524659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R7xcvGiLDiPar/a3XT2b6nSucz9XD5KZm2RcrjMfaiY=;
        b=P2xVZr0QwA3IaxVFF2YDOz6kkmToNmINTmdHNwCEl+zXgtY7/ihAfJRNOCCGJznp3d
         Gm5gwU1fXJHP9vEajlnSKG51vM7jiHRuP3iUozCZeXSRxnUEBWe15FZBHA1YemB7uE8a
         Y4B15YLIvJdFwTaSmDjlLCjRYepR3owrSIUgYcKtiY5zkRrNqUmREWdIZILGFCbPwX4J
         J2Q4ExUnP96dX4rgD/lCXeQSyGk+yUgB5qn4lyrFicWr3UpjkcSnW9OYRobWV2cjVHuI
         uea8LSGwwFT03x9mBFz7MwYKheGdki6N0BFoExYa+cu8XupwkQa+o+j8Wm1nFnO6SxlV
         z+Tg==
X-Gm-Message-State: AOJu0YzTdNGWVv9ZsRfy2es/CFlvRr+bpGCO8iXvwejBBmFm+mzdMe9j
	FO/keJ+XaBcVuEK5El9kwq1+NXvPrcvsKAf2R1A8nXG1eelRQrHvU+QqQE0jES2wXVDW98ctJvl
	O/VL5qhNLHMLDiULJcaQ50T9vFDE=
X-Google-Smtp-Source: AGHT+IGChAq/26rXIvYWvVlRd0IiyhokVY9d85a0DtvOp6sQA/s8gdD3tF5xJWsbfD4Tle6m7zd8jpLThSd8j0Qc0AY=
X-Received: by 2002:a05:6870:1596:b0:219:e17:795f with SMTP id
 j22-20020a056870159600b002190e17795fmr1327441oab.42.1706919858727; Fri, 02
 Feb 2024 16:24:18 -0800 (PST)
MIME-Version: 1.0
References: <20240130162049.2019289-1-raj.khem@gmail.com> <ebb2eb6d1384624d6c293ce194891ee5c001da1d.camel@linuxfoundation.org>
In-Reply-To: <ebb2eb6d1384624d6c293ce194891ee5c001da1d.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 2 Feb 2024 16:23:52 -0800
Message-ID: <CAMKF1sonSbNt3bsxBznXXTxEErULs57op81VSbyx_dHB2kPZzg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] gcc-runtime: Move gdb pretty printer file to
 auto-load location
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 00:24:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194822

On Fri, Feb 2, 2024 at 2:58=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2024-01-30 at 08:20 -0800, Khem Raj wrote:
> > When debugging a C++ program on target using libcstdc++, gdb does not
> > find the pretty printer python support, this is because the init file i=
s
> > installed into /usr/lib which is excluded from gdb's default list of
> > directories to load config's from, where as defaults to load from
> > datadir is still on, it therefore does not load this file
> >
> > warning: File "/usr/lib/libstdc++.so.6.0.33-gdb.py" auto-loading has be=
en declined by your `auto-load safe-path' set to "$debugdir:$datadir/auto-l=
oad".
> >
> > This leaves the libstdc++ pretty-printers disabled even though added vi=
a
> > IMAGE_INSTALL +=3D "gcc-runtime-dbg"
> >
> > Add missing runtime dependency on datetime python module for the pretty
> > printer to work/load successfully.
> >
> > Once the pretty-printer gdb file is moved out of libdir, it may become
> > empty therefore delete it if its empty.
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > v2: Fix build on mingw
> >
> >  meta/recipes-devtools/gcc/gcc-runtime.inc | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-d=
evtools/gcc/gcc-runtime.inc
> > index 64b6168ba76..004deb6e41f 100644
> > --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> > @@ -85,6 +85,8 @@ do_install () {
> >               cd ${B}/${TARGET_SYS}/$d/
> >               oe_runmake 'DESTDIR=3D${D}' MULTIBUILDTOP=3D${B}/${TARGET=
_SYS}/$d/ install
> >       done
> > +     install -d ${D}${datadir}/gdb/auto-load/${libdir}
> > +     mv ${D}${libdir}/libstdc++*-gdb.py ${D}${datadir}/gdb/auto-load/$=
{libdir}
> >       if [ -d ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include ]; then
> >               install -d ${D}${libdir}/${TARGET_SYS}/${BINV}/include
> >               mv ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/* ${D}=
${libdir}/${TARGET_SYS}/${BINV}/include
> > @@ -99,6 +101,9 @@ do_install () {
> >       if [ -d ${D}${infodir} ]; then
> >               rmdir --ignore-fail-on-non-empty -p ${D}${infodir}
> >       fi
> > +     if [ -d ${D}${libdir} ]; then
> > +             rmdir --ignore-fail-on-non-empty -p ${D}${libdir}
> > +     fi
> >  }
> >
> >  do_install:append:class-target () {
> > @@ -182,9 +187,11 @@ RRECOMMENDS:${PN}-dbg =3D ""
> >
> >  # include python debugging scripts
> >  FILES:${PN}-dbg +=3D "\
> > -    ${libdir}/libstdc++.*-gdb.py \
> >      ${datadir}/gcc-${BINV}/python/libstdcxx \
> > +    ${datadir}/gdb/auto-load \
> >  "
> > +# Needed by libstdcxx pretty printer
> > +RDEPENDS:${PN}-dbg +=3D "python3-datetime"
> >
> >  FILES:libg2c =3D "${target_libdir}/libg2c.so.*"
> >  SUMMARY:libg2c =3D "Companion runtime library for g77"
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/6381/st=
eps/14/logs/stdio
>
> Missing or unbuildable dependency chain was: ['selftest-ed',
> 'virtual/x86_64-poky-linux-compilerlibs', 'python3-datetime', 'bash']
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/8533

Hmm, so I wonder if using RRECOMMEND is better here. Where is bash
being pulled from ?

>
> Cheers,
>
> Richard
>

