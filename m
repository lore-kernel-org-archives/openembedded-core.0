Return-Path: <atharvanandanwar@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A37CCF6495
	for <webhook@archiver.kernel.org>; Sun, 29 Sep 2024 22:46:55 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.92.22.102])
 by mx.groups.io with SMTP id smtpd.web11.42570.1727650006790077669
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Sep 2024 15:46:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=IvloLmvA;
 spf=pass (domain: outlook.com, ip: 40.92.22.102, mailfrom: atharvanandanwar@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GlGW/GMIqKhoM408KJyL9Ri69VwFhAQtaHZPxQG+hJBkkKC31PcqyemFbEugS58AiWP1DRVP0AKJ8DA49pqoNH/KGMsv1W4DLPZxFzsAc1mTDWFqa8JPGG3jFANdnfAstv+StvpuyvOUQ9Aah9YLDNiKvAGSUgBW3VAaLPx8995wZYPUlW78MZcKibPTBgjCTO606lE0Nfd1S6HMibF6kSEiu9CtR8yW9VG/XDzhzpR4QwGycv7EgwrUZxuA34yBxH6/NLBU9smXT+03k33Xl/0rDODoQr1VAwE7Q6j/Z8RI2eWxYAv3xLvdwExEYowGFNSPAfdL75xluvQukxvFHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ibbCBQNpPZaqboTDK6Yn8KR1qXalIxayOvrXXkrqb8U=;
 b=w5yjPetl1Un8xi14kkyhXkhQQuLMxCfNokSQfRm8TwqvGoQXqaE3AhL9Z/Op/KtIoHWtjDE5LAwiL82w9FikwwmeBZhX0Pf2p0f7taQNKz0dTjFuZZhvvqsjiMIrWv2MGHe7X1PIgo2TpJ4bSkC0VErabi3l6/m83vSjNBSjKnqwJW12pPKW+0ZHhVMTbEsczM01UNewbgaZcjFbSkTCYWQQkH/wSndFDgyBpp7gsyHHPQm8P4x7a66Zd1BnG54D7klAWdRYA/dXY4+Gy5cKluvzZlUJx1zVcELLCvkKHaOiCmMcdqzPbJKoed+PBHn1tUNDNJ84SsLBMTc13gwCxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ibbCBQNpPZaqboTDK6Yn8KR1qXalIxayOvrXXkrqb8U=;
 b=IvloLmvAWXu9q1+9IpE/dvGCaJjUJHwIFzpoZrfMVV0flsYTtHGZEn9erQVsTttTE+tw3St5/UJ6MGBFtoN1IDGB2VphBrKyfu1F7OHZHaTQ8yfaEd70TuNoqkicDaTqhsNUF4GNKHdWi4zsso2v4xVGB88zZievO9SfN1KMyR1GQP6HgBMBo9zfQBo/ZMEfSbzHq5ZiMXxOE8SWjwq20JwndGK5TFZq3AAajm8BwlGZ445l/U5iB1Rs//VcRHv+D1U2gPJ2AfBzIu+yOspuRqyB15h6MD7J5/4zFO0s5Rj/9Mfwj8fUXKcxZPFVKfNuScgCz2ADMNKhQBrDwp2BRA==
Received: from SA1P223MB1187.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:3e8::8)
 by EA2P223MB0933.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:259::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Sun, 29 Sep
 2024 22:46:44 +0000
Received: from SA1P223MB1187.NAMP223.PROD.OUTLOOK.COM
 ([fe80::654a:203f:c17c:d184]) by SA1P223MB1187.NAMP223.PROD.OUTLOOK.COM
 ([fe80::654a:203f:c17c:d184%3]) with mapi id 15.20.8005.024; Sun, 29 Sep 2024
 22:46:44 +0000
Message-ID: <SA1P223MB11879950298340E9B6F0DD73CB752@SA1P223MB1187.NAMP223.PROD.OUTLOOK.COM>
Date: Sun, 29 Sep 2024 17:46:43 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [master][PATCH] meta-toolchain: inherit nopackages
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <SA1P223MB1187C93538CD6219C8C10402CB752@SA1P223MB1187.NAMP223.PROD.OUTLOOK.COM>
 <2bd45ff2788e33784e47a6c3c9d0faab2ca05380.camel@linuxfoundation.org>
