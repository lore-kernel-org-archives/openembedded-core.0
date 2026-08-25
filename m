Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44784C61DB9
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 18:09:13 +0000 (UTC)
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28345.1787681348049921837
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 11:09:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=WevMvdzP;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=Jzel3gRp;
 spf=pass (domain: pbarker.dev, ip: 202.12.124.159, mailfrom: paul@pbarker.dev)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 3028E7A0179;
	Tue, 25 Aug 2026 14:09:07 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Tue, 25 Aug 2026 14:09:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1787681347;
	 x=1787767747; bh=nn6UadLeMV7D/XkCt0fuM2otQ+YIg6ZG4zD5seJysnw=; b=
	WevMvdzPb4pZG9fMkZyXVVHv52IIJagvP++hGHFxZFi7z2g/cUHSzKgyG7gUkOqt
	wZIPCuilAipsglTQHp//GGAGpQjM8jkWYZfE80VasBW9cgQlF5iiNkVJAcmry+XQ
	opdK4l5OpV+RcLK8iuJ5gvHiQUQT1wNNxtuoeitv2FPVcAkdsdK59OK5OaVpHB+4
	kvrgZQskpEZfJsfoy9/MfxC3J8gA66OJ5SoWAADe7TzBV/wrek3/FFCUm25n41+4
	gghhamqepFWl6ccBYoWwIwEeCBd4/+9/wlWGsrI2Kul/vOId6OXT6z3rYh2tkwJX
	+roQzWkS9l0/diGlNGBMuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1787681347; x=
	1787767747; bh=nn6UadLeMV7D/XkCt0fuM2otQ+YIg6ZG4zD5seJysnw=; b=J
	zel3gRpbhPuUh89PkzAxAB6jxzRDWYO+iIiwWRxP3DovkihHVAlULiKEnoiMV7Rp
	yt0nS+xsQtunh4H8aWcPPLUHYNpHfXoryfhoo+oISYeVphTt9onMS3tIEmy+GYaa
	qzjopqgxxr1eqccqxmCtQyRIL70cTcHHwbKjA1h7rM/+LERzdvVCYyYLHd/73Bit
	xPLPyXATXCou9qtzflIYViRazhgnKYiGS6N0Y5yqVCPaLPfkzu2KLq9XYENv7TsT
	7BmhRvY5NOyZLreRv6e0hWRrvVde/HU7kS2lV4/sdDxNRL5CW5XAVfdYd56Bw+BF
	Cat0So3u6wpn/TNlLHTbQ==
X-ME-Sender: <xms:QtqNavqPPXgs2l3woG7LmPVQuu2ymLBZ-FUvZl8x8vXgm7lD2mfbgg>
    <xme:QtqNahHh2rm6xPK6snJnr3_CnPtKJ3RylyAoHsvaeKGIi74Nv90Hk_69HJTAfoStG
    dMDSwkhIsRi3AUqvHgyQMvNobsXv3znF0xwg5tP3gk3oK6HodZmBScq>
X-ME-Received: <xmr:QtqNapkikTZ7MoqZOmhztfvY-9pf5Dcpsyz0TY9k7ksIhi_7F6ywOS62woqIdzoON2HnzmQf4OsH7IUL_JvCUAZGEvDhWkcgitLzMhI>
X-ME-Proxy-Cause: dmFkZTGq/nVTU8Htuj51/1wKlQI7LLPfILoFaLAUQPExR+upnL5bJRnvgrBf7kmwLKlcpT
    64IuYdVjcfzYdGy9Afu2JKwqlEJzHeZoATPmVSxxfWwMa2q6N1Uf3Bvt3rc21qral4TwL2
    NRyZKo9WAJkVqckaNCAwux0euFqxx/XzDxYDqYysCw9AXyHTBfycq/UL0qKJgHtC9KdpPQ
    UnYXvScMIUuG/76GOQFnD4T1kYaz1nSRqD1G9D8auAknzsbv2gqtvRztYzqA+o5XCEHo+r
    X+k8Ufdh0Ue07eC46Ygt0Dn716HIuGCfvxddXW8azRAaImQN90nD274mVdYSvCgpvRqyik
    jiHW6Q3jCD0SGQoUxef9y7YD9PRj1SqsupE2+9Xb+JskEN2d6+zYy1IPOZJzFzrZJ5DNpq
    TndPS1dS0iaLr31rKziaCSB6vLJV9jbrXUPYK8pa6GyOjUumNvR/82eGNAjQERa5s3rVEb
    Yqg42X6ck1i9v96vyJShLE29tlpMb2K/ZuPv/2fK1LHX8jKmXTJUuB/iGKjJaGSYR5SvFU
    h4HNptrPx9e5fgXcvhgg2BFFZFZdoTd5aou0upLkwIFar7PsGpqcT8oehnIXVhJ4EOxwNn
    /EwT+cjkyLARj2PtFaKUZprxqATbeuCvgOKBDkx33iz2fTzlo3PsqeYlOw9g
