Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6469BC197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 16:34:39 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.11248.1700152471499003784
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Nov 2023 08:34:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=RiqF8kqq;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0D2634000F;
	Thu, 16 Nov 2023 16:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1700152470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SrXZGwaJBIZ9yDjkZL2zXplKspd+B4XAPHKLNsjSMYM=;
	b=RiqF8kqqc/dzhQ21hvX7yjyr5zgeOpGO0B7qs/56KSSpem+fhF7i1pwf8hl0d+HiTOjYpF
	Qo+QBr2GRiWCt6pU37y3M0Vb/Ay+vEylvoFK+G99Pv3m3kwznqEElqK6q+TKtydvL2KcEu
	AOJeedDo4BOMklLjlevXbQtzOpQ/HcFOhhsNj7ua7N4xISoG9Gl98ZoNcrVf1imTLc6g42
	3RzblFmchJYrs6l5g4otoeZdOn0mu8WrZvPP+Mdvb+Kp2QfTUw7uuIFpWWQRYyqeWoZyqo
	aoJ72J6O4xrOU8lQ9rZciea/qZr8AJCwXBO6GEdPKwWEQb3v4gvxge23XaADdg==
Date: Thu, 16 Nov 2023 17:34:29 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Lukas Funke <lukas.funke-oss@weidmueller.com>
Cc: openembedded-core@lists.openembedded.org,
	Jose Quaresma <quaresma.jose@gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH v3] systemd: use nonarch libdir for
 tmpfiles.d
Message-ID: <20231116163429211c1a31@mail.local>
References: <1798186BACD6DC19.9929@lists.openembedded.org>
 <20231116125059.1483544-1-lukas.funke-oss@weidmueller.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231116125059.1483544-1-lukas.funke-oss@weidmueller.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Nov 2023 16:34:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190804

Please always resend the whole series so I don't have to cherrypick
patches from various threads. Also, is this really for meta-oe?

On 16/11/2023 13:50:59+0100, Lukas Funke wrote:
> From: Malte Schmidt <malte.schmidt@weidmueller.com>
> 
> The documentation of systemd states that /etc/tmpfiles.d should be
> reserved for the local administrator and packages should put their files
> in /usr/lib/tmpfiles.d [1].
> 
> [1] https://www.freedesktop.org/software/systemd/man/tmpfiles.d.html
> 
> Signed-off-by: Malte Schmidt <malte.schmidt@weidmueller.com>
> Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
> Signed-off-by: Lukas Funke <lukas.funke@weidmueller.com>
> ---
>  meta/recipes-core/systemd/systemd_254.4.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-core/systemd/systemd_254.4.bb b/meta/recipes-core/systemd/systemd_254.4.bb
> index cc0e29fdd2..6d71fbaba2 100644
> --- a/meta/recipes-core/systemd/systemd_254.4.bb
> +++ b/meta/recipes-core/systemd/systemd_254.4.bb
> @@ -282,12 +282,12 @@ do_install() {
>  	[ ! -e ${D}/${base_sbindir}/udevd ] && ln -s ${rootlibexecdir}/systemd/systemd-udevd ${D}/${base_sbindir}/udevd
>  
>  	install -d ${D}${sysconfdir}/udev/rules.d/
> -	install -d ${D}${sysconfdir}/tmpfiles.d
> +	install -d ${D}${nonarch_libdir}/tmpfiles.d
>  	for rule in $(find ${WORKDIR} -maxdepth 1 -type f -name "*.rules"); do
>  		install -m 0644 $rule ${D}${sysconfdir}/udev/rules.d/
>  	done
>  
> -	install -m 0644 ${WORKDIR}/00-create-volatile.conf ${D}${sysconfdir}/tmpfiles.d/
> +	install -m 0644 ${WORKDIR}/00-create-volatile.conf ${D}${nonarch_libdir}/tmpfiles.d/
>  
>  	if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
>  		install -d ${D}${sysconfdir}/init.d
> -- 
> 2.30.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#190793): https://lists.openembedded.org/g/openembedded-core/message/190793
> Mute This Topic: https://lists.openembedded.org/mt/102625692/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

