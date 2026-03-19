Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E79181091909
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 18:17:23 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2812.1773944237244549257
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 11:17:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=tRuXC5HO;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 164D5C5507F
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 18:17:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0774860050
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 18:17:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CE4F610450A6D;
	Thu, 19 Mar 2026 19:17:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773944234; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=eMlaLzK41ygcfRmfSh3ARxLQfFL/CyZgkQsZFCgyouQ=;
	b=tRuXC5HOvC0Er4LUOXVu8CP3KbLZuReRZcC+j51qp3u3a1q3LWynRFUAIqnNMKH/Ea8YaT
	mRu4Mu158WSS2yT/GeFQIUEOFb6KMpaO3sj8s8fxuucL/9rxVa2CxvtN3La70XPCJfvjJn
	/+AmcGGkqSTGF6uDkrBbFYCOsgVJG6SaImEkRLytnoSLb7t6M2IvFYrXbBJfELAnx12xSq
	u14DZ+x5FNeby4qBvD4CwUuQbxxVKd129xPMbksiSrneu9YER2cZ1cWGRg+Ppj55zzYJE6
	wRMCPu+J4qSvXjhGGOn1NytWIHvbQPf/vcCJ3xZUm5Ck36kmJd/dVscd35SfAA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Mar 2026 19:17:13 +0100
Message-Id: <DH6YQYC6H8Z2.2B8KJW0XH6SI@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Joao Marcos Costa" <joaomarcos.costa@bootlin.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] ltp: fix warning in
 remove_broken_musl_sources
Cc: <thomas.petazzoni@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260319132904.1308436-1-joaomarcos.costa@bootlin.com>
 <DH6XX5V3YO6B.2PRKV55NZP37I@bootlin.com>
 <78bcbd97-e691-4381-9312-bae0fe0ebf73@bootlin.com>
In-Reply-To: <78bcbd97-e691-4381-9312-bae0fe0ebf73@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 18:17:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233547

On Thu Mar 19, 2026 at 6:55 PM CET, Joao Marcos Costa wrote:
> Hello,
>
> On 3/19/26 18:38, Mathieu Dubois-Briand wrote:
>> On Thu Mar 19, 2026 at 2:29 PM CET, Joao Marcos Costa via lists.openembe=
dded.org wrote:
>>> If this was originally intended to be an actual warning, it was not
>>> behaving as such: echo only prints to log.do_patch, so the message ends
>>> up hidden there.
>>>
>>> Replace 'echo' by bbwarn to display the warning message correctly.
>>>
>>> Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
>>> ---
>>=20
>> Hi Jo=C3=A3o,
>>=20
>> Thanks for your patch.
>>=20
>>>   meta/recipes-extended/ltp/ltp_20260130.bb | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-extended/ltp/ltp_20260130.bb b/meta/recipes-e=
xtended/ltp/ltp_20260130.bb
>>> index 75c5b8b7bd..36432c15b2 100644
>>> --- a/meta/recipes-extended/ltp/ltp_20260130.bb
>>> +++ b/meta/recipes-extended/ltp/ltp_20260130.bb
>>> @@ -126,7 +126,7 @@ remove_broken_musl_sources() {
>>>   	[ "${TCLIBC}" =3D "musl" ] || return 0
>>>  =20
>>>   	cd ${S}
>>> -	echo "WARNING: remove unsupported tests (until they're fixed)"
>>> +	bbwarn "remove unsupported tests (until they're fixed)"
>>=20
>> So I believe this will add a WARNING on all musl builds, right? I'm not
>> sure we can really accept that.
>>
> Yep, it will. Would an INFO/NOTE be acceptable instead?
>
> Thanks!

Yes, I believe info or note are acceptable.

Thanks,
Mathieu


--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


