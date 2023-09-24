Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C810FCE7A88
	for <webhook@archiver.kernel.org>; Sun, 24 Sep 2023 03:29:17 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.34478.1695526156139096818
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Sep 2023 20:29:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Ud4RWKMk;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 38O3TBTR014867;
	Sat, 23 Sep 2023 22:29:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1695526151;
	bh=XvYeVHBofFekasriQehGwaU6O8eoeMCFrkRx7dMNaU8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Ud4RWKMkFL2WcGGtIHOUduqolAuMINWqWB3bbKchY3u6OWqYocFXpcf7paDGwyRyk
	 //ksG4wJjzuUhLDOLEiPx/IaAXtLJHXvCtzjFNSoAWNCZhIDyR90Lb9efW7NKUYC/2
	 OPDnCRS/mi3ApfM2hpMYiRxIo9BAe98Io7WqGsX4=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 38O3TBPr112363
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 23 Sep 2023 22:29:11 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 23
 Sep 2023 22:29:10 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 23 Sep 2023 22:29:11 -0500
Received: from [10.249.36.233] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 38O3Swbc107552;
	Sat, 23 Sep 2023 22:29:10 -0500
Message-ID: <665df71a-fa35-4df6-92ca-d8591af6cdf0@ti.com>
Date: Sat, 23 Sep 2023 22:29:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/2] spdx: use TOOLCHAIN_OUTPUTNAME for SDK
 filename prefix
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>,
        <openembedded-core@lists.openembedded.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <20230922222043.36032-1-denis@denix.org>
 <20230922222043.36032-2-denis@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230922222043.36032-2-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Sep 2023 03:29:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188156



On 9/22/2023 5:20 PM, Denys Dmytriyenko wrote:
> Replace SDK_NAME with TOOLCHAIN_OUTPUTNAME when naming SDK host and
> target SPDX archives.
> 
> In most cases TOOLCHAIN_OUTPUTNAME is almost identical to SDK_NAME,
> but sometimes custom meta-toolchain recipes have some variations and
> populate_sdk_base.bbclass already uses TOOLCHAIN_OUTPUTNAME to name
> corresponding host and target manifests:
> 
> SDK_HOST_MANIFEST = "${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.host.manifest"
> SDK_TARGET_MANIFEST = "${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.target.manifest"
> 
> To match the naming convention, also use TOOLCHAIN_OUTPUTNAME here
> for naming SPDX archives as well, resulting in:
> 
> ${TOOLCHAIN_OUTPUTNAME}-host.spdx.tar.zst
> ${TOOLCHAIN_OUTPUTNAME}-target.spdx.tar.zst
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> Signed-off-by: Denys Dmytriyenko <denis@denix.org>

Tested-by: Ryan Eatmon <reatmon@ti.com>

> ---
>   meta/classes/create-spdx-2.2.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
> index a2b96da61a..885f07a1f8 100644
> --- a/meta/classes/create-spdx-2.2.bbclass
> +++ b/meta/classes/create-spdx-2.2.bbclass
> @@ -986,7 +986,7 @@ def sdk_combine_spdx(d, sdk_type):
>       from pathlib import Path
>       from oe.sdk import sdk_list_installed_packages
>   
> -    sdk_name = d.getVar("SDK_NAME") + "-" + sdk_type
> +    sdk_name = d.getVar("TOOLCHAIN_OUTPUTNAME") + "-" + sdk_type
>       sdk_deploydir = Path(d.getVar("SDKDEPLOYDIR"))
>       sdk_spdxid = oe.sbom.get_sdk_spdxid(sdk_name)
>       sdk_packages = sdk_list_installed_packages(d, sdk_type == "target")
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188139): https://lists.openembedded.org/g/openembedded-core/message/188139
> Mute This Topic: https://lists.openembedded.org/mt/101531120/6551054
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

