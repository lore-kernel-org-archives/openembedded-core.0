Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A306CC44501
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 13:51:04 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6385.1784123457028619498
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 06:50:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=1RfSvKgx;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 5B70EC2B9D0
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 13:51:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6AFF16035C;
	Wed, 15 Jul 2026 13:50:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E9CE811BD3A7E;
	Wed, 15 Jul 2026 15:50:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784123453; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uv607vCjNPuiXsCWYqZeYVTazaZj6MscQNCVTe070VY=;
	b=1RfSvKgx3cFn8vMMQ1IXc83gLlQyD7NrXPhse1hYJiOFIS5ZroK++3GE7cIFR0r/fmAOTM
	rXSjfLyQMqF4kPNXNRrbzUYLyInOHLVjMIjEd+o1yknasCW9ht+WOB5eSnapjkCuWM1X2w
	0Yfct/BlF8DscnuzR5G0fOMPtpQ0gmM5dLacDPSoc/tcJYGKpJGimcfF/YfWnLkkBZIANy
	QOwMloZIBj/wxDw8cxcQJ0bT8kvbSbZzJbiT3F+QewEKS4GEH1mnuh8QWIJ+wwVS2raYzg
	NlSiHiaP741oslBAcHYu6Mi/D8fI3xgv0VEZneWoM8fgL9cFHwzyuahzgvItHg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Jul 2026 15:50:52 +0200
Message-Id: <DJZ6ZB5JTYSV.ZUCFUNHW05GN@bootlin.com>
Subject: Re: [OE-core] [PATCH v5 2/2] gstreamer1.0-plugins-rs: add new
 package
Cc: <sebastian@centricular.com>, <nirbheek@centricular.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <tarun@centricular.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260707081701.1525114-1-tarun@centricular.com>
 <20260714105541.2812170-1-tarun@centricular.com>
 <20260714105541.2812170-2-tarun@centricular.com>
 <DJZ45A2IL6XB.172T8CGXQUIPH@bootlin.com>
In-Reply-To: <DJZ45A2IL6XB.172T8CGXQUIPH@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 13:51:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240957

On Wed Jul 15, 2026 at 1:37 PM CEST, Mathieu Dubois-Briand wrote:
> On Tue Jul 14, 2026 at 12:55 PM CEST, Taruntej Kanakamalla via lists.open=
embedded.org wrote:
>> Adapted from an existing patch:
>> https://patchwork.yoctoproject.org/project/oe-core/patch/20220606132653.=
60232-5-brgl@bgdev.pl
>>
>> Update the recipe to track the latest upstream release of the official
>> GStreamer Rust plugins.
>>
>> Remove the `flavors` and `ffv1` plugins from local manifest file because
>> they depend on packages that are not published on crates.io and also the=
y
>> are not actively maintained in the gst-plugins-rs upstream anyway.
>>
>> Skip the recipe if building for x86 without SSE support.
>>
>> Unlike the other GStreamer submodules, the Rust plugins follow a
>> separate release cycle and versioning scheme. These plugins are fully
>> stable and required for a fully-featured GStreamer installation, as most
>> new features and plugins are being written in Rust. They are also shippe=
d
>> by multiple Linux distributions such as Fedora.
>>
>> Based on patch by: Bartosz Golaszewski <brgl@bgdev.pl>
>>
>> Signed-off-by: Taruntej Kanakamalla <tarun@centricular.com>
>> ---
>
> Hi Taruntej,
>
> Thanks for your patch.
>
>> +LICENSE =3D "MPL-2.0 | Apache-2.0"
>> +
>
> This should be "Apache-2.0 OR MPL-2.0". You should get a warning about
> it during the build:
>
> WARNING: /tmp/devtoolqa93fsj3gg/core-copy/meta/recipes-multimedia/gstream=
er/gstreamer1.0-plugins-rs_0.15.3.bb: gstreamer1.0-plugins-rs: LICENSE is u=
sing an old syntax and should be upgraded to: "Apache-2.0 OR MPL-2.0"
>
> Thanks,
> Mathieu

Sorry, this comes from Joshua series and is not merged so far. We will
probably handle the fix on our side.

No action needed on your side so far.

Thanks,
Mathieu


--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


