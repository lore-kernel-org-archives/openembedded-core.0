Return-Path: <frieder.schrempf@kontron.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3D88CAC592
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 16:28:25 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.106])
 by mx.groups.io with SMTP id smtpd.web11.17.1758040104477146860
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Sep 2025 09:28:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kontron.de header.s=selector1 header.b=wkJggo/b;
 spf=pass (domain: kontron.de, ip: 52.101.65.106, mailfrom: frieder.schrempf@kontron.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xQlWywtdiZNdK9PGMQbGBhrVyT0x0Fe4/hsvBawN/AvYgqQvCbzJeMzptRmOLtGZVTJVSKSXC+LimS6zcRtUnD7zWPGZ2CMC7IW8S8kGgftTOzc3AiejudVogg8RFt1DAUAi4Fu2LholdMqpE986A/P4NMJ8d/isPJjhFvf1sLKp54NfgPP0td18qp5yDVJfAqOuEIDHCdYBf3Fl7wo1DTz1DenxODpfwOVtnnF6ogGRkzmqR2M7hAKf7Qd3eCsskmKUMANvrj0oXNuQ15JJVmMFfTFUWV0UzPMK7MQh7BtQhtA19Z09R3QZ9PK9W2S5RAwblwl+Ir9V2RmwEBXJwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EUFerMC5Bsr5dPE55moBc4PG+IpLIVq5fH8LCMIKmp8=;
 b=j25uf1zKJPE+ME7LkWPYeAGdL5o8ZOaFDyy7iQsMTzbj88L1Op2uX2zaeXuVdVpEBriwINs1iVDxZn7p79iwGJWCOVz2b36g/CiS8sE1jSG8ru1pMfZJVF4VBs14ihn7JcbxV4vq6Cu9zSqZvTFLeKIGpdAqZPLxIXmIj1HMd1NTbt9zsbWaansBPNTv1BMexdlywUvWZ2BS4kRpUwZPkyHTJkIDvKcE0JDlCgVR2GBLKLqaNTazTm4W9wg5CY/VrDClqwaPJPhVwg8LyO6rgBP0M2kaICk2cNWOsWUWnKVDSz6LhYLn1uUDygCf+QChbqFcle8i4KQKA9pwK28CBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kontron.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EUFerMC5Bsr5dPE55moBc4PG+IpLIVq5fH8LCMIKmp8=;
 b=wkJggo/b6PyMRdQZWkj10OuOAhe0KKTT+0uwmKyqrB7myFCuCyZ5kH5w0iBrfBsyWk7zEr7VvJq8yWYI6nFqfjFPSQ5bkmn3B9keO0KSNxldFAihzaOQ+DZbotyFbU7COI1Wk3/ol/Z5hvJgWU5xLZaq7GbP1OoTzQu0vRJUNgoPB9W3lS7HP5b0z2WMtjclSn5FR7Vr19QNYg7vidx60/c2NTYhelsRP7YFZwy4SzFTDJRSHPjq20KKGb4TSUbkzJHBc9nEq+PIcp2D2ryGXu0qwvIHFMG23UPtMNknAWF0vQsxgsVw4/PFe5ALIpDjwDB0T2b9sDJL8rn2ylk1gw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by AS1PR10MB5340.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4a0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 16:28:21 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b854:7611:1533:2a19]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b854:7611:1533:2a19%4]) with mapi id 15.20.9094.021; Tue, 16 Sep 2025
 16:28:21 +0000
Message-ID: <b1965178-2e6a-4215-9d01-d2ff8cefbbb8@kontron.de>
Date: Tue, 16 Sep 2025 18:28:19 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] devtool: Support variables in SRC_URI when upgrading
 recipes
To: Frieder Schrempf <frieder@fris.de>,
 openembedded-core@lists.openembedded.org
