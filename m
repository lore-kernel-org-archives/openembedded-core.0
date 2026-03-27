Return-Path: <david.nystrom@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EEC910ED66D
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 12:30:59 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71948.1774614653888140953
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2026 05:30:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=swQtV1XA;
 spf=pass (domain: est.tech, ip: 40.107.159.48, mailfrom: david.nystrom@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cYnlIt5kwbPmBqH8QTcSUeBwxyqHyly5Pww/cutipxWXplhk81/pWmlygJR5KQIWT5I0GVNvNNTKSbUl/9FVTiwOQyQzMIrmR5yz9HCmqhqn97z8uRiQEKyqLTKpK2fWD2EmmizPYXbFaIjdPI52IS8Tqv6vyY/yEVQPTb5OYvHHqYLiX4ytQSRMw5uF5dONQzz8BzgVkGtzyCBBpTDkORT0+L6tg6qn6NU4kf/Lbik/vNnBKtH49t7TOYkoiw8rZ3lTjnsk6wNO0EiCnclb8NJeb8t89bD7tky7F80fC/A2nIrSYWlCHTpTpX8/tP8GWXFtY3TbMDnKCCk/8p+waw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kIuztK9IDzVWI4kWhUXNz05y/IA1aiqUtH4pQmJgrEg=;
 b=HfUVL+aWBZl42WC4l/SQ/tthQae0INazUXGCEbGBLsIcoxntvNefeycqRPbi3sXjYq9OwVxcHgRSEOvzw0lDaslXxbjDAZLQ0VnMFX7dlYWSKBFNWNP4uVbKuQ5qxaVmCPxvjfzEVJJ4lhoqA2OR0n1jic6HMWUuBYDDMjB2g4xTvOXHWrFDKX1eY01qsf11X174uGsHuO/2uDkEt1wo87NA5z3eXOV9Uowjk9MM5RhJqdlcS4/kcmcDrZVUmcymuvSHckPlf/8cUfUsf/z275ftaljxouMvnp1IL7qS9Dn7CCWXJy66xMYAoJP1Ead8HJ/bIwBOV+CZyNLuk0ERnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kIuztK9IDzVWI4kWhUXNz05y/IA1aiqUtH4pQmJgrEg=;
 b=swQtV1XAyLANLpPV0cHjFakC57VY/w1g27af6uZKDHbRZUekKjZNhUg00eNF8KU5rL63/O4MEZ47KH654CY/JWvpi5ELcnXXtB30nADvN5cZCBrKg6K73oKfkfIa78mxY68iQ0keyc/TDVvJ0hwTCfxILbPj4pgnDXnTAcs/jKkXFrTPc9drg1f6RiJ9tzeClE+C/A/IpQg5eyIt4mx1/Yo0ViiatYGrTNxq25hEVqwI7q6DlCItV9dwP/wzX6APiCIZpxxk9rF8xNYpCS4lq2Gp8s57DpFNj38sHyuozWrCXECl7W8ZSxabxR9kaOkySX6bdxEu7x7t93HrrJelWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AMBP189MB3247.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6a5::19)
 by VI0P189MB2799.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:258::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Fri, 27 Mar
 2026 12:30:48 +0000
Received: from AMBP189MB3247.EURP189.PROD.OUTLOOK.COM
 ([fe80::336b:ff8b:8a12:a5d4]) by AMBP189MB3247.EURP189.PROD.OUTLOOK.COM
 ([fe80::336b:ff8b:8a12:a5d4%4]) with mapi id 15.20.9745.023; Fri, 27 Mar 2026
 12:30:48 +0000
Date: Fri, 27 Mar 2026 13:30:44 +0100 (CET)
From: =?ISO-8859-15?Q?David_Nystr=F6m?= <david.nystrom@est.tech>
To: daniel.turull@ericsson.com
cc: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
    "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
    "pratik.farkase@est.tech" <pratik.farkase@est.tech>, 
    bruce.ashfield@gmail.com
Subject: Re: [OE-core] [PATCH 2/2] oeqa: replace runltp with kirk
In-Reply-To: <PA3PR07MB10721A419D82B4B57F78F31748A56A@PA3PR07MB10721.eurprd07.prod.outlook.com>
Message-ID: <550d7d85-7e12-53d6-3dad-ff8e7a20ccd8@est.tech>
References: <20260325084021.3915804-1-daniel.turull@ericsson.com>  <20260325084021.3915804-2-daniel.turull@ericsson.com> <136e62fde93b3b6a61cbd476f2b19724500b8643.camel@linuxfoundation.org>
 <PA3PR07MB10721A419D82B4B57F78F31748A56A@PA3PR07MB10721.eurprd07.prod.outlook.com>
