Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6A4BE6780B
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 17:33:03 +0000 (UTC)
Received: from siberian.tulip.relay.mailchannels.net (siberian.tulip.relay.mailchannels.net [23.83.218.246])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.84867.1766424783225720884
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 09:33:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@rootcommit.com header.s=hostingermail-a header.b=OsemLy7w;
 spf=pass (domain: rootcommit.com, ip: 23.83.218.246, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 68C6B442023;
	Mon, 22 Dec 2025 17:33:02 +0000 (UTC)
Received: from de-fra-smtpout10.hostinger.io (100-108-184-12.trex-nlb.outbound.svc.cluster.local [100.108.184.12])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 6656B442167;
	Mon, 22 Dec 2025 17:33:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1766424781;
	b=7qel+4zkZvVXG60rt6gLOtfPNaluOY51e+u8avpbhNYFZ/YA5+kxcK3ivIQwg6U9sJ2pEg
	QB/i198beQenqkTBVRVbpqNS3J2s1YzJJjxE68SZDZ0zN3DxLcrWOOPR/+HqrmeFfx8uiC
	xrS9lEiCFnyRNljxC/q0EXIBGF2FzfQRFmXJb6S6vtHcDF6Vicnd5vyZW4T+HINmOx8pPc
	0VC09TJy1TD71yEVlI1ZS+sLafM7Wca5FL1wZVV4ZzY+yxiejEZLD6OuBwYz5w8rz17pSA
	DrlvxNClzl26OsxEPaCeObpip8qXrVNVZPJbpZG29hPKvntnMmNw6Or+8D7XVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1766424781;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=rGdSVjQlMpA5/95GzovYaXPnfASzZoxr0BNGafTym5I=;
	b=SFj9LeOryZHudoQoA0DQuntWrPo5XaL3CbmcV3e/Fqx8oYd9oqfBjQFCXfwsmwnN6Xkuo6
	75jPhGILahzv6Jdi0Urbm/D106U2KXKF+Zqmo1hWi0zFrpwcP+yNEFMGQG3bUlDumwDbME
	EakpGA5XEVT9ttJ1AWS+YfMEgiZQO2owIn66+lVf94z0ccP2RVj/bGhnoUZLeo+YLY9zPV
	Tl24QbqQCOscTLE/wWMnhLnVoTRCuWtSaEyee3kZW+TxccZeQPp1bzHZZQHXUXVxBe3YLw
	R8Jh4mzjIDcjJa54MjaIHq30VlFujn0pMXHqxuyrZGtKA3GcwpjAjhcixmVJyQ==
ARC-Authentication-Results: i=1;
	rspamd-55cdcc6c54-tfwjt;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Whimsical-Eight: 76836fbe23151f18_1766424782139_2067378111
X-MC-Loop-Signature: 1766424782139:3500170174
X-MC-Ingress-Time: 1766424782139
Received: from de-fra-smtpout10.hostinger.io (de-fra-smtpout10.hostinger.io
 [148.222.55.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.108.184.12 (trex/7.1.3);
	Mon, 22 Dec 2025 17:33:02 +0000
Received: from [IPV6:2001:861:4450:d360:7586:fd48:8d48:80a0] (unknown [IPv6:2001:861:4450:d360:7586:fd48:8d48:80a0])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4dZlbH2q8Zz3wbg;
	Mon, 22 Dec 2025 17:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1766424779;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rGdSVjQlMpA5/95GzovYaXPnfASzZoxr0BNGafTym5I=;
	b=OsemLy7wtymipUOWJuyn6pikasdpNgKuOoAYHpNvhXn4XllxNWn9LDTzlNOiY4CJe87fjj
	KYKXQl7BZqfI2jqQotjPdEBFNSZK1z35RAE08YD7MXRMSxj5k00gch0i1snmUKgsMgQT2A
	rAL7zVzur7QSWWT3WJnwcUx4xzn+poxHhJlT7+9KV2FrinsiwxdlaMTzRvMkuFRh2/gXkq
	ntAxsupaRMl5cWp1VYZWgupfgCV4+/yhWquhFDsrYIr5Hy6JjwyzCH/Hersy9UZ99VYMfJ
	Si4dhIn2pzOj7+LSvOedJmygDCv0egDcMo5oy7wBLBBIpqdQd6t8vIj/bqJIkA==
Message-ID: <d600fe11-1a72-4c29-8896-995f4f44f4f8@rootcommit.com>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com,
 openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2 2/5] alsa-utils: upgrade 1.2.14 -> 1.2.15
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20251217160533.600164-1-michael.opdenacker@rootcommit.com>
 <20251217160533.600164-3-michael.opdenacker@rootcommit.com>
 <CANNYZj9BS-ztuQd5txArSADdp7T_PZG=UuQTrknv0qNXcspOKA@mail.gmail.com>
Content-Language: en-US, fr
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <CANNYZj9BS-ztuQd5txArSADdp7T_PZG=UuQTrknv0qNXcspOKA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 22 Dec 2025 17:32:59 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=etGNzZpX c=1 sm=1 tr=0 ts=694980cb a=myaG3V0YOm9nx1Em8mk9ug==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=d70CFdQeAAAA:8 a=Q4-j1AaZAAAA:8 a=B21KMiPT4whlMYjgzioA:9 a=QEXdDO2ut3YA:10 a=NcxpMcIZDGm-g932nG_k:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-CM-Envelope: MS4xfGnNya0i6p7HrsqxzV1ED/xSWULDBXDrqyR/wBSPiiHuw9pB8nEwjDI42TkFg6MLeg0a8FTzD85GYhew3Ckk37r5Vn+P6Atx88tPsQByXTVpZMiC/LLI P25JkUmf+HUkyqxAf+ViOXkpVvYBcHIwiDPx2ZKOx0O6yPAfIT18SBv912KkVDYsunv3bh+JOCXayylhGC3ycttEFZoUR9Mn4Bn/oWU3p6+yEWfSNDZrd8LP iOaaWpBknIkaCI071iJEehFLK0TTR/WuKlj+yka4q5zEdcv9/iaBEU+owhCh0lBrjl2d/aLxrF9/4FpZwjlNRjTdSrtH9p8u1toJ8vBa89Mh5AUPb7AsimK5 mgf1dyvkgp+2vQXaqIkZcmlqobY8WPTSZDvJU6AszDQ3EZlzxPZukDtImfeNU+6p+ISxov9I
X-AuthUser: michael.opdenacker@rootcommit.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 17:33:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228313

Hi Alex

On 12/22/25 18:24, Alexander Kanavin wrote:
> On Wed, 17 Dec 2025 at 17:05, Michael Opdenacker via
> lists.openembedded.org
> <michael.opdenacker=rootcommit.com@lists.openembedded.org> wrote:
>
>>   # On build machines with python-docutils (not python3-docutils !!) installed
>>   # rst2man (not rst2man.py) is detected and compile fails with
>>   # | make[1]: *** No rule to make target 'alsaucm.1', needed by 'all-am'.  Stop.
>>   # Avoid this by disabling expicitly
>> -EXTRA_OECONF = "--disable-rst2man"
>> +# EXTRA_OECONF = "--disable-rst2man"
> Hello Michael,
>
> is this commented out by mistake? Either you need to explain why
> --disable-rst2man is not needed anymore (and remove the comments
> above), or not do it.


Thanks for the review!

Oops, my mistake, I tested whether the setting was still needed or not, 
and then forgot about it.

I'd rather address this in a separate commit, because my machine doesn't 
have the issue.
Cheers
Michael.


-- 
Michael Opdenacker
Root Commit
Yocto Project and OpenEmbedded Training course - Learn by doing:
https://rootcommit.com/training/yocto/


