Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E67EC5AC67
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 13:38:18 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.34])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.54223.1786455494259315470
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 06:38:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Akts/U0I;
 spf=pass (domain: cherry.de, ip: 40.107.130.34, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KD/dgAM2u4BUDImJJW9Y9i1M1ryILs0FOdSn2r86tJbzmLSQHB0ZdSJ/J/giVsXw4R3EJOQys0DlzI0LU+8X/y5F1xkOV5x/XTzL4VAQB62e0sz32WzRSAXXuaJwMizAXuKJT4a25SYIGwMyyb4JEjw8vv9G52T830a+vLMehb0EU+ugk7nJ1Y5ln47RL0CGsmjoJqWYyML0QLWpGkyb0JgMifWG+hS2N38zrxe2HGBC6surcUxIXvXzP9196yg1rTtDrUgFD9WX55fsrfR7jMgqwyPAuJSs13dyyq65FuG7e7UcYARjRMU3wi99NLmqSwXwf1bt4r8al7SZXCw5Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g8TWnOzpfJ7E8mBro7OauKBAjXuTkKQIyt+a6YvQjTQ=;
 b=T+UWof9ACThG/K5/ZLngXdXdP2ylyFnnECZrAtRPhR9JPQhXmNoTLuLDehNAe3dkTnDlPUbA3qLNvmvwovRiC7FBQ0pPJzFXCF25ckX2fB8W5Dj6y+t5O8w3xzAvsMmYUjgOg4OiQyPQVNHpbVt6AVOvkbzz8oqQrLiYxBJSUq51nQlbUj3d9TN2mxivDqwzK8kbc9Y8WRbFFeaVrPZUmdzec2dZYnXYO7drLpwaiLqFyMvOBksXnUGVZ8u5vNPXKhz9jcjNGVFle0ea5+vV2WJ1sE0j4gxgJzeZwFNuRA/jgC+iLKr6k4b1I4C+kWzChi3m3AjEVbKHukbGcphyYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g8TWnOzpfJ7E8mBro7OauKBAjXuTkKQIyt+a6YvQjTQ=;
 b=Akts/U0IipMFv28zlUf1NnA1hskmhJ2J24t5qElJz7h8GuGtiQH/Sqkb291mgaqQCDxxpO+2rJsP6Nh0WUTPUDlAFKEJb1kfUC1EurbnbHkNYZqm1uWHIKcnsKsB43V5H/YesgxuNvaEKqMh7j4L6coZYvCa9OGiTvzFtoTBSOk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com (2603:10a6:102:b8::20)
 by OSKPR04MB11317.eurprd04.prod.outlook.com (2603:10a6:e10:99::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 13:38:07 +0000
Received: from PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7]) by PA4PR04MB7743.eurprd04.prod.outlook.com
 ([fe80::9a4e:252f:2fd:97b7%6]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 13:38:07 +0000
Message-ID: <bbf5f01b-1a0a-4679-9fcc-6143407433cb@cherry.de>
Date: Tue, 11 Aug 2026 15:38:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 3/4] u-boot-tools: fix pylibfdt build with
 swig 4.5.0
To: jaipaul.cheernam@est.tech, openembedded-core@lists.openembedded.org
References: <20260810154520.12466-1-jaipaul.cheernam@est.tech>
 <20260811111120.17612-1-jaipaul.cheernam@est.tech>
 <20260811111120.17612-4-jaipaul.cheernam@est.tech>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260811111120.17612-4-jaipaul.cheernam@est.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P195CA0049.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:65a::25) To PA4PR04MB7743.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7743:EE_|OSKPR04MB11317:EE_
