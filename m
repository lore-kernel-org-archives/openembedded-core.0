Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 542BCC433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 08:11:44 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web09.4188.1657872701054888839
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 01:11:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ZnweJJHF;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9209E1BF20B;
	Fri, 15 Jul 2022 08:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1657872699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YhubpLzE8rpvVPKvUD1ko1XmLw97SFe5u6OlfqPkU5o=;
	b=ZnweJJHFuS3qI38iDKHVRepn5dGgr1PDkpZqnIMoFkJN7l8X6YljSXeNzWxVLOhCDzbmEn
	6UiU+Nrlx5jeC8z/mzhIZyf0HEfjnw5yoj62t3ReTdMKDjD5EtdQCzOqRiOD7Xz/GEOUEv
	tU9SukE0k3DMASnRAWympKr/OFysjjwuuqIXK6phbIjU6ixOBBMC6Dgy4pGFD+Clk4qeQ2
	Aaj4RVEXk8nyRSqclAb84sXk+yx+Mpb3U1Jy2VlIrlLpmhsfBXkUkJhZlkWhXTeN2VXuKZ
	m+Ma94NREP1TdunSXLBo4BnHVORM6fqvwvPrvbiUVzTnJG+FM4NnwvbFZzMvfg==
Date: Fri, 15 Jul 2022 10:11:38 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Luis Enriquez <lenriquez389@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	LUIS ENRIQUEZ <luis.enriquez@se.com>
Subject: Re: [OE-core] [PATCH] kernel-fitimage.bbclass: add padding algorithm
 property in config nodes
Message-ID: <YtEhOvYwdL+6CjY7@mail.local>
References: <20220713082802.581567-1-luis.enriquez@se.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220713082802.581567-1-luis.enriquez@se.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 08:11:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168054

Hello,

On 13/07/2022 10:28:03+0200, Luis Enriquez wrote:
> This allows choosing padding algorithm when building fitImage. It may be pkcs-1.5 or pss.
> 
> Signed-off-by: LUIS ENRIQUEZ <luis.enriquez@se.com>
> From: LUIS ENRIQUEZ <lenriquez389@gmail.com>
> ---
>  meta/classes/kernel-fitimage.bbclass | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
> index 5f5e9dd444..7c0d93625b 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -56,6 +56,9 @@ FIT_HASH_ALG ?= "sha256"
>  # fitImage Signature Algo
>  FIT_SIGN_ALG ?= "rsa2048"
>  
> +# fitImage Padding Algo
> +FIT_PAD_ALG ?= "pkcs-1.5"
> +
>  #
>  # Emit the fitImage ITS header
>  #
> @@ -250,6 +253,7 @@ fitimage_emit_section_config() {
>  
>  	conf_csum="${FIT_HASH_ALG}"
>  	conf_sign_algo="${FIT_SIGN_ALG}"
> +	conf_padding_algo="${FIT_PAD_ALG}"
>  	if [ "${UBOOT_SIGN_ENABLE}" = "1" ] ; then
>  		conf_sign_keyname="${UBOOT_SIGN_KEYNAME}"
>  	fi
> @@ -333,6 +337,7 @@ EOF
>                          signature-1 {
>                                  algo = "${conf_csum},${conf_sign_algo}";
>                                  key-name-hint = "${conf_sign_keyname}";
> +                                padding = "${conf_padding_algo}";

This doesn't apply on master, because of 2b5f5e295e9a ("featimage:
refactor style"). Can you rebase? Also, did you make sure you pass the
oe-selftest?

>  				${sign_line}
>                          };
>  EOF
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167953): https://lists.openembedded.org/g/openembedded-core/message/167953
> Mute This Topic: https://lists.openembedded.org/mt/92328664/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