X-ME-Proxy: <xmx:QtqNasm0txz3eFoNZiHWcdswhdoo326Iu6UTGHaxawaHua3ok0mSug>
    <xmx:QtqNaisLUqhpfmZEOIc6-sF8_2kBXnIB5D0ziJDPcEe1ziC4JcXrVw>
    <xmx:QtqNannkLAES7e8D-4hDXzZMyJfTmG7ppeU6iT1q-rxyuUPj4R9khw>
    <xmx:QtqNalsHwdBhmsqxbVX9duX2jPunHV5yoLdW6GLlqofD0E5T4jJyLA>
    <xmx:Q9qNaimJV1LftQBHn_-jXYFUKraaxp9f9lOW_WxMgytDdMf8272O3dcv>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 25 Aug 2026 14:09:06 -0400 (EDT)
Message-ID: <3c09a2a02c36ae3934b533c2cd727d7d4faa44e2.camel@pbarker.dev>
Subject: Re: [wrynose][PATCH] kern-tools: bump SRCREV for conditional
 'depends on X if Y' support
From: Paul Barker <paul@pbarker.dev>
To: yoann.congal@smile.fr, openembedded-core@lists.openembedded.org
Cc: Wadim Egorov <w.egorov@phytec.de>
Date: Tue, 25 Aug 2026 19:09:04 +0100
In-Reply-To: <20260825132319.3151755-1-w.egorov@phytec.de>
References: <20260825132319.3151755-1-w.egorov@phytec.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 18:09:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244254

On Tue, 2026-08-25 at 15:23 +0200, Wadim Egorov wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>=20
> Pull in the yocto-kernel-tools fix for the kernel's conditional Kconfig
> dependency syntax (kernel commit 76df6815dab7, first in v7.0). Without it=
,
> do_kernel_configcheck fails on v7.0+ trees once a config uses the syntax
> (drivers/hv MSHV_ROOT):
>=20
>     drivers/hv/Kconfig:77: error: couldn't parse
>     'depends on HYPERV_VMBUS if HYPERV_VMBUS': extra tokens at end of lin=
e
>=20
> This SRCREV also carries the symbol_why.py/kconf_check audit hardening
> (surface parse failures instead of swallowing them) and the new hermetic
> Kconfiglib self-test.
>=20
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 4f592ee59e90e536af33648112658dafe00f5d0e)
> Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
> ---
>  meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/me=
ta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> index bd90316050..2e13e4ca31 100644
> --- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> +++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "\
> =20
>  DEPENDS +=3D "git-replacement-native"
> =20
> -SRCREV =3D "a4a362d9f4f0abc8ab145a8673166b9bd875731a"
> +SRCREV =3D "96a8d58bcd260f104c193a81b727818424d7b263"

Hi Yoann,

I think this is worth taking on wrynose as it allows BSPs to use more
recent kernels if they need to. The delta in yocto-kernel-tools is
relatively small:

    96a8d58bcd26 kern-tools: add Kconfiglib self-test
    e31601535ff9 symbol_why, kconf_check: surface parse failures and add a =
parse self-test
    b5f008535c85 Kconfiglib: support conditional 'depends on X if Y' depend=
encies
    d30ab1a7626b kgit-create-buckets: update classification for 6.19 kernel

The self-test suite won't be used, surfacing parse failures is a bugfix
and the last two are the ones needed to support Linux v7.0+.

Best regards,

--=20
Paul Barker


