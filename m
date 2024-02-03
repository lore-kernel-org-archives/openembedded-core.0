Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1219DC4828D
	for <webhook@archiver.kernel.org>; Sat,  3 Feb 2024 07:53:10 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.13403.1706946786351546429
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Feb 2024 23:53:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eDUZEByG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40ef6bbb61fso23363905e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 23:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1706946784; x=1707551584; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yitrVTr3WpBjgYQxeNmyWtV4xdM8gEWVpTcMWUIwgNw=;
        b=eDUZEByGHi+aYazDDfJmH8RGmVvwxjNlArEBf4lxGPW/xvPBBuKf2sQ5fTO1vlRyIF
         qoHef4yr1TKfjwo2FdI8TFOvZ3K4BlQ91XBfZWMnRHkwRunLSY4Y9scR7LG9URdnfjBV
         5lUPtegGp/kFcBmUZjUvaN1RX55fnsnWZTB7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706946784; x=1707551584;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yitrVTr3WpBjgYQxeNmyWtV4xdM8gEWVpTcMWUIwgNw=;
        b=S7N7JTsAOIagn/XK4oC3Hb7E5tzb+nDfJ3YzHtXB9dxRY0FHm4IO5lK5niM5hLq8lF
         mccV+0ig+Xw46WzxOPkQP/0f6RyuPwH68LBm3JWd/1dFGcoO4l7IGxp4bo8SiJVFJqsI
         oJ59+WnXdJP8/NPaMPS1kfQSBjbJnXmlEc+jyAU0fqHMQuQh/fNYtXUEGsn5sqG865jW
         8GfKzySELbTVtMrofRyjd51tPwKmKewksL8def9xfIbddj6LCNVnDCnkUf3xK0CmEtos
         xNatxdteVa9WhYus41FPo0gyZ86lh395fnxqK06sXgJ7Flug/2h7JIDIK9PcZMaFJIPN
         23Gg==
X-Gm-Message-State: AOJu0YyvZyE5oun2hxOuKlSr1WciXzZ60QF65FVbG45avYCgs9i86YU9
	nJdOulgbzyDSsv0puPqmesmQTJD5/0ULn/u6eyLS4VyBg9ZxNk3tRw5wEK6Guwg=
X-Google-Smtp-Source: AGHT+IGMukBnO8CwRiwP7+H1r8e+el2+LP6zEfZHdiOHfZTWLMbDSs0C7hn4XJEfIhr2+n/6+ILeqw==
X-Received: by 2002:a05:600c:1d02:b0:40f:c3ca:713c with SMTP id l2-20020a05600c1d0200b0040fc3ca713cmr389376wms.36.1706946784222;
        Fri, 02 Feb 2024 23:53:04 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:5be5:6aa5:96ae:21ea? ([2001:8b0:aba:5f3c:5be5:6aa5:96ae:21ea])
        by smtp.gmail.com with ESMTPSA id iv15-20020a05600c548f00b0040e9d507424sm2088718wmb.5.2024.02.02.23.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 23:53:03 -0800 (PST)
Message-ID: <8fbde10440b97a7d1fae483c192b9d17c450124d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] gcc-runtime: Move gdb pretty printer file
 to auto-load location
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Sat, 03 Feb 2024 07:53:02 +0000
In-Reply-To: <CAMKF1sonSbNt3bsxBznXXTxEErULs57op81VSbyx_dHB2kPZzg@mail.gmail.com>
References: <20240130162049.2019289-1-raj.khem@gmail.com>
	 <ebb2eb6d1384624d6c293ce194891ee5c001da1d.camel@linuxfoundation.org>
	 <CAMKF1sonSbNt3bsxBznXXTxEErULs57op81VSbyx_dHB2kPZzg@mail.gmail.com>
Autocrypt: addr=richard.purdie@linuxfoundation.org; prefer-encrypt=mutual; keydata=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
 YNvg==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Feb 2024 07:53:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194830

