Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 998B0C77B76
	for <webhook@archiver.kernel.org>; Fri, 21 Apr 2023 21:27:14 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.24628.1682112432286109017
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Apr 2023 14:27:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=sJU4h5Cs;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33LLRBK7050949
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Apr 2023 16:27:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682112431;
	bh=zkKUmTzq62F4sLPILh62J+E07sNVrkSKv7udrU2glcs=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=sJU4h5CsXK1UZ3XyE/PKo2ASQNRjaqK8xRecmtW1rFMALTmBtg+/iMOMnX2qmtS1s
	 kYV3ECZKiLYsVsWsWzr2q3Qddpj/9XqEDpYmT2bcUFSwTjz/jb6DuiPD58aD6pNNRB
	 pIBfsPuhTABsM4MT3iWwG+t3Jm8+j/Edeec7vRtA=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33LLRBaO103084
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Apr 2023 16:27:11 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 21
 Apr 2023 16:27:10 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 21 Apr 2023 16:27:11 -0500
Received: from [128.247.81.144] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33LLRA9T011479
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Apr 2023 16:27:10 -0500
Message-ID: <1cedf6d6-194e-3085-a6b0-7d83694d8301@ti.com>
Date: Fri, 21 Apr 2023 16:27:10 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [EXTERNAL] [OE-core] [PATCH] wic/bootimg-efi: if fixed-size is
 set then use that for mkdosfs
Content-Language: en-US, en-US-large
To: <openembedded-core@lists.openembedded.org>
References: <17580F772BAC5000.26256@lists.openembedded.org>
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <17580F772BAC5000.26256@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Apr 2023 21:27:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180299

On 4/21/23 16:10, Randolph Sapp via lists.openembedded.org wrote:
> This is a bit of a compatibility issue more than anything. Some devices
> get upset if the FAT file system contains less blocks than the
> partition.
> 
> The fixed-size argument is currently respected by the partition creation
> step but not by the file system creation step. Let's make it so the file
> system respects this value as well.
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>   scripts/lib/wic/plugins/source/bootimg-efi.py | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
> index a65a5b9780..15557e5d36 100644
> --- a/scripts/lib/wic/plugins/source/bootimg-efi.py
> +++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
> @@ -387,6 +387,9 @@ class BootimgEFIPlugin(SourcePlugin):
>   
>           blocks += extra_blocks
>   
> +        if blocks < part.fixed_size:
> +            blocks = part.fixed_size
> +
>           logger.debug("Added %d extra blocks to %s to get to %d total blocks",
>                        extra_blocks, part.mountpoint, blocks)
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180297): https://lists.openembedded.org/g/openembedded-core/message/180297
> Mute This Topic: https://lists.openembedded.org/mt/98419903/7094281
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [rs@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

Just realized I stepped on a log message. v2 to fix that.

https://lists.openembedded.org/g/openembedded-core/message/180298

