Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65668C433EF
	for <webhook@archiver.kernel.org>; Mon, 20 Jun 2022 09:20:36 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.17846.1655716831739407992
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jun 2022 02:20:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=YUMOzAY7;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 0281C1C0006;
	Mon, 20 Jun 2022 09:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1655716829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vK6cqZlwGVlT9ni5eOwnCM1zudIKOS0GtuyFXFNlMY4=;
	b=YUMOzAY7WPKoV1SGGwS9/+Vl8HsM1lXMEicNkNIumHWRAU8CNdee4ZCWHnHGB18mCbwzou
	5bigdZGHgNWELvH5xrh2riUg+S8mdfrVP9U7f+bBzLnBhGORLGQ60J9mcKhSxplBKEtZU0
	C6+0pMHnYKi1K0hTPSiu7sZ5UhG2b5eaPN3D1cmtexmXkTv+vcFP0Ef+Bw686bnTatruwT
	9IPItWUwLoF8vQ3B9OzGS8av6CIwXn8QpUUlNWWbrFx4/M1piYFzyVkzZkOwa4sHu4LjCc
	ibcGMc5Isg7ol9GZo+1w6bIjuoGorlX6nxEMBTOV/LN9CfnEPvUUho6sDPjD7A==
Date: Mon, 20 Jun 2022 11:20:27 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Qorin Wu" <qorin.wu@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Qorin
 <qorin.qorinna@nl.abb.com>
Subject: Re: [OE-core] [PATCH] add missing normalize-resolvconf file since
 it has been moved to a separate file since version 1.90
Message-ID: <20220620112027.4ed71759@booty>
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
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jun 2022 09:20:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167089

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

Can you pelase explain how adding the 'sed' RDEPENDS is related to
the normalize-resolvconf change?

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

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

