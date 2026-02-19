Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E791E9A03B
	for <webhook@archiver.kernel.org>; Thu, 19 Feb 2026 10:43:24 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10981.1771497798315951526
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 02:43:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=QsC8i4h2;
 spf=pass (domain: smile.fr, ip: 209.85.128.68, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4836f4cbe0bso6271965e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 02:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771497796; x=1772102596; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Wa/oBCfWCHhR9wRO0AMI3xNjgrnpocRmfPhXbGu6h4=;
        b=QsC8i4h2n1IDht15QT8hT9dTMPn1v4GfEJ3xtQ5dn/UMPnehYVfZ9IKy+ia63I7YKw
         p/M5CYh5uGHsADMd7Zz81qpH4hkRY4+gcY1LjtLZN8Zx6yUoz+taMOI5LAulVp1GMjpp
         g8MKqmBz3yfeSeWS2iwXBRW+W9u+3r8xrwGKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771497796; x=1772102596;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/Wa/oBCfWCHhR9wRO0AMI3xNjgrnpocRmfPhXbGu6h4=;
        b=j91Mk1zBSlj/wDpF8nxgPgSInvQDaOlerC8KfW9Ugo2ZIqivQO/XIqQ74RU2UzjzUi
         3MtcB4moA5pfvhJhJ8uZlmKLkkzOjUuOLGS8TW3Q0S/M1nis1xrwwlpJn+N5l48jTnk3
         wBihCJqLaNGSxfpXRe8RJ4VHBFt+5yh0fdZAOaSVHvMv6x2Xc9vy2B2vcjGypEBCTju+
         EJp6LdIWHD/tL/weRkN3Z//VB00pukkN3NoT0G6SUHrgH5rtJP0fKZkyRXtbnIdbqK3u
         yV7dvBknmOTxQnkQ44Q8biT2mSCdFguwHw4NwGQ+fUxWHxQckU4vctsifWkBqFLyUbdb
         6wfA==
X-Forwarded-Encrypted: i=1; AJvYcCUB1nCgJTPbea7CuHl6LgCs5+1KI5/GO3wHy3AscZKv4+yyAkBO+L4XYe5YNeUlkamZiGzkz3EjnTX5+DX0grMJZA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyXDATzrBRCNvDZdtE53b8XuVNnaooNmmJOeeMIGI1yEPbdX5d7
	j1W8p+lN0ti2CxfoDKOaaKVLcvQ1cTmicvqHpbfjmO2d3vxv6TTSeaszpsNsb6oUGb8=
X-Gm-Gg: AZuq6aLPrTit6Eo/WPL1iTMwtUczTDvN/l8FZq+NJoTJcErh3dCG4VcGUtp9grimXLY
	hVy6ORDE7m5VyrBhBgD0LXwMMgg+IQBtFEPPy4YQgUxI8p5YrjX+wI6DXSAv8BdNLpQo22R4h+4
	TSL6mUPpNwb7pl5Bb/bv7H2HkJuDu9BlzYmw1uV8CcvAR8fFGghSLgBs++vSOimYNkE5GLMi1up
	mPRCEJJo4aCMpCzarcGAIRlRg50LPoLrKeZHcglgPqD2qNQHAUQIsdbRe1cvhKtwZy0HUqOZPmT
	ciYCg+rzhdEaGV+2BoTkovpMcOGfjXLHqpwR7LcJlTRoiO/DeuV5vcX+zhuCyg/Jhg83+rRuWsv
	0yhOPIr+45Dr/+OPEXySat5yJRPSAmKQ2qOab9kDgT5KDcPayqCHJ5CUVEhTfJ1Bmb8qibykJM8
	xl6/5cwdJia1MrjW0nHpgQuGO44iSVHxPfOdURrYt61FIgZJxbJZ35oKncKF/5TvaWdCRHfSEZB
	iLmZj6o8x51suA=
X-Received: by 2002:a05:600c:c176:b0:483:6a8d:b2fc with SMTP id 5b1f17b1804b1-48398a425bbmr69034105e9.8.1771497796262;
        Thu, 19 Feb 2026 02:43:16 -0800 (PST)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a5ac87sm51523453f8f.3.2026.02.19.02.43.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 02:43:15 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Feb 2026 11:43:15 +0100
Message-Id: <DGIVK4FJ2OTV.YF5LLPMWDNV2@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] openssl: fix CVE-2025-15468
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <hprajapati@mvista.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260202043432.92025-1-hprajapati@mvista.com>
In-Reply-To: <20260202043432.92025-1-hprajapati@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 10:43:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231420

