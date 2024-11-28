Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66894D70DEC
	for <webhook@archiver.kernel.org>; Thu, 28 Nov 2024 18:49:59 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.101])
 by mx.groups.io with SMTP id smtpd.web10.101881.1732819794572789950
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Nov 2024 10:49:55 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=jaAEBnzP;
 spf=pass (domain: navimatix.de, ip: 52.101.69.101, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AEzpwWdX2vxok9bWDMovTjv/xzo8UrlU/KCq7i1FGmPqtLoSMJylnGv2YsZMFP04/lRvhxzZeTjmD61pMPdl0QGj/IFQXx1qRZ+tUtaQNuijXG+qFyBE2bxnBH74oGLUeT4XvgtbHF63Mwkr8sGQVRNU0YvAKKt4GP0ctsBDuWFbuCWkTasqQk9P+deanwgxKvHBLvGKxgrdvK3f2kHg0smVshr0qcDr1qFfnRbs0st7+VJZ8x2CbiFrjm/lUK77wmzxT5PtzGcS/smR80AGgUTIYibwh/LEtjnijNrtg5ypQvcageWNNGZ/Flyb1VUnUefb+CWLm2XfGw7YOD82+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P5cWeVV9P5Nnmc1JSIzzJuNU+Lkiz5paq+QKKxCL+XY=;
 b=BMJ5iapHizFju6D0p/OSexIEcWcanWGvC1YzfbIMCgX33qjlRkQsVVwzkor4WzYA7rPgJIbK/5uU9MNY367X5Ff5qvIFME9VQ1ZsPhDEgzl09Z2FlRV0Vi4YmJuKCvX4ZSPr/8iZv9pfX3ijmSiwtafNnDjGfykTaL1Ka6eg0s+SBEerU78l+NTPPoRXNjecjKeokwo8rakHCPSKgrv+l749tMY6BT4R57rQyN90HR48SZeSZ6Se5fZcG2+8tkpofqkUL9i11NaX8LCcXcmQMaG/U2PasKHYPfZtkC7VKGVw1TztE17c9lF+SZ/tohfAEtbnA3+0NwKCEzuokShQxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P5cWeVV9P5Nnmc1JSIzzJuNU+Lkiz5paq+QKKxCL+XY=;
 b=jaAEBnzPfXg4TlpNtk7+Ag85VgzIYqzrbN7asFuZDhXLSFlywX27pzgi2vn3hn3t7Y+4U5WuwBPIzcXOGMzuZTSL2mpv/H51CL8E0KyFKM/O1gTdi7KGE+jP6H43m04ETg21WJPyBtebv6iSAKYRxyga6W8/oGpp5kjVcAp36bQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by AS8PR01MB7944.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:373::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.14; Thu, 28 Nov
 2024 18:49:50 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%6]) with mapi id 15.20.8207.010; Thu, 28 Nov 2024
 18:49:48 +0000
Date: Thu, 28 Nov 2024 19:49:45 +0100
From: "joerg.sommer@navimatix.de" <joerg.sommer@navimatix.de>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] lib/oe/utils.cpu_count: Raise maximum count
 from 64 to 192
Message-ID: <cop62tcxe4sij7heuyhzt4gfe7lwmaaegr5vodo4yozembl6qh@j7ubd4mre6cm>
References: <7c42e340baae4038324e250583e9395fb8d90463.1732725209.git.joerg.sommer@navimatix.de>
 <C8D6F167-2022-40F4-A4AB-7EB334C2C821@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <C8D6F167-2022-40F4-A4AB-7EB334C2C821@arm.com>
