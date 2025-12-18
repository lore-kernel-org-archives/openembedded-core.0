Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59325D68BE3
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 06:55:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36050.1766040949103962180
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 22:55:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=DpT0Ou/l;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=44473d6ac5=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI4Yw9l073503
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 22:55:48 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=2YO3SNFZZQmNoW4yPT3YbVGg0cw1VQWu6wfQoIfKpOw=; b=
	DpT0Ou/ll7oStwZzVWPsriecXw1NkG6JHOgKCeFkfXFdkzogZVR06/3PQ6+yBsX5
	sFh6F731+8/z2aZz/N0VE6O1Z3F8xQdoB7kaLgL7O/omBpAxK2iFuJ0LL99oi8X2
	30LprGkE0H9brAYWP51IiXl6U99eoIc+dzAAAqqXiVTee29zNreFuRlZAhnK8h4A
	BY6VZ6RrrmklAtNTK5wmRgzGKleNM0XvtfeAJWujrvXMCt63BP462/jDAOHFHmWM
	CA6KNNWm+L6NybuW3EzzbpadqCPUzm3px8oSICYcX9ANYsD2IS+1G6m4cO4WJs2L
	1aqbUf2PuiIgB3iWmi3fwg==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012037.outbound.protection.outlook.com [52.101.48.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b3k0shka9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 17 Dec 2025 22:55:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SibUcykXfZDpermqkkL0YpqUwKJPMJkhCweNsPk05uQ84g/bu8jf4A07OC2do2IMX8po28JqDOxv9/0aTjmJbLPi8HduqCx1oAulFlh3DrJf32rTcw2Vz55+TJsSn9obRCHBUZ/W0ubGFuJKX0zKVD0+wXqb/BEbFoKgYqb0MhlKWGymg/4b5a/4XkuKFZTgaf1o+CV8Mo1zMt6a4aK7ZFwSrZ7ctEcIrVVYBaawk+nPbesL25VXAPpqPGS5YaqAMFmguWtEKo8+3gvFAVlQlNNUsIL+JKebhkV1UceIE+Tdrvl8rjQy1ONU9wupJEMvtGyQuDKRQIPZLgJYwE73Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2YO3SNFZZQmNoW4yPT3YbVGg0cw1VQWu6wfQoIfKpOw=;
 b=JlBJwrdRjRb6+dfcFPs0kiR9pI84WnaPqWLJ9wSE1xG25wltXTuZeE6WSMEziD+9s0Fz8ouFF/wsy+m5iB9SlKFy/PTz61CabZZUB+97/+G2OmKAfXFfmkHHjASqP+qFY8+3nPuOqqvC6HeSg7SCXsbYxwgTqcJqc5ONe4Q0QYRKdrgMfswaVVJqKAy272iM9gyic2QqiMXB0plwOeo9kleuEF2ZUdweL/Z3+V3BBLI6pJS5gRcaulteO90Kx3jlAEIpl9klf4QC+Jf36s+jaZDm0thlY71VfdVtY2zcgeqOl0x/7am6tM94NB63+5zG6luItuJTR38+Hd25553YZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SJ2PR11MB8371.namprd11.prod.outlook.com (2603:10b6:a03:543::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 06:55:46 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 06:55:46 +0000
Message-ID: <a244dd70-8866-46a6-8e75-dcfe0c7734b5@windriver.com>
Date: Thu, 18 Dec 2025 14:55:41 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/3] kea: add volatile files to create runtime
 directory
To: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
References: <20251218033846.107161-1-yi.zhao@windriver.com>
 <CA+s=J=wnzeuiW3eNvKv4ADvp6-zg1+rhVxjrc_XQqYxxQ1Re3w@mail.gmail.com>
Content-Language: en-US
From: Yi Zhao <yi.zhao@windriver.com>
In-Reply-To: <CA+s=J=wnzeuiW3eNvKv4ADvp6-zg1+rhVxjrc_XQqYxxQ1Re3w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP286CA0121.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::14) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SJ2PR11MB8371:EE_
X-MS-Office365-Filtering-Correlation-Id: dd03a170-a2bc-4855-9a43-08de3e027819
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|4022899009|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dW1TbUI4L2hsR2hDTGRJUnBvbGJxdko3b3c5a2l3K0tkakQwY1BhY0E0TXgx?=
 =?utf-8?B?MHlaak13ckhNQlVyeWtRNXdqQlVrUHBhMFF3b3hGWlY4UHEzdGM3MUp2MXhh?=
 =?utf-8?B?eHNNNGlzcld5YjVTVmozNjNIdkEyU1NaMDRZanE1NVZoZVQ0UHMxK1V5cFRQ?=
 =?utf-8?B?WHg5OHgyZjZ3U1hBcHRUS1NNYVFGOW5kTE5VUXB3ejFpQytqM1NLeGUwcTNT?=
 =?utf-8?B?KytXSHR4cUFscHNWUUhJb2l5ekk2V3lkc3d6NnZHQ01SMzF4MG1rT2hqT1Va?=
 =?utf-8?B?N2NBMElGYkRmUS9wMzJqQjlVM25HdndzaUc3MW1DTlV6REJ6WTB5TWdIaGpi?=
 =?utf-8?B?Z0JCanFXZWZTcTlWblVFc2xqV0RFaUsvNi92UXRsa3JtZ1pBZ002NnM1T0hK?=
 =?utf-8?B?VFdyT0VZT3JmRmJGQ2pSeWhMbUpGb1hBNWhpbEt3MXVnbWxDVEtGNlMvd0Rn?=
 =?utf-8?B?SW5PWEszQjlKTGwzVmxGZHU4R1BiR04yK3VPZjA3ZXpVOFhpQ2xxelppWVJU?=
 =?utf-8?B?cjJnTU1hNmVQdExWWm1pc3h4RExicXY0c3k5RG9VNkhQbE5hL2tQWWEwUktv?=
 =?utf-8?B?a2NBVHpKdTV5ekIxR0o3Z1FlZGJ3bGxCcUxSRE1xRVJyUXZCUHUxQWdlMTJr?=
 =?utf-8?B?cVhmMGVhaG4xMVh3QThZa3pQL0VoQ0psb2NMeW5sZ0tjRlhYOGg2NzF0VkFR?=
 =?utf-8?B?WUN2QkRtd1FXQzhaeFVSUkhFMENadmRaVUZ5RGFQM2JnVW5ITTZoVlZRM1NG?=
 =?utf-8?B?bk0vYUU0M2RPcS9qWEJydzhLTmJ0YTNlQVNkTWFabjV1WitTT2RqQ1A1WTZ1?=
 =?utf-8?B?UWlObWFXVVdvZzAxMW9WT1BUTG9mY1dDdlY3Rzc1TktDN3llQ2VmekJERjd0?=
 =?utf-8?B?NGVQKzZoWWxQTlMxenB2UW1hL0RwTkRKdHRTM1Y2YzU1S2tpVlovU1lRTDhB?=
 =?utf-8?B?ZVBVWHUvUFJsWTRvRk5CWHRyNWhaemxqemt0RXhGMEZPaVlXcGIzR0htMnZ5?=
 =?utf-8?B?djNuK0FkaXE3Sm9zOCsxcDBvcGx5UEFOZ3lyR0NYWmlqREVxc3pKSnRIOE1X?=
 =?utf-8?B?ZDVjVXlMYm9kRTNhT1ZSZDJXRlY4YW1VTjlmRzB4R1JjN2I2ZTVrRElhSVQz?=
 =?utf-8?B?WUhOVWJTWTk4WmVnRlo0L1J4ai9rd2dzNFcyT2crYVR1dlVKcm9RK1FQSjIy?=
 =?utf-8?B?UE8wSDUvNkR0d3VmQjkxZHJsN1h3RUs5djhLNmFodUwyS1l2L2FhcjB6a3Zl?=
 =?utf-8?B?TkwxWm0xcThEcXZPZ2VoaDBXRGNiTHJXeWcrNDErTEhxVUlqN2tFN1RTVzEz?=
 =?utf-8?B?UjQvTWNvaGV1UWtGWDZlK0JEMFppT1huNWxNdDBSQm96NDlKSUhBRHRwNVdZ?=
 =?utf-8?B?elkxMjdEalNKSEI2NmN2L1RCMEMycmVrTXcrZVJDeGRocktJM3Y0MDF4RHRt?=
 =?utf-8?B?SG1BbVErQ0RBQzBMeE10WGEzMHptYk1QYzdGcVg0QU1mRFNpMUY2QUo4b3hl?=
 =?utf-8?B?UCs5dVlPZHpKTTZscmdhUWJxTkhpYytlQkprWmJaNHdOd2l1SmZHcExrd1lK?=
 =?utf-8?B?SFhlc29WUk5NR0s0b1l2bGNzVVRQQURlbE1xM1BNVFZmS2tZbHdhWnl3YTV6?=
 =?utf-8?B?RkFhVS9oM3FaVDE1ajkzbzNhSndUU0ZJcDZJdW1kVDk5d0ZrdGltbURFVmY2?=
 =?utf-8?B?NkgwWE0vV1hXZnZDZ0luQm9kZW43d1prSUJsWmJ2OTAzWDNRb3RMYWhMYXZW?=
 =?utf-8?B?cHM3WjFnV2paRUY0bE83Mjcyb0Zrb3BGNy91aXZ2UzZxY0pSd0ZCNFVLTDM3?=
 =?utf-8?B?MjRDT1hQVDFTcWpZckxhb1QrY3JBd1Q0cmtZTEVMamFjZUY1YWlSQVRRU1Jr?=
 =?utf-8?B?NTJWdEFZRHBOMWZDTy9UTVAwL2ZEOTNNTGtKbjYyeFdUZ3c9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(4022899009)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b25sK2ZLZUc0WjlOdjFxQmxKSnlSdzRoakdqTEtFMWF6TCt2bGg2bTU3MVZD?=
 =?utf-8?B?b2JmMTF2OGhjc2ttRzdwTHJlb1BtSTB5eW5OUVVOYmZvKythdityOXBpdmQ4?=
 =?utf-8?B?Uk1NRlhZUzVlOWswVzhQa0xrMnR3RHZ4OTIzZ0l4Z2k3U2RPb3gydXVacTN0?=
 =?utf-8?B?NjIva0NCc25PN05KRWVDMytJR1VTdFBPY2xrRE4rdnZrN0pVTm9Oei95bXQw?=
 =?utf-8?B?RHlYYkNPcEk1cDBFdTJNU3NoK2w2RndFVG5hNmM0TWJpU2xmT2Q2bTlWOXJW?=
 =?utf-8?B?RXJhUGRDVmFpRGFjUzZVNWIyeExhY05UMVVYTDcwU0Vvd2RQdmh3NEpHUC9Z?=
 =?utf-8?B?cU11ekVmbGJRNlNsalVMUS9RV0Rxa1NMakNDS1ZtWElwMmlwMVY2TE1XS2hO?=
 =?utf-8?B?WE5ReGx6anlHYzlYejRFTHljRW5KeTFqVk5lbmpsU0xNUUlZL1R0MFRSL2or?=
 =?utf-8?B?NnZWYVZpS2FYd0V5WmI4d05hUjdDVU1iQ0wvci82S0Nodkt1dlFnRUlFS3p2?=
 =?utf-8?B?YTVISUZzWHRDdGxNZkh2RGZocVZiRVFZVVFJRUFWOHp6a1BOUTdadTVSWm5J?=
 =?utf-8?B?bXU4RjRnZGs4RGtEQ3V3YTNvOHQzY3pOZUJGdzRMSzk2cjAzMUFTZUFlMHBt?=
 =?utf-8?B?aG1WWjYyV3NrbjJBMFpsenpMMWxHeUdxOXk5RXl5d25yUUMzekxkczZleUF2?=
 =?utf-8?B?UzBadzYyMzRIbHo3SkR3Ri91c2VXUkhBTjBkdzNYZi9HTHE0NXFEV0tZTDhs?=
 =?utf-8?B?ODFMTDhOM0pTZHlERUJjQnYwRldHU2dEdE9WcU1GalM1RGZyS25PbmZ0QXp3?=
 =?utf-8?B?OGVlZ0JIazcwZkwzaGxuNi81N05jRWMrZDRUNkpnMmFoSzdYdDNDdW1jV1BU?=
 =?utf-8?B?dEpncVNURHExTk55c0VwbnJsRGlzb0ZISWFNcmlQVWIrcGNkc2RMdGpEV0xB?=
 =?utf-8?B?SkFEVktpRWxTVGdyS2tFN2lRVHRPUFZORDlOeGdiVUVYTk56RVFMRzd2cG9w?=
 =?utf-8?B?YmEwQXN5OHd2VlY1MURGWlhVUTRKZmZxU1ZtUTFGTWM4NldrbHFrZWsyZDFj?=
 =?utf-8?B?eVZ4ZjdFbldvZUhrazZGNnF4Tk1tckI2MGUvSVIvcTVLbG1kczgxaWZwTGlM?=
 =?utf-8?B?S3U4WUhqa0dzQno4OHhiZW55LzhrM1ZYbVBCazQ5QTZJSnJZMkV0SUhJMk1a?=
 =?utf-8?B?WlRxbzArL3NFK2kzejBBUE50OHZrQmIyUzZBQ1RPZW82cDIrRmdFTlVzZ0M4?=
 =?utf-8?B?SzQ4emhIMHd6STFhOFAvRVN0aVIveUhXTko0bXZnVDJLclJWMk5TaTVEeWEx?=
 =?utf-8?B?T01oVVNaM2RtSHE0aUczZFFFZkpQUmhlZmtoUmVNY0NQYm01ZkRhUHIxNEhj?=
 =?utf-8?B?OE1kMGQzZ3k4OFpQU3d4Vmd0Ym5oVEJ6N08vRjhSdEpjeGJWR1d1V2Q1ZC9w?=
 =?utf-8?B?OWhYRFZ3Nk5JdFNNdUxuQ2pFb3dIZUJJZ3FoRnRLbk1BQlc1TnFIRERBRHIz?=
 =?utf-8?B?VGM2cXVseGUyTVF6cDNQRFk0cVdHTFlSem01UW9hTU9yejFpWjMyYVZEQ2lD?=
 =?utf-8?B?VjVqSUhuaXJuL2NYR1dwVXBibUl1aEZyWVdMTS9tZ25FS1FCSFV4NXhRSFdi?=
 =?utf-8?B?a1IxZ0JORlFnN002ZVQrYlp3bU5US3NoSktiUkRtQTJvb0ZNck1wdHhzb0lT?=
 =?utf-8?B?Q3RuQXVranNYREhyTXdqSTJoMVBveUlBVW50czNSZ1ZGSm9vUE5PYkpFSkk2?=
 =?utf-8?B?eG9pMjUvNk5SK3I2MGpaTE1uSHE2a3l1N3pGZlpxcE13WUQrcy9wbnpMK1FW?=
 =?utf-8?B?eTFpSjlHVFlGYkxHd3FjMFhUQWkxd2RCKy9RbXMxU0Q3RHh6ZE5KczJBTTIw?=
 =?utf-8?B?Q1ZXZ0VhTWVCSFhWWGhrVk55dEN1SVUyVndIRElzcHp1VWxhNnRtNkFZc2V5?=
 =?utf-8?B?WDZlZTlSTFBSdFJkNzFqYkJoeEt1eVNHWU90dVMxVUF4RjV3OUx6Rzdma21U?=
 =?utf-8?B?cnFTN0t3Z2duVnIwSWNNYk5EQ3FXb0sxUng1elJEeHk1OU9kYlhLdFFaN2d6?=
 =?utf-8?B?a05BQzlHN0MvZHhTMWx3N0FhYW53QU9ndzhPTWVmc3Q1eURoYis5NnAwZCtz?=
 =?utf-8?Q?Orr69Mbr43/jK1QhCKPtJ8zY4?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd03a170-a2bc-4855-9a43-08de3e027819
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 06:55:46.0207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6HcbtghE9ncnuChW3ZIYtM1uywBYoPV7gbYdqQey9VihdWFoulica003cF6RvZlPAXYL+Knxo4brF6lNpZFnOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8371
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: QM6f-UOEiM5u654Hrp5iQX1YYveQIUA2
X-Proofpoint-ORIG-GUID: HrbGbURfxLQ3a9jOrzH3iiX787bhmum6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA1NCBTYWx0ZWRfX62xp8pi61EDZ
 gUiKM7wrQf29XZggJ+X+1u3zGDh0yDF5Eun4LohIGP1N/OGfPpOEBsHUSy8nx6Csnexvmr+Wttb
 HBYNh1EuZsyvWYqaO70uwqAMsWtDVHLZ2stYx14kdZCsOK6B623TwWJPaCSvTdpC4e41EiugZfH
 emmfnCK1Vh3hEdYHaZL9T8ylnuWn6XwDNR5Yv8Dm74l//veCACsqVrKLhPbT5cuTGCbvuurYWSl
 1O7cfx9rflCqk9Tb8MLdwN2mpWqqjfzSy7SVEpU+UoSzofy9wldslfbfqI6Fa9Ru/4XbxwKozhr
 tbHjW7c1H1JkG8WCEVJGRps0rY5cyvr28llNp32xCioriRMNQ85ZVhIy3SQuwnfu3CfCnJFoHCe
 2XDjxCG6lKLKHJBvbmX+s1M9KXAkOw==
