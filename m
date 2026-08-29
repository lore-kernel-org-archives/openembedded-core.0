Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D361EC61DBE
	for <webhook@archiver.kernel.org>; Sat, 29 Aug 2026 05:54:18 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2270.1787982851558254465
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 22:54:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=c3WGaucA;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 38CB04E41417;
	Sat, 29 Aug 2026 05:54:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F210F6053C;
	Sat, 29 Aug 2026 05:54:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7D50811C7809D;
	Sat, 29 Aug 2026 07:54:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787982844; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9DxvvUsKA78dWVhBV2Sc4YJ6uglPNXM8R7Oszx+iWB0=;
	b=c3WGaucADNuPeLAYE/RmwL8vAVhnFBoS8GtrzcP1HFVQ+bWEAvzxzF0gQAcp3LeGX0l1mv
	JtgLk3F1Hq7bBtjchcUcTN/r7WyzMhUePGoYk9/JJzRs505vQs4o54McfFhAb7PPcg5qZF
	f0bWVX7MvLjYWUFnh6q+IIrRWgy9s8rEhNxkW+dXORvj1Pfy6BNVRGZWc0goBthczt1uwe
	QcHoHjT0i+J4Y60IlHUEuG9BdUZQJ+cIzPvveKP7SdlY1lz2xTUNS792s5CCKguoUXyWXN
	Xjq832pklNbnje6ZsyKpopOO+2ezYLJrO7eEnvrNrr/SEFR+AuRSQll8BNs77A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 29 Aug 2026 07:54:02 +0200
Message-Id: <DL170QAQB3WG.3GDWN3BWGJ57R@bootlin.com>
Subject: Re: [OE-core] [PATCHv3 141/141] boost-asio: Add recipe
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <gustali@axis.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260828115322.936850-1-gustali@axis.com>
In-Reply-To: <20260828115322.936850-1-gustali@axis.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Aug 2026 05:54:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244631

Hi Gustav,

On Fri Aug 28, 2026 at 1:53 PM CEST, Gustav Lindberg via lists.openembedded=
.org wrote:
> This is needed to build boost asio as a shared library rather than a
> header-only library, which is needed to save memory.
>
> Signed-off-by: Gustav Lindberg <gustali@axis.com>
> ---
>  .../boost/boost-asio/boost_asio.cpp           |  1 +
>  .../boost/boost-asio_1.90.0.bb                | 31 +++++++++++++++++++
>  2 files changed, 32 insertions(+)
>  create mode 100644 meta/recipes-support/boost/boost-asio/boost_asio.cpp
>  create mode 100644 meta/recipes-support/boost/boost-asio_1.90.0.bb
>
> diff --git a/meta/recipes-support/boost/boost-asio/boost_asio.cpp b/meta/=
recipes-support/boost/boost-asio/boost_asio.cpp
> new file mode 100644
> index 0000000000..bf00c8ff26
> --- /dev/null
> +++ b/meta/recipes-support/boost/boost-asio/boost_asio.cpp
> @@ -0,0 +1 @@
> +#include <boost/asio/impl/src.hpp>
> diff --git a/meta/recipes-support/boost/boost-asio_1.90.0.bb b/meta/recip=
es-support/boost/boost-asio_1.90.0.bb
> new file mode 100644
> index 0000000000..9630d99e42
> --- /dev/null
> +++ b/meta/recipes-support/boost/boost-asio_1.90.0.bb
> @@ -0,0 +1,31 @@
> +SUMMARY =3D "Boost.Asio shared library shim"
> +DESCRIPTION =3D "Builds libboost_asio as a shared library from boost/asi=
o/impl/src.hpp"
> +HOMEPAGE =3D "https://www.boost.org/doc/libs/1_90_0/doc/html/boost_asio.=
html"
> +
> +DEPENDS =3D "boost"
> +
> +# Reuse Boost source and licensing metadata.
> +require recipes-support/boost/boost-${PV}.inc

Currently we have a boost-1.92.0.in file, so this will fail.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


