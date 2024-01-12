Return-Path: <andrej.v@skyrain.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00F75C4707C
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 06:38:52 +0000 (UTC)
Received: from h4.cmg2.smtp.forpsi.com (h4.cmg2.smtp.forpsi.com [185.129.138.189])
 by mx.groups.io with SMTP id smtpd.web11.2019.1705041525755430030
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jan 2024 22:38:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skyrain.eu header.s=f2022 header.b=HRfWdP6a;
 spf=none, err=permanent DNS error (domain: skyrain.eu, ip: 185.129.138.189, mailfrom: andrej.v@skyrain.eu)
Received: from [192.168.1.89] ([62.197.243.174])
	by cmgsmtp with ESMTPSA
	id OBBirAdLaSqGROBBjrNrhD; Fri, 12 Jan 2024 07:38:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skyrain.eu; s=f2022;
	t=1705041523; bh=tqflE44jwf+Pd6zIdAtxqJ/euptmIRXer8kC2ANhZ+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=HRfWdP6aGImQMM0/IWb3GSpUyPheHIe0a+B0Al4FioYB4LKKtZfbi2+s+ZImggDWq
	 qFcSDN7utXGhVXQeWxtj/maUXrx5ACz4SNtcD1R+N7ZWmy5sVm8jKD6uZWXqIgSG/w
	 vHYuQK+fE6N9rJcOudU15h+uhZ+kfxSe61IwEZsDRTjbeN1eZJkrjIbMq50SSpN7cK
	 Nsc5eRcFiL2Qu3SoB/j0yFYQdRnfpzxQblMUbDov7Cuwx4pPbsFFJqe9SzAgfx5ffX
	 0vdocU9UYwD5qNYuM4UGrJjdLmn06Xl6lrChHXCnzHxJ9Y9ua5ScBV2zxl6C6/py4G
	 jqlAhSpbk/T9w==
Message-ID: <593205a9-e9d2-4744-92c0-dd5825b81736@skyrain.eu>
Date: Fri, 12 Jan 2024 07:38:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] glibc: Set status for CVE-2023-5156 &
 CVE-2023-0687
To: =?UTF-8?Q?Simone_Wei=C3=9F?= <simone.p.weiss@posteo.com>,
 openembedded-core@lists.openembedded.org
References: <20240111152056.613280-1-simone.p.weiss@posteo.com>
Content-Language: en-US
From: Andrej Valek <andrej.v@skyrain.eu>
In-Reply-To: <20240111152056.613280-1-simone.p.weiss@posteo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfLZYnTUMk5phIJXVs1QYSwuiEDivkLv8kxt1NRvafpfowjJFqYiaNT0j3I4OatpOf1z1vA73kedlb3EEZzssjZesrAhlmhR3xuxak/KnOcGyfc1/33jn
 e2fNU6/FLUP/nS6wUxxjzG+KQPOqJA7PpehQZsvsgOpDemcovYM64BRUum9Wjc1gph4UYXc0AQl+f3EAmG7HvHImfm0Ejg8nnnJG1dluqz/+sN/WH/dRN7Ql
 m+X1uWloajiiLt43T3juIw==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jan 2024 06:38:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193572

Hi Simone,

I would like make a small improvements here ;).
Once you're touching this file, make it little bit more optimized. 
Something like this:

CVE_STATUS_GROUPS += "CVE_STATUS_GLIBC"
CVE_STATUS_GLIBC = "CVE-2023-4527 CVE-2023-4911 CVE-2023-4806"...
CVE_STATUS_GLIBC[status] = "fixed-version: Fixed in stable branch updates"

Then we don't have to set the same status multiple times separately.

Regards,
Andy


On 11.01.2024 16:20, Simone Weiß wrote:
> From: Simone Weiß <simone.p.weiss@posteo.com>
>
> Set `CVE_STATUS`for those CVEs, they have already been fixed with the latest
> pull for stable branch fixes done in rev
> e444d2bed0ea140a574414fcd5a689867e8ba312. Hence the issues are fixed
> already.
>
> Signed-off-by: Simone Weiß <simone.p.weiss@posteo.com>
> ---
>   meta/recipes-core/glibc/glibc-version.inc | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
> index ccf9d505c5..5f24a10826 100644
> --- a/meta/recipes-core/glibc/glibc-version.inc
> +++ b/meta/recipes-core/glibc/glibc-version.inc
> @@ -10,4 +10,6 @@ UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.\d+(\.(?!90)\d+)*)"
>   CVE_STATUS[CVE-2023-4527] = "fixed-version: Fixed in stable branch updates"
>   CVE_STATUS[CVE-2023-4911] = "fixed-version: Fixed in stable branch updates"
>   CVE_STATUS[CVE-2023-4806] = "fixed-version: Fixed in stable branch updates"
> +CVE_STATUS[CVE-2023-5156] = "fixed-version: Fixed in stable branch updates"
>   CVE_STATUS[CVE-2023-4527] = "fixed-version: Fixed in stable branch updates"
> +CVE_STATUS[CVE-2023-0687] = "fixed-version: Fixed in stable branch updates"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193547): https://lists.openembedded.org/g/openembedded-core/message/193547
> Mute This Topic: https://lists.openembedded.org/mt/103663782/3619876
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [andrej.v@skyrain.eu]
> -=-=-=-=-=-=-=-=-=-=-=-
>


