Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0202C77B7C
	for <webhook@archiver.kernel.org>; Fri, 12 May 2023 17:18:33 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.30595.1683911908849626913
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 May 2023 10:18:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=avl8XCCH;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34CHICli037201;
	Fri, 12 May 2023 12:18:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1683911893;
	bh=nn7lRbCMxWfleu3KK1GKchK/NtXDZHWHJunx1i87uNs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=avl8XCCHCpVfQ1Pv0oR9/E5p1Xr3XFDIKR0Fl1at8SWa3JbRANUqhtHEurrNQTVSj
	 fUDZ8Mzkfsl1odvFFeBwGorLr2H+6uRPYvGnAzVDT88Qv5n6nRoPBJJx3dK06wKPEj
	 TUUrnIPwI1QzA+2ExH8lGf6vuO5dHjrEW6blFYzo=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34CHICxY042457
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 12 May 2023 12:18:12 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 12
 May 2023 12:18:12 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 12 May 2023 12:18:12 -0500
Received: from [128.247.81.144] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34CHIC6i104446;
	Fri, 12 May 2023 12:18:12 -0500
Message-ID: <03ee2d43-0b96-e1e0-3a47-2463b603afb8@ti.com>
Date: Fri, 12 May 2023 12:18:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [EXTERNAL] Re: [OE-core][PATCH 0/2] Fix: allow specification of
 dtb directory
Content-Language: en-US, en-US-large
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: <afd@ti.com>, <reatmon@ti.com>, <denis@denix.org>,
        <martin.jansa@gmail.com>, <peter.kjellerstedt@axis.com>,
        <openembedded-core@lists.openembedded.org>
References: <20230511213614.466484-1-rs@ti.com>
 <2023051215065401e172fd@mail.local>
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <2023051215065401e172fd@mail.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 May 2023 17:18:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181188

On 5/12/23 10:06, Alexandre Belloni wrote:
> Hello,
> 
> This caused the following failures on the AB:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/113/builds/3986/steps/13/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/5176/steps/15/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/5167/steps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/7160/steps/11/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/106/builds/6067/steps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/1406/steps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/5126/steps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/5205/steps/14/logs/stdio
> 
> 
> 2023-05-12 09:01:46,475 - oe-selftest - INFO - fitimage.FitImageTests.test_initramfs_bundle (subunit.RemotedTestCase)
> 2023-05-12 09:01:46,476 - oe-selftest - INFO -  ... FAIL
> 
> and
> 
> ERROR: When reparsing /home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_package, the basehash value changed from 856d8373327180fa74e88cff2bbc28b82eb24fb635dc7d3ac16d7a2b7d89ff2e to d2b77c38850e4954edc1422022fb0dbd307742cf2eafac6d8ae699d03d2ce13b. The metadata is not deterministic and this needs to be fixed.
> ERROR: The following commands may help:
> ERROR: $ bitbake linux-yocto -cdo_package -Snone
> ERROR: Then:
> ERROR: $ bitbake linux-yocto -cdo_package -Sprintdiff
> 

Right you are. Expect a v2 using a specialized function to avoid the 
metadata change in a minute.

> On 11/05/2023 16:36:12-0500, Randolph Sapp via lists.openembedded.org wrote:
>> From: Randolph Sapp <rs@ti.com>
>>
>> Fix a few of the oddities introduced by the previous patch that allowed
>> specification of the DTB install directory and specification of vendor
>> directories in that directory.
>>
>> Add a recursive search for dtb and dtbo files to make sure
>> upstream dtb directory standards don't break our packages.
>>
>> Makes the kernel-devicetree class posix compliant again by using BB
>> variables more efficiently.
>>
>> Martin Jansa (1):
>>    kernel-devicetree: make shell scripts posix compliant
>>
>> Randolph Sapp (1):
>>    kernel-devicetree: recursively search for dtbs
>>
>>   meta/classes-recipe/kernel-devicetree.bbclass | 26 +++++++++++++------
>>   meta/classes-recipe/kernel.bbclass            |  2 +-
>>   2 files changed, 19 insertions(+), 9 deletions(-)
>>
>> -- 
>> 2.40.1
>>
> 
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#181157): https://lists.openembedded.org/g/openembedded-core/message/181157
>> Mute This Topic: https://lists.openembedded.org/mt/98837534/3617179
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
> 
> 


