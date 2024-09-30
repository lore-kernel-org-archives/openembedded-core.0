Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E347CE834C
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 14:30:52 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.29])
 by mx.groups.io with SMTP id smtpd.web10.55942.1727706649164579405
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Sep 2024 07:30:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=GWex/pi6;
 spf=pass (domain: cherry.de, ip: 52.101.66.29, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UkAg9XrjH7WRANhiwL7tjVMNOl7say72VoeK7A8evw/7pdHMoMLrKEBSyaHKlWNOOHi+N1NGKpX3DUQja1OC/Tz4lyq6Pu8ZW/qJ2YLxztsF+OcDzm5lrVPsbo0wuf7Fo9PyFgCotdK+/ZJ0dLfcc6+LkyqR3SKwCRfypRt3/GdrDtkFYZJS7ovIDBEd1sQkUithjBAK3MBAszuB/lB+iHFtTaOcgDQoo0VBjdrA46kIdO4MzngLUFWd3dQdvheNlgUNkE3p5RWqnIcxVbW92TU6O7JR8+/mU4Hr7B402rKsYw0di3T8OnLZiHbdiVVU7Ka3gfxjMThnAjVWTzWltw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tmmQS+1lDsRj+QOidh6sLufd0ZnFZW98Ee+xUjAyukY=;
 b=Q1rotOPq/QHLS7fAiAEZOkkP+eefCmeA/3bkE0JRwaNfFdd77jIBPctGq+qxXlLU9SevWh3APYGTNbbrSbrLB1SbiHHqR+wYXgc1K5XLBbrCwfkpkXap1QOf1Zw7AbTF9Sg9mHsyHQMAnew6cvGWpO/ImhH71QsR7Ngak+6sElfKu0ulEt3G7kdeA+F0kALik7OdEdugnHMDHw5G3rm2irTrGlVdnNBccY7Dk04hfL4ER5twlDpbq+QpOfSk42ze8hk1XsEM9p2wfA7laS+yq985bViNQilJWTF1w1Ph+xBaRhcTBS84aHJimWpF6x87DYB+f9fwASmEVRXQ4U29ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tmmQS+1lDsRj+QOidh6sLufd0ZnFZW98Ee+xUjAyukY=;
 b=GWex/pi6YSGV0tS2enWXZVuvv02Oc841rdq+k3Ot/jKDxt47TaDsPzPAlROTWF1vEsLozqNL7X1xcKkulocc+8eeUoKCZn9QFwnZ1YaDzro36igTfHg2wTkgq+elEvff1kXbJZAjTPqoRrZlZnwD9+3SDxBYK/bGu6HFLru06aw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by AM0PR04MB7025.eurprd04.prod.outlook.com (2603:10a6:208:19c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Mon, 30 Sep
 2024 14:30:45 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%2]) with mapi id 15.20.7918.024; Mon, 30 Sep 2024
 14:30:39 +0000
Message-ID: <14d65aee-6981-4c25-a6f1-23022ee5ff6c@cherry.de>
Date: Mon, 30 Sep 2024 16:30:36 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [kirkstone][PATCH v3] kmscube: Add patch to fix
 -int-conversion build error
