Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05B1CF428FA
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 21:05:10 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5651.1776287108577623259
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 14:05:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=USR1PqS9;
 spf=pass (domain: smile.fr, ip: 209.85.128.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso111831145e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776287107; x=1776891907; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IXStZUR/f1Rd1Lzcx3R41vfB45gQoKfpibBjkQXCOmo=;
        b=USR1PqS9DuILZkmEOH7BAbNj//SLFzslvKQu5qBfKfpllz1seZUj3cQXjxZJ5ky2QT
         05WGY84bK/hey7vt7rScGhHVSaBgnKmGRV9fs8E+IAxBud10pzI2tc7olmvwrSH1Xcf5
         lIW7h4OMKftJxw++C8kSewGuhWISjAfIx05VI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776287107; x=1776891907;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IXStZUR/f1Rd1Lzcx3R41vfB45gQoKfpibBjkQXCOmo=;
        b=G56atQ0+DlZShM2Zf4xGZbS4JIOrmeCfeQYzyGlOmHc206paWRp+po+hUSX540uXoh
         tCh4daFJupt7JBwlOhjlCpRgwp/H4xAXg0/EKOes0QHk0SUEAufeSTsk1/53fJk9pQF4
         7sUKgHY/rkv8yDtcKuDY9992DKWvpyfb0Z6cTq+BzwhX83PhSGGCEfTRnDOGsOG4xA9n
         hzKB+x9D1i2twWmgcUlObgpUtXL/n4DO6MePVYjud7OuWOjQN0n8By0vts1EQ9WdNR7H
         3lv3r354HrQxLZ2to65IRDp+ls+ln0mszUZ6xgSRL5elo0PVPAAiDxpbb5ZBG3r6cmUY
         hL/g==
X-Forwarded-Encrypted: i=1; AFNElJ8RhUai4m7/6jB+Ch7aIWmrBEvHe12a6glAsTgAA5dDXSFNTO4QNr5HgOfCljFdo3rv/ijcX78X1LWp6vHZ5rIvmA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywt5/RYVB/oCT3Cd6GhUweb+1dJTibAIL4roViTDGybBYcrckYX
	Aw9Xi2XhBlkZXVX6xjz/Nva6kNEuxH5UVc51S1jP3b3eHw2xy3aZVL6fJff1/6FxOv4=
X-Gm-Gg: AeBDieuAbI5H/VqxcslTzJDIABiPglCLn55E10WsHcxl1fPs8LeZM+R1gAOgjmO02Ja
	HEAHgXEtoDsrweTorLLAj69ArYNv9O+pJMpd4pHSusMlibqkWIT62pXNfRMsKQLFrxgT0eqilZ1
	SorTveNPiJU8D6kr5aTSTiOuNKFi27JCFSQ79lLuipEbohZA9Zw6FdQZR2xj8fCwlAuD+O3pAfG
	0ykDMD5QnxhGmbZpDHIonqe6E9CXkA7Z/Owfmg/ZvfD/ZpY9DowXE+D3i4ig89uJmk54f8u3sWz
	n0EOL3OcASnKcj2geY8INT2npeUsqEDHEOHEd6JoItbUvctXg/SPTnUZOoWldOkFI0WWhSQlYJ2
	yG0uAM8KxfRH/fvmd1jQc0VcrSCSif5bUAFgKP3DN0eLb1CBw62tgVg+yBXz45mha926NPw1mrk
	3soRo16PEmubyOtJPOnApcjbF+7sRRXcuWmvIw598NbNpgaeq7dK/NpJTrZ2cm4+QTGCkfhlrnh
	t5hEVIuN+nwQHoyTlleYz1ESskPqtlWwP72
X-Received: by 2002:a05:600c:a109:b0:477:76bf:e1fb with SMTP id 5b1f17b1804b1-488d6843245mr236240865e9.16.1776287106775;
        Wed, 15 Apr 2026 14:05:06 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f1de4ffasm85830115e9.5.2026.04.15.14.05.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 14:05:06 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Apr 2026 23:05:05 +0200
Message-Id: <DHU1874ATB71.203BIG61AS590@smile.fr>
Subject: Re: [OE-core][whinlatter][PATCH] barebox/barebox-tools: upgrade
 2025.09.0 -> 2025.09.3
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <ankur.tyagi85@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260408000932.10450-1-ankur.tyagi85@gmail.com>
In-Reply-To: <20260408000932.10450-1-ankur.tyagi85@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 21:05:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235329

On Wed Apr 8, 2026 at 2:09 AM CEST, Ankur Tyagi via lists.openembedded.org =
wrote:
> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> 2025.09.3
> ---------
> Fixed FIT image vulnerability
> https://lore.barebox.org/barebox/abljJRMecNdejSD0@pengutronix.de/
>
> Changelog:
> https://github.com/barebox/barebox/compare/v2025.09.2...v2025.09.3
>
> 2025.09.2
> ---------
> Changelog:
> https://github.com/barebox/barebox/compare/v2025.09.1...v2025.09.2
>
> 2025.09.1
> ---------
> This stable release is specifically targeted at whinlatter which is
> currently at v2025.09.0
> https://lore.barebox.org/barebox/aUkaSKDePHF8__LB@pengutronix.de/
>
> Changelog:
> https://github.com/barebox/barebox/compare/v2025.09.0...v2025.09.1
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>

I'm a bit torn on this one. Because on one hand, this looks like a
proper stable branch (and I appreciate the effort), but on the other
hand, there are changes that I find too risky:
For example:
* API Change: https://github.com/barebox/barebox/commit/5e9f709b2b56bd9689e=
174572ef2af59b9fed5d2
* New feature: https://github.com/barebox/barebox/compare/v2025.09.0...v202=
5.09.3#diff-2dd6d3e4c91931c982f091155a47dd8d03e26731f8d59b112e938508fe12255=
aR1

Thoughts?

In the meantime, I will keep it in my branch for awareness.

> ---
>  meta/recipes-bsp/barebox/barebox-common.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes-b=
sp/barebox/barebox-common.inc
> index e41d0858fd..91865b4d44 100644
> --- a/meta/recipes-bsp/barebox/barebox-common.inc
> +++ b/meta/recipes-bsp/barebox/barebox-common.inc
> @@ -3,6 +3,6 @@ SECTION =3D "bootloaders"
> =20
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df5125d13e000b9ca1f0d3364286c4=
192"
> =20
> -PV =3D "2025.09.0"
> +PV =3D "2025.09.3"
>  SRC_URI =3D "https://barebox.org/download/barebox-${PV}.tar.bz2"
> -SRC_URI[sha256sum] =3D "7df1aa47bb7bf1763a729137ac773e69a4052812af094475=
d739fc63a9295f0d"
> +SRC_URI[sha256sum] =3D "e87eb863cbe45e4f5af8930825c8f6e20c02b82451e9e112=
5ea1c73c1fb49a87"


--=20
Yoann Congal
Smile ECS


