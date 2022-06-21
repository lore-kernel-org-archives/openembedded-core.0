Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25AF7CCA473
	for <webhook@archiver.kernel.org>; Tue, 21 Jun 2022 08:11:53 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web12.40830.1655799108173610930
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jun 2022 01:11:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=GNj5SKfE;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2973C6000F;
	Tue, 21 Jun 2022 08:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1655799106;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1p1imTofvVRtIlib8eTh7RIGhuFD1sNRDryu7Dml+8Q=;
	b=GNj5SKfETguYuEEVF5D97dCYksBnnWLkwJ1VlLLzmdGl1gHHozSMLre27h+12g2OKzBXel
	5aptFZIeElMf4bUuF0T6gngbgzuO8bvrBrx8MLBYYW3rKdW1VGCkccIQyGwWExBcFX6osF
	sSzA3TmTXG74lsqACBqDoPxynl1dKPTpyDEAsx6ShZv+AWuid2aYcO2fAylaVEAH9K/cGQ
	31R2wO62vK3yXDNkJxsW1iBfzosNHQ3JmNHmurgx1nT3klcqoQeYlj3KJZY5q5RXl2Tc5V
	8O+1KJ7WhV//lXxMw0BqR6ZkdawbmfBf5KX1L/QNWwIIb4bWDisLWKaESznVmQ==
Date: Tue, 21 Jun 2022 10:11:43 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Qorin Wu" <qorin.wu@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Qorin
 <qorin.qorinna@nl.abb.com>
Subject: Re: [OE-core] [PATCH] add missing normalize-resolvconf file since
 it has been moved to a separate file since version 1.90
Message-ID: <20220621101143.3d6da7ef@booty>
In-Reply-To: <20220620080820.10211-1-qorin.wu@gmail.com>
References: <20220620080820.10211-1-qorin.wu@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jun 2022 08:11:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167134

Hi Qorin,

On Mon, 20 Jun 2022 10:08:20 +0200
"Qorin Wu" <qorin.wu@gmail.com> wrote:

> From: Qorin <qorin.qorinna@nl.abb.com>
> 
> ---
>  meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb
> index 94fd2c1a70..d2d9973852 100644
> --- a/meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb
> +++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb
> @@ -9,7 +9,7 @@ LICENSE = "GPL-2.0-or-later"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
>  AUTHOR = "Thomas Hood"
>  HOMEPAGE = "http://packages.debian.org/resolvconf"
> -RDEPENDS:${PN} = "bash"
> +RDEPENDS:${PN} = "bash sed"
>  
>  SRC_URI = "git://salsa.debian.org/debian/resolvconf.git;protocol=https;branch=unstable \
>             file://99_resolvconf \
> @@ -46,6 +46,7 @@ do_install () {
>  	chown -R root:root ${D}${sysconfdir}/
>  	install -m 0755 bin/resolvconf ${D}${base_sbindir}/
>  	install -m 0755 bin/list-records ${D}${base_libdir}/${BPN}
> +	install -m 0755 bin/normalize-resolvconf ${D}${base_libdir}/${BPN}
>  	install -d ${D}/${sysconfdir}/network/if-up.d
>  	install -m 0755 debian/resolvconf.000resolvconf.if-up ${D}/${sysconfdir}/network/if-up.d/000resolvconf
>  	install -d ${D}/${sysconfdir}/network/if-down.d

When running this patch in the autobuilders, there are failures related
to resolvconf:

  ERROR: When reparsing /tmp/selftest-fetchpkz67tpd/test.bb:do_checkuri,
 the basehash value changed from 84b9e23a83a764e7a5d8a96ee523199e2b1c604f4280a45030e248de0ff52962 to 4123da244f465feffecb2b4fd2b132b64851981ec2fb70bf9445df8b0ea6a69e. The metadata is not deterministic and this needs to be fixed.

I must say there is no clear reason for me for this error given the
simple patch you sent. Other here can be more helpful. I'm waiting
for this to be understood before taking updated version of your patch.

Here are some logs showing the error:

https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/3671/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/3687/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/3731/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/3723/steps/15/logs/stdio


-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

