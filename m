Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8ACEC982C9
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 21:07:19 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25560.1789592831398009519
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 14:07:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=afzMQzYd;
 spf=pass (domain: linuxfoundation.org, ip: 74.125.225.140, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cc9f581c4so679025e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 14:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789592829; x=1790197629; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=byZQ5jOGXSOdU5wysLVFM9p3rkryYAtsF5ctBVUJj2s=;
        b=afzMQzYdm1mnA0mLCLCpjEoYS3M8jEz0u7/toRZYdGaZ7Z3WC+lDVLIOg6KxxCki4G
         1YsEW5Xwg2E1uHM0wWCMIfVfrarlOt8N/k/OpJEJxqUJoSgtYCkZfAaHTJecubX4aySQ
         lUYXe4isVKuOlWQUSaj2obZC+9XV/ayeR5QPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789592829; x=1790197629;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=byZQ5jOGXSOdU5wysLVFM9p3rkryYAtsF5ctBVUJj2s=;
        b=GNtmSRHjRGMNW1j16h1GhFNyJjALHNOAc4/27GJernZQxE6GpSo71IjEaqHcIAcJuG
         uVjAZaR6d1k8pQHBCFXIjLwAOjtZ66sxAQzjp5+96xIZwykJDtltwROw3RWLgHL56NfQ
         5gvGhNwwRwzaKEsYg4ORMiX0Od+ORMSWQdoOaCBxWbRI9AjGou9gK4SkuWG5eWbdr55Z
         o8W7r0aJ4IBFq8LD6M+U7kRqz2hA17KnUtrQma0HL4jh4kxpw4LOb692i+eqXulYNfBQ
         cV2GZoDyRZt94VGlQl5D/D5l2jnMemj1Y5pwf0sfaOJOI1ZIPqXJH25vQZOqMyWUXBwc
         UcCw==
X-Forwarded-Encrypted: i=1; AKwUvBwej8ZVo969uiHt/NWYQ25Mg4Q0DkqO2+FwzZmNbUFwOBLgckQxWqMkX9BfSnNy5QjORlEQAX/xJ65lv/M22lNY6Q==@lists.openembedded.org
X-Gm-Message-State: AFuF++kWeC+2+J6SffVDWie1URkyyFfak51ewN6u5TlrNzZRtklbQ1Kx
	nc7QI0C/6i5FryxmlnJCB78GQ7w1OThkfYMNiPwLoyTooUMjmEvdP3sT7LYt/8rCcww=
X-Gm-Gg: AYBFou3dJrrMdIYJJnQnszs8sst7UKMpKMYaeKU/22xtbKh2uUk12VTwQAb0D8yR351
	dZdudSS2feSZ7A0Ao23VrODPXd8qk2wfqBDbS4D7FRm3KP4R7weoprcd+5Di6J8JlFh4wCAyZyB
	jUe+FBY+5BPJPB/Q8teYOUvG9j6xGPjs1yu7QBX5LqkyTIjM3BXnxZreHv7j91kkWooxuzaat1A
	OAxnU+tHYxZOCsL21+9JPv4K2ehwVN/aQYguaBd6ZotSiAmO42+b3p6OGmV7nZiZDA5VTyOXRjE
	5Tp5FzUXwWpz00Nj1dbFGfmKIfN/raB8uqyMgT0R5+BhoNxXQZetyF9H7fzx2EqCeNXW1qgypuS
	FSiJARcEBQTxStTYI5cQNUKrnEGaLvZp3Sfx6ntIA42PM1JZTtOdLNwkyDz4VZnvnlphzDo2dBX
	Oqn/hggGizfS+xD8EX5rnVwHRwMghxRDYl/tjYq70VYJ+EtvnC+n7ZklQ6YQ2g8bhOay58TgiWW
	KYVfKC2esOJF85hlVmTuLDMzu0RMja/q495iN8U42OTrNC+en0gE7IhtoNfOd35PvHxnQUIads=
X-Received: by 2002:a05:600c:1d25:b0:49d:1916:2133 with SMTP id 5b1f17b1804b1-49fbd1ccc32mr17097825e9.8.1789592829593;
        Wed, 16 Sep 2026 14:07:09 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:cd09:70e0:c6de:9b09? ([2001:8b0:aba:5f3c:cd09:70e0:c6de:9b09])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd226ef3sm19689655e9.1.2026.09.16.14.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 14:07:08 -0700 (PDT)
Message-ID: <7d9660f5ccad38dbe08f572b5a3289323e51d9e4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] python3-bcrypt: enable native builds
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ross.burton@arm.com, openembedded-core@lists.openembedded.org
Date: Wed, 16 Sep 2026 22:07:08 +0100
In-Reply-To: <20260916210141.1080593-1-ross.burton@arm.com>
References: <20260916210141.1080593-1-ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 21:07:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246000

On Wed, 2026-09-16 at 22:01 +0100, Ross Burton via lists.openembedded.org w=
rote:
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
> =C2=A0meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb b/meta/=
recipes-devtools/python/python3-bcrypt_5.0.0.bb
> index 51b7edef8cf..909b5890844 100644
> --- a/meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb
> +++ b/meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb
> @@ -19,3 +19,5 @@ RDEPENDS:${PN}:class-target +=3D "\
> =C2=A0=C2=A0=C2=A0=C2=A0 python3-ctypes \
> =C2=A0=C2=A0=C2=A0=C2=A0 python3-shell \
> =C2=A0"
> +
> +BBCLASSEXTEND =3D "native"

Why?

Cheers,

Richard

