Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8483FC43458
	for <webhook@archiver.kernel.org>; Sat, 11 Jul 2026 20:38:14 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3433.1783802287590385451
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Jul 2026 13:38:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=a/d86jgX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493b1710405so9293685e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 13:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1783802285; x=1784407085; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JD5+Jp4qSoZA8veM5UMhN4u6iqC2Z1q6pUkXw2Cf/18=;
        b=a/d86jgXVqxyhFKMzRg8E8L2tCaGsj6154V6SGzGrpcfLuqmE9WqmA/VnXQmpWst9Y
         QlR41dEswCIbvnSyxODbqyrCbH32yFFVhmcTPulHHK04IneLwMNhl8N6qLlnOiybM2RT
         8y/r1ZwmgbMh+MthZWjllbZelLkihMuwPb3fs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783802285; x=1784407085;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JD5+Jp4qSoZA8veM5UMhN4u6iqC2Z1q6pUkXw2Cf/18=;
        b=CZFzAkCNEzN0G3BUIY81NHKerbnvCvLMHvnyVAncGXs2+IGSYAHaMzpjHlYA5TPbFR
         mpAd0YMlyPFsL7LYdrJwyIuGcAagXqjoX/xNK7oNpid1+nN9IzOYYh+N4GbEComgWA/N
         6v5OcUq8kh84l9cUKPhck63/uMEnjZbxLIIH3hP3cdoSX4oRKL471od4pQvdfJvgAWzr
         RTmIk6N6fcCvJE1VPaEaKLkESv8U/iAuOfKwGoj6QRnfNGZovAeJQJ8hTIxgeyvo5SLd
         QdYaYoelWtv/GCx+ULLsj79+70p3/5kSDLshsslILcjLdB4Y03D5B39UFqGHfVxhnoeI
         JKsw==
X-Forwarded-Encrypted: i=1; AHgh+RpdwA30hwdMlK/xVwLFeveAGi8COl9cQbPMIyqYFmIzjr9p4Zb1SUEXz7PvFV7SivmHyJKv11qo7V2S4wvO/+POYA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw5dDy4XYY+5CWx1T0ejCQVEKH3gPUSPuXbGQ5SkADGp/9GXv6+
	YJrgv6iv/jSCTXXq9JWqlYHZExs5Ge9VSIgbNTK9xgV+fJA5e99+wZe+9Nl/Ix1GC0A=
X-Gm-Gg: AfdE7cmDm38y4wUu91z6OenrvzOUleg9w+VQXxP5BrKysAv8GNxyuX7lnmZMou0k018
	n3AmVXouuqWJeDT6jnrK49jUNQEPVRDhN/mhs8Jlc2fXF2drcSUHIuI9ZBsdHWLbZTvsVcAdKdl
	dUk0rQN+XwR6GCPR4cdjMct9ATE1lcI6Kk99gPUOWDB9rw61pH1ONmAEk2J0wZi5qSAeq4RYfdJ
	USFcrgkEU+3kK9CkdDaU9boT9m5G0Sk5ftnSgtm7Z/bhzoH5iXzNNAy7UIO0TwjjZTcGtt6s5bq
	XX/olugqRJEFD20K1Zg08AX+GZ/qGEeDsY21c/iPgjb20eBBptmD64/VhQberbZoGBMEKqsRsP5
	YTom/B7likXXIbdJeaOsB5bfMtwqQabb3fjoXRQ98+JbILjbDriGYyttjDatcE1njmxOXvNf3Te
	EOkA3HzbXI5GlL/x4puFI5EednPUKKfIJybNUaIobTrktHDn4u5hpdzUcH4qbURcP8cnlvaaIqp
	4DP9Q==
X-Received: by 2002:a05:600c:4e8b:b0:493:dcad:84da with SMTP id 5b1f17b1804b1-493f87d9899mr37490915e9.1.1783802285417;
        Sat, 11 Jul 2026 13:38:05 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2004:2e5c:aef2:b707? ([2001:8b0:aba:5f3c:2004:2e5c:aef2:b707])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f4cbc620sm134687695e9.13.2026.07.11.13.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 13:38:04 -0700 (PDT)
Message-ID: <2b430032b2f96e187381d0c7d530b0c6f04426ab.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] os-release: set BUILD_ID vardepsexclude with
 weak assignment
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: jose.quaresma@oss.qualcomm.com, openembedded-core@lists.openembedded.org
Date: Sat, 11 Jul 2026 21:38:02 +0100
In-Reply-To: <20260710155721.214588-1-jose.quaresma@oss.qualcomm.com>
References: <20260710155721.214588-1-jose.quaresma@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 20:38:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240724

On Fri, 2026-07-10 at 16:57 +0100, Jose Quaresma via lists.openembedded.org=
 wrote:
> BUILD_ID is defined using a weak assignment so that we can modify it
> externally. However, if we do it, we also need to do the same thing
> for BUILD_ID[vardepsexclude] with the new value we assigned to
> BUILD_ID.
>=20
> Signed-off-by: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
> ---
> =C2=A0meta/recipes-core/os-release/os-release.bb | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/os-release/os-release.bb b/meta/recipes-co=
re/os-release/os-release.bb
> index e1906d05d8..bbbf9e3e11 100644
> --- a/meta/recipes-core/os-release/os-release.bb
> +++ b/meta/recipes-core/os-release/os-release.bb
> @@ -41,7 +41,7 @@ CPE_DISTRO ??=3D "${DISTRO}"
> =C2=A0CPE_NAME =3D "cpe:/o:openembedded:${CPE_DISTRO}:${VERSION_ID}"
> =C2=A0
> =C2=A0BUILD_ID ?=3D "${DATETIME}"
> -BUILD_ID[vardepsexclude] =3D "DATETIME"
> +BUILD_ID[vardepsexclude] ?=3D "DATETIME"
> =C2=A0

I'm a bit surprised you can't just append to it and leave DATETIME in
there regardless of whether it is still used or not...

Cheers,

Richard

