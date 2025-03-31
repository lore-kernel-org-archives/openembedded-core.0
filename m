Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3616BC3600C
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 09:04:40 +0000 (UTC)
Received: from beige.elm.relay.mailchannels.net (beige.elm.relay.mailchannels.net [23.83.212.16])
 by mx.groups.io with SMTP id smtpd.web10.47674.1743411874478864669
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Mar 2025 02:04:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@rootcommit.com header.s=hostingermail-a header.b=kkWYxCVZ;
 spf=pass (domain: rootcommit.com, ip: 23.83.212.16, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id B41C921895;
	Mon, 31 Mar 2025 09:04:33 +0000 (UTC)
Received: from uk-fast-smtpout8.hostinger.io (100-122-87-180.trex-nlb.outbound.svc.cluster.local [100.122.87.180])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 7AAAC22F53;
	Mon, 31 Mar 2025 09:04:32 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1743411873; a=rsa-sha256;
	cv=none;
	b=GvtbrAmyr5kaYEXWTOpLN6UIYH/HxkQHMXDwYJx6z6Hknuen7i92EKomAgxhQ10gBBaIu/
	foSVdHq+2zFVF45tNx3izP2SHe/yY3p+MIkolze5da3KCYte6HRF5khi2ut3woLbV1DsRX
	u7eXy06EcqohJD7/JvfmZgPYMGwK0NS6qIbwY2LCHAn/612WtTMUnwyaI4FFv/rTygA1CG
	56vNVIK8nMp07IThasXpFb7PIQPUts02iC3HqbV23CSpBI6pDFTXzdJkMo9Glp82XIPjTt
	/zu2YwrNJwdq5hoipItl6KfYDklEDSSP4BS15/inm3ODwA/jWtzasnoDeEP12g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1743411873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=YSZNskl8bxTyWuTytmXYCdafUTUlAvcWAZZTqUDxmKc=;
	b=U98W4j13zzk1eYtVIHu761c4XAQ2KPy9j23/9bwhY9DV/b1C1qJ4sUgb7vlefjB8N9FZBa
	J5scTSGAuVhQvc7/Tle3XPa4joCfzNQg/ZxGWL/s7v776HkHQ8nqmfjBnRlS1M2yiVphgl
	WJnTc+V7EjFHrI7hSYqUIwX+5WlhgqqVJQ84g8VqmEfJ1fJpRQL3Leha+zEB8zZjGb+Tsi
	3O88TB/P7a+JvH4x0BISzTy/ieFLHLZ/Z2SScFY/LOuN8cvmhrGz4tBN45C0YpTf+Wyv80
	ZSKG30zn+8T+tc98ChokIDzqny9+odnkP9VJaoMs3Pxrq8Oa3rtXIC603SP6rA==
ARC-Authentication-Results: i=1;
	rspamd-7668cf9b8d-6g2fc;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Broad-Supply: 0ee67f1459a7dcc4_1743411873499_258448160
X-MC-Loop-Signature: 1743411873499:952363071
X-MC-Ingress-Time: 1743411873499
Received: from uk-fast-smtpout8.hostinger.io (uk-fast-smtpout8.hostinger.io
 [31.220.23.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.122.87.180 (trex/7.0.2);
	Mon, 31 Mar 2025 09:04:33 +0000
Received: from [IPV6:2001:861:4448:6b00:7a4f:12e0:633c:2779] (unknown [IPv6:2001:861:4448:6b00:7a4f:12e0:633c:2779])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4ZR4vL1HkGzPJR1;
	Mon, 31 Mar 2025 09:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1743411870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YSZNskl8bxTyWuTytmXYCdafUTUlAvcWAZZTqUDxmKc=;
	b=kkWYxCVZHdxF99LLnA0FZ8opkpz2UfIhvFJG/2QlTO4qWRtkfaqH95dthDDeyanQlDkjvH
	LKcGdo30+c/GyO1DuqsOnymWrK/2UkjVY6Xjfn0URhk/nRggCANiuc0utMg16ZMPCcpHG6
	DcXXUbNGiFSExgnJkyN69oduEkWbz6OWVDPi48UiyTpVUNAl06ReL1aSQd4dzvp2DHv1qa
	2uPmTWniLmU3zxDyF0pTyElEPe9Q2LbnaU6jjbbTtbBVkyMUN6pMWnRQV8BHzkCtK3Tgi6
	jUGF97V/JXkgGgfWID0lWJBBwwrvv5fdap/a/GXXas7kWnyYsVpZv7HsjZVHQA==
Message-ID: <9383bebb-1d07-42a8-8507-68942ff4175e@rootcommit.com>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com, Peter Marko <peter.marko@siemens.com>,
 Ross Burton <Ross.Burton@arm.com>
Subject: Re: [OE-core] [PATCH] flac: upgrade 1.4.3 -> 1.5.0
To: Quentin Schulz <quentin.schulz@cherry.de>,
 openembedded-core@lists.openembedded.org
References: <20250328215955.95519-1-michael.opdenacker@rootcommit.com>
 <0d0a738b-3b3a-4d23-99f8-c0a6de9bf48d@cherry.de>
Content-Language: en-US, fr
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <0d0a738b-3b3a-4d23-99f8-c0a6de9bf48d@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Date: Mon, 31 Mar 2025 09:04:30 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=IrhMc6/g c=1 sm=1 tr=0 ts=67ea5a9e a=db7wCwZ3UdhLoi5XMkDLFg==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NEAV23lmAAAA:8 a=L2IpWlmwAAAA:8 a=d70CFdQeAAAA:8 a=Q4-j1AaZAAAA:8 a=a_U1oVfrAAAA:8 a=7CQSdrXTAAAA:8 a=VK7TbhCf3FJ5znGgS8EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=-4oddg63ZTIA:10 a=yxSZtuE-OvTTNxukw10G:22 a=NcxpMcIZDGm-g932nG_k:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-CM-Envelope: MS4xfOaVUz5LJXvL10rM2O89C8NQUbfXNBU+HPVf6APtFIRu6IP5Rk5H23nmBvm0vopbwnLiYXLwqV1WHjbH7vFevWj7YPoSV2ZLfa36sK89/t5QEhlp/vcR UwVWxMyVoFvDMc0cWp4bTHveoAXMU+AaFGBeONDMaUA4110xTuXHWTYuZeoh5xd0H6WZUXubuBPNnRno62duec1hb/3G7beLK9uPFyvxLVGSnGvu/XFY1FA0 rb/UHVSwqvE8h4Yve0cbvw/BCW2PpnR3a3szacb7Aq0PjEjbyNW8eMTbtS0IIZndbrbVFeYnFHEFuzes0MvAbf9fYkUImtirQ5KYtZPA6uXSpoiW47dU9fet GcjR1DvDRdNarL14sPj9td48eYhhgiaOBPmVHDO03pj2QxFjRoiWJyTtqr8whBC4Al37TSH7fuVmGHdjLhcmNMVOlHk65L+JxW29RWOKnVM3MgyG6tM6zBb8 shO0IklqqyrwF928o9jRpR2NzWHZVJuXlXmCMQ==
X-AuthUser: michael.opdenacker@rootcommit.com
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 09:04:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213953

Hi Quentin
Thanks for the review!

On 3/31/25 10:55, Quentin Schulz wrote:
> Hi Michael,
>
> On 3/28/25 10:59 PM, Michael Opdenacker via lists.openembedded.org wrot=
e:
>> From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
>>
>> License-Update: GFDL 1.2 -> 1.3, copyright years update
>>
>> Add patch that fixes a new documentation generation issue in 1.5.0
>> https://github.com/xiph/flac/pull/824
>>
>> Remove the check for NASM, no longer used in 1.5.0
>>
>> Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
>> CC: Peter Marko <peter.marko@siemens.com>
>> CC: Ross Burton <Ross.Burton@arm.com>
>> ---
>> =C2=A0 ...n-replace-modules.html-by-topics.htm.patch | 45 ++++++++++++=
+++++++
>> =C2=A0 .../flac/{flac_1.4.3.bb =3D> flac_1.5.0.bb}=C2=A0=C2=A0=C2=A0=C2=
=A0 | 20 +++++----
>> =C2=A0 2 files changed, 56 insertions(+), 9 deletions(-)
>> =C2=A0 create mode 100644=20
>> meta/recipes-multimedia/flac/flac/0001-API-documentation-replace-modul=
es.html-by-topics.htm.patch
>> =C2=A0 rename meta/recipes-multimedia/flac/{flac_1.4.3.bb =3D>=20
>> flac_1.5.0.bb} (70%)
>>
>> diff --git=20
>> a/meta/recipes-multimedia/flac/flac/0001-API-documentation-replace-mod=
ules.html-by-topics.htm.patch=20
>> b/meta/recipes-multimedia/flac/flac/0001-API-documentation-replace-mod=
ules.html-by-topics.htm.patch=20
>>
>> new file mode 100644
>> index 0000000000..31ca645c27
>> --- /dev/null
>> +++=20
>> b/meta/recipes-multimedia/flac/flac/0001-API-documentation-replace-mod=
ules.html-by-topics.htm.patch
>> @@ -0,0 +1,45 @@
>> +From 6ad5b6a9ce81383ef75e6f7b88f54d3c29294e63 Mon Sep 17 00:00:00 200=
1
>> +From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
>> +Date: Sat, 15 Mar 2025 11:50:08 +0100
>> +Subject: [PATCH] API documentation: replace modules.html by topics.ht=
ml
>> +
>> +This fixes the issue reported on
>> +https://lists.xiph.org/pipermail/flac-dev/2025-February/006696.html
>> +
>> +Newer Doxygen versions call what was previously api/modules.html
>> +api/topics.html instead.
>> +
>> +Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
>> +Suggested-by: Christian Weisgerber <naddy@mips.inka.de>
>> +Upstream-Status: Submitted [flac-dev@xiph.org]
>
> https://github.com/xiph/flac/pull/824 so we can follow its status easil=
y?

Good idea. I overlooked the possibility to add a link in Upstream-Status.
Thanks
Michael.

--=20
Michael Opdenacker
Root Commit
Yocto Project and OpenEmbedded Training course - Learn by doing:
https://rootcommit.com/training/yocto/


