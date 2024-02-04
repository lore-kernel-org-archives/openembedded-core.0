Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84790C48286
	for <webhook@archiver.kernel.org>; Sun,  4 Feb 2024 19:07:00 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web10.45349.1707073619615630685
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Feb 2024 11:06:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dVib8znO;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-2191b085639so1436676fac.0
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Feb 2024 11:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707073619; x=1707678419; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vc5AYs8nMdodPa7lpcXt+3WFsac70Pf4M6EA1Q8+Kgg=;
        b=dVib8znOfMMqrOHk0m90vYf7jQjddwE3gWK74CLxnb6GwCdY4agBnH/Ekjv5Rq5W6o
         loJd3aI+2MvMJ803PAHtsu6ThU5uexvxaXi0gCdR7F/4za+A6Ns2cXKx4Gq/lNWtvMNN
         ySOk2AK0wDwRhQ1TUw3NHlk1GCNNF6e6iEuWdVeBTiJBpB2RavUM+hcZ2YKc5I6fSOAJ
         C+V4fTwSd6C2UOo7ElDFnAS+c0rLTdCQNiH/0AsiEcDfvmqYwIa5C0X6DHtmnwC2la6A
         y657iaDOAwmGgLP2PLsewzHvjSuWjk7kBMvsAVv7JrJM/Y2tTJBq9MNGWmXmY9XaJrYc
         E9MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707073619; x=1707678419;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vc5AYs8nMdodPa7lpcXt+3WFsac70Pf4M6EA1Q8+Kgg=;
        b=JmsVEMU8UwRsJFqNmbTPTy6uoQ6SSS2J2Lj1akkJi/ong1x5iA8A62WDJZEX/ezIBi
         +RG6Q7LglJ1dV0yOD1pGzFdGNz4I0veDmftwej1/sqJQk+oVdwvSK9JWKtBdCtrrso+w
         0rySdpYiee107NLDX+S0dcT44K2du523okargAnlbpEI9vqw9qTBkcIxwmFepjGv1tI4
         6oaOjYG8zIwOi91ILPbpSq5BUxL1o52eAqDIDumLpK9b2JvBfr3tqaVNVPMIcjjO1aOY
         y0d1m8zx0fd7mfGDRITsYAHxtOCbvXR51C6yGNXU9NdUiPtlTkyB6Rn7ggu1zqo8dd79
         nkvw==
X-Gm-Message-State: AOJu0YyKnVwnc/I2S6XAC0+g24QhVFzzhCgWvd5SRy2Smv0eXbxn7s/Y
	8p5BONo5ELMs4E9FutLZ7/bnrZa7dDYbNrXsI6AHOgqjhl75KegdNtwPXBzQlqVOE6oMLfzJ60F
	RYKN3p1jhaeEWtinHlg5iAe1h4B8=
X-Google-Smtp-Source: AGHT+IFbRAP0zpaaDgjbRWIygTQyFmwj5NLlMK7AZVV69lB92O9jSVL1HRO0/1KQ269+5gabsTcaBWAswQQiivyYG7w=
X-Received: by 2002:a05:6870:d612:b0:214:306d:3565 with SMTP id
 a18-20020a056870d61200b00214306d3565mr6062195oaq.54.1707073618813; Sun, 04
 Feb 2024 11:06:58 -0800 (PST)
MIME-Version: 1.0
References: <20240130162049.2019289-1-raj.khem@gmail.com> <ebb2eb6d1384624d6c293ce194891ee5c001da1d.camel@linuxfoundation.org>
 <CAMKF1sonSbNt3bsxBznXXTxEErULs57op81VSbyx_dHB2kPZzg@mail.gmail.com>
 <8fbde10440b97a7d1fae483c192b9d17c450124d.camel@linuxfoundation.org>
 <CANx9H-DzH90X_tYppX4QP4NO-b0EcfnJYTCrR7zynB23nCTuzg@mail.gmail.com>
 <d6d59a9f1a93d9805f2b80b70f0558f6d8e133bb.camel@linuxfoundation.org>
 <CANx9H-D+97bocuCA-eO078CZUd-58VXyW=3D4hGooiNfUhE5Sw@mail.gmail.com>
 <CAMKF1srq+5WJ379C0xLxJ3HSvaC9M-RbdgvpA_d6+UzbBg-FAg@mail.gmail.com> <3dc16f8476edcdde6eded1379fbaea6026f2ff7a.camel@linuxfoundation.org>
