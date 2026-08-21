Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBF9FC5DF97
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 18:49:26 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.24])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1622.1787338161099507084
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2026 11:49:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Fo2zgXzH;
 spf=pass (domain: cherry.de, ip: 52.101.70.24, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v6cLVcU2a7aKnoQ5oojO537pQXYmX+VVOVoBc9pCrayAWp48dWqwhX5O9TAi0+rNAOx5kzzAEDmFBmsL3Zhc2T42pYRkwS19J81WGuqLm8PvXH5ppSiAfEPQhnCosurLcLOla6s2cpvXDcFoZQsivUSbzJBrcs1vr+kjvtBDtZtRyaiHuHOxveVTKzO6KHACJulvoiivNSUSJ4XWz62LcCTa40F7NCWwnfXa0QdKp6qtpCWLJDyPtrG6JdFEAJjXYDVVaTpVQsYXMu0MrBfJ2oiSjmgA2C5oP+LsXHGeA6QMWrnyeMAYcl4a2x0PwWdggIayDU3ozdEX51lZfCbQOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6xEvaOPw3ydR+a9chSlYoLFVoPCvoFVvya5QZLDwSM8=;
 b=kHirNhn6QROCKVJ8vc56WVavm/f4TiAx2OKSWrzseiiGgSgwTOfAF4e2otY1ExD3+xwQU63u47dpCgV0H4vKSQ2BT2zGz5i9Z8T2nNaA0IslJOS8TFSljWJRMtMZalEc3rkI6h2TGRBlLJ6+P9xukALNpenzd/Fs1J7oUpGymvvCgz9HUBjlWOUiMSM4NPjVacxQBz+sjziAq9NRter6OZZ2S90gWAiNKnZ8Er8irxgF4NNRza4GBO4/O1ee2eug+KBAmQaxL9A7AN+1w4ETks2LgcAjjQFBH4TFkqCNAbOuDF9qQxkxa8bee73QAfHVPSRs0zo7L1sGda7NtwNaBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6xEvaOPw3ydR+a9chSlYoLFVoPCvoFVvya5QZLDwSM8=;
 b=Fo2zgXzHUpv9gl17luTXmD2nWlE++R8b5DuqeTlB0UChNcvpPQ+u4RVvf0hYAN3RvyyuoJP/SNunCHChydHv2MjiI8SXlwLJke3bLPBNHEc0SW9xROGt9O4Q2b3QmHwbpEE+7tduxAelui6VMb6dBtF0q/nkfb8vTabslqZ1jSY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14) by PA4PR04MB8062.eurprd04.prod.outlook.com
 (2603:10a6:102:b8::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Fri, 21 Aug
 2026 18:49:18 +0000
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::c859:7e6d:9345:afe1]) by VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::c859:7e6d:9345:afe1%6]) with mapi id 15.21.0339.008; Fri, 21 Aug 2026
 18:49:18 +0000
Message-ID: <74179451-6660-4fe2-8962-fc55a36132c4@cherry.de>
Date: Fri, 21 Aug 2026 16:06:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/3] lib/bbconfigbuild/configfragments.py: match
 Available and Enabled built-in fragment lists
