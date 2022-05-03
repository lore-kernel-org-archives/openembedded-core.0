Return-Path: <ch@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 071F2C433F5
	for <webhook@archiver.kernel.org>; Tue,  3 May 2022 07:54:23 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web08.8557.1651564452907099674
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 May 2022 00:54:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=ZiOViXbs;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: ch@denx.de)
Received: from [10.88.0.104]
 (dslb-084-057-071-010.084.057.pools.vodafone-ip.de [84.57.71.10])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: ch@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 0E6D783960;
	Tue,  3 May 2022 09:54:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1651564450;
	bh=3BWmla4D8tPhyw8Gkg7yapm81crb7s23QETukiX7exM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZiOViXbs2QBbmGqWgM8pGM+Oo3QKdtZkzx1hH3AL0OHB9z11M6GvMNLbvRvlkv1VN
	 ngjFtP/kQm/8xKaY4VP84U/ilNH4ct0H4XTGMI+/zPI5r3vtjEFqfqMnjPVao0fijC
	 +EhNBVJt+xFkIg6Qdmj7mi+ufcMlhj1+D2AeKNlQZ6/c/7Vs/zGd3HPN8+8uAUEB9i
	 PhOA70yu87ARsf5Y1E7rmeZXE7gpkD0SDcGwu0cV/kNQs2YvRL/6rE2TqjB+NDumxM
	 11L9UbLOpxCsEDIupW17W/uPA1Dt18Zoy8EMn1TjW/2vGz0jGqrV3C1KqknR7vcxiy
	 aup2VzvLFuRnA==
Message-ID: <7f0c4ca5-3254-22df-ecb7-f14c0d104e00@denx.de>
Date: Tue, 3 May 2022 09:54:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [OE-core] [PATCH v2] classes: rootfs-postcommands: add skip
 option to overlayfs_qa_check
Content-Language: en-US
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: openembedded-core@lists.openembedded.org,
 Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
 Vyacheslav Yurkov <uvv.mail@gmail.com>
References: <20220429081733.225481-1-ch@denx.de>
 <20220502210927.1aad92b4@melee>
From: Claudius Heine <ch@denx.de>
Organization: Denx Software Engineering
In-Reply-To: <20220502210927.1aad92b4@melee>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 May 2022 07:54:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165194



On 2022-05-02 21:09, Luca Ceresoli wrote:
> Hi Claudius,
> 

Hi Luca,

> Il giorno Fri, 29 Apr 2022 10:17:33 +0200
> "Claudius Heine" <ch@denx.de> ha scritto:
> 
>> The overlayfs_qa_check checks if the current root file system has a
>> mount configured for each overlayfs, when the overlayfs class is used.
>>
>> However there are certain instances where this mount point is created
>> at runtime and not static in a fstab entry or systemd mount unit.
>>
>> One such case would be if overlayfs-etc is used, where the device is
>> mounted in the preinit script and not via a mount unit or fstab entry.
>>
>> However there are other possibilities for this as well, like startup
>> scripts that support a dynamic partition layout. For instance when
>> systemd-repart is used.
>>
>> This adds the `OVERLAYFS_QA_SKIP` variable, which allows to define QA
>> skips via its flags. In principle it supports multiple QA skip flags
>> separated by whitespace, but only one (`mount-configured`) is
>> implemented here. To skip this QA check simply add `mount-configured`
>> to the flag of `OVERLAYFS_QA_SKIP` with the same name. For instance
>> if a overlayfs is configured as:
>>
>> 	OVERLAYFS_MOUNT_POINT[data] = "/data"
>>
>> Skipping this QA check can be done by setting:
>>
>> 	OVERLAYFS_QA_SKIP[data] = "mount-configured"
>>
>> Signed-off-by: Claudius Heine <ch@denx.de>
> 
> Failures appeared on the autobuilders with your patch applied:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/3530/steps/15/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/3530/steps/15/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/3470/steps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/3521/steps/15/logs/stdio

Thanks! It seems that failed because I also fixed a typo in the warning 
message ('fstat -> fstab').

I will change that in v3 and also add a testcase for the 
OVERLAYFS_QA_SKIP functionality.

regards,
Claudius

