Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD7D3D44161
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 10:18:13 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.3])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9755.1765534688304962944
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Dec 2025 02:18:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=RAfMm/mO;
 spf=pass (domain: cherry.de, ip: 52.101.65.3, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h6CijKkjuxrC7JnaogMwcE7F1bfWO1S9vGzqZgoh6e7eyKdAjMy84bBnsPjkj6XT3akgjty7B6U0+itbsnYFOv0O5dC2+SnLbFrCckljM5PqQpXXM15Ebvftr/1ER1Qj2cAKcYu0NfmkbHVivBKxAI8bUDzVZLC2DlCdHyXRs5co7FAneRPP9tE/wCRqxV4QG9onXA+5B16m2tu1m6YwcCq/xF+iXv6CCnkp81gXCwuaLXWGjJYW6zKnoPyR/iWLonIRIJmrrV4551ofyv1zv1dRel+6gZFIMT2hVxE7LcmcbX4MsTkq0x9a0vWgdlBy8HQftz5M/Or3IVyDRPKP1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xJaj7svXevGpM9f0vion3J3CMHjn1XCahU9rPAWZaUI=;
 b=MtM/t8IA1H7iFqIiTwrm1z3LJ+k/C4yPyjyZFgxoOwlMFv87ZNZqvtCbOB2m1wf2c/0r86HXFw21KLKnYGbDZcuf/GuxwwZd6WM21KRUeiTPfMt6BiBa1S9mgMTefl2lzu1Vr685wZ3CjoebAWSO8fzRrriwd3VQRDMvFFljsxEFDCbbZpy8Za9DB0xVgOmYxrTwONug0cOBGtlu23ORU6AqkCYGQmGJRl48mGZdnvgCyned2YhxAByUGshcmzpEGr+Ux9QtwpZTdFFpvzn4Y6Gh73tcXKpKdVzyt6H9KufcOcqJgf9epJrymzQXvaUoYBKmL8W6xlqMaTriFJPVFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xJaj7svXevGpM9f0vion3J3CMHjn1XCahU9rPAWZaUI=;
 b=RAfMm/mOugGAbCe0qTLG+Qu6taISr0yZeZ8aKdhDzv2JyMR9zSeCoa85qQxW10lJiYjLAki/03hQH1aWKtNVuk3OhC2yKUiK5Dg3Uj3RVZvn5O0w4whZ+ZR7ceNQxFNlAC0cbikUtP+RvfzUcRcM5UWCFZWpG/czp58s+gbWm+c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by VI0PR04MB10438.eurprd04.prod.outlook.com (2603:10a6:800:21b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Fri, 12 Dec
 2025 10:18:01 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 10:18:01 +0000
Message-ID: <20d7536c-732f-4b22-9a54-b54ee9e26860@cherry.de>
Date: Fri, 12 Dec 2025 11:15:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] ffmpeg: fix a build race, hopefully for real
 this time
To: alex.kanavin@gmail.com, openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
References: <20251211191831.1596868-1-alex.kanavin@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251211191831.1596868-1-alex.kanavin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0128.eurprd07.prod.outlook.com
 (2603:10a6:802:16::15) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|VI0PR04MB10438:EE_
X-MS-Office365-Filtering-Correlation-Id: e8ecbec2-16de-471f-e654-08de3967bad1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|10070799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?V3VXdTBkUE9MeUszOGU4WFdMOC91aFBGd242bWJVaVduc1dhbnExemhwQWtj?=
 =?utf-8?B?bFFxNG16anpzY2t6MWhrR3d4Q2hyRlFqcS8zaVdpL1BhVEZUa0RWdld3UHJm?=
 =?utf-8?B?eDdIb2JPaElPV1N1Yk1LUGdMdm5HN2V0SCtleVBPUnpzYkpMaVZCOUxTdWV5?=
 =?utf-8?B?Z3hWd0ZFK2I1WWg2Y1hRTFVFY1ZBSWc5VXo4R3llNHJORU5MNDVGV1gxT3FF?=
 =?utf-8?B?VGJrbE9QNlVnZVZ5S2xJSG8vd1pPS3VIQ1ZrVFJYdVliQ015eVhjOWsyMlpM?=
 =?utf-8?B?bWRJc1V2ekdrV2s1Yytkejd2U1lsRHRRSkE3UHJZV08vM2RTTzY3SDJKRGFs?=
 =?utf-8?B?aFpCM05Bc3dmRml5cW9LdkYwbndtNUQ4S3hUKzliMTB3c2tRcnRMYXNZaFRD?=
 =?utf-8?B?NTZSTmFoN2I5dXVFN1pqMGNlN1FoR1RLajFnWjR2ZHlQZVZuRW5rdjZ2RHlG?=
 =?utf-8?B?aEZMZ0M0YU5JcjJzSXZIRFdJRlhzdEdKek1HNmFGREZvRHRqVGIxcWNVZVlD?=
 =?utf-8?B?Wk1yV08zUEFCR1dTMUNMNmdSSWR5MlRiaStkQXhvUlhGUTBDQkk0MUo5S2Fq?=
 =?utf-8?B?TW9YY2FuV292ZFEyQ3BVTUxMaW01THZxM2VaVTJvRHBYYVdoeDF5VW41aTAz?=
 =?utf-8?B?SkI4MWRMWGsxSFJVMlBSRnhuV0NyVlk3WXF2ZXVMR0NPNzdVRENPOEhhK3d2?=
 =?utf-8?B?UGF2NWJtNGlXd0xsS0tpK3pySUhZbmJSMHNENHFKRkhvRXdRa2xUZStoc04x?=
 =?utf-8?B?S1ozcVNvdllYZFNYVFpJVlV1SWtNMjhaQVhhMzZ6S1FickpTLzhOZkdBTTI3?=
 =?utf-8?B?NGVsbUxMTEx2OUNITlE1MzRlL2RKejV5UzJxUjAvd2pNWEQvNkd6TFpFSS9X?=
 =?utf-8?B?MHNHT1ZBSTFGNmVvMlZHc1QrVzk3Y21UVXVBS2IzQVQrWDEvWU9tZTh1SnZL?=
 =?utf-8?B?L3I5bFZyd3dwek4yRVhEWW5reHB3djZYeGJkaE9LYjNpQjVVL3E2VFRoZmpk?=
 =?utf-8?B?N3VjS2t2UElkK3MzelFPem1SYkYvY2xuVzROOUhjTkQ1MlZOOGhoSjNsc0dK?=
 =?utf-8?B?MjlUeHkzWWJsZ1dxd0FvY0traWNwVFhub2lJb0VHWFhaeWFoVlFTMmh2SkpD?=
 =?utf-8?B?Z2Q1YmFoc2lsNjU1dG1wZlJiK3VyYTNMdHNFS2dUUmFMOXUrZzREYXMydU5j?=
 =?utf-8?B?Z05rMzV4bmlyeG1wV25WQlhnVjE2MUVqRm45QTJkYk1MZC8wRTh6Y3YvVy9y?=
 =?utf-8?B?Mncya0d0aENTMUxEcTVVdWFYcXljYUN4WkVNTVNkeGwwbGY0RU0wOHg1NUZ6?=
 =?utf-8?B?NjIxL1lUVmpMYkFpWEpUZW5MOWZHaWdZT3RtMTVBOXdzc3J1NjR1NGFvWnl0?=
 =?utf-8?B?d2pQWWRnSzdweTVBTUhZeXIxQ0V1MUpOVEdYbGhmZ21MMVpoTWl6b1A3RmJY?=
 =?utf-8?B?eDhBd25yaW56Z1VhZXZGYkREQVBDOHBsWnBPRWtvWUpzUXl0b1pqcXBZUXFO?=
 =?utf-8?B?YkZqaFhiTHF6YmNJVzg3OXJ4NzJWMy9IbytteW12Y0ZLSGxTVGhmUldtVk5k?=
 =?utf-8?B?Sm9Gd2M2am1LMXFYWWFSVEdrMGY2TkZ6aGJlbFRuanIzakl6U1BQYTc0M01a?=
 =?utf-8?B?aVFPMk5tVjRRajZFeEgvT0E1NmlRZzZvZU1WSXd5NTI2a01WWUltK29xUjNq?=
 =?utf-8?B?eE1DM2VJaXhoZ1UwS1FlYTV5ZUxWeWltQzZJM09SV0tyR0ZjcE12dUlrSDV1?=
 =?utf-8?B?ZTNoTFBRU3VWWFdhOE92L0JSdUxVdnhVTnFPM0Q2dVkwTWNsV2grdlJKOEwy?=
 =?utf-8?B?QzRkQTNqRTZQV3d1Z0pObHpjRnpwNzMzSWE3aTB3K1h2bkphdk00SWozVmd3?=
 =?utf-8?B?bk9YMnhnUGpYejhmSVkrTC8xY1dyUno3M0ZPaXBPMEJHSmc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MU1BaFhrZmZ3UHdIKzhqbEZDVG1tY3VyNUlOUCtLd2U3SU1KRE1CdkJRSnQ2?=
 =?utf-8?B?NVFIU2RYMnJxMU05S2ZEZzkwVVZmMmd6WWpwdzBKellsMTJoK050STVhc1FU?=
 =?utf-8?B?VzlBMk9WSWRGY1M0a0JyeDBqbElKYWZpOSthNENHVWgvTjU4NnRTcG4vc3Jm?=
 =?utf-8?B?QWxYRU5LTDMwT1JmQnQ5ZjBMbXhsVGRGZjRFWmNSeTMwREdLL3ROeFRIQWdM?=
 =?utf-8?B?Wm5LdFNLQjZhTS9jS1NQZndGajVFMFQ5amRiaU11eGczc3RScTVGRVB5aU5r?=
 =?utf-8?B?VXN5ODFKUDdES0hTcjJQM005andjY0kvYlpsVDJGVkNla2VPU3dGMUJETkQ0?=
 =?utf-8?B?cmJGQzVSK0Z3ZHJZaDZ5bGRIb1pWVjdQL0VmUmtwSzBHQzU0ek43SzU4c291?=
 =?utf-8?B?VmppMGtsR0xJTHZpY2xQdElXSGdjcUM1MmRUd0podnZHSHBVYnRKWU50cEVt?=
 =?utf-8?B?S1BtY3U5UjRVbU8vdm9kTEQzL21pbU14MG1VeGNkL2o0REJnN1ZlQWdML2ZH?=
 =?utf-8?B?NFI2Q2VHRDFodkF3cGdnK1ZCQkpURjQvbnlzakpRWEZIbU52STdicGVCYVQ3?=
 =?utf-8?B?UytJWTdvaFpTZDM4TE9heHNNYTUrR09XSzVBWWpkRGMvb2VOQko1MDBlUzlj?=
 =?utf-8?B?MjYzOTVBbVpWMk45Y1RhMzArL3dmNGVBS3JPZVFNSjJrR2RnUVVKWGpPaFo0?=
 =?utf-8?B?SkFsNzlMWnYrWXFiOUpPZnNFejVwalBwS1FqOWFJMmNHMGdmeXErR1duc3J4?=
 =?utf-8?B?clJ4TFJHZEZPOEdhcmticWYvL0p2c3dmNUdXbGhTOHdTRlpJZ0VtWkVCTHh0?=
 =?utf-8?B?K3FhUmFQcXNXaUhqVjJnZ2dqeFU3aVVlL1F2MWtVbzMwRXUwbWdXd0REUzlK?=
 =?utf-8?B?b2RESFpDbWJWT0xZaEhLWmg1ZnBsaWU0bGpkb2h5OHFrQWMvS3dDQWhZbHJq?=
 =?utf-8?B?dk5WR0NPZ205UUp4NmNRQkNxRWJRQ2FJbjBTdldxdytYdjFyZktyamNMRlNN?=
 =?utf-8?B?dXI2cXJldlcrM3cxa0FWYlp0dW1mcjBkWmlIYU5vZGdyK2h6VmlXU0UwNTdw?=
 =?utf-8?B?QWsxekxaei90dUVWd3lvU3NZZ3drLy9MWVloL3NLV0pZR1JVelZseHhmZFJK?=
 =?utf-8?B?LzYwY0w5L05tWUI0dk1HSVMrQjcwSElialRVNGFnY2hLa1VabGtENDZVWjdW?=
 =?utf-8?B?OWJBRHdBSURaNnRidmROWE0xaXZXMDIvYWFRRzYvOFNZTWp6UmFuYld0Wkcv?=
 =?utf-8?B?WGFVcEs3QTViQ3JhR0lWK2Z1aC90bUs3a1R6L0NDR1pYc0V4Mi81UjdZdjZI?=
 =?utf-8?B?RDlLZFVzRCtQdENUaEcybGMxWUUvdFFLc2hSTVVkdWlLeGh1TU8zOU5sU1Ru?=
 =?utf-8?B?cS92eFpBbU40R1h6Y2JOMjJOMUlrYkEwcTU4Uno2dGxTYVZHSG5hVzlGUUtD?=
 =?utf-8?B?VWJFK2JmZ29ZeTNhaHAxTStQSHdoOTV6SW9QOSsvLzNoTkVHN3g2ckZCNEww?=
 =?utf-8?B?TjFZZVV6c2h6UWE0WSsrVHdiV3l1b3FNckxOZDZTdmxOL0F4aG9JOTZKZ1VP?=
 =?utf-8?B?ZFo3Y3N0RCtUbmhxRmtsLzVDZmUySDZ2VSthUVhPaEplT2ZXbWozZnh6ZUZ4?=
 =?utf-8?B?ejdUOXpCdjZMZmhtNFBsb3M4ZzZlc3dVM3MzUElYQnJPTmowRzBIek14clRl?=
 =?utf-8?B?VkZTM2FjUzU1dzVyR1IzeGQ0ZlA3RVZTN3hRQUlVYTV6TVIyNm1uamRDR295?=
 =?utf-8?B?MkNyWFJyTlh5Q1JQUHNrVW55dXY1ZDZsb0lXQmdUeitkTWFaUnU4RGFaZVN5?=
 =?utf-8?B?cmd6eUFZRWt5cUFyMjhFS2NXWjVTK3RrTzBRb2NkMys4ZlZkck11Nk43V0ls?=
 =?utf-8?B?UmRmTlBCZ2lJUUNHeWhzYk1LdVYyekU5QVEzVnIyN1FSQXg1OUU2enFaajhK?=
 =?utf-8?B?Zi93RnVLaThUeDBteCtEMnZBOEhJckV2L0RlRHMwcWZ0ZldOZ2dDaFdPaGl4?=
 =?utf-8?B?SWRsSXBERmxaTmd1eGt3T09pOWQ4OHZZY3pSQStGTEhSVEFlMFBiaDJ0ZHF6?=
 =?utf-8?B?OVZwdlJGemV0VEtHQzlFNWhBWGphajFZOEhtbk9CQ081NzJxRk1VTldKMDY1?=
 =?utf-8?B?Y08zRXRRcUJ2YWtjVGx3TE5PclN4YVpZbFkrdnlTenR5eEdKb3VTdkRXQnFT?=
 =?utf-8?Q?cV87WkE76fo00DDZqdk5lmI=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e8ecbec2-16de-471f-e654-08de3967bad1
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 10:18:01.2744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OdqBm3hPPGw97QbpIKLg2VMNu4nr9TV6O7qqOtOIABtMwh48u61r7mj+QuXf/6N0I1nrXFA2YOBheLUjmPcqZW+kV3A4HyGPtTrFCBe6IpY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10438
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 10:18:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227579

Hi Alex,

On 12/11/25 8:18 PM, Alexander Kanavin via lists.openembedded.org wrote:
[...]
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0002-ffbuild-common.mak-ensure-target-directories-are-cre.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0002-ffbuild-common.mak-ensure-target-directories-are-cre.patch
> new file mode 100644
> index 00000000000..a27e30f7104
> --- /dev/null
> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/0002-ffbuild-common.mak-ensure-target-directories-are-cre.patch
> @@ -0,0 +1,43 @@
> +From 6cd4855ea3dd62e6eb36c0796f8cd7bd4aaae05c Mon Sep 17 00:00:00 2001
> +From: Alexander Kanavin <alex@linutronix.de>
> +Date: Thu, 11 Dec 2025 19:55:46 +0100
> +Subject: [PATCH] ffbuild/common.mak: ensure target directories are created
> + before running shell redirects into them
> +
> +Otherwise, occasional build races have been observed:
> +https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/3001/steps/13/logs/stdio
> +
> +/bin/sh: 4: cannot create fftools/resources/graph.css.min: Directory nonexistent
> +mkdir -p fftools/graph
> +/bin/sh: 1: cannot create fftools/resources/graph.html.gz: Directory nonexistent
> +make: *** [/srv/pokybuild/.../ffmpeg-8.0.1/ffbuild/common.mak:165: fftools/resources/graph.html.gz] Error 2
> +make: *** Waiting for unfinished jobs....
> +make: *** [/srv/pokybuild/.../ffmpeg-8.0.1/ffbuild/common.mak:145: fftools/resources/graph.css.min] Error 2
> +
> +There's a separate rule for making those directories, but unfortunately
> +it's racing with the rules that expect the directories to exist. Rather
> +than add a Makefile dependency, I've injected the dir creation directly
> +in front of commands that can otherwise fail - a proper fix would probably
> +add the rule rather.
> +
> +Upstream-Status: Submitted [by email to ffmpeg-devel@ffmpeg.org,softworkz@hotmail.com,kasper93@gmail.com]

https://patchwork.ffmpeg.org/project/ffmpeg/patch/20251211191454.1595823-1-alex@linutronix.de/
or
https://lists.ffmpeg.org/archives/list/ffmpeg-devel@ffmpeg.org/thread/6QKXQGZKGDNDQXH2XO5IO4LAQKVHHWZG/

maybe?

Cheers,
Quentin