To: antonin.godard@bootlin.com, openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260821-sbom-cve-check-fragment-desc-v1-0-e06feb747b07@bootlin.com>
 <20260821-sbom-cve-check-fragment-desc-v1-2-e06feb747b07@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260821-sbom-cve-check-fragment-desc-v1-2-e06feb747b07@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0102CA0058.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::35) To VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI2PR04MB11147:EE_|PA4PR04MB8062:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a376ad9-7da5-47f8-e983-08deffb4e80d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|23010399003|22082099003|18002099003|56012099006|4143699003|3023799007|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	VUk5noyz4opSPoTtFjdNNd25h6x1TRwTvYlK7Wrynt4GvfUj4eXYp8UYRDDbS5IUAWz5xDQv2wYOvuZc1Nxk4ljZYCRu2ZDSwfyHAp05r2Bn+G/oA5BrrVPpnxvmAtQGlQDfxTfLucjiX+BjtIsWZcVrxK95cBmJNJtYXdqT4MThWIEiAqzcYkq3EehBGQYQLdd52xS494QlM5H9O2C601Ozq+c8mD1AMXsw3wTBHH4QZ5I5RCipTrt0BwlG4PYvTEJBls36I+J1trHgC8VIF7GhPIzJyUmKrYXV9jJcR/SNyKXG3S/3u9cUpYM9Sly6NBzOr3pAvdL5cRvX4WysOGiAYTV026kT1lMF5qsspPbXlWnGxgXXXaVlmZ0GB00BrFK32cADMmb1fDdZszu26Tpj3jhd2L+khfN8HW1AjGM3/4mknFaQLCLl7522wHdkzAJuCvuko5bDeRdsJ9/liC0h/o6p+ROdn6OsooY0XJfee/tBTQOH+3JuGyWrm+OL0Vbeqs4UZ4YGQfetVdSy9IbggsSXXdW/3B6hLIrWnvsKAow7FQF0G0I/NQJ+yEuy9U/UdDwWCh2HR7pJzNHrMuy5P0MuMJu4jmJ3Y7uwA0ciKAoL+pBq24ME5bkV5eW9XmcxMRbBjhAc4uHaMDfjJPy7srXLWOb/XpbgQs46gck=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(23010399003)(22082099003)(18002099003)(56012099006)(4143699003)(3023799007)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?V2JuUkRYT3NMWjAwYUxWajFqUDFDTFFSZ0czM1lLSnFveFZBL2d4SFhpdlVY?=
 =?utf-8?B?NUpubnpFQXV4dlNzY2RyNUMvVWEwMmRPek02MTNXN2dYS29oTW9Ka0s3WFpE?=
 =?utf-8?B?cXNEckI5Sk4yQ1lpcWJ2RnV1OEh5K0lNYVFVSXdxd050VytBTURONi9pbkRB?=
 =?utf-8?B?TmlNSlExYUQ0M1crdFRtQXVVTnBEMXJwNm8zZ0VUaDR3bXhRd21DNDNXTEMw?=
 =?utf-8?B?bk5ub3ZkSGU4U21IRlAxdld5dlNaN0xYdFpIQjdCQkJZMjRHRlZld0tkOTI4?=
 =?utf-8?B?NDI0MThMaHkrTTBOdzdFUnFGSlBDZzdORUFTbnp5WGxEVWdpcGNVVnl2cVkx?=
 =?utf-8?B?QXBSZ3VWRjJHY1hLa09YL01veDVvaXNPY2RuRGJyZnRqSkFIZWlzYkw0MVA4?=
 =?utf-8?B?TytJNU1GRlpTZ3hkYWVIUFRJMmwwMUVSY25MS0xHaWxML1QxWGpKeTJIRzZT?=
 =?utf-8?B?bEQxSFN1dElDQnRFUlpwS2wrS01aUGc1VFdzcXJkMHAyUy81dFdRR2U0djI0?=
 =?utf-8?B?RDV5eGpMcTVVTEk5SVNydUdweG9lbnRhUzNmdStJTGRUdzBLdzRZWVY1RjFt?=
 =?utf-8?B?ZkhuVElFQS9pRG5ERHprQ25hRTRKb2k4ZjQrT3dzN1hudzhoZEI0SUVmdWZY?=
 =?utf-8?B?UzlvNkNob09UVjUrOWtYSmdRMnV4NTI5RUYzSFcwSFdRREJoMXhBMGxsTUE0?=
 =?utf-8?B?WVVnd0NJWTdOcjhZK0xtNElsbHJWNXUwU1dkUWIyYTl2Y00wM2R3NWd1N2FS?=
 =?utf-8?B?SjdoUENWTkJ6NEFCRkRIQkdFdS9qMVJpUjg5K2JZYStPeUpBSEd1YmhtMGw3?=
 =?utf-8?B?UWxEOUZ5YkNjN1ZQVGNxckVPem82RTR0Tk5oMkRvVzI1OE9RQ0pSVi8wV1VG?=
 =?utf-8?B?THpPem5pazcxclMvdFQwK2tNWmJmUTNFQWIyZ0drRTRsbDd5Q0Nkd1lBcXZl?=
 =?utf-8?B?L0hwczVNbEY4TEcwS2hRcWJYZnhQWnlUR0VFb3JBMmdoZGlBaXh0RFJzakdB?=
 =?utf-8?B?UWtSV1VFT3BjYjJiZmgrb3M3SUlCYnpybDVwcU5YN2QxTU01TEJVSjJtNk5I?=
 =?utf-8?B?b205WkY1clJTZDArQ2FqTUpjMWhpQjVBMWRzT3IwaTZUcGhDU3d5a2tRb2da?=
 =?utf-8?B?TWVvYUExdk42Qlg1aUpzTFlaU3VaZ1AzWkw0eEhzVWNuZTNtZm1WalM4TUpy?=
 =?utf-8?B?aFZ6TWhkSGdVaGdwMzJSTHhnalc1SlkyVFFWK0wycTlEb283OUNFelZiUUpH?=
 =?utf-8?B?RUEwaFRaSi9CUm52MjYrRXVMYWtlalVnZStwTEJYVDllOUFObWZNakovMGcw?=
 =?utf-8?B?SHU1bVZ3VzRSMW1DUTIzUk1WUDNoanVuTWxJRC9BOUgxOERlZXZUYmZyZ0Qy?=
 =?utf-8?B?TmJzUmxXN0FObnBSL0FTbS9lMCtrZkVNeStTbndJZG5DZHc0RHB0TUx2QmYy?=
 =?utf-8?B?K1VGdDRSTEZCdGo4S3VLOWs3M256TDY0UVRleXorcmQxVTdBZUhNaHIwN2tU?=
 =?utf-8?B?N2tyUGN6anN2d2srSEJzd2dNSnJNUE52eC9VRkRLWXIzbTIwVTdhRXJUVjc1?=
 =?utf-8?B?Z1doeENBN09UOXA3bk5pMmJ2cUt3djdqSjRQVlZ0S2kwMk01M29sRG9Oc0po?=
 =?utf-8?B?aW9IK24waHJaem1hNC9BNGtVMmhTMVQ3dGtjQTFTZndja2lZc0g5ZXJEN040?=
 =?utf-8?B?eWtqZExtY0ZRSUN4ZGhDOVhHN213TzFXdXZoYTJPWlJWN2RGeU9qZFg0dXdY?=
 =?utf-8?B?d2lFcFRNY0NzU04vYXZaWGhlcm9xNzhhTzJCUjJTcXY2L3BJd0J3bDl0NTk3?=
 =?utf-8?B?ZnE5SlpuOVFHaWZjUGVzQXB0b0xrdm9temZvaFZFbi9rSTBKZUFjb3FvUzQ1?=
 =?utf-8?B?WVphYXpDc1RaNUtoVWdQZVRWM1dJdTc5VHFSd0drbnVTbG9XcEJJMHdXU0lT?=
 =?utf-8?B?Z0s0eU5zSmtEdXQ5dWRLK00yK3ZnaG51cU44ZVhQbnZKRkQzNkNlTzBmcFln?=
 =?utf-8?B?YUhNL3FSQ2piVjNLMUdPVmFOTXlvUUdRcHpjRU5abkNHRGlaNU5IYXB3QWMx?=
 =?utf-8?B?MW4xUExLWU1mRGFURVBPNlYzQTFFZ0FQQTlFSDlVbVZ6NC82dTNnY3lscFp1?=
 =?utf-8?B?SnFqL3ljY0tRSWp3bUQvemRRclBPbFVkWStyQTYxUHM0TjBWcnErOGVMOFV0?=
 =?utf-8?B?cmEvQWtSbnFBWm1HZXFpbXFKUG84U1JHbzZQZ3pMRGVpUUNDaW9hM0tjaW5i?=
 =?utf-8?B?SHI5N3ZYZ3BzSlpYNkZqU2RQbVZ3VjJmeHhNdlpoMDF4TmhCbmNuMnJVbGFH?=
 =?utf-8?B?Sm9RbVFvZ1BDQ2lOcEVENmQ0R2ptTVJUeDY1YjMyei9POWlCOGNoT256TVlw?=
 =?utf-8?Q?mPSiPNv1QG5gckgwvXswNg2361edRzIBPj7xAY0fajGtH?=
