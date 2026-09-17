Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 371E7C88E72
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 15:23:33 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42326.1789658605529401138
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 08:23:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=YSa/cnOE;
 spf=pass (domain: est.tech, ip: 52.101.83.21, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hMxX3x/4YJespz1Tl9LbW46vn7bHMrOK5HBVPSsiHMwt5WtOE9PT8ejFD09nHXS0s5L0uvt8i5zjVhnnaog7U7+lUcNtsnFKlaHAoKNyBjDwmNLCKjQxAyOmhrt/uJUAbnQszGshViyDa9N9+0tuJ6l1K721pomVnztotRX8cyXFrVyPmn9lFtqyHQnUYRta3IdtV9D6Yftf6mDcUueuO07DwAF0/6+ZQBcH9A7arTntUCO5DEl/4vAWmYVCDKX+tzI+huc+Jgpk+/v1fnSJL802xQHCUGZgAzW+rUNkc0LBaGyLUNyybuhHE+eY5sdTtJuvkvSkTI2gzKa77AqiVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ejFGqmvtGf7gG8Q+rO6Iv7lyCeG23cxniD9fR3hBgzE=;
 b=jW1dHxwc/0wd7VQj5IJNUGwPMc/acY0muFSNPJxsqLYeoHw9zrEovnwi/JKHNyBnrBPKx/H0XiZcwPmNqfKIkg9CsnpUbWSgeAujZILrJkYkJ4JmaJG7Wp+t3N2l+j/4dbOoavvnJhds7aROTfTN8MhQo0VHA6hI9KYdD4dDH9vVt5CUfkWxMwme1rnf+8us/idzQzhfG+9x9/voAz5aafwZubYHJgDOfIyNgX4kkN2LdGxZqZ/spSzkX9wCL5DIP5Dl6BqR3IYvLXCymNmz9XjagrJywZ2dUNVN24oZtzIwzs18oYRgpKlAKxaTXMY+W6TvwSxjSz2ftH/rhlu1tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ejFGqmvtGf7gG8Q+rO6Iv7lyCeG23cxniD9fR3hBgzE=;
 b=YSa/cnOEazwHlv5RuSw6acJw2dX7NfA5JydCS8v49d2z/Ek5oD97J4Zb35pSR4/ifiMdymnN8MXd6O5qau55GaJQt/3tfzAuslUKayaaioFiIxJjSGLe5uKRESInUh6UkC9wEV8dryicR4Esqnj37jfFCmLUCiz00/Y7f1a/miWB6EdT8vq1V+r2l3DsLHbAEnfVAC9oYQayZ5CD6jRn8xmr5CGmkJT6lF8QDaYSuCj2CdTad67CkN6n0vTr5H1J/b1r8DsBcdww6Y25+SARGKKDeMoFWXHXDN/4sbFCowkOjNNGyyLy0KYm+/XJAcD1m/FSqdXqXTqC2y+wVOq5qg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PA1P189MB3442.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4f8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Thu, 17 Sep
 2026 15:23:20 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::bf0:7714:72e:1666%7]) with mapi id 15.21.0428.009; Thu, 17 Sep 2026
 15:23:20 +0000
Message-ID: <d8bfee70-6f8d-4f2e-a854-e644609a2d6f@est.tech>
Date: Thu, 17 Sep 2026 17:23:19 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [wrynose][PATCH v2 6/7] libpcap: Fix CVE-2026-18313
To: Yoann Congal <yoann.congal@smile.fr>,
 openembedded-core@lists.openembedded.org
References: <20260910051154.30595-2-jaipaul.cheernam@est.tech>
 <20260915191623.42107-1-jaipaul.cheernam@est.tech>
 <20260915191623.42107-7-jaipaul.cheernam@est.tech>
 <DLHLPNY1MXSH.3FU70J9S1LKQX@smile.fr>
