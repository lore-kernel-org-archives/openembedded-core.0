Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47581C77B7C
	for <webhook@archiver.kernel.org>; Sat, 29 Apr 2023 19:23:47 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.web11.54543.1682796218528472374
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Apr 2023 12:23:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=fgTrNFiA;
 spf=pass (domain: gmail.com, ip: 209.85.161.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-54c723db469so385506eaf.3
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Apr 2023 12:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682796218; x=1685388218;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PgcNuIqfiUE7K8NmkATTUyi4MbD31mYeXaKHjxVCGyA=;
        b=fgTrNFiATRKTy+t5R8SUnYTP8dCTmufiuZbIYHdBjmVm0DIsgF13N6mB6NfmjJGe9C
         fsEKNiXfucuA3kGozF6NW7/HHqoIGVdOlTaiM0pGMysZWba7wvdCWIFCiTBXnkICgkMh
         blZ7BJuhkKqeB3knzUzo5m3PmVu7GV11hIKUU3pgad37w6vebXGDcgoUroOtamBKmle8
         Otfio/N8/l6+SggYhvLUMdn0h2MkGaAIADHqCWoW7u7hmO5DmjnJcfhjIFNcZlDWGyEm
         mNP4LqUCEu3aYSBTnMHKgRVk/cHzoDanDq7OYlMek9lR/dUKQm6wiA/Xme6yGAY66GPZ
         ILYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682796218; x=1685388218;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PgcNuIqfiUE7K8NmkATTUyi4MbD31mYeXaKHjxVCGyA=;
        b=PFqQg4vCv/diHwROsleLY6+UA9eYl8wX3IO3lx2cIj7PatBuXc3XM0nqKxgOIpyNU1
         FNgWylPiMAhUjZPPu2vXmo0kUSUkN1EV5tQ3K2l3VYIv/Oxjz0JddRFk/HtUCcAlGz8E
         GowoGTVK3IVxjHF5p6j1DUgo4DjetW39KIGW2AJOaLA53UWDWsz/uaY5Gvb4133g65Zg
         tzP9bWX/xaPjg8Tnzb8PkPdMNqrTKxYl2vVdfGClxINCmWGTayeyRSQ3UnUF/BRgDEEI
         1JUjrTcebGZ+oMZ+Rh8wxByGTLtggofD2qHuM7NtrX99A3bNixXzXA2JDNxTYBQeLwk7
         FmIA==
X-Gm-Message-State: AC+VfDw6taxTUMdEqYDQbMQ/1nVcOAoohZh5hTNQDvJagWHl8DodnrqH
	Oi5tOSt6GLdWJwoP9yvDI22WB5brWHemRXktdYg=
X-Google-Smtp-Source: ACHHUZ4sVtonUBjpph7X952rsp7l6bzzu7+2+VisuPQx2TnMC5Gs3ggFpqHK4+oJdsULJzPZM/4LEXqhN3uIuW+zdLc=
X-Received: by 2002:a05:6808:115:b0:38c:5a32:3257 with SMTP id
 b21-20020a056808011500b0038c5a323257mr4056377oie.42.1682796217531; Sat, 29
 Apr 2023 12:23:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230426095036.2632847-1-alex@linutronix.de> <20230426095036.2632847-10-alex@linutronix.de>
In-Reply-To: <20230426095036.2632847-10-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 29 Apr 2023 12:23:11 -0700
Message-ID: <CAMKF1sqM-WhYtLALHemrPC62qMaA4h41UNr_kP6brLvbdJ2j+w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 10/11] insane.bbclass: simplify exceptions for
 32 bit time API check
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Apr 2023 19:23:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180558

its still triggering as error.

On Wed, Apr 26, 2023 at 2:50=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Existing implementation required to list both specific problematic apis, =
and files that
> use them: neither is necessary as both are seen in package_qa error messa=
ges, and
> can cause excessive amount of exception lines, if there are too many file=
s, or
> they are installed in arch-specific locations. Also, the value of INSANE_=
SKIP
> should be the test that needs to be skipped, and in this case it wasn't.
>
> Also, all problematic recipes are now correctly listed.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/classes-global/insane.bbclass  | 14 +++-----------
>  meta/conf/distro/include/time64.inc | 18 ++++++++++++------
>  2 files changed, 15 insertions(+), 17 deletions(-)
>
> diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/ins=
ane.bbclass
> index ee34d5208d1..8788f58fc5b 100644
> --- a/meta/classes-global/insane.bbclass
> +++ b/meta/classes-global/insane.bbclass
> @@ -617,22 +617,14 @@ def check_32bit_symbols(path, packagename, d, elf, =
messages):
>              # At this point, any symbol information is stripped into the=
 debug
