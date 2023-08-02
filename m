Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5D4DC001E0
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 16:41:06 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.1189.1690994463473171799
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 09:41:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=UUNJedVA;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 372Gf26B038365
	for <openembedded-core@lists.openembedded.org>; Wed, 2 Aug 2023 11:41:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1690994462;
	bh=gR2qKQICNA+/BT33AgSC3p4SMU4u5eaxmGsEY2WWAsM=;
	h=Date:To:From:Subject;
	b=UUNJedVAJ03pfENfpvdAS8cvrKYBL5hl5W0F9f5BxzDt16ZxfcE4Axx3kigettoGa
	 JraPf93o907qPhQN6vmf0+rXLVjQPg4UblW7NRvXqsc7Wu645zCFDXUp3BpYXZCRZu
	 sVoQDOJy2JdCQCct/zydzvJjoEHWT57lcW3U6znk=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 372Gf2Og072209
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 2 Aug 2023 11:41:02 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 2
 Aug 2023 11:41:02 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 2 Aug 2023 11:41:02 -0500
Received: from [128.247.81.69] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 372Gf1sh005627
	for <openembedded-core@lists.openembedded.org>; Wed, 2 Aug 2023 11:41:02 -0500
Message-ID: <c447aa42-9eae-ce9c-356f-ae3133c00418@ti.com>
Date: Wed, 2 Aug 2023 11:41:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: <openembedded-core@lists.openembedded.org>
From: Ryan Eatmon <reatmon@ti.com>
Subject: image.bbclass question
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 16:41:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185415


I am trying to add support for the INITRAMFS_MAXSIZE into the meta-ti 
layer for our tiny image.

I have added the following to our tiny image file:

INITRAMFS_FSTYPES += "cpio cpio.xz"
INITRAMFS_MAXSIZE = "65536"

But I'm not seeing any errors about the image being too big being printed.

In looking at the code in question:

     # Check the initramfs size against INITRAMFS_MAXSIZE (if set)
     if image_fstypes == initramfs_fstypes != ''  and initramfs_maxsize:
         initramfs_maxsize_int = int(initramfs_maxsize)
         if base_size > initramfs_maxsize_int:
             bb.error("The initramfs size %d(K) exceeds 
INITRAMFS_MAXSIZE: %d(K)" % \
                 (base_size, initramfs_maxsize_int))
             bb.error("You can set INITRAMFS_MAXSIZE a larger value. 
Usually, it should")
             bb.fatal("be less than 1/2 of ram size, or you may fail to 
boot it.\n")


What is the purpose of the:

if image_fstypes == initramfs_fstypes != ''


It seems to looking for the ONLY images being built are the exact same 
as the INITRAMFS_FSTYPES...  Shouldn't that be more of an intersection 
check?  If any of the INITRAMFS_FSTYPES are in the IMAGE_FSTYPES, then 
check the size?

Or am I missing something?



-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

