Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53B08C2BD09
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 06:51:54 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.45506.1719989505067332958
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jul 2024 23:51:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=EMHtjZk1;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E3C6DE0003;
	Wed,  3 Jul 2024 06:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719989503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uJvo7wxcWNW0oX6iff3SxR/22gluOVmgwJ+TWAPy1fM=;
	b=EMHtjZk1ciVVOv5OOGwjPh7OYbi3NjRnOXQKhE0XuHLV8rNVDVZ3976HEo7QgNU6m4wbGw
	dDEcdJsmtwvqtcTWQLH0TNLgR73h07Ye5KoPjYRgCWaRxGMLQValZMpDVuEHMA+9fYoMhD
	tJdUKBw904AkOsCrmf7I+SZJTrgO92MHbq86/a6TSks/jX3ifUFxG6ZxvwwMe0WQfhJOPo
	qGvL8CFYsGpNCbpooIe6y/9WYK6JY6F6WgmaCm4vnX7ngJLKBew2pg3LRgGKox0fpPhE5c
	KxL7GktXA9MUdiOFVQb0KCxHehfOi5mqJ92C32oiyCr42UzWaYq6MMvpH2cvwA==
Date: Wed, 3 Jul 2024 08:51:42 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Florian Amstutz <florian.amstutz@scs.ch>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] u-boot: Fix potential index error issues in
 do_deploy with multiple u-boot configurations
Message-ID: <202407030651422a838c60@mail.local>
References: <ykBT.1719908195834561903.8Nny@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ykBT.1719908195834561903.8Nny@lists.openembedded.org>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 06:51:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201453

Hello,

On 02/07/2024 01:16:35-0700, Florian Amstutz wrote:
> If i or j have not been unset in do_deploy:prepend functions, images are not correctly
> copied to DEPLOYDIR.
> 
> Signed-off-by: Florian Amstutz <florian.amstutz@scs.ch>
> ---
> meta/recipes-bsp/u-boot/u-boot.inc | 1 +
> 1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
> index 54ea2e9e50..70fb192d6e 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -209,6 +209,7 @@ RDEPENDS:${PN} += "${PN}-env"
> do_deploy () {

Whitespaces are missing in your patch, so it doesn't apply (this line
should begin with a space).

> if [ -n "${UBOOT_CONFIG}" ]
> then
> + � � � �unset i j


I feel this should be fixed in your do_deploy:prepend or we are going to
end up with thousands of patches unsetting variables that are not set
just in case a :prepend sets them.

> for config in ${UBOOT_MACHINE}; do
> i=$(expr $i + 1);
> for type in ${UBOOT_CONFIG}; do
> --
> 2.34.1

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#201415): https://lists.openembedded.org/g/openembedded-core/message/201415
> Mute This Topic: https://lists.openembedded.org/mt/106996344/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

