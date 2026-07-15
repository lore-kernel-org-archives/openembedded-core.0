Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44F2EC44507
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 11:37:43 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4197.1784115461219355317
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 04:37:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=cfegdAy3;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5A8831A0FFC;
	Wed, 15 Jul 2026 11:37:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 26A016035C;
	Wed, 15 Jul 2026 11:37:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8BC6811BD1F08;
	Wed, 15 Jul 2026 13:37:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784115458; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=V1aYBoQyxw01UW6IC6CL00Z5habqmLqV3ZU7pVJEZaA=;
	b=cfegdAy3NHjFQujLMxUWeUdF4wz218mnOP+hHU2+2ZdoAD6S/8MLO9xEnykxqm9DbrrYYA
	NFa3VQusV9jS0Z6roqstbXo+gtzRr42J5MejqY9cybS/NMvHT/zEPXNaLIONFdqVMjlNvc
	SXdtbUSj7Iv5PY9J8BV0HTdi/56/NWt6gckWoRKYW7MYs+9zpkv5PPhIZ+SJoj4d3RuLwB
	/R0oZHcGARMBl1dudU0NMDkWO86dy4giT7V3W86sP/GK6b4kSAGmP0vlS1vbz67SHis/XY
	ff2zCQs6YMLK2NgKrARS70zoq+pv52MhqF/BxEtEsvAdUB5/FEC2yR75M3J/ag==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Jul 2026 13:37:36 +0200
Message-Id: <DJZ45A2IL6XB.172T8CGXQUIPH@bootlin.com>
Cc: <sebastian@centricular.com>, <nirbheek@centricular.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <tarun@centricular.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v5 2/2] gstreamer1.0-plugins-rs: add new
 package
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260707081701.1525114-1-tarun@centricular.com>
 <20260714105541.2812170-1-tarun@centricular.com>
 <20260714105541.2812170-2-tarun@centricular.com>
In-Reply-To: <20260714105541.2812170-2-tarun@centricular.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 11:37:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240951

On Tue Jul 14, 2026 at 12:55 PM CEST, Taruntej Kanakamalla via lists.openem=
bedded.org wrote:
> Adapted from an existing patch:
> https://patchwork.yoctoproject.org/project/oe-core/patch/20220606132653.6=
0232-5-brgl@bgdev.pl
>
> Update the recipe to track the latest upstream release of the official
> GStreamer Rust plugins.
>
> Remove the `flavors` and `ffv1` plugins from local manifest file because
> they depend on packages that are not published on crates.io and also they
> are not actively maintained in the gst-plugins-rs upstream anyway.
>
> Skip the recipe if building for x86 without SSE support.
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
> ---

Hi Taruntej,

Thanks for your patch.

> +LICENSE =3D "MPL-2.0 | Apache-2.0"
> +

This should be "Apache-2.0 OR MPL-2.0". You should get a warning about
it during the build:

WARNING: /tmp/devtoolqa93fsj3gg/core-copy/meta/recipes-multimedia/gstreamer=
/gstreamer1.0-plugins-rs_0.15.3.bb: gstreamer1.0-plugins-rs: LICENSE is usi=
ng an old syntax and should be upgraded to: "Apache-2.0 OR MPL-2.0"

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


