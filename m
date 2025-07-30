Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB83DC83F26
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 16:27:42 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
 by mx.groups.io with SMTP id smtpd.web10.39881.1753892861745984124
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jul 2025 09:27:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZCwgIAp1;
 spf=pass (domain: gmail.com, ip: 209.85.128.176, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-71a3a341fe9so20285607b3.3
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 09:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753892861; x=1754497661; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0881s+owTHObeG/LSQwBnQv/EYhJ8gmOrsj43FsYFgY=;
        b=ZCwgIAp1QnxcBON4zMLWUVa2xMqkY9/7GwR4V0zR9DzBekkaPkg92hKOAFmRvQR0tv
         HoFnISRiaBtA5oqKW0i+v46TX1syEXDzMVp6EKxwResGvVhTzXBIE/Ry1Pmw5KMjv1k5
         qgOJCkvpn6Kk1Zed0FOTgzSBClJ+MfY73dVw9Hrcyvk8EnIuMKpEhOIMkSS8RvnYx6K7
         l61j+TR0UC82w9NI+jRgfxRC0qjeMtNwRqECGOCrvAL1toJtiLAEeLrPvxybh5/pP93R
         OC6JnSy9HtedMByWNOC5NivTN5jPURSgVcvKaA400o/dgvM7Krby9v3w+RYikjsw2xei
         eNSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753892861; x=1754497661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0881s+owTHObeG/LSQwBnQv/EYhJ8gmOrsj43FsYFgY=;
        b=WV1zcjDxwBgrc8MGQMqEcYG8DPpR/XR/6ZVk9d8ZTC4CxngxX7uzzkZMgw9l/Ripeh
         zCv2hVpDuacwLYWaarQ8FJKYlH8DDl56y5D6LwsUiPflWhZ12ylm/Gk0cgNlBz+z6F9z
         gDgI6xiYq96Kz8yL35PywwRev64bjRcP2H1sFikITCE9wZogFfH5ooEyNwGsNtcLupWV
         khlQn+EyJOrT3ZrxrE1gr92maXEAHf3NyCK+2mc1R6Qdf/ibIZtfQ8swvPq8pIr2gJhE
         Tl6bUxNGyKj9n/xpVSqsRdBaHdsN+b2uKp7Dc4iDJ55CjKd6G5eWd1OW3fAk6unGfPSs
         aLlw==
X-Gm-Message-State: AOJu0Yw6wAM7z8+TyNyMS60j0BF+epINBWFil07ulK3nKHyYbY5QYrdg
	FB2fsIyits9QHHjdP8puSHyKasHN/T6eXEGmkgij6t6RGWGQ3FIdFw5FjU/t6t8TEHda4c1ZuVN
	jkcwr4YICxKhSOkoPmlgl5T2vDXvKUsZWNlHJQCU=
X-Gm-Gg: ASbGncslBET/IRZdbg5/9aXN+rSJZdSgb9ytwzmFp18EHbqpi0jqsTAFpslmItfKdPZ
	koDPnjd3gB7vSDCMWrboB03Z+yoaXZWxQHlouJaCz0J4aiqQQUV5My11LZ0UUzy2w4IdlkZqrDG
	MfgyXjL9zONJH7NvoDhiXRDQlOfijdeG2qBrzPwHi1a7yay9DgsEg+PO0PgbzOTiB9+3MbZxtsJ
	m0kPaFBuSBQUIGsXCC3+okq77ONNUSgguzpMDs0Eyuz
X-Google-Smtp-Source: AGHT+IF+sComAFSNCfFYD6ipgsJGPw0Pi8lD9LXnEsR45umuJYBhikIjENBxpIIHaTlU/E5r1diKLBjy1jlRiUKRoiM=
X-Received: by 2002:a05:690c:6c09:b0:719:f37e:e69c with SMTP id
 00721157ae682-71a466c766cmr50801607b3.36.1753892860686; Wed, 30 Jul 2025
 09:27:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250730162112.67549-1-nikhilr5@kpit.com>
In-Reply-To: <20250730162112.67549-1-nikhilr5@kpit.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Jul 2025 09:27:14 -0700
X-Gm-Features: Ac12FXy8bBlKfupb6Ykn24OQH69G7M0JELIx3bs13CuXQYHUh9Q0s4fbK4CIBNc
Message-ID: <CAMKF1spu==k3jvfuxjqL2t0hD825BdieWqi1oZcN0_oNtxkfXA@mail.gmail.com>
Subject: Re: [OE-core][master][PATCH] cmake: Enable debugger support in CMake
To: nikhil.r@kpit.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 16:27:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221136

On Wed, Jul 30, 2025 at 9:21=E2=80=AFAM Nikhil via lists.openembedded.org
<nikhil.r=3Dkpit.com@lists.openembedded.org> wrote:
>
> Starting from CMake version 3.27 support for interactive debugging of CMa=
ke
> scripts and configurations was added. However, by default the `nativesdk-=
cmake`
> is compiled with debugger support turned off. This change enables it.
>
> Signed-off-by: Nikhil R <nikhilr5@kpit.com>
> ---
>  meta/recipes-devtools/cmake/cmake_4.0.3.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/cmake/cmake_4.0.3.bb b/meta/recipes-de=
vtools/cmake/cmake_4.0.3.bb
> index 7d8b8cac65..604e306667 100644
> --- a/meta/recipes-devtools/cmake/cmake_4.0.3.bb
> +++ b/meta/recipes-devtools/cmake/cmake_4.0.3.bb
> @@ -43,7 +43,7 @@ EXTRA_OECMAKE =3D " \
>      -DKWSYS_CHAR_IS_SIGNED=3D1 \
>      -DBUILD_CursesDialog=3D0 \
>      -DKWSYS_LFS_WORKS=3D1 \
> -    -DCMake_ENABLE_DEBUGGER=3D0 \
> +    -DCMake_ENABLE_DEBUGGER=3D1 \

Does it impact cmake execution time in some negative way ?

>  "
>
>  do_install:append:class-nativesdk() {
> --
> 2.34.1
>
> This message contains information that may be privileged or confidential =
and is the property of the KPIT Technologies Ltd. It is intended only for t=
he person to whom it is addressed. If you are not the intended recipient, y=
ou are not authorized to read, print, retain copy, disseminate, distribute,=
 or use this message or any part thereof. If you receive this message in er=
ror, please notify the sender immediately and delete all copies of this mes=
sage. KPIT Technologies Ltd. does not accept any liability for virus infect=
ed mails.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#221135): https://lists.openembedded.org/g/openembedde=
d-core/message/221135
> Mute This Topic: https://lists.openembedded.org/mt/114451722/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