X-MS-Exchange-AntiSpam-MessageData-1: u6QQczkGFKknet7xXnEdrx7+Q6Tv58NJ3W4=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a376ad9-7da5-47f8-e983-08deffb4e80d
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11147.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 18:49:18.6409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KwtGm6SiH8D/CNqETyxq0OgqU3k+OKbZXFe4q+C3XxLsrw0GLa8ePAnyob28y0od3N2wi0AdibiJku9F+danG0trfxstUuGJTW713vJbhh8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8062
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2026 18:49:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243953

Hi Antonin,

On 8/21/26 2:26 PM, Antonin Godard via lists.openembedded.org wrote:
> Make the output of "Available built-in fragments" and "Enabled built-in
> fragments" use the same output format:
> 
>    Available built-in fragments:
>    machine/...     Sets MACHINE = "..."
> 
>    Enabled built-in fragments:
>    machine/qemuarm64       Sets MACHINE = "qemuarm64"
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>   meta/lib/bbconfigbuild/configfragments.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/lib/bbconfigbuild/configfragments.py b/meta/lib/bbconfigbuild/configfragments.py
> index 47605f3ddb..ccc1d8b610 100644
> --- a/meta/lib/bbconfigbuild/configfragments.py
> +++ b/meta/lib/bbconfigbuild/configfragments.py
> @@ -66,7 +66,7 @@ class ConfigFragmentsPlugin(LayerPlugin):
>               print('Available built-in fragments:')
>               builtin_dict = {i[0]:i[1] for i in [f.split(':') for f in builtin]}
>               for prefix,var in builtin_dict.items():
> -                print('{}/...\tSets {} = ...'.format(prefix, var))
> +                print('{}/...\tSets {} = "..."'.format(prefix, var))

Wondering if we shouldn't simply store the string before .format() in a 
variable and reuse it?

print_frag = '{}\tSets {} = "{}"'

[...]
print(print_frag.format(prefix + '/...', var, '...'))
[...]
print(print_frag.format(f, builtin_dict[prefix], value))

In any case:

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

