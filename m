Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE9C6E83EF9
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 13:46:47 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20645.1770212802037008247
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 05:46:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AAMU2Dcu;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-34c3259da34so507052a91.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 05:46:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770212801; cv=none;
        d=google.com; s=arc-20240605;
        b=Lv58G2X2EbmjFFJbnrGjv8XNuX+hILcUzkX8aYpAHlGZcyrGMjs/lEti6UMfuruA3C
         M+IeOc2dn8KM7t87iBMoia68yEBJQV/0EUv2FmOz65FoF4/A6srE5NSJYKilIFi2M0+4
         QJqSU1mCKCxLr43yXiFb1ILM9CJtmKWbXLrr8IMgo3a6JIV1XuaoofrinCBCrQrJOOrO
         8yx++J/k3O3H66c5YoZXXcL2+FhGWPaMg/VhxO9CYBwJioxVDBPlY1SCwS2XLVwGO8Jl
         w18bIFUnde3OTP2coT0hQeUCKrRPap2Ol+q6Mje0idw2RXgnr4CGVftnrWx6hhlnSwDx
         SR6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=01Rb3Kb7+s4c1mKDkByT6mAH9c1hMwKHt9xpI5DgvAY=;
        fh=2+8oywTaBPCMfcedUVzQXl4q9CG9qAOJd7yN25igs6o=;
        b=PX4f8VatTUhpf5f8DIpLZQ3uJXm2uWKBH+U3iXpWs7c/7sTOaj0d92nVsrSGP08dzd
         6gS2lfI89cO34fr3GJw0Jqqr7gvdGf2M9cvYKCkPAYsoNJ8nrxSOBztCRdfYLBUgTgUJ
         BEGYRyqbNriFqNUj8UH6HMps/8ExEmqSNhAYfksVIGi5ZgoCzTxO+LpNZZFIdV7qJ5eA
         95jq/k2NMw5bQs7/V4y6YfEkC2Vg5pJm4NRka1J8opBF9irjGWLs0yW6tDUE5e0Dmn/p
         Ib4NCuUukFxfs+fDxNXwjYAtvSNdvkWBqoAzYy4ElNCSETWMOeBSw3Qfxqr9yP1ZwXXN
         ORRw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770212801; x=1770817601; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=01Rb3Kb7+s4c1mKDkByT6mAH9c1hMwKHt9xpI5DgvAY=;
        b=AAMU2DcuOWJNwlTWIgyenareKfsIrt8gJlW53/fBD49KxKyqFPZwA/0XoSFSRQbvAW
         dREPSF2zQODAcsdrP+gLfDYb26KNOHk2038/0ZA+d1ETc5ctSgWFmzGx9jEFg7E5PNdX
         Vmd8z1NFBy8WuWsv9GaszkshOn72ngWu0DMg+oz2SZS7ie1tfifI679BB3ApWvCmGiCU
         QP7WqA9zLqoboRfFR+rt84yDvpXmDT2ZVUm2xicn3XF3PdbHWwaNmJKzBw7VT7TVvuys
         lmXJPtJNbzZeFXJMfae1xJ6RCYQeCtCZ9u3amQ52saq7YJhQ3ThwxSR2fWVOkuWerb4y
         adlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770212801; x=1770817601;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=01Rb3Kb7+s4c1mKDkByT6mAH9c1hMwKHt9xpI5DgvAY=;
        b=Ho4oUDn4yXm36CEu9v3K2HKJhrkHvUbnREc3TSe23N6yEHonRJHw0k8iTybo2ThG+q
         z2mVwZ9KjwZvuhk+Z++Z34ZbldZbZ9+bIL7aJEIujuPBOAKoaRKGNH8Kw0IoZ0ZQE4xZ
         qUehMWhFb4IQzEQhwL6gwoAE3ZpJIUJc2LUG5JnuXMt++g9Il7yL5T8aqz7iLkvc6htF
         P6NG4yo4MRdkhlCUVtoMKjiNt0xNafUIGv15/8NbT3XijdY3Pl9m/dzxn8W+rZgsZXgV
         Bt46pvazinF3ziVDn9+/xzF4MYvnKr+8Uz1wMl5+vB41W0f8G+a6D15M5ciLIbXmmOC1
         bH8g==
