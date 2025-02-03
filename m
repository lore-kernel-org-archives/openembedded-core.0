Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1ABDC02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 19:46:22 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web11.97465.1738611973680763308
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 11:46:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EmBDC+o1;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-724d1724657so2878699a34.0
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 11:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738611973; x=1739216773; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/8OTceTsy8l5T5zXuAxuBTkReAPJDPRSkAl+mS2i590=;
        b=EmBDC+o1mzh0hHw6EiJvEFMcuFRTmU7XkdIHiYXxLEYm8m2JkyZOQAywshdOjQLWjk
         sVG0t/c1ORR96tMn7/80nb7228litLMUDvDCEyvsKNcxbXrqXnrFTGytG7LurHBDMpT0
         aIoE92li89CWC1//zT1MmTyAAdqyruoVjGQVHEnsIoPlasLJwyxNhlIknbPE2CH5z5Ql
         fdxh9LXQ/SSiD7ydi9sXY7dLiuXbHnozZRal+SQV8t98/SIsNBwOwfrIVoTPWwqKFjHv
         G1atk0AcB8T1iRhQnRUVBL9yTkaT9HtyU2s4fs9xQepXT+/g2VMhvD6jHxR0YkG/sBki
         59aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738611973; x=1739216773;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/8OTceTsy8l5T5zXuAxuBTkReAPJDPRSkAl+mS2i590=;
        b=A0vjnSv0ZB7XmfcGg++A7ffgHtNPGECPela5O77rX4H53QdHuA2mpNeOt6mrygGj3U
         zxbNBm4aqhTp/1CkoY9nZGFySKyCTdN4D08yOFi2LsO95FWle0+CGWjKPNQh07KWiEa5
         uw8lQPyxebnr2QXEqZ7mQ6a/zYu5yHkMVZ35bo/6euT73OlDzT3hZcksWZBsjrSDf8P1
         CrRKcThb2c9cifgKz7BlyP3Y4VtKZlw8yVy8V5KBPo464rGhUyyE+l1kqk7qD7FU7d11
         D23xCTl26nXLooPNoecS9+FLxj6NTfySWktqEyuV1rXOlRlDkz3KhAGshwaUPjp7C+eU
         ffmw==
X-Gm-Message-State: AOJu0Yzn33ARHltX3Ew7UW0UrmOQEa3mBIuoUdKwTZw18ESbxNH56zRq
	8HqSEh0gpZ0V4O2sC7pELEfYBJ7VpfV7TBN7Krc7Gm7fsK45l6sm4nbozBr31E0+ujqVnXd1CHA
	7p/gXZrgWWOsKYrTrZelBbyWPvpE=
X-Gm-Gg: ASbGnctL/fn84jJsLuQqJh3UFVHwjjnhRIqVyWifbggDGlwFihGLtrFIa8jNKVxsCAl
	GPJ2LAFv+AhD/Q/AbbehCYvFLwAFRyvScP+iTDU6pUF6NmiXJLTT7i+jYlrPO33YY5qwktxTVAD
	yyNzYxM3TAT0n3qPCEoGGwL8uzvA==
X-Google-Smtp-Source: AGHT+IEOY3ponhu1BR43d7xYQYIq812mERZ1euXjbziy9RKwrDq9Mw81ac1m3KkjbEzsjcfqnk0Lvys2sA2GS3MogNc=
X-Received: by 2002:a05:6871:2208:b0:29d:c9f6:efdc with SMTP id
 586e51a60fabf-2b3e761d7b4mr399313fac.17.1738611972892; Mon, 03 Feb 2025
 11:46:12 -0800 (PST)
MIME-Version: 1.0
References: <20250203154038.33130-1-nikhilar2410@gmail.com>
In-Reply-To: <20250203154038.33130-1-nikhilar2410@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 3 Feb 2025 11:45:47 -0800
X-Gm-Features: AWEUYZmsv_pjJvFwrBlwei5NlRg5NtXeJXp-HXPRLRjZA-eMtsLG-LzYKejQ2Uw
Message-ID: <CAMKF1so-AM=CkOscM1Zg=CiK3vQt4ZVGFrtizxUx-mLEeKpdyQ@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH] glibc: Suppress GCC -Os warning on
 user2netname for sunrpc
To: nikhilar2410@gmail.com
Cc: openembedded-core@lists.openembedded.org, nikhil.r@kpit.com, 
	Nikhil R <nikhilr5@kpit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 19:46:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210732

LGTM but dunfell is EOL,

