Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4144CCA483
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 20:55:51 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.14365.1657659342532647771
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jul 2022 13:55:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=emIJVMBn;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3AE301BF205;
	Tue, 12 Jul 2022 20:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1657659340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZJiwIp99flQgiUms3wunqefTNcg6jIkN6ibpxklAlrc=;
	b=emIJVMBnNKz+QsC0VtHcKLOvOm/Numyh4M6U/ee6X8ZT18pdoui9SgUPbZqdpqJc/6hYXH
	5zck/A2aMM8jFGicBprDlSpd683qPKwGWBS3A9yXbZS9oXmN2RrtZF4wJFbkT76yvLHes8
	jHE23vj2bjZyqySOnFt6jo0IJVq6taNTzL+jKAxWf23Jer52+vkEGPWLZAqox1ic4tmUx+
	G235YaNJpL+X7EdBtNvJlIc6x2Ta5g4GtsCRq5FMbyBEDzXsCv+QBMZO9mBo9BnltXeFtU
	VuGuqbNE36yA36wtBgi1mGiTVo0mIccrJTgpkQ0BqvfUKC6kCCK5/Symf/RbRw==
Date: Tue, 12 Jul 2022 22:55:40 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Luis Enriquez <lenriquez389@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	LUIS ENRIQUEZ <luis.enriquez@se.com>
Subject: Re: [OE-core] [PATCH] kernel-fitimage.bbclass: add padding algorithm
 property in config nodes
Message-ID: <Ys3fzJhhHqBmVODK@mail.local>
References: <20220712075908.522994-1-luis.enriquez@se.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220712075908.522994-1-luis.enriquez@se.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Jul 2022 20:55:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167942

Hello Luis,

On 12/07/2022 09:59:08+0200, Luis Enriquez wrote:
> This allows choosing padding algorithm when building fitImage. It may be pkcs-1.5 or pss.
> 
> Signed-off-by: LUIS ENRIQUEZ <luis.enriquez@se.com>

This has to match the From: header. The solution is the either send that
from your se.com address or add an in-body From:

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
>  				${sign_line}
>                          };
>  EOF
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167909): https://lists.openembedded.org/g/openembedded-core/message/167909
> Mute This Topic: https://lists.openembedded.org/mt/92328664/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

