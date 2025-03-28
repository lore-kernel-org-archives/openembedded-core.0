Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38B35C28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 20:15:41 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.60])
 by mx.groups.io with SMTP id smtpd.web10.3532.1743192937001699698
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Mar 2025 13:15:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=gOt5h9Vr;
 spf=pass (domain: oss.nxp.com, ip: 40.107.247.60, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d5F2iwQrKQQSeZF/FBO4YU7Nbp2hvin3LDw4qIh4RSNwlLWFcQDSaobxZFsBzexLkQ32v3HPgEy4yKxtz2UC8gKcR9DiYJLLE8kOCRnM2kQ7njItNvmtpDCOzql/k3jUpDF/0QsImr/NEQrlUDMFLPCFWMs6hUoE0qziBP1KXua/O/xhNVWuQB5kqxxVEAwGcTJaltOOnuMwslPDFXhxuIX9QlmTeyemLEfYV3j6ownO15dOk+/fNh8WxZel9s2+/uZMH8cBNJQhKuq82pUcNUKN+fp7kSkbie8CR3SozKdiDsvM1igPjBiBVfo9x8P4YF/lk8JynfTVWGh6xj4D4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ELdjBhgdscPezMuFkXVJXzOcKYmvil9Qt9x2zgrn7g4=;
 b=PUW+G+FrWDY3hwUILzEbV+pT7iRuGvVyidHczA/qeZPtt95BlXVC0dO1sFqDQAEz0xqNg3QqY0uFGBaPNIx4B83ZNi7xtBOrnVJVEUH7oTpT70lDgtwH3d5KuDrFjPVV76hSIB9lSbImJwZsv6+ZgZBPsNCh3M8mKsewo9nuEH/QlWOyKL5S5f44zjE7rg8eMF4lbtsqm1H/NWHX/XJg3giZt1745clG5WHzmqzHzVFs40yhgsZFXkWLPvYwRlCIG2IN+jomJMTMyRrJ9JWj4QTSgdbwjB6WmLAM9BUFi0MHkfya9V/hGxifXKmW+SscoP9h6Uz0p6Bq/qGl84v2gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ELdjBhgdscPezMuFkXVJXzOcKYmvil9Qt9x2zgrn7g4=;
 b=gOt5h9VrNFb3EgcsXeBL+2R04Rr94TUOe/qAW71ITr4NCjFkpY0qk9d+5R5xaA7tKQoZWVHFkI/0jFosXVeyKD/hj6EQJPyp0RJ21/64sMjFfMd0Mj7jAiltb7xEST7mGw6mcxOa0BIQ4fxXVIVKxb9v6QgR4wBPWagUSMLbIMNXq4TIIqsWo+Tz7c+k2e5PJu9HhGkzCB2tRTpDk5GctLWDU1rxgBsATwFRCo8HEid8L5daT6U76pTYSgEr2wjJMrbRmVeodXKeKOJELPUaTmtnBi2ElJXVoESZsHeXwHh6Wmx59Gbq34JRsESZMLJxEOEdmz10DjytqmBf7ewhzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM8PR04MB8004.eurprd04.prod.outlook.com (2603:10a6:20b:248::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 20:15:33 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%4]) with mapi id 15.20.8534.048; Fri, 28 Mar 2025
 20:15:33 +0000
Message-ID: <22c77938-08fb-44e4-a27d-3f045d001a83@oss.nxp.com>
Date: Fri, 28 Mar 2025 15:15:27 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 1/4] toolchain-scripts: Export meson settings
 for SDK builds
