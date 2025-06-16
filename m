Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69A1DC71157
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 02:11:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.21429.1750039873857347918
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 19:11:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8262abcf9c=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G1pXjM015866
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 19:11:13 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4794c3s6ru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 19:11:12 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55G2BCR7011180;
	Sun, 15 Jun 2025 19:11:12 -0700
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04on2040.outbound.protection.outlook.com [40.107.101.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4794c3s6rt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Jun 2025 19:11:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t7QLA5S5d6hdrAsnLfSOmi6nSEFmbX4geSveLFPe2He01cbo+/kGfGt/G/A6fwmHo0Czh0Q86moYWuT2x7Ope179Tq3Au7XYqc7/S4PfyNxqrNkQagsaKS3ruFWsnqFyeG4c0q2FeSGORaMCVp21qUCA4lWLaPZ5GHn/cKr9RRPMfew+ZrcP3o6/Esjdbx+Xn4w8r8EBA4Q9+7lHvF8d139abkPKRcylSPrBk+KVLCMZNbPsGS7WctjcQglqdjJuVcaSLC6eUsajruz/rF1aV0LuFcJ54bI3t+2YwvC2XW9YC2voWzppIb9viW2om3IUEEk+RV+cY8WGvCyD4XbtcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H9CvGuXRt4nEX50psnrB6+FInxePcFX9TixLpXorK14=;
 b=W0Vz1JX/hGr8xe37SH5B1l1QJgSoTDD7jPPak0Ot3H08w4YNguuZgIkaCcphSjSvSMiNpnv3keSyFJKuPg9i5qNXo3r8oQXhJZ8wu4Y0Z6Jorgy/tKyKFuhEJXad1u62iW6gDjQnX0IUQyC9GZecVUej2ZOxOrn0duRAy/rekti104ZWZOOtnOJI3BNowFSds9O7AVr7tHKo+1TAVTYKK08uuaEZfZYOji1/IJyM/xgvNOSwc8/drasTsIQaA2fQ0Ncans97XB2kZ2ofE3yaYHR5hgCFYPestg32Q/3v3dozEDLdS3ccgTICQVdHkEiYlxZjmhFkHEq2xrWIgwxKcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MW3PR11MB4729.namprd11.prod.outlook.com (2603:10b6:303:5d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 02:11:09 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 02:11:09 +0000
Message-ID: <0a6f27f1-a929-497b-b656-86116eb3aa13@windriver.com>
Date: Mon, 16 Jun 2025 10:10:56 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] systemd: Rename systemd_v255.21 to
 systemd_255.21
To: setairidis@gmail.com, openembedded-core@lists.openembedded.org
References: <20250614203340.11007-1-setairidis@gmail.com>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <20250614203340.11007-1-setairidis@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0205.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e9::12) To SJ0PR11MB5613.namprd11.prod.outlook.com
 (2603:10b6:a03:3ab::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|MW3PR11MB4729:EE_
X-MS-Office365-Filtering-Correlation-Id: 557d5454-b4cc-4e9e-e2e3-08ddac7b0e81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|4022899009|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?M1Y0NjNNQ1ZpRGs4YWdzZHpPUURsc1hhVmVHZVVoYTZMSk9uNjRYUGltTjFp?=
 =?utf-8?B?MDljeEdCUHZnTGtlVmltOWNSY2pBSnE1MnpyVWcySU9FNE9icU1icnF0T3JL?=
 =?utf-8?B?NDg2bFNQa0ZoWmRWc0t4TXZvT2FkOU1OZ2xKTWM5eWZ6RS9MYkozcENHaTE1?=
 =?utf-8?B?MCt1b01mM3VhQVRvSG9DRmxtNmt4WlYvdGF6aWVGVTVDRDFGRG5vektZR2R6?=
 =?utf-8?B?M05sU0Nyc2xDbjNNcTZEbzBtQ0pYWXdxM2NQcy82VmVyUFJSNGtjQy92ZnBV?=
 =?utf-8?B?UWJkdmd3Z3BVSEFsdVk1YUs1ZG1Gb2IyaDBKV2JuWTh6aDM2V1BHaDBid3pG?=
 =?utf-8?B?UkcwV0F2R1cycWxGT3NrT084M04yeUpSSVh2UFFiZ2lEbS9OYSsycWNQbHBv?=
 =?utf-8?B?MHBzVkNKRmpWQ2l4cGY1VVVkbENCbGxrRzFDRUJ6R0hEa2xBZXBzVWxmVEo4?=
 =?utf-8?B?Q0VnZkxWOXJ3KzlBUGF6T2dsSzVuRllIbW9nbDgrYWtHclhsT2c4RFI1bVlO?=
 =?utf-8?B?VHc1TVUwUUlYUTd0RkZsSUppVDBuR2dlQTJWbXFTQXJCS3E0d2NBMHlOK0Zi?=
 =?utf-8?B?akNsaGFpN1hiRjV5d3RWSFJOQTRhOVhSZnhtQjlqWUg5QzhFeGVKVDlwWVpH?=
 =?utf-8?B?WHJQbXRyZ0VvUHRSRHVtQ0s1WVpScnVHRGFhcGoxbXF0dktlczdhTjZ4L09P?=
 =?utf-8?B?UWNtNTVHcnlSdGtaZEJWQ3Z4czNOc21VdG1VVlB5Nm9oTzJrejgzejB0dHFt?=
 =?utf-8?B?Q0VBSm5aU0pJTXRLUVZSRGtNbHR4d0FRTWJOSm1vb0lSK3pEWmVSS1ZMSmJI?=
 =?utf-8?B?NlplUmFmVGVnRG93d2t5RnV4L3JQdHY2MFdPOW5nLzRlcDNOTDlUdDlKN1hZ?=
 =?utf-8?B?VW03OXY4cEN4TjVDaHFzUjFZMUhuTGtKZDl6anNZeGdZZXFndithUEY2R0c0?=
 =?utf-8?B?Nkx5anMrTHJKYWMyOG10UHNUNGkxT0liamw2N2Q1Y1JNVHlScUp2V0Y3cFJ1?=
 =?utf-8?B?cmpqUk8zdENaZEhUMjJWQXN4UnYwbVlreHRndExnYlpRb2NJM0VKOVR4Um9o?=
 =?utf-8?B?OVRZR3d2MVlxbzJmSld4T1R2QzFCbGZOdTczdCswYkgyb3lMcDVxM014Z0FI?=
 =?utf-8?B?SUNUcytzbDFGSjMrdnNzSTlxYnE5VDlWcU9rTkcvZDZSeGNia2FVb2h5RVMw?=
 =?utf-8?B?Ny9WM1UxRnhiczRJY0o5T2VGU3JsYnNVUWs2U3ZQMm0zQzBVa3MyNnF3ZWxy?=
 =?utf-8?B?NjJINms2VXpGNnNRbVA2N2RMdGJwL2JqenRhNGhCdEprUythNmdwVGhQZ3J4?=
 =?utf-8?B?MVVBTnREUCtaOGIxQ0xpSEZwMzhXY0ZvZkY5dXZTQXVvc2VMWHEzUzUzVVlP?=
 =?utf-8?B?UWdwOWJqU3EzOVc4U0RjOTN6UHY1S0VtOUFjMXlkVVhNMkIyNm9VcEFoaExo?=
 =?utf-8?B?NW9VVGpkN3hsMllCU3pNUzBJQWlyZ2ZpWlVJYk1zQm9kSFJTcDNuelRUUTIv?=
 =?utf-8?B?Q3NMdkx3ODJTY3grU0t3UHNOL0xhZTJ2VGF3d2w1TXAwVjZNeWpjOVlKMVlr?=
 =?utf-8?B?ZmQrWUw0YmhoYi9sQzBuMVdLYytMYm5salhVZnFsK1VYS0JJb3JzRmhmemgz?=
 =?utf-8?B?YWxKdmxqRVJMZDh5NnBnbjlBbjVpMkhnRU0wWFZTRC9KTWppK2RNTlY4UmxJ?=
 =?utf-8?B?QWZ5WnNyV0h0NmlZNllCNVZIVTdOaDNGTVJvQ0FDalljSE0xQS9LTndramls?=
 =?utf-8?B?dXFCT3pWeHRsTDZGb3FyeXBKQXNmYzJZNHFNMC96eFRxOUxUTXpTMlR5S2Jt?=
 =?utf-8?B?ZUhlRWVTQXcybHNJREo0NWZXUmNsUzV1VU83OXR6U09aV0laZS94Y2NXZ2Jj?=
 =?utf-8?B?VU1ZZTJWN2RTc0p4NFA4eE1Sc015WEszaEFDYmVKQk5pU2tpSUk5TkRPSXBj?=
 =?utf-8?Q?K7SuUswjsDY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(4022899009)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YllHZ3pPYWd2UEhNaU5hMDZRaTRwSFBOMTFMTEJmeDF6aFZpcjkwa1NOdzBm?=
 =?utf-8?B?SnU3cmdsV3lrZWFTVWtibjFrUy82OENiRWphQ0RpRDVoUFo2VEVtTEtBb3hh?=
 =?utf-8?B?d3R3MEp4Qms1YStiTUlGRFdFNzlIZFh3MW42Q0J2VFo4bGw1M29OYXFIV0Rr?=
 =?utf-8?B?V3JweWtlR1JmOGkwSk5ScGhpL1lrWU41cVFHWUNkMzkxV1A0dnVGaS9RQmkz?=
 =?utf-8?B?WVhSR3lCSHJqSDZwKzVWcjJJQnA1Mk1hUFUxWng3NnpEdEI5YVQ2T3I1TVpt?=
 =?utf-8?B?MzM3UCtCODlKMGJJR3UybmFiTTFqbTlHNlpBaEVRb3dHaUpkMjc5ZGNVTzVF?=
 =?utf-8?B?YmtMRFMzc0c2Vld0WXRrUEM5SGFjQ1VVLzZYZW9naUtOQWx5d2dKVEoxZHBB?=
 =?utf-8?B?MkhiMVJvYXFsaG5rbURzNzJBNTk3RkNZWnN5RFZzOUIzNjg4aUZaUDdjTkZE?=
 =?utf-8?B?SU9DS0RqbnhIT0dONnBuT2g1R2h2dnJORUphMnNXUVV3YStQLzFiWUZ1eVZS?=
 =?utf-8?B?ZEg1TExDcEEyUEFDME1jR2VPNVcwZ281L3VTY3dId0NzZ2VlZmpDNnd3ejNT?=
 =?utf-8?B?NnEwd0c4QjNYRnh4Y1FCWldTeko4N3Fiemlxckh5azBHRFRNWG83WmpyaGcx?=
 =?utf-8?B?K0VpNE14NXdTSEFVUVcyOGIrbk56dVcxTmVhSVVONW1oQWdjaUs5ZWNURllj?=
 =?utf-8?B?MG0xOUk1NDhUNEllMmJqZExyRXFRcFFHTVBtb21yY056WXZtbEdKK2NyNy93?=
 =?utf-8?B?dndVQVpYUEZDOFpIdmdONWgvR2U5UzdHZ3ZCTm5vY2ZtTzYrc0swYTRJeEVL?=
 =?utf-8?B?WDlMYTUvdFRBWXVSdzFMb1hjOXFUQ2lxOXhjMzZscU4weHltQ1RCRW9CWGFP?=
 =?utf-8?B?R3NWM053UWhLakFDd1F4V1JGUmNZakdKRXJyTTRYenUzeDNUVTJUNWNHMCs1?=
 =?utf-8?B?WG9Zc09oazJFS0w5dVkySWc0cG8zVEkxZjJra092YnVHUTAzZlZyNGZlTzMz?=
 =?utf-8?B?QllWOWRxeStuUmQyUXJmZVAyMEgrVWhBSThvL3k5VlA5aUgxSjlRN0YyN1NN?=
 =?utf-8?B?UVZNN2hqOG9vZmw5a3h2NDloSEFTZitiR2FVcFRSNk4vWHVjQ0MxYnU0dkVx?=
 =?utf-8?B?dmlYVXJrRE9PNHVTcHNsS1BlL2RFSFkrWTg2ZjhPMWZHLzZYL05RSjB3QVJJ?=
 =?utf-8?B?N204R0hIUnJlcFMzdm84aHNWMUprTUsrM3hOcVZIS3ZHRlpxalUrOVdUNm1v?=
 =?utf-8?B?clVnK05wTDJ1ZE13RVFHV2JZTlZqV0hPZHNhVzh4UmxNVVVpR291QStpME92?=
 =?utf-8?B?VkZSOXpaRDdmL2tZS1FtTlRjOS9VckIvR1I4ZGphZDRTeUhTdXFHQktDRXVU?=
 =?utf-8?B?a1RQSDBDZlgyNnh0ZXhHbHBUUmVGb2dpeWRyd3lYNGZhZzZOSFBwSVJnM2hE?=
 =?utf-8?B?UjNuT1RRaC9jS3Z2Sjlpb0x2bmFZVHFtejlkUWZmMVhyRDc5ZlhjNzJUNzRr?=
 =?utf-8?B?RGx3a05weFBZQWpQYUt0TmxXbFdBR2dDN1VrYmpXbmlBVHkzQmNQUHcwNzhh?=
 =?utf-8?B?SzhkOXVkWldmZnNKZDJlZ2J5ZWtiWlY0VDhObS9lT09XUnlMVWF6MEE4NXR4?=
 =?utf-8?B?TjkwcUVqcmJ5eWNpVFUwVEdTRjY1RkIrS0RHaXMxZDdpSGwxSlhleDJlSTgv?=
 =?utf-8?B?QVh2K09kSDEyWFZPTTJuTGtUYTBjZDVxNXg5MmY1TDBRa3VhbjJRaEhDQm14?=
 =?utf-8?B?U0swd0VHVEtaQU9BZlFxVk50Y3JMUW8zd0tEYjlLbzI1VEs5V2xFWFkxK1Zo?=
 =?utf-8?B?bXMzT3ZkQkxNREoxbStnMEdVMHYvOVFaQk5UZTE4djB3MloxQVA3cGJiNStY?=
 =?utf-8?B?N0JVdDNVbkt1ZkM4MHRuZllrOTBjblZORXpubVFEYm1DWDVuM3B1Wkt5MTdX?=
 =?utf-8?B?VWNKd09wVmJjbHRlNEJVekYwaWpUaTB2Q1I1eUlGWTFZOThVREdhbURTV2J5?=
 =?utf-8?B?bUd6dTh6NWJXNGJKYktDR25hVnBjd0JIdFlOTkxLdnJyd2p2UFM5ZDBpTFli?=
 =?utf-8?B?UGRJbDFqcG1FMHVBRGVISmh4Wk9oeWtYTGVwcitUTTl4U3ZyTC9NQjRCL3Zt?=
 =?utf-8?Q?riOb26UXQj/6wSQZW/1IPgU1B?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 557d5454-b4cc-4e9e-e2e3-08ddac7b0e81
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5613.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 02:11:09.0841
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +zoMUWfUaJuv4UJWlw9lzOHJ/NOgpW/3JxNPQtMBELKU33+s4tyThbCRuNHaI7M4a/4ZtFkrBUba8wQ5nKgu4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4729
X-Proofpoint-ORIG-GUID: rJuphb28jTaZ1O-sigqXz10lB-547wGp
X-Authority-Analysis: v=2.4 cv=b9Gy4sGx c=1 sm=1 tr=0 ts=684f7d40 cx=c_pps a=HwQxhNBrPQT7WYJk5THhog==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=Q4-j1AaZAAAA:8 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=NQoRdMyGS-cB3iXOsFYA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: hDWMc_98qn7akIxXgKXV0-G1W7MWRVAM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDAxNCBTYWx0ZWRfX8oSBFEopQWM7 TCA2rbaF20cZ35Z77f11Bzd31i6UVh7bJk4Swc7/uqXTCkY56Gs9UHYm1ePvZqiZ5RDn0ecsqWN ayF6ib1KdEQs1YduAhBrP69uvraa+w1bBmJG6/QHK4CvqfNqmoMzL+XuPBF5AKwhDROhTbI/8QZ
 qWavJjuOIQJlLm91j4DYs0yywDkJplXe2zcbtNthayoxu/RifiVNQaT4w9iu1/kZdj1WlxyvgDU z0uN3m9e3+PRWYcCQmdDllkcmlwZ7ICADBphWGI0LnsgRculGcIwOnKSR/QhbngC7YdtT/vTPzy 5/ovG0USnuKYKhF4W9yZixSHhZzH6K3MU6DZQ5jcdK4nZTDPpTZAduSU3AHleSNXz4AfbcLR0uF
 M3U8cgzIijuhn0ZwGjlDJZOaDThVjltyjJSr5sZqbeNVfcXLuVbIg+gsC6G74FJPSjrzs4/T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-15_10,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2505280000 definitions=main-2506160014
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 02:11:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218752

I don't think bumping PE is good. Just correct the version. Otherwise, 
you'll need to send a pure PE bumping patch to oe-core master.

Regards,
Qi

On 6/15/25 04:33, Savvas Etairidis via lists.openembedded.org wrote:
> Pumped PE property to two, since this is not a version bump
> but a rename. The recipe was accidentally renamed with a 'v'
> prefix in 29e623b2ad00555788412fa520fbb9ffec794cbb.
>
> Signed-off-by: Savvas Etairidis <setairidis@gmail.com>
> ---
>   .../systemd/{systemd_v255.21.bb => systemd_255.21.bb}           | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta/recipes-core/systemd/{systemd_v255.21.bb => systemd_255.21.bb} (99%)
>
> diff --git a/meta/recipes-core/systemd/systemd_v255.21.bb b/meta/recipes-core/systemd/systemd_255.21.bb
> similarity index 99%
> rename from meta/recipes-core/systemd/systemd_v255.21.bb
> rename to meta/recipes-core/systemd/systemd_255.21.bb
> index bb9dc3da33..aee677bc87 100644
> --- a/meta/recipes-core/systemd/systemd_v255.21.bb
> +++ b/meta/recipes-core/systemd/systemd_255.21.bb
> @@ -2,7 +2,7 @@ require systemd.inc
>   
>   PROVIDES = "udev"
>   
> -PE = "1"
> +PE = "2"
>   
>   DEPENDS = "gperf-native libcap util-linux python3-jinja2-native"
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#218642): https://lists.openembedded.org/g/openembedded-core/message/218642
> Mute This Topic: https://lists.openembedded.org/mt/113646285/7304865
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Qi.Chen@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


