Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF500D20694
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 13:40:16 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.10])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43589.1764855608887731432
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Dec 2025 05:40:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=PBVokfuR;
 spf=pass (domain: cherry.de, ip: 52.101.72.10, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n3b8AupquGOWZQRkq5HKdwZTUcJQAu5eLgEH81xd2Tl2FpsDfRJHFoRXPs5q4Kz2TUbLeS8cqy35sc3Pgk+aYPb38jgOVMcSAEdw3ihIsg06IpIaKnXukQjQGVRsEWhiaJpEsh8DWfcK7yC5ireIvfAEJYRO+qMcQW5EaTq1ACs9FYzAYxsUT1WGlw/22YJXcGH5n79wM2QGGgarA0HlupgLfBnqta9KkosWGeGo/H1d1ccbOhy54jca8F65almybsLhjddnaXgG+O1WY2BM4xwaaexMS9n/cdNb6fIxYSp03hNIPhpbPO3ZIBQSjrePNl7XBfDKN3KSLxE1T1jjGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5c2IuMrGsVBXrruncF6Su6Ai/Z80wEmaQEraE7p+Do4=;
 b=ui8TtemyPBTE7PX6d8ZGnDClVRV1H1Rrd9aW+RMXwyh49nS5X8bAjDwCJ/PsqeuZWYnby75qj1eLkMd+3JwXcAx1l5uLYTZekDk75Gugsmqnsl09gVDVlrs/lf3Awbw+DbdqiupSevxxaeUXyl2l/l7DezVXNvB4QmVOXcP4muuGKh5FCKhAeHS0BSSl95AM5h01s2Rgy5O2UhU/0BBy0p/STqMxFL+GHzPoz/UKdzdGcUSawfktuL3QTqW/k+zB4CtBNlnvJiJ70/eNiT1rsYTSStXBhK05F8eCpKU3JEvaVyifNzc9prFCfHgl7F0ST9yDHQj9csmWKii4If6vug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5c2IuMrGsVBXrruncF6Su6Ai/Z80wEmaQEraE7p+Do4=;
 b=PBVokfuRO7klunqoIV1JKkBlQvHMEfC+uAQZpfG4caRq6D9jNGJdl0U4/ZC3ludTWtjz8dl7uPaZNsaDKBLPnngkfS9gZCkitvgUfNUf3MMCnG0NJa/jSf9updD8H5o1MQ/eUQZ58bV/hmkTMWE8JodCfxyFUqon5LxlNsZnz78=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AS8PR04MB9128.eurprd04.prod.outlook.com (2603:10a6:20b:44b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Thu, 4 Dec
 2025 13:40:04 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9388.009; Thu, 4 Dec 2025
 13:40:04 +0000
Message-ID: <b176f940-3360-490b-8f5f-8dac7ad13a26@cherry.de>
Date: Thu, 4 Dec 2025 14:39:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 4/4] mesa: upgrade 25.2.5 -> 25.3.0
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 openembedded-core@lists.openembedded.org, Ross Burton <Ross.Burton@arm.com>
References: <20251202004951.2358784-1-dmitry.baryshkov@oss.qualcomm.com>
 <20251202004951.2358784-4-dmitry.baryshkov@oss.qualcomm.com>
 <cdf76069-ffd1-4b7f-b164-0a8b4ab1f5f5@cherry.de>
 <4a332969-32ee-450b-ba25-34f2b5dec81b@oss.qualcomm.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <4a332969-32ee-450b-ba25-34f2b5dec81b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: WA0P291CA0004.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::14) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AS8PR04MB9128:EE_
