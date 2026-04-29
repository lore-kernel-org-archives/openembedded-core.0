Return-Path: <marek.vasut@mailbox.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8384FF8867
	for <webhook@archiver.kernel.org>; Wed, 29 Apr 2026 09:51:31 +0000 (UTC)
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7846.1777456288778206478
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2026 02:51:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mailbox.org header.s=mail20150812 header.b=cfoKsoy2;
 spf=pass (domain: mailbox.org, ip: 80.241.56.171, mailfrom: marek.vasut@mailbox.org)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4g5CHc42vTz9tvm;
	Wed, 29 Apr 2026 11:51:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777456284;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=29ve5R7a2rVfLkfa4bT5xZH8xfwg5VZKpnVguinS7oY=;
	b=cfoKsoy2SPQXyiz6ngRwNZpE1DGRpT3asPV0Zj50lXZ2Wk6KrHry2nxUuvqidMMdYcZcfy
	hSDAsaJhzp/P21M8WkwpwmuTeD5Na1Du2HStF79Eo8nD42i2BZQYPVp89ruUSmxGNP7/ae
	YW8XLW7AwQQbbjlT5kbA5DHbaBTY90Nsw7t9ysWgr0LadSsELyaX3MmUpbEca6Nnys8CH2
	HvDzd1vUHg8QDVYpDR5lw+n+7cTm4Bvu6WsXp3IWWuJ0Q86B8o/+sfjUxjWPcg0aIFfbva
	9XYDjmK2HKzlLk3+Yg2jUQUQL0Z3nkip31c2fFEnhKtBB+M5ISQMsEIs/1D3Cw==
Message-ID: <4224196a-5bae-4ed6-8bd8-406d48a0b7d1@mailbox.org>
Date: Wed, 29 Apr 2026 11:51:20 +0200
MIME-Version: 1.0
Subject: Re: [OE-core] [PATCH] u-boot: Fix u-boot-tools-native build after DTC
 update
To: Quentin Schulz <quentin.schulz@cherry.de>, joaomarcos.costa@bootlin.com,
 richard.purdie@linuxfoundation.org, festevam@gmail.com,
 openembedded-core@lists.openembedded.org
Cc: khem.raj@oss.qualcomm.com
References: <20260429001811.2723886-1-festevam@gmail.com>
 <516fab60f06521e2335185dc20d8b8c1d1330730.camel@linuxfoundation.org>
 <d322d9ea-5312-4033-a0fc-91abd7fd71cb@bootlin.com>
 <fa25613f-508b-4bd0-88c3-df0605f114ba@cherry.de>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <fa25613f-508b-4bd0-88c3-df0605f114ba@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: yo7qoo6wjybznpn46jcz33acktstjfq8
X-MBO-RS-ID: 6b8453fe8e1e4685049
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2026 09:51:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236095

On 4/29/26 11:01 AM, Quentin Schulz wrote:
> Hi,
> 
> On 4/29/26 10:43 AM, Joao Marcos Costa via lists.openembedded.org wrote:
>> Hello,
>>
>> On 4/29/26 10:03, Richard Purdie via lists.openembedded.org wrote:
>>> On Tue, 2026-04-28 at 21:18 -0300, Fabio Estevam via 
>>> lists.openembedded.org wrote:
>>>> From: Marek Vasut <marek.vasut@mailbox.org>
>>>>
>>>> Set PKG_CONFIG_SYSROOT_DIR as invalid path, so the host tools
>>>> build will surely not find host /usr/include/yaml.h file and
>>>> will disable yamltree build. For details, see U-Boot commit
>>>> 807bcd844afe ("scripts/dtc: Fix pkg-config behavior under sysroot").
>>>>
>>>> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
>>>> Signed-off-by: Fabio Estevam <festevam@gmail.com>
>> (...)
>>>> +# Set PKG_CONFIG_SYSROOT_DIR as invalid path, so the host tools
>>>> +# build will surely not find host /usr/include/yaml.h file and
>>>> +# will disable yamltree build. For details, see U-Boot commit
>>>> +# 807bcd844afe ("scripts/dtc: Fix pkg-config behavior under sysroot")
>>>> +PKG_CONFIG_SYSROOT_DIR:prepend = "/invalid/"
>>>
>>> This feels a bit like a hack. Is there not a config option we can pass
>>> to u-boot to make this deterministic, i.e. always disable libyaml?
>>>
>>> Cheers,
>>>
>>> Richard
>>
>> Maybe setting/appending "-DNO_YAML" at HOST_EXTRACFLAGS (e.g., through 
>> EXTRA_OEMAKE or BUILD_CFLAGS)?
>>
>> In the end, that's a direct consequence of having an invalid 
>> PKG_CONFIG_SYSROOT_DIR:
>> https://eur02.safelinks.protection.outlook.com/? 
>> url=https%3A%2F%2Fgithub.com%2Fu-boot%2Fu- 
>> boot%2Fblob%2Fmaster%2Fscripts%2Fdtc%2FMakefile%23L21&data=05%7C02%7Cquentin.schulz%40cherry.de%7C73feb8ea44e0468f38ea08dea5cb6a9f%7C5e0e1b5221b54e7b83bb514ec460677e%7C0%7C0%7C639130490251925693%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=%2BbKkw2HVgw52EWv%2FxeSlWRZ%2Ba3%2F3ireKwMxCLBvIwyg%3D&reserved=0
>>
>> It is still kind of a hack, though, but I hope it helps!
>>
> 
> dtc-objs will still contain yamltree and thus attempt to build it.
> 
> Fabio, you are not explaining why you don't want to add the libyaml 
> dependency, Khem attempted to add it in https://lore.kernel.org/ 
> openembedded-core/20260412035757.134385-1-khem.raj@oss.qualcomm.com/ but 
> I don't see any follow-up or statement it should be dropped.
> 
> I'm very much against setting a variable in the recipe that applies to 
> all version of the recipes and will not be looked at again. Instead, add 
> a patch for U-Boot that removes this (but again, why?) logic so that 
> next time we do an upgrade there are more chances of someone looking at 
> patches and trying to figure out if they are still needed.
> 
> In any case, we absolutely need a justification otherwise I'm afraid 
> we'll never be able to do a cleanup because we don't know why it was 
> needed in the first place. This is something that has happened already 
> enough time for me in OE-Core/YP that it really is a PITA for upgrades 
> and cleanups.
In short, see the U-Boot commit 807bcd844afe ("scripts/dtc: Fix 
pkg-config behavior under sysroot") referenced in the commit message of 
this patch, and the matching Linux kernel commit ef8795f3f1ce 
("dt-bindings: kbuild: Use DTB files for validation") .

I think we need to port that kernel commit to U-Boot, upstream that 
kernel commit (should be easy) and then add it here into OE too. Then it 
will be really a problem solved all over the place and case closed.

