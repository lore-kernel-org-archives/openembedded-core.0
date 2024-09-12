Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47852EEE253
	for <webhook@archiver.kernel.org>; Thu, 12 Sep 2024 20:14:05 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.57816.1726172041451264495
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Sep 2024 13:14:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Te76RiX9;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 48CKDw6A064961;
	Thu, 12 Sep 2024 15:13:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1726172038;
	bh=Kp8XQoqRMJRUyUGp308u9VmpOeUEnRnuLLuRPFydT+w=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=Te76RiX9Lu2b5OQiLUl/eA+uqe7nCo3IN1STNZAGj8hWqu4bDs49A5YtoCgXayh87
	 5iuhLjtMmtCZbgY8duDNnGVACRpkbgbyyAHOS2fuDD+HzAVNaVQYMOpj0PjpcCFCAi
	 U9FSjVOw5T7Lc3NOKYT2OM/icNm8mtV2mXvMtYlg=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 48CKDwtc078193
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 12 Sep 2024 15:13:58 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 12
 Sep 2024 15:13:58 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 12 Sep 2024 15:13:58 -0500
Received: from [10.249.34.164] ([10.249.34.164])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 48CKDw6V055707;
	Thu, 12 Sep 2024 15:13:58 -0500
Message-ID: <dbf01538-aab4-47a7-b167-3cf3c4eea94f@ti.com>
Date: Thu, 12 Sep 2024 15:13:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] go-mod.bbclass: Set GO_MOD_CACHE_DIR
To: Christian Lindeberg <christian.lindeberg@axis.com>,
        <openembedded-core@lists.openembedded.org>
References: <20240912142953.1580877-1-christli@axis.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20240912142953.1580877-1-christli@axis.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 20:14:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204462



On 9/12/2024 9:29 AM, Christian Lindeberg wrote:
> From: Christian Lindeberg <christian.lindeberg@axis.com>
> 
> Set the GO_MOD_CACHE_DIR variable and move the location of the module
> cache to enable the use of the go module fetchers for module
> dependencies.
> Also, clean out the module cache before unpacking.
> 
> Signed-off-by: Christian Lindeberg <christian.lindeberg@axis.com>
> ---
>   meta/classes-recipe/go-mod.bbclass | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/classes-recipe/go-mod.bbclass b/meta/classes-recipe/go-mod.bbclass
> index ca3a690d05..71a6712c47 100644
> --- a/meta/classes-recipe/go-mod.bbclass
> +++ b/meta/classes-recipe/go-mod.bbclass
> @@ -22,9 +22,9 @@ GOBUILDFLAGS:append = " -modcacherw"
>   
>   inherit go
>   
> +GO_MOD_CACHE_DIR ?= "${@os.path.join(os.path.basename(d.getVar('S')), 'pkg/mod')}"
> +export GOMODCACHE = "${@os.path.join(os.path.dirname(d.getVar('S')), d.getVar('GO_MOD_CACHE_DIR'))}"
> +do_unpack[cleandirs] += "${GOMODCACHE}"
> +
>   GO_WORKDIR ?= "${GO_IMPORT}"
>   do_compile[dirs] += "${B}/src/${GO_WORKDIR}"
> -
> -export GOMODCACHE = "${B}/.mod"
> -
> -do_compile[cleandirs] += "${B}/.mod"
> 


What is the reasoning behind moving the cache dir out of the build dir 
${B} and into the bitbake managed sources dir ${S} ?  There might be a 
good reason for doing it, but it was not explained in the commit message.




> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#204444): https://lists.openembedded.org/g/openembedded-core/message/204444
> Mute This Topic: https://lists.openembedded.org/mt/108413937/6551054
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

