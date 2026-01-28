Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37011D3F091
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 16:31:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1614.1769617904404705882
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jan 2026 08:31:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=LKOj59a/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6488a919d0=randy.macleod@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SB1ShI3431226
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 08:31:43 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=t52lrthvoTwbajSu2WrJkq
	/WJcEZEKGH8/tckmDAZ/A=; b=LKOj59a/yNEctq8ddyDY6WR176k9HubtKQ0MoI
	9Uk/Wiznnp/5aIAyKmo/Iq6dyulMdXLUkwBIPY3qkZM6fdSZGROPW0Lj1vzloxN3
	y7lF0nQ4UDrKAtwMWA/VDGl9S+V5Bi7+oQbQT5wXn8g5VlO2vNf8fZvXa2zdmeXo
	1FYmErPZHdXhZND5uxAdtguLCT9kHPRahawDDqGVrB1LdfKszgcDmXPyHsNplSeg
	lw+w8nMlTrrBPvnJnRJ2owJY+1wC/CKLqDWyZNFwDQwGTbrUBa09e7boFCzT0Vw1
	+9566xhjxsigwg5kDvayXWer/PeRDjiAgeQIjD1b6zP64FRw==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013063.outbound.protection.outlook.com [40.93.196.63])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bvt85d7fy-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 28 Jan 2026 08:31:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l1CIs0vLvIpYYGJUKRfck4wV0xbOSqeC/WWFRUyFkrLavHGHgsV7BtSjVz7vOuRGwFqny0lLGciNWbNBtq3Vh86UqQC769Gk59TZ6IlGVcWTcnfEEmYzgE1BdPHV5RJonkTfpZsF4BmUcVEbTVhNdYP8t+XbJ7aZyLbo280fFJZjbOT/QmnaZoI2arrbVecuR8JTt9jrfSFg89MBNFCzqoQd5sery5mvMDqadDIe6AuvUk7Aqq0bu+GnXgMmmJi6JfY5TRTqrXSpL0vWPbgetoz7gsaEAjV9cexR4eG1d2vt5g6U3iIkLS48QAZK+oyD17UTMRQwBq+RVnljHl5RoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t52lrthvoTwbajSu2WrJkq/WJcEZEKGH8/tckmDAZ/A=;
 b=mVG8mT+T50vSjcy1SSqyjpOnpVO66lEDthMb6MiEQEjOEGf1MtRHd+ktGvb9TEYZkhELF2I5SlnM+wl15wNiP4QigY9OfJoNDxobjfLYvXyMeT3dwaJ/F7p+KZ/4KC9uvtuj55ARNpWVZnssEEcQMC4KNB/lUs7ac7fr2qswFXOvgKdNxkghmyNsfq3SpLKttBcVZcmmuKvMRU1ncNwE7YXrzYq9IwkJDWaFa9nFf+t0Q0pSWoygX5lIfHaA/dXFR0CY85O6sx4OFPC/1uArSFadd0Y2Yu5ULnbo84V5dej+BZ15OIMmJQkxmKRPK8jqEBiKb5b2YuLBuwHF/3H5pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by SJ0PR11MB6816.namprd11.prod.outlook.com (2603:10b6:a03:485::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Wed, 28 Jan
 2026 16:31:39 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%6]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 16:31:36 +0000
Content-Type: multipart/alternative;
 boundary="------------YB00Abj5qzNb0ndbd6qXvs0B"
Message-ID: <2aed5aa6-c82b-40c0-a9cf-420df9718af8@windriver.com>
Date: Wed, 28 Jan 2026 11:31:33 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] gcc: fix patch format
To: ecordonnier@snap.com, openembedded-core@lists.openembedded.org,
        "Sadineni, Harish" <Harish.Sadineni@windriver.com>
