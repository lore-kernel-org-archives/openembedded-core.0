Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ECAFC43458
	for <webhook@archiver.kernel.org>; Sat, 11 Jul 2026 20:22:24 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3032.1783801341096564101
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Jul 2026 13:22:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fBCt7Z8U;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47defd0c1c5so1294453f8f.3
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 13:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1783801339; x=1784406139; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=g5H7bRmIsh/WSiyKWxdFVUHoHlCYvpT+zJXded1Q388=;
        b=fBCt7Z8UrEUtM+8C8bvAYK03ZCnuTQ6qfEE7zA5mjDbdfimaNGkoKL9MiJm26BgLwv
         qw5bhfI0AAwBLXbD7Uek+WXtipYkwBgkSZh6BHMjEGqQM9rKwfc3Rtv6SuKWdvn2ZX1u
         zi9y2h9T1rcZaDKqIi8jGAp+dHTuCfPjd/N3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783801339; x=1784406139;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g5H7bRmIsh/WSiyKWxdFVUHoHlCYvpT+zJXded1Q388=;
        b=amfE3Lko+ZsnRUbX4jliDnjS1VZFIG+QbOX0w+PZGRjBmBkV+QsIvCXRd+J7Ta6sZG
         ADogMcEacoO6H16aKmnMNAtNKC8KDUwJOE1xH+bMCVTCUouz30aZgSt0+D8Tf3cvsoaA
         bM+5MIwNR4IJ45j41/2VNzFao8dHBJFhTS3ZcCCF0yjkFVjD7bohbMewVRJSdyEBKwQ3
         ni6LmlLHObhaP05aEdyUOIDg7RF3OLQZIKQeVVsQs9tqM9m9xem8PwJnlisqLjM7Klag
         qaXW08VpmfkL0eNx3qfcNMZEr/I7YT5BHI1aDzTFuZScCyLXsIfnMRL1GTVN33hNCYyk
         NJIA==
X-Forwarded-Encrypted: i=1; AHgh+RqlKnZSGEDeIIOVE08yv/68G0FsF5boR9WH5omiZ29ekCBbkMuod7ghqPuY1sD7voy2VWxHhdu4JhBC4jqUUpMuNQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwHS3vBIau223UeSdCT30DGaurprbEHP1UB5tYpDqrwtPsfDC7V
	RadVmP0+jSkTNilJgOJM3DLxOOkyXgFql3Khz5223bSA7fx7sZT5FEQTZPvBUqUZ4Zw=
X-Gm-Gg: AfdE7cmDwZE8z0ssHxP4S0NC1dBaM+UErjXJ47Ktfy4YsWEJzgIIba7IIyAPJnwmNJo
	+d1zKgKtJAgT3ReGTxrAZuhKy4HznPfHGyAP6H/GqXDIEon+yFtgA5oS/YMJIGvWHH5gQo5ddH8
	Yr6/upb6IlH4M5a3ziTujlMpihtf8rL+jyB+rmA+tMfqWv3qmWMlkIhd+qKjDZjbUYZ4/kusPj5
	frD0kigLYpPX3KHRkT5Y0pn7yAusiVoYgOBQWM75/7HsRyhKU6YXCK3ZWgH4C3V4kNFVgApxbgj
	K16z1EnverstwyQv1l4PZUD6KWSaFzmTZabhNWdapP8j0MOg72vjYZanuPAM0qXISFfRbB6Y0Ge
	geHVOpn4qlS5XXrtBhX1ryRKkRb3zcN7Ll4oFiQAVhAd1lTpxbF5B75nT/evFWgSuag4Kcokhw+
	kzbvMmsSiqU3HqdKhofn3aCQlW4imRmsrx8jIZi9FTF+tW8UQbkcuvO8QTJet//fATNBQNqrXVV
	lKptg==
X-Received: by 2002:a05:6000:490d:b0:475:f0f0:9ec9 with SMTP id ffacd0b85a97d-47f2dced575mr3533839f8f.52.1783801339141;
        Sat, 11 Jul 2026 13:22:19 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2004:2e5c:aef2:b707? ([2001:8b0:aba:5f3c:2004:2e5c:aef2:b707])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f214d2sm69455280f8f.33.2026.07.11.13.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 13:22:18 -0700 (PDT)
Message-ID: <fb32c995d37fa733f3686caf3350de7b45025c72.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 01/19] kernal-vars: introduce new class
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: vince@underview.tech, openembedded-core@lists.openembedded.org
Date: Sat, 11 Jul 2026 21:22:17 +0100
In-Reply-To: <20260711052403.1292286-1-vince@underview.tech>
References: <20260711052403.1292286-1-vince@underview.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Jul 2026 20:22:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240722

On Sat, 2026-07-11 at 01:23 -0400, Vincent Davis Jr via lists.openembedded.=
org wrote:
> This class is introduced to fix an issue
> when KERNEL_PACKAGE_NAME is changed.
>=20
> A number of recipes rely on hard coded
> kernel prefix set by KERNEL_PACKAGE_NAME
> when including modules. This leads to build
> time failures.
>=20
> Such as
>=20
> ERROR: Nothing RPROVIDES 'kernel-module-*'
>=20
> Signed-off-by: Vincent Davis Jr <vince@underview.tech>
> ---
> =C2=A0meta/classes-recipe/kernel-vars.bbclass | 7 +++++++
> =C2=A01 file changed, 7 insertions(+)
> =C2=A0create mode 100644 meta/classes-recipe/kernel-vars.bbclass
>=20
> diff --git a/meta/classes-recipe/kernel-vars.bbclass b/meta/classes-recip=
e/kernel-vars.bbclass
> new file mode 100644
> index 0000000000..1acfeb97ea
> --- /dev/null
> +++ b/meta/classes-recipe/kernel-vars.bbclass
> @@ -0,0 +1,7 @@
> +#
> +# Copyright OpenEmbedded Contributors
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +KERNEL_PACKAGE_NAME ??=3D "kernel"

We are definitely not adding yet another kernel class, particularly for
a single line. There has to be a better way to solve the problem...

Cheers,

Richard