X-MS-Office365-Filtering-Correlation-Id: a986f01b-3ca7-4a4c-66e0-08de333aa172
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?n7luj5Oc/p7SY3hfrc5cmtuJxz/rfmFIZbYHke/VU72vbJNZF+cHCZYcD1+O?=
 =?us-ascii?Q?f+h2GC09T7cjlC7/N5Oyv7sQ1/macAnEgMBIGeehETiMawuPFOeHJyNwY9Ia?=
 =?us-ascii?Q?c59B9OutbvQbDMzCtMWZhm5jbDRfhyAMMz2bYqCNhCg65lEv93uwRBW8fNXq?=
 =?us-ascii?Q?GXEC/MpHkdSxRb4NAnACjhiLQGUFzkkWKEy5CC2E4AC8zHD9NAq6zeUap1j1?=
 =?us-ascii?Q?KaNLIEL1fzuJcnes/IWifveFE9unSr1D2gdhurtIMMVsuJ3RqSE6IryjVNBr?=
 =?us-ascii?Q?uVhSVS76WM5N4YTNKvdi8gfRJ+0BenvgVMU3E/+/Z+d2rkCfIh2HI39uOUQM?=
 =?us-ascii?Q?fx6cFUISEQEpaNqLUVLTLL5Ct2HzXa1/U8KODCFHZ6KR4LqBaqLmMzUGX6IW?=
 =?us-ascii?Q?tl3+/MPiNA4wHRAnODd4jMszMRaJXAMZBF+MTM9+CRoqhfr2PBuc9d7+oARa?=
 =?us-ascii?Q?lT5Av5NtJU57CfKmLxc98TmCK4ZuMg5hyrKhI3GVa0nK4zwj9cyHAD5H1Mo9?=
 =?us-ascii?Q?TIB1tiXid15pyo7zrdJXo71Af8C7FtcqmUGBfll/2pkzI3pa60uSobzR1Wzx?=
 =?us-ascii?Q?TdqST8qppY9wTv/+ewMLngKQRFOYjPMUeOW1bFo065qRnqvcsrEl3HX0vsQi?=
 =?us-ascii?Q?LVi4346u1KNZqQRNTqAhwt2MaRFkTh9k/Sx57QKahP3VzVM4xCUg2fol1qo+?=
 =?us-ascii?Q?TlKVDgayq5fYBuFz2N/mV+nI3TtOkh6DGpQDh8KYnSpkk7AJSfDzOwaGAH76?=
 =?us-ascii?Q?PcYjmkbly//4XAVg9W63D/5Zp23yspRhv9s9B9IHyYg2C1lr5l9dQ3jkkjGA?=
 =?us-ascii?Q?J7zcWdM7gWlziqUd7hV5ee2cS8zDlpfjij/zORQhlmUtl0ORh/GzCjUH29u8?=
 =?us-ascii?Q?fN1vE2B8lqu1E8uok4LXPPIHzLS+pk/IlpPnlnT053pTYAb563RqXGH/U0ld?=
 =?us-ascii?Q?2UWqUu18WM+qFw45ncKamWF+hNib4Yuacefubk0f2MVwgK3tf0CF8gfXB/aK?=
 =?us-ascii?Q?S2Rwx+g0KoPSYo6x0fYCdOYHdJ/UJsQeWLaKjMlZoZiDzaHty+wATRqtlUbm?=
 =?us-ascii?Q?Yxz6T6x9WKkN8YLrPljQzsoA7NTpO7GQVSIpT9TWOktcV3dF814P6034H3Re?=
 =?us-ascii?Q?cZASwIChLDJq1/4U9YdAlYmwrNIuMSCqZ6Oxl8hSlg4SymGRoIjSGDIOwN2c?=
 =?us-ascii?Q?bRbm39aNh8ZuUpAwonBGuq6TzoH4jJ1qcGtzprP3lzJsdreMbFuzR5R34MuU?=
 =?us-ascii?Q?P65IgvwhbhQCRcdQY/G//AkPXtyp1LkWi/B7Q6XOSNZ26MbwioTMerHKwLow?=
 =?us-ascii?Q?62Ixv5YuAL2iSH5M03+kc4KQ2B7c1rEvh5nlf2Jgc2wAkki63EhG/EV49uH7?=
 =?us-ascii?Q?nrkIJKnt/dZtA3ov3LNwpYku+njw3okRWxGNXDmEmUmBmxOQoA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HqGk/taymfw1opgb7sMDu1zkgHKQrybpTdz956F/UXxgm5YLCf1GezQCxSGO?=
 =?us-ascii?Q?Dbq8EHItCnAv8FLuTbnCqYGLLkyYQqKiZM0/ZFEjXyD68wcwnJSEP9kjqSk2?=
 =?us-ascii?Q?gdRJLYYai2znhSBZkmnNGYBD78sFYOZQi/9bnSxE8xweVGjsH5SBhHPx4dnJ?=
 =?us-ascii?Q?DwZcm/gbNSj1j4gGzaWoBjEOLb1v/0WOnpoZvdMQnacTehxAbLun2HjP6yxY?=
 =?us-ascii?Q?xMadyxL1CTUFqH1+xzbbshh/uijP3U5zK/Hny/k1Pw22zQW/LOpPK/kW0A/K?=
 =?us-ascii?Q?hbWwbF1HHevfuNH/y2ERv9SQaYyo9/p6bDuu+ilfRwbJ2ty2LUZO0rG0ERdY?=
 =?us-ascii?Q?A1hCF0IRNaER/KCC5boJ/nhPHXWkJEkYtOBrZQNK6mOsawr7ObrjUUoZWAJm?=
 =?us-ascii?Q?HdQyEmuRClSFTfGAdR88T8CWwDVA2N9UvgL4I24iUjh1MhxEd9Vgynte7oln?=
 =?us-ascii?Q?dhS9BH/xmVFgobnlUYFv0EHpl7EPU/yS0LNqZepc5IXvZQYN8plT0Vvs/JUR?=
 =?us-ascii?Q?k2mz3a8fLolg/zyWJX4PpJ5vCUWlqiqzcWdRv71UqUU4cNYLi7c7gkUV6bz3?=
 =?us-ascii?Q?WAoike5eAop4wWNBtquVQJWbch8yV+qhFXyHPDy8imn7CyJzif95JLWoVl1y?=
 =?us-ascii?Q?I3+7qJncqh5H9XbieYtBzfhcfNxFnCbLjET9KnZT5YGcVu8pRebgX8vEZ9P9?=
 =?us-ascii?Q?LcDfnIi9pKGM9cbMegXe5FR9geYtM2xoRqngDc1AYlG3b6laVVXr/gVvHNCY?=
 =?us-ascii?Q?kxp4WSwfTJ+eyJ1LoH9RUpIk7KLZmExiClX2uTd2uFtagrpICHto2raw4k5Q?=
 =?us-ascii?Q?NP6Q1Gbuxl2TNRQwhmQnseTDymIcKHe8m162J12bMD3mtLK0+7EExoG+N1N+?=
 =?us-ascii?Q?tOS8Mw+Rz0/96uFQxH4K8MW541W2yfN49xmSUJYWHN7QmoFbT5HuWhHY9vpQ?=
 =?us-ascii?Q?Hnel28kY2LWyHX4qlWK0uZDUJuMCv5dBfScGrUGRTYUKHuT0kxtjgmKHheiM?=
 =?us-ascii?Q?4bKnpjwHgu56p/U1o0+thzjlTY4Zz0E6dntMhHngxDclcBY0+w51RPI5Z0Fe?=
 =?us-ascii?Q?AEdRflspvJZnvLBTC1R6wKH4hqznXTUEYRX6KiYo3plUQroelaLoHYQ7gg+s?=
 =?us-ascii?Q?h9FhD7FK+ZE+PvPZMkQIeVwbmGCtMJYHFmtALXICIKAqvuxrbbCtMAWzASbh?=
 =?us-ascii?Q?BA1dsPhcbSaazq9fHg9CHMq2FkHvcIW5OxcipbF99xxX5DTDOx17wXfYQ+ZU?=
 =?us-ascii?Q?9eixEgJ2nhUi/1WkG5VW8JrnG50QnXXJdSiZpi+7ORJNPGF/VqVFG3lSyiGX?=
 =?us-ascii?Q?jgxwSrOIkFSbHT+Lnx62gDe5TL4L30b9LKooxFdKlsceTNOPN6bE38LsUNq+?=
 =?us-ascii?Q?UHshnIuk9vNCZX4Ho2/X8rBltgNQ0pgW/V1vfkCbnnDnfOrbA/KBWZ4r+KW9?=
 =?us-ascii?Q?9cueQUITnVzr23+3HLl+VsllWq5um54hGiKY3+0HroV8u0NfRQcJB7EwMEtx?=
 =?us-ascii?Q?RWZDYnio+U2VhwbBu+elwBKpyxEONcTZyjzK1Ht0nnwTOWFyFBOEZeuQF2vt?=
 =?us-ascii?Q?U+sQSYHGdQA/qQtIgRyyenBKD5ftm1QuP7sp5dfHMJNnx68cjrZck39BwSXB?=
 =?us-ascii?Q?WZwVoyPq70+r/DSc/GYe5GE=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a986f01b-3ca7-4a4c-66e0-08de333aa172
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 13:40:04.5420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wIl+9CNzIFcFzecOyn2C2n5YprgkuEPEGY10aRiFi24BLaAni9zPuwQpQL0Viv1KKHaDv/ThrPFBz3TGmI9RhGnd8g8oIw4HWD07oaGVPmU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9128
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 13:40:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227295

