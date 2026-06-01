Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EEF5CD6E55
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 11:15:55 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26082.1780312547856449768
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 04:15:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DXv2FCh9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45fd461e4a5so1174811f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 04:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1780312546; x=1780917346; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JhscXBpo9HPlWrzswN7h9c0HILSnPAsg51ebMttb9Ds=;
        b=DXv2FCh9DJ/36YJt7VPRWK5u6tB8LjiZsV2NeW8WkYHBAPD9pFljyvnCurwKT2+Vx2
         0Ka5pYJpbn6G/xHAjuwshScp/Esn9d4RAP1nPjELtbvhNqvkYIICDw5RAqJSr7gLHJJk
         +KbtuTaBrn51agRGXwS99ekDiiwmTh2Zyay9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780312546; x=1780917346;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JhscXBpo9HPlWrzswN7h9c0HILSnPAsg51ebMttb9Ds=;
        b=sAh/wE3yEikjO7LeWYgxKP9Z/0K00LfFR9M7SWavG7ddcggwKvpcD6tNv9+AYjQ0IJ
         7y8zQSNUiGtuKyzjS9vN6/WA7cjAEhQHR3zU8j2ex7Tv6qn96UREtQbimkJKClsXgbU/
         TRGLuq27NvUsDvJoEdyQLQZE2qqAqOMw/7Pv0LA8YDeJOvzd6Td7ASPgK58g9rHiCxLu
         EA+RCJtsFWpB4RTiPcZBSQG/MSWt4zeMzo/uoBqDn1qvyRHvu7t+35NG0KhT0793JoiG
         3OPvbk1yc1Ohti091r0f4Jn2TXY7iTttM2GdtG/zyRpTwYxKBcbQRlCvv8W6VcIyclTf
         FJzw==
X-Forwarded-Encrypted: i=1; AFNElJ+UEbFXvKHCIpZNReRty9TH9KY2sArNa4MvGgcxBLl2rRVqAIvv+OUsTocy6qh708L5bq+H3Vh7gWjGUqo64ncP1A==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yytfe+kB4xI4kNgJQhR1rzeec1GpgyOofslzUASjfigUH+cyrLA
	xwIU8sJDecpz4aMQ4tiOCoJTq07GBpqm4WZJyBfkSgUfLfk8aFaZ7BqaS3IVUFtGAjA=
X-Gm-Gg: Acq92OGbCONEqSy2n4vl+bNPdJZCXAKrOPAcHTeVRxIAmj4nUhMNnpdjf6rkUAiEYal
	oM7pdCUj+v2Jwliddb2TiYZ9lkxQbTWMXuodsCXSNZ3iPMhY07GL9CeCUYBt5KpKQQxspybjCsS
	Lj0cqeOIil7DXQhRcFwflmeKXPDwxejc1T53mRdamaKhFB8gSTL6hO2G9loF7OwufcS1zELGR0W
	vnx/1phm/cFzm1U6CuBMrsTF/ol9WnScEXaSuHd0+lqUDhe/FDzz834NFbQo4Bh8z96XQixPDWm
	pSV5Xsp//FeEzj7i6B9IeWgBzxu+hO7m0GQBWIYSONe8vvew9cqDpNzlNo+8utQWshxjhXX+igc
	a2/6bD9WmXV7kvAaEnDiDtQ+l8AugbXkHwcN0eyraO9TUT8Ad070p8ud+VYZbkv/Ul9+bCMLFUO
	aO+2MrIhuF7NANuR9/8qG9Hh5Kv3HgeOL+y1P9VLGB00rTS7930ZeRm22Il3O7w6dhZk10wy7OD
	gHcE2EYyJJwDLscFnviKFMl
X-Received: by 2002:a05:600c:6b6a:b0:490:53d3:4753 with SMTP id 5b1f17b1804b1-490a2952f8fmr131375855e9.31.1780312545851;
        Mon, 01 Jun 2026 04:15:45 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:91e5:137:d314:95b7? ([2001:8b0:aba:5f3c:91e5:137:d314:95b7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d6975e2sm391732535e9.6.2026.06.01.04.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 04:15:45 -0700 (PDT)
Message-ID: <86518a03f36a484e8caf676474ff8a2e1ff72fd0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/6] package_manager: sdk: remove
 sdk_host_sysroot
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: devnull+rouven.czerwinski.linaro.org@kernel.org, 
	openembedded-core@lists.openembedded.org
Cc: Rouven Czerwinski <rouven.czerwinski@linaro.org>
Date: Mon, 01 Jun 2026 12:15:44 +0100
In-Reply-To: <20260601-topic-packagemanager-cleanup-v1-3-926e4d5b724d@linaro.org>
References: 
	<20260601-topic-packagemanager-cleanup-v1-0-926e4d5b724d@linaro.org>
	 <20260601-topic-packagemanager-cleanup-v1-3-926e4d5b724d@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 11:15:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237828

On Mon, 2026-06-01 at 09:13 +0200, Rouven Czerwinski via B4 Relay via lists=
.openembedded.org wrote:
> From: Rouven Czerwinski <rouven.czerwinski@linaro.org>
>=20
> The instance variable sdk_host_sysroot was always set to sdk_output,
> remove it and use sdk_output in its place.
>=20
> No functional changes.
>=20
> Signed-off-by: Rouven Czerwinski <rouven.czerwinski@linaro.org>
> ---
> =C2=A0meta/lib/oe/package_manager/deb/sdk.py | 2 +-
> =C2=A0meta/lib/oe/package_manager/ipk/sdk.py | 4 ++--
> =C2=A0meta/lib/oe/package_manager/rpm/sdk.py | 2 +-
> =C2=A0meta/lib/oe/sdk.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
3 +--
> =C2=A04 files changed, 5 insertions(+), 6 deletions(-)

Most of these look fine but I think with this one I'd prefer to keep
the existing naming even if it does map to one of the other variables.

In theory the SDK install directory and the SDK host sysroot aren't the
same thing and I suspect we're partially through trying to make some of
the code clearer there.

Cheers,

Richard

