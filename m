Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93A01C87FC9
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 23:23:05 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web10.22123.1753831377464657491
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Jul 2025 16:22:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RaNQoc1z;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-718389fb988so55911997b3.1
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 16:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753831376; x=1754436176; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eCnOyMGhmMoPTWa9nT/Vva+63mgh0jUZH2MS1A1y1ns=;
        b=RaNQoc1z6IiVsBxVcTuLE076vq7Jpe8TnT/+W9x1FTD5j1tmYQxQ4uu8rHelDYKHPV
         RrlxrOQDeQF+jvstMKTK6pR8sk4vb18K1PgI5JEVrwjeLtrZOFylLH0uQ7qnSzJoK+uK
         eA3GIuz7FTNkZQt90yjTiPahgZzsQsnM5S7uGIX1sy+qGVklKEGBhA1d+Oh99PaKXuVn
         SNqXK8xuvcViWTp+pOIbU3Q6hQlhbw/y2+UBg7DrUt0F1lYTMLLhajW6EbCKC0Qcu4/g
         fzI8UAg8p8pLqN1BSNwNLEtgWXqDtQjpz7p313H1XWrZI9TOvLX0hy9Mncz8f6t556W5
         nL/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753831376; x=1754436176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eCnOyMGhmMoPTWa9nT/Vva+63mgh0jUZH2MS1A1y1ns=;
        b=BN36cQ/REzZhZrhVSArrPfCDqi66+zOxv/fxB1TB1r73dWvxtvy0Eag7sR6EZue5MN
         aLbeoD2hEfY3c2zNgs/lZ/WeYB7qWP105c6lYwMMJQj7Nro7dFV7UYpRKUw+5CszFCMZ
         iJToRpoP2UN279ldbUV9w7xHnC/nzI0T7H9wLWAuQLhtRrz78q3w+dpv7anDU9cJOIhA
         frFDgrQR4vFiqXHQHaV07JrVNOUy9Nsdfm3Y7zwS+8Ai2VzwKAOBOlNxHW8VUcPOgMXA
         yQZcz0wrFfumAmZFLvrpW73WLO0dyyp5aEbVcUIvbfDdA7SP7w/0RHIwJDIt4d8HXicH
         9JvQ==
X-Gm-Message-State: AOJu0YzM+ohKMIMFeVYZSY9Hd46DG9YZCL8DjguV5njEeMRXAOX7v/O2
	mh8+TyKPeNhDp2alX9R+pIpcC6dOPmXVkz8kIdwZiEPecaD5LcXQo8sin1BDHVvU8cA/W/qyoPs
	U1RndNIptClQe4LH7sg8Bs7APPHRzq8R+cXsr004=
X-Gm-Gg: ASbGnctgC1uVJX1wjH99DkZV5wO//Rtoy06Jw+Xihn2bI9ekhf0L7BBAz4MAX4edpXN
	ZqP01s7iQTDm4ngCvaYhBGeW6d3+C0HsEjHE45mwyEr9p/xzL1s+iE/TX/evfwB78KYeDVQ/YdH
	HtaOKLcFOxbd2TNwlEzVMW0a74Hsv2DNU9DOIUERo2zADSfHigFw1MNiLjiewCP4h5Y05TjC6eg
	BQ6mxr06IdHXPpA91la2j1HxYVmSbf2rXr6ez0=
X-Google-Smtp-Source: AGHT+IEjHdMSZA668jP3EjWKCQxmz/kHC0+6srrZn7xzdatbCds7CdWrCpiPy5KxemDzwe+cMwvq/h1/4UK0QoynY7A=
X-Received: by 2002:a05:690c:6f0f:b0:70e:2d30:43d6 with SMTP id
 00721157ae682-71a466e1e02mr20703627b3.38.1753831376412; Tue, 29 Jul 2025
 16:22:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250729103126.1806165-1-f_l_k@t-online.de>
In-Reply-To: <20250729103126.1806165-1-f_l_k@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 Jul 2025 16:22:29 -0700
X-Gm-Features: Ac12FXxC_j_8jRDrw8W1C0nk21WoTu61oWNikVqF2-z7mB4TlQMAwwykOZuikiA
Message-ID: <CAMKF1sqL2Cnm5SPs3Bu=yfN6QiWjGq9uQKtShEQXmuFtmy5S0Q@mail.gmail.com>
Subject: Re: [oe-core][PATCH]] autoconf-archive: add backport patch to fix gl detection
To: f_l_k@t-online.de
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Jul 2025 23:23:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221089

There is one extra ] in the subject line.

On Tue, Jul 29, 2025 at 3:31=E2=80=AFAM Markus Volk via lists.openembedded.=
org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>
> Detecting opengl using autoconf-archive currently fails:
> | aclocal: warning: couldn't open directory 'm4': No such file or directo=
ry
> | configure.ac:306: error: _AX_CHECK_GL_MANUAL_LIBS_GENERIC: argument mus=
t not be empty
> | ../sources/autoconf-2.72/lib/m4sugar/m4sh.m4:690: _AS_IF_ELSE is expand=
ed from...
> | ../sources/autoconf-2.72/lib/m4sugar/m4sh.m4:697: AS_IF is expanded fro=
m...
> | /home/flk/poky/build/tmp/work/corei7-64-poky-linux/cava/0.10.4/recipe-s=
ysroot-native/usr/share/aclocal/ax_check_gl.m4:187: _AX_CHECK_GL_MANUAL_LIB=
S_GENERIC is expanded from...
> | ../sources/autoconf-2.72/lib/m4sugar/m4sh.m4:595: AS_CASE is expanded f=
rom...
> | /home/flk/poky/build/tmp/work/corei7-64-poky-linux/cava/0.10.4/recipe-s=
ysroot-native/usr/share/aclocal/ax_check_gl.m4:253: AX_CHECK_GL is expanded=
 from...