Hi Dmitry,

On 12/4/25 1:57 PM, Dmitry Baryshkov wrote:
> On 02/12/2025 12:35, Quentin Schulz wrote:
>> Hi Dmitry,
>>
>> On 12/2/25 1:49 AM, Dmitry Baryshkov via lists.openembedded.org wrote:
>>> Upgrade Mesa to the latest release. Drop VDPAU tracker (dropped
>>> upstream). Add support for ethosu and rocket Gallium drivers.
>>>
>>
>> Thanks for doing that!
>>
>> https://eur02.safelinks.protection.outlook.com/?=20
>> url=3Dhttps%3A%2F%2Fdocs.mesa3d.org%2Frelnotes%2F25.3.0.html&data=3D05%7=
C02%7Cquentin.schulz%40cherry.de%7Cef95f0cf2aab4bf8340e08de3334a83f%7C5e0e1=
b5221b54e7b83bb514ec460677e%7C0%7C0%7C639004498472249154%7CUnknown%7CTWFpbG=
Zsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiT=
WFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DCZj4op1xrwDAMi1uspOBLiY61%2BrW=
XhNTEDVSmrWk2HI%3D&reserved=3D0 for the release notes and checksum.
>>
>> I'm wondering if we shouldn't add the buildpath QA check to upstream=20
>> mesa's CI so that we don't have to patch things up for every release?
>>
>> [...]
>>
>>> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-=20
>>> graphics/mesa/mesa.inc
>>> index 420ba2032b67..106767476ccc 100644
>>> --- a/meta/recipes-graphics/mesa/mesa.inc
>>> +++ b/meta/recipes-graphics/mesa/mesa.inc
>>> @@ -18,10 +18,12 @@ SRC_URI =3D "https://=20
>>> eur02.safelinks.protection.outlook.com/?=20
>>> url=3Dhttps%3A%2F%2Farchive.mesa3d.org%2Fmesa-=20
>>> &data=3D05%7C02%7Cquentin.schulz%40cherry.de%7Cef95f0cf2aab4bf8340e08de=
3334a83f%7C5e0e1b5221b54e7b83bb514ec460677e%7C0%7C0%7C639004498472262840%7C=
Unknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXa=
W4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DUQEWyxA4x0kstz=
ptuUFUZwbmd1c0ca76SxYl7IUjZN0%3D&reserved=3D0 ${PV}.tar.xz \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 file://0001-meson-misdetects-64bit-atomics-on-mips-=20
>>> clang.patch \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 file://0001-freedreno-don-t-encode-build-path-into-=20
>>> binaries.patch \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 file://0001-gfxstream-don-t-dump-genvk.py-args-to-=20
>>> generated-file.patch \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://00=
01-ethosu-drop-file-names-from-the-generated-=20
>>> file.patch \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://00=
02-rocket-drop-file-names-from-the-generated-=20
>>> file.patch \
>>> =C2=A0 "
>>> -SRC_URI[sha256sum] =3D=20
>>> "bb6243e7a6f525febfa1e6ab50827ca4d4bfdad73812377b0ca9b6c50998b03e"
>>> -PV =3D "25.2.5"
>>> +SRC_URI[sha256sum] =3D=20
>>> "0fd54fea7dbbddb154df05ac752b18621f26d97e27863db3be951417c6abe8ae"
>>> +PV =3D "25.3.0"
>>
>> Can we first bump to 25.2.7?
>>
>> We won't update mesa in whinlatter to 25.3.x I assume, so it'd be=20
>> easier if we had a commit we could backport for whinlatter right now=20
>> before the release (or right after for the first dot release).
>>
>>> =C2=A0 UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.\d+)+)"
>>> @@ -104,12 +106,14 @@ PACKAGECONFIG[amd] =3D ""
>>> =C2=A0 PACKAGECONFIG[asahi] =3D ""
>>> =C2=A0 PACKAGECONFIG[broadcom] =3D ""
>>> =C2=A0 PACKAGECONFIG[etnaviv] =3D ",,python3-pycparser-native"
>>> +PACKAGECONFIG[ethosu] =3D ""
>>> =C2=A0 PACKAGECONFIG[freedreno] =3D ""
>>> =C2=A0 PACKAGECONFIG[imagination] =3D "-Dimagination-srv=3Dtrue,-Dimagi=
nation-=20
>>> srv=3Dfalse"
>>> =C2=A0 PACKAGECONFIG[intel] =3D ""
>>> =C2=A0 PACKAGECONFIG[lima] =3D ""
>>> =C2=A0 PACKAGECONFIG[nouveau] =3D ""
>>> =C2=A0 PACKAGECONFIG[panfrost] =3D ""
>>> +PACKAGECONFIG[rockchip] =3D ""
>>
>> I'm not sure about the naming here. Rockchip also has Lima-supported,=20
>> Panfrost-supported, Panthor-supporter, Panvk-supported GPU in various=20
>> SoCs. I would expect that when selecting rockchip it would enable=20
>> support for "everything" one can find on SoCs from this vendor, which=20
>> isn't necessarily a good thing (c.f. amd and intel bringing in too=20
>> many drivers you may not be interested in).
>=20
> Yeah, I was trying to find a balance between having a per-driver=20
> PACKAGECONFIG entries (which would be a nightmare for GL vs VK drivers)=20
> and just declaring a "vendor", which enables all drivers, even if one=20
> doesn't need it.
>=20

