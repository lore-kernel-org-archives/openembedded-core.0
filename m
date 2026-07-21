Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 808D2C4451C
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 09:01:23 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18173.1784624476895748921
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 02:01:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=ctWpLLud;
 spf=pass (domain: cherry.de, ip: 40.107.159.31, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rsLOfUdEWXGj9SU5/VquwannoINLD8v5X5kZBO42yKyMYYhH8kdiiV2oKWyCe/AauZfhSpjHpDL0wRcH31moX+MebOaaGDhMe8/ovXL4WUHhcQTNmua+EWr8HDyfUdkoEwegm18ZjOpKTIRn27jm31eKX7Bp0uf/O0mUV0360rwKmELUlgS7KkcmiOMas0Lg8tqUZ5ZYuuZ2MNaauLLGb/uRJXsNoIHRV7xCsdYe5gF8dOVjdC6JGwWwoOZgXVpft3uBijCLRMBxdtKsN8DSkFLXEy6/XyGDpd+YyV8ofCVODiB/HGBfRJhRuBnVh6l6cP6CSxQMwU927FHIH+y9Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9YPmO/qqWDAbRKRSUcLSmDW9juosl4Vvt+vk2NP/8Cs=;
 b=xv0jUYfjHpMjxviCD7zf/r671cYTSM74kOJZKBkVaEtSGzn5sFpLJvwb3/d7ai8U+fM7lq81zlCWVZjV88WJ7+r1iD450Khm1UCrMdfB0aS9nCoP1XUxDISJEYhxcA2lvkcVInnd/QxYq8kR4hOi07AuH2GtCdWknpl7d/dmYqNm2AC6sVaOahD3BRmAEBUMQwZbsTBccnoCIaRPoujE7Z2QrcOUjpmoXozqmFm05pZ4HJcMArQ+vzNQGZ3Jid3bLOtJxYhNBbeoFETH8wISK2iYLb6OruWVPOK+YYoLYXwDOOuz9Z4JmPPZGtYnoEdllFGPF/bvnkffNCnR0avlrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9YPmO/qqWDAbRKRSUcLSmDW9juosl4Vvt+vk2NP/8Cs=;
 b=ctWpLLudSbe3y3HdRcl2l6pjgn3AaKp3iAIgCD2hkVlRXt7nWvvgdNs5SzG4KeZdEkALuAj4a5weireAkCRRDo1Oc2m2wv4dclTI94cR3QxVQigQyhV/8stZsObVFFUjFDK6k+8C8/FbTTZkiOiUrDwRsQE9B34dZWA2QL4xU7w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by DBBPR04MB7836.eurprd04.prod.outlook.com (2603:10a6:10:1f3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Tue, 21 Jul
 2026 09:01:12 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0223.012; Tue, 21 Jul 2026
 09:01:12 +0000
Message-ID: <041f7b3d-3c4a-44f3-a416-cb47d8e406d4@cherry.de>
Date: Tue, 21 Jul 2026 11:01:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 2/3] mesa-libclc: New recipe for forking
 libclc for Rusticl purposes in Mesa
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>,
 openembedded-core@lists.openembedded.org
CC: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
References: <20260719080108.1290998-1-zboszor@gmail.com>
 <20260719080108.1290998-2-zboszor@gmail.com>
 <4e508b63-8c6f-4b61-be3f-f47981e1bd31@cherry.de>
 <49803c8c-9850-46f5-a554-3ad8700f9ae6@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <49803c8c-9850-46f5-a554-3ad8700f9ae6@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: VIUP296CA0089.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:35c::11) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|DBBPR04MB7836:EE_
