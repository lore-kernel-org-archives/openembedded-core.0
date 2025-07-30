Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AC80C87FCB
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 15:52:32 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web10.38961.1753890749755507280
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jul 2025 08:52:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Z4gTdy+F;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.174, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e8e2b50f8f1so4901276.0
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 08:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753890749; x=1754495549; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ncYr7o4Tr45dG2o51mpSc9cfk6WZvaAAzIaSvz99NKo=;
        b=Z4gTdy+Fp/VKT3a2IoTMpMFH1tuiYhwavZmjIb5gx4cHDLbbSn3aq3eN7uc63mRoIO
         cvcMVCuTprPzhd6M9eeE+35yf4eOcGFbyZ3mhXszGeVn7fnQ2qhqPffR5eQp6d2/hoMw
         3/L0rapQtT+S2XdhsMw3S219nX2Cn63f7kFF6DjxmyFYBpUBxh9zj/X0OuLNPnbnOLKh
         hT2ai45Ron8Lm3Ak96kMRSU2XPI9CgCeoPk7EWGOenXZQJBbSa1/xy7Y12cg/9OP41GJ
         Nq7196FDjTEyFccOto9ITfxg1Fj4FwMU3RsEVDV1v+Eux/tE7FmdJ/0EDNFMXAdc5iXl
         867g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753890749; x=1754495549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ncYr7o4Tr45dG2o51mpSc9cfk6WZvaAAzIaSvz99NKo=;
        b=TE4W2dRzNG4V3CrAZXrVW8VQYM8nhpEMpmkJYpZ+9lJxvkSelW2WlE2UFhCuX79Yjs
         CxSU/S6yt7u0TIv51LX1KwzAZG1T3dgW8MVCSdCce19VxTPXRs4wZNQtgx+FkXCQhW0D
         t26xWI3MnVUcDfmIR8Y5MndEZhLADXN+4Exd+q/Pgf6jziXef/aZVNYyypubenkeu7kQ
         yHKAKnfWtBbaB8ZNfs1U/8BEvHOrOnrQWf4GJJSYLnMmgL/2AJS4pz+AX3eela7wsTfo
         nTjaL0XLi/KwTDbE4Q+Og/V/TSsilcnLvUI/FCGUM1AIVvi3nQcfJAmohFJPwXiQz7TH
         LGDw==
X-Gm-Message-State: AOJu0YxBjjnxOXEu+5lkYB1gLwCG8FLsCWBZjTMmybeonWjCrGhKUsgh
	CIErEfdOibXpGB/n8umsi5cUhtfeJy9m67QG/ushQMpkxfoAiTpD1nkB3OcXfCpns4EMYjlt9Ca
	w7Gve2nTJSDvx/Bjk+ccpSuJsuvKg7H+XMiZqh2ZWnA==
X-Gm-Gg: ASbGncvRUYGOPeM1/MjVFH5wU7I3kjGp7/zy+lM0b0IZIX8Syuhn8mrNNsFamJVGgbd
	JYDQZyhaArZksOIg2zwfNC2DgJYdFeZk+kiJ8q+WhJwa0hYurhwL0lk2gNVKb2mCDFZuqqbNWNF
	vYkJxk+CaFJgkRXJEcswLW/kxKFhIfi29kVux4C7ZiqLYjhmsc/B+u7FelwRq/r3w17xSCcJ2rx
	VEkP6tQ+hFda/2n5sTO54hoGmGXEqGwNsPRLg==
X-Google-Smtp-Source: AGHT+IFGqssk/Q9PSiwl/0CnfrZYdjEY7ZPAvPAGeXT/NmmcPQ4nA+TQsUmTdgx96O8eJ7pAUoZyeHuYON09NTHXFmE=
X-Received: by 2002:a05:6902:2410:b0:e8e:1acc:3cbf with SMTP id
 3f1490d57ef6-e8e314635a3mr4880114276.10.1753890748753; Wed, 30 Jul 2025
 08:52:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250730041354.58332-1-nikhilr5@kpit.com>
In-Reply-To: <20250730041354.58332-1-nikhilr5@kpit.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 30 Jul 2025 08:52:17 -0700
X-Gm-Features: Ac12FXxPN2pfqqk5dAdEHZPNUZVlrTtzyEr03sJKGXScchS7gmDTKAVC6t_8hv4
Message-ID: <CAOSpxdYW9TJHqc1gB1Wi0AxDUTgOTt_Wg8c+Zn5WM8eF+BPMrQ@mail.gmail.com>
Subject: Re: [OE-core][scarthgap][PATCH] cmake: Enable debugger support in CMake
To: nikhil.r@kpit.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 15:52:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221121

This change would need to be accepted in the master branch before I
could even consider taking it for stable branches.

Steve

On Tue, Jul 29, 2025 at 9:14=E2=80=AFPM Nikhil via lists.openembedded.org
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
>  meta/recipes-devtools/cmake/cmake_3.28.3.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/cmake/cmake_3.28.3.bb b/meta/recipes-d=
evtools/cmake/cmake_3.28.3.bb
> index 63d483801a..5c3b6247fc 100644
> --- a/meta/recipes-devtools/cmake/cmake_3.28.3.bb
> +++ b/meta/recipes-devtools/cmake/cmake_3.28.3.bb
> @@ -44,7 +44,7 @@ EXTRA_OECMAKE=3D" \
>      -DKWSYS_CHAR_IS_SIGNED=3D1 \
>      -DBUILD_CursesDialog=3D0 \
>      -DKWSYS_LFS_WORKS=3D1 \
> -    -DCMake_ENABLE_DEBUGGER=3D0 \
> +    -DCMake_ENABLE_DEBUGGER=3D1 \
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
> View/Reply Online (#221097): https://lists.openembedded.org/g/openembedde=
d-core/message/221097
> Mute This Topic: https://lists.openembedded.org/mt/114443689/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

