Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 496EBC531D0
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 08:40:35 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27015.1785141633127476359
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 01:40:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=oODttbV7;
 spf=pass (domain: smile.fr, ip: 209.85.218.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c15e2dab83eso384139066b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 01:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785141631; x=1785746431; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6I5JBJzgfCdDFSkJNmBLx1cHejMXxYuIjuJn60AeQA8=;
        b=oODttbV7LBO3+9TcXBAEAceWaD8IZvWfjsoqX13yJbP59ZfJjxOKu85rNtyNUqHXm5
         JoziJHsqn1Ny+j9xK5bqMoeRHUq9YoOrrNoXWOp/RqB8H5iDMcYslXq65NEqw9/vPx4E
         s3+uhAizERwNG/jyMXiqf+NFN2nIB118tyhqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785141631; x=1785746431;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6I5JBJzgfCdDFSkJNmBLx1cHejMXxYuIjuJn60AeQA8=;
        b=o03NtbSgOe6JNqXxmvGPtU/clyDi3PBFm1VZeatkrUSgP3YRIdJRPpQ2pleFkMFOYD
         GQ61p9Nhh0D0emADZOt9OnT2r2IerNW6w3RT7R79CTqIRZTnMMLJch5FGY9yRYH9+xlP
         6bW7we88vLO57lenuV8apU/9e7iUxfKSS12IR4juzhyreK4OsTntx3osc/fN5Eh94i8Q
         M1HFW7RxpAswROKb+3uPftWQefSk4MBxaZw9oAsmR3y6A7BuuQ3Lj2dsSxRuK0NNzJ8/
         sHNvggRqZxPOLGzS1IsjzXxXmYJDudEdA50JAAyAxUwgHoi1xrCcEyJGxp6JeJwAc2vO
         3t+Q==
X-Forwarded-Encrypted: i=1; AHgh+RoGErt3CVs+pzWcdNK5qwCwuPjUkTCqWSw1o76+ucJ3MIqHoSfhZ0+e0Ko220DNSAecc3MEwPeQMIw/hjzhNnhywg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy2tdw0WpcZoI2MjzLOUNnrFocKAfBMjcZ5rsIIAaXWdxpKG5l7
	pZ4C7PWvT6jrATCDKp0zYpnBnLr4UnZ4C/UJT1hc0xGSe+XluKQlJbMiqJ6NVTGbXJU=
X-Gm-Gg: AR+sD12FSxRoiYfb2IQaJIJhVTkxWbir8tj8j+CL+vy9GKxcvlDz5Ej5mQKbY3Idj3j
	w0dK4QdHbvRU2Rku4Jg6MhUD532F5hvDtn6RMpoKCDCu1AQ9npKzrgfCy5V/QlZYT4gSVn+VeYA
	/SnS9+KGueD99aDdaqt4E+AAk/7qH1+sUihC7o5cGif3T9b2M1ayTSxaHX+I/4scPaAWpOGn/8a
	wrKyrysocY8q/ldIYZbtthbWuHNm51kzmoIf6QNDefFXo05xuKQOOtF/H7tPXJw0ZsCLw28mCAl
	Iwp5xtbt8/myXOICzhg5oqX8SyfhqvNMzlWf7Lmqj0KSSoscmSNymX+/JqWiXc9rvJjHDde8LQ4
	vYrvAOt545tnLCGxVFz5axl7Ad5ihlVRgszKx+qjvYC9fB2wsbnJc5wo/PBktNK9gqn9KPikVLP
	d895TEBctsWT5e8r93xC8ZisFx9Brc9stltLgJR0MAvurggZV9hrJFYc65zxRJFQ==
X-Received: by 2002:a17:907:9707:b0:c1c:2fd3:bbce with SMTP id a640c23a62f3a-c1f1f15b7ecmr326967366b.35.1785141631186;
        Mon, 27 Jul 2026 01:40:31 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32c90b58sm595290266b.39.2026.07.27.01.40.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 01:40:30 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jul 2026 10:40:30 +0200
Message-Id: <DK97W7M88L8W.1HURYFN46R2F4@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH v2 1/5] curl: ignore CVE-2026-4873
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Paul Barker" <paul@pbarker.dev>
To: <deeratho@cisco.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260720105647.2451180-1-deeratho@cisco.com>
 <20260720113041.2479444-1-deeratho@cisco.com>
In-Reply-To: <20260720113041.2479444-1-deeratho@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 08:40:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242067

On Mon Jul 20, 2026 at 1:30 PM CEST, Deepak Rathore via lists.openembedded.=
org wrote:
> From: Deepak Rathore <deeratho@cisco.com>
>
> - CVE-2026-4873 affects curl before 8.20.0 when a connection negotiated w=
ith
>   clear-text IMAP, POP3, or SMTP can later be reused for a TLS-required
>   transfer.
> - In wrynose, these protocols are optional PACKAGECONFIG entries and are =
not
>   enabled by default in curl_8.19.0.bb, so record this CVE as configurati=
on-not-applicable
>   for the default recipe configuration.
>
> Reference:
> - https://curl.se/docs/CVE-2026-4873.html
> - https://nvd.nist.gov/vuln/detail/CVE-2026-4873
>
> Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> ---
> - Changes from v1 to v2: Refresh the patches on top of the latest
> wrynose branch.
>  meta/recipes-support/curl/curl_8.19.0.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-supp=
ort/curl/curl_8.19.0.bb
> index 3326f478b5..1cda69401b 100644
> --- a/meta/recipes-support/curl/curl_8.19.0.bb
> +++ b/meta/recipes-support/curl/curl_8.19.0.bb
> @@ -28,6 +28,7 @@ SRC_URI[sha256sum] =3D "4eb41489790d19e190d7ac7e18e8285=
7cdd68af8f4e66b292ced562d33
>  # Curl has used many names over the years...
>  CVE_PRODUCT =3D "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:l=
ibcurl daniel_stenberg:curl"
>  CVE_STATUS[CVE-2024-32928] =3D "ignored: CURLOPT_SSL_VERIFYPEER was disa=
bled on google cloud services causing a potential man in the middle attack"
> +CVE_STATUS[CVE-2026-4873] =3D "${@bb.utils.contains_any('PACKAGECONFIG',=
 'imap pop3 smtp', 'unpatched', 'not-applicable-config: clear-text imap/pop=
3/smtp support is not enabled in PACKAGECONFIG', d)}"
> =20
>  inherit autotools pkgconfig binconfig multilib_header ptest
> =20

In [0], Paul wrote:
> could we replace this with a backport of the
> actual CVE fix? It looks relatively simple [1].
>[1]: https://github.com/curl/curl/commit/507e7be573b0a76fca597b75

[0]: https://lore.kernel.org/openembedded-core/cover.1784740870.git.yoann.c=
ongal@smile.fr/T/#m3759a41c8902eec71c87aa6db4ed2cfd406834c5:

Regards,
--=20
Yoann Congal
Smile ECS