X-Authority-Analysis: v=2.4 cv=PqeergM3 c=1 sm=1 tr=0 ts=6943a574 cx=c_pps
 a=uCbPN9sl+YgD9yJogSPUSw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8 a=SCo1hh1FAAAA:8 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=EUspDBNiAAAA:8 a=gjGLemD9W3zWx33ZoPEA:9
 a=pJAmF1FKerIFfj4g:21 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=yG98XkLpjRIA:10
 a=-pDjxN4xWycA:10 a=Vxmtnl_E_bksehYqCbjh:22 a=nwb-CePKZZm3gL-ai9HY:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 spamscore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512180054
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5BI4Yw9l073503
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 06:55:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228089


On 12/18/25 12:21, Anuj Mittal wrote:
> On Thu, Dec 18, 2025 at 11:39=E2=80=AFAM Yi Zhao via lists.openembedded=
.org
> <yi.zhao=3Deng.windriver.com@lists.openembedded.org> wrote:
>> Use volatile files to create runtime directories, instead of creating
>> them in systemd unit/initscript files.
>>
>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> ---
>>   .../kea/files/kea-dhcp-ddns.service           |  2 -
>>   .../kea/files/kea-dhcp4.service               |  3 --
>>   .../kea/files/kea-dhcp6.service               |  3 --
>>   .../kea/files/kea.tmpfiles                    |  2 +
>>   .../kea/files/kea.volatiles                   |  2 +
>>   meta/recipes-connectivity/kea/kea_3.0.1.bb    | 43 +++++++++++++----=
--
>>   6 files changed, 34 insertions(+), 21 deletions(-)
>>   create mode 100644 meta/recipes-connectivity/kea/files/kea.tmpfiles
>>   create mode 100644 meta/recipes-connectivity/kea/files/kea.volatiles
>>
>> diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service=
 b/meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service