Content-Type: multipart/mixed; boundary=8323329144320026117746146442467153
X-ClientProxiedBy: LO4P123CA0112.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::9) To AMBP189MB3247.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6a5::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBP189MB3247:EE_|VI0P189MB2799:EE_
X-MS-Office365-Filtering-Correlation-Id: d53330c4-4c51-41dd-25b0-08de8bfcacdd
X-LD-Processed: d2585e63-66b9-44b6-a76e-4f4b217d97fd,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
 NapY8LSwm4FrpuA12NgAp8KCAAvZ+mIW8IqbvHNMbzg75nmGH9v+EdrViXusEq8E6WatQyrD6DkVM6yYJFD/8OqvZeB+cRyH4KQi0j46LYAnBgF0sfbInfGzjYD7Bx1HmKzrKmG2bYcxYUZrlwZNGoYGa1dM2UpMXg2JisYr3/maiKg2ZTLywunhZg4GTCCi99nt7+QcPfWQjeHWu+1iya20DWZCDBgmgyWt3uj49JNwMc5/YB5oSa5ooibxFmehAo8eHKtNQ/mf6Xa+jSoZipYBHfIoqWzHql2iCn1DmOL2zDP9pIR7d0Aiy2bXH2zMjyv8FJNw1M4WYGM6LuReQrAQrfAgrHFY7ExKlxDEPFdgNlzIlKIGrQBp3V+Hd0xVGFts5tL9Ucmlpa5b09fvqkSgpxHOpRhfSUBQg0wp15YurybBOn28FtA/2CJk3rQPMCJoh9pmdpVsiR1e0DMLmLiMbXvnP3x57calEakedvmRn6DPBPcOZQynpbUsY4bI6r7tMMAhMwv501hb4kjFr3tNkVkELfIB7giSfbc/WPb5d3fKnweBHcyWusmlVmX/p24NDjnxgamRMvmjan8sCpZmOIPs/y8dZa666/250+GdJVogbmq5XhBpTrB06b17zgmA70XwID2j2TmvvF5lbgcJsHl1OtT6BY/9FqgKTZ4Q8pXGDtARcD2WdXr27AbPcm7PKMpeYiqzv3nQend/xlrjADw4BiuHfd8/oAfFHJs=
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBP189MB3247.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?aGpQd0UwR1NlY2w5V0NJUEU4UnZBTlhrK1BQRk5wbDltZmM5OUJPcUdXTTgw?=
 =?utf-8?B?S25DWW9NNnpsRFdtckJnbXZ1NFBuL2VueXZnbDVNSzdKelJEWi9oeDk1TTJv?=
 =?utf-8?B?aHB4dkR0Wm5CWjRCQjFQU0xWdkh4REkrR3NsMkRuMTIzWnovMjJvcDllMmdL?=
 =?utf-8?B?S2VEZml3R0lwNjUyZnlqQlk4TGh0bW5oZVVHbXNxa0g3N2dTSWt5bDVETktO?=
 =?utf-8?B?VWt6SHdaekFSMS9uNHRPbktFTE8wYUFvR3NuSHF5VnJINWVMcHBybFluOGhE?=
 =?utf-8?B?RTJoV2d4amE5RVlvVlNFMk1sR0xOMzNTRlZwcWFiT1VkUzVIZGI1ZTFweG1L?=
 =?utf-8?B?SndLRzFoSUpubW9oSzB2S3hFKzgrR2IvSG5kTkpvT1JMS1g3MGNYY28zcm00?=
 =?utf-8?B?eDhFQlM1VFhaaXJESDNGc3BDRzVmK2NkV000Z0V1c2NNWmIxa0UxNUw4cnJP?=
 =?utf-8?B?ZFE5SmpiR2NoZkI4QzBPNGVWaDVHZnpCZzVvcW9Uazd0RmJnR2U2T01GNUcw?=
 =?utf-8?B?NlNNZlpXdjBEOXExRTY3UFEveE5tUlVOUWlJWlZrSEpkcEUyYTVjb0ZQZUZr?=
 =?utf-8?B?dHlZU2ZDMUZ3TmtzMFVOZ3M4amFLQW02UlErRWhyM0lLWkpKdWxVS0xaeUZj?=
 =?utf-8?B?U3JDSWY4OVJaeTVCODlYbUxOTm10R1dCbE5CaHNmMXphY3BQdHc0K3RkY3RY?=
 =?utf-8?B?SHRUYUJyb3dBUzQvVTBiOFpHWkNZNndtdUVVcnRYaGtDWEVXc2tZTWNRdUcz?=
 =?utf-8?B?MlhWZ3ZudHUxdXVkdkpSYnNhS3QySGJSempLQUFNSDdTOHBPeGd4NHJhYVpt?=
 =?utf-8?B?bXFFMWVZL1VSVmtiMXFmemFIVzlES2V2a1dweG1oVTBhRGhDOC9HRVhJWkxN?=
 =?utf-8?B?a293TkRqaVltOTdCNjBhTnc4MXhyVFlxVjNGdEZxa095MDEwTUJ1R0NDdDcx?=
 =?utf-8?B?bE1sQmgxVG1TTm1oK1dFZ2QrdUhPcW81WWFSNzRjdElQR2NZcDNHM1doci9Z?=
 =?utf-8?B?OUttcWY1ZWNWZ0hoUXQ2VUhlRGFLSXVGY0RCQXR2TnRPNE8xWEhUcWQ0UkFF?=
 =?utf-8?B?TDNvbXpyR0NVbnpva21qb3hUYURJeTk2RTZBV0RNV2cvTzk0SExOSldsQzFh?=
 =?utf-8?B?bVREMVZmZjR4NXcxb2tnalVPRnFGYVZCamhpT2xPYzMvMjNuZGZHeVVmeTB5?=
 =?utf-8?B?dnRDZnFrOUJmeGJ4L2ZQMmtyM3pUT3d1WlZrOVQ0dHJVOTBPNjIxNHYzWFJQ?=
 =?utf-8?B?UnZQMk81aXBCRU1ZMXRtMFVGL2ZYTDB1b21lQXpBSCtmVVNwN29xei85cEM5?=
 =?utf-8?B?R2NGQ2F4QkF2eUo5d05OMDNIVVdOYy94ZzlxZWJrbjZXQXYyZnZYb0JtNnJs?=
 =?utf-8?B?S3A1M2hlUHBlS2tIYzdwZ21IdW1ONnhlRUFpRHZWblIxRjF6NGdJNUhFc0xy?=
 =?utf-8?B?amFLclVDK3pRMlNLRWNkcEliNXVVYjFRT1kzQUdSRURnOXZqUWx4S09BUms5?=
 =?utf-8?B?cmRtTnpES0tZUlZjc0ZHR0E5WDJWTHV2NTlibTNkYkdGaFhqQTR4S0l5dnd5?=
 =?utf-8?B?TGJhYnZ6VmliTk9kVlhpY2ZNdGRNdHJzcEdVTUVBdzZQb0VneEFKaGFGQk9y?=
 =?utf-8?B?aGlJMURiekZHOEdMSjVLWG5Id0prUXFYS3I4Sm5zaTN3MEthQXlxUC9kMGlY?=
 =?utf-8?B?dUE3eDFuY0EzOEJheWhCY1dtem93ZDJGdmliUG9sQVdxMHY5K1UxSEF2WVRh?=
 =?utf-8?B?YnJta2F0VGFkaTVGMG8yMXRGalB1OE5RYVBGRHlrakhXQlhVSmJ6cjN0UjNa?=
 =?utf-8?B?ZW1RUFdnSllTUU9kaXFDSmk3cHBNRElRSlRTbEpOdVIxa3NPYndFWmVwMm0v?=
 =?utf-8?B?bThXWlE0SGdqT2YrZGdjVVZleTNzNWUzL0dDUWljQ2xZRXVzc0tJUS9TcHBp?=
 =?utf-8?B?ZXhHMUEzK2lSOXpxd3pTUXk5NEUwZ3R6MmxnUkJVT3ZoNCtNM0dLMWJiYmJ1?=
 =?utf-8?B?bzZ6V1FCMTdWTGhJT1BjZ1dqMTN1L1E3cHdteTVwSGNxZnB5cXVLWFBXZjhl?=
 =?utf-8?B?ejVQazJYbno2K0tDRXZ3bnZRZTd5RDI2QUtZYm16dmU2OC8vMWt1SGVHZ0xM?=
 =?utf-8?B?MTVJZDAyUUp3VThxdHY1aEVmRWZNZW5kckF5TXNmOEd6ZHZtcVA4K1pwNmtF?=
 =?utf-8?B?MHJQN2t2NHc1U2ZCL1JpYWdjbnZmQmozdXYvKzdJNlZybTdzc0RkVmMrYTNm?=
 =?utf-8?B?Tnc5ajdVU2Y3UFYrWXlnTkJMbTdYZGcwZDVyOStTUnJFZmxidDNsWUUvRW0x?=
 =?utf-8?B?RlREWnpXazd4WUZkRDMra1Y5T3RtUG9HVXo0Z1hWeUtDZ1VWTzN1UT09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: d53330c4-4c51-41dd-25b0-08de8bfcacdd