X-ClientProxiedBy: BE1P281CA0262.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:86::16) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|AS8PR01MB7944:EE_
X-MS-Office365-Filtering-Correlation-Id: 67acb10c-7d02-44dd-09a4-08dd0fdd6e6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?VQqdR+2uA+nC5y++fzNOMhlUKbOBYRoaoKrVDuw5/yZDbd275uD+BlOx2dX8?=
 =?us-ascii?Q?4AaVXH/1OmKZOZLjKg+ZDyhPjxpcNHjcQgb2bMKQQ3v9DlWQkUW08l6fvDya?=
 =?us-ascii?Q?koJm9q+kKzSrRMOMKn+CflK0EsrGCp9nulnQDThdqI8fMdKkejvFTIsY14oJ?=
 =?us-ascii?Q?QT5v8n+fELCmiHTTkIRQ3M7UmkhkLedw0wO4CVq+FdapSXPcqJI2cx5qzmSu?=
 =?us-ascii?Q?3iUrzhxbtGpWyvNLsZhkaKFIAFCa9aFu5OaZw6aktbiUWBvghPOmujLk4r/Z?=
 =?us-ascii?Q?ePShbk3ma277AOjDVlAsCsYxEa6TUrk+B2TsgdcTYi6oPmw6fXvqTHQEht7w?=
 =?us-ascii?Q?5I4ha94d5EF53OHiLVHOyAAUnRuefmKj9NH9+4uAKzsAaUqJvVwVu5FaC9aL?=
 =?us-ascii?Q?qwkwb7RzwqYWjg+Mr/7zWIYw5rXBMPTDz0Ta18xNpsZV9mSOsGgJ1laMIC/y?=
 =?us-ascii?Q?6zscew+AvHStbSfzNlyVANmDJktZ1fRukC4YJG/JXweLY4QHly0ZJ7BATW4M?=
 =?us-ascii?Q?shJrjULjzYMNL/nmxmZHfW0AJwZNjd5xg50qkWuSsODfk+Z+nFIufXeaqBur?=
 =?us-ascii?Q?4iEJwH3e7TqalQA1bMmU2XosETx6I3hcIYH8JFfEsVzuI+1GpVYmVxwiukGv?=
 =?us-ascii?Q?2KoZPyT89MmxVlC1vbBtYyXAauZgq9OzQQ/TXKfOPg5KWx03YEtNR6/nQ7Jl?=
 =?us-ascii?Q?ms284xWaF9wo3hyXJBWlxVo9WXleW4HXMrjJU3I87xktzoPB7gCSc822SwQx?=
 =?us-ascii?Q?1dayQnhWRF0Bho2JnonZyKenMfz8YjAczeqXVjZ4RL0CDeCq7tnqhQ+e2pEh?=
 =?us-ascii?Q?plmiZ4z7F7rZNAb9p88qraz1CcCFGXGkL5au5XOLp1Li6G1iBrCuD0550mw/?=
 =?us-ascii?Q?I/ANPPs0ZFtjie0LVDhrolr4ZJ83hdekEJYOR0W8jVW+eftAk98iqE4H8jY0?=
 =?us-ascii?Q?mGr4KHaYJxYUu2eeJbjOoNGTODY03c/y6X8sBmgU4JWTKvkjqDpBfO+lG8py?=
 =?us-ascii?Q?voiiuhEOual8S7XjuZ8+4i2w6dJurks9d1CVrG4tzhYR8tw8fW/4Q153b7hz?=
 =?us-ascii?Q?L+EEkn1F9gug5LVIB3Vk5z2NyMSGq5Z5wlyEBk10r3ovrWwI2Tvu17uR++Vf?=
 =?us-ascii?Q?oL6i9XCDWAwPtohNppTR5MSe4D87PUgJwcwLbU7LTnh6ROXCi0DAhwEmJYL/?=
 =?us-ascii?Q?8K1WgAXrKVJJ/9yZxbF2Jv0H49Zruw++WdDEJLTGblCFjm+S9I2PibNA36Jd?=
 =?us-ascii?Q?1XOKTYEwQ9iTRMKaZYUWR92MK6kUE6U0Ef8xxW+2iFe8hUOavGPAbo44QZwm?=
 =?us-ascii?Q?G+uuBAZ+zCllo953ZGYLry8Fpkrgj2aCa7u//1CT8QE41g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WmFtMhqdsTFVJ3tFVW7tdtdJeMVZb63aYzY1hxGQijo2qyeWGBoFO9pB1OVI?=
 =?us-ascii?Q?PNjsoz7QJIAfffpDbPb/FwJfnokMjdIr63ifZCq0laIBmPpUPzjVtGE1RGI2?=
 =?us-ascii?Q?xipB9cbJud8oAKaGFch6QCdVZi+Ak8Cmz0n624DRhH5jkqmhLqIC1RoJfaIS?=
 =?us-ascii?Q?brGHIGNPAChsbmI4xUQVW19O0nhhwItR1IIBvxxOfzlfu+sApizM3IBlhcsp?=
 =?us-ascii?Q?HTacsMd/jSOGJXBjhPUJyvD6LxqR7nXwkVve+R0xEzdJERTmiSlB+pKlcyVz?=
 =?us-ascii?Q?gSExZUY/rDWhlwZyxuRzR751fcwaitsyIvLl5lO5nwtuxPTdWk5S6QWcpUF2?=
 =?us-ascii?Q?mB982iYwkIinyz/Hyg+F15NAL63ioSX8ds5v14kRVp4oCpLQ1lhXYl8DqO3o?=
 =?us-ascii?Q?xtT+/MXFkvFeJHkizZ3QMi6Yn4Evwt+/boxtPQebf03x1cGBydX8mQ/lntqp?=
 =?us-ascii?Q?f3HXLicBfdZrG5l6e3afVVSuAytJW3ccAiGV/WydJMgFy7lzOfumpebrGTLl?=
 =?us-ascii?Q?fZJYQ72e9pUEwYkGBo+LRWz70umoHfVbEvTWfqfqujTHwyHY/fmTtXJ/+Tyk?=
 =?us-ascii?Q?HJS+4TdmfFIv2Psc8yhHXQAvLTQJlZloU4uYwbugfRuZ7QzZ2KN6O/XHNN9G?=
 =?us-ascii?Q?ybL25vIA2wi3URrhBtwH3eKgW7dEltC9AvSYzH3QArVw9Fe8QMV8cQGLGaU3?=
 =?us-ascii?Q?VISYGuE3f8jNI5YQrP8bxzlgVqYYoWVJAzQM0RpHseUO+lBC4BZTrq3lGr9m?=
 =?us-ascii?Q?fB/6HnBOduAE/lN2EM/NGU6JULRVSgHygs4+bNJfJNWH0u54QOzIMBmHSxNT?=
 =?us-ascii?Q?K5grbeEWEQY4yRPIiY5q3n04MAeqge/oHiPe9NAJ+saJCTL+WK35VumcgOke?=
 =?us-ascii?Q?r/oX7KPQ9KmNwvImrks+bCDDug7TFz6mG2l9WYeLxlL/WzF/HdtHdrWWH2mA?=
 =?us-ascii?Q?Qs4i0r9BOXnUqs/yUojL12h1iPnn/eGUHNLuGPTcnxIRv8KmMzWnu7cow1X8?=
 =?us-ascii?Q?xulABrAUfwzrsuYU5Z4TXeN6a1FxOrp+KYOyitvz3RKESIixy0RyLbalmkMl?=
 =?us-ascii?Q?arOxkoE9K5TZn1j/zxAsPh/qLW4gQaMc6n4uGDqQZb79n3u+E2xae8kEzSqQ?=
 =?us-ascii?Q?P8xGgkahu2f5eBExAhRrv97Ssq0pileM5TZd9w1MDBXs/bqFu8xlJXIw3s9G?=
 =?us-ascii?Q?+DxmnasHpHelMyNUl1NUEDsKM3cQp6u6p2irkFtP0d1WWjHfS4ehCRPfspmP?=
 =?us-ascii?Q?zdYyg/YU3L9XcND25E0fQ5raf2HYvB74PfE2pqYlgL88Zki60LaHwgYcDwTN?=
 =?us-ascii?Q?ySFMfdUcm1/pquCgzhbANZeZu1QKsLUHkqQeiFlXS0E6AkEXrxgfrsEegCCp?=
 =?us-ascii?Q?hm6EBNOK2oHBiov1sj1QdsoNs+jk3jDVuX1fHqEUmgKvrD4flqvYhGExRK1b?=
 =?us-ascii?Q?ZfJAzIAhphyMmG3uchp2ZbYG41pH9P3e1XevDBp82/qKvMhtlGr9yf3lJHbe?=
 =?us-ascii?Q?y2rzfCjT26AYQQD4GNUwycBsTlr65r/WCMDORMtQLdlAvaFTHakMpfNMLOBa?=
 =?us-ascii?Q?SKemzEsdoNz0mEMMQm5faJNW0q8K2lJLO2gLfeGyUWtEoWc1oxper43vDIdp?=
 =?us-ascii?Q?ww=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 67acb10c-7d02-44dd-09a4-08dd0fdd6e6e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2024 18:49:48.3324
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ag7ulgiZtLmtvjxEqbslDl9PsS5pvow1LuleAHlh6SgDrODqOXE2UdILKdn//nMsiUfz0jzBz4z6eHEFqHoeUODgV13e4DBA0bSbJP/KIrM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR01MB7944
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Nov 2024 18:49:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207997

