Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E66F8CD98CE
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 06:56:52 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.123993.1781506610743299489
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 23:56:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Rx+VLphu;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45eeea039ebso1598205f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 23:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781506609; x=1782111409; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=twOZeHpwMqvKJ5YEg4crdpw0AbgIw3Jd8k78qr9NtmE=;
        b=Rx+VLphuhbncrX5ByTIxZdv6OGwjYFP1WL5icl/XWsAeLiwSUddU66ax7XwQzn8B2c
         tLisivp/f7iQb85XxKZ4eeMMyg74S4Kapb/QO7GJYeMAxXzmgPOIz2GiVYDjNhVE/eBW
         coVX2W94T08xL2DUIZgK6WXj9BaZQ2FB2NFsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781506609; x=1782111409;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=twOZeHpwMqvKJ5YEg4crdpw0AbgIw3Jd8k78qr9NtmE=;
        b=dRo7T60y6fAK7wCZMuVjxfphS3A11slOcnMUB477Lbc4Y8EWXreFRqr5CB9qXciqgM
         fui4HyfpkcwpVdZuUu0XsYjc+19gg7TeJO9L+nsbXeBU/SfvRoeQNJg5Lb6dV4+jCxQe
         QTMmIOqt+s5d3TXiLDngLFlSiGwHwiTsASt7D/0zqXauFPEd1sYmjsUmOszL3mnDW7XS
         DEJlFPNEOc4lm54qvpYcwXD9qnrEA1Kp6s/sNSKe4PXbXqVJiNr/HcDCnIS0xW9wy1z3
         Gah6T6NhCYahDGeEmOgoaslGc47W9tI8hQTWUnwKWB99Y55vrkkqYk4iU3f5lMrhU5FD
         EKWA==
X-Forwarded-Encrypted: i=1; AFNElJ8itRFI39wZXu8UFO7M6zwdJCNNHOISwT17qwDZTvfWP6iLGVI6Ty5n25qGEn6oRPaLHxUOWAHh0EmNBFAduU/7Iw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyhd2i3St3EmGl7ZCFGaTu8ezutGXbGPImdN2hGMBOJQMNcGtsM
	x/6lZTvYj9qA8NGIu8a/DU20v0wb2dpyyVS2RE2LcbwWuCRfo2GZdhO9W4cPEcAJ/zw=
X-Gm-Gg: Acq92OGNXRfkykAcx0vRJ7VvJwibgba+NiMyce0jVQKgUfK93UU5+7mirQ0QJde3kNt
	3BB/Zc5lSQ4Pa51alyQgvi3yPUhtjsC4qO47GCv4bYRimzN3uWaF34uHycynSmCylBL3JL/ydYH
	Q/HjGRHytOGbvxrXbDxDnwBvzdh9oG7Ri79LORCyX5GUT9lnHe9PdPP1BJxAeL0hajxCgaPZmE/
	pXtf8E/1/0r/87O3QJxsKCZDsvfZaj7GNYhdZne+TFZPq8vSTC383KN1JPIkdi2Zlb7XI59UDNB
	jnowUR9m/zuiPXKLmp80G4dNr62k4FHAsoH0RR/WMW3jfenFsdEY7+/Em6ajj5rFXyBc8B68hSC
	lO2rApqy7JtyQ0QiY2LbIB5Fqms0sPq8GJHx1L64BpqW916EvCj0obAvda7/l01yoVUJPb8bdmQ
	Ic8a/mKKv8E/GRpDeEeFvKJPW/20jVWDN1u7Om8fWs6BZOqXZbVpqkVbnJXFu4aHpRxwoOodVOI
	KwhyHhYqCvJSvE=
X-Received: by 2002:a05:6000:25fd:b0:460:3233:f991 with SMTP id ffacd0b85a97d-4607ebec314mr11454536f8f.40.1781506608740;
        Sun, 14 Jun 2026 23:56:48 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f263945sm32020706f8f.8.2026.06.14.23.56.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 23:56:48 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 15 Jun 2026 08:56:47 +0200