X-MS-Exchange-CrossTenant-AuthSource: AMBP189MB3247.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 12:30:48.2404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rwVc/r84I20DMmtBmGYl+iq6Zhe3qlZ6rZM7OG43NuGwq0dukCFDxXRIV9Wz71sW29nBu0wIqf8Ilo0kOjafkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P189MB2799
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 12:30:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234087

--8323329144320026117746146442467153
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE


On Thu, 26 Mar 2026, Daniel Turull via lists.openembedded.org wrote:

> Just an update.
>
> It is taking a bit more time than expected. My original test only covered=
 the math test suite in ltp to verify the functionality.
>
> Some of the ltp test are failing with OOM, some related to systemd-udev. =
I'll be disabling them now to have a working ltp. Then look at the underlay=
ing issues.
>
> So far I have found 4 failing test cases. Using the default config withou=
t any changes with qemux86-64
>
> min_free_kbytes (mm) (OOM)

This seems to be a buggy testcase for automation. Disable until its fixed.=
=20
Even if the test own memory consumers sets their own OOM-score higher,=20
there are still chances that the OOM-killer kill the wrong things.

> pty07 (pty) (OOM)
> ptem02 (pty) (OOM)

These seem to me to be related to systemd-udevd having unbounded message=20
queue sizes to its udev workers. IMO, this is a systemd-udevd issue.=20
Some other udev implementations starts dropping events.

