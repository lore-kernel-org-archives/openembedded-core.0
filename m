Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9077BC04FFE
	for <webhook@archiver.kernel.org>; Mon, 20 May 2024 18:45:29 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web10.572.1716230728970316848
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 May 2024 11:45:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DGDAH6Uy;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-248f7fdc323so1291998fac.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 11:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716230728; x=1716835528; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QDL1caiLZPeYyvwAzXwAvq2MZTkAI/L847XJrPmKY4E=;
        b=DGDAH6Uy5QetopYF2OVkfyDv7Unzo2zX02G9ckvVanVMkDMp4PdUEVj6qsSsjLsNjd
         2Z+SPA+qJ3hwujoXMLgM6G+p5VaytVooqtwqlyRJwP6Iro4cPJvBcQFlDPcNe9oOW3H/
         2edIvIRO85oHcmU1pRKs6XCqEt9vBWLyQrTQt+lVa6hoycYnSAvhlxFjq1fKvRo2DNdH
         +/mx4xth3K68OMlCjv7wsqOOn0lG35vutpPYFVqzGBmYj6NrX0XBm7kJGEsnGgUZVq2f
         oPWnB04f+p+w2M52PiR+WP6Uj2pcG5GZDb0gW6sAVAJphUOa4XIzAq84mWtiUFmunPt6
         z54A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716230728; x=1716835528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QDL1caiLZPeYyvwAzXwAvq2MZTkAI/L847XJrPmKY4E=;
        b=SPwBROyW0yYoMD2zD4Dce+ScAHJAIKvdhRlOOztZ6Y9zfxvl3c6um6o8tWQkGX4D36
         XPQnMlNTXePiD2j+7NjjuiC2Irr0wC5rNvCVI5FvrQvW0jys88YUXYD/dmVOZ4fw2ynM
         uCtSLFrgVemFAFDnFjI94dQnS3pqcK2AbGpwCW8jByLRgTWIGA3PhlsIeCi2P3eND72w
         q0Qvk5Tj1hxVGdCfOScwzMR11zeA7MNVIU81JgsYHz8xesA3vgGqeUuMMGGZqTAuEyMP
         gTZF6qpcA1dQw/sX3ekhFkiigFtEv6cVNekq9HTevXuWO5u47fIqM7nl7ynYF6eWrQfk
         mOVw==
X-Gm-Message-State: AOJu0YwXBgn/jVs3NMk1HYT5JgjMRk9sxy4oCRFjOE9o1zFMoyxrV7li
	ufGsOd8UWvTCad2wqYM8tH6I1XhYE7i2jag4314J6ru9qWBEEqPrVjMzU3zLHoKEt/ruoPscisf
	wPOjT7OioJ/5NCcHdvDKhlJQtb3xDqLvHBl9U3Q==
X-Google-Smtp-Source: AGHT+IFyFbTFWB4GYrHsi1IVmE/cArRECeYNm5rz3DJMZaxVVroSfgTnlYK3Vnz4j4PEY6fis/2bfj5XBPrmIkKRCFE=
X-Received: by 2002:a05:6870:d106:b0:23c:cab7:1310 with SMTP id
 586e51a60fabf-241730dc0edmr40390154fac.56.1716230728059; Mon, 20 May 2024
 11:45:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240520143428.4168152-1-martin.jansa@gmail.com>
In-Reply-To: <20240520143428.4168152-1-martin.jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 May 2024 11:45:01 -0700
Message-ID: <CAMKF1srfCuW9NATJ=dFEUt768KyxQCGc-Ha8gk+z9hsaBuaxXw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cdrtools-native: fix build with gcc-14
To: martin.jansa@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 18:45:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199601

perhaps we should try to upgrade to
https://sourceforge.net/projects/cdrtools/files/alpha/cdrtools-3.02a09.tar.=
bz2
this is last release of cdrtools and other distros are packaging it
too, I am not sure if it will fix this issue but we might be
able to share fixes. We should also explore options to replace this
dependency for live/iso image generation.

On Mon, May 20, 2024 at 7:34=E2=80=AFAM Martin Jansa via
lists.openembedded.org <martin.jansa=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Fixes:
> http://errors.yoctoproject.org/Errors/Details/770525/
> | checking whether the C compiler (gcc  -isystem/OE/build/oe-core/tmp-gli=
bc/work/x86_64-linux/cdrtools-native/3.01/recipe-sysroot-native/usr/include=
 -O2 -pipe ) works... no
> | configure: error: installation or configuration problem: C compiler can=
not create executables.
> | RULES/rules.cnf:70: incs/amd-ryzen-threadripper-3970x-32-core-processor=
-linux-cc/rules.cnf: No such file or directory
> | make: *** [RULES/rules.cnf:59: incs/amd-ryzen-threadripper-3970x-32-cor=
e-processor-linux-cc/rules.cnf] Error 1
> | make: *** Waiting for unfinished jobs....
>
> where config.log show it's caused by gcc-14:
>
> configure:1189: checking whether the C compiler (gcc  -isystem/OE/build/o=
e-core/tmp-glibc/work/x86_64-linux/cdrtools-native/3.01/recipe-sysroot-nati=
ve/usr/include -O2 -pipe ) works
> configure:1211: gcc  -o conftest -isystem/OE/build/oe-core/tmp-glibc/work=
/x86_64-linux/cdrtools-native/3.01/recipe-sysroot-native/usr/include -O2 -p=
ipe  -D_GNU_SOURCE  conftest.c   1>&5
> configure:1208:1: error: return type defaults to 'int' [-Wimplicit-int]
> configure: failed program was:
>
> main(){return(0);}
>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb b/met=
a/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
> index bf8be1ad0c..239b351933 100644
> --- a/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
> +++ b/meta/recipes-devtools/cdrtools/cdrtools-native_3.01.bb
> @@ -19,13 +19,17 @@ SRC_URI =3D " \
>  SRC_URI[md5sum] =3D "7d45c5b7e1f78d85d1583b361aee6e8b"
>  SRC_URI[sha256sum] =3D "ed282eb6276c4154ce6a0b5dee0bdb81940d0cbbfc7d03f7=
69c4735ef5f5860f"
>
> -EXTRA_OEMAKE =3D "-e MAKEFLAGS=3D"
> +EXTRA_OEMAKE =3D "-e MAKEFLAGS=3D CPPOPTX=3D'${CPPFLAGS}' COPTX=3D'${CFL=
AGS}' C++OPTX=3D'${CXXFLAGS}' LDOPTX=3D'${LDFLAGS}' GMAKE_NOWARN=3D'true'"
>
>  # Stop failures when 'cc' can't be found
>  export ac_cv_prog_CC =3D "${CC}"
>
>  inherit native
>
> +# Use -std=3Dgnu89 to build with gcc-14 (https://bugs.gentoo.org/903876)
> +# this needs to be after native inherit (which sets CFLAGS to BUILD_CFLA=
GS)
> +CFLAGS +=3D "-std=3Dgnu89"
> +
>  do_configure() {
>          install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub =
${S}/autoconf
>          install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.gues=
s ${S}/autoconf
> @@ -33,5 +37,5 @@ do_configure() {
>  }
>
>  do_install() {
> -       make install GMAKE_NOWARN=3Dtrue INS_BASE=3D${prefix} DESTDIR=3D$=
{D}
> +       oe_runmake install INS_BASE=3D${prefix} DESTDIR=3D${D}
>  }
> --
> 2.45.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199594): https://lists.openembedded.org/g/openembedde=
d-core/message/199594
> Mute This Topic: https://lists.openembedded.org/mt/106204338/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