X-MS-Office365-Filtering-Correlation-Id: bbaa51e2-b5f3-48c2-fdb4-08def7adc72a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|10070799003|6133799003|56012099006|10067099003|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	FmSZMq3ay+vMs8OzUPHohUpSjUr+H0h3Mj2k4RYE8dIKYsgZ0xZLHGXsrgbeOuVDxUnScOd61xXiezC4U2dPpCvqHDahI8JqXdz0q9fAXZZSPgV6haiAQAoHrib+v/Os1CJDGvo/PQ5EmouZKzn4fkxcZ6MEFgkSCVC2n3E+XCiTDdfReQE4Z+rqIxjSSdq5iQxcyDeraFHhwIZ4e3kJd0gnngAPuJF1PW+vfINUuQGjCjKHu2xB/1es3E+8OsnV2peq2rkzffMfL482R3zXxdViV4R6EnKaRmSk0pAgQuH7x2eV6WCVTlRHQd6I4jtQDZG9burKQ5LowFTVPKteEe2+knrIsBp4BDPXCRrKZKdLckls8Q1vDW319aG/cBR7W9xiRQvaaPyOQTwiJjR5yih0JHVcO7T7ZaU7aMxLwLImTlNGhAWiwphK9s6m3fxpvcgFI8D97ADSWcwqdzKL4z83P2vaaFmTKtxFJFm1dMBv8Kpi6MR7bb629syEy2neUTSLkBvkeD2Qab+RCupH2y1eqh4q0DeRB25YAz6/XTfNJuWzjt9G4RBm3yStNRbrrQdIjUONgscUJPwFX1aH+w6uZfxUZ4634mHUH6+HW95mCcSVOEf2UC3/2LUiHB282xw/e+J0tz9JOBmGk5igSp840IBJxJ+h0bE+R65j150=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7743.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(10070799003)(6133799003)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QlhxU29HTG90K2JrOVNBNEtjc2JZcGNWUHg0QUpzeGZEbG03cE1uaXJDTDRj?=
 =?utf-8?B?QkFJT2ZGSmJYMnlIbmlGcGVJQnhmMnFVcEJ1U0p5TXZDaitTbzJjR2gwaFN1?=
 =?utf-8?B?ZzZUbFVhcEozenZFMm81VnNlOGphUy9KNjI3L2YvYTFBdHRYcVdub3ZSNmVZ?=
 =?utf-8?B?d1JnYTdhZFdmSVZrSU5aSWU2N0U4TlBVc2pKTDJBMmtWZnJnamhMbmUyNDFR?=
 =?utf-8?B?eVNZVE9BaHhzNHNNbWhKODE0VHg5NVVwbmtacWc4bkhPL1BEV2ZCd3pQcDJN?=
 =?utf-8?B?TWRRb3d6dWhzVkVHaTJMN1RlcnBBU1VWNEZxU2hhL1pCSnZUSFVUUHdWQXl0?=
 =?utf-8?B?UElySUZyZFI1TEM3M1l3R0dlUDdFREt5NGNDYndCK2VTNFlYbkZaMjZyZ2NC?=
 =?utf-8?B?VUNuUU1WMFhQMzhPTTBGeTREeVpXRmFIS3d6eFJYNUYrU2wrN2VwZENQbGVN?=
 =?utf-8?B?N1NuOHFRSy9NSHkvWTZ0cWNqSVNsZkpCVE5qMW93eW9PbHk3dVpZSFo2NlJo?=
 =?utf-8?B?UHM3OXBmYkRIMTdoR0xpWFc5Rld6UGNBSzhFUXUwQk5jR1BnbG1oMUgvZkNn?=
 =?utf-8?B?eXhnM29GQnNCYkRwY3hkM0ZCaWpIMWlqbVVqU25Pc0poNzE5WHpFaCtaYjRy?=
 =?utf-8?B?bDFURG00Zm16anRBKzNocjZla2s0YVl3N1poTEdocjVHamVhZHNWTjUvVmRv?=
 =?utf-8?B?SE1uRUFIQ2RMSnhkWVNmaGJHeThqeVB5TXUrY3JzQS9hMjJ0a2g3d1d5WU9S?=
 =?utf-8?B?MnM0cHU4WG56NFNjdEk1L2VKeTJybkVGT3VjQVU5azd4VitJaUVRRDF3ejNu?=
 =?utf-8?B?OG9UdmFrL1ZhWXNVeXZiaXdYTnJQMm40MVRJQ1d3cldEeDR5TjhDZGJWTnR5?=
 =?utf-8?B?bzVlUHd4anNOV3diUVp5QWNBUnVMSVNpellwM1Q3NTlxS29VMGw1cU1oZVYw?=
 =?utf-8?B?YWdsOFpDZEs2Ylk4L3hFcWxWQWFJMGlHLzlMSDIxTHZqZ3RlS1NJKzRFK25m?=
 =?utf-8?B?ZzhlaUI2UlNEbGR4Y1RVNGlSMzVxUjBmc0w4bnVTTWFwRXd3Z2VUTG9CZkNu?=
 =?utf-8?B?dmNmVkFwczMyOERrVS9Tbmp3MTVoT2lpdHJqRWRNWFZ3Y2c3K0VVY3c3a1RE?=
 =?utf-8?B?TnIvR2FrMFpoY1IrQkFsblBYVWN3aXZZZFdnWmFZeEY5WHJ1ZjFRZ3gva0tV?=
 =?utf-8?B?dmJ0Sk8zTXkySGNRd1BlelM5U1NTUDB5b1pWK3JZRDhxRGI4eUZMQWhhL2ND?=
 =?utf-8?B?VklqN0E4a2x4ZHNxaXk2ZUJGQk1SK01sREFJb1FhQXVWQlkwVGNIaWZ0WFNh?=
 =?utf-8?B?ZWJWbkRvSnlXUGM0RUF1bnlySmZRYU1wdnZBT2VmVTdGRGxGVHoyN0dpUmQw?=
 =?utf-8?B?anlla0dUYnpBcU1rb3RhRHFLVk50b0ZLZzhoNW0zMU4vSlhwS3VpOHk2L2pN?=
 =?utf-8?B?cHhTeFQ0bXhoeFpDSjl6dEpEZVpxMldNZStVN00zaWU2Sks5dTQydFJzTHZ4?=
 =?utf-8?B?SEhBbGlSSVVwdDJHOUpSYlNOWTRjdEwrWjVwK3d0YXZlU1FlOXNhd3pIWjQw?=
 =?utf-8?B?Rmsxalc5Q0NSeHRqOUhkSGR2SVdVSVhXenovOTFkUzN2YXpKQ0h1MmZGYVM5?=
 =?utf-8?B?QlhVTEVjcmxjbS9tNUp3QUJkSFhrS2FNQng3U0htZk9JZlNRblFNV2NFWHoy?=
 =?utf-8?B?YmIvVW4zdDEyNkF2YkdYOTJvaUZTZlNJeFlKNUZJdEpFNm00OW5tUFE4T1Ey?=
 =?utf-8?B?YTRhb3lSb3hxK0h2ak5xN000ZnFHSmZJTWxsUWhzaWVPQXNlcUFhbXd6WTJ5?=
 =?utf-8?B?WTAvbUFsMGsvOUdFQzhZclBENXRpZFQ0azNjQ0liRzJCdFNrRjhWZS9OL2Rp?=
 =?utf-8?B?a2M2L3h2cEFqY05HV3ovUnlCdkhtQTBTKy9Nb0hWOVJ4ODNpRmhaM0VibTdJ?=
 =?utf-8?B?UlVmODh5RnBtVG1WK09EemRRS2s4aGpqRlMvNDBKeTlqYnIvU2JkaGYrWGJR?=
 =?utf-8?B?UHdYNHMyZ0lPYlJLYnBQTUg1b0MxdjFVWWt2U3UxQUZPZitPOUs1QWtHdjNL?=
 =?utf-8?B?ZWszeFV2N0tqVEFOeFpkZUgrOUt1dE5MY3NrL2p1cjN3VjI1WjlaZk1SNXlq?=
 =?utf-8?B?aUczcndnSGxvNXdMSUkyQmNuMEs0ZTdUTDAwT2hQaFhLM3dqUkdJZWVweHZL?=
 =?utf-8?B?cVFmVk4rQ0VUV3NlYzRXdU5VRDBBMnY1VDQvamlPZjJsVkFxakkzY001RjZS?=
 =?utf-8?B?MElBdGV5bVF5MzJ1SUxsd3N1NytwWmpLT1JaT25FSjVlQitQeXFVQTVMa3VC?=
 =?utf-8?B?eFE1TGNQVE0zR3FwdVVHVUN1a2RQTFltT2ZkNFQwczFWS3dFdzNKa0tjc2FM?=
 =?utf-8?Q?kQKhw/jKTk26CF+T9f5UwYXlIU6EufeTN8chQm7XpC1dd?=
