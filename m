Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85C8FC5B572
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 11:13:05 +0000 (UTC)
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8202.1786878772044190142
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 04:12:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=e7+RcvG9;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=MiHO7yuo;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.147, mailfrom: paul@pbarker.dev)
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfout.stl.internal (Postfix) with ESMTP id 4297F1D00098;
	Sun, 16 Aug 2026 07:12:51 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Sun, 16 Aug 2026 07:12:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786878771;
	 x=1786965171; bh=70QJ1/vg+lILnJPsSM7XaSBiDO5cP0FnZQO7Ok9fJ+A=; b=
	e7+RcvG9Gr3YlBaPcb0ARAB7O8hyzGrx4zlz2fT7XYSCIG58Ks6V7lVuQLr3W6+7
	/uVatN2Ojvwfa7yyu/UB7rKImJ+srtkWKpadfxA9/0Cfu1pX0FMSEE5iOnsuvvSH
	yBCfk+Kg/jS6PYXrc70vVbpTO7LWR3Wm7vUkabH1UW3J6OLYr/v6fcetSAc5DSwl
	D0HVW9sz5ETYhLOJxkeDNnmwICCMGhI7bJPw1zenMo2Mu+2guw+D6O89hPQN1ZIR
	sNXVq1FUJMNUrxlYb6yog5L9eSV5yy6UNXtFDEs8L8ADcBjZ4bGop0gaoKDZd6bQ
	G/p1X9nx1YyjL5r/jClqmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786878771; x=1786965171; bh=7
	0QJ1/vg+lILnJPsSM7XaSBiDO5cP0FnZQO7Ok9fJ+A=; b=MiHO7yuoo6G9oiNuQ
	urBQHQjWlUXYxEvv+ZZ9fTTqGwy7Xy+ZcNHLdbjPfU/bU7s5+y24axCY/fBYJcoC
	jMi4kRHX2G4K1bDXlTZdn4biPtEG7ItmQnAZAyJMRNWo9x5gV3LqOpB/N7vnYqho
	InbvXG5Hh3ks1VYf7dlvbH1BP15bKhDKaEgxJaemGzKyGWQcPHOvb0xkstF5hCUM
	ti7KaBSQuybG5r0BPOipj/StsZQ8wAx/LUJz70H2zVVPZbwYd3RadzKUADq/kdbV
	QXaGJBJ7XHmd6VunE74DzISVLCp/2AnkVwyGYs5UbRu2Iep8uTPq8/XzHzlWBbZd
	TV1yw==
X-ME-Sender: <xms:MpuBagrdlVya-pzZgyWoj9ZcpDVhggahUuKHEbcjuXiCxyy53Ql1fg>
    <xme:MpuBasq4MVq7GVyr1y_Pkkb5ORSa-817y0vidvOix_9-vdMWw-qBY-UHO7pIkiBoA
    nIyE_c1j-IwCUntx9OHA55yeXzCjLnDurEgdC1EUJHiUNTeK6b7FVw>
X-ME-Received: <xmr:MpuBai0gss1ZLcSfJWZ3Xz7cqaiH6L3EJvIh3jjrx4M1wpKzOE4to-BpJ20SI6ebufsdKqjTYdF051jLasd83LRwZBzVgATv7Y51yYPFtP3j>
X-ME-Proxy-Cause: dmFkZTEcds6nSpJiHj6qCyL+AQjnX156EkG+NiGxQa94Cef6B/1a3313XKFrGMm2fZ+3Sf
    LVkKaaX/Cm4KjPrii5DiBhcUWcFnnrF0RiSWRz1wSTBir+BQiNQsh5SwYXk21ab4gBiXn1
    uSSPk0EoDj+FE/YclQeEwLlTvRnUD8jXA5D0tve1sNBIX7PIBMCXbB6+WuedgGoy4AUdgN
    jItFrr7FcnS+oiQWthw0sQgmUIRauYK9Lg49QINhYw1Q1KXTilgGwUkpDkC/oZdvY8AK8b
    Ki7HkzBE2/0AnX7ZpNlbXrCAEWEir0olkhcvDwowTCdyOWvoULKKcqtkYlj5sPUJvW8zpp
    BzTv8O4g+YD+HXXLUHOJ+pp4yf3dsLqsoKzRfmRwqkuokWDEg0NRmU0WEdSkHgE16UCcbU
    1Lp6+qDHBivKdz6NXIxnwyZ4fRkk0YxFd06uqaMSJv4IFMq4y6BvVT1HTPrFOkSFa0sq2m
    qvjjzOwlbnBDC1CVnZxeg5yCbRZOmWPMQdmkBD4jzJpzh7XyiwW9XFMC92MqNjeQRU9mx9
    lwaYjkvfoARmcHLLnb/kty+Te2L7wQLaywkkk8IxEyNBECPDVNmdzU2XhRgL57dlrbkpoY
    PFQetdswWczbg+G/SlZjRD+d0M0RsTiwyqfTaSPUraRJEYlEWF5JCKnqAVvg