>> index aec6446f0e..fe09ef6437 100644
>> --- a/meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service
>> +++ b/meta/recipes-connectivity/kea/files/kea-dhcp-ddns.service
>> @@ -5,8 +5,6 @@ After=3Dnetwork-online.target
>>   After=3Dtime-sync.target
>>
>>   [Service]
>> -ExecStartPre=3D@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/run/kea/
>> -ExecStartPre=3D@BASE_BINDIR@/chmod 750 @LOCALSTATEDIR@/run/kea/
>>   ExecStart=3D@SBINDIR@/kea-dhcp-ddns -c @SYSCONFDIR@/kea/kea-dhcp-ddn=
s.conf
>>
>>   [Install]
>> diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp4.service b/m=
eta/recipes-connectivity/kea/files/kea-dhcp4.service
>> index a2ed4edb59..a48a230654 100644
>> --- a/meta/recipes-connectivity/kea/files/kea-dhcp4.service
>> +++ b/meta/recipes-connectivity/kea/files/kea-dhcp4.service
>> @@ -5,9 +5,6 @@ After=3Dnetwork-online.target
>>   After=3Dtime-sync.target
>>
>>   [Service]
>> -ExecStartPre=3D@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/run/kea/
>> -ExecStartPre=3D@BASE_BINDIR@/chmod 750 @LOCALSTATEDIR@/run/kea/
>> -ExecStartPre=3D@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/lib/kea
>>   ExecStart=3D@SBINDIR@/kea-dhcp4 -c @SYSCONFDIR@/kea/kea-dhcp4.conf
>>
>>   [Install]
>> diff --git a/meta/recipes-connectivity/kea/files/kea-dhcp6.service b/m=
eta/recipes-connectivity/kea/files/kea-dhcp6.service
>> index ed6e017d0c..a441df9ad2 100644
>> --- a/meta/recipes-connectivity/kea/files/kea-dhcp6.service
>> +++ b/meta/recipes-connectivity/kea/files/kea-dhcp6.service
>> @@ -5,9 +5,6 @@ After=3Dnetwork-online.target
>>   After=3Dtime-sync.target
>>
>>   [Service]
>> -ExecStartPre=3D@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/run/kea/
>> -ExecStartPre=3D@BASE_BINDIR@/chmod 750 @LOCALSTATEDIR@/run/kea/
>> -ExecStartPre=3D@BASE_BINDIR@/mkdir -p @LOCALSTATEDIR@/lib/kea
>>   ExecStart=3D@SBINDIR@/kea-dhcp6 -c @SYSCONFDIR@/kea/kea-dhcp6.conf
>>
>>   [Install]
>> diff --git a/meta/recipes-connectivity/kea/files/kea.tmpfiles b/meta/r=
ecipes-connectivity/kea/files/kea.tmpfiles
>> new file mode 100644
>> index 0000000000..5da74be3a6
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/kea/files/kea.tmpfiles
>> @@ -0,0 +1,2 @@
>> +d /run/kea 0750 root root -
>> +d /var/lib/kea 0644 root root -
> I think it'd be better if we add StateDirectory and RuntimeDirectory
> to the service file if the lifetime of directory is tied to the unit:
> https://www.freedesktop.org/software/systemd/man/latest/systemd.exec.ht=
ml#RuntimeDirectory=3D
>
> Debian also does something similar.

