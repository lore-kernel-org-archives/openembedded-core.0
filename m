Return-Path: <michael@rndt.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B744EF41994
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 11:52:12 +0000 (UTC)
Received: from hognose1.porkbun.com (hognose1.porkbun.com [35.82.102.206])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17085.1776253931216648362
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 04:52:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@rndt.dev header.s=default header.b=P9s1obmF;
 spf=pass (domain: rndt.dev, ip: 35.82.102.206, mailfrom: michael@rndt.dev)
Received: from [192.168.178.111] (unknown [46.253.77.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: michael@rndt.dev)
	by hognose1.porkbun.com (Postfix) with ESMTPSA id CFFB747698E;
	Wed, 15 Apr 2026 11:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rndt.dev; s=default;
	t=1776253930; bh=KSSFH1XwGjeYG/mWP6jPgM2Xejwzfpk2CE5MYTqUXFU=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=P9s1obmFtt+3jgMtAQeerYpCu4nFp5X6jY0mSx9lglLE87+OTo4kAIavYk3Qj8Qxa
	 GsiVbi9KYTwcMzLe4yS0+f3hlJoCEzuP1i7p+FMQxm6r4HDXYKXPW9J3DZgSL4xAiv
	 IBSG8y5rK88o2hNvXyEtff5j54KVj9wuiiQTet04=
Message-ID: <bdc53821-842b-4dbc-a9d8-00270b864280@rndt.dev>
Date: Wed, 15 Apr 2026 13:52:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] sstate: Add fallback when hardlink fails
To: richard.purdie@linuxfoundation.org,
 openembedded-core@lists.openembedded.org
References: <20260415085824.1730569-1-michael@rndt.dev>
 <58af6d456e153cfd7810fc48a199d170a592f2f1.camel@linuxfoundation.org>
Content-Language: en-US
From: Michael Arndt <michael@rndt.dev>
In-Reply-To: <58af6d456e153cfd7810fc48a199d170a592f2f1.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 11:52:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235193

Hello Richard,

> The challenge is that the sstate directory is shared, so two builds can
> write to the same file at the same time. Our policy is "first wins" and
> anything later is just skipped. The code also needs to make sure that
> if the sstate file is written, the paired signature matches.

Thanks for taking a look at my change. I guess then there is no simple 
fix for the problem, because checking if the file exists and replacing 
it must be a single atomic operation. Without hardlinks that is a problem.

 > Generic try/except cases are almost always a red flag in general.

Agreed, that was also the reason why I was surprised that my sstate 
didn't work. The existing code already swallows the IOException from 
os.link so you don't see the error about the missing hardlink support.

I guess I will have to use a different file system, but thanks anyway.

Greetings,
Michael