X-ME-Proxy: <xmx:M5uBajBqFnUJSS-9ACmCTyoxzxU1hK4vs7bb4Pjk2cmBYrl1hU3-VA>
    <xmx:M5uBaifU-GtDMl2zNnl3L0cCyvtSEX4caNPxOdtblJI0LTqO4tJDXQ>
    <xmx:M5uBaghKGYupAbqEBzrb1sgwx3Jr6m8kYIMfjd-phTeV6ASh6anXXA>
    <xmx:M5uBaipoPP19PGKvDdjI0cn47STZm_NpWANvtkT-f0XfOxxLoOPzyg>
    <xmx:M5uBar4fLJfn-wMnPaMUL7pKyvTFIdCi9r2lXr_ezx-HQzWCqBIt-zFn>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Aug 2026 07:12:50 -0400 (EDT)
Message-ID: <7fc0bf78c8046ad9c23e49f80d8ed93103db3317.camel@pbarker.dev>
Subject: Re: [PATCH v2 1/2] oeqa/sdk: update cryptodev to a revision that
 builds on kernel 6.18
From: Paul Barker <paul@pbarker.dev>
To: Trevor Woerner <twoerner@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 16 Aug 2026 12:12:49 +0100
In-Reply-To: <20260813030515.1028627-2-twoerner@gmail.com>
References: <20260813030515.1028627-1-twoerner@gmail.com>
	 <20260813030515.1028627-2-twoerner@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 11:13:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243522

On Wed, 2026-08-12 at 23:05 -0400, Trevor Woerner wrote:
> The out-of-tree kernel module test pins a cryptodev-linux revision from
> before the 1.14 release, which predates the removal of
> crypto_ahash_alignmask() from the kernel and so no longer compiles:
>=20
>   cryptlib.c:384:28: error: implicit declaration of function
>   'crypto_ahash_alignmask' [-Wimplicit-function-declaration]
>=20
> Move to upstream's "Fix build for Linux 6.18-rc1", which is the revision
> that restores compatibility.
>=20
> AI-Generated: codex/claude-opus 5 (xhigh)
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
> changes in v2:
> - none
> ---
>  meta/lib/oeqa/sdk/cases/kmod.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/lib/oeqa/sdk/cases/kmod.py b/meta/lib/oeqa/sdk/cases/km=
od.py
> index 0c4d8ddb543f..1be23e994fd2 100644
> --- a/meta/lib/oeqa/sdk/cases/kmod.py
> +++ b/meta/lib/oeqa/sdk/cases/kmod.py
> @@ -31,8 +31,8 @@ class KernelModuleTest(OESDKTestCase):
> =20
>          with tempfile.TemporaryDirectory(prefix=3D"cryptodev", dir=3Dsel=
f.tc.sdk_dir) as testdir:
>              git_url =3D "https://github.com/cryptodev-linux/cryptodev-li=
nux"
> -            # This is a knnown-good commit post-1.13 that builds with ke=
rnel 6.7+
> -            git_sha =3D "bb8bc7cf60d2c0b097c8b3b0e807f805b577a53f"
> +            # This is a known-good commit post-1.14 that builds with ker=
nel 6.18+
> +            git_sha =3D "08644db02d43478f802755903212f5ee506af73b"
> =20
>              sourcedir =3D os.path.join(testdir, "cryptodev-linux")
>              subprocess.check_output(["git", "clone", git_url, sourcedir]=
, stderr=3Dsubprocess.STDOUT)

Hi Trevor,

I'm wondering why we haven't spotted this issue previously, we've been
using Linux 6.18 for months now. Are we missing a test case?

Best regards,

--=20
Paul Barker


