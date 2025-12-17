Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 104DCD65C74
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 15:59:28 +0000 (UTC)
Received: from beige.elm.relay.mailchannels.net (beige.elm.relay.mailchannels.net [23.83.212.16])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17977.1765987158127504455
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 07:59:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@rootcommit.com header.s=hostingermail-a header.b=kqdM0spS;
 spf=pass (domain: rootcommit.com, ip: 23.83.212.16, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 4AA9B1610F9;
	Wed, 17 Dec 2025 15:59:17 +0000 (UTC)
Received: from fr-int-smtpout26.hostinger.io (100-103-169-235.trex-nlb.outbound.svc.cluster.local [100.103.169.235])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 6BD951616DA;
	Wed, 17 Dec 2025 15:59:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1765987156;
	b=fLXloSztiziwDjcpRPYRnuoruZlOqyS9a6qo2p23qEAl672UU1HW+bhWzp04SfGrS6EId2
	Hrk/A23l/QEEwUlIsw3p8okG2RENOCR5qN6jy/JNZkcD4DxUuQR0o/NbUI6RdmeXZM+7Nv
	d/qWZJfL8Tl0pzXNKkn/z6JZHhoH5lbuPbbEFEp/h06rq08c3JlOBOPlursnH3d483FFgk
	JHbR0iSjGdMKYzmVsyfZHYq3OwMbk7F2fawIb2GgsNsGAwAim9DuCcm2nV+fcWC1dMR0nL
	c9xRbS+H7JdowGBID6TEQxquiVErrxrNCqiQgEvOB/WrtMBHmm0Pze5iMRL43g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1765987156;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=/yyw8HfYPfrClcDiDRYiog853m0zDpZw3HW/rahmBSw=;
	b=hb58Zew6RaWoauPls7/yJXbGXTW/oDUyoRC376Zln0XeECZ7u5U1seOHFEfjmKvmmMQASJ
	zYhcdy9RlOQ35L/qqlQjayuCQkaNbuwHUNObLn5JJFPjl4/s2e3lfvgGdzwnfSqlyKaGCv
	7mZ+NolgGvSAC4OJbZDdlUSCEebQE/Nk3XfdGS97UvyrHviIrA9+2XX/c/S0WdG49pAr1m
	Aip3B1eHFTNfjED012vXCCuRhRjMfVmRDmmuKmc+FmgZTNptfZrRGnI7XfNaRW5huMBMgS
	4JFeGOWBIbVBQsrDcfBbQtAduB/9rV3PdASKLXKAgmuL7hKP9ttDoqkz9bZGWg==
ARC-Authentication-Results: i=1;
	rspamd-659888d77d-52z6z;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Macabre-Company: 0e96c5eb3a89aa51_1765987157112_2962036657
X-MC-Loop-Signature: 1765987157112:2995777550
X-MC-Ingress-Time: 1765987157112
Received: from fr-int-smtpout26.hostinger.io (fr-int-smtpout26.hostinger.io
 [148.222.54.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.103.169.235 (trex/7.1.3);
	Wed, 17 Dec 2025 15:59:17 +0000
Received: from [IPV6:2001:861:4450:d360:ea5c:9c0:3076:4dda] (unknown [IPv6:2001:861:4450:d360:ea5c:9c0:3076:4dda])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4dWdlQ3X5pz1xnk;
	Wed, 17 Dec 2025 15:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1765987154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/yyw8HfYPfrClcDiDRYiog853m0zDpZw3HW/rahmBSw=;
	b=kqdM0spSLpFqOXchyLIhui+QDszBmqm/bQGNc3EOTzp394OjzBCHhoE2sJMxEHHinx4bQB
	DyHC1XPTfoGcm3O9rUfx8lVVX9dvTt0j64Epd/MGD5sN8PKJr72nZscU/HpRPkn7YB4TD+
	J+HaKXUk6/4VVX5SdEy2Y5hC2gzXVzRLzOREEHenQVh3+etujNJSGekMnXzonrWAUB4/0Z
	nRKCec34sobVDkS2uOrSCrbiGU6X8W5M/HR/Du/ZfgORmSXqg+Tlhwddn+IWjtJ0SnW5P3
	qRfFOxjY76v8PgJgFwipmhOxnY78vj8C0YGwpDTJk45pm0EuPCIuMYt88UYeWg==
Message-ID: <210b0dcb-e9b4-4958-8e9c-1efb82ccf380@rootcommit.com>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com,
 openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 0/5] ALSA 1.2.15 updates
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
References: <20251217121705.391288-1-michael.opdenacker@rootcommit.com>
 <DF0KQQWVQZMH.2W0FET0GDQBVB@bootlin.com>
Content-Language: en-US, fr
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <DF0KQQWVQZMH.2W0FET0GDQBVB@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 17 Dec 2025 15:59:14 +0000 (UTC)
X-CM-Envelope: MS4xfIXPHjhucoVneS1ytO/kA2UXZl/1WqOP6SISf6rmgZvMKTwVWQ5/mgRwhIwHcgYNM7oWE2hFiyn/GnaN1lFfVsOI//jIa6104iucH/pvvTgrnGLkEZI7 EF4zy1XLUgSXXj6u4yYbKUdVv+oW55beW+K9wnFKIGdxoOIUbbbnRXKvmHK5YDwF90gtSi/U02nEPX8Jac28jv417E5YGgTBMNbifT7RS8vy40aJGhuATdOS BGO+Pa0X6Z1a7eKF8jFhW+baJDjhhoe0q0Mc7gbd3nw6c/d/g3owAzeK9/kMxlXpg+3NHtdAmT1gTPUWbSyHSO6x9IfB3hG2Q0Bl6uB5pl9lLDDMhuyQpmDz /1xKiX9GNGYFFKFlJUKF95GNXmCwNB7XzmPUVAYdP3+aOfoByc/ZYv5oKE/DluPoAsE8h3gcGRchDJkBlt2Gzq9qd3XWWQ==
X-CM-Analysis: v=2.4 cv=B9fr0/tM c=1 sm=1 tr=0 ts=6942d352 a=MKCPbgLKPPUpDiypvfdhzA==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=iGHA9ds3AAAA:8 a=NEAV23lmAAAA:8 a=d70CFdQeAAAA:8 a=Q4-j1AaZAAAA:8 a=00pfXFynOhnmMW_j94IA:9 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=NcxpMcIZDGm-g932nG_k:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-AuthUser: michael.opdenacker@rootcommit.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 15:59:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228065

Hi Mathieu

On 12/17/25 15:50, Mathieu Dubois-Briand wrote:
> On Wed Dec 17, 2025 at 1:17 PM CET, Michael Opdenacker via lists.openembedded.org wrote:
>> From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
>>
>> These changes update alsa-lib, alsa-utils, alsa-tools
>> and alsa-ucm-conf to the latest version: 1.2.15
>>
>> Michael Opdenacker (5):
> Hi Michael,
>
> Thanks for your patch.
>
> Based on the discussion on the other thread, you are probably already
> aware of this, but just to confirm: this is failing with musl:
>
> ERROR: alsa-lib-1.2.15-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/alsa-lib/1.2.15/temp/run.do_compile.644079' failed with exit code 1
> ...
> | ../../../sources/alsa-lib-1.2.15/src/ucm/ucm_exec.c: In function 'uc_mgr_exec':
> | ../../../sources/alsa-lib-1.2.15/src/ucm/ucm_exec.c:263:17: error: implicit declaration of function 'close_range' [-Wimplicit-function-declaration]
> |   263 |                 close_range(3, maxfd, 0);
> |       |                 ^~~~~~~~~~~
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/2885
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/111/builds/1605
Thanks for the confirmation!
Fortunately, upstream already has a fix for this issue:
https://github.com/alsa-project/alsa-lib/commit/a068cf08ad67447893b707cddfce31c9cafee643

I'm preparing a V2 for your robots to test :)
Thanks again
Michael.

-- 
Michael Opdenacker
Root Commit
Yocto Project and OpenEmbedded Training course - Learn by doing:
https://rootcommit.com/training/yocto/


