Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DC5DC54E4A
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 19:19:52 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.web11.2319.1709839182650880203
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Mar 2024 11:19:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m+gKenIf;
 spf=pass (domain: gmail.com, ip: 209.85.161.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-59fc2d22cfaso494854eaf.3
        for <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 11:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709839182; x=1710443982; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RTXC//YfU+72vHCxvf1DWPwNvkXgMp5FFERJ3sTeamc=;
        b=m+gKenIfiJHfM/uJiloEYDjT6CIb/yki+9aRJaTW1/G54a7eWPw23jsRDoG+Wg8Ie+
         /a1wC26CT3cXSURqfMNcdHeBsk4WKE0vs7LbWNRsxfOzik9EnkRvaMGnaVGJtilC26Ys
         seYHg4qpsMh45l0zH6yhU5ypXAc5JtsipOn8NQDPMihJtl1dViBLkAnvgg3/O7WquMaG
         biID1CUC4lBKClyfRX+YmvZ4y3rKDsWd7NUljohBn7avb+5FSAFaaYV+zjK2O02Sz5O9
         EbJ0Kl4csTtLvYAgdKpGWqvkXJq8jCjVWPPBD/Nxj6ayFIUVtXEpR+e6svx0DfnbUCvP
         bLgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709839182; x=1710443982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RTXC//YfU+72vHCxvf1DWPwNvkXgMp5FFERJ3sTeamc=;
        b=bIbZKI4nk4ck1fsf/josrEwVkaYJFa+WmgrxESeWjDhHJkzbaJ13B0YVuwoJfgGdD7
         zpUrxdLF7cIYArbzfp3bMG95jlC4JeJvl97Mzfpjbt9MSdtoodcOLygRRfCUkljNCtVb
         W6Ngj4pJT0+Qgs0SXs5DR1+QfHKzCEtoN5aIFo/y/wBx559ylNn7KCkfU/QxRBZS2z7/
         CNbGod42oLJIhb4Dlfx7njFjCrsMO34+6bA7GrNsRaQHQwaR/cnbbQw7nT5rMa9iA5ad
         PbUfdOlbbPkZ1VPNM/nwRMhgPMLJazEDrtMRZGfjO4S1pB0PURsvXmYIZaoafskbrG9v
         9/Jg==
X-Gm-Message-State: AOJu0YxNe05m/KA1twQcyHYD3GZ+1JjqJvytc40VzIn/BXysJYHR8GRy
	w0+a8ZVI8SaYkkV/P+aKuDMD/ndqoa9SWy2JVtnfrTCE0nu9dhCTarAkm+FaWvpumaxzVFsBvjF
	WNjmz93bYRurq6J7NLWNu1S9tyiY=
X-Google-Smtp-Source: AGHT+IGEGGFBjkVkTXnqngk7OCfgwrPFBgw+bXMJtzPV/oM0WtI/z8JA8g+duBknqBrlZBqoKgWmhBvTCVLDe++ruf0=
X-Received: by 2002:a05:6870:f60c:b0:221:3742:77ff with SMTP id
 ek12-20020a056870f60c00b00221374277ffmr860573oab.36.1709839181777; Thu, 07
 Mar 2024 11:19:41 -0800 (PST)
MIME-Version: 1.0
References: <20240306154151.3741709-1-alex@linutronix.de> <20240306154151.3741709-22-alex@linutronix.de>
In-Reply-To: <20240306154151.3741709-22-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Mar 2024 11:19:15 -0800
Message-ID: <CAMKF1spsgVyLxF7Vjf999+rGJZdtDKpL_=Lpd-XvqNK+L3eiQA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 22/47] libxml2: upgrade 2.11.5 -> 2.12.5
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 19:19:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196819

libosinfo fails due to this upgrade

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3691/step=
s/14/logs/stdio