We should have seen this when using runltp as well ?

Death spiral: systemd_259.5=20
1. Test tight loop creating devices floods systemd-udevd's workers=20
unbounded inbox queue(s).=20
- Single core, low mem, and long running udev rules makes the problem=20
worse.
2. systemd-udevd grows to consume all available RAM
3. OOM killer kills everything but systemd-udevd (OOMScoreAdjust=3D-1000)
4. Kernel panic: "no killable processes"


> cve-2018-13405 (cve) (deadlock kernel panic)
>
> Giving enough memory 16GB makes them go away but I'm trying to make it wo=
rk with 4GB of RAM.
>
> Best regards,
> Daniel
>
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-
>> core@lists.openembedded.org> On Behalf Of Richard Purdie via
>> lists.openembedded.org
>> Sent: Wednesday, 25 March 2026 17:36
>> To: Daniel Turull <daniel.turull@ericsson.com>; openembedded-
>> core@lists.openembedded.org
>> Cc: pratik.farkase@est.tech
>> Subject: Re: [OE-core] [PATCH 2/2] oeqa: replace runltp with kirk
>>
>> On Wed, 2026-03-25 at 09:40 +0100, daniel.turull@ericsson.com wrote:
>>> From: Daniel Turull <daniel.turull@ericsson.com>
>>>
>>> runltp has been removed from ltp and kirk is the official tool to
>>> invoke linux ltp tests.
>>>
>>> See:
>>> https://eur02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit=
h
>>> ub.com%2Flinux-test-
>> project%2Fltp%2Fcommit%2F6efd3605dc005c3ed135b463f
>>>
>> 182174e24bdce1b&data=3D05%7C02%7Cdaniel.turull%40ericsson.com%7Cca4e75
>> 36
>>>
>> 591a44feb4fd08de8a8c9c1f%7C92e84cebfbfd47abbe52080c6b87953f%7C0%7C
>> 0%7C
>>>
>> 639100533691606542%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRy
>> dWUsIlY
>>>
>> iOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C
>> 0%
>>>
>> 7C%7C%7C&sdata=3Dcgqr%2FrR99Ty%2F75pasLCYawpw0qV%2FAZ4sXUDWH%2B2
>> ka9c%3D&
>>> reserved=3D0
>>>
>>> Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
>>> Assisted-by: Claude, Anthropic
>>> ---
>>> =C2=A0meta/lib/oeqa/runtime/cases/ltp.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 16 ++++++-------
>>> =C2=A0meta/lib/oeqa/runtime/cases/ltp_stress.py | 16 +++++++++----
>>> =C2=A0meta/lib/oeqa/utils/logparser.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 29
>>> +++++++++++++++++++++++
>>> =C2=A0meta/recipes-extended/ltp/ltp_20260130.bb |=C2=A0 1 +
>>> =C2=A04 files changed, 50 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/meta/lib/oeqa/runtime/cases/ltp.py
>>> b/meta/lib/oeqa/runtime/cases/ltp.py
>>> index 0ffdbe23e4..11c4814090 100644
>>> --- a/meta/lib/oeqa/runtime/cases/ltp.py
>>> +++ b/meta/lib/oeqa/runtime/cases/ltp.py
>>> @@ -12,7 +12,7 @@ import pprint
>>> =C2=A0from oeqa.runtime.case import OERuntimeTestCase
>>> =C2=A0from oeqa.core.decorator.depends import OETestDepends
>>> =C2=A0from oeqa.runtime.decorator.package import OEHasPackage -from
>>> oeqa.utils.logparser import LtpParser
>>> +from oeqa.utils.logparser import LtpKirkParser
>>>
>>> =C2=A0class LtpTestBase(OERuntimeTestCase):
>>>
>>> @@ -66,9 +66,9 @@ class LtpTest(LtpTestBase):
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0 def runltp(self, ltp_group):
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 # LTP appends to log files, so ensure we start with a
>>> clean log
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sel=
f.target.deleteFiles("/opt/ltp/results/", ltp_group)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sel=
f.target.deleteFiles("/opt/ltp/results/", "%s.json" %
>>> +ltp_group)
>>>
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cmd=
 =3D '/opt/ltp/runltp -f %s -q -r /opt/ltp -l
