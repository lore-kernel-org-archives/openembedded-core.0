Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 162D2C3DA59
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 06:59:17 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.4939.1721113154575208582
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 23:59:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Dm9lvE8x;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42797289c8bso37682265e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 23:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1721113153; x=1721717953; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w5ABavBSNMXXpH4uVecaYCPKbW38l6yyAFAY05eZ03U=;
        b=Dm9lvE8xvg1XC7JdpXDHsWE0VLcz5rpPBAsEAtPL0mh7MR1bQo0sAYAInyh6h3bPa4
         r7yl5HCQ3XVNSMzddOwFg6FZ0bwmMe1QBVhekIE9W+1P6B7x0UDgQeZPBDigjnkuNI/J
         G0Zb83dn18zhs+B/WZ7ZBx7hvM2t7jZlEqqJg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721113153; x=1721717953;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w5ABavBSNMXXpH4uVecaYCPKbW38l6yyAFAY05eZ03U=;
        b=OZiIijyUKPanObfRXfzi9rVwbPy/LM5yWd4CkafmWTjydHawUPUNr/iO3aRGNzQSQG
         ncNXFCbhFLoFuF5He8AD4NEiWIVqZvaRuCzEsDyFJMQPXQB5xEd644GJPTZezpxptt+r
         btNqCQYE56Iht/HW3gMjH8DSE5wxwa2e6+AC/FIMm/adX45AJIPKvz5X8cM0D5FGFVTz
         wpsHmJKlw82VyP6q+iJuqaSFWBf2uejc+gfoAD9TTt1iqFDWvzg9WeXY8aeI5T5ehB7z
         7WMZAOKGq/6gpTIbaJcdBl24uzFG43kw1PAZ18tCqdGALTxdrwYoi3DoW5ez3tK1nSEL
         k4Tw==
X-Forwarded-Encrypted: i=1; AJvYcCXimoqta3+uK/HCsRsS2OKHlq+yZYiYlY0sdpixlQzCrXH35XUal+88s7G8Vn7smm7kljPAAAznzMQYw0bL8gnYfSzxJwn5c9bjN69DjSfX1KgouLJdU4xj
X-Gm-Message-State: AOJu0YzTqUhGbBUa+mOdG7HyWCTW25AGwXDZsiQjslIT2X4aKJqB+yyh
	hajJTosdJv6wI7DGUqQgDmmCCl0uVLLiDZxBegPDdN6bkOloMGOX+qbN3b8T0vA=
X-Google-Smtp-Source: AGHT+IFIZLgUWZNWHu/kZ9FnSnGoNs1ZudilPcsVUz/K3MREB3h4M9WAM1BGPmQAbsc1SdJtCzHHUA==
X-Received: by 2002:a05:600c:6a95:b0:426:55c4:ff34 with SMTP id 5b1f17b1804b1-427ba690fb4mr8299665e9.15.1721113152986;
        Mon, 15 Jul 2024 23:59:12 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:86a0:3ee3:878:91c7? ([2001:8b0:aba:5f3c:86a0:3ee3:878:91c7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680dab3bd8sm8153962f8f.13.2024.07.15.23.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 23:59:12 -0700 (PDT)
Message-ID: <5d12bc39242bdae7d3d90f7f1a3152dc790c3aea.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] mesa: fix QA warnings caused by freedreno
 tools
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: dbaryshkov@gmail.com, openembedded-core@lists.openembedded.org
Date: Tue, 16 Jul 2024 07:59:11 +0100
In-Reply-To: <20240715230539.139514-1-dmitry.baryshkov@linaro.org>
References: <20240715230539.139514-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 06:59:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202081

On Tue, 2024-07-16 at 02:05 +0300, Dmitry Baryshkov via lists.openembedded.=
org wrote:
> Fix following QA warnings / errors
>=20
> File /usr/bin/afuc-asm in package mesa-tools contains reference to TMPDIR=
 [buildpaths]
> File /usr/bin/afuc-disasm in package mesa-tools contains reference to TMP=
DIR [buildpaths]
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> =C2=A0...t-include-rnn_src_path-into-rnn_path.patch | 27 ++++++++++++++++=
+++
> =C2=A0meta/recipes-graphics/mesa/mesa.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 1 +
> =C2=A02 files changed, 28 insertions(+)
> =C2=A0create mode 100644 meta/recipes-graphics/mesa/files/0001-freedreno-=
don-t-include-rnn_src_path-into-rnn_path.patch
>=20
> diff --git a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-includ=
e-rnn_src_path-into-rnn_path.patch b/meta/recipes-graphics/mesa/files/0001-=
freedreno-don-t-include-rnn_src_path-into-rnn_path.patch
> new file mode 100644
> index 000000000000..2741f87ed00b
> --- /dev/null
> +++ b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-include-rnn_s=
rc_path-into-rnn_path.patch
> @@ -0,0 +1,27 @@
> +From 7a8044621ae7dcba1873a13190ac51a6465937b7 Mon Sep 17 00:00:00 2001
> +From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> +Date: Mon, 15 Jul 2024 22:23:32 +0300
> +Subject: [PATCH] freedreno: don't include rnn_src_path into rnn_path
> +
> +rnn_path gets compiled-in into several tools, which triggers OE QA
> +errors. Remove rnn_src_path from rnn_path.
> +
> +Upstream-Status: Inappropriate [OE-Core QA issue]
> +Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> +---
> + src/freedreno/meson.build | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +

I'm not sure Inapproriate is the right choice here. I'd say this is an
actual bug in mesa when cross compiling. When cross compiling the build
system shouldn't be putting build paths into target binaries.

We should really discuss this with upstream and see if mesa can avoid
doing this when cross compiling?

Cheers,

Richard


