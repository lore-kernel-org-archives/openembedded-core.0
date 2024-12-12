Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 746D5E7717F
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 12:02:50 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.18097.1734004965963441600
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Dec 2024 04:02:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=QFWXIoxv;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EEC631C0008;
	Thu, 12 Dec 2024 12:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734004964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lSxzE+uHDKozTmgmbA5dWOUg7PC8EiSSAeG0uJaSy1k=;
	b=QFWXIoxvU3ZY3UdQ0dkXS/ugq8BzH5Ph9kXO/u6IFxDU8010o/L3m+B7FEvDNDkfwLbpaQ
	jo5GATMz86WOOHAA2+SPi7KtwDKsdx2DZyE7QiAPB3JxmRp1umk/epbeBbQ+b35VC4L5CT
	sdtXrYNv8cZGoe29PLxJUAw52wsR3DrQfxowx2H06g0AkbmNyY03kMbxzzoWLbN/hsRYp8
	tTv5+Yi6o9lHm3bWLkQ0k/1C4Ls5hgCCTFVU7aAo9s2heuMfetYPkyPeHB5BVeoslhk7zG
	j0ruLT+Blm23hASw8TNi0dNZwVQFsULlgl/Q6znjoXtpMzmCwQ0BBxY/WAijLQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Dec 2024 13:02:43 +0100
Message-Id: <D69PGJARUJH8.3UUOEOPCGKA23@bootlin.com>
Subject: Re: [OE-core] [PATCH 5/5] systemd: split networkd into its own
 package
Cc: "Adrian Freihofer" <adrian.freihofer@siemens.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <adrian.freihofer@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241211215859.2187259-1-adrian.freihofer@gmail.com>
 <20241211215859.2187259-6-adrian.freihofer@gmail.com>
In-Reply-To: <20241211215859.2187259-6-adrian.freihofer@gmail.com>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 12:02:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208631

On Wed Dec 11, 2024 at 10:58 PM CET, Adrian Freihofer via lists.openembedde=
d.org wrote:
> From: Adrian Freihofer <adrian.freihofer@siemens.com>
>
> Support of images with different network management implementations
> without having to recompile systemd and other components.
>
> Fedora does this as well since systemd version 246.6-2:
> https://src.fedoraproject.org/rpms/systemd/blob/rawhide/f/systemd.spec#_5=
78
> This proves that it is technically possible and officially supported by
> systemd.
>
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---

Hi Adrian,

I believe this patch or another one from this series is responsible of
some warnings we can see on the autobuilder:

stdio: WARNING: core-image-full-cmdline-1.0-r0 do_rootfs: User systemd-netw=
ork has never been defined
stdio: WARNING: core-image-sato-1.0-r0 do_rootfs: User systemd-network has =
never been defined
stdio: WARNING: core-image-sato-sdk-1.0-r0 do_rootfs: User systemd-network =
has never been defined

https://valkyrie.yoctoproject.org/#/builders/10/builds/638/steps/11/logs/wa=
rnings
https://valkyrie.yoctoproject.org/#/builders/64/builds/559/steps/12/logs/wa=
rnings
https://valkyrie.yoctoproject.org/#/builders/13/builds/561/steps/12/logs/wa=
rnings

Can you look at this issue please ?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