In-Reply-To: <3dc16f8476edcdde6eded1379fbaea6026f2ff7a.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 4 Feb 2024 11:06:32 -0800
Message-ID: <CAMKF1srhG1McRyr6_qZvDJbRQM8=HfFViiesiX8uDiT2oc4cOA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] gcc-runtime: Move gdb pretty printer file to
 auto-load location
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Tim Orling <ticotimo@gmail.com>, Trevor Gamblin <tgamblin@baylibre.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 04 Feb 2024 19:07:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194909

On Sun, Feb 4, 2024 at 11:04=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sun, 2024-02-04 at 10:00 -0800, Khem Raj wrote:
> > On Sun, Feb 4, 2024 at 8:37=E2=80=AFAM Tim Orling <ticotimo@gmail.com> =
wrote:
> > >
> > >
> > >
> > > On Sun, Feb 4, 2024 at 2:28=E2=80=AFAM Richard Purdie <richard.purdie=
@linuxfoundation.org> wrote:
> > > >
> > > > On Sat, 2024-02-03 at 19:55 -0800, Tim Orling wrote:
> > > > >
> > > > >
> > > > > On Fri, Feb 2, 2024 at 11:53=E2=80=AFPM Richard Purdie <richard.p=
urdie@linuxfoundation.org> wrote:
> > > > > > On Fri, 2024-02-02 at 16:23 -0800, Khem Raj wrote:
> > > > > > > On Fri, Feb 2, 2024 at 2:58=E2=80=AFPM Richard Purdie
> > > > > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > > > > >
> > > > > > > > On Tue, 2024-01-30 at 08:20 -0800, Khem Raj wrote:
> > > > > > > > > When debugging a C++ program on target using libcstdc++, =
gdb does not
> > > > > > > > > find the pretty printer python support, this is because t=
he init file is
> > > > > > > > > installed into /usr/lib which is excluded from gdb's defa=
ult list of
> > > > > > > > > directories to load config's from, where as defaults to l=
oad from
> > > > > > > > > datadir is still on, it therefore does not load this file
> > > > > > > > >
> > > > > > > > > warning: File "/usr/lib/libstdc++.so.6.0.33-gdb.py" auto-=
loading has been declined by your `auto-load safe-path' set to "$debugdir:$=
datadir/auto-load".
> > > > > > > > >
> > > > > > > > > This leaves the libstdc++ pretty-printers disabled even t=
hough added via
> > > > > > > > > IMAGE_INSTALL +=3D "gcc-runtime-dbg"
> > > > > > > > >
> > > > > > > > > Add missing runtime dependency on datetime python module =
for the pretty
> > > > > > > > > printer to work/load successfully.
> > > > > > > > >
> > > > > > > > > Once the pretty-printer gdb file is moved out of libdir, =
it may become
> > > > > > > > > empty therefore delete it if its empty.
> > > > > > > > >
> > > > > > > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > > > > > > ---
> > > > > > > > > v2: Fix build on mingw
> > > > > > > > >
> > > > > > > > >   meta/recipes-devtools/gcc/gcc-runtime.inc | 9 ++++++++-
> > > > > > > > >   1 file changed, 8 insertions(+), 1 deletion(-)
> > > > > > > > >
> > > > > > > > > diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/=
meta/recipes-devtools/gcc/gcc-runtime.inc
> > > > > > > > > index 64b6168ba76..004deb6e41f 100644
> > > > > > > > > --- a/meta/recipes-devtools/gcc/gcc-runtime.inc
> > > > > > > > > +++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
> > > > > > > > > @@ -85,6 +85,8 @@ do_install () {
> > > > > > > > >                cd ${B}/${TARGET_SYS}/$d/
> > > > > > > > >                oe_runmake 'DESTDIR=3D${D}' MULTIBUILDTOP=
=3D${B}/${TARGET_SYS}/$d/ install
> > > > > > > > >        done
> > > > > > > > > +     install -d ${D}${datadir}/gdb/auto-load/${libdir}
> > > > > > > > > +     mv ${D}${libdir}/libstdc++*-gdb.py ${D}${datadir}/g=
db/auto-load/${libdir}
> > > > > > > > >        if [ -d ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/in=
clude ]; then
> > > > > > > > >                install -d ${D}${libdir}/${TARGET_SYS}/${B=
INV}/include
> > > > > > > > >                mv ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}=
/include/* ${D}${libdir}/${TARGET_SYS}/${BINV}/include
> > > > > > > > > @@ -99,6 +101,9 @@ do_install () {
> > > > > > > > >        if [ -d ${D}${infodir} ]; then
> > > > > > > > >                rmdir --ignore-fail-on-non-empty -p ${D}${=
infodir}
> > > > > > > > >        fi
> > > > > > > > > +     if [ -d ${D}${libdir} ]; then
> > > > > > > > > +             rmdir --ignore-fail-on-non-empty -p ${D}${l=
ibdir}
> > > > > > > > > +     fi
> > > > > > > > >   }
> > > > > > > > >
> > > > > > > > >   do_install:append:class-target () {
> > > > > > > > > @@ -182,9 +187,11 @@ RRECOMMENDS:${PN}-dbg =3D ""
> > > > > > > > >
> > > > > > > > >   # include python debugging scripts
> > > > > > > > >   FILES:${PN}-dbg +=3D "\
> > > > > > > > > -    ${libdir}/libstdc++.*-gdb.py \
> > > > > > > > >       ${datadir}/gcc-${BINV}/python/libstdcxx \
> > > > > > > > > +    ${datadir}/gdb/auto-load \
> > > > > > > > >   "
> > > > > > > > > +# Needed by libstdcxx pretty printer
> > > > > > > > > +RDEPENDS:${PN}-dbg +=3D "python3-datetime"
> > > > > > > > >
> > > > > > > > >   FILES:libg2c =3D "${target_libdir}/libg2c.so.*"
> > > > > > > > >   SUMMARY:libg2c =3D "Companion runtime library for g77"
> > > > > > > >
> > > > > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/87/=
builds/6381/steps/14/logs/stdio
> > > > > > > >
> > > > > > > > Missing or unbuildable dependency chain was: ['selftest-ed'=
,
> > > > > > > > 'virtual/x86_64-poky-linux-compilerlibs', 'python3-datetime=
', 'bash']
> > > > > > > >
> > > > > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/89/=
builds/8533
> > > > > > >
> > > > > > > Hmm, so I wonder if using RRECOMMEND is better here. Where is=
 bash
> > > > > > > being pulled from ?
> > > > > >
> > > > > > bash appears to be a dependency of python3-datetime. I don't th=
ink a
> > > > > > RRECOMMEND will help unfortunately.
> > > > > >
> > > > >
> > > > >
> > > > > It seems to be required for tests/ (test_venv.py, test_subprocess=
.py and test_zipfile/test_core.py are the obvious ones)
> > > > > https://github.com/search?q=3Drepo%3Apython%2Fcpython+%28%22bash%=
22+OR+%22bash+required%22%29+path%3A%2F%5ELib%5C%2Ftest%5C%2F%2F&type=3Dcod=
e
> > > > >
> > > > > I didn=E2=80=99t see any hard requirement in Lib/datetime.py nor =
its test cases. But searching on a phone can lead to missing things=E2=80=
=A6
> > > >
> > > > The dependency is definitely coming from the python3 tests.
> > > >
> > > > It looks like whilst the python3-ptest is conditional on enabling
> > > > ptests, the python3-tests package is not, and it is that which cont=
ains
> > > > the bash dependency.
> > > >
> > > So perhaps we should rework python3 recipe to package tests/ into -pt=
est?
> >
> > if test package is pulling in bash and imposing it on non ptest builds
> > then it would be good to
> > fix that.
>
> I've sent a couple of patches which create a common "no-gplv3" include
> file and move configuration there which works around this.
>

ah thanks Richard. So ignore v3 of this patch and take this one ( v2 ) inst=
ead.

> Cheers,
>
> Richard

