Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1227C43458
	for <webhook@archiver.kernel.org>; Tue,  7 Jul 2026 10:19:34 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.170002.1783419568929843797
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2026 03:19:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=39U6zI/z;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so38327455e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 03:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783419567; x=1784024367; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aogux8rRjTixdeNdBT5IgSrnqXx0F1Uh4Y7Br+JK4Ao=;
        b=39U6zI/zUDc0QXcPQCayseQWqHQRZeOJMs2yNCRn8H6MQgN7XZvmQ7l4746mSYnVOl
         wNVeTN1hLypa7ugZaZ6risff6NAOeHSotgyjAzo9GlQm/GZwDKq0UhxjzYBJ+GA+X2Si
         zEpcvQ0CIlRkP8kGr3GF7qiqLb1HX4WIkXxHE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783419567; x=1784024367;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aogux8rRjTixdeNdBT5IgSrnqXx0F1Uh4Y7Br+JK4Ao=;
        b=kgeZuwTpQZUy3oS1QYhm5rYArsAiSY3bUG72anfTzDkmlE9aj9yCnjuYMBwN+a3gvJ
         Viz8gGh1Y/AaSUpmZpoibGCTeJ+dG2dOTGSjojiDGspnTs7NuaceAJ/l808x5WJJj4T8
         TGeXBGNITTCeZrv8vE6xq73o5bYIWl7swsGfT1ZSLRSOrlExweh/HxCEPxYg5/SEH7HB
         HR9SyoxWqFYfScNiwKpirsjf60uzzz4591peMoOPhhxGBcY1pBLpgd6m64Q6821pZBil
         jBTtGCuSbp9ntp3rvz1Ym61HpxBwexS0RDQtppfFo44cGBe9lJdUM2t+w1Y93b1tJN3b
         8jsA==
X-Forwarded-Encrypted: i=1; AHgh+RoM7xwAY3JcfFDGjMvFtwGiXNKcwp1CQodYA9WlGcyWRhxIx1bXluLMp5U7IVDpUlVOpLzvdic8o2moEBAZ5oN3SQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxbe08rYJ+nMtzXcBF82tzIkTDnUg9h1bo/z4k2JclqQf7I8Ty/
	1UwwUxb+Dab+uW4Zp8oajugdlXF0h+0TPP6wNOAvCvvL1XqqXaQVOHOkv2eFD18+cEA=
X-Gm-Gg: AfdE7cmSyg9aIZ21V9A9BRvh44c+seQsBcLmmPuWh1xKBpy0jKg7KOzrTyFrz0jLSUp
	Apo2FvtHt5D1cflh0qn11Pn+b+GA/RAxpUhdePjzx9SbSWI9ruMtgAyUNvZcc0SfjUYOJfazg1j
	4ximLhFDaT8hPIH9rs3wqFcKI1PjsPEN18XusJtOcdKpEdYfZNFSxfk+/jsySLhYEu8RVgL4/Yc
	l5e150RA8RzVhv0bkALa64/KoUZaQnTqjIZY4p0VBRPMWCJ8eYhiyYWhW02CvySkG7FNHF4vDWX
	+O3QZOM7rFoltir5pklYDFksCRkAgK1KcylWqZqAJ7crQljRaIG4q9/vbgY0ynGXfo4Ljff5Kvn
	V/uu0Bl90MUOkcVWoE53FGsNs/a/lm/mjCtH0ENTleLL94Br4A6MpHkfPERkz+CSF5htvbJeK3F
	FMDhu+5X5lN3+GMzvk7NJrvu3jsJWDmvscfQBPmBXdiv8nlr8InlORRJoVXe42MY4OTpyD2UsA
X-Received: by 2002:a05:600c:4205:b0:492:523f:a3df with SMTP id 5b1f17b1804b1-493df062b80mr30577735e9.5.1783419567080;
        Tue, 07 Jul 2026 03:19:27 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f3318dsm39130245e9.3.2026.07.07.03.19.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 03:19:26 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Jul 2026 12:19:26 +0200
Message-Id: <DJS9H2DLIVVC.2DDDZVKTEK2TS@smile.fr>
Cc: <xe-linux-external@cisco.com>
To: <asparmar@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH v2] bind: Upgrade 9.18.44 -> 9.18.49
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260630060410.1203985-1-asparmar@cisco.com>
In-Reply-To: <20260630060410.1203985-1-asparmar@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jul 2026 10:19:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240376

On Tue Jun 30, 2026 at 8:04 AM CEST, Ashishkumar Parmar X (asparmar - E INF=
OCHIPS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Ashishkumar Parmar <asparmar@cisco.com>
>
> This upgrade fixes CVE-2026-1519, CVE-2026-3039, CVE-2026-3592, CVE-2026-=
5946 and CVE-2026-5950.
>
> Changelog
> =3D=3D=3D=3D=3D=3D=3D=3D=3D
> https://downloads.isc.org/isc/bind9/9.18.49/doc/arm/html/notes.html

That changelog contains:
| Notes for BIND 9.18.45
|   Feature Changes
|    Update requirements for system test suite.
|      Python 3.10 or newer is now required for running the system test
|      suite. The required Python packages and their version requirements
|      are now tracked in the file bin/tests/system/requirements.txt. [GL
|      #5690] [GL #5614]

Feature changes are not usually acceptable for stable. Can you justify
why this is the case here?

Thanks!

>
> Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
> ---
>  .../bind/{bind_9.18.44.bb =3D> bind_9.18.49.bb}                   | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-connectivity/bind/{bind_9.18.44.bb =3D> bind_9.18.49=
.bb} (97%)
>
> diff --git a/meta/recipes-connectivity/bind/bind_9.18.44.bb b/meta/recipe=
s-connectivity/bind/bind_9.18.49.bb
> similarity index 97%
> rename from meta/recipes-connectivity/bind/bind_9.18.44.bb
> rename to meta/recipes-connectivity/bind/bind_9.18.49.bb
> index d424edcb4e..723a09e739 100644
> --- a/meta/recipes-connectivity/bind/bind_9.18.44.bb
> +++ b/meta/recipes-connectivity/bind/bind_9.18.49.bb
> @@ -20,7 +20,7 @@ SRC_URI =3D "https://ftp.isc.org/isc/bind9/${PV}/${BPN}=
-${PV}.tar.xz \
>             file://0001-avoid-start-failure-with-bind-user.patch \
>             "
> =20
> -SRC_URI[sha256sum] =3D "81f5035a25c576af1a93f0061cf70bde6d00a0c7bd1274ab=
f73f5b5389a6f82d"
> +SRC_URI[sha256sum] =3D "c43ce4548ebed788cd9df63658a7de105ceafba43fcd63fa=
352b1093e525cd24"
> =20
>  UPSTREAM_CHECK_URI =3D "https://ftp.isc.org/isc/bind9/"
>  # follow the ESV versions divisible by 2


--=20
Yoann Congal
Smile ECS


