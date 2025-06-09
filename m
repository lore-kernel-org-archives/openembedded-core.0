Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25333C5B552
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 09:54:15 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.55595.1749462847893315258
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jun 2025 02:54:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KMATMJz+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a54836cb7fso573636f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 02:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1749462846; x=1750067646; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8hFv/GY+cZOzdQF83g0IXNxPcGF3l8XksyIHNldknN4=;
        b=KMATMJz+HHzrLTeBz2Z00HSfL7dHgmgrbe/s5f/yKJiXJcWuml9tWekP/ljG3SzSZg
         GZoqyJxXQJ5NIrwjn2wij9bIal0NOEl0tStg/xwvP52WqAOChRx2HJCHOALMhctpWrKI
         OH3dUoDAws7TZGEkHSaTvGQwOmZZuBVS7/1HU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749462846; x=1750067646;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8hFv/GY+cZOzdQF83g0IXNxPcGF3l8XksyIHNldknN4=;
        b=IGO8MNOAsHPdizCFM+bQHgXTv66DMtG8JQ5OeDlXEnjmmDGbMHmgYemOOc9VVEvgFO
         1/8+uAKmzncLxCEP6JwqqV+bf9IOnBzk9dEPQSMhmP3oryaW0Mpid/WFxRdzWpwxsKeX
         +Xdev0c0xlPsmAtlwltkZK4ZoJOsCTe5DwKX42whtYsu+X0boqQWaimxMHn8xjxO8eyV
         X+ZAHqVpwqfYf2UquSCeflVE/PAGqMueVTPydccmgJu0O+L1K+fleTmU+M5wj7hGX8yk
         DphertFU9Y69ABP3noj0JMUuU47OffPeTokpWrB3JRVn0Oq5psBcPmAjbHQVQAFiKl0a
         YohQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeYUaG1f8UjIQ6VxFR0Lqi/dwNj/2hmUTXguUfgnonrxQvWpjjfnil1fpkUYXoAMyfiz6IL0a0UhutX5zTf4PmJg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyAy50Cxk8hODWYjix+jdt2NoK4aQCkWFg9YcQ+oq2XGpp4Xefz
	YqRC87eoK4KCf98L84r58HRZ0cIcD42QXK/2Vj4V5fQ8Hnd1xHBmVO/e/Jh6kS2VQYc=
X-Gm-Gg: ASbGnctWQf9mXrkDh7LWgv8OcaX2vzeg3nf74Sl8tX20p8erGw2W+/C/0YhIAQLXm9Q
	KTiJvMP9bRf87h565JFLFjpMbimkD7IQeZmSlgrwWd0eqts+uMWxZCtM2jrjwyYRF8QBY686A8c
	eZbeGM5SaKg2GdrhF1R8A+v1eQGf6LiX0DMQmeVU3NDz1zi4O2X9mentU960VOJPNv8iotutBnJ
	Ifwc62WRiwUA7hTx3l81vyGjSMqtFIIxsUvWyOyZgBYH9ERxIXY6blOa4tMkOTxZHye0+au3oMl
	FgKUJPA0bewihf/hzpK8xF9hk187p8GYTuJ3wzbtOkGY5pUSdTjmIhGpffoJ1vh2y9LPVdIsmHS
	IGh2NbJRRx4VeOgDyFKuGcemFywJkJIaRjJhiEkOr
X-Google-Smtp-Source: AGHT+IEZvr7o/+bv3fqIPSkrn4/IT6H19x5y31ZrWp5u1ST9VRB2HEEou6hJGWpfcqAvdy6h6tkxAg==
X-Received: by 2002:a5d:64e9:0:b0:3a5:2cca:6054 with SMTP id ffacd0b85a97d-3a53188a6f8mr9244985f8f.4.1749462846254;
        Mon, 09 Jun 2025 02:54:06 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:fa9f:168d:c475:ba8f? ([2001:8b0:aba:5f3c:fa9f:168d:c475:ba8f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532450b08sm8947953f8f.80.2025.06.09.02.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 02:54:05 -0700 (PDT)
Message-ID: <375b983ead887292c9321ae47203e9eeed86e782.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] python3: drop old nis module dependencies
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: gudni.m.g@gmail.com, openembedded-core@lists.openembedded.org
Date: Mon, 09 Jun 2025 10:54:04 +0100
In-Reply-To: <20250608122244.3093502-1-gudni.m.g@gmail.com>
References: <20250608122244.3093502-1-gudni.m.g@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 09:54:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218250

On Sun, 2025-06-08 at 12:22 +0000, Gu=C3=B0ni M=C3=A1r Gilbert via lists.op=
enembedded.org wrote:
> libnsl2 and libtirpc were build dependencies for the nis module.
>=20
> The nis module was deprecated in Python 3.11 and removed in Python 3.13
>=20
> Signed-off-by: Gu=C3=B0ni M=C3=A1r Gilbert <gudni.m.g@gmail.com>
> ---
> =C2=A0meta/recipes-devtools/python/python3_3.13.3.bb | 2 --
> =C2=A01 file changed, 2 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/python/python3_3.13.3.bb b/meta/recipe=
s-devtools/python/python3_3.13.3.bb
> index 6839d28e19..11dd6f4b8f 100644
> --- a/meta/recipes-devtools/python/python3_3.13.3.bb
> +++ b/meta/recipes-devtools/python/python3_3.13.3.bb
> @@ -72,8 +72,6 @@ DEPENDS =3D "\
> =C2=A0=C2=A0=C2=A0=C2=A0 bzip2-replacement-native \
> =C2=A0=C2=A0=C2=A0=C2=A0 expat \
> =C2=A0=C2=A0=C2=A0=C2=A0 libffi \
> -=C2=A0=C2=A0=C2=A0 libnsl2 \
> -=C2=A0=C2=A0=C2=A0 libtirpc \
> =C2=A0=C2=A0=C2=A0=C2=A0 ncurses \
> =C2=A0=C2=A0=C2=A0=C2=A0 openssl \
> =C2=A0=C2=A0=C2=A0=C2=A0 sqlite3 \
>=20

Well spotted, removing things like this is definitely desirable!

I think this patch causes xwayland to break as it was seeing libtirpc
through python's dependency but that is a bug in the xwayland recipe we
should find separately, I've sent a patch. I'll retry testing and see
if anything else shows up.

Cheers,

Richard

