Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84D4DC001E0
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 16:49:47 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web10.22731.1691686185395206519
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 09:49:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=mPuYw4PJ;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3a36b52b4a4so724433b6e.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 09:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691686184; x=1692290984;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/Ncx/dTyf2D6m5ezjs1gVGUhujrogLxFXf1Nv/dogKg=;
        b=mPuYw4PJ901ylDyzIrKQJF8H4Iz4Kml8KSWxomLe42FD1FxLkWt5mkZxts8vgw9wW1
         8Ca+DuUbVWG0+3SQr5EYg3O1WilnxLz5wufvLAsrI0Ti/5k0OgMjH2DCIZUrfAb9pbCG
         OA2JEeqLbsO/JB3HwF4KtDukGQM+kiP9H8Dna9EPeP/OIEMSjeNAuFV/RR9YCtja+k9+
         PhXDd9FenQoeKRId0hySpvf8owLaLj3jN5ORSzOs7s2v3SyutKbm80UweYdnJw+dQsB5
         Ia7lSOcRlrCrrN1aqy8XM3AxV9HxvbF9C736t/koI31d8P9y5E1xVsCJAbf++jOjqbr+
         1Z7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691686184; x=1692290984;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Ncx/dTyf2D6m5ezjs1gVGUhujrogLxFXf1Nv/dogKg=;
        b=X+j0es615pYyj1kY2PSBi550rNufHEqzj/5MGnCpjiuCj6hZirU5g0ssOiHGpJdy1I
         V1caFiRGSePRvgrFqQViVqaufIv7tU7rUJcfZhmzTZUckSqz8DSceHBXBo5R5JYQV49X
         3diWO+VEsuHNoIo1/wZzx1mNIIXzD5WBqt00MU2/W1k8/aGqlYAAoJ47K8+904TL+z5W
         kmbZ9ONgXRRJGUrBLRrmVQfZwCSkNYGTi16jmbvpCsVIoZ6foRVEKnLOop2ixE876+jP
         k4ToJ7BI5JBJBIxn7D601ep06/RReSrVayxjdDSB+It5+ymsIgd/x5kVUDqHbyhsmTRO
         be4g==
X-Gm-Message-State: AOJu0YzWJMQdzvsnE78BxTgDfUpp1unlXCGsuiqL7QlPi9/0zECCxdjp
	Oij8ExBsaMQXCvU1PueKiWIF/1GLB+nd2EEplqY=
X-Google-Smtp-Source: AGHT+IHRPz1padDVUSJ17nNbG2dsYB57hsqn3Cukgg5TSwdLIi0RI3/loQncipBy8wzI867gPeGVdnzDgi/OnZrreFw=
X-Received: by 2002:a05:6808:4386:b0:3a7:5346:fcee with SMTP id
 dz6-20020a056808438600b003a75346fceemr1423358oib.0.1691686184475; Thu, 10 Aug
 2023 09:49:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230809210227.2723296-1-raj.khem@gmail.com> <202308101305271063afd1@mail.local>
 <CAMKF1spTEw_xWVHwjbxV+fHTeqz-nvJjGYQU6Jn239ft3Aky0A@mail.gmail.com>
 <CAMKF1sr3M5H9YyRMaeER-EVD95LW4K3brt-30hpDLdX4rLXgSA@mail.gmail.com> <202308101501147a222eb2@mail.local>
In-Reply-To: <202308101501147a222eb2@mail.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 10 Aug 2023 09:49:33 -0700
Message-ID: <CAMKF1soiY8ZQRARTEHamONMVRsYMquf9hkZU=P2XGrcqKxqBhQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd-boot: Fix build on musl
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000018e0c306029462c2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 16:49:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185819

--00000000000018e0c306029462c2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 10, 2023 at 8:01 AM Alexandre Belloni <
alexandre.belloni@bootlin.com> wrote:

> On 10/08/2023 07:45:16-0700, Khem Raj wrote:
> > On Thu, Aug 10, 2023 at 7:36=E2=80=AFAM Khem Raj <raj.khem@gmail.com> w=
rote:
> > >
> > >
> > >
> > > On Thu, Aug 10, 2023 at 6:05 AM Alexandre Belloni <
> alexandre.belloni@bootlin.com> wrote:
> > >>
> > >> Hello,
> > >>
> > >> I tested this with the meson/systemd series from Ross and it actuall=
y
> > >> breaks the build:
> > >>
> > >>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/7581/st=
eps/12/logs/stdio
> > >
> > >
> > > Patch applies only to musl builds did you test a musl + systemd
> >
> > ah 32bit, let me try to reproduce.
>
> It also happened on qemux86-64:
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/7604/st=
eps/11/logs/stdio
>

