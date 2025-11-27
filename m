Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22938D11183
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 11:03:26 +0000 (UTC)
Received: from elephant.ash.relay.mailchannels.net (elephant.ash.relay.mailchannels.net [23.83.222.57])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16170.1764241399166410453
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Nov 2025 03:03:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@rootcommit.com header.s=hostingermail-a header.b=B3asDvSJ;
 spf=pass (domain: rootcommit.com, ip: 23.83.222.57, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 0B745160EA2;
	Thu, 27 Nov 2025 11:03:18 +0000 (UTC)
Received: from fr-int-smtpout26.hostinger.io (trex-green-1.trex.outbound.svc.cluster.local [100.98.35.108])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id DC95E161059;
	Thu, 27 Nov 2025 11:03:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1764241397;
	b=ylfmYalFPQ4sJc/DjfvRLb1d6Qgi25Ud6YfiH35+/yR0TYl6XMNAKPV7wu2O2z2WcKoj+L
	EPCVD1I8GgYc/8Vk3KQuyqAEdD0yfxDjdSYanIy3zE1X8b7kRoG4kLZar1WS/OloVVdf2P
	MgvfLgcibpWUFFXR9sLSnk76SCHwIhYW1lyXyKJIUUcncirNCiivNTHM3Ii5GGUOeSxuwI
	tiwOFQIgbjratez5bg96LdwDZzzyw6l1BA7TmS9nutZ7f0VmHImMBmRiUYie4QqHFIk9s4
	76CyqJS2C/6LhqG9Dr9KjdXbHveEsgvNvtTr0UIY4VRXzzwmDQ0KXlW0HpXELg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1764241397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=oFIYk3ITs1IuxjL1jCbXbDP7fR3v9N7GMC5h44MM83Y=;
	b=PqsEl63UZ/grWAqyWLcl9ILzvn0MpGWm31HgbUPakQQ0CHagucHmNxOyNY6dUeaajOYNsy
	IB1JJv1FBK2cm68kB3nCl1HYhpPZ3i2zwn0Bgnhr73MCJ8K9blDp+a9GpWym9y+PxY5Xwn
	kElErekjmHrayxw/fbaME4AmXihioF+THImAEqJJwNYOGOBv9V4PUNSnE/lLS/HxgDZ/nK
	nc1X0HPdqs3rLTh0WgEtFliJgYi21ktXFvexgsRzL0H7dnnt4vScacsmfQ1lM/yKarxOmH
	bHGd1ubtUVUgD+65qdPW6nEoeKQIx9I8W4JENh3lry5dOXw8NiOnLz+tzGvMmA==
ARC-Authentication-Results: i=1;
	rspamd-74f6bfdf88-kl698;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Skirt-Relation: 56c53cc56874ae18_1764241397745_616086390
X-MC-Loop-Signature: 1764241397745:943598912
X-MC-Ingress-Time: 1764241397745
Received: from fr-int-smtpout26.hostinger.io (fr-int-smtpout26.hostinger.io
 [148.222.54.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.98.35.108 (trex/7.1.3);
	Thu, 27 Nov 2025 11:03:17 +0000
Received: from [IPV6:2001:861:4450:d360:2b5c:8d8d:ac9c:970a] (unknown [IPv6:2001:861:4450:d360:2b5c:8d8d:ac9c:970a])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4dHD766rrnz1xq2;
	Thu, 27 Nov 2025 11:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1764241395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oFIYk3ITs1IuxjL1jCbXbDP7fR3v9N7GMC5h44MM83Y=;
	b=B3asDvSJ7v2QCm3cl8MfoLgVNsLlNysVzrWCHgirff+u2/TfWpnT19INgWzMly/LR0A79i
	YqebPn0rZQktPa7hzG+ZHAlF6fH6+RKXRAy1bJraGpfhmKZflQtUR5923+6VKoO7SgVH+i
	pUwJzpb5QNA2V78oN/cLtJB1pRltJW//e2VP7s4Cl0EfzaN1I5ADq4yvIopcSialvuTfJX
	bnCOhljSl3zlloHQymbXr0tAZA7kfTby5LOJHgheNWont1ErOzWRDXBfB2njRR05PooLjn
	KXrKFNPpvZaxJ5tK03PBUDR/I5x9+MfNexOd7C6TJKTv2RJJQoPFk4cnqVtOSA==
Message-ID: <7e4c03b7-8f5c-4e92-91b2-1535e5533f8d@rootcommit.com>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com, Khem Raj <raj.khem@gmail.com>
Subject: Re: [OE-core] linux-yocto.inc: remove riscv-isa-clear.scc from
 KERNEL_FEATURES_RISCV?
To: Gyorgy Sarvari <skandigraun@gmail.com>,
 OE-core <openembedded-core@lists.openembedded.org>
References: <3a1b9adc-9ac6-44b7-824f-10f5e08f6d37@rootcommit.com>
 <73131023-79db-445a-8341-0b455dd586f6@gmail.com>
Content-Language: en-US, fr
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <73131023-79db-445a-8341-0b455dd586f6@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Date: Thu, 27 Nov 2025 11:03:14 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=GbNFnhXL c=1 sm=1 tr=0 ts=69282ff3 a=sLUQtW3OpqQ2zsHCe+MVTw==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=iGHA9ds3AAAA:8 a=d70CFdQeAAAA:8 a=Q4-j1AaZAAAA:8 a=PeiXfoUJxh_y2VGVcWAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=NcxpMcIZDGm-g932nG_k:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-CM-Envelope: MS4xfPba4xsR8GigOWgdIYvVJqiq0+jaL1+E8dzZ1nfL7+VK+EzBY9PXCrKBDhyMQI31jp+2XFYkmbrzQRekWzYErtj4/25/f5ORjynb0kUgN2XptAmONYtb qW/xc38u0FSPPGHjh4MttpeDyba7UiVAEevktMTlbHmZBaH8rxnp8TeDqlpHc7gTa/XUjIhxnQMgjoPibFJc2PqYs8xzK5ngMIhG2l3ipTPvnt9M0TvoS/Rb x7pV6SIP/SAJhznRsN0B61blSvwMsCsu6xs3VYE3jBB/kzS66y4EEbXDsooJaxemrEbMX1CKRhNV/nv7O7s31C7d7NRl4wcRIhHyynPNzxUqKwpZDpX5/NCR QxILWXiTcXaIUn2pP/12wb5Jt516YqWUSA7+WmOzkCa+5tmE7P/Ded9TqQV1dPn2wwweHhlt5dS0C49oBHLAV+YJkSnnkKI/nwE9f2KrSGH84RbAi0Y=
X-AuthUser: michael.opdenacker@rootcommit.com
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Nov 2025 11:03:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226837

Hi=C2=A0Gyorgy

On 11/27/25 11:46, Gyorgy Sarvari wrote:
>
> On 11/27/25 11:20, Michael Opdenacker via lists.openembedded.org wrote:
>> Greetings,
>>
>> I'm getting the same issue trying a master build on several RISC-V boa=
rds:
>>
>> ERROR: linux-milkv-duo-dev-1.0-r0 do_kernel_metadata: Feature
>> 'arch/riscv/tunes/riscv-isa-clear.scc' not found, this will cause
>> configuration failures.
>> ERROR: linux-milkv-duo-dev-1.0-r0 do_kernel_metadata: Check the SRC_UR=
I
>> for meta-data repositories or directories that may be missing
>> ERROR: linux-milkv-duo-dev-1.0-r0 do_kernel_metadata: Set
>> KERNEL_DANGLING_FEATURES_WARN_ONLY to ignore this issue
>>
>> OK, I can set
>> KERNEL_DANGLING_FEATURES_WARN_ONLY =3D "1"
>> but is this a clean solution?
>>
>> Where are all the arch/riscv/tunes/riscv-isa-*.scc files supposed to b=
e?
>> I didn't manage to find them anywhere...
> Do you have the yocto-kernel-cache[1] repo in your SRC_URI? The scc
> files come from there
>
> [1]: https://git.yoctoproject.org/yocto-kernel-cache/tree/arch/riscv/tu=
nes

Ho, thanks! That was exactly what I needed.
I will add these to my kernel recipes.

Thanks again,
Cheers
Michael.

--=20
Michael Opdenacker
Root Commit
Yocto Project and OpenEmbedded Training course - Learn by doing:
https://rootcommit.com/training/yocto/


