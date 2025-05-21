Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D30C8C54E65
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 20:27:54 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.web11.8690.1747859268250110203
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 13:27:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fIsSyaWM;
 spf=pass (domain: gmail.com, ip: 209.85.161.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6066c02cd92so3863365eaf.2
        for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 13:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747859267; x=1748464067; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wafvYGarm98oBQ9nGwoHoGfhmwGOHmFx9IIl+rjXpIA=;
        b=fIsSyaWM9DP8dPp5l9fdqlJAXAMqUlY6iKYjQIhMI8v7HUulMOXfy39aUWbSCaufjQ
         w8aAXXexWowtiimRUqj4j0uo45ZaNfUo0RNdR6fLRWphu0br7MIvfRDmtML9BhIGpeBR
         RdqF0orJSisjuFaDYBGL+SGFmfEptXPBZfiVg1VA7t+fXtITuFLT2Iezo1OmDusNpCjd
         JHoRHgQzHF2e9hXN9ip1qkWPayPhCvY49kXxgGBCdKhBlbWJtcvLp0BBS/WLqF0vX1Pp
         AUEjyzpvKUgTJvxFRABoSyXik8Cd5PeTdTtGCkElKxEU7XjGUjrAeizvK6EPLE3zW6Cd
         LY9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747859267; x=1748464067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wafvYGarm98oBQ9nGwoHoGfhmwGOHmFx9IIl+rjXpIA=;
        b=kAu7aCkH/nBAUa5iCts3KMlAeGMwGs8D/4wTeXoiDNId2/HtkBJXATQwCa86t/tvE5
         33dSmEveybnOYUiS9i2y0T+kTHp4EzjnPAhk71DcPvDLEGMEg1ZcTEjhaPMyreJScCZd
         4xcpPXPtO8wXq6V9m50EK0sdZrzEWoLOL4iBhA89rpxiArdPCTIes65jAIz3icnRCdEK
         6neNaCjSLz9yALeEBjQUsBidhK9YXDMclfWeUTT/wzxsEn4/6iusiteT0cOoZfsmVYgM
         oha9mfodeV7QMjDQ+niSF3poTCj3IgzwZOEy0JeWIxT9AtPm4tJminrfUoNz3wufJ0hL
         2ZSg==
X-Gm-Message-State: AOJu0Yx7LmDBqc2MfXgP8BSOCxROd3t5tPtSEUV6WGbG7jb+AlKySmc+
	tx9ziQLjriTAMDvmbk9+aFQ85KNnDxeOi4cuZwfRE1yFyzpq88+LaOqB/KFn6mCD7Dj9HTd74mv
	t887XAYLHciZFZzAROI6PVlUPeejweMk=
X-Gm-Gg: ASbGncuntXr8z93lMf9owNIOtr4HaKLTVDydUPP2a3GMWBtyUu6u2srhuQ4YxSGeEjR
	JToe4biezGAeiPy6fywQIm8c7Ec6bENOolEyRQ55Y+GmC9B+lvpgJdPgBVErRZSNB+jT/3doKB2
	5TpLXHsVjNFxGkzgTlWU72M3csrTUNM1CfHN4/Yk186Gupm/Cg8cLxpqOdrwFMqQ7s3OySFw==
X-Google-Smtp-Source: AGHT+IGambPrYtYXsomfpQJKo2PmmWUpTDzDB/XyGFxt4GMTjVAk9Git7/aRFvPpnn/Jmzr0XQbWABKqjDIhQEeLHj4=
X-Received: by 2002:a05:6870:8301:b0:29e:4340:b1b with SMTP id
 586e51a60fabf-2e3c1c026eemr15424466fac.9.1747859267192; Wed, 21 May 2025
 13:27:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250521162632.27169-1-reatmon@ti.com>
In-Reply-To: <20250521162632.27169-1-reatmon@ti.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 21 May 2025 13:27:21 -0700
X-Gm-Features: AX0GCFuvpZ2JYwsVYmnvPRoUkHzy0hvZJVdgOVqymMb7_zN-unTt0neROKwcbu4
Message-ID: <CAMKF1spnAHWh=gytPt=vfaFBh81A0VRxFvWqqZnWk07YAQNSVw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] sbc: Fix for gcc 15 compile error
To: reatmon@ti.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 20:27:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217059

On Wed, May 21, 2025 at 9:26=E2=80=AFAM Ryan Eatmon via lists.openembedded.=
org
<reatmon=3Dti.com@lists.openembedded.org> wrote:
>
> With the move to gcc 15, the code is not generating a compile error.
>
> ../sbc-2.1/sbc/sbc_primitives_armv6.c:284:9:
>    error: too many arguments to function 'sbc_analyze_eight_armv6';
>       expected 0, have 3
>
> Simple fix is to drop the C standard down to gnu17 to avoid this new
> error.
>
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  meta/recipes-multimedia/sbc/sbc_2.1.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-multimedia/sbc/sbc_2.1.bb b/meta/recipes-multim=
edia/sbc/sbc_2.1.bb
> index 5aaa52313f..8b91e7e65b 100644
> --- a/meta/recipes-multimedia/sbc/sbc_2.1.bb
> +++ b/meta/recipes-multimedia/sbc/sbc_2.1.bb
> @@ -19,5 +19,7 @@ SRC_URI[sha256sum] =3D "426633cabd7c798236443516dfa8335=
b47e004b0ef37ff107e0c7ead32
>
>  inherit autotools pkgconfig
>
> +CFLAGS +=3D "-std=3Dgnu17"

maybe changing
static void __attribute__((naked)) sbc_analyze_eight_armv6()

to
static void __attribute__((naked)) sbc_analyze_eight_armv6(const
unsigned char *buffer, int size, int channels)

in that file helps ?



> +
>  PACKAGES =3D+ "${PN}-examples"
>  FILES:${PN}-examples +=3D "${bindir}/*"
> --
> 2.17.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#217048): https://lists.openembedded.org/g/openembedde=
d-core/message/217048
> Mute This Topic: https://lists.openembedded.org/mt/113232263/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

