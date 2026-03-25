Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19150109C02D
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 14:54:08 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24635.1774450438496258865
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 07:54:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=lzXYJBTA;
 spf=pass (domain: cherry.de, ip: 52.101.70.49, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tcb6cHqkjYAZNmD3sC8dHTRMQymlNRKOTqawqadDS9GsvY1pDROFeIqEo9KeFgSh3w/5rdDj78XfZP7F3SCOXrG6N3PpWr4fbP/CTQmaOt3DBoRBtVgdq2+WAdskLwt/WS6a+jSGZZut306ro9kHObk+rlnwlV7WRi+FUy2ebxrfKhdOEsDg4Imkyjzevg6SBzEiHGTjspbJjOKEKeeAREhjQr4UNEdh6oLmX/H6tSA6bzq/U4diLW9uXQ6h2xbgSkHxTzhgTWFwHl6v9mjUL68Ia7YTu0heNy+WYUMfu3TxLBu046d2d5fDoXIgWSGxT3vM9ookWl7qLGjJMSaZzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iLwkc6PFonUXmAW56l7Rt/UI+ifot+JX1mStkR0kXXw=;
 b=NM5d0yhqP6zl1lwDuUQyGzabgahiQcS+CarpLIuNRqcIrh0alBZKDuiTwZa7/sOQZjLMhAQO9gqdrBESPT+43W2GOp53K3pkxhCD/3y0x/kgp5Lt3PoDE6G8l4kO/WVu9ZCq2khtPhXNziaB6+fXtWDLwnvHZD99TmOYpiOJjnw0RJl6vvDoMQTTgD/qs1ZjBdnXVob0Kz0jQ4ivJY6hUBZa30e5itfWJCc0rjz1BBUvThDwvCUEnC9E5mqxbLAJJ0752CnOe7GeptVhKY0/8QcRJfOUzYUyD8SeVE2mukIyzgwGzUMwtk6REDviwWNIEM9RnHpFatuoA5x0aUyEeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iLwkc6PFonUXmAW56l7Rt/UI+ifot+JX1mStkR0kXXw=;
 b=lzXYJBTAoH/QgSQae0kl7gWe1XZgmMcRcRRzgs3t47dj83Y7OGiks8MjW3wgdC8P/8Ba2lsnAyZDKHXepydxZZ/x8HVP9ZUWdR0q8EDImcbwEALYB9VXAW64q+5wgo+KX9tmKiAGxy8q9yvtLHxmvRNzdlXlu8upG8+9OvmBqaI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by GV4PR04MB11353.eurprd04.prod.outlook.com (2603:10a6:150:29c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Wed, 25 Mar
 2026 14:53:52 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9723.030; Wed, 25 Mar 2026
 14:53:52 +0000
Message-ID: <2169b9ae-3e23-47b8-94cd-09f985f8c8e3@cherry.de>
Date: Wed, 25 Mar 2026 15:53:51 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] mesa-tools-native: fix do_compile failure
To: raj.khem@gmail.com, Alexander Kanavin <alex.kanavin@gmail.com>
CC: openembedded-core@lists.openembedded.org,
 Changqing Li <changqing.li@windriver.com>
References: <20260325073954.1176537-1-khem.raj@oss.qualcomm.com>
 <CANNYZj9AkosvmmNePiALvwVkR2rsthvsGy3ARLTmWxKh=t7OaQ@mail.gmail.com>
 <CAMKF1soXSQxLU3eRCejvHH5HORG9xRMxObU+svnAdd10JAs37Q@mail.gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <CAMKF1soXSQxLU3eRCejvHH5HORG9xRMxObU+svnAdd10JAs37Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: VI1PR07CA0297.eurprd07.prod.outlook.com
 (2603:10a6:800:130::25) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|GV4PR04MB11353:EE_
X-MS-Office365-Filtering-Correlation-Id: bb1dce4e-5b85-474a-404e-08de8a7e54a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	aC9b3BvqLoBjC1s2sSEVp00lqYiFS6NbwmjEAEQrW/mvA6rriQT9SxWVthC+PMgrJvJ0TLMxQFcXJdElAb5D5puaOcQV7HTiGqoyXNKhviqQn2cdmiDYttqID6J+620LAldO0XBSAb85VrVKSQZFB44WEZkenea12bix2Jt/RO7lhgMAi7o5eDJ0KfPjFAdiO/OQl9fxp7KdDjAQut2+sbbSUS6wqtJL++loEIyf9AVBNFRcyScGxkG4R4Nv0RjyYMGZboiIsSYRImSZJpNg3gKCH/ZUQUvREQ8Ntzsd6It7e8YigtTLJFde7Hs5yvAoA8F510oIfyDC3g020A2DlpwIXhwnTnHzGueblmOd2tACqqKxlisOVRxGu+W1ax2Jdz261qTO677tBu7ANw72XAsGS7hjsxqHZ38nChiQuLMh351rILIcBJnheTJo2izxDX72R95jCPeHTTr2gp5eUTMtJJT/kvzhuBCJll2vb+rFh9rAVq5TMIGLnMFB0YOwKI0+ayEqM6N6y0B8yWColjvLorliiW0ZH1LZ8G6F6KtK3sFm2f5IZFCnmojCiS0KmjNhCqVO0f/ZA9z4MGze4Mxmnejm/vMv5ORgg4h9GVDwwbhWhhjgDBW+0wmw/kAkLR3nfj2rcJFVM8Tk+8EZLx8pjFPOMH4U0Mj91ElWmYjMARimF/Q9Z5xOdFZ+HJkoIjrkBGMox+TcwztBhGJR/8tKteQbFBl/ErKXFwBy+i8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?r9inY7ZPI4jbVt/z5nb1enO4ry+MldVhwY55P5GcrQYPg4IH1NfV1vQeQWNu?=
 =?us-ascii?Q?ujX3jZ4VsQCgHURE1C44t6jxQ8pEe+eMPHvTMp8MeljBMcHkHnhbsT2M9f/T?=
 =?us-ascii?Q?41JQDZJPZyr4WGEyMwX7xAigrJYxk4nXpL5Yc6iYWAK+nlHMvb/DqbunYqOo?=
 =?us-ascii?Q?6UZzQgr8X9Us1KerypR8utt0oGR9SRcc25EQO7Aqr7knCumpTqIn/6OO3UNf?=
 =?us-ascii?Q?zrphyIxAmlgvpVuHGbip3c1mSG7eduCEqkrZyZkKMwmUJp/T2bWOzcH5gQAr?=
 =?us-ascii?Q?/x9Da6PjpQrvuA5GIUkwT2C31Xh6UYCP83xU/wz9+4T7OQuCcRkG0JMeNCd0?=
 =?us-ascii?Q?TxulwvrmOzwY+CARMmQYH7uFZZs8wLpUZLWwZDU5siQpJ/WBPYw4lFH4RFYv?=
 =?us-ascii?Q?5zAxXqOAB7cutj0O8DW5AqMIRyxmqKsKio+IChRpHrNmNQ9SXWNEWmZqM0F3?=
 =?us-ascii?Q?sWNVZL8rvmNTH1vIoX3BNhoMblPyQ91pdi/RLGKtYiL7KAA1ZLwwK5hq4kVb?=
 =?us-ascii?Q?QXtF72NbJMiEms9K1tjPEnjNoGc62uKxNXoid3YQ9SrUYbaCNMubtmyb2qOO?=
 =?us-ascii?Q?qrZYxuHraUNGA3QIlrWO2GuocclsX6O/aRrvEX4QuvDtvuryDTZmcRGyxpoM?=
 =?us-ascii?Q?Jg4+CM/afNMb0fjGRBJrx0FK2joJktirG0QtN1MaDIyefOd8QzACjsG0FBGq?=
 =?us-ascii?Q?iAlSr6Ql/nxRXMMbLPaACfRoLS/x4yeW4+pcBnr2+M6yVv7v1q2ArLY0kuxJ?=
 =?us-ascii?Q?oUzQaVhmm+KhikHdV0x1pDbUxGLhmoRJbYsBy9zHZ2C2DMmNeIGKogMlyFo8?=
 =?us-ascii?Q?QZHvUhq0t7bAbGQTzj3eBfCBBa9e5wUW4OvEWgeImYGmLyPRldjEeMwdHBI+?=
 =?us-ascii?Q?e1N3Vc3Lp+CBBTj4c7TMYJ7PDtJtmiexNENj/3wOYZmqDAFYjR96L9rJOWC1?=
 =?us-ascii?Q?QlpOc/uwyUBwIJfQNOwAqhVDIv7u+MZrIwCyZYZdHzKivtGrPhkTTu5tOCOk?=
 =?us-ascii?Q?Bbs+SZKf5hVXp89zVyUt4yDU8nmLx2DiBX5SAK61CDdcA/p97y/adtaOsic1?=
 =?us-ascii?Q?ifqBeGx9pGxWFlamGinC8Qgi9fmSiye7w5RFYVI1dn57mhk0jdQggcittdP+?=
 =?us-ascii?Q?gCADoOXSzqwNa6xNg9akOI9o1wsREoTRWS+0JW+RSxEVxN8UPtNvOqd8NKCN?=
 =?us-ascii?Q?VmnrTWBvBaBCoW6jk5/vUfKPJOD3eBPuunb7YSn6G4CE46Ia/ZxViOBCNZBi?=
 =?us-ascii?Q?cQokWsWPrgtYR+9nhYEVCJ8lzs/TfKjaERbQytm270oIGyeAHQVpIJ8QTOEq?=
 =?us-ascii?Q?e8QFAGi49DzSxny79jg1T2DGUmwB90npFM+eGAeguyMH15YerCvryCEP8Huq?=
 =?us-ascii?Q?xh1K/w+5LarmrarA1tMUY43ADVf/ojcSDDyS47/L3P72cGmtxKVOoCZMD8Lp?=
 =?us-ascii?Q?i7LgtKXHp956Mj3XpTI49J53Fvzb/VvSQ3KwGPUI/dK3TuAk3vXasA3RFnaB?=
 =?us-ascii?Q?rtVSsLdy2x6wADWvDmqJCYK+4L6KAjyXWzpKVjE1bER9ktA7fa8dSu5BVhZT?=
 =?us-ascii?Q?iAjT0bHG39Nia/206ViNhyK9IwBFdS+xzxi81o+syXt9SXdAOLLwP0j8c5gY?=
 =?us-ascii?Q?oCit4thmZ2NBC+eeqBXTYGP/dVHjg96WOb43P5Yet2IbFQUBmjaB2cY8eiQW?=
 =?us-ascii?Q?GqT6tjI5EkEg87HQejES+lKKa4SLmLF6srqLWFBo+tbvc46RISDlBehQPbH/?=
 =?us-ascii?Q?/pX9hAltxQ=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: bb1dce4e-5b85-474a-404e-08de8a7e54a4
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 14:53:52.5157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Kdg4/6U/ATvAcoKI1cNPXz/NCniq/7HUb1MASY3c9e+Z5W6mHPF55MURPb7vqFkSBpiJivI4H2Eog84W3UkuulRpA4MUlgqHUA5x3TUG98=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11353
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 14:54:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233923

Hi Khem,

On 3/25/26 3:46 PM, Khem Raj via lists.openembedded.org wrote:
> On Wed, Mar 25, 2026 at 5:52=E2=80=AFAM Alexander Kanavin <alex.kanavin@g=
mail.com>
> wrote:
>=20
>> On Wed, 25 Mar 2026 at 08:40, Khem Raj via lists.openembedded.org
>> <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>>> Fix do_compile failure:
>>> ../sources/mesa-26.0.1/src/panfrost/lib/kmod/pan_kmod.c:7:10: fatal
>> error: xf86drm.h: No such file or directory
>>
>>> -DEPENDS +=3D "libclc-native spirv-tools-native
>> spirv-llvm-translator-native"
>>> +DEPENDS +=3D "libclc-native spirv-tools-native
>> spirv-llvm-translator-native libdrm-native"
>>
>> Should this be in PACKAGECONFIG for panfrost?
>>
>=20
> I have opengl-only image to build for odroid-c4 which does not have
> panfrost.
>=20

It "has", due to building mesa-tools-native which enables building=20
panfrost tools unconditionally.

panfrost PACKAGECONFIG may enable building the gallium driver (if=20
combined with gallium PACKAGECONFIG), the vulkan (panvk) driver (if=20
combined with vulkan PACKAGECONFIG) and/or the panfrost tools (if=20
combined with tools PACKAGECONFIG).

So it's a missing dependency for the panfrost tools and should be added=20
as dependency to the panfrost tools (see my other mail). I don't think=20
you need it if you're not building the panfrost tools.

Cheers,
Quentin

