Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85F81CD98CF
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 09:21:46 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.149936.1781601701159380149
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 02:21:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=x/RvEz0F;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4921e4dd62dso25075775e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 02:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781601699; x=1782206499; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5hgRVqMbJQ8WIWildq6KKO9tObZeh14fprGUdItsHJA=;
        b=x/RvEz0FRSmOS/cH8LYi6Q8cmK843LLWxTc/xB+DzdvimsNTpmIEdC8ys5LedZzssA
         NnA4r0kB/TF2UvNG279Xdh42EfonVZn9CEK6ZTC7/0m6bUEH8n5VqTt8dTL35qu++EtO
         fiak90cpzYV2ymcY2kOFWxfQpVuXEtUQ9LMck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781601699; x=1782206499;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5hgRVqMbJQ8WIWildq6KKO9tObZeh14fprGUdItsHJA=;
        b=TIqMYBhSlLMqyeW0pi33kZS1Z+5jLOxNmniyM46ijb3IjPAJIZsRDaqpLkEWC8CN+i
         SLMennPlI5EJZ/FfRrwPwzrDrsr+Ms1q/2eGZSek+RZZctxz8K5xrTE2QaEnMCE/ACLN
         8we+V4UhEi20g5VTSZnCCgKmDNRCWSdPXjdzIDXUWxCNVSRGAtc3TPFrvU8Hmr266UWx
         zWzmPlsFLdu1AKpLiSb1DKbab7cJ0VXtjY5JebdEUlRi85L8eMEg8BiOWjzXxrQALAX5
         4eb4byBJYxVR4guTXWP/QdfPIeyV/7cDTWxUpZ3l2OMtoIIi4fiOtkg0C1XJWz01qe9Q
         cm2A==
X-Forwarded-Encrypted: i=1; AFNElJ96swwODljL/HoSirrkrmr783x8NnI4i9vCn2zUwdoz2iN3Xrz+VqR4W/VL2zksOhtKOuBMgq0qmym1cVnIi0tzVA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyCvN2SwjoNUWRtQZ8EiYBlYagS+dn1CvE6r5tmr0m4FN6w4C4k
	3uqwrLxWXJUD1nwIR7zMvT+vxSZa3VpPgPQ/UFszmrOg3/j1Z6/Im4lqkRV0hOrUyEw=
X-Gm-Gg: Acq92OEf85H0UgR7CVJBXDfwVXBZNKQvjUnLr3NnrolInugztL/xpGSNcSIFwpEM+vs
	xIGLTN6xgDcBETRFHPp6/39rK83H1yL/bVEURwFfWEa2Idv3K0xTFApl5cKRP9lYIAbymPCIZaL
	DnMhvMN1Ur7sOrWrclegEWPj7Q9c0+YfjcZ6f2R8Fj9Y2LbBqToSIaKUJ4g2NOtL5Xje91Siaco
	vWWB2VQA/S3rwY2qbhD5s/uvnedy/7f2wSPboiBVPW1ycqgpqH9vcuMpzqv+BvcfYBR7uslfm2g
	rVFtjDwP/lBLEBrmrXydKsoITqwOiQeEvb/MUzOBFg5+3+y6XUqP/vwxA7+sB69szmElr2eoXb/
	AEjXHf17jmaJ1daHkOWmzXBE5/pwIXRRQmP0JYDzFuzZ3Soccm7qudkeYjznoYedxpGCiKgORlr
	pUi/su+wyLY27IAcCwrwunKi/ln+TSImMTNyjyuvfBGijw8i/UO2Zqxr6xFbHbN6mxAByn1kVbo
	gc0gmU3jH8JcPDY
X-Received: by 2002:a05:600c:810b:b0:489:32b:ac0b with SMTP id 5b1f17b1804b1-4922fac1214mr42673935e9.6.1781601698931;
        Tue, 16 Jun 2026 02:21:38 -0700 (PDT)
Received: from localhost (2a01cb001331aa00fdf7edbba0bd5f9d.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:fdf7:edbb:a0bd:5f9d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a8ebe3sm36433675e9.11.2026.06.16.02.21.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 02:21:38 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Jun 2026 11:21:37 +0200
Message-Id: <DJAD3D4T73U8.2CAFZBHD785ZZ@smile.fr>
To: <changqing.li@windriver.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH 3/4] libsoup-2.4: fix
 CVE-2025-14523
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260429061533.858115-1-changqing.li@windriver.com>
 <20260429061533.858115-3-changqing.li@windriver.com>
