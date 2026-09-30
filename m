Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E367ACA5FC1
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 09:19:24 +0000 (UTC)
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9422.1790759961137324128
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 02:19:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm3 header.b=DM6Ho3qB;
 dkim=pass header.i=@messagingengine.com header.s=fm1 header.b=yWfN5GFp;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.151, mailfrom: paul@pbarker.dev)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 24DFDEC02FB;
	Wed, 30 Sep 2026 05:19:20 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Wed, 30 Sep 2026 05:19:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1790759960;
	 x=1790846360; bh=miSS158lyosoS/RDGrxkIu9p1dfhPpsKVfSnQAUqg4w=; b=
	DM6Ho3qBwGHrxKosCDT1lLo2YI6p03xPttWby1MVyDYJsjrPoq97BJlBFS3LYTwu
	Q0TukND2ECAbenpsbqdAZgyTA0JFXWK6hwBR2diwxGeqUjkDklwo8NYQLa2XSH3G
	7I8NbBREq0NzI5FZf1/6V/7W3au8PsfsShx+Mrv/X4gnJUtampzZSkPCNwRlrk9B
	oIPulUG3vtk3cqzTMp0lx0mBvzv0UNf8qqe8E1WyRME3LAZEVDFbYBa3wkCs84fP
	6dv7kIgyY/gYApGtViy8MtkPTFpFuGtk5ArnJM1O5O0CH+6Hns0cztrEAqjvfKBc
	6iQoFVMzS1SR/WWNsmp3DQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790759960; x=
	1790846360; bh=miSS158lyosoS/RDGrxkIu9p1dfhPpsKVfSnQAUqg4w=; b=y
	WfN5GFpjqvMuXn85tbNa2URbZ7cPJZGxemagxr7JpoFj1px45DqPvLWc1GEYB/Xy
	UKqgaLLYOKY+A0IpKwMijrIoWE7z/l8bFcccpq5YQayYiBEBkeU2Hzna7ZjhXw/n
	IleeHCKnWH6Ff9yuD/EtSQ/ZJCs5c66QbwOJFD47teLiJRr/gffdoAy5YGEmdZlv
	otjoqiiSM3J4FG7BQUHY+wbipTZFE/K5FNqWBgr2RbfubSjMwRYK3bRn6lLOPP+H
	jG/QqNQo4ELyeG0NBZt9wTGoNKWTFaGqLZVVIQekKK/x5J9whLL8E+eUcjB/dFTN
	1YXjGd+uWZPBEU1F6hlRg==
X-ME-Sender: <xms:F9S8ajq_UTQXQf1RaANzlZ3ail6SIufpJdE9b2ybQUUCWmRkZ8Vfug>
    <xme:F9S8amnhEFLDI6qtQfCuzvb4nTp3n_ZNWQhbGI4i4vo6AtHS1j4OzQKj4fII60YFr
    6nHQc54_W2pVAE7gdwQ-l29LVX5_2-A2WXPldbJ1C-I0L0_USUS3Jg>
X-ME-Received: <xmr:F9S8aryXuUwIxYQSZa0JD3k7a4OibQOJgpojFg-wHkIUP0OJpUvTKd3DiajX9nW2S8h0Ayzw3rxCQ6eJvtQ5szNlrTrwAyi428_Q8RU>
X-ME-Proxy-Cause: dmFkZTEWqtMXBhVnHQN8rBe6bgvSQere2/yhR43vBoW4SIVLQDjTdyhIc2U46fb0LSXJdE
    Lp7LrzmMZOQxtkdSYi9rM4hywH8Plo52Q7p+q3BjcNE8cz+CCGnEjUgFQpcywYobV7LqVj
    jdbGg5cmXI/2j7fhkDErUy2HmalEGtzjrIo0lXO7GzaWaj4y1aixvv3rQKwZGPhyR228HF
    I7UtuKvOefGsCSDmy4DsqQ21uNdTUx3yvGOWoc5Jk0CmRHQrXApEiRiK/9BzUkG4s8CuLo
    0jUrmix6/v1Czwz2nFfUnPKmxe7HFQ196gRxdT4yZ6Nenk5fAwt7iwqTeJ2xI7PWlymJLj
    rk40y8Pp+kH3Iji4UO/K6gkNAdFLqr9hWsNQg2N/LuwXby5l6XdQgSJKZ1HnOtEmy/3lu1
    0wEm6GqFheX29lX9DT2Hf+DXewoMUusS8ThCM1OEZfAzjT5EbMo//bt5xChKXuk4H3/K+X
    DreFfsAA5fLf6fV1gtT7BwNRYUw2rOQ9LZB9fEhjPWAwbFDH9xKOw9ywb6im6RHccEMyol
    j3reZ4WhoH9vehtan8/lReKGV5XILJQdToliBn+ysYQohTZ9i7Sh76KR5D2xqm+333b8OS
    t5HejWtgXeXO0ahwO5lNTySbu35qFg1XIhBcAPzVQgHPMOKjkL4PlD20IRVw
