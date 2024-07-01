Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FC43C2BD09
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 08:52:44 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.108])
 by mx.groups.io with SMTP id smtpd.web10.15130.1719823948939329830
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jul 2024 01:52:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Ha03FTW6;
 spf=pass (domain: cherry.de, ip: 40.107.249.108, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gc97EZue3I0XLPlqvRCqoFly/rhJAUr0GXcRwGzaDnJEl/REWV9iwVWi8W4S4eUH0FDXsoS0e/Br3d5HKHPiquLRB10D3HPcxDlmzQwSr/xDD5fWHNCQIKqqqILRhQMqrafjtFATwqsEP0UJBHDkB1qWN93BM0JD1qKYO07xrTE9wU8G9W3Ljdznp09Qwa4q94IFl/XgBzKcJKTweYDNnE6Vj+5Nf2CoeMBUOjsSJds9DNp2UumBbdJShO3azGcZ0gmbQ4RdSIO4xvp8+Mlv3InZfjZP6uUctIdLLuGBpIIbT0kApot8sP/1C3hOwr66Cy9X/xuiu0MIFGDFuoYS2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KYXxND5Nz5YhEOUwVRAO0X7WMvUIL338rFTfz82E4Zk=;
 b=ZrCgEO3wEzZURK6paF4kMFs3r/PPfJ1HMDC78XNrIiAX9SOah0pTQ2XonxHfsGx3FVdv+GdVhoXEuxFWPajdKhLKg3vS8uW7PyjoiR6SaAW+WsYcYAniMIlD/I72vLfEWGJYcRYajMSsrxRbxeoDT66cK3Pykpb3F/xHYyQkx85eVBaUAfKW0cPt/pbEOPYjTw9Lb5vZplThhsyeSMrS6NLQmnRSQgEBlY+in9tfnHKOqnMISqn4xUuM3WTVV2Cmb2a9vLzCUUrX2q8u2+f3wvM69jzjRVTYGcebdxR2Ia8ZYZ419tez7N77gzEaRnHvyhKvAPYPjMo8OdFUf4pjtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KYXxND5Nz5YhEOUwVRAO0X7WMvUIL338rFTfz82E4Zk=;
 b=Ha03FTW6uCd3yOXhL0RAtkgxQsoky9s0tBwu+ax03um2Pq/GEZCjEMKEbsKxIHGRdK2vVqgymgPU3LHKeuucJhpesxYKLJV+u9Q6ORVVC1+n16feQGTrpo1Eymo4mSeQxUrkp0qwD449ru21Ago+/gMe6F/lqMx2hdRK30niu/4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA4PR04MB7982.eurprd04.prod.outlook.com (2603:10a6:102:c4::9)
 by AM9PR04MB8273.eurprd04.prod.outlook.com (2603:10a6:20b:3e5::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Mon, 1 Jul
 2024 08:52:24 +0000
Received: from PA4PR04MB7982.eurprd04.prod.outlook.com
 ([fe80::3c4:afd5:49ac:77af]) by PA4PR04MB7982.eurprd04.prod.outlook.com
 ([fe80::3c4:afd5:49ac:77af%4]) with mapi id 15.20.7719.029; Mon, 1 Jul 2024
 08:52:24 +0000
Message-ID: <42643948-fd67-4001-999e-623d37ce309f@cherry.de>
Date: Mon, 1 Jul 2024 10:52:22 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/2] librsvg: don't try to run target code at
 build time
To: ross.burton@arm.com, openembedded-core@lists.openembedded.org
References: <20240627172322.1600152-1-ross.burton@arm.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20240627172322.1600152-1-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0045.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::19) To PA4PR04MB7982.eurprd04.prod.outlook.com
 (2603:10a6:102:c4::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7982:EE_|AM9PR04MB8273:EE_
X-MS-Office365-Filtering-Correlation-Id: b4f04af3-9a11-412e-bfeb-08dc99ab203c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OGd1TzVrejRMaHFBc0NmeWdYbGVVYmFDTVNwOVhZeDRTV1Y3S3FzZTFTakdR?=
 =?utf-8?B?VXdyMk5qRTZVYVNocVdIeEQxVUtRdWpFNllCZnl3VFZ5YWhtRWJwQVpGVkw3?=
 =?utf-8?B?cFI2bFMwSlJ3UzJNVkgwL0VRMkFwQk9sUksrZlRnVTY4YUJndEZZTzZPN2Fs?=
 =?utf-8?B?WE1VWjUxRXB2MGhTQm9pUi9najJ3Vkh4ZFZMQ21FZDhYb1hzN2syK1JuT25G?=
 =?utf-8?B?U2I0cDJoMGVLVHhwQVV2UUM5VFNkenhnRmhCQlpuUzVuUS9mT2czZVlpRnFk?=
 =?utf-8?B?QVlid1llRzZVUnhVdVFEd1Zpc3p3SExiZWRmTnNwT3ZYMlpqZzhYNEZPODdR?=
 =?utf-8?B?WmY5OEtuLzBhYWFkWkdZQlJKUktmbkxRVS9SMnRXbHhVMnZtYk5qK2MvNnUx?=
 =?utf-8?B?VlU2dDhWSnllM21jTDFuVVNGYkNQWGh6UU5JOUxMV1poSUhMRlhHUUVWb2NN?=
 =?utf-8?B?SDlQejFFOE1LSSthVGpPSzRJUzRBSEN3U2Y2dU5ORFFtcHU1bllxS0pMZXVm?=
 =?utf-8?B?Q0NNL21OY1pSSDZYVmNLd1RwS2RRMGdablhFRFdTY1lBT20wUU42WjFta2dl?=
 =?utf-8?B?RkZ2Q3NKc2NidG5qTXp1T1lkMmhjZ0Uwdy9FT0hEamY3R2hvaitXSG9uSTJO?=
 =?utf-8?B?am9RYTNRcS96bmJ0Rk5WTGxGVnFOa0RZSkZ5WGJsbHpRV1BJcU5YcmFOVmYv?=
 =?utf-8?B?KzJtYmw2QXppV1lUWnlKYkhMOVNFRTVTSG01aEsvaGtWT2RhazB0VXJmOXhv?=
 =?utf-8?B?WmRnSHZjK3ZoU1IzNWlWZlIzcUZjTWdCYlo5aHRJRzY4bnRvVjhnaTBMdVNE?=
 =?utf-8?B?RmxQVVc3VVpyVGZSWHJ5UlBzaGpYTUtFV05wSklSdmw3MXdFTUsvNHA3a1N3?=
 =?utf-8?B?djZzRUNndlRveU5IcjJWRGNXc3VqTlJpVGZZc2UyVDdhckFqZE4wMXBVQzJ6?=
 =?utf-8?B?TU9ER3lHSWd2NWxhNDVic2R5VFhLM0tiZG5nQ1VTT3BWNlBIWjJ6TVl6bVlt?=
 =?utf-8?B?MEtLNWJhYVBoR1hZNFJlS09WbkdMSEErN3VzWTJkT1BIdVdWdER5aEJqZ1cw?=
 =?utf-8?B?TnhGeHJXUS95bFhkRm1Hak9SUkVTK1doUFJ1SnJCZk05WWIwbzFLRGt2dXVF?=
 =?utf-8?B?c01CNXNRaWtEZWwrUmRKTkVtcVh3cnpvWS9QYUdUWWQxVE5adHlKMEpHZ3dH?=
 =?utf-8?B?Tk5SbE5oQjAzM0gycmNXdEtoOUV5WFVyN2phSDdzMWRUQVhzTG9wKy8ySWo4?=
 =?utf-8?B?YTRVWVdOSklmNVExZXI1SDc3d1h5TjhjRlJ6NWtkMkdWaENOZG1MZHFTMzJF?=
 =?utf-8?B?NHNZbGJwdlhiTnlUMUV4NlBGbGhoRGFIalBINTRGekZyaGNjMDlZZ2tzcGR2?=
 =?utf-8?B?S0cvMHdGVEtFZGNSaHpmcEI0YUprMmRtNUlMY0NTaCs3d2x5MDQ4d0xiczhF?=
 =?utf-8?B?WkVDZ1FsT2Q3dmVtWE1LNUJuQ29RUUxkS1VwSnprT0dXTVdlOGMzVnJVQk5j?=
 =?utf-8?B?RGo1clIrdFBTRTFzbUhxeU1DdXF4NE16cUh6SUl4eXlnWFo3TjhNZE5tZXRp?=
 =?utf-8?B?TzYwYjdWam5RcmpIamtQeERTSGliM0RKWU13cC8vbXM1Y1lIV0lvQUxIc29n?=
 =?utf-8?B?OHRwMGpYZ2hwRHFKYjhrU0hxcklBWVFvUnBxd0dINUhWeU9aSkJxZURJTDlS?=
 =?utf-8?B?Q1V0YlNSdmU3MnNvYUxsQXQ2dklpZnZvU3JEYkNQdVBVZE91VGpjTjlvTklD?=
 =?utf-8?B?Q0VKNkh4ZWpZamJEM0E4UWp5L0hreFFaem1xUVV4TzBOTVVHZFBqUUw3RGR5?=
 =?utf-8?B?Ly9wVGZaZnB0SU5LNUxVZz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7982.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MkdxY0dEdE0zdHl5c1ZoSTRFZFZ3TW5EUkhvdTBaWnpnb2FETmNDaVJoemxG?=
 =?utf-8?B?SDNYbVUvcnBDbFFqc2dOUVE3QXpTQ29VaWI0K2Q3bnRhMmFZbnhaVVFxS0FB?=
 =?utf-8?B?N0hMRHJ5L09kQ0V4eWUxSnNocWQ2UkRpcHNkVEdFS1pXeVQxUTJjL3FTbFhF?=
 =?utf-8?B?bFpNSjl4elZKajdpNlZmTENTSjFrWCtCL1FzR2lENDllNXBHT2dpZjNuUndY?=
 =?utf-8?B?ZXZEK3JHbEJHR3dUWlZNM3NwWnR0MEJxaGVGcmwzcGZBa21ZVVF4UEdiUHov?=
 =?utf-8?B?UGZjd015MVFCNTVvU3hjZWI3OU15WjR6ZFhIT1hQRDdFcnJxeG9rWUZTSUEx?=
 =?utf-8?B?MzNxTzJ4VXozUUJaS2xacjNMcnBiTTFKTS81dkE4NGJYVEJmZkhXWGFMZHJJ?=
 =?utf-8?B?S3hOb0p3MWRVd3dybkoyenBlQXFOcWpTRC8wT3Q4WGFhSUpsUjhRR2d6NXZF?=
 =?utf-8?B?aHVSL2R1ekRTVW11dTRCaWJrYlNpVG1vQ0FENkNlbmZ1T0l3MnRzT29FazNw?=
 =?utf-8?B?NzJ1UnZFQjMyUWw0K3BoRHI3cDhSVVgrcFh5bENJU0ZuYU14T0NTK2JCdmtR?=
 =?utf-8?B?bVhOZkdhNktWNHZFd29ETkxPMmREcTFNbHpCTWVtSldONjE5Q2NwYTBNSmU2?=
 =?utf-8?B?b29iaFBqQXRFMHkzdW9rOG4rM3dVN1ZCSFVCOS96eXpLWVZJN3EzZDV3c1g1?=
 =?utf-8?B?dldoaVZlS1ZSaTFNSTJmUGpTb3M0aFlJellmU3hqVVhLWjRYbnViamhVSnNS?=
 =?utf-8?B?bUlhVCsrU1lmcXNIUjExWGxTb3pHamxpdTBhNGRFMmxNSFNMaTZpZDh4eEZ2?=
 =?utf-8?B?NHZtTVJXbkgzWlRQa2Fzc2h3L2Z6SDNDSXFFcHluZDh3WEVSODBxNUhKYnp1?=
 =?utf-8?B?MHM3Ky9ucVdUQW0yTlJWbDNtK210SnJQZWxGZ01ncXVLZkZTakhnZUJ4V1lD?=
 =?utf-8?B?M3VhVWd1Lytqbk9VWkdSbEZ1bU1TSHZLTWJSY1E1cUFITzlhKzJ5K3FIelVS?=
 =?utf-8?B?MDMxTjFCU3BVNE1sckxGZXM1UGdKa0RoZnlkU1FibWFRYy9MRmZIa3JvaHU3?=
 =?utf-8?B?ZU1DdXJmaldnSHphUGY0SHAycXhnVy9keDFKTFlUd1NrcDNXWFFiL05hQTlH?=
 =?utf-8?B?WHQxL3lyTmlleHBZQ1N6VXVGSWVscll0NHR4MTJ0ZnIxSEdqcm81aUt3ZjJU?=
 =?utf-8?B?aGJEK2ZaR3kxSURydXpGZ3pwbkZZV1QrV0JoeXA3S1EydnFQclh6VUFVTTNj?=
 =?utf-8?B?Y0Z0dWl4VjR0QlpGRDFSTTZra3Y3L1A2U2lFaURlTlQvL2N2Y2tnMXZRL3BS?=
 =?utf-8?B?OGFuWmJnVW5EMjQ5VHArQXBCN1ZJNjFZRVJlckRDYkJwU1dENjJGTDlnaEJp?=
 =?utf-8?B?ejNBRFFHazFUZEtDaHZ0b3pOQ2VKYTN6K3dLYVNCMXEzaE1kQkZEVjlvRG04?=
 =?utf-8?B?bW9lUUZWY3RkaGpHN3ptRXpHczg1d01DQzErWWRiS05IbGlrVzdQZUlUc2hq?=
 =?utf-8?B?dW9IcjdLK1RMb2w2Q3k5T25qaEo0S1Z4ZnVRWDVCeVBjNFQrWUVOb0doL0gr?=
 =?utf-8?B?L2R2T1RkWHJ3dFNweStoZFMzNW5aM3AzTCtBaDB0MGVyRWZEdFAzc21ROUJv?=
 =?utf-8?B?blJ3SzJycGROYTg0OUEzL2QwbHZmcTZQSjRGVzZTUXROeHF5SkVIOHFmbkRv?=
 =?utf-8?B?dXJ0QjJ2TzBYUnBPUnh1ZHN6V0xURkVlRmwwOGtPdTdHSWU3WFl4ZFpheStO?=
 =?utf-8?B?UThjQnhjR01tMlg2YmtuaWNQYzMyTC9HUmg3Ny81U3ArVGhXb2Npa1B3aUxG?=
 =?utf-8?B?V0x1TW1xQnVZSkZEdEhGOERyT3d2a0tYUTVYRVRkMm5STEhsY0RoRCs5MHB5?=
 =?utf-8?B?cUg3cXBzUlNZcXdVZk5NY2czYnZMaExHZVlnanNTYjU2Mkd6TFpoc3lXVzlB?=
 =?utf-8?B?dzRzQ1hIU1docnFPbVhld3VROE9vTk4xY1QwbXY0YWVwUUFRQlM1TUMyWmZ1?=
 =?utf-8?B?UXZJdVFYWEdocU96aUNIWWtwZjhiV0xPYmc2SWZSUEozL0hTRWlWS3d1dzdx?=
 =?utf-8?B?UHdDTEFySXB4ZDcvcEdERVRibHY2a25VaUlZMEp5QVV5bVVUV2Rycmh5UlRS?=
 =?utf-8?B?WFB3RjJIazdVMnFtTGpRdVRTeVhYNVBxN1lJVFRoQ1BCM2VJb2g5cWU4Qkcw?=
 =?utf-8?B?VWc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b4f04af3-9a11-412e-bfeb-08dc99ab203c
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7982.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 08:52:24.0322
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UV0Uc3f1YkD4+eDtI3G+NxKGPivxXHEwS6Qujyi5tHsW/K26pQ33HSrI/7A3/2HCb94tRVuuEg3tOqu+dEPjaAjsFzDIPn3dXlv8mtNQCCA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8273
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 08:52:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201282

Hi Ross,

On 6/27/24 7:23 PM, Ross Burton via lists.openembedded.org wrote:
> The rsvg-loader test binary isn't installed but building it causes a mix
> of build host and target code to be executed.  As we don't install the
> test, don't build it.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>   .../librsvg/disable-rsvg-loader-test.patch    | 40 +++++++++++++++++++
>   meta/recipes-gnome/librsvg/librsvg_2.57.1.bb  |  1 +
>   2 files changed, 41 insertions(+)
>   create mode 100644 meta/recipes-gnome/librsvg/librsvg/disable-rsvg-loader-test.patch
> 
> diff --git a/meta/recipes-gnome/librsvg/librsvg/disable-rsvg-loader-test.patch b/meta/recipes-gnome/librsvg/librsvg/disable-rsvg-loader-test.patch
> new file mode 100644
> index 00000000000..e56772a7e2f
> --- /dev/null
> +++ b/meta/recipes-gnome/librsvg/librsvg/disable-rsvg-loader-test.patch
> @@ -0,0 +1,40 @@
> +From df94cfa4a637c229fef32c349b5c2dfee2dca3fc Mon Sep 17 00:00:00 2001
> +From: Ross Burton <ross.burton@arm.com>
> +Date: Thu, 27 Jun 2024 17:09:11 +0100
> +Subject: [PATCH] Don't build rsvg-loader in cross builds
> +
> +This binary is a non-installed test binary that isn't any use in cross builds, and
> +causes problems because it generates a gdk-pixbuf loader cache at build time using
> +a mix of host and target libraries.
> +
> +As we don't install the binary, we can just not build it.
> +
> +Upstream-Status: Inappropriate [upstream has moved to Meson]

Will we have the same issue once we bump librsvg to a version that uses 
Meson? If yes, it would be a good opportunity to fix it now in Meson too 
so that we can benefit from the moment we migrate to the Meson-able release?

Cheers,
Quentin