X-Gm-Message-State: AOJu0Yy3IzDMiyTTcFuPll2BOObyQzWgPrAA8i7xCYbGRMRDlrLwfBri
	h825EimP3f3V/dbKSCP6xtipEw1VE/QLW7jVJhWHasVxHqD9xoZ6Ek75YqI4zpQCERRVDvajmmf
	TrQoOYM/jMowIZCFwdHYCTznrfAjgakgBvABz
X-Gm-Gg: AZuq6aLphXmCUdWbcqi54FvoU0BjQdgJ77OytC9uyJu9DvL72aPieTDEkvCR9kE1RAB
	mE64KcC+nOmPi+s+RMQ5c8IUjBr34YKoWd/FtjkJRdXZIECGas8sv5XuOFVps7Po2W/YKTMKv/G
	+nk4WsvT07WHdBT/UdfV+mRdHWsDJG+8PyElxgGNhJ7k1b3kJJqq5twxrhFAbbPasMdkB2py1tK
	okUeN/PddoymMksHmaKOowDCz9oi0YbzzDqWQR89uiK8pAy6SuFMfD5bYuFazfc/bz1QQADf+kv
	p75otGiOVxaF4knp1KHIn/uN9tKj6JnUfszFGNY=
X-Received: by 2002:a17:90b:4c84:b0:34c:6d33:7d34 with SMTP id
 98e67ed59e1d1-35487123756mr2637121a91.16.1770212801134; Wed, 04 Feb 2026
 05:46:41 -0800 (PST)
MIME-Version: 1.0
References: <20260204020908.864912-1-kai.kang@windriver.com>
In-Reply-To: <20260204020908.864912-1-kai.kang@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 4 Feb 2026 08:46:29 -0500
X-Gm-Features: AZwV_QisQVVFcKqOpZUnBVP0Sr_TFrMJ3V43fXX8J2ZpneseAzeAjr_441yqZcQ
Message-ID: <CADkTA4PZ9df8xCge6F+m4M02OTXbiOhYJ7S7hPvze95ah5BWDQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] module.bbclass: check whether CONFIG_MODULES set
To: kai.kang@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000030441a0649ffc9d9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 13:46:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230526

--00000000000030441a0649ffc9d9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 3, 2026 at 9:09=E2=80=AFPM Kai Kang via lists.openembedded.org
<kai.kang=3Dwindriver.com@lists.openembedded.org> wrote:

> From: Kai Kang <kai.kang@windriver.com>
>
> Check whether kernel config CONFIG_MODULES set or not before do_compile
> and do_install in module.bbclass. If not set, it cannot build and
> install external modules.
>

This isn't the place to do that check.

If modules are disabled get modules_do_compile out of the tasks.

Bruce



>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/classes-recipe/module.bbclass | 60 +++++++++++++++++-------------
>  1 file changed, 34 insertions(+), 26 deletions(-)
>
> diff --git a/meta/classes-recipe/module.bbclass
> b/meta/classes-recipe/module.bbclass
> index 4948e995c5..d2b90e9c2c 100644
> --- a/meta/classes-recipe/module.bbclass
> +++ b/meta/classes-recipe/module.bbclass
> @@ -47,37 +47,45 @@ python do_devshell:prepend () {
>  }
>
>  module_do_compile() {
> -       unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
> -       oe_runmake KERNEL_PATH=3D${STAGING_KERNEL_DIR}   \
> -                  KERNEL_VERSION=3D${KERNEL_VERSION}    \
> -                  CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}" \
> -                  AR=3D"${KERNEL_AR}" OBJCOPY=3D"${KERNEL_OBJCOPY}" \
> -                  STRIP=3D"${KERNEL_STRIP}" \
> -                  O=3D${STAGING_KERNEL_BUILDDIR} \
> -                  KBUILD_EXTRA_SYMBOLS=3D"${KBUILD_EXTRA_SYMBOLS}" \
> -                  ${MAKE_TARGETS}
> +       if grep -q -i '^CONFIG_MODULES=3Dy$'
> ${STAGING_KERNEL_BUILDDIR}/.config ; then
> +               unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
> +               oe_runmake KERNEL_PATH=3D${STAGING_KERNEL_DIR}   \
> +                       KERNEL_VERSION=3D${KERNEL_VERSION}    \
> +                       CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}" \
> +                       AR=3D"${KERNEL_AR}" OBJCOPY=3D"${KERNEL_OBJCOPY}"=
 \
