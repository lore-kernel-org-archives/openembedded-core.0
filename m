Return-Path: <anders.heimer@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27182CDB479
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 10:54:25 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4225.1782298463894518392
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2026 03:54:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=eoSwiGBn;
 spf=pass (domain: est.tech, ip: 52.101.83.54, mailfrom: anders.heimer@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J5HykJCjGUQBuvuGlINC5oUpw4NDJlpOGefJ91fOF3+l24lYGDfA5TM1Hl7e6ak0vYmkWy/RQxaT+SpVYcdT2LL++OeRj94mMaRKTje+80BJJavcu/oZn9x93AdtNM+/E/4WEUJ1T3uDV/uA7iiIgerY7ZhMNJptl4n1Z/UryaGypMiqC63Q3OEY91tq+pRffoolALjz9J5DbUI3ebfKBeoZd7XIVxSVrfVy5NT9fKXmFyotHoQ7X7oFd0kiecWkZ2mpb2Y2EP77h71ChNhUrhzG2B95F6pWQuLYqhvfT0AlQL4HeQkkFbAkeN5TrslN11o2AcgYjmgqsGtoAyWRbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/NqaIM8R+4tx9k+ZcgnBHefITxmPXJTZBZcrOZE3BZk=;
 b=W0eLnf5EO5WLkBay8umS0FdKJ8eWApiFosp6YuhFxCp5UbJ+fcK9t+KhEBdJ/aBOkV0x2BbyD+4Sq4fR0n5t2QoGT6PmIbM+42/tnXdjrVlyJBem4zvmm3A9B3zJZCd5TSV6mwaXX4NbM33DMUFSuyJoL42TLqbvfgeGrqcfATBrxBK26mDIZgaPZ/rsnJcgBgQIx4UvbVUpNmUZa4D/F2Up2QHzJToFNpUmvQv31Oi6NI7UxxG3W65XPdv8lIS6MzKukhozPz5HL0bSpta3ThaDCtANVWBTEqfoqNwKwiBMorOz9Bd88RyzbQpsgioVLyF1C7n0gvjP1NdWbyv8aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/NqaIM8R+4tx9k+ZcgnBHefITxmPXJTZBZcrOZE3BZk=;
 b=eoSwiGBnX+fHutFHFO9IX3B9hCBW6lCURzbQvGCM6wEo19N3ab3plG+ZuyIKKfeY8jK6I0dOIoEp6hRSQpA4CkXKC1wHo3pkjMVSjQAe/G9Tm11yq+25IoFpvqInGBVrbbJSUMyz8mlwLazel/bS5+5I7x/fnMe0qJxFjoV/7l/GiEOz8Rq9TaJHGdTWLTzKh2b+oGB1fXCHhW5ZNg4yFRafYqX4vFDWAbRHdeLoI5XL02SuucBmKYCSa91Ink7eivcTzIxcbOAt6ZxOJi1Gbf9KbPHleP/9ieOQ5GzVYwMUM+/s5DTWZXd6b7ZkBzn5zMHm54rdscjrhbxtOoeuEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:2ac::9) by
 PA3P189MB3186.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4ad::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.13; Wed, 24 Jun 2026 10:54:19 +0000
Received: from DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82]) by DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 ([fe80::90da:b700:f102:5c82%6]) with mapi id 15.21.0159.013; Wed, 24 Jun 2026
 10:54:19 +0000
Message-ID: <a8a958a4-d23f-4a8d-afb5-9ab4e0fb67a0@est.tech>
Date: Wed, 24 Jun 2026 12:54:17 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 6/9] oeqa/oelib: test GitApplyTree patch names
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org
Cc: Daniel Turull <daniel.turull@ericsson.com>
References: <20260623133521.17053-1-anders.heimer@est.tech>
 <20260623133521.17053-7-anders.heimer@est.tech>
 <DJH48HDNLJIW.EOQTZ79XS7CA@bootlin.com>