To: openembedded-core@lists.openembedded.org
References: <18310FFE3F0E9478.23018@lists.openembedded.org>
Content-Language: en-US
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
In-Reply-To: <18310FFE3F0E9478.23018@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0052.namprd05.prod.outlook.com
 (2603:10b6:a03:74::29) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AM8PR04MB8004:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d701fce-bd28-4df4-ce79-08dd6e354b4e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Q0pqb2MweUptWitGTkVyYmlxV3ExTFk3NVFHQ3Y3NjZWQ2JpVGJUYzJxWVRz?=
 =?utf-8?B?YVAxcjNlWDFySWthazYwRnVkTHdvdnpXcUZ6eGxmM1ZKaXFmN1FGcXowcHYy?=
 =?utf-8?B?QURQRjQraFJ0MldiR2h2ZDNJVFc1aDNMeUVZcU5Oa3I2QmlzNXdkeVZ4TGt5?=
 =?utf-8?B?cVlXelNXeUxaRnpuMVRGZXhNeEJ1TTFpOUMxS2YycXlqYkRmbnFadHlWQU81?=
 =?utf-8?B?YXdSTm1OdFRwR2M2dHVOSW9vZ1pld3VyN2VHL1BSdTZYOCtxOG9sdzltdjdI?=
 =?utf-8?B?RTl3NFdEalluMEd3NmdsalZjSnVCTXFQMksvdFNTQ1RlRlY5bUFuT2JCY0ht?=
 =?utf-8?B?Mmo2SHRKTVlzbEV6bldxbW11YUQyY200aTZWQmE3a0lKTUI2L0s1VjNCemdx?=
 =?utf-8?B?ZXgxQUJhWDF6WlFTT2pOQTVhNFhIRjJ1TmJmejl4OWhQTDg3T0NES3lQeEps?=
 =?utf-8?B?RWVkdnJMWC9CNkpqV0xxZXVhSmZqdXd1eEF6ZGgwbk56eEh4RTZzVkVqRUxP?=
 =?utf-8?B?WDh2UmFxcVBmbE1ZTVhrRGh3RjY0d0lnbW5pa25GOXU5Qk1Gb1N6R3ZyZHJM?=
 =?utf-8?B?aG51dnlmdEFhQkk5dzR5b2xCTTNXRVE1VkVhdkh6TVJ1UjR1VXdMU3dTMTVo?=
 =?utf-8?B?MlFKVWllZHUyNGRuamMwVmsxS24rVVJNZ3Z6T1RFb1pzYTBmMVNWSlVjdVIz?=
 =?utf-8?B?VDNvMVpjWDhrM2oxNXBuSGtrSmZiRzJOa0tsT2E0d2cydkJEOGhLdzdNQVpK?=
 =?utf-8?B?UCs3S1R4VWdXYmoyalphVDZsOHNHMWZDbVZIWjNaRG1NdFgzVXhaeklzdkNj?=
 =?utf-8?B?dG96TURtRmhjWFkzaXNYU3d1SjZJT0EvWkd3blJDb3FGOWphckprZVlrdGtP?=
 =?utf-8?B?TEVSblFqQnl4MytSckFYeHhVV2ZGczhZQW8rNkNqTFg4bk5XbnpWWUNpeWEx?=
 =?utf-8?B?VWdnVWpOK3N4dUkvbSthLzNKdFZ1WWY2RDBXTmhUWkVhaE9VZnJ2NVlDVmlu?=
 =?utf-8?B?ZCtCTXJ2Q0FPN1lPbGtja0ZjUmxBNE4rWlVZUGxWTWdTOVFwSnhtZnkvVld1?=
 =?utf-8?B?R0o3TWxiSEhveTV1dmJpd21wWFg4S2Z0UWV6R3BHV0QyaUdPT0trWS9hZW0w?=
 =?utf-8?B?S3pZOStpY0w4c1RzSkppdUYrQlhkVGhBRzE2UWh5eEdpdnptczF4SkZjQ1dI?=
 =?utf-8?B?ckVNUG1IRzEvU0R5a05KOTBad0paeFFCckcrZWg5cWUrZjRQVkRER3dFS1pV?=
 =?utf-8?B?eGY1ZmFJTWEyK0p1U1Y5SHh1T3NIU1JqK3RqUUNXWjFnTUlMSXoySnJKdkM0?=
 =?utf-8?B?Mi9ZMlN2SU5DRnM3bzZLc1FJeUF1ZXV5bTdFem1MWHpVVkNBd3g0c1NUMnhN?=
 =?utf-8?B?MXI1OHJJNzdkYnJkUE0rdzYxN1RYK3JoeVQ1bXNaNU8wWVFweGFrRkxidDd4?=
 =?utf-8?B?Tzl4K0ErOEZ5MDFUdzEyUU4zQkxQNmVNdmxYMWplRDJGNGgzWjdZdW1PWHlO?=
 =?utf-8?B?WGtDT0VSLzl2RlNCc1lXTVNnSnJRWDJaeWZJNndiTDlNTjhJR3FPRmMzWnVx?=
 =?utf-8?B?MjIvV2RESkZuM240RWRQVDA4WjVlSVA5YUl2SHZoYUliQ05TeUZrWmJLS1da?=
 =?utf-8?B?QzR0eVJ0K1lSbTg1V0Flb3ZjSHhQaUZ5eGdoSk9KdzlITmhiQ2drMElLZ0Fo?=
 =?utf-8?B?VFo2TkhVVFZ5aEkwQTFwcEtaSEVVSjlsd0hkVVV5aFZGV2l4KzFJVGN0L3FH?=
 =?utf-8?B?NmRMZi90MXFnZGJSSGh3NEdwVnI0MjdVWWQzUE1ZcHIzRnBzYkFQaEh0azV1?=
 =?utf-8?B?bFNzazhJNzE1elNqUlhtaitVZ2JZSjdPR1BmVXljUU92TlRGTytSdkhvZS9M?=
 =?utf-8?Q?ivzZDd8UK9Lvb?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?c0p5aDlZSHc1MVgwOTFqNlE0d3FNWWduVzJhUjQwYVlNR0ZBdzNkSWNQQXdG?=
 =?utf-8?B?RkpzL3dESldhdEdJY01JdWs5dkxpcVlzdlBvUDV0SGJkMEFhNHZ4ejNGbG05?=
 =?utf-8?B?MXZ3NWhGS0lkWHhHaFZmeVhCVTdENjhmSjR1dE8vd0xUcjhkeWRENDVvUW12?=
 =?utf-8?B?MkJsaGtGd3JBWlNRSUNML2tCaFNRWmFJbDUrdHIvOFJISXo1aTJaSGxzY1NM?=
 =?utf-8?B?NDZEaUdQMVVxaDNZU1BVT3E0YllyRWhqZUtlenNoWi9IVnFGRTUwYjRKTjh5?=
 =?utf-8?B?T0JIZWxRUzBPSytEcEY1SlBmcGlTeUw0NUF1bWY2dEs0N2N1Ymg5enpiRDg0?=
 =?utf-8?B?NmFJeWF3ZFFKVVFzYklVSWRzdE1IL3FDQUF6S1o0UHdkQ09RWHVaajYvNXFs?=
 =?utf-8?B?b1Z3anY4c2xicENFSzR4R2ZyMVFxMkF6ZkVVNlNJQmM4OGtRWExuRlJPUnEx?=
 =?utf-8?B?TkdGVmlCaXJGMjhMdVJnOUFLTTZ1cXhreGtIdDFxY3VONmRYSnNDYlExbytH?=
 =?utf-8?B?TW44blZVaUJJYlR0ZGdOZTZ3eWJOdzd6ZHd4eFpYU1lnOHdsUHJVMXhMMWVG?=
 =?utf-8?B?WG04ZTIyNnQwcWhoWjJWNFRGZG9meW9IZytvYUcrRk1rbSs3YXFub0VFOEla?=
 =?utf-8?B?R3JGc1FpbmFFRFFNYS9rUisva0pLbVY0TC8wMlVhb2RTc1lXOUJGZGxXb1JB?=
 =?utf-8?B?RDVicEt0VHpEeTJDWUJSRnNjTFFqeWhFK1A3cnZJRlVIWnBCRStGKzJvc2Jn?=
 =?utf-8?B?b0VjaUxYWFVIdDhVVy9sTElWb2lOKzVVenUwVkxlZmQvRjBtOWFVendZZEtE?=
 =?utf-8?B?Q25LTFV6NEx4SzJBRUVnUnkwbDNpd3ZPbnhhTkhjbm1mZ04veXA0NzBYV3dO?=
 =?utf-8?B?aFZDR1RtMnJRY2h2WFJGUTJWaG9LcDBmbUFXVEM3OGpLc2ZleWhZMW95OGNx?=
 =?utf-8?B?WmVvblFjT3F6ZXZKWlF6Wk1VLzR5TENkQU5KbHlFSkpFbGtIeG1SbUV2b0Mr?=
 =?utf-8?B?VWVJQncrODFyeWE1TmNJUGlWM2tyYTJ1K3F6TVo2ZURoSis1WjMyeUxTelR5?=
 =?utf-8?B?Z2l2YnMzbVY0aEFnUTdKOUF3WEpsVXFpa2NYd2NPYVhxQU52UFp2dyt3bjZv?=
 =?utf-8?B?YmRBY21udXJnUUUrNDFkTEJPOW5YSElWWjJGOXB6T0dsSzQzYWZGQUtsdS9q?=
 =?utf-8?B?Qkw4YVVSUFZKUFM0c0dPNkZOa05meXB5YkZqdmlndXRRY3dROElqcXduSE01?=
 =?utf-8?B?NE41RTM1ekdPRGYveXJJSGNhdzVPNUdnRUFJLzdKRE10bVkvRkd2cXRVUEo0?=
 =?utf-8?B?eVNBMDlBSmlRRkN4OGdldGxaVG9wOWpzTG8yOFFpSXU0TWRWTGZ2VzI3bjA2?=
 =?utf-8?B?QmcvK0YxR2l5bEZ3aU53TXF3dGVMYVdnOEtTcnFNWUZ3OXFHeXgxSWMwL2Rr?=
 =?utf-8?B?UkEwVWlFWDlEVUE1ZWZLVHRmNWxYU0pzc0xUQ0p0bmdFV1NueFZNUGZoR1Vt?=
 =?utf-8?B?bDZMVEo2SVVPajlGS0FEYU1CK1lESFpWTUFVdElIaTNYWGRoV3h0VExmSGps?=
 =?utf-8?B?cUtyRUlNUnpBb2xPb0xSaTkxSXlzaDNDbXNPaEYyK1NXMUp5cjBRU3hZdThs?=
 =?utf-8?B?QlBrVzl5bW9kV3BsK2ZGOUZXdHZQNzRpSXJ0eDUvdC9WSGJhUFJ3aDkxY2RZ?=
 =?utf-8?B?L3RoMzNKanlEcWlwMkRNY0YvOHhlUllZeVdEUnN0OS9nQjVRN1dkaWxKTjk4?=
 =?utf-8?B?d0FQRjYvYTNYa0lnRXE5WVRSeU1sME53QU9Namo1bGoybmkvVFhZdUpKQXZZ?=
 =?utf-8?B?d05EL1A3bTlQSHJ3NmRISnBmT05SWEFtUWZWdkFiMkwvdHNRL2MzbE1KTzI4?=
 =?utf-8?B?b0ViNzlISlNRZmVqcm1wcnlpSzNYRU03ckpPQVJKRGdJaU9obGpNOXFoR09r?=
 =?utf-8?B?bHRCRjhidFRYQnduMUgwdHhYKzQ0MzZndXVGVkw3UVpldHV0TThUWVRsMzFy?=
 =?utf-8?B?SnJ6RjVuS0ttbnVHNVFJeHM1ZEJVSVRnUW8vVlQ0akxtSUZJMEUrT3YzQkFH?=
 =?utf-8?B?d1VrL24yVFlIZ00vaXE4YWVjZGovS0Y5UEZOZW1vWDJORkU3YWlkMWVZelVB?=
 =?utf-8?B?TVFMWjFTUHNibG0vSlVnZThxSHVnOXQ3SWtsOGdSYUc2NEgyVFVHNlVQUkJk?=
 =?utf-8?B?NGc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d701fce-bd28-4df4-ce79-08dd6e354b4e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 20:15:33.5665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tK0yrkOUs+aLpm9tOAszyMcMbegw3QqOX33iJmnciG4pFOhIRotF2+sRPFyvZjxegdIFWzOCeHuO3xBTO+o8lQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8004
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 20:15:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213870

On 3/28/2025 3:01 PM, Tom Hochstein via lists.openembedded.org wrote:

> +	echo 'export OECORE_TARGET_MESON_HOST_SYSTEM="${@meson_operating_system('TARGET_OS', d)}"' >>$script
> +	echo 'export OECORE_TARGET_MESON_HOST_CPU_FAMILY="${@meson_cpu_family('TARGET_ARCH', d)}"' >>$script
> +	echo 'export OECORE_TARGET_MESON_HOST_CPU="${TARGET_ARCH}"' >>$script
> +	echo 'export OECORE_TARGET_MESON_HOST_ENDIAN="${@meson_endian('TARGET', d)}"' >>$script

Looks like the naming is redundant, will simplify:

OECORE_TARGET_MESON_HOST_* -> OECORE_MESON_HOST_*

V3 coming.

Tom