> +                       STRIP=3D"${KERNEL_STRIP}" \
> +                               O=3D${STAGING_KERNEL_BUILDDIR} \
> +                       KBUILD_EXTRA_SYMBOLS=3D"${KBUILD_EXTRA_SYMBOLS}" =
\
> +                       ${MAKE_TARGETS}
> +       else
> +               bbnote "The present kernel disabled CONFIG_MODULES that
> cannot build or install external modules."
> +       fi
>  }
>
>  module_do_install() {
> -       unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
> -       oe_runmake DEPMOD=3Decho
> MODLIB=3D"${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}" \
> -                  INSTALL_FW_PATH=3D"${D}${nonarch_base_libdir}/firmware=
" \
> -                  CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}"
> OBJCOPY=3D"${KERNEL_OBJCOPY}" \
> -                  STRIP=3D"${KERNEL_STRIP}" \
> -                  O=3D${STAGING_KERNEL_BUILDDIR} \
> -                  KBUILD_EXTRA_SYMBOLS=3D"${KBUILD_EXTRA_SYMBOLS}" \
> -                  ${MODULES_INSTALL_TARGET}
> +       if grep -q -i '^CONFIG_MODULES=3Dy$'
> ${STAGING_KERNEL_BUILDDIR}/.config; then
> +               unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
> +               oe_runmake DEPMOD=3Decho
> MODLIB=3D"${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}" \
> +
>  INSTALL_FW_PATH=3D"${D}${nonarch_base_libdir}/firmware" \
> +                               CC=3D"${KERNEL_CC}" LD=3D"${KERNEL_LD}"
> OBJCOPY=3D"${KERNEL_OBJCOPY}" \
> +                               STRIP=3D"${KERNEL_STRIP}" \
> +                               O=3D${STAGING_KERNEL_BUILDDIR} \
> +                       KBUILD_EXTRA_SYMBOLS=3D"${KBUILD_EXTRA_SYMBOLS}" =
\
> +                               ${MODULES_INSTALL_TARGET}
>
> -       if [ ! -e "${B}/${MODULES_MODULE_SYMVERS_LOCATION}/Module.symvers=
"
> ] ; then
> -               bbwarn "Module.symvers not found in
> ${B}/${MODULES_MODULE_SYMVERS_LOCATION}"
> -               bbwarn "Please consider setting
> MODULES_MODULE_SYMVERS_LOCATION to a"
> -               bbwarn "directory below B to get correct inter-module
> dependencies"
> +               if [ ! -e
> "${B}/${MODULES_MODULE_SYMVERS_LOCATION}/Module.symvers" ] ; then
> +                       bbwarn "Module.symvers not found in
> ${B}/${MODULES_MODULE_SYMVERS_LOCATION}"
> +                       bbwarn "Please consider setting
> MODULES_MODULE_SYMVERS_LOCATION to a"
> +                       bbwarn "directory below B to get correct
> inter-module dependencies"
> +               else
> +                       install -Dm0644
> "${B}/${MODULES_MODULE_SYMVERS_LOCATION}"/Module.symvers
> ${D}${includedir}/${BPN}/Module.symvers
> +                       # Module.symvers contains absolute path to the
> build directory.
> +                       # While it doesn't actually seem to matter which
> path is specified,
> +                       # clear them out to avoid confusion
> +                       sed -e 's:${B}/::g' -i
> ${D}${includedir}/${BPN}/Module.symvers
> +               fi
>         else
> -               install -Dm0644
> "${B}/${MODULES_MODULE_SYMVERS_LOCATION}"/Module.symvers
> ${D}${includedir}/${BPN}/Module.symvers
> -               # Module.symvers contains absolute path to the build
> directory.
> -               # While it doesn't actually seem to matter which path is
> specified,
> -               # clear them out to avoid confusion
> -               sed -e 's:${B}/::g' -i
> ${D}${includedir}/${BPN}/Module.symvers
> +               bbnote "The present kernel disabled CONFIG_MODULES that
> cannot build or install external modules."
>         fi
>  }
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#230492):
> https://lists.openembedded.org/g/openembedded-core/message/230492
> Mute This Topic: https://lists.openembedded.org/mt/117627823/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000030441a0649ffc9d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 3, 2026 at 9:09=
=E2=80=AFPM Kai Kang via <a href=3D"http://lists.openembedded.org">lists.op=
enembedded.org</a> &lt;kai.kang=3D<a href=3D"mailto:windriver.com@lists.ope=
nembedded.org">windriver.com@lists.openembedded.org</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">From: Kai Kang &lt;<a hr=
ef=3D"mailto:kai.kang@windriver.com" target=3D"_blank">kai.kang@windriver.c=
om</a>&gt;<br>
<br>
Check whether kernel config CONFIG_MODULES set or not before do_compile<br>
and do_install in module.bbclass. If not set, it cannot build and<br>
install external modules.<br></blockquote><div><br></div><div><div class=3D=
"gmail_default" style=3D"font-size:small">This isn&#39;t the place to do th=
at check.</div><div class=3D"gmail_default" style=3D"font-size:small"><br><=
/div><div class=3D"gmail_default" style=3D"font-size:small">If modules are =
disabled get modules_do_compile out of the tasks.</div><div class=3D"gmail_=
default" style=3D"font-size:small"><br></div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" targe=
t=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/module.bbclass | 60 +++++++++++++++++------------=
-<br>
=C2=A01 file changed, 34 insertions(+), 26 deletions(-)<br>
<br>
diff --git a/meta/classes-recipe/module.bbclass b/meta/classes-recipe/modul=
e.bbclass<br>
index 4948e995c5..d2b90e9c2c 100644<br>
--- a/meta/classes-recipe/module.bbclass<br>
+++ b/meta/classes-recipe/module.bbclass<br>
@@ -47,37 +47,45 @@ python do_devshell:prepend () {<br>
=C2=A0}<br>
<br>
=C2=A0module_do_compile() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake KERNEL_PATH=3D${STAGING_KERNEL_DIR}=
=C2=A0 =C2=A0\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 KERNEL_VERS=
ION=3D${KERNEL_VERSION}=C2=A0 =C2=A0 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CC=3D&quot;=
${KERNEL_CC}&quot; LD=3D&quot;${KERNEL_LD}&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 AR=3D&quot;=
${KERNEL_AR}&quot; OBJCOPY=3D&quot;${KERNEL_OBJCOPY}&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 STRIP=3D&qu=
ot;${KERNEL_STRIP}&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O=3D${STAGI=
NG_KERNEL_BUILDDIR} \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 KBUILD_EXTR=
A_SYMBOLS=3D&quot;${KBUILD_EXTRA_SYMBOLS}&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${MAKE_TARG=
ETS}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if grep -q -i &#39;^CONFIG_MODULES=3Dy$&#39; ${=
STAGING_KERNEL_BUILDDIR}/.config ; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unset CFLAGS CPPFLA=
GS CXXFLAGS LDFLAGS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake KERNEL_P=
ATH=3D${STAGING_KERNEL_DIR}=C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0KERNEL_VERSION=3D${KERNEL_VERSION}=C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0CC=3D&quot;${KERNEL_CC}&quot; LD=3D&quot;${KERNEL_LD}&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0AR=3D&quot;${KERNEL_AR}&quot; OBJCOPY=3D&quot;${KERNEL_OBJCOPY}&q=
uot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0STRIP=3D&quot;${KERNEL_STRIP}&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0O=3D${STAGING_KERNEL_BUILDDIR} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0KBUILD_EXTRA_SYMBOLS=3D&quot;${KBUILD_EXTRA_SYMBOLS}&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0${MAKE_TARGETS}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbnote &quot;The pr=
esent kernel disabled CONFIG_MODULES that cannot build or install external =
modules.&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0}<br>
<br>
=C2=A0module_do_install() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake DEPMOD=3Decho MODLIB=3D&quot;${D}${n=
onarch_base_libdir}/modules/${KERNEL_VERSION}&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 INSTALL_FW_=
PATH=3D&quot;${D}${nonarch_base_libdir}/firmware&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CC=3D&quot;=
${KERNEL_CC}&quot; LD=3D&quot;${KERNEL_LD}&quot; OBJCOPY=3D&quot;${KERNEL_O=
BJCOPY}&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 STRIP=3D&qu=
ot;${KERNEL_STRIP}&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O=3D${STAGI=
NG_KERNEL_BUILDDIR} \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 KBUILD_EXTR=
A_SYMBOLS=3D&quot;${KBUILD_EXTRA_SYMBOLS}&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${MODULES_I=
NSTALL_TARGET}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if grep -q -i &#39;^CONFIG_MODULES=3Dy$&#39; ${=
STAGING_KERNEL_BUILDDIR}/.config; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unset CFLAGS CPPFLA=
GS CXXFLAGS LDFLAGS<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake DEPMOD=
=3Decho MODLIB=3D&quot;${D}${nonarch_base_libdir}/modules/${KERNEL_VERSION}=
&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0INSTALL_FW_PATH=3D&quot;${D}${nonarch=
_base_libdir}/firmware&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CC=3D&quot;${KERNEL_CC}&quot; LD=3D&q=
uot;${KERNEL_LD}&quot; OBJCOPY=3D&quot;${KERNEL_OBJCOPY}&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0STRIP=3D&quot;${KERNEL_STRIP}&quot; \=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0O=3D${STAGING_KERNEL_BUILDDIR} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0KBUILD_EXTRA_SYMBOLS=3D&quot;${KBUILD_EXTRA_SYMBOLS}&quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${MODULES_INSTALL_TARGET}<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ ! -e &quot;${B}/${MODULES_MODULE_SYMVERS_L=
OCATION}/Module.symvers&quot; ] ; then<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbwarn &quot;Module=
.symvers not found in ${B}/${MODULES_MODULE_SYMVERS_LOCATION}&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbwarn &quot;Please=
 consider setting MODULES_MODULE_SYMVERS_LOCATION to a&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbwarn &quot;direct=