Content-Language: en-US
From: Anders Heimer <anders.heimer@est.tech>
In-Reply-To: <DJH48HDNLJIW.EOQTZ79XS7CA@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU6P191CA0029.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:53f::28) To DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:2ac::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9P189MB1641:EE_|PA3P189MB3186:EE_
X-MS-Office365-Filtering-Correlation-Id: c2c73265-4dcc-4d2b-9822-08ded1def0df
X-LD-Processed: d2585e63-66b9-44b6-a76e-4f4b217d97fd,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|56012099006|18002099003|22082099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: 
 h9XRoi+SJt4P2m1R+4DX7GNzOAbRf/BA61nOYS4Qniu+GGNaj3w75vfxRsjeV1ikPfYrhzBsJnMyWpGdrPgMPkrfDwREDiq0k/fDldUVSWtXa/OcYPACwJwJXgQ+FlBeEUjqCjkx/yQ0UBKz+fPBfeDDwOEfoL4anCfloA75Hh/xMRS7f/B+IRWmwfv6pFXHsRlD4RASx4dh+gReGQ5rsEtuRfkCvssn/Wdqs1Qrg2qIJ83QnkMgFxXUdJiU5tHyv826MXuDUPzTvJXgxBU74VG16F+WG6RIhCd5xzUYYl/YHgkGbN4Ggl7Cil3OeF7rluai81iL+VWvHQZPi//OoJ2Zyl0W2yN3ju2zVHd47b0CRdys9dAiswMcND65mdLHGEF5lZK3/E1Hqx9OxZMCpWwEHWQxSOLw2NuzLbg7cjXer/j9nwpKB8FRGSyHK22O4O/pf8/mSV6wnPQ+30oATQNCi0S6lR0+A9QN+Zpf5fw7yibzsxUsGd1+iaTWQjlEGGMlFqrZEvfESA3dbj7J84G4o4wV8xD0BlCdhX5BfpGI9VRTJEmdmOTLBCr1sPsgEI7FBYjOjTSoK11deuFKmei/tvuu3l9+FFenDpkGJ7nhl01uMGNLzu7oP+aXts3p
