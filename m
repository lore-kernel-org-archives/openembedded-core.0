Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55C7DD37E30
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 13:14:45 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9582.1768396474831622908
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 05:14:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=y6VcLB1P;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BF2264E420D1;
	Wed, 14 Jan 2026 13:14:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 95E4E6074A;
	Wed, 14 Jan 2026 13:14:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3535310B68240;
	Wed, 14 Jan 2026 14:14:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768396472; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BFwZl9SOmTpeo7scSP0PS3cOmbHTMgeLQ6i2NLTOaJA=;
	b=y6VcLB1P2Hkz+HXPBjmdubNtUSAgfiizSk+akh5KLGYRin+xRUCywPmGVJb6SzpaXiNsfP
	r1xW4XszoHskMY2jxw6vfrAfdcTOasjdU4Cj2bPYe3sypBC5RQnvoBocdhviKpyRLcbt8x
	1smCYzGx8tZSDxVBX/QlaLdYQff2s3f6+8iw/jQVC+0xYz1eAGa0bw4VXTKBSE00736eNj
	RNhlSB2+Hsmz3ZZyLW93LAXvCcNiNW2M836BBSYuaf/Ti22wBNsn7COl2w5fO8jcZ6lJKN
	24ncSFVHg/Ejo8pV1lxJKJbz7LAUG6eAUioGd+pCXkL3197rFL2/BFMII2R4AQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Jan 2026 14:14:28 +0100
Message-Id: <DFOC8AGS18O9.1ZYDSEZ54MXQZ@bootlin.com>
Subject: Re: [OE-core] [PATCH v2] devtool: clean up debug build
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <hongxu.jia@windriver.com>, <openembedded-core@lists.openembedded.org>,
 <mathieu.dubois-briand@bootlin.com>, <adrian.freihofer@gmail.com>
References: <18880B4F565039AF.2355985@lists.openembedded.org>
 <20260110075429.2119759-1-hongxu.jia@windriver.com>
 <DFMJM47EDV3L.2NZJ8NWYZQWCF@bootlin.com>
 <67f4730d-fd6c-42d6-a6be-267bbd6caa2b@windriver.com>
In-Reply-To: <67f4730d-fd6c-42d6-a6be-267bbd6caa2b@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 13:14:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229326

Hi,

On Tue Jan 13, 2026 at 3:56 AM CET, hongxu via lists.openembedded.org wrote=
:
> On 1/12/26 18:36, Antonin Godard wrote:
>> CAUTION: This email comes from a non Wind River email account!
>> Do not click links or open attachments unless you recognize the sender a=
nd know the content is safe.
>>
>> Hi,
>>
>> On Sat Jan 10, 2026 at 8:54 AM CET, hongxu via lists.openembedded.org wr=
ote:
>>> Due to we rework debug friendly optimization, rename DEBUG_BUILD
>>> to DEBUG_OPTIMIZE. Then:
>>>
>>> - s/DEBUG_BUILD/DEBUG_OPTIMIZE/g
>>>
>>> - s/debug-build/debug-optimize/g
>>>
>>> - s/debug_build/debug_optimize/g
>>>
>>> Note, for specific recipe, we do not use
>>>    OE_FRAGMENTS +=3D "core/yocto/debug-optimize"
>>> in recipe
>>>
>>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>>> ---
>>>   meta/conf/fragments/yocto/devtool-ide-sdk.conf |  2 +-
>>>   meta/lib/oeqa/selftest/cases/devtool.py        |  2 +-
>>>   scripts/lib/devtool/ide_sdk.py                 | 10 +++++-----
>>>   scripts/lib/devtool/standard.py                |  6 +++---
>>>   4 files changed, 10 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/meta/conf/fragments/yocto/devtool-ide-sdk.conf b/meta/conf=
/fragments/yocto/devtool-ide-sdk.conf
>>> index ca0269543b..f451b47713 100644
>>> --- a/meta/conf/fragments/yocto/devtool-ide-sdk.conf
>>> +++ b/meta/conf/fragments/yocto/devtool-ide-sdk.conf
>> I can't apply this patch as this file does not exist on master. Does you=
r patch
>> depend on another one?
>
> Based on master-next

Sorry, but I can't find a commit on master-next that creates
meta/conf/fragments/yocto/devtool-ide-sdk.conf. Can you please re-send the
series based off master?

Thanks,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


