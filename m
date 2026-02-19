Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67579E9A03B
	for <webhook@archiver.kernel.org>; Thu, 19 Feb 2026 11:17:24 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11403.1771499843394266852
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 03:17:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=S4gSR15m;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43591b55727so829334f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 03:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771499842; x=1772104642; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u1FXKed26404hXdjbSWpUer6xf2TUpfW6rBKT3KwZkY=;
        b=S4gSR15meOxxEzYk5GDuFCbz1eXgUht2KuTZDccOT0vrh76ccHi64CuHO/UH9pqsD8
         kgUUc5pcac12lW5ej3HSgNi0iNBe4zOnkQUgP57sjjZ3rVQOYMCw1HSneavmFQM4xozx
         rCVGM/HPagZ6CI6igbbd7XnhbIfIi1IYk5okw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771499842; x=1772104642;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u1FXKed26404hXdjbSWpUer6xf2TUpfW6rBKT3KwZkY=;
        b=ExxZsf2Hpp+LPGLlTbJVVs+30vjbhddtKq5iiPaiVuJrvxx3jx69DNHOx7HTJcYTUx
         CUk41u4QKEZ3krvrM5xHbQJEU02E53w9IpKs/RHxqO0jyH4XnojIh+b0D8XFCX9KH2jg
         eIn1c4FJidApTAuyTsjonPGrj3jL2rrxXoSXxIW79cP770/d+EuPvVQwspT0u30s6w43
         /CEB5oBHw3QodXd10gerYt2x9kzrII6wsGNWeyfxZ13c2pYotPDNs9GkHX4hiRZ9ToDY
         CWUepfVd0ufDJVPMELJb4k3++GOzPJYrgdXg1S5ec5b9TZs4ABxIqsVR/dlPIRHk4Drm
         I7sg==
X-Forwarded-Encrypted: i=1; AJvYcCX6hHE8CLsIgcI3U28pjGdnaC9RzSn3H9KXrtWLno3fel6lxZw1tlwyush0uyk62CWWFOGnrrTxVM8sAFHe4MAjBg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzwy2ZJkBvSH29RaAZ+2x3fTVbghnMueS2+I2eXqGLVJZJ9PeiS
	rePpzaF70xB1JhUnqT51n6DL0A+s7UxbDocvsOGqeYzDYzrVZlNd36OxEIbChmxLnTA=
X-Gm-Gg: AZuq6aKefF6SOERYjbmKrVEroWXdc0DaeM+t0ikFwJb+mxEMIjbHJplrZ8BRlrT2beH
	oSOB6tqm0drFs966ZLZE+mjI4bmSPU+Pyad2yYuhOEGtoTG0RYRkdm4NPgj/KKi4KixYLGczZUW
	DUD478/e+bQ8pSHKfWNFKmnMaNWE1asjCG7AcNy/ZQ26w1mcToBlUmT2fhOdxeE1Pd7ihXfFRTl
	JVWEXmw697eiO+dZ6KeKJoWZQpjPanu9u+wOkQXOe++7oMv8s3TY63SUOHhK+ALKicT8LrXxQnJ
	fS25R14qgXdT3CKoGsO2ALiQpmPIRwMn5JijW9QAftLeRvC8mfASjO2jFOlqvpbbczGSqqzkFIT
	bwNTpB7QsUylKMNaYnzFvT93aH7/EgTW3/0UFSjGVMMHFza3Dn9bgEYal7KSPTiT78Tv6orfP8+
	/C4MheDGHwzbMO51Ww/S2VijAQjZRAzOppoj9lU5IfcNIdzRKkootBOE455XXg9UzyATrFTtu9R
	vN72M4/ysy+ebE6hnrYpFIiRw==
X-Received: by 2002:a05:6000:26d0:b0:430:f494:6a9c with SMTP id ffacd0b85a97d-4379db619abmr33976645f8f.17.1771499840407;
        Thu, 19 Feb 2026 03:17:20 -0800 (PST)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ad015bsm49490198f8f.38.2026.02.19.03.17.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 03:17:19 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Feb 2026 12:17:19 +0100
Message-Id: <DGIWA7GSISDW.3QYV0Q83SWJWY@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] openssl: fix CVE-2025-69419
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <hprajapati@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260202123511.540058-1-hprajapati@mvista.com>
In-Reply-To: <20260202123511.540058-1-hprajapati@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 11:17:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231421

On Mon Feb 2, 2026 at 1:35 PM CET, Hitendra Prajapati via lists.openembedde=
d.org wrote:
> Upstream-Status: Backport from https://github.com/openssl/openssl/commit/=
41be0f216404f14457bbf3b9cc488dba60b49296

