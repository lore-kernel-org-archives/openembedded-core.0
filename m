Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1924BC4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 14:53:05 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.37249.1702047178107391849
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 06:52:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kBQJBb83;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8E70AFF80E;
	Fri,  8 Dec 2023 14:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702047175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WM8/IPoE/KERATlIOWC0qOgGcScOzyn79coOoW4EO/M=;
	b=kBQJBb83t6qd/+B3MnLgIXwkA6zdFe9htaeUZ5HEReStQVmq/RwtjxXkCJ941VoT9D7R+m
	NrTXRulJLk4Kg9OpLiq1jkAyJw8mUvcXLgY9Jh2/crTk2DhixvBz/iGlsA15SJYvIpncRl
	YPRXa2Zm4xT9Ey/XaAC3Nw9TBtymiZWT66aLF2/GTnckF2EQNZQr53Y4VqRNkt4WTtFvfX
	V3UCvZjbtfpDbwpYpfB06kaow0Uce6XeNI/61uIAWxUUjbbidtTogobWi2KuoCKovdYFNF
	Z2arAxlaUDLliEXn4zK8zRtlS5U0Y/NtbunVGnBbCvBc3iPC2527Y+LDkR7xdg==
Date: Fri, 8 Dec 2023 15:52:55 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: dnagodra@cisco.com
Cc: openembedded-core@lists.openembedded.org, xe-linux-external@cisco.com
Subject: Re: [OE-core] [master] [PATCH] cve-update-nvd2-native: faster
 requests with API keys
Message-ID: <202312081452558ae892cc@mail.local>
References: <20231208025321.418459-1-dnagodra@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231208025321.418459-1-dnagodra@cisco.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 14:53:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192075

Please follow https://docs.yoctoproject.org/dev/contributor-guide/submit-changes.html#fixing-your-from-identity

On 07/12/2023 18:53:22-0800, Dhairya Nagodra via lists.openembedded.org wrote:
> As per NVD, the public rate limit is 5 requests in 30s (6s delay).
> Using an API key increases the limit to 50 requests in 30s (0.6s delay).
> However, NVD still recommends sleeping for several seconds so that the
> other legitimate requests are serviced without denial or interruption.
> Keeping the default sleep at 6 seconds and 2 seconds with an API key.
> 
> For failures, the wait time is unchanged (6 seconds).
> 
> Reference: https://nvd.nist.gov/developers/start-here#RateLimits
> 
> Signed-off-by: Dhairya Nagodra <dnagodra@cisco.com>
> ---
>  meta/recipes-core/meta/cve-update-nvd2-native.bb | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
> index 9ab8dc6050..941fca34c6 100644
> --- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
> +++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
> @@ -188,6 +188,11 @@ def update_db_file(db_tmp_file, d, database_time):
>          api_key = d.getVar("NVDCVE_API_KEY") or None
>          attempts = int(d.getVar("CVE_DB_UPDATE_ATTEMPTS"))
>  
> +        # Recommended by NVD
> +        wait_time = 6
> +        if api_key:
> +            wait_time = 2
> +
>          while True:
>              req_args['startIndex'] = index
>              raw_data = nvd_request_next(url, attempts, api_key, req_args)
> @@ -210,7 +215,7 @@ def update_db_file(db_tmp_file, d, database_time):
>                 break
>  
>              # Recommended by NVD
> -            time.sleep(6)
> +            time.sleep(wait_time)
>  
>          # Update success, set the date to cve_check file.
>          cve_f.write('CVE database update : %s\n\n' % datetime.date.today())
> -- 
> 2.35.6
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#192008): https://lists.openembedded.org/g/openembedded-core/message/192008
> Mute This Topic: https://lists.openembedded.org/mt/103048465/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

