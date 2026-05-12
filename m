Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86D42CD4851
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 10:30:37 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.72144.1778581827482420065
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 03:30:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=BythkQ3X;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 477A31A357C
	for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 10:30:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0A1D960646;
	Tue, 12 May 2026 10:30:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E033411AF8EEC;
	Tue, 12 May 2026 12:30:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778581824; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VI5ckCgsS0yKajht4wk4ePatp7mIeU+Ukbs0mNRhreE=;
	b=BythkQ3X3+U+fTW9l1H+67Bl8WOanvMFGPngU9bQobQ8PiqDWx+xaFYybNDccw6jbtsyj6
	36E8Ye1JwPNCTs6s+zh3Bu+8z9nCofnHMpuG6ryWPqETe2CUsrG7F7rXkikCuvhhJMYT1B
	uq8J5JVzKy2xEQMh0WnDq3kxiypk63atfQu/U3Yrgblj3jQM7P4Ct6eCa71FEAmDLz5mdo
	t1Sp9MV8eNV7D7iwQXVW+kLfVysdaozC0N9o/XDr0GWXabrCjKmGRr/RW0BgnAG6aH6mC2
	Zj57gfZ4EEPFw0BNm7IGnRlywQorxr6/BwC0bIuyqXSz8ye7BBYo66r7kaL7dA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 12 May 2026 12:30:22 +0200
Message-Id: <DIGMMXA709JT.2E77IPME1VZ0G@bootlin.com>
Subject: Re: [OE-core] [PATCH] gstreamer1.0-plugins-rs: add new package
Cc: <sebastian@centricular.com>, <nirbheek@centricular.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <tarun@centricular.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260511133450.50595-1-tarun@centricular.com>
In-Reply-To: <20260511133450.50595-1-tarun@centricular.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 10:30:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236879

On Mon May 11, 2026 at 3:34 PM CEST, Taruntej Kanakamalla via lists.openemb=
edded.org wrote:
> Adapted from an existing patch:
> https://patchwork.yoctoproject.org/project/oe-core/patch/20220606132653.6=
0232-5-brgl@bgdev.pl
>
> Update the recipe to track the latest upstream release of the official
> GStreamer Rust plugins.
>
> Extend do_configure to handle the virtual manifest, as this is a
> Cargo workspace project.
>
> Unlike the other GStreamer submodules, the Rust plugins follow a
> separate release cycle and versioning scheme. These plugins are fully
> stable and required for a fully-featured GStreamer installation, as most
> new features and plugins are being written in Rust. They are also shipped
> by multiple Linux distributions such as Fedora.
>
> Based on patch by: Bartosz Golaszewski <brgl@bgdev.pl>
>
> Signed-off-by: Taruntej Kanakamalla <tarun@centricular.com>

Hi Taruntej,

Thanks for your patch.

> +# need dav1d recipe meta-openembedded/meta-multimedia
> +PACKAGECONFIG[dav1d] =3D "-p gst-plugin-dav1d,,dav1d, dav1d"
> +
> +# Default members
> +PACKAGECONFIG ??=3D " \
...
> +    dav1d \

Having a PACKAGECONFIG depending on meta-openembedded is probably ok,
but we can't have this in default PACKAGECONFIG values: oe-core has to
be buildable stand-alone.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


