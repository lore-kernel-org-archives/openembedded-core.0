Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5DB8C77B73
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 19:02:24 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.475.1684782142919401518
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 May 2023 12:02:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=fd6Y+VWS;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34MJ29LX035287;
	Mon, 22 May 2023 14:02:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684782129;
	bh=qMe+p+BME7Hky1PbQQosF4XywhKZmV0re9FMoiCTT98=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=fd6Y+VWSN/9g3a+eKQ7E9lL6rjHFbg/4AbypGpAYSaKEud77RcqznlVpMmIItpU39
	 UD/KNo58Jy33hTVhz8c+RxQwZofl2417F7tCzuz+UMYMVcIJC21ftlQ2lGxok1ldk0
	 uZ8i6g9liw1OaVsoOS2eGtPXfR1O60jZTDusYQ88=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34MJ29He127846
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 22 May 2023 14:02:09 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 22
 May 2023 14:02:08 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 22 May 2023 14:02:08 -0500
Received: from [128.247.81.144] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34MJ28MZ040422;
	Mon, 22 May 2023 14:02:08 -0500
Message-ID: <8f98cda9-e223-941c-24d7-49e1dee9ba2a@ti.com>
Date: Mon, 22 May 2023 14:02:08 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [EXTERNAL] Re: [OE-core][PATCHv2 2/2] kernel-devicetree:
 recursively search for dtbs
Content-Language: en-US, en-US-large
To: Richard Purdie <richard.purdie@linuxfoundation.org>, <afd@ti.com>,
        <reatmon@ti.com>, <denis@denix.org>, <martin.jansa@gmail.com>,
        <peter.kjellerstedt@axis.com>, <alexandre.belloni@bootlin.com>
CC: <openembedded-core@lists.openembedded.org>
References: <20230512172221.4062722-1-rs@ti.com>
 <20230512172221.4062722-3-rs@ti.com>
 <373eafd376a3ecf1b418fcbd0a8dfc8974226920.camel@linuxfoundation.org>
 <85499663-9edf-087b-aee4-b59739c533a7@ti.com>
 <115977cc86693aee888b225f7643cfc9fc77c071.camel@linuxfoundation.org>
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <115977cc86693aee888b225f7643cfc9fc77c071.camel@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 May 2023 19:02:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181613

On 5/22/23 11:59, Richard Purdie wrote:
> On Mon, 2023-05-22 at 11:22 -0500, Randolph Sapp wrote:
>> On 5/22/23 03:00, Richard Purdie wrote:
>>> On Fri, 2023-05-12 at 12:22 -0500, Randolph Sapp via
>>> lists.openembedded.org wrote:
>>>> From: Randolph Sapp <rs@ti.com>
>>>>
>>>> Upstream's dtb directory structure has no real standard. They just tend
>>>> to idle around the 2/3 directory depth. Recursively search for the
>>>> dtb/dtbo files instead of assuming anything.
>>>>
>>>> Fixes: 04ab57d200 (kernel-devicetree: allow specification of dtb
>>>> directory, 2023-05-02)
>>>>
>>>> Signed-off-by: Randolph Sapp <rs@ti.com>
>>>> ---
>>>>    meta/classes-recipe/kernel-devicetree.bbclass | 21 +++++++++++++------
>>>>    1 file changed, 15 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/meta/classes-recipe/kernel-devicetree.bbclass b/meta/classes-recipe/kernel-devicetree.bbclass
>>>> index 831fdd1527..fa6de7a140 100644
>>>> --- a/meta/classes-recipe/kernel-devicetree.bbclass
>>>> +++ b/meta/classes-recipe/kernel-devicetree.bbclass
>>>> @@ -12,12 +12,21 @@ python () {
>>>>                d.appendVar("PACKAGES", " ${KERNEL_PACKAGE_NAME}-image-zimage-bundle")
>>>>    }
>>>>    
>>>> -FILES:${KERNEL_PACKAGE_NAME}-devicetree = " \
>>>> -    /${KERNEL_DTBDEST}/*.dtb \
>>>> -    /${KERNEL_DTBDEST}/*.dtbo \
>>>> -    /${KERNEL_DTBDEST}/*/*.dtb \
>>>> -    /${KERNEL_DTBDEST}/*/*.dtbo \
>>>> -"
>>>> +# recursivly search for devicetree files
>>>> +def find_device_trees(d):
>>>> +    import glob
>>>> +    import os
>>>> +
>>>> +    file_paths = []
>>>> +    dest_dir = d.getVar('D')
>>>> +    full_dtb_dir = dest_dir + '/' + d.getVar('KERNEL_DTBDEST')
>>>> +
>>>> +    for file in glob.glob(full_dtb_dir + '/**/*.dtb*', recursive=True):
>>>> +        file_paths.append('/' + os.path.relpath(file, dest_dir))
>>>> +
>>>> +    return ' '.join(file_paths)
>>>> +
>>>> +FILES:${KERNEL_PACKAGE_NAME}-devicetree = "${@find_device_trees(d)}"
>>>>    FILES:${KERNEL_PACKAGE_NAME}-image-zimage-bundle = "/${KERNEL_IMAGEDEST}/zImage-*.dtb.bin"
>>>
>>> I suspect this still suffers from a determinism problem as the previous
>>> patch did but now it depends on whether the build had occurred or not.
>>>
>>> I also really don't like resorting to python functions like this,
>>> they're horrible for performance overhead. I did wonder if:
>>>
>>> FILES:${KERNEL_PACKAGE_NAME}-devicetree = "/${KERNEL_DTBDEST}/**/*.dtb*"
>>>
>>> would work?
>>
>> Tried that first. Unfortunately bitbake doesn't enable the recursive
>> option in it's path globs. That would be too easy...
> 
> I wonder if we should do something like:
> 
> diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
> index edb70daaf17..70040f09e7c 100644
> --- a/meta/lib/oe/package.py
> +++ b/meta/lib/oe/package.py
> @@ -550,7 +550,7 @@ def files_from_filevars(filevars):
>               f = '.' + f
>           if not f.startswith("./"):
>               f = './' + f
> -        globbed = glob.glob(f)
> +        globbed = glob.glob(f, recursive=True)
>           if globbed:
>               if [ f ] != globbed:
>                   files += globbed
> 
> we now have the right minimum python version for that. My main concern
> would be potential any performance implications.

This should not be an issue. Recursive=true just enables the 
interpretation of **, it *shouldn't* add extra recursion to any of the 
existing recipes... That being said, I've been wrong before.

> 
>>> Also, are there automated tests we should be adding to catch bugs like
>>> this?
>>
>> Unsure. I haven't looked into automated tests for yocto recipes yet. If
>> you know of some docs for whatever OE-core is doing, feel free to shoot
>> them my way.
> 
> oe-selftest -r <test-section-name>
> 
> where you can see the test cases in lib/oeqa/selftest/cases/
> 
> but I'm not seeing much for devicetree specifically. We should have
> some!
> 
> Cheers,
> 
> Richard
> 
> 
> 


