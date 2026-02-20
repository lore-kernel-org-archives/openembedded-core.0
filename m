Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3A70C55173
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 09:32:01 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34605.1771579912463430060
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 01:31:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=dNpr/djM;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-483a2338616so9347105e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 01:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771579911; x=1772184711; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aDW38FJuNnk5Qj0F0h8NLSiT0b+wd//s1CL08nJ5I9c=;
        b=dNpr/djMYehvDMOuiPnggB5wyrZ6r0A7GrjpmYOjbPobe0my2UV9hQOau0Vy62iKQU
         oa1iX6mi2PwEo5WAe8L96NzCzPCQxFBYvAfOAXpgXGsHbiOPo+ZsGa9OZk+gsvusOi2p
         0iTgQR/QPFhMsx4vXItUnHOlawtTiKK56TI70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771579911; x=1772184711;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aDW38FJuNnk5Qj0F0h8NLSiT0b+wd//s1CL08nJ5I9c=;
        b=eM/IkRycivy5FMHps9btBMzmdHWXVYuS7naEpOkCgEkcL2VBcFeD5kFtt6b0xQTnoo
         WUPhX/jKPPfNA0kKAG/siDKUq51vWdLTxXet9/Ww6VELjEmkdA76ipV0Yl2V+6lph+Bk
         5P3/aGl1L1JRnrzBldNMZU1dTxrhm22mlQElUl2RbXgVGwHY0tNdm994SaCC7ZphCKy+
         15KtpnsE0aNwpZOB9lmdxfIVqL0XdRy6uU7cVG7KtUxEwMWdzrfYYtoqfoX89UjH6rw4
         Fmpygu7g2uMVFlawgDkZooDqd/KExXrIARahuVbw2cClFa0VQmDsD9VoYFqAI/kCq+56
         5vww==
X-Forwarded-Encrypted: i=1; AJvYcCXfgmH1ujcKcGNlZT5Ff8a2eom1+0OtdTD/i9YdKfDnwJNquArC0PbxtmJMKU+0k/Foe17G0auDkvj4DPTJBkPThQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy16CnWZI5L4/CzRCCKt4HCDDoSplaeK8PXKdOm+6Z05+LhFjJN
	7ikmd5swPk8iurUK8zFMZym+Tq95U5My4i3Qso1Msc3gke3qLZcSOyQy7WBqlf/0kmY=
X-Gm-Gg: AZuq6aJFjddnsWieb5bcys68vAGUGAv0qZDYps1kn6etuLZwFz9rqsqKRKi/sgn5G4h
	rETZThM7ASEdgu5O7h9k5ESh9VPnBtUsxp/vjl07LXb3q/bOnLP9ghLvUd85jPE2ivSGxiFmskI
	WgcWeg8oeWoGG0KWJTw0pb5lLqwfM0eus1zqQlDfa9Xrli4K4E2+lP+qXugg9sA7LH/mr23YBIQ
	8CadO/5T6jEID6tlDDG7BHG02YfIQQa+tvzP4bgcf78bUBdYHXW4Z0a5FNzqkAWC2dd38boGUil
	yjMSlR7XP6Hf3d0udpmSroz0TmG+hCowAE5QNy5xNogarfh2R+eyng4QsaUwkxIlY8jxFxgDBK4
	35CTKGSNYH2ubtYwtgh60a/MxxQddgmCCFzLTlZMHqvDmjnY3U86GE1Xt0TP+gI4TyNT0UeyyT9
	HqmUBWwr74NShfyNTkvjb8NKbpqDyQQ9S1exaoz8i7C/AdS1DoxT6tokKpzqlIq4ItFVq3dLWvw
	F4n/kkMKHJc2cY=
X-Received: by 2002:a05:600c:6992:b0:477:9eb8:97d2 with SMTP id 5b1f17b1804b1-48398a4978cmr112823625e9.8.1771579910700;
        Fri, 20 Feb 2026 01:31:50 -0800 (PST)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3dd3391sm27186035e9.1.2026.02.20.01.31.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Feb 2026 01:31:50 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Feb 2026 10:31:49 +0100
Message-Id: <DGJONZ9P9Q10.336H4HB6V1RSM@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCHv2] openssl: fix CVE-2025-69419
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <hprajapati@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260220044322.8015-1-hprajapati@mvista.com>
In-Reply-To: <20260220044322.8015-1-hprajapati@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 09:32:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231497

On Fri Feb 20, 2026 at 5:43 AM CET, Hitendra Prajapati via lists.openembedd=
ed.org wrote:
> Backport patch from NVD report: https://nvd.nist.gov/vuln/detail/CVE-2025=
-69419
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  .../openssl/openssl/CVE-2025-69419.patch      | 61 +++++++++++++++++++
>  .../openssl/openssl_3.2.6.bb                  |  1 +
>  2 files changed, 62 insertions(+)
>  create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2025-69=
419.patch

Hello,

Thanks for the updated commit message, it looks better now.

I still need a whinlatter equivalent to take this. Can you send it?

Thanks!

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