On Wed, Mar 6, 2024 at 7:42=E2=80=AFAM Alexander Kanavin <alex.kanavin@gmai=
l.com> wrote:
>
> License-Update: hash.c is rewritten and no longer carries a special copyr=
ight notice, but dict.c still does
> (Copyright file updated to reflect that)
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/recipes-core/libxml/libxml2/install-tests.patch     | 9 ++++-----
>  .../libxml/{libxml2_2.11.5.bb =3D> libxml2_2.12.5.bb}      | 9 +++++----
>  2 files changed, 9 insertions(+), 9 deletions(-)
>  rename meta/recipes-core/libxml/{libxml2_2.11.5.bb =3D> libxml2_2.12.5.b=
b} (92%)
>
> diff --git a/meta/recipes-core/libxml/libxml2/install-tests.patch b/meta/=
recipes-core/libxml/libxml2/install-tests.patch
> index 14ccce5873b..478eeea81b1 100644
> --- a/meta/recipes-core/libxml/libxml2/install-tests.patch
> +++ b/meta/recipes-core/libxml/libxml2/install-tests.patch
> @@ -1,4 +1,4 @@
> -From 3fc716357ce1372d9418dc86f24315b34d9808de Mon Sep 17 00:00:00 2001
> +From 0779511838a8cbd1e0f431c22f28f286a2a37b1b Mon Sep 17 00:00:00 2001
>  From: Ross Burton <ross.burton@arm.com>
>  Date: Mon, 5 Dec 2022 17:02:32 +0000
>  Subject: [PATCH] add yocto-specific install-ptest target
> @@ -7,17 +7,16 @@ Add a target to install the test suite.
>
>  Upstream-Status: Inappropriate
>  Signed-off-by: Ross Burton <ross.burton@arm.com>
> -
>  ---
>   Makefile.am | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
>  diff --git a/Makefile.am b/Makefile.am
> -index 5bc4018..57d27af 100644
> +index 0a49d37..1097c63 100644
>  --- a/Makefile.am
>  +++ b/Makefile.am
> -@@ -26,6 +26,16 @@ check_PROGRAMS =3D \
> -       testlimits \
> +@@ -27,6 +27,16 @@ check_PROGRAMS =3D \
> +       testparser \
>         testrecurse
>
>  +ptestdir=3D$(libexecdir)
> diff --git a/meta/recipes-core/libxml/libxml2_2.11.5.bb b/meta/recipes-co=
re/libxml/libxml2_2.12.5.bb
> similarity index 92%
> rename from meta/recipes-core/libxml/libxml2_2.11.5.bb
> rename to meta/recipes-core/libxml/libxml2_2.12.5.bb
> index 44336c25e1c..47c1a72e77e 100644
> --- a/meta/recipes-core/libxml/libxml2_2.11.5.bb
> +++ b/meta/recipes-core/libxml/libxml2_2.12.5.bb
> @@ -4,10 +4,11 @@ HOMEPAGE =3D "https://gitlab.gnome.org/GNOME/libxml2"
>  BUGTRACKER =3D "http://bugzilla.gnome.org/buglist.cgi?product=3Dlibxml2"
>  SECTION =3D "libs"
>  LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://Copyright;md5=3D2044417e2e5006b65a8b9067b68=
3fcf1 \
> -                    file://hash.c;beginline=3D6;endline=3D15;md5=3De77f7=
7b12cb69e203d8b4090a0eee879 \
> +LIC_FILES_CHKSUM =3D "file://Copyright;md5=3Dfec7ecfe714722b2bb0aaff7d20=
0c701 \
> +                    file://dict.c;beginline=3D6;endline=3D15;md5=3D2b4b7=
b827d2d8b080372433c4c9c85b6 \
>                      file://list.c;beginline=3D4;endline=3D13;md5=3Db9c25=
b021ccaf287e50060602d20f3a7 \
> -                    file://trio.c;beginline=3D5;endline=3D14;md5=3Dcd4f6=
1e27f88c1d43df112966b1cd28f"
> +                    file://trio.c;beginline=3D5;endline=3D14;md5=3Dcd4f6=
1e27f88c1d43df112966b1cd28f \
> +                    "
>
>  DEPENDS =3D "zlib virtual/libiconv"
>
> @@ -19,7 +20,7 @@ SRC_URI +=3D "http://www.w3.org/XML/Test/xmlts20130923.=
tar;subdir=3D${BP};name=3Dtestt
>             file://install-tests.patch \
>             "
>
> -SRC_URI[archive.sha256sum] =3D "3727b078c360ec69fa869de14bd6f75d7ee8d369=
87b071e6928d4720a28df3a6"
> +SRC_URI[archive.sha256sum] =3D "a972796696afd38073e0f59c283c3a2f5a560b52=
68b4babc391b286166526b21"
>  SRC_URI[testtar.sha256sum] =3D "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e6=
9a2be4722379f08702ea7273"
>
>  # Disputed as a security issue, but fixed in d39f780
> --
> 2.39.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196704): https://lists.openembedded.org/g/openembedde=
d-core/message/196704
> Mute This Topic: https://lists.openembedded.org/mt/104767962/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