> | ../sources/autoconf-2.72/lib/m4sugar/m4sh.m4:697: AS_IF is expanded fro=
m...
> | ../sources/autoconf-2.72/lib/m4sugar/m4sh.m4:697: AS_IF is expanded fro=
m...
> | configure.ac:306: the top level
> | autom4te: error: m4 failed with exit status: 1
>
> This issue has already been fixed upstream, but there has been no new rel=
ease since then.
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  ...226a2fe3980388abffd6de25ed6b9591cce3.patch | 39 +++++++++++++++++++
>  .../autoconf-archive_2024.10.16.bb            |  1 +
>  2 files changed, 40 insertions(+)
>  create mode 100644 meta/recipes-devtools/autoconf-archive/autoconf-archi=
ve/427e226a2fe3980388abffd6de25ed6b9591cce3.patch
>
> diff --git a/meta/recipes-devtools/autoconf-archive/autoconf-archive/427e=
226a2fe3980388abffd6de25ed6b9591cce3.patch b/meta/recipes-devtools/autoconf=
-archive/autoconf-archive/427e226a2fe3980388abffd6de25ed6b9591cce3.patch
> new file mode 100644
> index 0000000000..99c6ae0aec
> --- /dev/null
> +++ b/meta/recipes-devtools/autoconf-archive/autoconf-archive/427e226a2fe=
3980388abffd6de25ed6b9591cce3.patch
> @@ -0,0 +1,39 @@
> +From 427e226a2fe3980388abffd6de25ed6b9591cce3 Mon Sep 17 00:00:00 2001
> +From: Eli Schwartz <eschwartz93@gmail.com>
> +Date: Sat, 19 Oct 2024 21:51:30 -0400
> +Subject: [PATCH] ax_check_gl.m4: properly quote m4_fatal
> +
> +It needs to only run as an argument of m4_if, not all the time.
> +
> +Fixes: 753493bf7e251997f02559b98fc599d4a337d8cd
> +Bug: https://bugs.gentoo.org/941845
> +
> +Signed-off-by: Markus Volk <f_l_k@t-online.de>
> +
> +Upstream-Status: Backport [https://github.com/autoconf-archive/autoconf-=
archive/commit/427e226a2fe3980388abffd6de25ed6b9591cce3]
> +---
> + m4/ax_check_gl.m4 | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/m4/ax_check_gl.m4 b/m4/ax_check_gl.m4
> +index 850d407d..4c2e4efb 100644
> +--- a/m4/ax_check_gl.m4
> ++++ b/m4/ax_check_gl.m4
> +@@ -85,7 +85,7 @@
> + #   modified version of the Autoconf Macro, you may extend this special
> + #   exception to the GPL to apply to your modified version as well.
> +
> +-#serial 23
> ++#serial 24
> +
> + # example gl program
> + m4_define([_AX_CHECK_GL_PROGRAM],
> +@@ -187,7 +187,7 @@ AC_DEFUN([_AX_CHECK_GL_LINK_CV],
> + AC_DEFUN([_AX_CHECK_GL_MANUAL_LIBS_GENERIC], [
> +   AS_IF([test -n "$GL_LIBS"],[], [
> +     ax_check_gl_manual_libs_generic_extra_libs=3D"$1"
> +-    m4_if($1, [], m4_fatal([$0: argument must not be empty]))
> ++    m4_if($1, [], [m4_fatal([$0: argument must not be empty])])
> +
> +     _AX_CHECK_GL_SAVE_FLAGS([CFLAGS])
> +     AC_SEARCH_LIBS([glBegin],[$ax_check_gl_manual_libs_generic_extra_li=
bs], [
> diff --git a/meta/recipes-devtools/autoconf-archive/autoconf-archive_2024=
.10.16.bb b/meta/recipes-devtools/autoconf-archive/autoconf-archive_2024.10=
.16.bb
> index 11708de1c8..5d780d2f7c 100644
> --- a/meta/recipes-devtools/autoconf-archive/autoconf-archive_2024.10.16.=
bb
> +++ b/meta/recipes-devtools/autoconf-archive/autoconf-archive_2024.10.16.=
bb
> @@ -6,6 +6,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D11cc2d3ee574f9=
d6b7ee797bdce4d423 \
>      file://COPYING.EXCEPTION;md5=3Dfdef168ebff3bc2f13664c365a5fb515"
>
>  SRC_URI =3D "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
> +SRC_URI +=3D "file://427e226a2fe3980388abffd6de25ed6b9591cce3.patch"
>  SRC_URI[sha256sum] =3D "7bcd5d001916f3a50ed7436f4f700e3d2b1bade3ed803219=
c592d62502a57363"
>
>  inherit autotools allarch texinfo
> --
> 2.50.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#221058): https://lists.openembedded.org/g/openembedde=
d-core/message/221058
> Mute This Topic: https://lists.openembedded.org/mt/114428880/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