I don't like the PACKAGECONFIG choice mechanism for mesa we have today,=20
it's both too complex and doesn't allow enough flexibility. I don't need=20
to be building stuff I won't be using anyway. I see Yocto as a way to=20
build my embedded system where I control almost all of it, not as a=20
distro where you want everything you can imagine work. I would like to=20
revamp the whole PACKAGECONFIG thing for the mesa recipe but I don't=20
have anything in mind right now and I'll probably have shinier things to=20
chase :/

I'm also unsure how much it is true it's specific to a given vendor.=20
Rockchip has used/sold the same/similar IP for its ISP as used on some=20
recent IMX SoCs, maybe they'll have the same idea for their NPU and then=20
I'll have to select rockchip when I want to build Amlogic's NPU for example=
.

> For Intel / AMD / NVIDIA it historically went somewhat okay, having just=
=20
> a single vendor config entry.
>=20

Maybe because those systems are typically less constrained in terms of=20
RAM (initramfs) or storage space? But we did have some people complain=20
about it, c.f.=20
https://lore.kernel.org/poky/2n8W.1754202497905279149.soMo@lists.yoctoproje=
ct.org/

>=20
> For ARM-based systems... you know. We have 'lima' for the oldest=20
> generation (gallium only), 'panfrost', which also enables panvk, now we=20
> are getting 'ethosu'. I was tempted to merge all of them into a single=20
> 'arm' entry.
>=20

I would rather not. I for sure don't need Ethos NPU driver for my=20
Rockchip-based devices :) (considering Rockchip "made" their "own" NPU=20
IP, I assume they're going to keep it and not switch to Ethos for the=20
next-gen SoC).

Cheers,
Quentin