Ross Burton schrieb am Do 28. Nov, 13:36 (+0000):
> On 27 Nov 2024, at 16:33, J=C3=B6rg Sommer via lists.openembedded.org <jo=
erg.sommer=3Dnavimatix.de@lists.openembedded.org> wrote:
> >=20
> > From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> >=20
> > We have a system with 96 CPUs and 128 are not uncommon. The border of 6=
4
> > limits the number of parallel tasks make or ninja spawns, because the v=
alue
> > goes into `PARALLEL_MAKE ?=3D "-j ${@oe.utils.cpu_count()}"`. If only a=
 single
> > recipe gets build (e.g. rust, due to dependencies) this leaves one thir=
d of
> > our CPUs idle.
>=20
> 192 seems like it was arbitrarily chosen as =E2=80=9Cmore than your curre=
nt
> system=E2=80=9D: if we=E2=80=99re doing that then we should just remove t=
he maximum cap by
> reverting the commit that added it in the first place.
>=20
> The point of the default is to be reasonable, and in my benchmarking on a
> system with 128 cores going beyond 64 only gives you more chance of OOMs,
> I/O contention, and other users of the presumably shared machine being
> angry.

How much RAM did this system have? Ours has 128GB and it's more or less
empty during the build. Also the NVME-RAID shows seldom an exhaustion. To
the point that I an build at least two of our images in parallel in a tmpfs=
.

I try to record some graphs with systemd-bootchart. It's a bit tricky,
because I have to split the recording. Do you know a better tool? When
analysing a system I watch with atop, but this doesn't give graphs. And our
monitoring system contains too much information.

> If you have a powerful server that only does a single build then you=E2=
=80=99re
> welcome to set PARALLEL_MAKE =3D =E2=80=9C-j128=E2=80=9D in your build en=
vironment to take
> full advantage of it.

My other solution is to run three or more builds in parallel, but there are
not often many images to build at the same time.


Regards, J=C3=B6rg