References: <20250916100956.319729-1-frieder@fris.de>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20250916100956.319729-1-frieder@fris.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0214.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::8) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|AS1PR10MB5340:EE_
X-MS-Office365-Filtering-Correlation-Id: 93b57254-514d-4cd4-8dcb-08ddf53e0cec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RzJHRVBVMnEzTW9pdEpTNUIyWnZyQXlHQXZGMERsdXdZNisyZkM4ZHl6S3Za?=
 =?utf-8?B?V3haVFIvN1l5UUN6L3cyUXpFYmFwM0NPQ212Z2FWc3ZaSnNnSFZIellsLzNx?=
 =?utf-8?B?MEt6UFUyWFNyTGsxcVd5ekVVRHBlbldRQVR1RTFMd2hnVEFtVGVpK1NIOUxK?=
 =?utf-8?B?NzZwdUp3S2tDU2d6M1ZLbWZKZWQrcEJvcFhqaXc3UVZVVFJYK1lkWnU2c1VG?=
 =?utf-8?B?Y0ZvUzUzK1NIUGNOOXphbUg3cnFwK1F4Ymd0VDZneEp6cnFCZkp6STRZSjlO?=
 =?utf-8?B?V2Q0UzlmTFZGUE5UdnMxSUVyb2FwemlVTFdodFhKWmZXMjE5MUN5N1oxZDJz?=
 =?utf-8?B?WC85eDBBTVc5MjJwSEFhQlo5dGcwRjF2ZTRQZHF6YkdFS1VkZ0ZXTGhXUVh0?=
 =?utf-8?B?c1MwZm54eWtlRStvZURRbFRXUHFjeStveEE2WCs0cGRRcGpoSnFkYy9UYlRw?=
 =?utf-8?B?QlBRQmdaQXRLYStZUFhZbGREUTlFOGtFd0dOOEo2ZDMyd1YwL0ZaMklEdTJH?=
 =?utf-8?B?aGJidVh4WkttWXNMWnUvYUoxZnFvUDdJU0UyZVptejdBOXUyeHpZM2pPdTlC?=
 =?utf-8?B?Wm5mazgxS2szaElKSUs5dU9rVDFON0hPeE9kVDA1UGNxM0UrMzR5dVlEZHVB?=
 =?utf-8?B?TXR5dWR2dnk3NEQyUGNXUlRZbXZPOGpyQTNtejFDOEd0NkRvbVozbGdyemt6?=
 =?utf-8?B?SGVlNWt0VS9zdC8rOHZSdFNwaHJvb1N3YUZJNGFDWGlRMGtKQkt3ekhhL0Uv?=
 =?utf-8?B?eldXeTA0YzFBUEJpa2ExNUxWYVdNUjdqQmM0UTYxd3pIbGlSdTlvUG1BMXRZ?=
 =?utf-8?B?aFFUNkYvcXdvcVJDRlROSTlZdXJyS3ZuSm4zKzJZa01wUDBuU3htdEM2TG9u?=
 =?utf-8?B?MlhXVGxqeEZLalNSQTFrSzlnbDc2eFNWMXJqK0Y0YmNDcmdLL2g1NC9GUkJl?=
 =?utf-8?B?M0RIZ3BLK01OWWp6b01yNDcraTFtNlRlUkdwdDZxdzBUdFphT1dOMmxLLzFF?=
 =?utf-8?B?eWpPUWZTSUVla3lTTFNmWGN4Q2lPMmNFSjlOY0lTMW5XdlZkaHFFbXNDbCtT?=
 =?utf-8?B?SmRjS2tYTWVnQTREVm9UMldIT01Zb3JPcktnUEgzQVBnVW5OMEtBOXpjSjZl?=
 =?utf-8?B?TDhaeURQeDdmNERxMmhuUkZQdWZJNnhkb3VDa282QXhWcnl1Ui9INHc4RVZB?=
 =?utf-8?B?cUE2bExTb3V0aG1xYmQ3cTVlMEhrT3lmYTNXSUNvYVBzNWNsRU5EY25PVlF1?=
 =?utf-8?B?b2V1Ujk2cjRpc3NneTdiZ2JWY2dOanJjV2JEblVxUHZpQlFkK2VOR0g2V255?=
 =?utf-8?B?RUdlMG0waEQ1ZzFZR0diYUFLRmtvNlpSMi8xU24zcC9ZQk9rRmFWVmxkM0NQ?=
 =?utf-8?B?SUhSaHRYbVRUdnRCQll3YkNSRmpHajhDeXFteFRJaVRLN2FlNkdmV1lONFZ2?=
 =?utf-8?B?Wk1hNGszTUQ5UXcrLzRHUFY4bGgvdGJWS3VHaWhlbTVUbU9hckJ5a1B4N0dM?=
 =?utf-8?B?ZWcrSndVT25keW9TZFk0U3J5NmlXbVVHbVFKNElZRGFHWlJ3SmVzWXFGelJz?=
 =?utf-8?B?aU0vbDdBV1hOdy9sd0p1M0NoSm1sMno2RXI0elZkM2JzUlFiYzFvVHNabFJk?=
 =?utf-8?B?YlIyWUtVVnRmQjFYdEFhUzBXejVIMU5HYWMrQnNoNG5YMnI1OXF1alJ1Mllm?=
 =?utf-8?B?VS81YUNPVW9QWWNzUytIMFMxMWkxa1Q2N1VheERtbnZ4YVBHUTNNVUNneitP?=
 =?utf-8?B?Ujg4S3JhWlVtb3RVdzU1bkRUZzlqSExQYm5WeGFOR0hmVlI3UU5GVU9zaVFT?=
 =?utf-8?B?VG01OTBZZE4vd3NZTEw1d3Y4SUxXemwwdVlBTGh6cXBaZlpaNm1pNjdIdm1R?=
 =?utf-8?B?Z2pvQ3UyemlDL2tabVV5OWZnaEVqcm00YzlEVDZNTFVnNDBFN01zeHNYOTJH?=
 =?utf-8?Q?c6OhqJ1vxP8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RUhpa0ZkcklTR1NPcFNFcncxSENVb0crckdjOUVWd05WQy93VFdQNmZodFg1?=
 =?utf-8?B?ZTlVbnFlYlVxcWx2bWM0Z1Z1ZkVZNi9xQzROem5rd2h6RlRHYml4dkJ0Znor?=
 =?utf-8?B?QnRVUWhqcm9hWUM1bFRwbjlZNE92SWI4Y3NGZy82eDFhYzJ5MlZXSU40aG5F?=
 =?utf-8?B?aWt5ZTFtaENrNzBINnNEVHBWNzQyZEhSVTlIREEyMUErN1BWcjJtMzQybU5M?=
 =?utf-8?B?WTNYWUxNdWZoRWdqeklvaWNzZXNCQXRNRjJhcXBsSzJpVTRHSVdaYjUyS1Nm?=
 =?utf-8?B?VVJ2MHByQzRnSmFtMGllck1hSG5IUkIrSENidXBSbDRpY245VkhOU0FGVWdp?=
 =?utf-8?B?TmVGWW5tTFNqamhnYVEzYWM0RnRvQkd0a1p0Vkoxek1iUis5OFNNVG52TUk3?=
 =?utf-8?B?V0lFYUYrN2FwT0hSaVc1U2xWbEZMbytQNU1zRXZyY1RGU2YwSnRSRXZCa2Zt?=
 =?utf-8?B?TlFGWFcrdEpObFM1VS9wWXgyYWV5UTQybDRCbzM3UzJQbzlGMnFCbC9ZQVJD?=
 =?utf-8?B?SGdPNm5RaDJwL2Joa1JaalFrNTAyZGswTVRnQ0JoUzVGOGtTdUVoSEdnYmtV?=
 =?utf-8?B?cm9NVnIxcm1scThzdWxNSjZxS1dKdGh5bEl4VlB0WVJqMW5LN0c0OFluQ3FK?=
 =?utf-8?B?YTVpWjRoWVE4Y3gvNXFMK2s2N3o5dDM1QjB5WkNwZDlrZEp0Skw4Q3ppdTdU?=
 =?utf-8?B?NDloSTl3UE9oSDBiVldtOTJCYnB5T2Y4QndOYXZSZ2w2QkpORG9ramlYdCtM?=
 =?utf-8?B?N0Y4MGd3S1Z1cFdwdzdFZ0p4RFRXR3EwdGdML1ArZjJsVzRvcGVhSUVsbjZM?=
 =?utf-8?B?QWJjMUFYaDdna0ROZ1pWcDhlbjhPY2QvY0pLbkRGbEVpZkJCdGFrU3BKQjFp?=
 =?utf-8?B?b3hYZlVXV2x3SGJiWmc0WEhRaFVTNnZNK0VQeGF0NjJUU1FpSDRHUXdrTmhH?=
 =?utf-8?B?SmpVMEw3TUoxS0ZyRFJkYWVUSVdrcWtsZWUzVlRtU2dNUHFIUVBTVnd3QW81?=
 =?utf-8?B?NUZuZW1URDY5TDBPRUhHcXRxVDZodlVtVUFJUWJRajNiM2lCRDg0N3hyZlVx?=
 =?utf-8?B?NXVsNHp1VHc5ZEUxVjE1U3VsRHd5UWE1OTNpaGN1Yk5obkxzN1pUck00dVFT?=
 =?utf-8?B?TmFQUmNmaDRwajZLK1hTSzhaUGQ5YldFdnQwNVFSQVk4clZqbjU4N0dHMWFQ?=
 =?utf-8?B?UWRNekphVXZmbjduQVA2c3lzTUl3cXBRNkhtQkNvT3NMVk5QMjVBVWVLY0oz?=
 =?utf-8?B?NXc2TWx6OENSaTBTTFdNVENJYVZ4ci9xTVJMLzlwdGlDd2F3b2RoNGRJWHJN?=
 =?utf-8?B?ckxiNUtlL1U1TWxxRE05Q0NKZkovZ0kxM29zL2lBUVVSZXNxQ0h3YzV5VGRT?=
 =?utf-8?B?cjhtUXVrS1RValYrL1NQaEtucGN0TlNBVzAycmNZcENRc3FWWFdJOU1MQy9W?=
 =?utf-8?B?WUg2ZE5MalIrWFVibm5PMWZEVkpqQ2htaGpFdkxMTDl3RFkyL3U1cHpEc04w?=
 =?utf-8?B?ZXJWWVd5aUtWSGFIeVJDMlE3WnMyUzVsayswZXV1MjBUTlhPRUFodjRNM1JY?=
 =?utf-8?B?K1phQkNUcndINEErdS9ic3V1VXgzTkc0Q0NLeEVXYTFJWWc2WGZnWHFXTE9S?=
 =?utf-8?B?ekVBVllaYzFRbktpSU4xMHU4b0JjU0tKZktYU1prM1hpRThQbEUwczVtZnVh?=
 =?utf-8?B?TG9Rb0s0a05kZ3hURUlJMGw2WTBHaXFBMWxLZHdGRnUzaU9ONE5OaENvQWZK?=
 =?utf-8?B?b0xRanloYTl3Z1NrZ1o1LzY5QlJwN3lOcy9vQXFKakZNSmxnamI2MVErQjRn?=
 =?utf-8?B?REhwNHAvVzJUbTNCbWdrbUVVSVYzOUw0b3o2YS9iNXpzKy9mSkcxT1V2bUJV?=
 =?utf-8?B?d2swU3YzMkp6eXY5RmVpcmJsTWV3US9xTFZBbkt3djJHdGlqbmlWcWR2d3V4?=
 =?utf-8?B?QSt5Sjk2SnJzNzZmbkZETEp2OTB6TXVBTlcxYys2M2dXZjJBTXQ2ck1wQlpP?=
 =?utf-8?B?NUMvaGhLWDhuSVpDTkdPcDkzbWVsUmY5aHhHbnp3VTh4RE1idHNPcDdveEVy?=
 =?utf-8?B?dTBPOVE3ZjRaWGNaVi9YdXlFMzJ4c2dtcVZsbmMwd1FhMnhsY092UzFLL1Va?=
 =?utf-8?B?RzVMN1g4dzRENk95TkFoZ3ppeDl2ZFFqdHN3cG1mdlZaTVkxNHpFemNyMVpo?=
 =?utf-8?B?M3c9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 93b57254-514d-4cd4-8dcb-08ddf53e0cec
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 16:28:21.2419
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hb01bmTciNyRYEN9KVfL/CLwh+BpB5G0m0rOdzmbdEkwwZrjnE9LB9Few9DkemHB4D5Ogr6AdxdJTTYVY5EiNOkyPUPi9qiRNxegjx2QswA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5340
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 16:28:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223576