X-Forefront-Antispam-Report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9P189MB1641.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(56012099006)(18002099003)(22082099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?utf-8?B?YjlZWCtOS0pGWU9YK2p4TTZ0SmE0L1d2WlRyME5XUTBRT1N1TFpnOGwvRHg2?=
 =?utf-8?B?VFJHV1dxWUdORHg1U2ZPVWpLak03bmJXOUIvM2JTUDFCMVdod3lTc2ZPclhk?=
 =?utf-8?B?QnEvaWdaREtZR1B6a2d6dXZBME54akJkK0s4RU9GRVpYVVVSZ3JZckxYT01a?=
 =?utf-8?B?NHZqV3lhNTJ4R0dBOFA3NzNMdERNNExieVB0MTU2emRId0JXY1VoMVFSSkl2?=
 =?utf-8?B?YWJoT2dNWERXTnp3V0NTSlNvRnRmYm1TRmR2bDNVaXUrUTY3N0I2OHQvNHdM?=
 =?utf-8?B?aTRVZmViVnBvZDMxYWcvLzR6VlhGNlVjUzVORjVKTFpoVzV6bnE4QVdlV2ZW?=
 =?utf-8?B?L1dKZEZEWDZzRnBCb3YzYVBqNmZlN1pOMHhJdkpoS2ZvNTJSSnRUWmJCUlJN?=
 =?utf-8?B?NnlseUFxY2F0UFFSSDZ1cDlQL2hoTkQyWUx1WVAxbU1JeGNPQjlCT21oOVJ4?=
 =?utf-8?B?Ymd6a3MrT2VTaUtNMldiZyt4K05UUHdXcXdKUER5VmhmTXh4R3E5N1FkODRz?=
 =?utf-8?B?THdYQ0NmUmpJVzlZdmNWUUxiOUFQbUlHWjdxaHJPcmxyZmZEWEVHNFF4Z251?=
 =?utf-8?B?WUlWcTk2TFlwb2pENk1jUVBQNFRWYnZtV2RLWnpPcFJWZXN2eEt1c2VEQUVF?=
 =?utf-8?B?b3p6S3JlenZxMXcyb2tVbTI0UGdOQVF3a2NBK2ZZekpoWjBIR0F6UzJaa3d4?=
 =?utf-8?B?aHRZOHBTalBtYjZGSVZNTC9BWkFiSmYxWG5PQ3pFUkhmc2RzWXRCWHBING14?=
 =?utf-8?B?S01sY3dLSnMvSEkyVVFRcWJBc0FyNHREc1JnZWFzbUVRb2JGckVpU2IxeXk3?=
 =?utf-8?B?ZkVUSm5lRWZ4anpOeVZGL0dLYlpwYTIxMEtaQTFtSHIzLzQ4SVhnT1lINmo5?=
 =?utf-8?B?VWVmUm1vbkNGR0FNWFc1Z2xZanNCWXhIM0dJbVQ2YVUyclAxQkVZN0JuM2g5?=
 =?utf-8?B?UitHK3dhL3pCaHo1YlNzcXdCaVJ0RTRiTzArU0NQQ2tuY1JudHVZTFUxVXY1?=
 =?utf-8?B?SXFPMmcwaDZyRGFHQVV3YU9BYkp4b0lIZ2NmUTZaV3d6M05SdTF0UXZ0M2do?=
 =?utf-8?B?cjhwd3Z6bG9WTDJQVU9LV0ZPMlJBWTRTTFREUHZSZEJBNlE2WkpZaUpoVS81?=
 =?utf-8?B?ZzI5T2NWTGFJbG16MG8rUzBXRVQyYWhNSmdzdlJGc29VVlpzOFVEZXlIQ1BH?=
 =?utf-8?B?USs5ekJqZmNFQkE0YnRWWTBCSzA3UUErNWIyd0VFeTRqSm50SlJCcE9EWmxv?=
 =?utf-8?B?d2RwZWZkcHAwUktaOC81V3hvem5MczJrNEx4cUtLVmw2ek0rYjR6ZEVJK3VI?=
 =?utf-8?B?OUhqRDNvMjMwSHlPWXVwblcxdkJxa0RmdVJYVGtwS1l1TW0rZllXS3kwNXVN?=
 =?utf-8?B?OGJkWWpTZ055OG5JZTRPR1lPSm90TnloU0ZGMlhZWVFxWU96eHVpVGd2NWtn?=
 =?utf-8?B?aDFUN0xXVGwzMy9lY092NXRDRTJ0WDAyeGMxdndURjBuYmtqWDM1bzJlejJx?=
 =?utf-8?B?QTdLdmZ3ZmVmL1VCZXdZT2twQWhaRGc0eVp6aHFheHRNQVFJeUFhTExWd1ZK?=
 =?utf-8?B?YkZwbWw5ZGh1UUM3NjBzOGd3K3k1WkF6dnZmaC8vcmNqU0JCZnE1YmJ6dnp2?=
 =?utf-8?B?N2JmR2pOR2RzWTE2SisvS1dmTkNoTkdWQkJjK01ZL2g0bStQanhETHBONVpz?=
 =?utf-8?B?S2c2QVYzRTdWR0QycWtPQnd0UmVxbEZrZkk3ZUtickNwQXVvbnU3ZE9LL0t6?=
 =?utf-8?B?ZnFSMHY0dWN4YmU4VEF3dW1wbFNsYU5jV0JVSHZqWWo3UzBSdy9YYW1jNkVj?=
 =?utf-8?B?TEw3ZkdPMmd6QmRUUWF3clkyaER5czlvNUFYOTh0ZG56Z3cxL3JNQmJFVkNK?=
 =?utf-8?B?NVBUMjhyM1Q2T2NwK1M1VVg1RGplSGY3R2w0MjBKNDJ3NEY1ZnVYbWVuYnJ0?=
 =?utf-8?B?ZEtZUzlVQndhM2wxeWVwQVFxSnhpUG5sdWxOVVROZnQrUVRxbTdFUnhybWVs?=
 =?utf-8?B?ZERicytrd0JRQ1hraUxPbi9DdmNjcGRveTNrTStRNGpZM0FBLzRaelBKUFRt?=
 =?utf-8?B?U21aVzJyM3BrMGdQWWlOdHNUV3lXZ0NXMFJSSkJadDR0NC90NERMaFFoNjBC?=
 =?utf-8?B?Yy82dndyeDRxOUI3bDE1aFFMV1NWREJjV0NjWkhJd2docHRLSXNRSlJ3clJ6?=
 =?utf-8?B?UkhBZVd4aGo4dzQ0RzdVN3BYUHo4SjcyamtUcmZrODNadGkvdmFDMTFxTjdI?=
 =?utf-8?B?NFMxRDM1SGxiRGhxZElvelhoZDRKVWdNcnJqUDNaREg2REU0SEV4UHhubWtq?=
 =?utf-8?B?YmdnNFRyMUFWbG1TbU93Z3k3QitSdDBiU1JLeCtqTFhyNW96RVlvQT09?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: c2c73265-4dcc-4d2b-9822-08ded1def0df
X-MS-Exchange-CrossTenant-AuthSource: DB9P189MB1641.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 10:54:19.1801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sr19cbxQRxe+FgH2JEcxGJxYoIc9CDClt9yXbaYD+pAfqgHqj8YhzCtveP+1UFvQXj/jozn5Rx/u3TH0mZVN1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3P189MB3186
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 10:54:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239486

Hi Mathieu,

On 6/24/26 09:53, Mathieu Dubois-Briand wrote:
> First differing element 4:
> '2021-01-01T12:34:56Z'
> '2021-01-01T12:34:56+00:00'
>
>    ['Fallback Author',
>     'fallback.author@example.com',
>     'OE Test',
>     'oe-test@example.com',
> -  '2021-01-01T12:34:56Z']
> ?                      ^
>
> +  '2021-01-01T12:34:56+00:00']
> ?                      ^^^^^^
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/4191
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3961
>
> So for some reason the timezone part of the date is different : Z /
> +00:00.
>
> Yet it does work sometimes. It might be related to the host system:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/4130
>
> Can you have a look at the issue?

Thank you for looking at this.

It is indeed related to the host system, and the git version. I bumped 
the git version and could reproduce the issue locally. Git 2.45 changed 
the strict ISO-8601 (%aI) representation of UTC from "+00:00" to "Z", 
both values represent the same timestamp.

I will push a v2 to correct this.

Best regards,

Anders Heimer