To: purushottam27.kumar@lge.com, openembedded-core@lists.openembedded.org
References: <20240930115332.925080-1-purushottam27.kumar@lge.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20240930115332.925080-1-purushottam27.kumar@lge.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0045.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::17) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|AM0PR04MB7025:EE_
X-MS-Office365-Filtering-Correlation-Id: e11338b9-3c7c-4b7d-5e4d-08dce15c744e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cFJSSnBGaFBMWXBIWDBTSjh0SzlLUEpXVlU3b3FJY1UvWkhwUHNZRlhsUWZL?=
 =?utf-8?B?U0dVVnI4ODMyb2Yvb3czUHdmSG1JMHNHUFJIc3VaQTNlM004UGZ1dDYrRE54?=
 =?utf-8?B?TUhTR0p0RnF6M0pURnVHSWdNa3ZhK2R1Rm9CRUtUZ0hKMUlncVhwcGQ0S1pn?=
 =?utf-8?B?THpHK3ZOY1VHeTN6cDNTOFVINUQrVXFOQWZYYmJBOXFuc1hub05aY01wU2pT?=
 =?utf-8?B?dWJGK2NuN3FDYnJrR09xVEU4VlhCUkJzRWtQQVNxZlU1Tk92K1BnaEdXemd4?=
 =?utf-8?B?UFBZdXV2cGV0MFp6LzNEdlowNjRWMjdUQVg4Wkw2dmlpMTM5Wmg5bThYRU13?=
 =?utf-8?B?anZZaDZadmJqYndsQi9OSmI3bGpDUkNHL2YyUVlUMS82NnhBY3lhWVY5VjRi?=
 =?utf-8?B?VC9KemF5RW5KU3ZxZ1RWd3BnQjlmSU5nS1lnd1FkSm9zRm9NOXpDRUhaT0Z3?=
 =?utf-8?B?c1R0YnBTbjViaFRNOGpXTTd4OWpzQ2FBUHVIOVZLUHZXaFJaZlZ6bnhqZDFm?=
 =?utf-8?B?Vm1leDlld3NjWkI2TzR6MnZrZkZtYmJjSDVZdE9YRlpvMmdpcXZtTkhRdkc0?=
 =?utf-8?B?VnFvcGw3NjNCV2pQOUNadEtmR3J4NEVEbFpwTlYxRGlsbGVCVGJSOXFpaHMr?=
 =?utf-8?B?NmNwZWU3aks4dXdjVGRBZ3ZWaEtUbFdyQ2d5UHZkKy9ocm5DYTFzbC9vUklU?=
 =?utf-8?B?Q3JqdDI4Zy9UdzNjQzMwdk8xNlNpZUFZYjRlaEtHZTc0clRQaXVtakNzelN4?=
 =?utf-8?B?SzRHdjVCNVNvYVpRTDdhclJFTkhCQi95T201dHBZK3l2cG92dWR3QmdCNnJU?=
 =?utf-8?B?OCs3SlprMTFibURVdFRDTGlGQlBjS0FUbzJLb0l5SEZoRmVxMVF4Mk9NcSs1?=
 =?utf-8?B?b1huT2txYjJZanlISE9ER1owUldZaEhtTWpHMktKaUZKT2xNU1NaU0VtSy85?=
 =?utf-8?B?UFduMklSZnNLazhSYnorLzlUT3F3anN1WGxYaEJ3NFBwUFhEQ1c2Zld0SW5W?=
 =?utf-8?B?YThBeTRnemo3aUY0L2NLV2huM3ZDeHRtRXNhbm5HM0w4R0tpZFFaQjMxZU91?=
 =?utf-8?B?M0tLcTB6a0RBSTgvWW44K1VCK2ttNjBvZ2JUM3lJV25Sb2lOc3NRZGVCdTRt?=
 =?utf-8?B?ZDF4SUtMZlp1OWhSbHF2WVdoRUZoeGZoNjdYZUd2dzBjazc3NEgwV2JrN09V?=
 =?utf-8?B?emhkUDlWYWxKVi9iYlkxa2d1MlBvZXFiTjBzMkJ3Rjd5ak9uV1BWczBja3kr?=
 =?utf-8?B?Q3VtSVRQQmt4OTFQcG1FZzJLbndoODlKd1BJK3BJMk1LQXE5aFMxbUtwdUYr?=
 =?utf-8?B?M0dobE9kbzF1QnpBSmt4bDNkRXRsM0l1aGpQcHlhTEF6R2RaMi9mOTdJeWt2?=
 =?utf-8?B?SGw5S3hRckN4dUN5NFdZT2g3aWdncitxY0ZDRGt1NS9LbmhCQlNrcDJYTS9N?=
 =?utf-8?B?QS93aXBqM2I2d3BIb1Q1cmdydnhoWEN5NzZPcmxyZzV6TCtuZjhuSVUyUFpD?=
 =?utf-8?B?YWc5RGlDUzdwTUJtdDBURVh1TjNmb3lOUG13bktVWWxtdElmWi85SmZDaDI4?=
 =?utf-8?B?S0psMVR2RXJ2SFBkbE9tUXZ4cHN1ak9nTGY1YjJCc2tLRU1IYXJKM3c5U1Q2?=
 =?utf-8?B?VHFzOGJQTTJleHFIYlZhbTl3R28yUU1mekxOc1QxUk9sU05rb09KQlFvampp?=
 =?utf-8?B?ZTE3L2VwZzM3L1lQY3hBU3Q4eFVXSUxRVnJtMnp2am1vR2I2V0xuYWl5Lytw?=
 =?utf-8?Q?9aucp7hk2KUfR6dg98=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RUpONHczMklhU3RrZkphWGt3QVMxRzNERWdnSlI5S04zNGFNajdyY2k0bjMy?=
 =?utf-8?B?dVYzT1NtUGRFVHo2UmV0S0NvYmtGUlVDSXE3K3NLZ1ptNGN5OGVNUVVXLzRM?=
 =?utf-8?B?QjdxaFZVdkM5NDhOTkY5blpsZ2x5VE9wZGl0bnNUazBqUldFSmxCemZ6ak9K?=
 =?utf-8?B?SVo5L1JxZ2JYRXFYekJDTXFjL1hWVEJyb1hSTTJlSy95WWErL3gxTFR3VXJj?=
 =?utf-8?B?VG1zQXlmT2ZuQzFzM0xwOUxWN2RGelFnaVRXU2g0dko3RmYzOFBOOFlqcVll?=
 =?utf-8?B?Z1M1eDdhOXlVQi9oQnVYRGFjcElvMjJaYzlRcUJSMVpCd2FPU0pPVkFnWXgw?=
 =?utf-8?B?ZUgzMWF3VUY4VWpPZ3hyMERaM084WE1KWTNlTzlYTWFBWU5xclF1eXI5NE9r?=
 =?utf-8?B?ZkJTUmI5cTE3cGdDdEQvV3MzcFAwcmMvUGsxN0F3bjkrQ1BIeWpyangzZXRK?=
 =?utf-8?B?RFNoRW9qTVRZZFhkUFNRVTRSNVVKTjdyY0Z5U0Z4RHpLdkViejN3VENSRXJi?=
 =?utf-8?B?T1hoV0t4Sk90TTlzcVVkdExEYzU4L3JpSWxNbUlET3Z3Szk0QXQ2aWhsblBp?=
 =?utf-8?B?cUNJUHFvZnZnMVFiMFZoQzhHR0FMdVQ1VVo5VExSdWJ4UHFvMUJ5N3VaN2Jj?=
 =?utf-8?B?dExxbW1vUU1ReEhVY0xWdWRtQmszM2tkMWgxUDU2MnpFeFZtTWd4UGM0OWN3?=
 =?utf-8?B?bmlHOUhlUmh1dmR0akloMHh1cCtMMkRhTi9sTWIzUURmaUFpTkFJZ2tyVW5X?=
 =?utf-8?B?dmxsUW1zaWh2ZkJTeGhxZkF3bDhaZlhiL0NOc1VFWVZuZERxb2VJNjMxbDBr?=
 =?utf-8?B?S253N0dZRWMzdWNaamVDM0tQWWIwdFQrOWIwNXJ4dFI3bWVBQmdvelh0bmlu?=
 =?utf-8?B?bGU3bDVVQmd6QnY4djBzc1ZUdXY3YlVrSHNkbUpXOEdaZGxaV29Wc2ZYU2JM?=
 =?utf-8?B?V2hkcldkODNoUXh4dmd6N2doVVZYSE52Zjl0VkgvdE5RWUg3d3hpamtvQUZv?=
 =?utf-8?B?WmNwNDBjaE04ZldFRy81MnVXQVVVRWNXTWpUWDNxYVFDQmpKSi9FWCtqT0hX?=
 =?utf-8?B?elFIcXRHWEZZaGZkTkNGcVRwMFFvUlk3b3hITmgvQ0FrMVIzQzJyalZaME1F?=
 =?utf-8?B?R09Ub2c3UHdhUTY0ODNzWXhSalJGVHRWOFhiMUFHaTRCdjVzUVNneWVFSVY0?=
 =?utf-8?B?ZUUzZ1FMbDhrV1VIckhXRy9Sb3RROFVESUdoSzB1VithSmlIYURLaU1TUW9E?=
 =?utf-8?B?eFRreVNKTmxOQUovRk13THlKUnVubUdWR0k2TmI0bHB2Rm41K3Q3MTB6WWR0?=
 =?utf-8?B?QmNDdnk2dnN1MUo5MjZ1MHBWSVk2emd0TWRadGpVWmQ2clFuci9BaVEvY1lL?=
 =?utf-8?B?M1JEWTh2VWJQOFFnVURVUGpPMjk1My8rOW0ySW93ejQ0Qk1yTCtzWFBhVkFJ?=
 =?utf-8?B?cnRUbE5kMW04ZmhmS2ZrRDQ2dlVTVXF3Sm5SbXh6TlNscUh2eGMwcGYwdDRW?=
 =?utf-8?B?dmVuaytYZWROcjdyck82WXUvUFpHd2RxU3dJTFlBa0NkcHN2b01tWmI0WVNX?=
 =?utf-8?B?ZjhLamVuVXM4OUl1cWt2ak1IMWdNWUU3ZGlxS1VNVFNWTndWSC9uSFBVeWJU?=
 =?utf-8?B?S2xsZlVTeHZ4c0owajlPVkFHQ29hVGZ3eExPZnoxT1dGSjFtaUg3MllJc2R2?=
 =?utf-8?B?anZIYXUzd1dXVFRlUHFiNWRSczhBelE3Vmk0OXZYak0wWlFSTkcwSUxMdXN0?=
 =?utf-8?B?dTRLN05JNFRFcFdjenVReHN3VVNjYXBFOFhUaHBLbnI1SFZvUy8yUTBMa3ZX?=
 =?utf-8?B?VWNRQ0tkU1MwTWRLTlF6NTNVYlNWS25YK0szU3RCRVFKeFdSdTJMbElVR3N4?=
 =?utf-8?B?WmVnd1lmbU5QWUpqS0VKN2ZLMGZTN1ZQMlF0TXdxTkpnV09YVDkvV2pvd3U0?=
 =?utf-8?B?dzB2czRPVEF5bTJIV01tbnpYUHVYb0M0QzBrK2d6a084d25YNEZTcjBMV1hl?=
 =?utf-8?B?U0haL3NmMHViQXQwOWN5aFczTmNnVm9NNkw2a3laM1EvUjRQbWk4Tnl3M0lN?=
 =?utf-8?B?N1FoRnY2ZmJpaDNFOWhHZjNXV0o2TDNZbkJaYm16bzNURVBRNEFXcmNGNjlv?=
 =?utf-8?B?NTNvdG0yNHZKSjlxR21maUpENVgxZkJ6TmJiSzdXaXh5WVJiVGdKQ1Y4U1Zl?=
 =?utf-8?B?c1E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e11338b9-3c7c-4b7d-5e4d-08dce15c744e
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 14:30:38.7912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DlZrVcRJ0r1NXfuZtC8pbkRfjDYYCoPYnpQs7nx9lVJzTwROrNum5EdIpG8b1GcYlSLnoyApDzHBFHe1t43PpqjCpSIVEZ8ByjcwRzsHFJI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7025
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 14:30:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205119

Hi Purushottam,

On 9/30/24 1:53 PM, Purushottam Choudhary via lists.openembedded.org wrote:
> On some platforms, `EGLNativeDisplayType` is an int instead of
> a pointer, in which case the void pointer will raise
> a `-Wint-conversion`.
> 
> Add change as a patch instead of updating SRCREV .
> if we update SRCREV might will get compatiblity issue
> with current gstreamer 1.20.7 version because SRCREV brings changes
> which resolves negotiation issues encountered with V4L2 stateless
> hardware video decoders when using kmscube video playback option
> which has gstreamer dependency requirement to 1.22.0
> 

@Steve for some context: 
https://gitlab.freedesktop.org/mesa/kmscube/-/commit/4961a04b4a434aefbd412eb24fb76998036eaaf6 
this is the problematic commit not allowing us to bump kmscube further 
than d12ba659695631e7a22dce8fa5d0bc576a9c2241 (or we do, and revert that 
patch instead).

> Signed-off-by: Purushottam Choudhary <purushottam27.kumar@lge.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

