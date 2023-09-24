Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2175CE7A8A
	for <webhook@archiver.kernel.org>; Sun, 24 Sep 2023 03:29:07 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.34471.1695526143604270141
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Sep 2023 20:29:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=cjchin9Y;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 38O3SwYB077352;
	Sat, 23 Sep 2023 22:28:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1695526138;
	bh=Uek6HRZrxj8u48UH+oEQmXfPGB8+koET+RPOjDjyuhE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=cjchin9Yzs79h/aTVIIn7QCVd1VzHWfQBhLyH617WA3dkVN9X/9615mfo6Z7NCWY/
	 lqlIFoCXNlYKMNX5o2qTka/+2+jOuTfujFv/3OCR9bJUlgwe4F7mwWAJuWjg1AAgKY
	 U6tiVlZDqG7tYeMvsrvFSSw/lu+4EecGlKVLjkLA=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 38O3Swen019097
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 23 Sep 2023 22:28:58 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 23
 Sep 2023 22:28:58 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 23 Sep 2023 22:28:58 -0500
Received: from [10.249.36.233] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 38O3Swbb107552;
	Sat, 23 Sep 2023 22:28:58 -0500
Message-ID: <2733dbd7-8db3-40d9-9824-e3c40624060a@ti.com>
Date: Sat, 23 Sep 2023 22:28:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/2] bitbake.conf: add MACHINE to SDK_NAME
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>,
        <openembedded-core@lists.openembedded.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <20230922222043.36032-1-denis@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230922222043.36032-1-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Sep 2023 03:29:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188155



On 9/22/2023 5:20 PM, Denys Dmytriyenko wrote:
> Do the same here as Poky has done 5 years ago, adding MACHINE to
> SDK_NAME:
> 
> https://git.yoctoproject.org/meta-yocto/commit/?id=3614dd4aee9d19f1024edb6a36b2862c2d726c04
> 
> This avoids file conflicts in deploy/sdk/ when building multiple
> machines (either manually or via multiconfig), where sdk/toolchain
> installers, manifests and now SPDX archives will overlap otherwise.
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> Signed-off-by: Denys Dmytriyenko <denis@denix.org>

Tested-by: Ryan Eatmon <reatmon@ti.com>

> ---
>   meta/conf/bitbake.conf | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 67577c8fe7..3fd089cebb 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -459,7 +459,7 @@ PKGDATA_DIR_SDK = "${TMPDIR}/pkgdata/${SDK_SYS}"
>   ##################################################################
>   
>   SDK_NAME_PREFIX ?= "oecore"
> -SDK_NAME = "${SDK_NAME_PREFIX}-${IMAGE_BASENAME}-${SDK_ARCH}-${TUNE_PKGARCH}"
> +SDK_NAME = "${SDK_NAME_PREFIX}-${IMAGE_BASENAME}-${SDK_ARCH}-${TUNE_PKGARCH}-${MACHINE}"
>   SDKPATH = "/usr/local/oe-sdk-hardcoded-buildpath"
>   SDKPATHNATIVE = "${SDKPATH}/sysroots/${SDK_SYS}"
>   # The path to default to installing the SDK to
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188138): https://lists.openembedded.org/g/openembedded-core/message/188138
> Mute This Topic: https://lists.openembedded.org/mt/101531119/6551054
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