>>> /opt/ltp/results/%s -I 1 -d /opt/ltp' % (ltp_group, ltp_group)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cmd=
 =3D 'kirk --run-suite %s --json-report
>>> +/opt/ltp/results/%s.json -n' % (ltp_group, ltp_group)
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 starttime =3D time.time()
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 (status, output) =3D self.target.run(cmd, timeout=3D1200) @@
>>> -87,14 +87,14 @@ class LtpTest(LtpTestBase):
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 self.extras['ltpresult.rawlogs']['log'] =3D
>>> self.extras['ltpresult.rawlogs']['log'] + output
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 # Copy the machine-readable test results locally so we
>>> can parse it
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dst=
 =3D os.path.join(self.ltptest_log_dir, ltp_group)
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rem=
ote_src =3D "/opt/ltp/results/%s" % ltp_group
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dst=
 =3D os.path.join(self.ltptest_log_dir, "%s.json" %
>>> +ltp_group)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rem=
ote_src =3D "/opt/ltp/results/%s.json" % ltp_group
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 (status, output) =3D self.target.copyFrom(remote_src, dst,
>>> True)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 if status:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 msg =3D 'File could not be copied. Output: %s' =
% output
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.target.logger.warning(msg)
>>>
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 par=
ser =3D LtpParser()
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 par=
ser =3D LtpKirkParser()
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 results, sections=C2=A0 =3D parser.parse(dst)
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 sections['duration'] =3D int(endtime-starttime) @@ -113,9
>>> +113,9 @@ class LtpTest(LtpTestBase):
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0 # LTP runtime tests
>>> =C2=A0=C2=A0=C2=A0=C2=A0 @OETestDepends(['ssh.SSHTest.test_ssh'])
>>> -=C2=A0=C2=A0=C2=A0 @OEHasPackage(["ltp"])
>>> +=C2=A0=C2=A0=C2=A0 @OEHasPackage(["ltp", "python3-kirk"])
>>> =C2=A0=C2=A0=C2=A0=C2=A0 def test_ltp_help(self):
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (status, output) =3D self.t=
arget.run('/opt/ltp/runltp --help')
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (status, output) =3D self.t=
arget.run('kirk --help')
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msg =3D 'Failed to get=
 ltp help. Output: %s' % output
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.assertEqual(statu=
s, 0, msg=3Dmsg)
>>>
>>> diff --git a/meta/lib/oeqa/runtime/cases/ltp_stress.py
>>> b/meta/lib/oeqa/runtime/cases/ltp_stress.py
>>> index ce6f4bf59d..cf84ec1182 100644
>>> --- a/meta/lib/oeqa/runtime/cases/ltp_stress.py
>>> +++ b/meta/lib/oeqa/runtime/cases/ltp_stress.py
>>> @@ -13,7 +13,7 @@ from oeqa.runtime.case import OERuntimeTestCase
>>> =C2=A0from oeqa.core.decorator.depends import OETestDepends
>>> =C2=A0from oeqa.runtime.decorator.package import OEHasPackage
>>> =C2=A0from oeqa.core.decorator.data import skipIfQemu -from
>>> oeqa.utils.logparser import LtpParser
>>> +from oeqa.utils.logparser import LtpKirkParser
>>>
>>> =C2=A0class LtpStressBase(OERuntimeTestCase):
>>>
>>> @@ -60,7 +60,7 @@ class LtpStressBase(OERuntimeTestCase):
>>> =C2=A0class LtpStressTest(LtpStressBase):
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0 def runltp(self, stress_group):
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cmd=
 =3D '/opt/ltp/runltp -f %s -p -q 2>@1 | tee