On Mon, Feb 3, 2025 at 7:41=E2=80=AFAM nikhil via lists.openembedded.org
<nikhilar2410=3Dgmail.com@lists.openembedded.org> wrote:
>
> From: Nikhil R <nikhilr5@kpit.com>
>
> When building with GCC -Os, a warning is triggered indicating that sprint=
f might overflow.
>
> Error:
>   netname.c: In function 'user2netname':
>   netname.c:51:28: error: '%s' directive writing up to 255 bytes into a
>   region of size between 239 and 249 [-Werror=3Dformat-overflow=3D]
>      51 |   sprintf (netname, "%s.%d@%s", OPSYS, uid, dfltdom);
>         |                            ^~               ~~~~~~~
>   netname.c:51:3: note: 'sprintf' output between 8 and 273 bytes into a
>   destination of size 256
>      51 |   sprintf (netname, "%s.%d@%s", OPSYS, uid, dfltdom);
>         |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   cc1: all warnings being treated as errors
>
> However the code does test prior the sprintf call that dfltdom plus
> the required extra space for OPSYS, uid, and extra character will not
> overflow and return 0 instead.
>
> Upstream-patch: https://github.com/bminor/glibc/commit/6128e82ebe973163d2=
dd614d31753c88c0c4d645
>
> Reviewed-by: Carlos O'Donell <carlos@redhat.com>
> Tested-by: Carlos O'Donell <carlos@redhat.com>
> Signed-off-by: Nikhil R <nikhilr5@kpit.com>
> ---
>  ...press-gcc-os-warning-on-user2netname.patch | 61 +++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.35.bb         |  1 +
>  2 files changed, 62 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/0003-sunrpc-suppress-gc=
c-os-warning-on-user2netname.patch
>
> diff --git a/meta/recipes-core/glibc/glibc/0003-sunrpc-suppress-gcc-os-wa=
rning-on-user2netname.patch b/meta/recipes-core/glibc/glibc/0003-sunrpc-sup=
press-gcc-os-warning-on-user2netname.patch
> new file mode 100644
> index 00000000000..7068a81518f
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0003-sunrpc-suppress-gcc-os-warning-o=
n-user2netname.patch
> @@ -0,0 +1,61 @@
> +From 6128e82ebe973163d2dd614d31753c88c0c4d645 Mon Sep 17 00:00:00 2001
> +From: Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>
> +Date: Wed, 21 Sep 2022 10:51:07 -0300
> +Subject: [PATCH] sunrpc: Suppress GCC -Os warning on user2netname
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +GCC with -Os warns that sprint might overflow:
> +
> +  netname.c: In function =C3=A2=E2=82=AC=CB=9Cuser2netname=C3=A2=E2=82=
=AC=E2=84=A2:
> +  netname.c:51:28: error: =C3=A2=E2=82=AC=CB=9C%s=C3=A2=E2=82=AC=E2=84=
=A2 directive writing up to 255 bytes into a
> +  region of size between 239 and 249 [-Werror=3Dformat-overflow=3D]
> +     51 |   sprintf (netname, "%s.%d@%s", OPSYS, uid, dfltdom);
> +        |                            ^~               ~~~~~~~
> +  netname.c:51:3: note: =C3=A2=E2=82=AC=CB=9Csprintf=C3=A2=E2=82=AC=E2=
=84=A2 output between 8 and 273 bytes into a
> +  destination of size 256
> +     51 |   sprintf (netname, "%s.%d@%s", OPSYS, uid, dfltdom);
> +        |   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +  cc1: all warnings being treated as errors
> +
> +However the code does test prior the sprintf call that dfltdom plus
> +the required extra space for OPSYS, uid, and extra character will not
> +overflow and return 0 instead.
> +
> +Checked on x86_64-linux-gnu and i686-linux-gnu.
> +Reviewed-by: Carlos O'Donell <carlos@redhat.com>
> +Tested-by: Carlos O'Donell <carlos@redhat.com>
> +
> +Upstream-Status: Backport [https://github.com/bminor/glibc/commit/6128e8=
2ebe973163d2dd614d31753c88c0c4d645]
> +Signed-off-by: nikhil <nikhil.r@kpit.com>
> +
> +---
> + sunrpc/netname.c | 6 ++++++
> + 1 file changed, 6 insertions(+)
> +
> +diff --git a/sunrpc/netname.c b/sunrpc/netname.c
> +index bf7f0b81c43..c1d1c43e502 100644
> +--- a/sunrpc/netname.c
> ++++ b/sunrpc/netname.c
> +@@ -20,6 +20,7 @@
> + #include <string.h>
> + #include <rpc/rpc.h>
> + #include <shlib-compat.h>
> ++#include <libc-diag.h>
> +
> + #include "nsswitch.h"
> +
> +@@ -48,7 +49,12 @@ user2netname (char netname[MAXNETNAMELEN + 1], const =
uid_t uid,
> +   if ((strlen (dfltdom) + OPSYS_LEN + 3 + MAXIPRINT) > (size_t) MAXNETN=
AMELEN)
> +     return 0;
> +
> ++  /* GCC with -Os warns that sprint might overflow while handling dfltd=
om,
> ++     however the above test does check if an overflow would happen.  */
> ++  DIAG_PUSH_NEEDS_COMMENT;
> ++  DIAG_IGNORE_Os_NEEDS_COMMENT (8, "-Wformat-overflow");
> +   sprintf (netname, "%s.%d@%s", OPSYS, uid, dfltdom);
> ++  DIAG_POP_NEEDS_COMMENT;
> +   i =3D strlen (netname);
> +   if (netname[i - 1] =3D=3D '.')
> +     netname[i - 1] =3D '\0';
> diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/gl=
ibc/glibc_2.35.bb
> index 9400e1e9208..d9cae79ac2f 100644
> --- a/meta/recipes-core/glibc/glibc_2.35.bb
> +++ b/meta/recipes-core/glibc/glibc_2.35.bb
> @@ -64,6 +64,7 @@ SRC_URI =3D  "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};na=
me=3Dglibc \
>             \
>             file://0001-Revert-Linux-Implement-a-useful-version-of-_start=
up_.patch \
>             file://0002-get_nscd_addresses-Fix-subscript-typos-BZ-29605.p=
atch \
> +           file://0003-sunrpc-suppress-gcc-os-warning-on-user2netname.pa=
tch \
>             "
>  S =3D "${WORKDIR}/git"
>  B =3D "${WORKDIR}/build-${TARGET_SYS}"
> --
> 2.17.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#210658): https://lists.openembedded.org/g/openembedde=
d-core/message/210658
> Mute This Topic: https://lists.openembedded.org/mt/110972964/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