Yeah it=E2=80=99s more of clang vs gcc then 32 vs 64bit in my env


> >
> > >>
> > >>
> > >>
> > >> On 09/08/2023 14:02:27-0700, Khem Raj wrote:
> > >> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > >> > ---
> > >> >  .../0001-efi-Use-char16_t-on-musl.patch       | 79
> +++++++++++++++++++
> > >> >  meta/recipes-core/systemd/systemd-boot_254.bb |  2 +
> > >> >  2 files changed, 81 insertions(+)
> > >> >  create mode 100644
> meta/recipes-core/systemd/systemd-boot/0001-efi-Use-char16_t-on-musl.patc=
h
> > >> >
> > >> > diff --git
> a/meta/recipes-core/systemd/systemd-boot/0001-efi-Use-char16_t-on-musl.pa=
tch
> b/meta/recipes-core/systemd/systemd-boot/0001-efi-Use-char16_t-on-musl.pa=
tch
> > >> > new file mode 100644
> > >> > index 00000000000..1988d50ac90
> > >> > --- /dev/null
> > >> > +++
> b/meta/recipes-core/systemd/systemd-boot/0001-efi-Use-char16_t-on-musl.pa=
tch
> > >> > @@ -0,0 +1,79 @@
> > >> > +From efe1720de61534c814580fec61fe0025308482b2 Mon Sep 17 00:00:00
> 2001
> > >> > +From: Khem Raj <raj.khem@gmail.com>
> > >> > +Date: Tue, 8 Aug 2023 00:57:12 -0700
> > >> > +Subject: [PATCH] efi: Use char16_t on musl
> > >> > +
> > >> > +musl does not support configurations with under-sized definitions
> of
> > >> > +types like 16-bit wchar_t or 32-bit off_t. Only the sizes that ca=
n
> > >> > +represent the full range of values are supported. musl does howev=
er
> > >> > +have the C11 uchar.h functions which can operate on char16_t, so
> you
> > >> > +could use char16_t and the corresponding c16 conversion functions
> > >> > +instead of the wc versions
> > >> > +
> > >> > +Upstream-Status: Inappropriate [Musl specific]
> > >> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > >> > +---
> > >> > + src/boot/efi/efi-string.c                 | 2 +-
> > >> > + src/boot/efi/efi.h                        | 2 ++
> > >> > + src/boot/efi/meson.build                  | 1 -
> > >> > + src/fundamental/string-util-fundamental.h | 4 ++++
> > >> > + 4 files changed, 7 insertions(+), 2 deletions(-)
> > >> > +
> > >> > +diff --git a/src/boot/efi/efi-string.c b/src/boot/efi/efi-string.=
c
> > >> > +index 4400591255..421b2c262d 100644
> > >> > +--- a/src/boot/efi/efi-string.c
> > >> > ++++ b/src/boot/efi/efi-string.c
> > >> > +@@ -735,7 +735,7 @@ static bool
> handle_format_specifier(FormatContext *ctx, SpecifierContext *sp) {
> > >> > +         case 's':
> > >> > +                 if (sp->long_arg) {
> > >> > +                         sp->wstr =3D va_arg(ctx->ap, const wchar=
_t
> *) ?: L"(null)";
> > >> > +-                        sp->len =3D wcsnlen(sp->wstr, sp->len);
> > >> > ++                        sp->len =3D wcsnlen((char16_t*)sp->wstr,
> sp->len);
> > >> > +                 } else {
> > >> > +                         sp->str =3D va_arg(ctx->ap, const char *=
)
> ?: "(null)";
> > >> > +                         sp->len =3D strnlen8(sp->str, sp->len);
> > >> > +diff --git a/src/boot/efi/efi.h b/src/boot/efi/efi.h
> > >> > +index 5c34668383..459f675ea5 100644
> > >> > +--- a/src/boot/efi/efi.h
> > >> > ++++ b/src/boot/efi/efi.h
> > >> > +@@ -21,7 +21,9 @@ assert_cc(sizeof(uint8_t) =3D=3D 1);
> > >> > + assert_cc(sizeof(uint16_t) =3D=3D 2);
> > >> > + assert_cc(sizeof(uint32_t) =3D=3D 4);
> > >> > + assert_cc(sizeof(uint64_t) =3D=3D 8);
> > >> > ++#if defined(__linux__) && defined(__GLIBC__)
> > >> > + assert_cc(sizeof(wchar_t) =3D=3D 2);
> > >> > ++#endif
> > >> > + assert_cc(sizeof(char16_t) =3D=3D 2);
> > >> > + assert_cc(sizeof(char32_t) =3D=3D 4);
> > >> > + assert_cc(sizeof(size_t) =3D=3D sizeof(void *));
> > >> > +diff --git a/src/boot/efi/meson.build b/src/boot/efi/meson.build
> > >> > +index 1c52629651..4a64838295 100644
> > >> > +--- a/src/boot/efi/meson.build
> > >> > ++++ b/src/boot/efi/meson.build
> > >> > +@@ -132,7 +132,6 @@ efi_c_args =3D [
> > >> > +         '-DSD_BOOT=3D1',
> > >> > +         '-ffreestanding',
> > >> > +         '-fno-strict-aliasing',
> > >> > +-        '-fshort-wchar',
> > >> > +         '-include', 'efi_config.h',
> > >> > + ]
> > >> > +
> > >> > +diff --git a/src/fundamental/string-util-fundamental.h
> b/src/fundamental/string-util-fundamental.h
> > >> > +index 9019542b16..1b46f42995 100644
> > >> > +--- a/src/fundamental/string-util-fundamental.h
> > >> > ++++ b/src/fundamental/string-util-fundamental.h
> > >> > +@@ -16,7 +16,11 @@
> > >> > + #  define strncmp strncmp16
> > >> > + #  define strcasecmp strcasecmp16
> > >> > + #  define strncasecmp strncasecmp16
> > >> > ++#if defined (__linux__) && !defined(__GLIBC__)
> > >> > ++#  define STR_C(str)       (u ## str)
> > >> > ++#else
> > >> > + #  define STR_C(str)       (L ## str)
> > >> > ++#endif
> > >> > + typedef char16_t sd_char;
> > >> > + #else
> > >> > + #  define STR_C(str)       (str)
> > >> > +--
> > >> > +2.41.0
> > >> > +
> > >> > diff --git a/meta/recipes-core/systemd/systemd-boot_254.bb
> b/meta/recipes-core/systemd/systemd-boot_254.bb
> > >> > index 5d69cf83abc..ae86450d2a6 100644
> > >> > --- a/meta/recipes-core/systemd/systemd-boot_254.bb
> > >> > +++ b/meta/recipes-core/systemd/systemd-boot_254.bb
> > >> > @@ -1,6 +1,8 @@
> > >> >  require systemd.inc
> > >> >  FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/systemd:"
> > >> >
> > >> > +SRC_URI:append:libc-musl =3D "
> file://0001-efi-Use-char16_t-on-musl.patch "
> > >> > +
> > >> >  require conf/image-uefi.conf
> > >> >
> > >> >  DEPENDS =3D "intltool-native libcap util-linux gperf-native
> python3-jinja2-native python3-pyelftools-native"
> > >> > --
> > >> > 2.41.0
> > >> >
> > >>
> > >> >
> > >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >> > Links: You receive all messages sent to this group.
> > >> > View/Reply Online (#185718):
> https://lists.openembedded.org/g/openembedded-core/message/185718
> > >> > Mute This Topic:
> https://lists.openembedded.org/mt/100652047/3617179
> > >> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > >> > Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub [
> alexandre.belloni@bootlin.com]
> > >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >> >
> > >>
> > >>
> > >> --
> > >> Alexandre Belloni, co-owner and COO, Bootlin
> > >> Embedded Linux and Kernel engineering
> > >> https://bootlin.com
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

--00000000000018e0c306029462c2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Aug 10, 2023 at 8:01 AM Alexandre Belloni &lt;<a hr=
ef=3D"mailto:alexandre.belloni@bootlin.com">alexandre.belloni@bootlin.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 10/08/2023 07:45:1=
6-0700, Khem Raj wrote:<br>
&gt; On Thu, Aug 10, 2023 at 7:36=E2=80=AFAM Khem Raj &lt;<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br=
>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; On Thu, Aug 10, 2023 at 6:05 AM Alexandre Belloni &lt;<a href=3D"=
mailto:alexandre.belloni@bootlin.com" target=3D"_blank">alexandre.belloni@b=
ootlin.com</a>&gt; wrote:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Hello,<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; I tested this with the meson/systemd series from Ross and it =
actually<br>
&gt; &gt;&gt; breaks the build:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/bui=
lders/64/builds/7581/steps/12/logs/stdio" rel=3D"noreferrer" target=3D"_bla=
nk">https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/7581/=
steps/12/logs/stdio</a><br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Patch applies only to musl builds did you test a musl + systemd<b=
r>
&gt; <br>
&gt; ah 32bit, let me try to reproduce.<br>
<br>
It also happened on qemux86-64:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/45/build=
s/7604/steps/11/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/45/builds/7604/steps/11/logs/=
stdio</a><br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Yeah it=E2=80=99=
s more of clang vs gcc then 32 vs 64bit in my env=C2=A0</div><div dir=3D"au=
to"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><br>
&gt; <br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; On 09/08/2023 14:02:27-0700, Khem Raj wrote:<br>
&gt; &gt;&gt; &gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@g=
mail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt;&gt; &gt; ---<br>
&gt; &gt;&gt; &gt;=C2=A0 .../0001-efi-Use-char16_t-on-musl.patch=C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 79 +++++++++++++++++++<br>
&gt; &gt;&gt; &gt;=C2=A0 meta/recipes-core/systemd/<a href=3D"http://system=
d-boot_254.bb" rel=3D"noreferrer" target=3D"_blank">systemd-boot_254.bb</a>=
 |=C2=A0 2 +<br>
&gt; &gt;&gt; &gt;=C2=A0 2 files changed, 81 insertions(+)<br>
&gt; &gt;&gt; &gt;=C2=A0 create mode 100644 meta/recipes-core/systemd/syste=
md-boot/0001-efi-Use-char16_t-on-musl.patch<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; diff --git a/meta/recipes-core/systemd/systemd-boot/0001=
-efi-Use-char16_t-on-musl.patch b/meta/recipes-core/systemd/systemd-boot/00=
01-efi-Use-char16_t-on-musl.patch<br>
&gt; &gt;&gt; &gt; new file mode 100644<br>
&gt; &gt;&gt; &gt; index 00000000000..1988d50ac90<br>
&gt; &gt;&gt; &gt; --- /dev/null<br>
&gt; &gt;&gt; &gt; +++ b/meta/recipes-core/systemd/systemd-boot/0001-efi-Us=
e-char16_t-on-musl.patch<br>
&gt; &gt;&gt; &gt; @@ -0,0 +1,79 @@<br>
&gt; &gt;&gt; &gt; +From efe1720de61534c814580fec61fe0025308482b2 Mon Sep 1=
7 00:00:00 2001<br>
&gt; &gt;&gt; &gt; +From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com=
" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt;&gt; &gt; +Date: Tue, 8 Aug 2023 00:57:12 -0700<br>
&gt; &gt;&gt; &gt; +Subject: [PATCH] efi: Use char16_t on musl<br>
&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; +musl does not support configurations with under-sized d=
efinitions of<br>
&gt; &gt;&gt; &gt; +types like 16-bit wchar_t or 32-bit off_t. Only the siz=
es that can<br>
&gt; &gt;&gt; &gt; +represent the full range of values are supported. musl =
does however<br>
&gt; &gt;&gt; &gt; +have the C11 uchar.h functions which can operate on cha=
r16_t, so you<br>
&gt; &gt;&gt; &gt; +could use char16_t and the corresponding c16 conversion=
 functions<br>
&gt; &gt;&gt; &gt; +instead of the wc versions<br>
&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; +Upstream-Status: Inappropriate [Musl specific]<br>
&gt; &gt;&gt; &gt; +Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@=
gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt;&gt; &gt; +---<br>
&gt; &gt;&gt; &gt; + src/boot/efi/efi-string.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt; &gt;&gt; &gt; + src/boot/efi/efi.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 ++<br>
&gt; &gt;&gt; &gt; + src/boot/efi/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
&gt; &gt;&gt; &gt; + src/fundamental/string-util-fundamental.h | 4 ++++<br>
&gt; &gt;&gt; &gt; + 4 files changed, 7 insertions(+), 2 deletions(-)<br>
&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; +diff --git a/src/boot/efi/efi-string.c b/src/boot/efi/e=
fi-string.c<br>
&gt; &gt;&gt; &gt; +index 4400591255..421b2c262d 100644<br>
&gt; &gt;&gt; &gt; +--- a/src/boot/efi/efi-string.c<br>
&gt; &gt;&gt; &gt; ++++ b/src/boot/efi/efi-string.c<br>
&gt; &gt;&gt; &gt; +@@ -735,7 +735,7 @@ static bool handle_format_specifier=
(FormatContext *ctx, SpecifierContext *sp) {<br>
&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0case &#39;s&#39;:<br>
&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if (sp-&gt;long_arg) {<br>
&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sp-&gt;wstr =3D va_arg(ctx-&gt;ap, const=
 wchar_t *) ?: L&quot;(null)&quot;;<br>
&gt; &gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sp-&gt;len =3D wcsnlen(sp-&gt;wstr, sp-&gt;=
len);<br>
&gt; &gt;&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sp-&gt;len =3D wcsnlen((char16_t*)sp-&gt;ws=
tr, sp-&gt;len);<br>
&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0} else {<br>
&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sp-&gt;str =3D va_arg(ctx-&gt;ap, const =
char *) ?: &quot;(null)&quot;;<br>
&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sp-&gt;len =3D strnlen8(sp-&gt;str, sp-&=
gt;len);<br>
&gt; &gt;&gt; &gt; +diff --git a/src/boot/efi/efi.h b/src/boot/efi/efi.h<br=
>
&gt; &gt;&gt; &gt; +index 5c34668383..459f675ea5 100644<br>
&gt; &gt;&gt; &gt; +--- a/src/boot/efi/efi.h<br>
&gt; &gt;&gt; &gt; ++++ b/src/boot/efi/efi.h<br>
&gt; &gt;&gt; &gt; +@@ -21,7 +21,9 @@ assert_cc(sizeof(uint8_t) =3D=3D 1);<=
br>
&gt; &gt;&gt; &gt; + assert_cc(sizeof(uint16_t) =3D=3D 2);<br>
&gt; &gt;&gt; &gt; + assert_cc(sizeof(uint32_t) =3D=3D 4);<br>
&gt; &gt;&gt; &gt; + assert_cc(sizeof(uint64_t) =3D=3D 8);<br>
&gt; &gt;&gt; &gt; ++#if defined(__linux__) &amp;&amp; defined(__GLIBC__)<b=
r>
&gt; &gt;&gt; &gt; + assert_cc(sizeof(wchar_t) =3D=3D 2);<br>
&gt; &gt;&gt; &gt; ++#endif<br>
&gt; &gt;&gt; &gt; + assert_cc(sizeof(char16_t) =3D=3D 2);<br>
&gt; &gt;&gt; &gt; + assert_cc(sizeof(char32_t) =3D=3D 4);<br>
&gt; &gt;&gt; &gt; + assert_cc(sizeof(size_t) =3D=3D sizeof(void *));<br>
&gt; &gt;&gt; &gt; +diff --git a/src/boot/efi/meson.build b/src/boot/efi/me=
son.build<br>
&gt; &gt;&gt; &gt; +index 1c52629651..4a64838295 100644<br>
&gt; &gt;&gt; &gt; +--- a/src/boot/efi/meson.build<br>
&gt; &gt;&gt; &gt; ++++ b/src/boot/efi/meson.build<br>
&gt; &gt;&gt; &gt; +@@ -132,7 +132,6 @@ efi_c_args =3D [<br>
&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;-DSD_BOOT=3D1&#3=
9;,<br>
&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;-ffreestanding&#=
39;,<br>
&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;-fno-strict-alia=
sing&#39;,<br>
&gt; &gt;&gt; &gt; +-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;-fshort-wchar&#39;,<b=
r>
&gt; &gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;-include&#39;, &=
#39;efi_config.h&#39;,<br>
&gt; &gt;&gt; &gt; + ]<br>
&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; +diff --git a/src/fundamental/string-util-fundamental.h =
b/src/fundamental/string-util-fundamental.h<br>
&gt; &gt;&gt; &gt; +index 9019542b16..1b46f42995 100644<br>
&gt; &gt;&gt; &gt; +--- a/src/fundamental/string-util-fundamental.h<br>
&gt; &gt;&gt; &gt; ++++ b/src/fundamental/string-util-fundamental.h<br>
&gt; &gt;&gt; &gt; +@@ -16,7 +16,11 @@<br>
&gt; &gt;&gt; &gt; + #=C2=A0 define strncmp strncmp16<br>
&gt; &gt;&gt; &gt; + #=C2=A0 define strcasecmp strcasecmp16<br>
&gt; &gt;&gt; &gt; + #=C2=A0 define strncasecmp strncasecmp16<br>
&gt; &gt;&gt; &gt; ++#if defined (__linux__) &amp;&amp; !defined(__GLIBC__)=
<br>
&gt; &gt;&gt; &gt; ++#=C2=A0 define STR_C(str)=C2=A0 =C2=A0 =C2=A0 =C2=A0(u=
 ## str)<br>
&gt; &gt;&gt; &gt; ++#else<br>
&gt; &gt;&gt; &gt; + #=C2=A0 define STR_C(str)=C2=A0 =C2=A0 =C2=A0 =C2=A0(L=
 ## str)<br>
&gt; &gt;&gt; &gt; ++#endif<br>
&gt; &gt;&gt; &gt; + typedef char16_t sd_char;<br>
&gt; &gt;&gt; &gt; + #else<br>
&gt; &gt;&gt; &gt; + #=C2=A0 define STR_C(str)=C2=A0 =C2=A0 =C2=A0 =C2=A0(s=
tr)<br>
&gt; &gt;&gt; &gt; +--<br>
&gt; &gt;&gt; &gt; +2.41.0<br>
&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt; diff --git a/meta/recipes-core/systemd/<a href=3D"http:/=
/systemd-boot_254.bb" rel=3D"noreferrer" target=3D"_blank">systemd-boot_254=
.bb</a> b/meta/recipes-core/systemd/<a href=3D"http://systemd-boot_254.bb" =
rel=3D"noreferrer" target=3D"_blank">systemd-boot_254.bb</a><br>
&gt; &gt;&gt; &gt; index 5d69cf83abc..ae86450d2a6 100644<br>
&gt; &gt;&gt; &gt; --- a/meta/recipes-core/systemd/<a href=3D"http://system=
d-boot_254.bb" rel=3D"noreferrer" target=3D"_blank">systemd-boot_254.bb</a>=
<br>
&gt; &gt;&gt; &gt; +++ b/meta/recipes-core/systemd/<a href=3D"http://system=
d-boot_254.bb" rel=3D"noreferrer" target=3D"_blank">systemd-boot_254.bb</a>=
<br>
&gt; &gt;&gt; &gt; @@ -1,6 +1,8 @@<br>
&gt; &gt;&gt; &gt;=C2=A0 require systemd.inc<br>
&gt; &gt;&gt; &gt;=C2=A0 FILESEXTRAPATHS =3D. &quot;${FILE_DIRNAME}/systemd=
:&quot;<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; +SRC_URI:append:libc-musl =3D &quot; file://0001-efi-Use=
-char16_t-on-musl.patch &quot;<br>
&gt; &gt;&gt; &gt; +<br>
&gt; &gt;&gt; &gt;=C2=A0 require conf/image-uefi.conf<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt;=C2=A0 DEPENDS =3D &quot;intltool-native libcap util-linu=
x gperf-native python3-jinja2-native python3-pyelftools-native&quot;<br>
&gt; &gt;&gt; &gt; --<br>
&gt; &gt;&gt; &gt; 2.41.0<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt;&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt; &gt;&gt; &gt; View/Reply Online (#185718): <a href=3D"https://lists.op=
enembedded.org/g/openembedded-core/message/185718" rel=3D"noreferrer" targe=
t=3D"_blank">https://lists.openembedded.org/g/openembedded-core/message/185=
718</a><br>
&gt; &gt;&gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedded.o=
rg/mt/100652047/3617179" rel=3D"noreferrer" target=3D"_blank">https://lists=
.openembedded.org/mt/100652047/3617179</a><br>
&gt; &gt;&gt; &gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner=
@lists.openembedded.org" target=3D"_blank">openembedded-core+owner@lists.op=
enembedded.org</a><br>
&gt; &gt;&gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g=
/openembedded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://list=
s.openembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alexand=
re.belloni@bootlin.com" target=3D"_blank">alexandre.belloni@bootlin.com</a>=
]<br>
&gt; &gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; --<br>
&gt; &gt;&gt; Alexandre Belloni, co-owner and COO, Bootlin<br>
&gt; &gt;&gt; Embedded Linux and Kernel engineering<br>
&gt; &gt;&gt; <a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"=
_blank">https://bootlin.com</a><br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div></div>

--00000000000018e0c306029462c2--

