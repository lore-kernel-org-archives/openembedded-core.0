Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEA0FCCA472
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 12:45:23 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.17844.1759841122813860002
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Oct 2025 05:45:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=M13wpsp2;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 597CjJoH3824729;
	Tue, 7 Oct 2025 07:45:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759841120;
	bh=jyxd7nVNcl//5VwRllZfF5S6PdH+xZB4D5ZRuJDztyY=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=M13wpsp2GdUv7PfOHZ68tPpnfNw/mdoBR2YcAyQaypE8mMoiENcauZJk9xy7XsSTE
	 GQkKpBGV8+qNkSI4Gd9LJbp8g3Tj0zdK08qlfQAwGqfv+gUzMp60oX4F8PS5RunRc6
	 IKvIUgqCL6MkeMGErLAJuPICs0rd9kL6OuSS3xyo=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 597CjJJ83595603
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 7 Oct 2025 07:45:19 -0500
Received: from lewvowa02.ent.ti.com (10.180.75.80) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 7
 Oct 2025 07:45:19 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvowa02.ent.ti.com
 (10.180.75.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.55; Tue, 7 Oct
 2025 07:45:19 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 7 Oct 2025 07:45:19 -0500
Received: from [128.247.81.40] (dtmz023nlv.dhcp.ti.com [128.247.81.40] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 597CjJO6893200;
	Tue, 7 Oct 2025 07:45:19 -0500
Message-ID: <d18e6c0f-d5d1-4a40-a5a2-d8c34198d639@ti.com>
Date: Tue, 7 Oct 2025 07:45:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] linux-firmware: Move all firmware into
 sub-packages
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        <openembedded-core@lists.openembedded.org>
References: <20251006170804.9664-1-reatmon@ti.com>
 <DDBWZY3PMFQU.1HP666LHFOD0H@bootlin.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <DDBWZY3PMFQU.1HP666LHFOD0H@bootlin.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 12:45:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224530



On 10/7/2025 2:34 AM, Mathieu Dubois-Briand wrote:
> On Mon Oct 6, 2025 at 7:08 PM CEST, Ryan Eatmon via lists.openembedded.org wrote:
>> A lot of the firmware has already been broken out into sub-packages, but
>> a good number were still lingering in the base linux-firmware package.
>>
>> This patch does two things:
>>
>> 1) Move all of the remaining firmware into sub-packages based on the
>> driver name in the WHENCE file or into existing sub-packages where a
>> file or two were missed.
>>
>> 2) Create a new REMOVE_UNLICENSED variable and do_install() logic to
>> allow for marking certain firmware files as something to remove and not
>> package up.  The intention is that in the WHENCE file, a number of
>> firmware files have no license information or very questionable
>> declarations as to what the license is for the firmware.
>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
> 
> Hi Ryan,
> 
> Thanks for your patch.
> 
> It looks like some files are not shipped correctly:
> 
> ERROR: linux-firmware-1_20250917-r0 do_package: QA Issue: linux-firmware: Files/directories were installed but not shipped in any package:
>    /lib/firmware/ess
>    /lib/firmware/ttusb-budget
>    /lib/firmware/emi62
>    /lib/firmware/myricom
>    /lib/firmware/sun
>    /lib/firmware/yamaha
>    /lib/firmware/korg
>    /lib/firmware/vicam
>    /lib/firmware/acenic
>    /lib/firmware/yam
>    /lib/firmware/qcom/sa8775p/LEMANS-EVK-tplg.bin
> Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
> 
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/2542
> 
> Can you fix it please?

That is odd.  I don't get that error on my builds.  All of those files 
should have been removed by the new REMOVE_UNLICENSED feature in the 
recipe.  I'll take a look.


> Thanks,
> Mathieu
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