Content-Language: en-US
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
In-Reply-To: <DLHLPNY1MXSH.3FU70J9S1LKQX@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DUZPR01CA0161.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::18) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|PA1P189MB3442:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ea79cad-2f39-4c0c-9f6a-08df14cf9b13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|18002099003|22082099003|3023799007|4143699003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	2ftfJB25Rw26cwbxKmH/kUmGJjp/vDztQwvMwD2ShUOIJ6UNA6QEQPKXwXWABNvy4o8uQtkJ7OUeKPCaUBRseARrEAJYHNvAK8I0EMPFInTncMedDA2izNMlMBB8+YuWLPE9IaWuiRtYQMKXexvZpHOAIVksEDgcJ6FKuHR5w1MqrebO/v6f21v2dcObStZFcz15uA3jcPBzEuUcHzkG6HD+Vu9Yz6isH6+3wAaESBIAIkXO/0oE02H/Mdp0uZjdbMN/a/LItdTY6MPYg900MdQH68eiszYgGs5z4QyY5N9JKAwXt6PFvPjyhMfnU4wnVfDbWnW7ECtIgAN+RuApMinYF1hhfDVG1uCFUx45TgXpFhFXFGooAoe24qFAqeczpJ3ZpFbpBLTju/bfmk3Xn0ggZUFTY2+8wx5CSg1zgZ+dc9aew/n07Vsy4e72XGeSOxjo8elJeYVOLKPzZISXLlgibKyBJpYqmu9/0p8PpqPKm+mzzlZN+Ce1q45BHd4Ip+G81RG/r9kKkEGIFQGZaVbROJmQ8xcp4Q8U9ZgthT8DIyF71B5LguSEHdwCQf2IQO2VecDhPsQhEjCwKrf4rwuUtwJQPcNFC7l9yHFgMnhR7NYdKMFlYGEes4m89Ye1tpEljWxzq/xmAlRVDOnJ/hRz6UkevjA9zKoS+38CzKY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(18002099003)(22082099003)(3023799007)(4143699003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?clBLaW9MUTJFdUtkL2ExRmVpRnl5K3Z3dldtNXRLMjJldDM2Z3JjRmFnZktK?=
 =?utf-8?B?aUJaZW5ISjJDL1hpNFlVM0xLeitxQnIrSHdtdlgrV2VwT2NhRGszMVJXTGVX?=
 =?utf-8?B?R0FFbWRrM3hoUThlSlEvZXJuT2pNYzZoYkJ6aDhQdGEzK2J2VytjYlJHa0lp?=
 =?utf-8?B?ZThvT3Q5OFhMYUpYSzFNcVllMmxwaHQzcDV4NGVNcGdEcEdMaXhFa1RXTjN0?=
 =?utf-8?B?VWpTYTg0enVWa3h5dmt0Z21NV2VGZmoyb3Z1V3U1S1RrSWgxREZhNllVSFlV?=
 =?utf-8?B?MjJmcGwzT2FZV1F4bFR3UVlhYkswUEhSYVE1eDNsM1I2UkZFM1YyS1BtVmky?=
 =?utf-8?B?NnVuOUptT0tnUDdRNmVDcVl2bTlpL3M3UUduNEduWW9keGIyOVgwczhxR0dq?=
 =?utf-8?B?U2FwR3ljaEZvSDNWdzJZMENGQklPVUJ3TXRpTjcreFhGYVpvS1h3c2krSDcv?=
 =?utf-8?B?cmMzcDk4dDYrUzZ3Y3VJa1VwaFhnUTY5RXZKdXY2cW9oRHlpZTh1OExvUTN1?=
 =?utf-8?B?Vko1aTdobmlxeGxhVlBtOUJ6NEhld1JkZEI5NEVtK3NrZklwR212cmRSeDhN?=
 =?utf-8?B?UGR6L2JuZFNwanF6cWpuVHYwWTdlMm5JSWVMNDRnZDA3REpBK2hFQTJSME8y?=
 =?utf-8?B?bzl4bzRhcWx1SmU3c08vTWVIM01PbVl1SGZyaHUzbHcrL1p3dld4dHoxak8x?=
 =?utf-8?B?c2plalc2U0VQa1ZYUEJoazJXWHFSMGFwOERhV0NnMkZNeEhRL3lySDVBbUE4?=
 =?utf-8?B?VWRpN2hORUF5cnJQcFFnZlo4WWQwQk1GVE1SN2RPVUZnVVZXL21IUHJPQ0hB?=
 =?utf-8?B?dmhSNC9pejUyN21vZlpCOXFPWmJVOUl1RjluR0J4ODVDL3NUT0tpdjZmOVlz?=
 =?utf-8?B?TjF1MVVROEJVekx1amhwWDJqZngrYTh0RUVaVlIxMXBIdlduQnQ5dHV5c0pP?=
 =?utf-8?B?eCt0L2g3bW9SSnplSFEyajd6RURJSVIzdGZyY1NFaDAwcGFjUTNWV3Z3OEhw?=
 =?utf-8?B?YnRjMzRQTE5WdEFrdndnOUF1MVAyK2RnMThwMHFnZlFkNjBsK2xTQ2ZYZFhX?=
 =?utf-8?B?M2JOcjUxVC9RYVRIakROdGhSWkNEb0k3aHFmajl2akJmbi9GZWxvcFZvQy9a?=
 =?utf-8?B?ejZ5ek85ZmFnVzcwRk0rUTVUc0hIdE82b0V5QUJLZFZxZHd0dlRMaW5sVEs3?=
 =?utf-8?B?YmptVVR2dTd5d2Z0VzhOTGY0UFF2enBMUk9MSVhjc2UwanlOSmN5SGdBYUhW?=
 =?utf-8?B?WUcycnEva0ZaOEgweDc2U3hCNy8yZTV0VFhvbi85LzAvRnlVbS93Zy8va2Zy?=
 =?utf-8?B?ZlNUMC83NHczU1lJVGhGWTQ3dWFoeHBlV3d0QlRaL05rditRc1NXNEpHUTJM?=
 =?utf-8?B?a2RlL2czQ3E3VkhHRGJyU3pjc0hZd1laalBuSFF3OVFtdkorSnpOUlZETWl0?=
 =?utf-8?B?dkcyVUYzS015NXZSV3RBMWxNNUhXK2tiaXo5d1U3TlpzYXhwQ05FZlM1THky?=
 =?utf-8?B?NmZRbkhDbEx3VnlaeVh2M3R0RWdCKys0U2NlOFc5Q3R6WDhBbjhXZlNvaEZJ?=
 =?utf-8?B?S3ZwbVNuUC94em15cVhIbHhzaC90SHBWdTA3NDlpdFJXUGJ6VzFva2RMZGhq?=
 =?utf-8?B?QmpzbVU2dE9xdDRTUzYra1BaL0QwTElxRHlLUUhFbmFQQjZYc2Z1THkvU3BW?=
 =?utf-8?B?UzgzS3p0RlhFYUJRa2dlamdGUlo5NHI3RDFKVERjdi9iOEg1SnBiQlFyZXdN?=
 =?utf-8?B?TDVvME5EbkhiZ2lKQWZ4ZTV3b09qb2xGTnM1eUJJM25MWDU2UXNNMnp6UWdo?=
 =?utf-8?B?cEhtRitKS3lZK0ZKRThhSGZVTFBvWHZoVEtoQkxtSFVrNlk5cExCRW4zdVU3?=
 =?utf-8?B?aTFYWElGYk1MdE5rUElEVEFuaExYR2RldnYvUmNDZkVkYnhPRXVvWnhwT2Z1?=
 =?utf-8?B?SUhSbklsNWcwL3dMcUdSd2VUZVdRVlBtNThtaEpwVUVFN20yaUJFNndmclRS?=
 =?utf-8?B?WXk5WHVpbzdYZW5peW9CcjRuSDZwZlNxdlc2QVNGckx2Q3BwV2FrTEk0eFZ6?=
 =?utf-8?B?ZzhkTmVGbko0bkhDS25NSEdraTBseDBJT2NyMkdVR3dwVWRoTkFCd3lEZ2Zx?=
 =?utf-8?B?TDM1OGpFTXdYSDg1QzBpbFVWRHVTTXhSRmttUkRhbWl6aXFUeTVpdjBYYlph?=
 =?utf-8?B?R01WcmlqR0U4V29lMWZiMFV6VlJNMFIzOUpaQlNXamoxM0tSbWpoVVRXMHIr?=
 =?utf-8?B?Sk00d3Frby8yYzl6N0FJVGZGbUY2Y1YwYzJXbjJ3N1hMeGJHRUZ5UTZzZzN5?=
 =?utf-8?B?YU5jYlZrREsyZEg3YXM4Sm1kZmNtUFNsVVppRlJGcWxSQWdjSjFLUFZad1p2?=
 =?utf-8?Q?K4soQvAGmlzh6OeQ=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ea79cad-2f39-4c0c-9f6a-08df14cf9b13
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 15:23:20.3284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fi+1el1zeCQZ9113uVYukh5vkYD/4RHvV20kySgcrEZ31t3p3nAOvvlAdH8r3ctZ4tIGTl00m3vJCF7/+sfUO1PLxA/Y7oolu7m24LOXddM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P189MB3442
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:23:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246075


On 2026-09-17 14:47, Yoann Congal wrote:
> There is no need to detail changes happening in the context of your
> patch (unless relevant). In this case "Notes on backporting to 1.10.6:"
> on "bogus instructions" is confusing since this is not something you
> changed during backporting (and is obvious enough).
> The note on "CHANGES/changelog" is appreciated but obvious enough so it
> could be omitted as well.

Hi Yoann,

The "bogus instructions" note is noisy, not a real change on my side , I 
should have dropped it.

In future, will keep backport notes on point .

Same applicable for scarthgap series as well .

I can rework on that and fix if needed as its not under review now.

Thanks for pointing out.

Regards,

Jaipaul