Thanks. I will try this.


//Yi

>
>> diff --git a/meta/recipes-connectivity/kea/files/kea.volatiles b/meta/=
recipes-connectivity/kea/files/kea.volatiles
>> new file mode 100644
>> index 0000000000..d0350e38a6
>> --- /dev/null
>> +++ b/meta/recipes-connectivity/kea/files/kea.volatiles
>> @@ -0,0 +1,2 @@
>> +d root root 0750 /var/run/kea none
>> +d root root 0644 /var/lib/kea none
>> diff --git a/meta/recipes-connectivity/kea/kea_3.0.1.bb b/meta/recipes=
-connectivity/kea/kea_3.0.1.bb
>> index 8729b1162e..5c46498d5b 100644
>> --- a/meta/recipes-connectivity/kea/kea_3.0.1.bb
>> +++ b/meta/recipes-connectivity/kea/kea_3.0.1.bb
>> @@ -14,6 +14,8 @@ SRC_URI =3D "http://ftp.isc.org/isc/kea/${PV}/${BP}.=
tar.xz \
>>              file://kea-dhcp4-server \
>>              file://kea-dhcp6-server \
>>              file://kea-dhcp-ddns-server \
>> +           file://kea.volatiles \
>> +           file://kea.tmpfiles \
>>              file://fix-multilib-conflict.patch \
>>              file://fix_pid_keactrl.patch \
>>              file://0001-src-lib-log-logger_unittest_support.cc-do-not=
-write-.patch \
>> @@ -61,26 +63,41 @@ do_compile:prepend:class-target() {
>>   }
>>
>>   do_install:append() {
>> -    install -d ${D}${sysconfdir}/init.d
>> -    install -d ${D}${systemd_system_unitdir}
>> -
>> -    install -m 0644 ${UNPACKDIR}/kea-dhcp*service ${D}${systemd_syste=
m_unitdir}
>> -    install -m 0755 ${UNPACKDIR}/kea-*-server ${D}${sysconfdir}/init.=
d
>> -    sed -i -e 's,@SBINDIR@,${sbindir},g' -e 's,@BASE_BINDIR@,${base_b=
indir},g' \
>> -           -e 's,@LOCALSTATEDIR@,${localstatedir},g' -e 's,@SYSCONFDI=
R@,${sysconfdir},g' \
>> -           ${D}${systemd_system_unitdir}/kea-dhcp*service ${D}${sbind=
ir}/keactrl
>> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'f=
alse', d)}; then
>> +        install -d ${D}${sysconfdir}/init.d
>> +        install -d ${D}/${sysconfdir}/default/volatiles
>> +
>> +        install -m 0755 ${UNPACKDIR}/kea-*-server ${D}${sysconfdir}/i=
nit.d
>> +        install -m 0644 ${UNPACKDIR}/kea.volatiles ${D}/${sysconfdir}=
/default/volatiles/99_kea
>> +    fi
>> +
>> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'fa=
lse', d)}; then
>> +        install -d ${D}${systemd_system_unitdir}
>> +        install -d ${D}${sysconfdir}/tmpfiles.d
>> +
>> +        install -m 0644 ${UNPACKDIR}/kea-dhcp*service ${D}${systemd_s=
ystem_unitdir}
>> +        install -m 0644 ${UNPACKDIR}/kea.tmpfiles ${D}/${sysconfdir}/=
tmpfiles.d/kea.conf
>> +
>> +        sed -i -e 's,@SBINDIR@,${sbindir},g' -e 's,@BASE_BINDIR@,${ba=
se_bindir},g' \
>> +            -e 's,@LOCALSTATEDIR@,${localstatedir},g' -e 's,@SYSCONFD=
IR@,${sysconfdir},g' \
>> +            ${D}${systemd_system_unitdir}/kea-dhcp*service
>> +    fi
>> +
>>       sed -i -e "s:${B}:@abs_top_builddir_placeholder@:g" \
>>              -e "s:${S}:@abs_top_srcdir_placeholder@:g" \
>>              ${D}${sbindir}/kea-admin
>> +
>>       rm -rf ${D}${datadir}/${BPN}/meson-info
>>       rm -rf ${D}${runtimedir}
>> +    rm -rf ${D}${localstatedir}
>>   }
>>
>> -do_install:append() {
>> -    rm -rf "${D}${localstatedir}"
>> -}
>> -
>> -CONFFILES:${PN} =3D "${sysconfdir}/kea/keactrl.conf"
>> +CONFFILES:${PN} =3D "${sysconfdir}/kea/keactrl.conf \
>> +                   ${sysconfdir}/kea/kea-ctrl-agent.conf \
>> +                   ${sysconfdir}/kea/kea-dhcp-ddns.conf \
>> +                   ${sysconfdir}/kea/kea-dhcp4.conf \
>> +                   ${sysconfdir}/kea/kea-dhcp6.conf \
>> +                  "
>>
>>   PACKAGES =3D+ "${PN}-python"
>>   FILES:${PN}-python =3D "${nonarch_libdir}/python*/site-packages/*"
>> --
>> 2.34.1
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#228085): https://lists.openembedded.org/g/openembe=
dded-core/message/228085
>> Mute This Topic: https://lists.openembedded.org/mt/116837599/3616702
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[anuj.mittal@oss.qualcomm.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

