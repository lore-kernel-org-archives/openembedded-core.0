Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDBAAC43458
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 15:18:56 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.94670.1783091936361221643
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2026 08:18:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=xjXX80uu;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493b27c7451so17394295e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 08:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783091934; x=1783696734; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2QgVLlvLiK02Vz9ZV45cXBS4zogYr2LK84i2/smN8Gc=;
        b=xjXX80uuajGmx2ePJRRUmhrs5RGk3tih9LkEzuosjYLVyoAKAFz4lUxUa8SK/Ov821
         OISV4irLHoyRUfJNZm9BexQUDGFc/6FnAkDgqV3oHHIKqldrQ6adcIInkV0cXryZbgfy
         DP2OJnZWCNvt3o2Du7KIxltthiKLy8ltjQEXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783091934; x=1783696734;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2QgVLlvLiK02Vz9ZV45cXBS4zogYr2LK84i2/smN8Gc=;
        b=amzDFy6e7YKzqGV0Aet+qE1E5SSNFUwg4o4Kw1ava4Lh7t+FX32eH2dZEsdhUNC8J0
         90HjfPgS9RXk5EQTaDxzu7/OuuW9EMo4Zo+KxDR8xZx7ev5Q57oJzS8QcFAnBuOjPlUA
         N5kcxO8P+vvjH42X7EbgIdZGAOs0sIe1YN9VLSDINI1x7Hmt+7j7ISxRGJPGJTGnrzN7
         QFNRWsAMxgecxeuZgM6P4o21mG18IGO7EC24pxndvStz/73t/M0Zjlep0BrhbhAz4FA2
         rrYe64bzoNKaM7Kw4EUu9NxZVmDXXK0QUY2dWea/sap4Bi9ZZbT8aq85WIwu7fu5gQjS
         oqiw==
X-Forwarded-Encrypted: i=1; AFNElJ8AhDujbazyJMEJ0mHpCXTwMKVNSp4OLnKI8q3y3JG9WWXxbnP9lHfWQiA+XWGkdcCo3rTbLa/CCnEul6uRa7XpFg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzaiPbK6h28sV1gf5RkE8x1+F5YX8RxtDwSyJWRn1XCXgUUvJw+
	CRyU5UKtoN/Aqh076gTmnQHH5nnTC5DRYry+GfJtznD94IFgOXIWiMPeKSnj8RjNvi4=
X-Gm-Gg: AfdE7cmX/Ri4WX8ErdVTbn59P+ampWgCVow1sQamvdZnslBd0aNlq8uUu6LU5U8M0Zr
	m6mYI9gWkwV9p8G+f2x0d8SoxHo3V8t5gcEStN9C2+KcMvMgkkgpPGeA7j3yLuIZNxiJR8vGInz
	qKqmrmaP8AvEo+7CRSmgHBxXngkKFAW1SXEvqFhNynHrEWyyyHM5lyikgJgT3jEKjO7e1Aa9nHI
	TeF511ujDQvDnTIov+xkeDg73f0ZxlY5Ff4lkn2bZhuOXBQbB4VTCPV1hblVXIf4wXFOSAlandt
	K+Fxmz6MqHlVih9Hp1JDY7Afnr8Rn1x0PK2Xju8WEoJXmwpLqeHcT3xWdD8+TKQv9EP+XEANLJt
	NObq2gQc1Dpe+nIQ8FXdcPq721jFkDF+R0MUUPLO/xK0Hvkfng6B+2F8x4513zuHBjOY5LjIavm
	x3vVVgIkc/9h2FyqfqbsLGAlvSa4brIprJgJqBHdfLGZpZiHTnFTu+I8yeCegFZgYG7g9hEOnxA
	4iX3g==
X-Received: by 2002:a05:600c:34ca:b0:490:b26c:64ad with SMTP id 5b1f17b1804b1-493c9b4d759mr52924905e9.5.1783091934510;
        Fri, 03 Jul 2026 08:18:54 -0700 (PDT)
Received: from localhost (2a01cb001331aa0075403fb2c9c4e210.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:7540:3fb2:c9c4:e210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bef11338sm208340725e9.1.2026.07.03.08.18.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 08:18:54 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Jul 2026 17:18:53 +0200
Message-Id: <DJP1C6225M38.16SJEUGB4RO02@smile.fr>
Subject: Re: [OE-core][wrynose][patch] gnutls: upgrade 3.8.12 -> 3.8.13
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Peter Marko" <peter.marko@siemens.com>, "Mathieu Dubois-Briand"
 <mathieu.dubois-briand@bootlin.com>, "Richard Purdie"
 <richard.purdie@linuxfoundation.org>
To: <vanusuri@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260629071648.1471849-1-vanusuri@mvista.com>
In-Reply-To: <20260629071648.1471849-1-vanusuri@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 15:18:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240123

On Mon Jun 29, 2026 at 9:16 AM CEST, Vijay Anusuri via lists.openembedded.o=
rg wrote:
> From: Peter Marko <peter.marko@siemens.com>
>
> Solves CVE-2026-33846, CVE-2026-42009, CVE-2026-33845, CVE-2026-42010,
> CVE-2026-3833, CVE-2026-42011, CVE-2026-42012, CVE-2026-42013,
> CVE-2026-42014, CVE-2026-5260, CVE-2026-42015, CVE-2026-3832 and
> CVE-2026-5419.
>
> Release notes: [1]
>
> Rebase patches and drop patch included in this release.
> Add patches to fix linking with musl libc.
> Increase memory needed to successfully run test key-openssl.
> Drop code for previous release tarball problem.
>
> [1] https://github.com/gnutls/gnutls/blob/3.8.13/NEWS
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 1193b0778a0f81bd75f7ec6f8f44fa44cf4b8f5e)
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
Hello Vijay,

Sorry but the linked changelog lists new features and evolution not
limited to bugfixes:
> ** libgnutls: Allow fetching object type metadata for PKCS#11 keys
>    A new library function, gnutls_pkcs11_obj_get_pk_algorithm,
>    has been added to check the public key algorithms of PKCS#11 key objec=
ts.
>    Object types other than CKO_PRIVATE_KEY are currently not supported.
>    Contributed by Ghadi Elie Rahme (!2074).
>
> ** API and ABI modifications:
> gnutls_hpke_kem_t: New enum
> gnutls_hpke_kdf_t: New enum
> gnutls_hpke_aead_t: New enum
> gnutls_hpke_mode_t: New enum
> gnutls_hpke_role_t: New enum
> gnutls_hpke_context_st: New context structure
> gnutls_hpke_init: New function
> gnutls_hpke_deinit: New function
> gnutls_hpke_encap: New function
> gnutls_hpke_seal: New function
> gnutls_hpke_decap: New function
> gnutls_hpke_open: New function
> gnutls_hpke_derive_keypair: New function
> gnutls_hpke_export: New function
> gnutls_pkcs11_obj_get_pk_algorithm: New function

Thus, this upgrade is not acceptable on the stable branch, sorry.

Regards,
--=20
Yoann Congal
Smile ECS


