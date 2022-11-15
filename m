Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F26AC4332F
	for <webhook@archiver.kernel.org>; Tue, 15 Nov 2022 20:39:17 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web09.6528.1668544754758082162
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Nov 2022 12:39:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fqckDyFo;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 22E50100008;
	Tue, 15 Nov 2022 20:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668544753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WPmgevdTZ54PBokKEO0ESL+wXX+JE4nEFu0+lZgZ5nA=;
	b=fqckDyFo3RPyBibTxxCnNp2E5k/tT74y/FFbGOzHrrjXOB3ijxuFt9NT02JtiqXj23liXT
	AiqcA6eb/glIU/DyRfvxmi8DZ4GWvQ4uTYChhYWwNbQoXF+UwQvCi+SjjiYJPp3ko//7aC
	dpSxik6LlliYF5BEXFbL36h/x0zuUvSbiye/65rodiI2cI7ufC1Bzvp2+c8d4CkWyuThBK
	yIGUKb0pL/tB7Fh1Ajn3RtLrrd7iaqavwuQThe1ROQcYESJDN4P1qZ/rar58DEmmL5eHuM
	hgGSVEeDwZApUN1UYhhAwA/APZ8UD1SPv7EB/Q5Krx6iGcTulLHBvY+ZUlJaBA==
Date: Tue, 15 Nov 2022 21:39:12 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH] resolvconf: make it work
Message-ID: <Y3P48Cty8ArRrIkY@mail.local>
References: <20221115134531.34920-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221115134531.34920-1-Qi.Chen@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Nov 2022 20:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173356

Hello,

This fails sstatetests.SStateTests.test_sstate_allarch_samesigs:

https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/4409/steps/14/logs/stdio

-  'resolvconf/do_package_qa': 'a309bf7fd05364ea8b524a605246f7929768bca185713f913df0f3f1e5f1ce55',
-  'resolvconf/do_package_write_rpm': '1e136a6121876927c84587c8ec80794359ad998e09048c77e7d363ba756d41f0',
+  'resolvconf/do_package_qa': '7bc9828812907356dc4e1fe5df96af30e195a99e54745e2a5ea96d24974b0142',
+  'resolvconf/do_package_write_rpm': '7eeaacc3b706560a0bd9e889a661be05eef25250aff8c82891b7c70f09de7451',


On 15/11/2022 21:45:31+0800, Chen Qi wrote:
> The current resolvconf does not work. Make it work with the
> following changes.
> 1. Install normalize-resolvconf, which is used by resolvconf.
> 2. Add dependencies sed, coreutils, util-linux-flock.
>    util-linux-flock is needed by our busybox does not support '-w'
>    by default. coreutils is needed by the busybox's readlink does
>    not support '-m'. sed is needed because we want to avoid package
>    QA issue complaining sed is needed by no one provides it.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb
> index 94fd2c1a70..3bf5ec6c32 100644
> --- a/meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb
> +++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.91.bb
> @@ -9,7 +9,7 @@ LICENSE = "GPL-2.0-or-later"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
>  AUTHOR = "Thomas Hood"
>  HOMEPAGE = "http://packages.debian.org/resolvconf"
> -RDEPENDS:${PN} = "bash"
> +RDEPENDS:${PN} = "bash sed coreutils util-linux-flock"
>  
>  SRC_URI = "git://salsa.debian.org/debian/resolvconf.git;protocol=https;branch=unstable \
>             file://99_resolvconf \
> @@ -39,12 +39,14 @@ do_install () {
>  	fi
>  	install -d ${D}${base_libdir}/${BPN}
>  	install -d ${D}${sysconfdir}/${BPN}
> +	install -d ${D}${nonarch_base_libdir}/${BPN}
>  	ln -snf ${localstatedir}/run/${BPN} ${D}${sysconfdir}/${BPN}/run
>  	install -d ${D}${sysconfdir} ${D}${base_sbindir}
>  	install -d ${D}${mandir}/man8 ${D}${docdir}/${P}
>  	cp -pPR etc/resolvconf ${D}${sysconfdir}/
>  	chown -R root:root ${D}${sysconfdir}/
>  	install -m 0755 bin/resolvconf ${D}${base_sbindir}/
> +	install -m 0755 bin/normalize-resolvconf ${D}${nonarch_base_libdir}/${BPN}
>  	install -m 0755 bin/list-records ${D}${base_libdir}/${BPN}
>  	install -d ${D}/${sysconfdir}/network/if-up.d
>  	install -m 0755 debian/resolvconf.000resolvconf.if-up ${D}/${sysconfdir}/network/if-up.d/000resolvconf
> @@ -64,4 +66,4 @@ pkg_postinst:${PN} () {
>  	fi
>  }
>  
> -FILES:${PN} += "${base_libdir}/${BPN}"
> +FILES:${PN} += "${base_libdir}/${BPN} ${nonarch_base_libdir}/${BPN}"
> -- 
> 2.17.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173345): https://lists.openembedded.org/g/openembedded-core/message/173345
> Mute This Topic: https://lists.openembedded.org/mt/95042786/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