On Fri, 2024-02-02 at 16:23 -0800, Khem Raj wrote:
> On Fri, Feb 2, 2024 at 2:58=E2=80=AFPM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >=20
> > On Tue, 2024-01-30 at 08:20 -0800, Khem Raj wrote:
> > > When debugging a C++ program on target using libcstdc++, gdb does not
> > > find the pretty printer python support, this is because the init file=
 is
> > > installed into /usr/lib which is excluded from gdb's default list of
> > > directories to load config's from, where as defaults to load from
> > > datadir is still on, it therefore does not load this file
> > >=20
> > > warning: File "/usr/lib/libstdc++.so.6.0.33-gdb.py" auto-loading has =
been declined by your `auto-load safe-path' set to "$debugdir:$datadir/auto=
-load".
> > >=20
> > > This leaves the libstdc++ pretty-printers disabled even though added =
via
> > > IMAGE_INSTALL +=3D "gcc-runtime-dbg"
> > >=20
> > > Add missing runtime dependency on datetime python module for the pret=
ty
> > > printer to work/load successfully.
> > >=20
> > > Once the pretty-printer gdb file is moved out of libdir, it may becom=
e
> > > empty therefore delete it if its empty.
> > >=20
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > > v2: Fix build on mingw
> > >=20
> > >  meta/recipes-devtools/gcc/gcc-runtime.inc | 9 ++++++++-
> > >  1 file changed, 8 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes=
-devtools/gcc/gcc-runtime.inc
> > > index 64b6168ba76..004deb6e41f 100644
> > > --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> > > +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> > > @@ -85,6 +85,8 @@ do_install () {
> > >               cd ${B}/${TARGET_SYS}/$d/
> > >               oe_runmake 'DESTDIR=3D${D}' MULTIBUILDTOP=3D${B}/${TARG=
ET_SYS}/$d/ install
> > >       done
> > > +     install -d ${D}${datadir}/gdb/auto-load/${libdir}
> > > +     mv ${D}${libdir}/libstdc++*-gdb.py ${D}${datadir}/gdb/auto-load=
/${libdir}
> > >       if [ -d ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include ]; then
> > >               install -d ${D}${libdir}/${TARGET_SYS}/${BINV}/include
> > >               mv ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include/* ${=
D}${libdir}/${TARGET_SYS}/${BINV}/include
> > > @@ -99,6 +101,9 @@ do_install () {
> > >       if [ -d ${D}${infodir} ]; then
> > >               rmdir --ignore-fail-on-non-empty -p ${D}${infodir}
> > >       fi
> > > +     if [ -d ${D}${libdir} ]; then
> > > +             rmdir --ignore-fail-on-non-empty -p ${D}${libdir}
> > > +     fi
> > >  }
> > >=20
> > >  do_install:append:class-target () {
> > > @@ -182,9 +187,11 @@ RRECOMMENDS:${PN}-dbg =3D ""
> > >=20
> > >  # include python debugging scripts
> > >  FILES:${PN}-dbg +=3D "\
> > > -    ${libdir}/libstdc++.*-gdb.py \
> > >      ${datadir}/gcc-${BINV}/python/libstdcxx \
> > > +    ${datadir}/gdb/auto-load \
> > >  "
> > > +# Needed by libstdcxx pretty printer
> > > +RDEPENDS:${PN}-dbg +=3D "python3-datetime"
> > >=20
> > >  FILES:libg2c =3D "${target_libdir}/libg2c.so.*"
> > >  SUMMARY:libg2c =3D "Companion runtime library for g77"
> >=20
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/6381/=
steps/14/logs/stdio
> >=20
> > Missing or unbuildable dependency chain was: ['selftest-ed',
> > 'virtual/x86_64-poky-linux-compilerlibs', 'python3-datetime', 'bash']
> >=20
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/8533
>=20
> Hmm, so I wonder if using RRECOMMEND is better here. Where is bash
> being pulled from ?

bash appears to be a dependency of python3-datetime. I don't think a
RRECOMMEND will help unfortunately.

Cheers,

Richard