References: <20260121163829.124179-1-ecordonnier@snap.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20260121163829.124179-1-ecordonnier@snap.com>
X-ClientProxiedBy: SJ0PR13CA0035.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::10) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|SJ0PR11MB6816:EE_
X-MS-Office365-Filtering-Correlation-Id: 3af9eb8b-33fe-45ad-4be6-08de5e8ab4cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|376014|1800799024|366016|8096899003|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Z2dKOFJCbmFJMjJycDNJMkpIamNnMzFHR2NlUS9wbGEzeHJENUpRWFR1aGVv?=
 =?utf-8?B?Y0ZzR3ZlYVhBbkZoWkV0SXFrNUZIN1BwTU9CVTNrQUhyQ0lPUUNybmJOZzFq?=
 =?utf-8?B?VkpQdCt1amw1NkdhMzdJeXd3TWJISjBEaXBIZEQxdzdUQ000STUwYTIrZGlV?=
 =?utf-8?B?NWFoMnJTRmoxVlBRU2E4dytDd2h6WVp4R2l6dkRBNUJXcGhUWHhUTGxSbElZ?=
 =?utf-8?B?djdUbUF6cVVIcy9Wck5MaVNyZzZsRzg4L0tPNEhiRkJCanVSWVVzdVk3aVY0?=
 =?utf-8?B?aGJTTzBFMUFNWEt2ZzJYK3FEdEdaNExtVmhyWFphZDhhSUdkRmZzUUtuWUJR?=
 =?utf-8?B?YjJsUmFZUlYxV3NCZ3dGWFlTTzZ4cFpOK29XNU5ZbzhnQ1M2NHQ1b0c5UmRP?=
 =?utf-8?B?UjNCL25ER3NaYkFHUmtFUXVtZGJMQlNUTzF5VTFxenF2b0pyM2JndlAzRm5H?=
 =?utf-8?B?MHRKenNKR0hDTFRzZzNvYTVPVWorV2pkYkpTb1ZGaVh2Wk12WWxPQ1Aramkz?=
 =?utf-8?B?NS90MjNkNDk3eS9tZ2JBVHVQSHdsQXFUOS8zbUdBL1V2QkRLck5aSXV2RTVP?=
 =?utf-8?B?TFNvckhhbnN4Z2t1MXg4SWk4MmJsVmgrc3ZvTjRpY3gxQUF4UjRkUTV2Mlgy?=
 =?utf-8?B?MndkR09EQmJlWFJDOVVWN0oyRzQ5UmZhQWgwN2pnbWZwZTA3UGJ6TTNudVZO?=
 =?utf-8?B?V0g4ZFpPc1FPa09vVG54L1d5eTR6Qk1keXp5Q1YxRXlrNnQ0MzdvN3dFSUNl?=
 =?utf-8?B?RFcyQS9RRng0amdWa21EQmcxTXB6NVFNdDY4Q0lITXlsTGx2R1E2dUhNUG9F?=
 =?utf-8?B?RCtXNHRoeVpVQ0FKMlBDbDRzTHptbWlNeWZVeWFrVldKb0FkbE02bXNVQjBp?=
 =?utf-8?B?RWsrR0cwVnRObkpHZTNXSFp1NlcwWmcrbTZrc2R5TURCZkcvTEUrY3JaczBW?=
 =?utf-8?B?YStSM2lWeHVjZ1BFeU1xZWxRY1RnYjRVSk9uNmxuRElxYVNBMk1ORmRMWlJm?=
 =?utf-8?B?Kzk3RWJTaEx2THQvWFRRT2ZicDZ5OTBITWN1VXhGQkpGeDZNbndvZWlDVlVC?=
 =?utf-8?B?QWRScC9BUkRnb2tNUFpRVTVCYVBNdDhPTDl3Y1pWeXRBNDgyS1BGWHI2R2FG?=
 =?utf-8?B?ZW1KcnFjZ3NQWi8yWmsxa1JpSktZUnNOV3drY3FUalNjOEI5UFJhMGhPVUVY?=
 =?utf-8?B?cTdPTmRJTjdWYUhIRlBRUXZtQnVVRE5SbEs3WjBaRld5UmtmenZjam9Zbm5B?=
 =?utf-8?B?UWlJUHFRMU9vRzQ1QlNUbnlEZ0xQVUxETi83UGVDS3poVXZhaVBZRzBzU2Rr?=
 =?utf-8?B?Ulo5eWRMVUNsYm50NTY5dHpRQVJ4aC8yNFNuQzdrMjZOVFdXRTFsc0ZPZDc4?=
 =?utf-8?B?d0FiTzVXcFBKVnNSVnNsWnVEUVk2UUhtTzRIWlVad1FxbVNCWFVZUjZMRy9E?=
 =?utf-8?B?VlRndDE1R2dJeXNxN0k5enV2QXMvcHYrWVVQNWpPVE5DMnhsUVFvNG9IQkd3?=
 =?utf-8?B?Q2w3SlNodmxLSUJ6ZjloL1RvYTM4cEt3NDdPTEJBTDExaVhTS0NRRGp2RFdG?=
 =?utf-8?B?ZWVINzNGVUg5Y2YyUXN5b0txYzQ4WHRpVUh4SS9KeE5WZ0p0cTJ6U1RzNlBU?=
 =?utf-8?B?UmFOUjdWYURBNTU3dWYxYmJFUzU3T3BPeGF5SDM5dXpmckFSMXNzYUg0S1N0?=
 =?utf-8?B?bXpGRk5ZK2ZRMWJpM0tZYmQvVnNtTDV0WEpLWEFRU1JnVzNkY2J1RTQydk9Z?=
 =?utf-8?B?cHpmcUNLYk4zWVd5bnd6clZ5eWJKaHZ1VmRDNjYzWno2clNqYWdOVk5Jajcr?=
 =?utf-8?B?WmpSTlJ6TCtPVmU1bGgzRXRPWFFTUFJmcC9XbjhZZnMzc3U5eTFmU0FRMFZZ?=
 =?utf-8?B?bHRKc1V5bmI0ZlNObUYrYW5qSWk5UURoNDdQbkNFeitTb1dJWEtoZlExeFhS?=
 =?utf-8?B?TkhEdWQwdStPTmd1aEdvYzlwRTkvWDVzblM3eXRoR1UrTEoyN0Z1YWxkM1NP?=
 =?utf-8?B?bzJGVTVVN2pKZFBuM2J0QWhlNFJMTjB2cXZjWGpvZ2VPSXR0ZlROdUt6Z01B?=
 =?utf-8?Q?PAT+ZM?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(1800799024)(366016)(8096899003)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bEJhL29Tc2tydVBmUXA1amtrWFBZa21VazRSV3lSY05CYkxqWWNKVThnTzNh?=
 =?utf-8?B?QXZaOXl6b1ptekk5Z29uaHBUczRvVWh6ZjBUaUdhVmFWNmpGb3ppa1FmcEYz?=
 =?utf-8?B?MjBnVnAzcUg4ME05bWtxdVJZNFVQdmxmS1l4dENoanNxcDZ4MWM1dndyekQ4?=
 =?utf-8?B?QW8rOGZMalkzQ1NQTGJ5TCtCMnRFSTFGRmhRc3Y2TnY0T1A5WWI4c2VUTHdB?=
 =?utf-8?B?M1dvcXhmODQvS2VObm5RZ0VGMnVvcjlleHE4V3NRZm5wQUE3ZlFDMnJSZHJE?=
 =?utf-8?B?QjB4VWZjY241Qm10NDRrQUtSY3VWY0J3eUpITjhkYVZSOVdUZzZiUXFjWENW?=
 =?utf-8?B?cDJ4RkxRTHhCUWdXVDFPcXZjK0lBQUg5QldvOVFGN0xMeHoyLzZPZUR3Ui8z?=
 =?utf-8?B?SUhGUGFwSGo3amxOVm5mRTVOMnpONFJNSWFPV2JsQUsxTEVSZG5VS1c2N3V0?=
 =?utf-8?B?d0NKMlBmcElWVEc3d05wTDR3emhqSS81RXphZkJpdmpNalFSUExkOEtHejgv?=
 =?utf-8?B?V1U2cFBycW9PYkNYVkJYTjU3d1VTejVHMlNVaVR2blYrLy8xd3BTUEhQeFlV?=
 =?utf-8?B?WVVwZzZwU3BJOVVuaS95M3hZVFA4MnY1R0RqelFFWDZQOU5wVjJUUkhWczdv?=
 =?utf-8?B?Qnhla0dUVE1lb21uWmdlK2w4QUVIL0syKzNmQnpnTGNVWmJuUE1SeWJIRUR4?=
 =?utf-8?B?alJKcUZTR1BjVlFZWmZ1eWIvWDd1dG9kTkZOM1h4MUkwQmtVOW1rZ1NYaFVD?=
 =?utf-8?B?Rmx0VEhUbTY1NVE3Nmtldm93dWdLaEY2NFd6QXVwV2s0M004bXRZcnlIUTNi?=
 =?utf-8?B?cVdXQUt2NWlSUVlsOUVtbk5BQzZ6RDhZWUJUUFpkbHpYa0FMdnFpb1ExVFIw?=
 =?utf-8?B?T1IwZ3NMZkVXczVwb3FvczE2elNEZ3Rxdzl5L2ZUdjZsMjhyT1NCRnlmZThR?=
 =?utf-8?B?c2tXeVJXbjlRbmE1U3c2eTNKRjBrR1B6SlAwL3RxR0NGNC9SMmdDaWtWYmtZ?=
 =?utf-8?B?dkU2V25wejVpTTdyRzhjZjJXdTBNVVBMOXVnUlpTUnZmOVNqUVNNbGNxbVJS?=
 =?utf-8?B?dnJpWnVoazlwQjBlamN5K2NxRkIrWUQzQ3BvY3FPWldINlF4SGFGZUNYS2Y5?=
 =?utf-8?B?Unp5VjE5ejFndVgvRjB1ZnJYeHhSc0M4TGNiUFU4WDYyVUlReFk1V0JrS0xB?=
 =?utf-8?B?bXNDZG0vakR6eXN1ZVBwVmlzL3A1WXM0b0JIdnN0cXpoeHpUZnJRWm0zc3hO?=
 =?utf-8?B?MmZCdFlXc1dWUDNQYkNJdXNGRUNHYXc3ZTBWZlk4MGYvd1EvQmN4OVpVSU1H?=
 =?utf-8?B?SXEyUXpoYzlkL0hDeUszZUpkdStEaWpwVHk0aWhNb2lQYkF2NVc0NkU3bk9U?=
 =?utf-8?B?MUQ4V01Dd2hZZllUbkswcXZVQ2E0NTVIVHQvUSttOWR4bmplb0k3K0RsRXpP?=
 =?utf-8?B?V3JiSjVYLzZVS3pqcWdyYzZZTC9ZV2lpWGRlUXkrN0xXeDdBYUNGNjBKQ2F0?=
 =?utf-8?B?TzdLajc1SUV0NUpBMk1YdzlJRDNmRWFmd25QNWFFbU9CN2tDb3RRdkZNZURB?=
 =?utf-8?B?UWZPa3VWUW4zelZqYjA0azBpR0lqWDdPUDRKejlSMnVZOVZmZUZHTCt4TWw5?=
 =?utf-8?B?NnNiemQweGRtQXZiRStDT25mOVEzRW1HbGlxNmNaWHpDWEdlbjJzSFVFdVdB?=
 =?utf-8?B?SmVPNmRsWEhQcVpzcDFuR1hkVldvS1B1WXBwdEV2YkpKTS9teitxMThGekVL?=
 =?utf-8?B?a0VsUnN1M2piUkZNMUxnOVVLTE5xUmUyVk9WdVJBcmwyb21Wc0MvcjJEQnZ0?=
 =?utf-8?B?cnpCOUlic3VJUlcxQ2JvTTUzaVRKUG5ZajFsendoNm9taUJET2ZNb0ZHZ3hG?=
 =?utf-8?B?V24xcVFCaGVjRS9ZM3JScHV6SVNTQ2N5RFl2VEtlUWlPbEJseXgvVXdPQTNY?=
 =?utf-8?B?Mm5vbURxc1pNODk4YXBOcDRSaE96RFZ3WUxacUVrZEZvR2pOZ2IrSVlRckVh?=
 =?utf-8?B?c2VURmtuNGYyS2MzZDR3REdRbDFsUTdPY3VQL1o2MjVoalVCcEVub0RoSHZQ?=
 =?utf-8?B?N3B2UzloNHY0TWdLd1I3YVp2UjFSKzFPMXJzdHJyeS9KZTRlY0IwbFJvK3B6?=
 =?utf-8?B?MUdwWnI5eU9oRm1YYkJMVTREQllHT2dkQllZS1ltWWo3cmtzT2hLcU9vWHJU?=
 =?utf-8?B?VVZ3ZTJZaUtGeFN5cnlIQ1Z0VXVkU0M4OTdkU0RQSUhvcm1yQkRjaVF2dDcx?=
 =?utf-8?B?TUdIdjNQT1pwaTdESVgwWkI3elY5VjlFcFZPR0dqMkZxNmttQmlrNEtXcWVx?=
 =?utf-8?B?cmlDNnRseVJrcU12b0xQcGpXYWt3R3ZXSE9VanEweWlkTHk5TUx2cGVxallZ?=
 =?utf-8?Q?4uGw2WYT9BCfF8E0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3af9eb8b-33fe-45ad-4be6-08de5e8ab4cd
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 16:31:36.8758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zkvebVaZGgWhK97IAhZYUP0xpKZfBGl3+88bwFT37o5SGAWCuJBk7eUcCP4Hpwuy3FbtzFnSCkAJBjKdR8A+RAtHLb7Mdr+PdBZTOJQAjRU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6816
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDEzNiBTYWx0ZWRfX1KQfKouYEtnQ
 eIAJONkX9A3kDI87UszLyJQQwKQWELc7Ph4baOpajcKmwcP/avgRyGTi9mwnBQ0IORyOcnrgmA/
 Dpm3J2fW/M32a9jxX8GSdYOAECAOLbOoIJ1Z/QJNpS7HWwSFwlm8VRmlCG2lzTihGQpUuzonDhz
 PkG+x8HO+a7fN8PCanzjbfFg7X+/tPiriUT2yjSgBMZtDNpCWUoL5mXN5DPSI2TkzhzfuZ4AxXd
 e1kxNN7XDV35LdqJurQ1EdeiFPFV9FzU8FMujycrl3WZA/Uo1uey4T0Vc5WOKtUTbeiUgfsZFgG
 3M5VZzhbaoSAUb1iLoyqLk7628CP/iScBKKy+d5DR5lxuLwA25pnpMm7meo/+BdsLavozUzkAQV
 i5lBPKlihLe2ICaelQb9zH/l8JyaOlfFw1KlCLF02YVRAvFsAsj2FRVNv4zgjwIBg1UxDPlTIY6
 JRxe/cjEfQr1nuYfLVA==
