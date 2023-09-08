Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 142BFEE57F9
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 11:00:16 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.36204.1694170807766676843
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Sep 2023 04:00:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dr8n5CzC;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BC56260006;
	Fri,  8 Sep 2023 11:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1694170805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=edAPXRxJtcXyib3vFHXGIlM1BaRKlMKHHMnsnSpsz8c=;
	b=dr8n5CzCMyZ/8l4Q2CQB5hCQoberhoUeMCorKR8PNBciSjPJ1UtbDXEeNupkTtBQw8+qk8
	y7aks1G8hsEuJdX3ztPwUt+rBFdlUQ9VJNc8wwalw+MpFW+8tqm9suRXVDuTsBGlU5QfUL
	l2PaNkoDtnqqJ0vB9sz1w5d6HXbmOjs40i/JBAY0NmXIt5uk5A+ojmX7/Ut2gkHnpurxVk
	/0Sgwzz3BSicVk0Sq8ueMfcrUc/GhWS6svdl+dit0BeXrm6fyR9rxN66phuPMZE9CoS3Tg
	I0ELm6/GPXLPVLR6VKfq3RWfCXN5eFi1eTUftDmYLwXflyLEQKxgDIQ8XHPTDw==
Message-ID: <cfe36dd3-a32c-def5-a8be-9011d070ef28@bootlin.com>
Date: Fri, 8 Sep 2023 13:00:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] base: improve LICENSE_FLAGS_DETAILS output
Content-Language: en-US
To: ross.burton@arm.com
Cc: nd@arm.com, openembedded-core@lists.openembedded.org
References: <20230621142212.985096-1-ross.burton@arm.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
In-Reply-To: <20230621142212.985096-1-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Sep 2023 11:00:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187411

Hi Ross,

I'm currently writing the doc patch for LICENSE_FLAGS_DETAILS.
However, I don't find the current behavior optimal...

On 21.06.23 at 16:22, ross.burton@arm.com wrote:
> From: Ross Burton <ross.burton@arm.com>
> 
> Don't prefix the output of LICENSE_FLAGS_DETAILS with "For further
> details, see" so that recipes can put arbitrary text in their license
> details instead of being limited to a specific sentence structure.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>   meta/classes-global/base.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
> index 976a2ddee4b..cbda8d12f09 100644
> --- a/meta/classes-global/base.bbclass
> +++ b/meta/classes-global/base.bbclass
> @@ -520,7 +520,7 @@ python () {
>                   message = "Has a restricted license '%s' which is not listed in your LICENSE_FLAGS_ACCEPTED." % unmatched
>                   details = d.getVarFlag("LICENSE_FLAGS_DETAILS", unmatched)
>                   if details:
> -                    message += " For further details, see %s." % details
> +                    message += details

What about
message += ' ' + details
instead?

Otherwise, you have to add a leading space to LICENSE_FLAGS_DETAILS.
What do you think?

Happy to send a patch if that helps...

Cheers
Michael.

