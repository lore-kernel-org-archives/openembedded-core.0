Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCABAC53219
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 10:28:09 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28298.1785148085028552289
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 03:28:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=RrAuz/P4;
 spf=pass (domain: smile.fr, ip: 209.85.208.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-69fdcb13fdbso2568458a12.0
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 03:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785148083; x=1785752883; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AfpG24BLbreUjzdFfWhCGTNs4LF/FfwMaIiqkiMlS84=;
        b=RrAuz/P4pM56oOiGbYAgPicbNMVZp2Iv3C9K8CPEOIfc1Gi5lhAS5cWjMGgleRDAGE
         EA3TSZJNcbKswFVWiEmlAsvTGJ/6XZrcFsKDc4bmZDTOvdRDrN6xaFcIePaOaGjfIgw8
         5mE/OZOnVX+vM5IMtKvKnbUaQAqb1ld/cO7n0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785148083; x=1785752883;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AfpG24BLbreUjzdFfWhCGTNs4LF/FfwMaIiqkiMlS84=;
        b=bv92ATJiKoUmgMz6JLILhTcdCVQPuwoGxSzNJlYbCnpkU+8Hc7OJvQzA5lx9PFPX2O
         4QpXs/jDNj0PKxwSGLkgjAbwlRv909FMDcDy0sTNR6LxFiGd59321LBoSU/NYN0ife/8
         oO3SXn+76NMcOqfAeoJSo50Ce1fTJ7sAwR2xwhZN3gaSxQHwKBAszxpLKQDM1G7+H7Pu
         QSxSHmy/DW/pc8O80pJSmxyCuEuGMytBzuZ0LGHtbL9dOW8VBMZ7IZg89DbzKuFfDM7h
         2HYa28aNIyoBZl9L4AhnXeGf7h7oGKOAeVd3LaCrcl3ePdqAziI8WKqU/gBlpRaUai91
         mJZw==
X-Forwarded-Encrypted: i=1; AHgh+RryLDGdBqtl5OMx1i8HJpJJ2VmHJOA0ifPXEitOIjU2pURmdHnWgefISOOktnOhhfQcmCREVAU61oqhzbE7p0lmMg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy2kGAqyV6VcUCJQVRfXnRtHB6k8EL3KU3AaILKCT3ZBuo91zSt
	yu2qdmJGyRGXwBjXESjNFgguQiFEkS3tMqKR67y3Gu6nr+i1q7Fh6wKtHGqo0TIzBI+vefOFvk3
	cVSkwW2I=
X-Gm-Gg: AR+sD12ac4Uv6SOcFnVBzDWJHoarINvmGS0ZcHXApTMJODfk5BVqygVP57Qq1yEyQfI
	/eUDziLyZDjwzf9FWitXusZfirrcDJr/gGlHawYTdrfGhUJN1k+UD/qLYvmIA5w2gwiI0QdRiFX
	YTA8fXyWICunYcu67o0rG5VTMCuihvUwsPwYU9o9r7XtsayqadhwjWZpufbL309dT1MYPShwNFz
	GRShYPcwCLBiE7l7NdfWvEObmt/W1rxmIgT6JP1Bn4GZoUzaRV7TXog/ECfP2kceCm/Q79XK1AJ
	anhmRbNO44Y+2Jkv2S0D1FoUqQjKSHMRiRa0oyLjb/tgxYiyNQyKlnwzzG0FTeQeyHylKt/nHGF
	iWnr27lL+SQ/xFPgQd2f7dhrWazxRh4cVLPDpSTKyliwNwDksun7DTzS+u8UT5EDecdatRstn7F
	KhkQVaoN7OiSuJmJHs4TXLrlfOtoSLnvx99M+c+wC53VxlGPxbCX8ICc3h3U+L/A==
X-Received: by 2002:aa7:d552:0:b0:698:8857:9ff0 with SMTP id 4fb4d7f45d1cf-69fb1b9bf8cmr3029284a12.16.1785148083225;
        Mon, 27 Jul 2026 03:28:03 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb51c98c5sm2436953a12.11.2026.07.27.03.28.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 03:28:02 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jul 2026 12:28:02 +0200
Message-Id: <DK9A6JOSEG55.14LQQXEJ9TIC4@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <deeratho@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH] python3: fix CVE-2026-15308
X-Mailer: aerc 0.20.0
References: <20260723134023.2501442-1-deeratho@cisco.com>
In-Reply-To: <20260723134023.2501442-1-deeratho@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 10:28:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242083

On Thu Jul 23, 2026 at 3:40 PM CEST, Deepak Rathore via lists.openembedded.=
org wrote:
> From: Deepak Rathore <deeratho@cisco.com>
>
> This patch applies the upstream v3.14 backport for CVE-2026-15308.
> The upstream fix commit is referenced in [1], and the public CVE
> advisory is referenced in [2]. The individual backported commit link is
> recorded in the embedded patch header.
>
> [1] https://github.com/python/cpython/commit/07efb08123ba9367a7107325adb9=
d5626dca1ca9
> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-15308
>
> Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> ---
>  .../python/python3/CVE-2026-15308.patch       | 116 ++++++++++++++++++
>  .../recipes-devtools/python/python3_3.14.6.bb |   1 +
>  2 files changed, 117 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3/CVE-2026-15308.p=
atch

Hello,

As far as I can tell, this patch is not released on the 3.14 branch yet.
I hold it until it is applied to master (upgrade or backport)

Regards,
--=20
Yoann Congal
Smile ECS