X-MS-Office365-Filtering-Correlation-Id: f3948558-278c-415e-12d8-08dee7069cf6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|10067099003|11063799006|56012099006|4143699003|18002099003|22082099003|4133799003;
X-Microsoft-Antispam-Message-Info: 
	Br06m5TXzqj5DMICb9ZLnrS1bIiJWNYE00OFDlhPsunc91IBQnWBBpLer3g1nIrNRxlSzhUc2fcdDhgBQ58KigTKJ6vvvE4HKi8lfVBVVhu4SqkWnuu2N3aE6strbLH0UrW24jFqbkcJFqHIJTvxm97LhjPLP2vlatclj7BvjsGUTjCxXbccVvEr+/PLj+hrrUIdgJQAmaxyC3CiRZ7HZtfTOa6I/jVi2jih4Md9EgY1EyuVJ0nX/3bKnWMQcutYZ2HCiEXHYdpBKkK3gEoJePMRB5BKaBdBe60zt2NivcdujgIuVHKwCK2mvA+yVR1NQoGJV6wmZ35uJ9jctzcz7kvo00qrG7/NcZqiFrO8RU8PeeLCfa74DGj4W+TBqDHqDWTaunWFqr9oLjQPIXmQIswJOcM6jiEq/D2pYHIUAouD6AAoStW/S0Z81Srlzt9G6Ul5srnS6wc73bO/rZTzE126smT42HzHiNzGkA+OdG6yCnQs59b4VsJrEN83v+eWXR0B6fpvDMYSGuTYZtGRruFHN5lSIPS7U1TcQGlyGnRt9gO0/+oSk149KWXWWqbgF7bMINrpC1xOtW4oN5IMVAlKOKqKQvv4SmPpGX506O33q9Kq2ZZ8cli1y1hEmsin
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(10067099003)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003)(4133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FBYf4qzs29mo7SLKBpi2Ypy9LIpj70bBEIFHgqOB7GpS3W9CckZeGVWKvdCU?=
 =?us-ascii?Q?mEKEMOtd2EYI+iu3ZAbiVAutVUDSgX0jIfJQo1HcvqB0Qx8HwpUOK0r3jBXr?=
 =?us-ascii?Q?8hhamdDt6+TrBaH0g7yc9cPriDSTJ7O79N9OaVQAbkLdEcZGxSEwy5UpuZrs?=
 =?us-ascii?Q?UIixi37KBWBdPi4q57E6L7ujgGbPa5jrfOZJc/YdtZ2H3LyaeGxY8hZHbmmv?=
 =?us-ascii?Q?U0NK04RvBNwD85LV9JtxuHUOVwRG7XSYMIiqzO0jYmtrcN7WIrJZTgu3WElc?=
 =?us-ascii?Q?MbSiIt50skQQLta53TtLph985Wt8CXeFmXXD/zDydS7mxlIGMSYqn1kSGHDR?=
 =?us-ascii?Q?sREM5fzNGZPRbdroWH2+Nv0tdInFD2enq0owQTr1qtdCMD80CMJPMn4ttCzE?=
 =?us-ascii?Q?lbX2rvYWQyfjlGF0pdISIQKWNnRR8njsHhMsb1ojkYv9GX7RIIW1YVKZqPia?=
 =?us-ascii?Q?xdAfjLzA/Ol8lUGzxiDdB5ZPmcuKgQcT9z7ICGTjivoKRoNs3ShnMutIfb4v?=
 =?us-ascii?Q?yfQ9UlgnuovfwXHsu+4wVqvz2mrdJ5CvLGRrp4rf//vAOvX+XMx0x52mehm6?=
 =?us-ascii?Q?J4UJXPgKP34wJ1duPIZsf3NMO4SWRjnnhX1YD4RZFcU+GvC0/CC3n+c7CFH/?=
 =?us-ascii?Q?kyxUu3lPNU9AJgyc3ZB1TiaGGquVGvhnUKTzQBYY04LoMHQ7yo/fSFGozfOH?=
 =?us-ascii?Q?9QnjdMFTEWnvFutvqqa6QTV5B9dFpeahytgPiT2QsGIxEp3BB8jo2rcujbud?=
 =?us-ascii?Q?TMMcT6sKLfE5SXHEG4LI3Vod3GcDpEkgp1Ad+4+9r5DsYibwy6o5hx+1Jt0N?=
 =?us-ascii?Q?5iMXorHovXCcwskqxeaeizYIWRVtOhR5Ny6b3J975quR+wwbHbpi1xQ5XNzT?=
 =?us-ascii?Q?MJGtWC6fRg6AFXIOBdJQnP43kjutVAQqf7Yzn2xaVkw3RuoDBdxpaBvomAnn?=
 =?us-ascii?Q?ys5nF62eI9YPuWbbay0CO3F0mhxjuAgozTxBFxL86bMCQ/sFC9fJjVLHfUFb?=
 =?us-ascii?Q?3N2jO4610T2knrqvaWryUfYPriAKXOa6S8PTT72hJGnxXGVTJco4x2N8gsUs?=
 =?us-ascii?Q?0TrURBbxjcT3b7WKkpk82Eyp11Qe5ohg5ERUYNVxwrtMUBx6U6E8TBmDcig2?=
 =?us-ascii?Q?CvmBIfM546+b01NNlgzbsJt5oBfYRJzOKbaWOQlXnyKgYaql5NfC3LhqKsVb?=
 =?us-ascii?Q?8phqEL6HgNgi0BDdUWnOpSMBwvBuukCZfOOGEQMyxmyJs2VdXfFlacVPQSwn?=
 =?us-ascii?Q?TaMRICiyos+KE5A8dUOVEyaszD4F/nousPTf8sFfCyIEiFWq/FyplaNtdXjk?=
 =?us-ascii?Q?If8nzd0Flt/rN715NLfy9d0gYtmwbBdDi19N9vAwXLLMWmygn92eOuH3C6Nk?=
 =?us-ascii?Q?xfbXpz+Rp7+PURU36cPVfLK78hD+IJH8len2XDybVMybHmqFzWMCPfsxocNN?=
 =?us-ascii?Q?En19jC8hKCSpHcibRNHjYIQTkBt1meoDkBU2VU54lB4aK0DG5RuJdifVGtQi?=
 =?us-ascii?Q?0uYz1ocu/03fMDfOqcZQ6cV2agfQjxOv7JnKBEr04B1CVk+8vlbSOqJDFqmz?=
 =?us-ascii?Q?5Zj4pBNDpIwwqOoSAqBTpv4zbVBo14u5uIpIOYH976PJYRhqqWpJCyaYdBTJ?=
 =?us-ascii?Q?4GjShJSMCEAePss5DHt0Eb5b3IEbxQP/ew8gF6GuJuydufa37vFY+DG0nP/5?=
 =?us-ascii?Q?JyozS4snYlCRdOzvw+nNIXC4YF/AW9XWk/Jq7Fj8SPVQUaf++/nWxr26ADFo?=
 =?us-ascii?Q?iPSGpXnilg=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f3948558-278c-415e-12d8-08dee7069cf6
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 09:01:12.3772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3HXwS1cTzu+SYwXEvQXeGyPTdgeg2uK63M6FaHg4F/mN2WmwX450gh/RQW0ITgB/JgpNsUSbanGGJ5ALibb7YrKdGils/ofeK6gkDYfH/mI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7836
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 09:01:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241513

Hi Zolt=C3=A1n,

On 7/21/26 6:08 AM, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n wrote:
> 2026. 07. 20. 16:43 keltez=C3=A9ssel, Quentin Schulz =C3=ADrta:
>> Hi Zoltan, everybody,
>>
>> On 7/19/26 10:01 AM, Zoltan Boszormenyi via lists.openembedded.org wrote=
:
>>> See the reasoning and discussion at
>>> https://eur02.safelinks.protection.outlook.com/?=20
>>> url=3Dhttps%3A%2F%2Fgitlab.freedesktop.org%2Fmesa%2Fmesa%2F-=20
>>> %2Fmerge_requests%2F43020&data=3D05%7C02%7Cquentin.schulz%40cherry.de%7=
Cebbe0f4e8df54c2c252b08dee6ddba7e%7C5e0e1b5221b54e7b83bb514ec460677e%7C0%7C=
0%7C639202037154557993%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYi=
OiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%=
7C&sdata=3DJWuaPEkNjN6Y5zTeDBao%2Fk0bDR1FKZsaOgDck4evP2E%3D&reserved=3D0
>>>
>>> TL;DR: LLVM constantly introduces breaking changes that cause
>>> regressions for running OpenCL CTS with Rusticl and finally
>>> Karol Herbst had enough.
>>>
>>> This fork is from the LLVM 22 version of libclc and contains the
>>> necessary fixes to make Rusticl pass OpenCL CTS.
>>>
>>
>> I think this may be too early as this is still pending upstream and is=20
>> currently not receiving support from at least one person involved there.
>=20
> That one person's objection is now alleviated by not requiring
> the mesa-libclc dependency exclusively. It was replaced by
> a runtime check and a warning when not running this fork.
>=20
> As a result, the mesa-libclc repo was rebased twice since I posted this=20
> recipe.
>=20

Rebasing is a big issue for us. I'm assuming Karol knows better and=20
won't do it once it's actually used by mesa officially.

> So the MR is still definitely in flux.
>=20
> Hopefully, by 26.2.0, it plays out and gets backported.
>=20

Not sure they will want to backport it but let's see. I'm assuming they=20
will not do releases on that fork, are we expected to always update=20
whenever there's a new commit? How do we make sure we use a version of=20
libclc they are expecting us to use with mesa? (e.g. not forget to bump=20
mesa-libclc when we update mesa).

>> Also, aren't we going to have an issue if we have libclc AND mesa-=20
>> libclc built at the same time?
>=20
> No, because they install differently names files or into different=20
> locations.
> For mesa-libclc, the pkgconfig file is renamed and the install path
> is ${datadir}/mesa-clc.
>=20

ACK.

Cheers,
Quentin