X-Proofpoint-GUID: cghrE6tnDlnZOGrNs3XjeHlixzNQteaz
X-Authority-Analysis: v=2.4 cv=M6lA6iws c=1 sm=1 tr=0 ts=697a39ef cx=c_pps
 a=VUNJaWZlx74G+l0QYBOIDQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=mDV3o1hIAAAA:8 a=Q4-j1AaZAAAA:8 a=_iH6NxeTAAAA:8 a=t7CeM3EgAAAA:8
 a=O0-KZXgnpmwxlhV3d7UA:9 a=QEXdDO2ut3YA:10 a=XORG5ybQaHP5LZnNHscA:9
 a=8zoMNPdUrgXN9K4_:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=zZzRKORMDKZaSe7LaTAy:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 5TTFXXT6a4udFj5YcewMgXCl9oi9jt8s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_03,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280136
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 16:31:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230100

--------------YB00Abj5qzNb0ndbd6qXvs0B
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

CC Harish in case he misses the update.

On 2026-01-21 11:38 a.m., Etienne Cordonnier via lists.openembedded.org 
wrote:
> From: Etienne Cordonnier<ecordonnier@snap.com>
>
> This is the only gcc patch which doesn't work with git am:
>
> ```
> git am gcc-15.2.0-r0/sources/*.patch

I like to do this from time to time as well - nice.

Thanks,

../Randy


> ...
> Applying: Signed-off-by: Harish Sadineni<Harish.Sadineni@windriver.com>
> fatal: empty ident name (for <>) not allowed
> ```
>
> Signed-off-by: Etienne Cordonnier<ecordonnier@snap.com>
> ---
>   .../gcc/gcc/0026-fix-pr90579-testcases.patch  | 20 +++++++++++++++++++
>   1 file changed, 20 insertions(+)
>
> diff --git a/meta/recipes-devtools/gcc/gcc/0026-fix-pr90579-testcases.patch b/meta/recipes-devtools/gcc/gcc/0026-fix-pr90579-testcases.patch
> index bee147abc1..6ada61b74f 100644
> --- a/meta/recipes-devtools/gcc/gcc/0026-fix-pr90579-testcases.patch
> +++ b/meta/recipes-devtools/gcc/gcc/0026-fix-pr90579-testcases.patch
> @@ -1,3 +1,23 @@
> +From 679e24f5a751663998ff7202149a749e0f7251f9 Mon Sep 17 00:00:00 2001
> +From: Harish Sadineni<Harish.Sadineni@windriver.com>
> +Date: Sun, 10 Aug 2025 20:28:00 +0800
> +Subject: [PATCH] testsuite: i386: Fix gcc.target/i386/pr90579.c when PIE is
> + enabled [PR118885]
> +
> +When gcc build with --enable-deafult-pie the following tests
> +were getting failed:
> + FAIL: gcc.target/i386/pr90579.c scan-assembler vaddsd\tr\\+40
> + FAIL: gcc.target/i386/pr90579.c scan-assembler vaddsd\tr\\+32
> + FAIL: gcc.target/i386/pr90579.c scan-assembler vaddsd\tr\\+24
> + FAIL: gcc.target/i386/pr90579.c scan-assembler vaddsd\tr\\+16
> +
> +    PR target/118885
> +
> +gcc/testsuite/ChangeLog:
> +
> +    * gcc.target/i386/pr90579.c: add -fno-pie to dg-options
> +    to fix tests when PIE is enabled.
> +
>   Upstream-Status: Backport [https://gcc.gnu.org/cgit/gcc/commit/?id=679e24f5a751663998ff7202149a749e0f7251f9]
>   
>   Signed-off-by: Harish Sadineni<Harish.Sadineni@windriver.com>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#229819):https://lists.openembedded.org/g/openembedded-core/message/229819
> Mute This Topic:https://lists.openembedded.org/mt/117384023/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

-- 
# Randy MacLeod
# Wind River Linux

--------------YB00Abj5qzNb0ndbd6qXvs0B
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">CC Harish in case he misses the update.<br>
      <br>
    </div>
    <div class="moz-cite-prefix">On 2026-01-21 11:38 a.m., Etienne
      Cordonnier via lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260121163829.124179-1-ecordonnier@snap.com">
      <pre wrap="" class="moz-quote-pre">From: Etienne Cordonnier <a class="moz-txt-link-rfc2396E" href="mailto:ecordonnier@snap.com">&lt;ecordonnier@snap.com&gt;</a>

This is the only gcc patch which doesn't work with git am:

```
git am gcc-15.2.0-r0/sources/*.patch</pre>
    </blockquote>
    <p>I like to do this from time to time as well - nice.<br>
      <br>
      Thanks,<br>
    </p>
    <p>../Randy<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20260121163829.124179-1-ecordonnier@snap.com">
      <pre wrap="" class="moz-quote-pre">
...
Applying: Signed-off-by: Harish Sadineni <a class="moz-txt-link-rfc2396E" href="mailto:Harish.Sadineni@windriver.com">&lt;Harish.Sadineni@windriver.com&gt;</a>
fatal: empty ident name (for &lt;&gt;) not allowed
```

Signed-off-by: Etienne Cordonnier <a class="moz-txt-link-rfc2396E" href="mailto:ecordonnier@snap.com">&lt;ecordonnier@snap.com&gt;</a>
---
 .../gcc/gcc/0026-fix-pr90579-testcases.patch  | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc/0026-fix-pr90579-testcases.patch b/meta/recipes-devtools/gcc/gcc/0026-fix-pr90579-testcases.patch
index bee147abc1..6ada61b74f 100644
--- a/meta/recipes-devtools/gcc/gcc/0026-fix-pr90579-testcases.patch
+++ b/meta/recipes-devtools/gcc/gcc/0026-fix-pr90579-testcases.patch
@@ -1,3 +1,23 @@
+From 679e24f5a751663998ff7202149a749e0f7251f9 Mon Sep 17 00:00:00 2001
+From: Harish Sadineni <a class="moz-txt-link-rfc2396E" href="mailto:Harish.Sadineni@windriver.com">&lt;Harish.Sadineni@windriver.com&gt;</a>
+Date: Sun, 10 Aug 2025 20:28:00 +0800
+Subject: [PATCH] testsuite: i386: Fix gcc.target/i386/pr90579.c when PIE is
+ enabled [PR118885]
+
+When gcc build with --enable-deafult-pie the following tests
+were getting failed:
+ FAIL: gcc.target/i386/pr90579.c scan-assembler vaddsd\tr\\+40
+ FAIL: gcc.target/i386/pr90579.c scan-assembler vaddsd\tr\\+32
+ FAIL: gcc.target/i386/pr90579.c scan-assembler vaddsd\tr\\+24
+ FAIL: gcc.target/i386/pr90579.c scan-assembler vaddsd\tr\\+16
+
+    PR target/118885
+
+gcc/testsuite/ChangeLog:
+
+    * gcc.target/i386/pr90579.c: add -fno-pie to dg-options
+    to fix tests when PIE is enabled.
+
 Upstream-Status: Backport [<a class="moz-txt-link-freetext" href="https://gcc.gnu.org/cgit/gcc/commit/?id=679e24f5a751663998ff7202149a749e0f7251f9">https://gcc.gnu.org/cgit/gcc/commit/?id=679e24f5a751663998ff7202149a749e0f7251f9</a>]
 
 Signed-off-by: Harish Sadineni <a class="moz-txt-link-rfc2396E" href="mailto:Harish.Sadineni@windriver.com">&lt;Harish.Sadineni@windriver.com&gt;</a>
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#229819): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/229819">https://lists.openembedded.org/g/openembedded-core/message/229819</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/117384023/3616765">https://lists.openembedded.org/mt/117384023/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------YB00Abj5qzNb0ndbd6qXvs0B--