On Mon Feb 2, 2026 at 5:34 AM CET, Hitendra Prajapati via lists.openembedde=
d.org wrote:
> Upstream-Status: Backport from https://github.com/openssl/openssl/commit/=
1f08e54bad32843044fe8a675948d65e3b4ece65
>

Same remark as https://lists.openembedded.org/g/openembedded-core/topic/117=
540534#msg231419

Can you send a V2 with an improved commit message please? Content of the
patch looks good.

Thanks!

> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  .../openssl/openssl/CVE-2025-15468.patch      | 39 +++++++++++++++++++
>  .../openssl/openssl_3.2.6.bb                  |  1 +
>  2 files changed, 40 insertions(+)
>  create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2025-15=
468.patch
>
> diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2025-15468.pat=
ch b/meta/recipes-connectivity/openssl/openssl/CVE-2025-15468.patch
> new file mode 100644
> index 0000000000..dcd862bedf
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssl/openssl/CVE-2025-15468.patch
> @@ -0,0 +1,39 @@
> +From 1f08e54bad32843044fe8a675948d65e3b4ece65 Mon Sep 17 00:00:00 2001
> +From: Daniel Kubec <kubec@openssl.org>
> +Date: Fri, 9 Jan 2026 14:33:24 +0100
> +Subject: [PATCH] ossl_quic_get_cipher_by_char(): Add a NULL guard before
> + dereferencing SSL_CIPHER
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Fixes CVE-2025-15468
> +
> +Reviewed-by: Sa=C5=A1a Nedv=C4=9Bdick=C3=BD <sashan@openssl.org>
> +Reviewed-by: Tomas Mraz <tomas@openssl.org>
> +MergeDate: Mon Jan 26 19:36:04 2026
> +(cherry picked from commit 293b55de0c434a99d0e744d0521170ca280606a9)
> +
> +CVE: CVE-2025-15468
> +Upstream-Status: Backport [https://github.com/openssl/openssl/commit/1f0=
8e54bad32843044fe8a675948d65e3b4ece65]
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + ssl/quic/quic_impl.c | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/ssl/quic/quic_impl.c b/ssl/quic/quic_impl.c
> +index 98b6a0a..4abde64 100644
> +--- a/ssl/quic/quic_impl.c
> ++++ b/ssl/quic/quic_impl.c
> +@@ -3646,6 +3646,8 @@ const SSL_CIPHER *ossl_quic_get_cipher_by_char(con=
st unsigned char *p)
> + {
> +     const SSL_CIPHER *ciph =3D ssl3_get_cipher_by_char(p);
> +=20
> ++    if (ciph =3D=3D NULL)
> ++        return NULL;
> +     if ((ciph->algorithm2 & SSL_QUIC) =3D=3D 0)
> +         return NULL;
> +=20
> +--=20
> +2.50.1
> +
> diff --git a/meta/recipes-connectivity/openssl/openssl_3.2.6.bb b/meta/re=
cipes-connectivity/openssl/openssl_3.2.6.bb
> index fac62245d7..4fd13d52fe 100644
> --- a/meta/recipes-connectivity/openssl/openssl_3.2.6.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_3.2.6.bb
> @@ -16,6 +16,7 @@ SRC_URI =3D "https://github.com/openssl/openssl/release=
s/download/openssl-${PV}/op
>             file://CVE-2025-15467-01.patch \
>             file://CVE-2025-15467-02.patch \
>             file://CVE-2025-15467-03.patch \
> +           file://CVE-2025-15468.patch \
>             "
> =20
>  SRC_URI:append:class-nativesdk =3D " \


--=20
Yoann Congal
Smile ECS


