Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93E631091904
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 17:55:43 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2459.1773942940900991648
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 10:55:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=fn4LlTTU;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E9F3F4E4271F
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 17:55:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B17A060050
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 17:55:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5E7B410450941;
	Thu, 19 Mar 2026 18:55:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773942938; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=SGG6Wa9jdkR6wJKiAzKUiDNaXctkhEQVbwfQ7vyCk28=;
	b=fn4LlTTUQzYe1BPNZ2sD+QMaAzAd+GhdC5N/SzKmfSuwy8nsr5NTdhE4MbQC9i1N3yrj39
	cowOfSM0vukWwmnYhWAx8GRyCO+kdClCyu8GZzGBRkv3xAH2Vwg39fE3z6qmc6k2Gy/a96
	3o1FBUs78IrTYxwHqd6Q14WInHm7jCyjbJrCIyd5NZcz4Yy/TEOuZiCx17lEK76EE3G7+a
	hE7a6+S5Iw3vdspnxb6XCycAEf0yNNDlsyFSq5IqfsRJN4Cp1yIb/gGy61z15ztIZL5Amn
	JxwiTIYXgMw1RZp4nkyLRRHRA3swhVeBpo7HVckPBXnvsx1Epjc3gayh3o9EMQ==
Message-ID: <78bcbd97-e691-4381-9312-bae0fe0ebf73@bootlin.com>
Date: Thu, 19 Mar 2026 18:55:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] ltp: fix warning in remove_broken_musl_sources
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com
References: <20260319132904.1308436-1-joaomarcos.costa@bootlin.com>
 <DH6XX5V3YO6B.2PRKV55NZP37I@bootlin.com>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <DH6XX5V3YO6B.2PRKV55NZP37I@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 17:55:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233546

Hello,

On 3/19/26 18:38, Mathieu Dubois-Briand wrote:
> On Thu Mar 19, 2026 at 2:29 PM CET, Joao Marcos Costa via lists.openemb=
edded.org wrote:
>> If this was originally intended to be an actual warning, it was not
>> behaving as such: echo only prints to log.do_patch, so the message end=
s
>> up hidden there.
>>
>> Replace 'echo' by bbwarn to display the warning message correctly.
>>
>> Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
>> ---
>=20
> Hi Jo=C3=A3o,
>=20
> Thanks for your patch.
>=20
>>   meta/recipes-extended/ltp/ltp_20260130.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-extended/ltp/ltp_20260130.bb b/meta/recipes-=
extended/ltp/ltp_20260130.bb
>> index 75c5b8b7bd..36432c15b2 100644
>> --- a/meta/recipes-extended/ltp/ltp_20260130.bb
>> +++ b/meta/recipes-extended/ltp/ltp_20260130.bb
>> @@ -126,7 +126,7 @@ remove_broken_musl_sources() {
>>   	[ "${TCLIBC}" =3D "musl" ] || return 0
>>  =20
>>   	cd ${S}
>> -	echo "WARNING: remove unsupported tests (until they're fixed)"
>> +	bbwarn "remove unsupported tests (until they're fixed)"
>=20
> So I believe this will add a WARNING on all musl builds, right? I'm not
> sure we can really accept that.
>
Yep, it will. Would an INFO/NOTE be acceptable instead?

Thanks!

--=20
Best regards,
Jo=C3=A3o Marcos Costa