X-ME-Proxy: <xmx:F9S8am_EGUqN8u57zzwAv0Y5jipXai4Z4Ar4z7Z8XvqiJSsKF-INFA>
    <xmx:F9S8avK3i1QUh5XqCVlklbmq39UfFaKTE3mS7GXbpbcEp2b_piQYHQ>
    <xmx:F9S8asctxtksi073yPmLvQXIJtQNXnvMDVlImmas0oXM4e1nUtnpGA>
    <xmx:F9S8au8WbPKd-oS457OZczWTaePHCyu8x61ipv0cSaAFGh-mz5Pn9Q>
    <xmx:GNS8arqjh_Chh6RedF_YPFaVHktDZNqLOB_7FJFx4zwClyY1JscW8R5M>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 30 Sep 2026 05:19:18 -0400 (EDT)
Message-ID: <f2101f97616baa3cee4c5733846dc6b64dd944c2.camel@pbarker.dev>
Subject: Re: [PATCH] xorgproto: Set ALLOW_EMPTY for the main package
From: Paul Barker <paul@pbarker.dev>
To: mark.jonas@de.bosch.com, openembedded-core@lists.openembedded.org
Cc: wangmy@fujitsu.com, mathieu.dubois-briand@bootlin.com, Ricardo Simoes
	 <ricardo.simoes@pt.bosch.com>
Date: Wed, 30 Sep 2026 10:19:17 +0100
In-Reply-To: <20260918141849.1875-1-mark.jonas@de.bosch.com>
References: <20260918141849.1875-1-mark.jonas@de.bosch.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 09:19:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246950

On Fri, 2026-09-18 at 16:18 +0200, mark.jonas@de.bosch.com wrote:
> From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
>=20
> When creating an SDK, the populate_sdk task relies on
> COMPLEMENTARY_GLOB[dev-pkgs] to decide which packages to install [1].
>=20
> However, xorgproto is a header-only library, so bitbake does not emit a
> main package. The only reference to the -dev package is an RRECOMMENDS
> from the -dbg package, and such weak links are not honored when
> installing complementary packages [2].
>=20
> Fix this by setting ALLOW_EMPTY for the xorgproto package. The main
> package is now emitted, which makes ${PN}-dev reachable through the
> complementary packages and lets recipes that depend on xorgproto be
> built with the SDK.
>=20
> [1] https://git.openembedded.org/openembedded-core/tree/meta/classes-reci=
pe/populate_sdk_base.bbclass#n38
> [2] https://docs.yoctoproject.org/ref-manual/variables.html#term-COMPLEME=
NTARY_GLOB
>=20
> Signed-off-by: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
> Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
> ---
>  meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb b/meta/=
recipes-graphics/xorg-proto/xorgproto_2025.1.bb
> index e187c56fbc..df09135e27 100644
> --- a/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb
> +++ b/meta/recipes-graphics/xorg-proto/xorgproto_2025.1.bb
> @@ -23,3 +23,6 @@ DEV_PKG_DEPENDENCY =3D ""
>  RRECOMMENDS:${PN}-dbg =3D "${PN}-dev (=3D ${EXTENDPKGV})"
> =20
>  BBCLASSEXTEND =3D "native nativesdk"
> +
> +# This is a header only library - thus everything lands in the -dev pack=
age
> +ALLOW_EMPTY:${PN} =3D "1"

Hi Mark, Ricardo,

I built the SDK for core-image-sato, and this already includes
xorgproto-dev without applying this patch. I can see the package listed
in the target manifest and I can see usr/include/X11/X.h in the target
sysroot.

Could you provide a bit more info on the SDK you're building, any local
config changes, etc, so I can reproduce the issue?

Best regards,

--=20
Paul Barker