Am 16.09.25 um 12:09 schrieb Frieder Schrempf:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> Currently when upgrading recipes SRC_URI doesn't get expanded which
> can lead to failures if variables are used in SRC_URI. Remove this
> limitation by always expanding SRC_URI.

Hm, it seems like it already works on master without this patch (no idea
why as this still uses getVar('SRC_URI', False). But on Scarthgap I'm
getting:

ERROR: Could not decode SRC_URI: The URL: '${SRC_URI_PLATFORM_BSP}' is
invalid and cannot be interpreted

> 
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---
>  scripts/lib/devtool/standard.py | 4 ++--
>  scripts/lib/devtool/upgrade.py  | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
> index 1fd5947c41..9e8889f897 100644
> --- a/scripts/lib/devtool/standard.py
> +++ b/scripts/lib/devtool/standard.py
> @@ -1540,7 +1540,7 @@ def _update_recipe_srcrev(recipename, workspace, srctree, rd, appendlayerdir, wi
>      remove_files = []
>      patchfields = {}
>      patchfields['SRCREV'] = srcrev
> -    orig_src_uri = rd.getVar('SRC_URI', False) or ''
> +    orig_src_uri = rd.getVar('SRC_URI') or ''
>      srcuri = orig_src_uri.split()
>      tempdir = tempfile.mkdtemp(prefix='devtool')
>      update_srcuri = False
> @@ -1672,7 +1672,7 @@ def _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdir, wil
>          updatefiles = False
>          updaterecipe = False
>          destpath = None
> -        srcuri = (rd.getVar('SRC_URI', False) or '').split()
> +        srcuri = (rd.getVar('SRC_URI') or '').split()
>  
>          if appendlayerdir:
>              files = OrderedDict((os.path.join(local_files_dir, key), val) for
> diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
> index dda0a58098..6df53b0232 100644
> --- a/scripts/lib/devtool/upgrade.py
> +++ b/scripts/lib/devtool/upgrade.py
> @@ -359,7 +359,7 @@ def _create_new_recipe(newpv, checksums, srcrev, srcbranch, srcsubdir_old, srcsu
>          newvalues['SRCREV'] = srcrev
>  
>      if srcbranch:
> -        src_uri = oe.recipeutils.split_var_value(rd.getVar('SRC_URI', False) or '')
> +        src_uri = oe.recipeutils.split_var_value(rd.getVar('SRC_URI') or '')
>          changed = False
>          replacing = True
>          new_src_uri = []


