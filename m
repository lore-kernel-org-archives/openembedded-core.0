Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B6D8C3DA4A
	for <webhook@archiver.kernel.org>; Sat, 27 Jul 2024 23:02:57 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.25625.1722121006275262073
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Jul 2024 15:56:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=qsl5uf8A;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46RMujNX033969
	for <openembedded-core@lists.openembedded.org>; Sat, 27 Jul 2024 17:56:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722121005;
	bh=IDW5+JT3bphLqW70qGXa6Hmd8444cwuwrxCk3h1RVeg=;
	h=Date:To:From:Subject;
	b=qsl5uf8Apl6E/TgkWh0Ho/1IW0kqV9w37OJ4TKUlt5r3L2hXs35jSFwYrqw+EjKfs
	 AqYtOS5ddp8tD29Kjpxm6k8+HGYxBMYR2D5G1HMSIlWGD0qqJeVfUaVBNFnjL66OGq
	 nW5Msi2QX4ZW01kkIreIt5xHnvtfOhYtVnzBZip8=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46RMujnJ129049
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Sat, 27 Jul 2024 17:56:45 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 27
 Jul 2024 17:56:45 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 27 Jul 2024 17:56:45 -0500
Received: from [10.249.36.67] ([10.249.36.67])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46RMujVu000929
	for <openembedded-core@lists.openembedded.org>; Sat, 27 Jul 2024 17:56:45 -0500
Message-ID: <240cabf4-9ae9-4259-8bc6-33e56ec70d73@ti.com>
Date: Sat, 27 Jul 2024 17:56:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
From: Ryan Eatmon <reatmon@ti.com>
Subject: scarthgap runtime SPDX error
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Jul 2024 23:02:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202562


We started seeing a new error on scarthgap on Friday.

ERROR: No runtime SPDX document found for bt-enable, False 
sstate:bt-enable:all-oe-linux:1.0:r1:allarch:12: 
sstate:bt-enable::1.0:r1::12:

The package it is referring to changes from image to image and run to 
run, but we only get a single error message.

If I do a build not using the sstate-cache, the build works fine.  If I 
then update our shared sstate-cache with those rebuilt files and run a 
second build using the cache, the error comes back.

I don't see anything obvious in the two bitbake commits and handful on 
oe-core.  I've spent all day today trying to do the two step process to 
see if I can find the commit that causes this.

Has anyone else seen anything like this in your scarthgap builds 
starting Friday?



-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