Content-Language: en-US
From: Atharva Nandanwar <atharvanandanwar@outlook.com>
In-Reply-To: <2bd45ff2788e33784e47a6c3c9d0faab2ca05380.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: CH2PR07CA0003.namprd07.prod.outlook.com
 (2603:10b6:610:20::16) To SA1P223MB1187.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:3e8::8)
X-Microsoft-Original-Message-ID: <2f8520d8-b2ce-44aa-9f0d-89ce82a0f003@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1P223MB1187:EE_|EA2P223MB0933:EE_
X-MS-Office365-Filtering-Correlation-Id: 3880a633-4cc7-495f-4e1c-08dce0d897cc
X-Microsoft-Antispam: 
	BCL:0;ARA:14566002|5072599009|8060799006|6090799003|19110799003|461199028|7092599003|15080799006|440099028|3412199025;
X-Microsoft-Antispam-Message-Info: 
	9rZgSyWDH77YbeFqW+dNGOaklmL0rLIUvHmZRKYpNVI1BIUldyBnQWeTYAXoxuNHXoxP6XjYPdO4TR9WnJrAgQnM7MCxwUaNzGwLvXVOoqzQNs7SDrZecYaJEb0c2tZZSc9X5BtETvcUV4neRU9lnGPC25ao+5/3xFlYTZ25hqPtRlsQCsV9MFSefBCRpa2oZr17S3uhruAX0foQmnIl6w55G3pbvGlGAFlzkM75iYqHa+v/5QZFzwJlvYKNzJFqYzm9Tz2EV+v2xKwXQdpyBoLc3ivZgf2DdB8kU8Z51q5fF2+r4hAhz+vhifjbGWqs1P2YlRj9nLYVQSMMo9iadVuQEJb1nWJW1Pl44nNw+oerHx2pMW8fiGwFv4KDkPzUfo11dChHve65EqVum/vdYhn12TRdzOD2zqNWWOjjNGX9XDycIlYAr+SzIbtEbwC1GQJqyHrQvoJRfc4nbPUcygJjMqfpcdOMO3F43Dfz+jv/aene6v1hzY6Zxs8ZEUTd/wRLX3ZMa4OgsYM6LNYxaoUpiOXyM4DLfF0kCrDWtv6wYkx7bMxqm8NuSFF7jZHzai0U6sl6cIt9STrpmYvaruiUzFhh1YZXzSHyI2ZUkWESuf3dDJI16ryRSQhGbhk+39NFwJvU+lNhBjyBEBcu/I4XIqtMoG8GJo/zW0hKrk3p+m2LsokIGcH890QrPLNCHWeIN7ZTP0Xu2WLkLoq4I6bx+b5S5O2E2+jt6t7LtcSsYY03VIl2p9ZvWQcaD4uL+pnyme/8v3GvU81GW97kEQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ltkWyw5id/GPp23BQtm6Qk7UQbkTC6mg14TqA/PG967eI4Zyj0ROPYxrWSxm?=
 =?us-ascii?Q?6iqwRkHUoy/2kTgndY5ZStEBvYbOtJCUbNl0HSuJCfUYQ0RIVyE9I0YBnWn3?=
 =?us-ascii?Q?8nIc9+BJLZjNq0lwrHgm4wE0XFP36Ghee6EXwtL5HWEzyr6YpJIOt3ojWDOs?=
 =?us-ascii?Q?/uy2kQrs4M7/OsL2gei10NB1Rr1RFDgKS0npWE/BbAdMNyd/hG/+MGRURwpJ?=
 =?us-ascii?Q?2C/JWVLHUFYXWg17e99keDqR8yM/5zueCk5TFq9mvvLIUflPPeFAJMQVgnBu?=
 =?us-ascii?Q?GehaiVvJRMgeb3osnp4NDD1le/60XGNtezYez+cnKTHvUpVqN9JWwivs3HoG?=
 =?us-ascii?Q?H7pkyREyMOUavGdCWcHcR+6Kb1TsLOgKmI64lKjdWoAl0C+Wl6bEcgqdgKZV?=
 =?us-ascii?Q?NksGs5Po8XJMeamMMXeqalUmoxoI4/VPNN1EHJqVx9ZLSG+DQmwyg1YGjC9C?=
 =?us-ascii?Q?zNfAX27JLurWFjsJevBgDrzIQti+8hBEXEvdvtnpbxV9yOfn88M68pA46UHq?=
 =?us-ascii?Q?GtJUijYyJzQ/CxhDuEdydAP0BQVMZ8FlCXvdTErOz9neEQV6cdQ/DOdgoIEi?=
 =?us-ascii?Q?EPnR/m3MFCQAJWi9d38UstA0Y+32l5zDvS7mzR9dc8D76MkQYZFjX8MkSeCD?=
 =?us-ascii?Q?kTjgBnt5KfkYMyrJYLKkiMSFE7EN4AjmW5dILLOuapUrEz+dwLZq4NFnw8NS?=
 =?us-ascii?Q?9sDC3yo9UVHixrr98Lt1ylo2cG8ftbmb1nXvJ9/N1to+W5CarBSXm+FwHG5n?=
 =?us-ascii?Q?Q++zG8nYcLZsMLe3DGxY7OrILFXCRTGuAaVFHdkbYvZ0h9CR2fC4oxCH6RFH?=
 =?us-ascii?Q?bYH0U+D3vJw11WsjxKK9Q3MQ7o3aq3w+4OhZvD71aTGz2W2jBsSN6KK0YfIt?=
 =?us-ascii?Q?hqmh53urXSx89Pc9WhY/ll06f8fs8y+EAiheL/54ep/g3jp18yMtmD/HO8HG?=
 =?us-ascii?Q?KBIlPLCbLJwmeNw291LTXWRPaMABmyt+pLYPilo2qRn9Mp9Hs28KUztRznxK?=
 =?us-ascii?Q?8DdBXTDbagCKEn3wyM0hAAeT5wJbgOeUWSDskK/0dw/JvRQjjteVWVb7QXmN?=
 =?us-ascii?Q?Asqfhpl6FVw813nVrCAgTraV8JOkplo57pMqsR+44YSymkv7qguHXf6Q5Tda?=
 =?us-ascii?Q?71xPO0ZLfXITmcnCUl31kdO7cTbkq6Nzh8sTtkCl10L7VoWwkJXOAwI8JVdu?=
 =?us-ascii?Q?6bPJ9ozGfFD0NBHxywzZXsIMdcyswAtnIUa9g1VDOgAmbUjmI4qZG6s5mRSc?=
 =?us-ascii?Q?TzanN420+k993Fx5YOnx?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3880a633-4cc7-495f-4e1c-08dce0d897cc