>>> /opt/ltp/results/%s' % (stress_group, stress_group)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cmd=
 =3D 'kirk --run-suite %s --json-report
>>> +/opt/ltp/results/%s.json -n' % (stress_group, stress_group)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 starttime =3D time.time()
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 (status, output) =3D self.target.run(cmd)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 endtime =3D time.time()
>>> @@ -69,8 +69,16 @@ class LtpStressTest(LtpStressBase):
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 self.extras['ltpstressresult.rawlogs']['log'] =3D
>>> self.extras['ltpstressresult.rawlogs']['log'] + output
>>>
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 par=
ser =3D LtpParser()
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 res=
ults, sections=C2=A0 =3D
>>> parser.parse(os.path.join(self.ltptest_log_dir, "%s" % stress_group))
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # C=
opy kirk JSON report from target
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dst=
 =3D os.path.join(self.ltptest_log_dir, "%s.json" %
>>> +stress_group)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rem=
ote_src =3D "/opt/ltp/results/%s.json" % stress_group
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (st=
atus, output) =3D self.target.copyFrom(remote_src, dst,
>>> +True)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if =
status:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 msg =3D 'File could not be copied. Output: %s' % outp=
ut
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 self.target.logger.warning(msg)
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 par=
ser =3D LtpKirkParser()
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 res=
ults, sections=C2=A0 =3D parser.parse(dst)
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 runtime =3D int(endtime-starttime)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 sections['duration'] =3D runtime diff --git
>>> a/meta/lib/oeqa/utils/logparser.py b/meta/lib/oeqa/utils/logparser.py
>>> index c479864162..a907421fab 100644
>>> --- a/meta/lib/oeqa/utils/logparser.py
>>> +++ b/meta/lib/oeqa/utils/logparser.py
>>> @@ -5,6 +5,7 @@
>>> =C2=A0#
>>>
>>> =C2=A0import enum
>>> +import json
>>> =C2=A0import os
>>> =C2=A0import re
>>>
>>> @@ -158,6 +159,34 @@ class LtpParser:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return results, sectio=
n
>>>
>>>
>>> +class LtpKirkParser:
>>> +=C2=A0=C2=A0=C2=A0 """Parse kirk JSON report into the same format as L=
tpParser."""
>>> +
>>> +=C2=A0=C2=A0=C2=A0 STATUS_MAP =3D {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "pass": "PASSED",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "fail": "FAILED",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "brok": "FAILED",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "conf": "SKIPPED",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "warn": "PASSED",
>>> +=C2=A0=C2=A0=C2=A0 }
>>> +
>>> +=C2=A0=C2=A0=C2=A0 def parse(self, jsonfile):
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 with open(jsonfile, errors=
=3D"replace") as f:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rep=
ort =3D json.load(f)
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 results =3D {}
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 section =3D {"duration": 0,=
 "log": ""}
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for entry in report.get("re=
sults", []):
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 res=
ults[entry["test_fqn"]] =3D
>>> +self.STATUS_MAP.get(entry.get("status", ""), "FAILED")
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tes=
t =3D entry.get("test", {})
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sec=
tion["log"] +=3D test.get("log", "")
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 section["duration"] =3D int=
(report.get("stats",
>>> +{}).get("runtime", 0))
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return results, section
>>> +
>>> +
>>
>> FWIW we can probably just update the LtpParser class directly rather tha=
n
>> creating a wrapper around it since runltp will be no more in the next re=
lease
>> anyway.
>>
>> Cheers,
>>
>> Richard
>=

--8323329144320026117746146442467153--