Message-Id: <DJ9FDX5I9IGG.3QG3G0NVIMTQ3@smile.fr>
Subject: Re: [OE-core] [wrynose][meta][PATCH] openssl: upgrade 3.5.6 ->
 3.5.7
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <nmjain23@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260615053642.1110908-1-naman.jain@partner.bmw.de>
In-Reply-To: <20260615053642.1110908-1-naman.jain@partner.bmw.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 06:56:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238816

On Mon Jun 15, 2026 at 7:36 AM CEST, Naman Jain via lists.openembedded.org =
wrote:
> From: Naman Jain <namanj1@kpit.com>
>
> OpenSSL 3.5.7 is a security patch release. The most severe CVE fixed in t=
his release is High.
> This release incorporates the following bug fixes and mitigations:
> * Fixed heap use-after-free in PKCS7_verify(). (CVE-2026-45447)
> * Fixed possible heap buffer overflow in ASN.1 multibyte string conversio=
n. (CVE-2026-7383)
> * Fixed out-of-bounds read in CMS password-based decryption. (CVE-2026-90=
76)
> * Fixed heap buffer over-read in ASN.1 content parsing. (CVE-2026-34180)
> * Fixed PKCS#12 files with PBMAC1 are accepted with short HMAC keys. (CVE=
-2026-34181)
> * Fixed CMS AuthEnvelopedData processing may accept forged messages. (CVE=
-2026-34182)
> * Fixed unbounded memory growth in the QUIC PATH_CHALLENGE handler. (CVE-=
2026-34183)
> * Fixed NULL pointer dereference in QUIC server initial packet handling. =
(CVE-2026-42764)
> * Fixed AES-OCB IV ignored on EVP_Cipher() path. (CVE-2026-45445)
>
> [1] https://openssl-library.org/news/secadv/20260609.txt
>
> Reference: [https://github.com/openssl/openssl/releases/tag/openssl-3.5.7=
]
>
> Signed-off-by: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
> Signed-off-by: Naman Jain <namanj1@kpit.com>
> ---

Hello,

Looks like this upgrade needs ptest tweaking.
See https://lore.kernel.org/all/AS8PR10MB5073A4FA9653C5F2A6FC59EAFDE62@AS8P=
R10MB5073.EURPRD10.PROD.OUTLOOK.COM/

Let's wait for the upgrade to merge on master, then, request a backport.

Thanks!

>  .../openssl/{openssl_3.5.6.bb =3D> openssl_3.5.7.bb}              | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-connectivity/openssl/{openssl_3.5.6.bb =3D> openssl_=
3.5.7.bb} (99%)
>
> diff --git a/meta/recipes-connectivity/openssl/openssl_3.5.6.bb b/meta/re=
cipes-connectivity/openssl/openssl_3.5.7.bb
> similarity index 99%
> rename from meta/recipes-connectivity/openssl/openssl_3.5.6.bb
> rename to meta/recipes-connectivity/openssl/openssl_3.5.7.bb
> index 6685654472..6d864e0746 100644
> --- a/meta/recipes-connectivity/openssl/openssl_3.5.6.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_3.5.7.bb
> @@ -19,7 +19,7 @@ SRC_URI:append:class-nativesdk =3D " \
>             file://environment.d-openssl.sh \
>             "
> =20
> -SRC_URI[sha256sum] =3D "deae7c80cba99c4b4f940ecadb3c3338b13cb77418409238=
e57d7f31f2a3b736"
> +SRC_URI[sha256sum] =3D "a8c0d28a529ca480f9f36cf5792e2cd21984552a3c8e4aa1=
1a24aa31aeac98e8"
> =20
>  inherit lib_package multilib_header multilib_script ptest perlnative man=
pages
>  MULTILIB_SCRIPTS =3D "${PN}-bin:${bindir}/c_rehash"


--=20
Yoann Congal
Smile ECS