X-MS-Exchange-CrossTenant-AuthSource: SA1P223MB1187.NAMP223.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2024 22:46:44.7320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA2P223MB0933
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Sep 2024 22:46:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205061

On 9/29/24 16:57, Richard Purdie wrote:
> On Sun, 2024-09-29 at 13:55 -0500, Atharva Nandanwar via
> lists.openembedded.org wrote:
>> From: Atharva Nandanwar <atharvanandanwar@outlook.com>
>>
>> - buildhistory emits hard error when no files are present in
>> =C2=A0 package-split.
>> - meta-toolchain doesn't install/package any files, hence inheriting
>> =C2=A0 nopackages should allow building this recipe again
>>
>> Signed-off-by: Atharva Nandanwar <atharvanandanwar@outlook.com>
>> ---
>> =C2=A0meta/recipes-core/meta/meta-toolchain.bb | 2 +-
>> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/meta/meta-toolchain.bb b/meta/recipes-
>> core/meta/meta-toolchain.bb
>> index 260e03934e..c97cc68ad4 100644
>> --- a/meta/recipes-core/meta/meta-toolchain.bb
>> +++ b/meta/recipes-core/meta/meta-toolchain.bb
>> @@ -2,4 +2,4 @@ SUMMARY =3D "Meta package for building a installable
>> toolchain"
>> =C2=A0LICENSE =3D "MIT"
>> =C2=A0
>> =C2=A0
>> -inherit populate_sdk
>> +inherit nopackages populate_sdk
> This shouldn't be needed on master since:
>=20
> meta/classes-recipe/populate_sdk_base.bbclass
>=20
> has:
>=20
> inherit image-postinst-intercepts image-artifact-names nopackages
>=20
> Cheers,
>=20
> Richard

That makes sense.

Looks like we need [1] on scarthgap and kirkstone. As the buildhistory patc=
h made it's way onto those branches.

1 - 29ac598c4f754ce5cee59d3360612f661ad02191

Thanks,
--Atharva

