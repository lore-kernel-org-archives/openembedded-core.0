Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83F0DC982C9
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 21:44:10 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26233.1789595040873511314
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 14:44:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=IPQ9+aoL;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e721b5503so1773155e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 14:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789595039; x=1790199839; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jm7xVieTby1W1y44fhIVYUiIa7cmjq3UAq4wpEyOrIc=;
        b=IPQ9+aoLA9XvIA1Nh8KJrrKge4+dykCD1drVOuNaZPmefVxi1u0lf8/uOCdjnEJUk1
         J69vhfTfn/M9DkXM4kNFNc106pxwYP2iAxeElJEmwrxt9pSWGKkLG1IcRX+8KShMMkKd
         cX6nbjgiT+AW6ysl9favkVulB4k0ZeJCiWpYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789595039; x=1790199839;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jm7xVieTby1W1y44fhIVYUiIa7cmjq3UAq4wpEyOrIc=;
        b=uiu2r7Er7ah8K74KahPvri/cPLc6j+0ustqPs1A4eWPkvi1FCB1my2soay4AqR2EXl
         Y+wkxXaECkKGu52iFLggw5emNg/LT/rTCRZ7WFCaLc0nEJVpqTNeKSfYNlldiG5qDgMn
         EmwC3A8MmeIf9IEIPEQRJgE/iOokUaXVb1dtnacU46HGRZjygCbbSqT0K+K/YmJFULp8
         al1TjENZGLVt+Pp6oY+L7q6rx1etLVGfDioEA8rwTA7tKUNSG2hiTkFN10HsVNQqKkGa
         FFVYk/3mo1VPwvv2ubG1wHjpxZCzxqL/ja7hflnmUNeVtW4qkED0vFC6ICTCdicWmqnD
         tchQ==
X-Forwarded-Encrypted: i=1; AKwUvBx8TWr4t4+cH7d2bi80B8clvc+NB+dtqg4m+00yyZWx3Ls5ZnRbPdi0vhUWmBu+sSOABeNq6em61TevbaPobMGhpg==@lists.openembedded.org
X-Gm-Message-State: AFuF++mx/aQUV4qulag0UHVkqD5y478/0m5D/IqqxHg5TYPJk+qWUWX2
	di2qXla/bUue6Lbpfka9VWj05lHXEJM0JP7bQ5JH5fZp4HE1DialFiU1j/Ch5J52b40=
X-Gm-Gg: AYBFou1zxSAYaVv9r6tSYLsADqhu0HDxFu9wCYeVh+7u39afpW+P/JlZsSfKILeILVe
	Bg2/d99Zaz7TmLi/2g8yycfyFbR0PqE6qsPQrUIOy2DDHantHjl6pUaXZ20bwY5GKbdwzMgWo4h
	Ej7GRAOSiXwjUR718XquSfV0CgviWsY/U3xDIFpa3u0fiHtBkuQdz/YDQ8HNo5LJnk647wr7hgz
	MTeaPQ1LBNuW0H1dRgCxRJUupSRi/330A+EEMCyAE6nVDq8Rk7swk8RdzNVjfhQPQCu98v7YexX
	WH7wJJA4UPmVzj3Ggd2GZWtX/W2kti4/ALzAr61JaJ8vWyF4BAZ4iHMjZRkPmwAv1AuM5Z2mbyp
	WWAO5m0KDarDqy4374gz6QfFABerRgUvRk/0k+AYh1y6zwYHWWdj8T4GosCCUYTSf7qTCF4oFiL
	6WTJ7WOT6hGiF8QJ78hqVYG9SwiLBTanXM0DBpdekHcqx4GoiBSFjmRaAgU6CkgNMm9mrcR6yGv
	+2R97xi8EteyDXT009SJlRMgZsonIiiiUAN6gAK2lDM6tULn7C19AXgsWIFZVg=
X-Received: by 2002:a05:600c:1f83:b0:49e:84bf:6121 with SMTP id 5b1f17b1804b1-49eb7306be1mr47908725e9.13.1789595039046;
        Wed, 16 Sep 2026 14:43:59 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bef766dsm9537191f8f.4.2026.09.16.14.43.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 14:43:58 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Sep 2026 23:43:58 +0200
Message-Id: <DLH2HV018OZJ.26NTHUR16MZSH@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH 5/6] curl: set CVE_STATUS for
 CVE-2026-82208
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <sdoshi@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260909203324.765094-1-sdoshi@mvista.com>
 <20260909203324.765094-5-sdoshi@mvista.com>
In-Reply-To: <20260909203324.765094-5-sdoshi@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 21:44:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246002

On Wed Sep 9, 2026 at 10:33 PM CEST, Siddharth Doshi via lists.openembedded=
.org wrote:
> From: Siddharth Doshi <sdoshi@mvista.com>
>
> Analysis:
> - The problem only exists when curl is built to use the wolfSSL TLS backe=
nd.[1]
> - The recipe is built with OpenSSL and not wolfSSL.
> - Hence, ignoring the CVE for this recipe.
>
> Reference:
> [1] https://curl.se/docs/CVE-2026-82208.html
>
> Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
> ---
>  meta/recipes-support/curl/curl_8.19.0.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-supp=
ort/curl/curl_8.19.0.bb
> index a5606c5eb1..68baac1a15 100644
> --- a/meta/recipes-support/curl/curl_8.19.0.bb
> +++ b/meta/recipes-support/curl/curl_8.19.0.bb
> @@ -46,6 +46,7 @@ CVE_STATUS[CVE-2026-8924] =3D "not-applicable-config: p=
ublic suffix list support i
>  CVE_STATUS[CVE-2026-10536] =3D "${@bb.utils.contains('PACKAGECONFIG', 'n=
ghttp2', 'unpatched', 'not-applicable-config: applicable only with HTTP/2',=
 d)}"
>  CVE_STATUS[CVE-2026-9547] =3D "not-applicable-config: vulnerable libssh =
backend is not enabled by the recipe"
>  CVE_STATUS[CVE-2026-12064] =3D "${@bb.utils.contains('PACKAGECONFIG', 'l=
ibssh2', 'unpatched', 'not-applicable-config: SCP/SFTP support is not enabl=
ed in PACKAGECONFIG', d)}"
> +CVE_STATUS[CVE-2026-82208] =3D "not-applicable-config: vulnerable wolfSS=
L backend is not enabled by the recipe"
> =20
>  inherit autotools pkgconfig binconfig multilib_header ptest
> =20

Hello,

We can't do that, as there are users of the wolfssl backend in the OE
ecosystem: https://github.com/wolfSSL/meta-wolfssl/blob/master/recipes-supp=
ort/curl/curl_%25.bbappend

The fix does not seem very complex, can we backport it instead?
https://github.com/curl/curl/commit/ed0338befd1d865a8ea1fbaa90

Maybe CC meta-wolfssl maintainers on the patch so that they are
aware/have a chance to review/test it.

Thanks!
--=20
Yoann Congal
Smile ECS