ory below B to get correct inter-module dependencies&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ ! -e &quot;${B=
}/${MODULES_MODULE_SYMVERS_LOCATION}/Module.symvers&quot; ] ; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0bbwarn &quot;Module.symvers not found in ${B}/${MODULES_MODULE_SY=
MVERS_LOCATION}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0bbwarn &quot;Please consider setting MODULES_MODULE_SYMVERS_LOCAT=
ION to a&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0bbwarn &quot;directory below B to get correct inter-module depend=
encies&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0install -Dm0644 &quot;${B}/${MODULES_MODULE_SYMVERS_LOCATION}&quo=
t;/Module.symvers ${D}${includedir}/${BPN}/Module.symvers<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0# Module.symvers contains absolute path to the build directory.<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0# While it doesn&#39;t actually seem to matter which path is spec=
ified,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0# clear them out to avoid confusion<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0sed -e &#39;s:${B}/::g&#39; -i ${D}${includedir}/${BPN}/Module.sy=
mvers<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -Dm0644 &qu=
ot;${B}/${MODULES_MODULE_SYMVERS_LOCATION}&quot;/Module.symvers ${D}${inclu=
dedir}/${BPN}/Module.symvers<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Module.symvers co=
ntains absolute path to the build directory.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# While it doesn&#3=
9;t actually seem to matter which path is specified,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# clear them out to=
 avoid confusion<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -e &#39;s:${B}/=
::g&#39; -i ${D}${includedir}/${BPN}/Module.symvers<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbnote &quot;The pr=
esent kernel disabled CONFIG_MODULES that cannot build or install external =
modules.&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0}<br>
<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#230492): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/230492" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/230492</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117627823/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117627823/1050810</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.com" =
target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--00000000000030441a0649ffc9d9--

