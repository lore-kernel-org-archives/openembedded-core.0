Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EAEBFCD0C7
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 07:37:28 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8725.1773819444670742225
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 00:37:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SPRBjIkW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-486b9675d36so12088685e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 00:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773819443; x=1774424243; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=X4d+GKuvcUjxNx2eoE9fs2IDRnZ83JRtTMDHTb6CGx0=;
        b=SPRBjIkWqWKRp9OLBxZ4vIQ6Xuy+ZmOjGBe3lQa4KVPsB38h1bZMsh29fhPdkckguj
         wseaKyM18c3uqbADWys/Y8C759hfGLAM7wdC2U8fRLhjGwVph/d2qX7ABOg9zrPoHn4R
         PmuszyUKUx5GoKYl7IJYaQ9aAf7aIhuydLnNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773819443; x=1774424243;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X4d+GKuvcUjxNx2eoE9fs2IDRnZ83JRtTMDHTb6CGx0=;
        b=U3W+vl9yVqKagF5NESzV9mnlESzXr4AVPSAPlqu7ifTW5Ym/SyEcOj9IQGCgMXtiqs
         Oz2OFGn9D+CnhR1X8R3e6u2BihehkgqORqtTWtyk634M++m5wzMvLbSJVpYSGv2OKXRx
         2AxWcj3GRVV4vKM2LyFX4iC1CQ3+lRY5u489fd5tWurxTOp1LLwRDeP3g2EL1tC/9+59
         wcYpsef1vloup7gxTLAjkmsr1oY/ZQuOrcl1D1SgEqQ9WTrYu19Dx661lHFT7kkL64w8
         z7Y/Q/1V+4TFo0FVIOfyoAmKzjN6ZJEalfLlQPzwqJ5YzMnqtZxI6CRcSX2ydfRdFOI8
         uHEg==
X-Gm-Message-State: AOJu0YySzq8o8jRqgUJmT9NwHwb5dkJgtTbqWArcJW785rkIomWt0T8C
	efhI12WBdimlhoz9aj1wmEKLCz6x87yEGOQIQGVAaTGYtdcBcyJ72sbn4e80sCSCGSo=
X-Gm-Gg: ATEYQzz/MP8MJtnhfjeqLiCh3lWsrw1ir3wc0iz3dFawexCle/OeGBUik7E91ngqzJO
	ZjCdjQkixaZedYiO6SSMPyPCgmrtGQJ2RwNxO0NLmWCcQHq38SGUKqBoNuj2diA9DD8+rY++k41
	3ZIAJdfd8DY/ch1f2L9cBCbxXpS5iLJZnEOf/S+42CcqCtpLbAftQeNv0t90B65Ho1XC6puGRXA
	3Ao0qdJNz64/FIp5rcofHKDDxk4CNdDPwDMOLRoDZNKk0TgAR+HMwPVUfcekPa+J+uE1yfDsFqq
	TFlu/9OwFNDD3/D9zKnLY5QnlZLXm2nMErsDWHfkg+TZokVqK9WVyKQ+gab7J+CorJTfbd1SsLT
	Ezpa8Vg4jt9mELxdXT7YVsKrdBPorNAtrL32aNKt6gLWbF+6eU3G+bceyv4ff+ju+6BrwgpBn5a
	jkNBxP8SfzyAIvOhFW3m2FWIxiwBX8Xp488XOrRMY/jUxUp/3gK3bMeVmwX6mM4/gBUFb7tHruq
	bCqmDojeWYr1QI=
X-Received: by 2002:a05:600c:8b85:b0:485:4135:5c92 with SMTP id 5b1f17b1804b1-486f41ffff7mr38453625e9.0.1773819442778;
        Wed, 18 Mar 2026 00:37:22 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ccd1:68ee:ff8c:5895? ([2001:8b0:aba:5f3c:ccd1:68ee:ff8c:5895])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856eae3322sm103341655e9.10.2026.03.18.00.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 00:37:22 -0700 (PDT)
Message-ID: <7029edb75e3d8c609447de0d0f7d9f4e73ec5521.camel@linuxfoundation.org>
Subject: Re: [PATCH] lttng-tools: not rrecommend on lttng-modules
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: kai.kang@windriver.com
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 18 Mar 2026 07:37:20 +0000
In-Reply-To: <20260302064010.1421315-1-kai.kang@windriver.com>
References: <20260302064010.1421315-1-kai.kang@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 07:37:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233366

On Mon, 2026-03-02 at 14:40 +0800, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
>=20
> As in the lttng manual [1]:
>=20
> =C2=A0 Most distributions mark the LTTng-modules and LTTng-UST packages a=
s
> =C2=A0 optional when installing LTTng-tools (which is always required). I=
n
> =C2=A0 the following sections, we always provide the steps to install all
> =C2=A0 three, but note that:
>=20
> =C2=A0 * You only need to install LTTng-modules if you intend to use the
> =C2=A0=C2=A0=C2=A0 Linux kernel LTTng tracer.
> =C2=A0 * You only need to install LTTng-UST if you intend to use the user
> =C2=A0=C2=A0=C2=A0 space LTTng tracer.
>=20
> there should be no force dependency between lttng-tools and
> lttng-modules. When set lttng-modules in RRECOMMENDS, it always
> forces
> to build lttng-modules whether it is required or not.
>=20
> Compare to rpm spec [2] and debian conf [3], there are no any
> dependency
> between them too.
>=20
> So remove the RRECOMMENDS setting.
>=20
> [1]: https://lttng.org/docs/v2.14/#doc-installing-lttng
> [2]:
> https://rpmfind.net/linux/RPM/fedora/updates/testing/43/aarch64/Packages/=
l/lttng-tools-2.14.0-4.fc43.aarch64.html
> [3]: https://packages.debian.org/trixie/lttng-tools
>=20
> Signed-off-by: Kai Kang <kai.kang@windriver.com>

The removal of the dependency probably makes sense but we need to add
lttng-modules to packagegroup-core-tools-profile instead.

Cheers,

Richard