In-Reply-To: <20260429061533.858115-3-changqing.li@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 09:21:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238882

On Wed Apr 29, 2026 at 8:15 AM CEST, Changqing Li via lists.openembedded.or=
g wrote:
> Refer:
> https://gitlab.gnome.org/GNOME/libsoup/-/work_items/472
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  .../libsoup/libsoup-2.4/CVE-2025-14523.patch  | 52 +++++++++++++++++++
>  .../libsoup/libsoup-2.4_2.74.3.bb             |  1 +
>  2 files changed, 53 insertions(+)
>  create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-145=
23.patch
>
> diff --git a/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-14523.patc=
h b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-14523.patch
> new file mode 100644
> index 0000000000..0f1d751aeb
> --- /dev/null
> +++ b/meta/recipes-support/libsoup/libsoup-2.4/CVE-2025-14523.patch
> @@ -0,0 +1,52 @@
> +From d6028a6e6a8417b7fb6c89f6c10fb94781435ee6 Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Wed, 4 Feb 2026 15:08:50 +0800
> +Subject: [PATCH] Reject duplicate Host headers (for libsoup 2)
> +
> +This is a simplified version of my patch for libsoup 3:
> +
> +!491
> +
> +Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/libsoup/-/com=
mit/d3db5a6f8f03e1f0133754872877c92c0284c472]

Hello,

Having discussed this patch a bit with Paul, we can take it but the
upstream-status needs to be clarified: Something like:

Upstream-Status: Inappropriate [different fix applied on libsoup 3.x branch=
, libsoup 2.x is EOL]
Note: This was pushed to the libsoup repo in https://gitlab.gnome.org/GNOME=
/libsoup/-/commit/d3db5a6f8f03e1f0133754872877c92c0284c472

Can you send a v2 with this?

Thanks!

> +CVE: CVE-2025-14523
> +
> +This patch is a MR for branch 2-74, but not merged yet, maybe it will
> +not be merged.
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + libsoup/soup-headers.c         | 3 +++
> + libsoup/soup-message-headers.c | 3 +++
> + 2 files changed, 6 insertions(+)
> +
> +diff --git a/libsoup/soup-headers.c b/libsoup/soup-headers.c
> +index ea2f986..6cd3dad 100644
> +--- a/libsoup/soup-headers.c
> ++++ b/libsoup/soup-headers.c
> +@@ -138,6 +138,9 @@ soup_headers_parse (const char *str, int len, SoupMe=
ssageHeaders *dest)
> + 		for (p =3D strchr (value, '\r'); p; p =3D strchr (p, '\r'))
> + 			*p =3D ' ';
> +=20
> ++		if (g_ascii_strcasecmp (name, "Host") =3D=3D 0 && soup_message_header=
s_get_one (dest, "Host"))
> ++			goto done;
> ++
> + 		soup_message_headers_append (dest, name, value);
> +         }
> + 	success =3D TRUE;
> +diff --git a/libsoup/soup-message-headers.c b/libsoup/soup-message-heade=
rs.c
> +index f612bff..bb20bbb 100644
> +--- a/libsoup/soup-message-headers.c
> ++++ b/libsoup/soup-message-headers.c
> +@@ -220,6 +220,9 @@ soup_message_headers_append (SoupMessageHeaders *hdr=
s,
> + 	}
> + #endif
> +=20
> ++	if (g_ascii_strcasecmp (name, "Host") =3D=3D 0 && soup_message_headers=
_get_one (hdrs, "Host"))
> ++		return;
> ++
> + 	header.name =3D intern_header_name (name, &setter);
> + 	header.value =3D g_strdup (value);
> + 	g_array_append_val (hdrs->array, header);
> +--=20
> +2.34.1
> +
> diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb b/meta/re=
cipes-support/libsoup/libsoup-2.4_2.74.3.bb
> index 7e00cd678a..253a389e21 100644
> --- a/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
> +++ b/meta/recipes-support/libsoup/libsoup-2.4_2.74.3.bb
> @@ -41,6 +41,7 @@ SRC_URI =3D "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsou=
p-${PV}.tar.xz \
>             file://CVE-2025-4476.patch \
>             file://CVE-2025-2784.patch \
>             file://CVE-2025-4945.patch \
> +           file://CVE-2025-14523.patch \
>  "
>  SRC_URI[sha256sum] =3D "e4b77c41cfc4c8c5a035fcdc320c7bc6cfb75ef7c5a03415=
3df1413fa1d92f13"
> =20


--=20
Yoann Congal
Smile ECS


