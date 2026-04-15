Return-Path: <michael@rndt.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73287F4382F
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:43:39 +0000 (UTC)
Received: from hognose1.porkbun.com (hognose1.porkbun.com [35.82.102.206])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20759.1776264211774634956
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:43:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@rndt.dev header.s=default header.b=XOeM5t7I;
 spf=pass (domain: rndt.dev, ip: 35.82.102.206, mailfrom: michael@rndt.dev)
Received: from [192.168.178.111] (unknown [46.253.77.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: michael@rndt.dev)
	by hognose1.porkbun.com (Postfix) with ESMTPSA id 712A5463C9E;
	Wed, 15 Apr 2026 14:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rndt.dev; s=default;
	t=1776264211; bh=rSPAvHR0j/8OyjQHTiIJCb42vErvYPewLG4JKC0bCZk=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=XOeM5t7IfMvWWpqXwIRlOvMbCJU7kEZvFPuu7fhSOHv1s61jQ9SMXhZg7/1uAtTde
	 E43KquCpLx/OeNFc8LE7L1IENqMz65Vh+RsQEb6rNbDX3xhYzOvBq3Arzc89VwtLNG
	 q800tGVT198RWMSl+JxSt5ODdClBTFP9Er9mw+w8=
Message-ID: <5147fa64-737e-46d1-87ec-81110fe4dc97@rndt.dev>
Date: Wed, 15 Apr 2026 16:43:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] sstate: Add fallback when hardlink fails
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20260415085824.1730569-1-michael@rndt.dev>
 <58af6d456e153cfd7810fc48a199d170a592f2f1.camel@linuxfoundation.org>
 <bdc53821-842b-4dbc-a9d8-00270b864280@rndt.dev>
 <7ed13b9dbb647c03834694d6104be8bce6b87876.camel@linuxfoundation.org>
Content-Language: en-US
From: Michael Arndt <michael@rndt.dev>
In-Reply-To: <7ed13b9dbb647c03834694d6104be8bce6b87876.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:43:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235308

> If you can catch a specific exception about it being not supported, we
> could at least show that to the user and fail. I noticed there are
> other generic try/except blocks in there which could probably be
> improved.

Sure I know which errno the exception contains (ENOSYS), but wouldn't it 
make more sense to only ignore the one error that we want to ignore and 
fail for everything else? As I understand it we only want to ignore is 
the FileExistsError, correct?

What would be preferred here?

Greetings,
Michael