>              # package, so that is the only place we will find them.
>              elfpath =3D elfpath.replace('.debug/', '')
> -            allowed =3D (
> -                d.getVarFlag(
> -                    'INSANE_SKIP:' + d.getVar('PN'), elfpath.replace('/'=
, '_')
> -                ) or ''
> -            ).split()
> -            usedapis -=3D set(allowed)
> -            if usedapis:
> +            allowed =3D "32bit-time" in (d.getVar('INSANE_SKIP') or '').=
split()
> +            if not allowed:
>                  msgformat =3D elfpath + " uses 32-bit api '%s'"
>                  for sym in usedapis:
>                      oe.qa.add_message(messages, '32bit-time', msgformat =
% sym)
>                  oe.qa.add_message(
>                      messages, '32bit-time',
> -                    'Suppress with INSANE_SKIP:%s[%s] =3D "%s"' % (
> -                        d.getVar('PN'), elfpath.replace('/', '_'),
> -                        ' '.join(usedapis)
> -                    )
> +                    'Suppress with INSANE_SKIP =3D "32bit-time"'
>                  )
>
>  # Check license variables
> diff --git a/meta/conf/distro/include/time64.inc b/meta/conf/distro/inclu=
de/time64.inc
> index f3bdfba4acf..1a3399bc5e6 100644
> --- a/meta/conf/distro/include/time64.inc
> +++ b/meta/conf/distro/include/time64.inc
> @@ -30,10 +30,16 @@ GLIBC_64BIT_TIME_FLAGS:pn-pipewire =3D ""
>  GLIBC_64BIT_TIME_FLAGS:pn-pulseaudio =3D ""
>  GLIBC_64BIT_TIME_FLAGS:pn-gcc-sanitizers =3D ""
>
> -INSANE_SKIP:libstd-rs[_usr_lib_rustlib_armv7-poky-linux-gnueabihf_lib_li=
bstd.so] =3D "clock_gettime gettime fcntl fstat64 fstatat64 getsockopt ioct=
l lstat64 nanosleep prctl recvmsg sendmsg setsockopt stat64"
> -INSANE_SKIP:librsvg[_usr_bin_rsvg-convert] =3D "fcntl fstat64 prctl stat=
64 clock_gettime"
> -INSANE_SKIP:librsvg[_usr_lib_librsvg-2.so.2.48.0] =3D "fcntl lstat64 set=
sockopt sendmsg fstat64 getsockopt ioctl nanosleep timegm fstatat64 prctl m=
ktime gmtime_r recvmsg stat64 clock_gettime localtime_r"
> -
> -# libpulsedsp.so is a preload-library that hooks libc functions
> -INSANE_SKIP:pulseaudio[_usr_lib_pulseaudio_libpulsedsp.so] =3D "setsocko=
pt fcntl"
> +INSANE_SKIP:append:pn-cargo =3D " 32bit-time"
> +INSANE_SKIP:append:pn-gcc-sanitizers =3D " 32bit-time"
> +INSANE_SKIP:append:pn-glibc =3D " 32bit-time"
> +INSANE_SKIP:append:pn-glibc-tests =3D " 32bit-time"
> +INSANE_SKIP:append:pn-librsvg =3D " 32bit-time"
> +INSANE_SKIP:append:pn-libstd-rs =3D " 32bit-time"
> +INSANE_SKIP:append:pn-pulseaudio =3D " 32bit-time"
> +INSANE_SKIP:append:pn-python3-bcrypt =3D " 32bit-time"
> +INSANE_SKIP:append:pn-python3-cryptography =3D " 32bit-time"
> +INSANE_SKIP:append:pn-rust =3D " 32bit-time"
> +INSANE_SKIP:append:pn-rust-hello-world =3D " 32bit-time"
> +INSANE_SKIP:append:pn-strace =3D " 32bit-time"
>
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180428): https://lists.openembedded.org/g/openembedde=
d-core/message/180428
> Mute This Topic: https://lists.openembedded.org/mt/98511412/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

