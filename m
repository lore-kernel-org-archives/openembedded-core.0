Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A06EFCD343F
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 19:41:00 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5690.1779133256922358655
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2026 12:40:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: key syntax error: missing public key data" header.i=@rootcommit.com header.s=dkim header.b=NGQGc99J;
 spf=pass (domain: rootcommit.com, ip: 185.171.202.116, mailfrom: michael.opdenacker@rootcommit.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9ADFAC5EF23;
	Mon, 18 May 2026 19:41:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 99F855FFA3;
	Mon, 18 May 2026 19:40:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 167FE11AF8B3A;
	Mon, 18 May 2026 21:40:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=dkim; t=1779133253;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=UiFxpSdRrB0RQ0Tt3J5OjRPMY8GdoMRdYshl91F7YJQ=;
	b=NGQGc99J5FQXnIk9EfugqRNrm8uGuNJenVa+48XXc09fLSQz/qvC88o9gLAbxvywA6uYgw
	kSvLjbu29BddTbqSsH4PMVuNx/Zpuck/ES2KfgrivghBiHEVc0Dfs26uZ8Cq2PSOc2StkH
	7CmcilhT8GujoXKINzo/pyCgU3JrexSWQouZrD3Hphm7bV999gqvHF3Byf0XaRMLaBJaTP
	13kzQW/C3VvgN55iLg0oNhszuLBBKJ37ctGM1nzNC6MlcKwcC13zautRDrhjVzMbEsVQoh
	tE6Wchz52LM/8dB/Wodz9AJArLX19Zwq9i2X2+Tv0gRGBsigFUajmDNv3BsN7w==
Message-ID: <9dc8c3b7-c358-4a7d-af1a-c1aec83906af@rootcommit.com>
Date: Mon, 18 May 2026 21:40:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com,
 openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] u-boot: move DT validation yaml removal patch
 to common SRC_URI
To: joaomarcos.costa@bootlin.com, dmitry.baryshkov@oss.qualcomm.com,
 Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>
References: <20260507204018.3254064-1-ricardo.salveti@oss.qualcomm.com>
 <gnsndbzzgdnp4q5bqmccwxy5njtkj22btgpedstktykczupbfk@chm5coxohwxo>
 <f531466a-fbd8-472b-a2b1-e487eea6d51a@bootlin.com>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
In-Reply-To: <f531466a-fbd8-472b-a2b1-e487eea6d51a@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 19:41:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237260

Greetings,

On 5/9/26 12:55 AM, Joao Marcos Costa via lists.openembedded.org wrote:
> Hello,
>
> On 5/8/26 21:09, Dmitry Baryshkov via lists.openembedded.org wrote:
> (...)
>>
>> We are fetching the source basing on the PV. The patch might be
>> applicable or might not. I'd suggest listing the patch twice: in the
>> u-boot_2026.04.bb and u-boot-tools_2026.04.bb.
>>
>> (in fact I did that in a local patch, it's good that I checked the ML
>> before sending it).
>
> I agree with this approach. Also, even if someone does not like seeing 
> the same patch applied in two different recipes, the patch was already 
> merged upstream and should be available in v2026.05 (I hope?). So, in 
> any case, we will drop it soon enough.


Any update on this patch?
Building u-boot-tools on master for the "qemuriscv64" machine is still 
broken.

For people facing this too, a workaround is the add back 
"libyaml-native" to depends in meta/recipes-bsp/u-boot/u-boot-common.inc

How come the autobuilder didn't catch this issue on one of our 
officially supported machines?
Cheers
Michael.

-- 
Root Commit
Embedded Linux Training and Consulting
https://rootcommit.com