X-MS-Exchange-AntiSpam-MessageData-1: DbUtfY66tbQKYNCvJhgomiPQwfMJFNrhJNA=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: bbaa51e2-b5f3-48c2-fdb4-08def7adc72a
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7743.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 13:38:07.7507
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ESM68XD5SR2T3qJbj1kNFcwrhEG3uVOR7uECXrfsDXXlsp1o9w39HXFXRcXagOSzV2LeZkRZ4jEB9GrrvRkTvFMRSgkiRmVsmQtKFiZmBQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSKPR04MB11317
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 13:38:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243199

Hi Jaipaul,

On 8/11/26 1:11 PM, Jaipaul Cheernam via lists.openembedded.org wrote:
> SWIG 4.5.0 removed Python 2 compatibility macros (PyInt_*, PyString_*)
> from its runtime. Backport the dtc upstream fix to u-boot's bundled
> pylibfdt/libfdt.i to replace them with Python 3 equivalents.
> 
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---
>   ...-removed-SWIG-Python-2-compatibility.patch | 57 +++++++++++++++++++
>   .../u-boot/u-boot-tools_2026.07.bb            |  4 +-
>   2 files changed, 60 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-bsp/u-boot/files/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch
> 
> diff --git a/meta/recipes-bsp/u-boot/files/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch b/meta/recipes-bsp/u-boot/files/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch
> new file mode 100644
> index 0000000000..5fdccf5e9d
> --- /dev/null
> +++ b/meta/recipes-bsp/u-boot/files/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch
> @@ -0,0 +1,57 @@
> +From 32378d7b4383a79d13da9005035600d8f0c8c29d Mon Sep 17 00:00:00 2001
> +From: Jitka Plesnikova <jplesnik@redhat.com>
> +Date: Tue, 29 Jul 2026 05:55:56 +0000
> +Subject: [PATCH] pylibfdt: Replace removed SWIG Python 2 compatibility macros
> +
> +SWIG 4.5.0 removed Python 2 compatibility macros (PyInt_*, PyString_*)
> +from its runtime header pyhead.swg (see commit 79f7a2b7cb7d). Replace
> +them with their Python 3 C API equivalents:
> +
> +- PyString_FromString -> PyUnicode_FromString
> +- PyString_AsString -> PyBytes_AsString
> +- PyInt_AsLong -> PyLong_AsLong
> +
> +The replacements are safe since the macros were already aliased to
> +these exact functions in SWIG's Python 3 code path.
> +
> +Signed-off-by: Jitka Plesnikova <jplesnik@redhat.com>
> +Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> +Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> +(cherry picked from commit 5008d1d6a356b8d0a78060da2e1021507d529cff)
> +
> +Upstream-Status: Backport [https://github.com/dgibson/dtc/commit/5008d1d6a356b8d0a78060da2e1021507d529cff]
> +

Not a backport. This commit doesn't exist in U-Boot. Please work with 
upstream U-Boot on fixing this so that other build systems/distros don't 
need to duplicate the work and we don't have to carry this patch forever 
in Yocto.

Cheers,
Quentin

