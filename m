Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.52992.1795438601007638395
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2026 04:56:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=MQyAHkJm;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4F2DA4E41648;
	Mon, 23 Nov 2026 12:56:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2084E601E1;
	Mon, 23 Nov 2026 12:56:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A77DA11E6A39F;
	Mon, 23 Nov 2026 13:56:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795438594; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=bhdBo/C8mdsUTNlsAZRskUEU/UpOd8zM0st1bMeSKYA=;
	b=MQyAHkJmfe1zbMxhJyrpmBqvnkpHSplzE5ueLUIzTfetcEUjo6r+lxsx+XY1yk2idA6m6t
	UDlCtMHUevCggkI4os3pJNa2tK7qW8Tv8UBVesSAT87B6IA0W28y8k4xwfljNGEBYpmXP5
	o7zyZlAXN++E8xf1JLqgOo+M7K8zN3Gmafsx6qt0J5BqTrVTIXbspwCRebynveyHLRCoNF
	J4Eb3Zm24CR7Xb0vbLb2fA/eF6WMNjgyJJjn9nRAeR0tVI1vpvDiaeO0e6BI4y9uULPmrz
	8R75nZyY3YBwoyas1I3PxlGYvkOb2RiiNjvnjmUG9+6jYHrvm1uyBx2UzpaUIQ==
Message-ID: <8089c4b0-5859-4aa5-b428-8a27e7ff43f6@bootlin.com>
Date: Mon, 23 Nov 2026 13:56:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [blacksail][PATCH 1/2] expat: fix CVE-2026-118370
To: Yoann Congal <yoann.congal@smile.fr>,
 openembedded-core@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com, bastien.jauny@smile.fr
References: <20261118103042.1825679-1-joaomarcos.costa@bootlin.com>
 <20261118103042.1825679-2-joaomarcos.costa@bootlin.com>
 <DN2K3RFII8U3.WN02UT4CKQVP@smile.fr>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <DN2K3RFII8U3.WN02UT4CKQVP@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 23 Nov 2026 12:56:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250913

Hello, Yoan

On 11/23/26 12:33 PM, Yoann Congal wrote:
> On Wed Nov 18, 2026 at 11:30 AM CET, Jo=C3=A3o Marcos Costa (Schneider =
Electric) wrote:
>> This vulnerability, marked as High [1], was fixed upstream [2] since
>> 2.10.0.
>>
>> Backport the fix to expat v2.8.3.
>>
>> [1] https://nvd.nist.gov/vuln/detail/cve-2026-118370
>> [2] https://github.com/libexpat/libexpat/pull/1450
>>
>> Signed-off-by: Jo=C3=A3o Marcos Costa (Schneider Electric) <joaomarcos=
.costa@bootlin.com>
>> ---
>>   .../expat/expat/CVE-2026-118370-01.patch      | 58 +++++++++++++++++=
++
>>   .../expat/expat/CVE-2026-118370-02.patch      | 29 ++++++++++
>>   meta/recipes-core/expat/expat_2.8.5.bb        |  2 +
>>   3 files changed, 89 insertions(+)
>>   create mode 100644 meta/recipes-core/expat/expat/CVE-2026-118370-01.=
patch
>>   create mode 100644 meta/recipes-core/expat/expat/CVE-2026-118370-02.=
patch
>>
>> diff --git a/meta/recipes-core/expat/expat/CVE-2026-118370-01.patch b/=
meta/recipes-core/expat/expat/CVE-2026-118370-01.patch
>> new file mode 100644
>> index 0000000000..aa4fe2df28
>> --- /dev/null
>> +++ b/meta/recipes-core/expat/expat/CVE-2026-118370-01.patch
>> @@ -0,0 +1,58 @@
>> +From a135244f77776c56d825cd81efd8f98abe014841 Mon Sep 17 00:00:00 200=
1
>> +From: Sebastian Pipping <sebastian@pipping.org>
>> +Date: Tue, 27 Oct 2026 15:20:33 +0100
>> +Subject: [PATCH] lib: Protect `attIndex` in `storeAtts` from signed i=
nteger
>> + overflow
>> +
>> +.. by migrating to `size_t`
>> +
>> +CVE: CVE-2026-118370
>> +Upstream-Status: Backport [https://github.com/libexpat/libexpat/pull/=
1450]
>=20
> Hello,
>=20
> I'll take this patch for now but, please, in the future:
> Either import the whole pull request as one patch or reference the
> commits in Upstream-Status: Backport.
>=20
> For example, this one is https://github.com/libexpat/libexpat/commit/1b=
ac53c4fc460a03cd9860f39501c7979f6750ae.
>=20
> Thanks!

Sure, I'll note this down. Also, I will fix this here if ever there's a=20
need for a v3.

--=20
Best regards,
Jo=C3=A3o Marcos Costa