Same remark as https://lists.openembedded.org/g/openembedded-core/topic/117=
540534#msg231419

Can you send a V2 with an improved commit message please? Content of the
patch looks good.

Thanks!

>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  .../openssl/openssl/CVE-2025-69419.patch      | 61 +++++++++++++++++++
>  .../openssl/openssl_3.2.6.bb                  |  1 +
>  2 files changed, 62 insertions(+)
>  create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2025-69=
419.patch
>
> diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2025-69419.pat=
ch b/meta/recipes-connectivity/openssl/openssl/CVE-2025-69419.patch
> new file mode 100644
> index 0000000000..dcfdba82ac
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssl/openssl/CVE-2025-69419.patch
> @@ -0,0 +1,61 @@
> +From 41be0f216404f14457bbf3b9cc488dba60b49296 Mon Sep 17 00:00:00 2001
> +From: Norbert Pocs <norbertp@openssl.org>
> +Date: Thu, 11 Dec 2025 12:49:00 +0100
> +Subject: [PATCH] Check return code of UTF8_putc
> +
> +Signed-off-by: Norbert Pocs <norbertp@openssl.org>
> +
> +Reviewed-by: Nikola Pajkovsky <nikolap@openssl.org>
> +Reviewed-by: Viktor Dukhovni <viktor@openssl.org>
> +(Merged from https://github.com/openssl/openssl/pull/29376)
> +
> +CVE: CVE-2025-69419
> +Upstream-Status: Backport [https://github.com/openssl/openssl/commit/41b=
e0f216404f14457bbf3b9cc488dba60b49296]
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + crypto/asn1/a_strex.c   |  6 ++++--
> + crypto/pkcs12/p12_utl.c | 11 +++++++++--
> + 2 files changed, 13 insertions(+), 4 deletions(-)
> +
> +diff --git a/crypto/asn1/a_strex.c b/crypto/asn1/a_strex.c
> +index f64e352..7d76700 100644
> +--- a/crypto/asn1/a_strex.c
> ++++ b/crypto/asn1/a_strex.c
> +@@ -204,8 +204,10 @@ static int do_buf(unsigned char *buf, int buflen,
> +             orflags =3D CHARTYPE_LAST_ESC_2253;
> +         if (type & BUF_TYPE_CONVUTF8) {
> +             unsigned char utfbuf[6];
> +-            int utflen;
> +-            utflen =3D UTF8_putc(utfbuf, sizeof(utfbuf), c);
> ++            int utflen =3D UTF8_putc(utfbuf, sizeof(utfbuf), c);
> ++
> ++            if (utflen < 0)
> ++                return -1; /* error happened with UTF8 */
> +             for (i =3D 0; i < utflen; i++) {
> +                 /*
> +                  * We don't need to worry about setting orflags correct=
ly
> +diff --git a/crypto/pkcs12/p12_utl.c b/crypto/pkcs12/p12_utl.c
> +index a96623f..b109dab 100644
> +--- a/crypto/pkcs12/p12_utl.c
> ++++ b/crypto/pkcs12/p12_utl.c
> +@@ -206,8 +206,15 @@ char *OPENSSL_uni2utf8(const unsigned char *uni, in=
t unilen)
> +     /* re-run the loop emitting UTF-8 string */
> +     for (asclen =3D 0, i =3D 0; i < unilen; ) {
> +         j =3D bmp_to_utf8(asctmp+asclen, uni+i, unilen-i);
> +-        if (j =3D=3D 4) i +=3D 4;
> +-        else        i +=3D 2;
> ++	/* when UTF8_putc fails */
> ++        if (j < 0) {
> ++            OPENSSL_free(asctmp);
> ++            return NULL;
> ++        }
> ++        if (j =3D=3D 4)
> ++	    i +=3D 4;
> ++        else
> ++	    i +=3D 2;
> +         asclen +=3D j;
> +     }
> +=20
> +--=20
> +2.50.1
> +
> diff --git a/meta/recipes-connectivity/openssl/openssl_3.2.6.bb b/meta/re=
cipes-connectivity/openssl/openssl_3.2.6.bb
> index 4fd13d52fe..88fa0285cd 100644
> --- a/meta/recipes-connectivity/openssl/openssl_3.2.6.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_3.2.6.bb
> @@ -17,6 +17,7 @@ SRC_URI =3D "https://github.com/openssl/openssl/release=
s/download/openssl-${PV}/op
>             file://CVE-2025-15467-02.patch \
>             file://CVE-2025-15467-03.patch \
>             file://CVE-2025-15468.patch \
> +           file://CVE-2025-69419.patch \
>             "
> =20
>  SRC_URI:append:class-nativesdk =3D " \


--=20
Yoann Congal
Smile ECS


