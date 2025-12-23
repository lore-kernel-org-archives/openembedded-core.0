Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B239E6C614
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 07:06:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.96638.1766473607377983695
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 23:06:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=RkK+0V0m;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4452694da9=yash.shinde@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN6sGPa3581393
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 23:06:47 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=43mQ413OBrMDS074kShxGV4rhpNG6dsdLl8qU4bBliE=; b=
	RkK+0V0mGDpdW2Ow37lHGx441u45BfgtCaYRc1Uiyy61zTjX+jhJZpciKhZK3jYH
	ha+g1WNJv9bBkWHL17VS3YcjNSRCbLYgY3Y4Q8t+69uAI32jElQQVMu5MWm4R9ce
	UkwASHl818h1BrKIdg6mv909+3ABRAToOq7L5M8PAG1w5kTbjYbXA9xnjSrUijqx
	/NcSlNb4ayu9q0T73ML8dPI8zaD+loLOEDScCmjd4xhwcpT5HSB+SOIwEQWUDPGS
	RX5FBmb0BvbwJjLs36FyetXsfdX0lQa31ctTEdpQseQrJz54MweM4p1bmkzkFbYi
	VgpOwGkNGdlLosnpfe1BsA==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012001.outbound.protection.outlook.com [40.107.200.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b5qy4tkc6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 22 Dec 2025 23:06:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XAF4qH3hPwCN5W5xn06npr7W/6qeQlyo656aHi7c0RJzT2E94+lFkpcrJgfhTZplshDBATAiPd06GxzAWaHqAZ1YZnfOU0nMHIf/WamMew5VZBGiMk8W4uLTyNuUTJ4Dua2xqFICk6j7kf20DXl8Bdjf8kY3vXS5Qhy4rHhIb0tmwIeHeuoTjwLNFo1CotxKkx6o6TggE+n5nDQHEbribmGyARGoDydh+CLj5qPRlZ3RJvh1MvVP5nTfXH8sSFv25AXQjARRQp7XB+U+n+p8k1cel0n1y1eVif/qnB2wjorpSo5Qnngr51f02XJxxrNm8h+bTBzLH3MbfibA369L2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=43mQ413OBrMDS074kShxGV4rhpNG6dsdLl8qU4bBliE=;
 b=cepeZzcLPpBAo947yMKCtvZCc64Zz3UjtNVdyv22DAkpXM6NmnT7Ka499sjDFNctZwcJluY/TVTOb1MsiwnQUphVp3xJzDKYEu/pxdmX9FsV578RDngtk2YT8HFQI4RbBPtJ+W5x9cTUkwWuaW68RJOeTjpESyexzAM4gq0CLcEVPwDDWk7QY80ZgSPClltJsKRU4cZEpLCYF4R5ireloAzH42LIXVXpiX4lAmsFnDqk6iyykv/NAgLAKm8KyouEdMym0m+NjhTZNYoyvhYVZ8wXf+H8gKX2w6PDLVLU9O6tI8XFGvXChnA+Xh6eEJDouEJxFRKsVPj2+ZOCw5Wl5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ2PR11MB7599.namprd11.prod.outlook.com (2603:10b6:a03:4c6::7)
 by IA0PR11MB7751.namprd11.prod.outlook.com (2603:10b6:208:43a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Tue, 23 Dec
 2025 07:06:43 +0000
Received: from SJ2PR11MB7599.namprd11.prod.outlook.com
 ([fe80::8345:1cb3:a109:be24]) by SJ2PR11MB7599.namprd11.prod.outlook.com
 ([fe80::8345:1cb3:a109:be24%3]) with mapi id 15.20.9434.009; Tue, 23 Dec 2025
 07:06:43 +0000
Message-ID: <8c6235dc-e65f-404e-b54d-16b1c1ce5711@windriver.com>
Date: Tue, 23 Dec 2025 12:36:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [whinlatter][PATCH 1/2] binutils: fix CVE-2025-11839
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com,
        sunilkumar.dora@windriver.com
References: <20251222043357.366484-1-Yash.Shinde@windriver.com>
 <CAOSpxdb+OGDWaZ=9b_dW51CDH8HVeL2wBZ_oWrh=ao6HC5bRLg@mail.gmail.com>
Content-Language: en-US
From: Yash Shinde <Yash.Shinde@windriver.com>
In-Reply-To: <CAOSpxdb+OGDWaZ=9b_dW51CDH8HVeL2wBZ_oWrh=ao6HC5bRLg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: BM1PR01CA0155.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::25) To SJ2PR11MB7599.namprd11.prod.outlook.com
 (2603:10b6:a03:4c6::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7599:EE_|IA0PR11MB7751:EE_
X-MS-Office365-Filtering-Correlation-Id: 481686d5-0a2b-4b75-d38f-08de41f1d3f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eUpZSytmd0xNV3ZrUFpmd0REalgvb3EzL1dzRngrbVJIQmwzT1VoaStQRnVI?=
 =?utf-8?B?bVRKNzVkWldUWlNPemI3ZWxwam1XMThJQUxkbHBwb2dtb2lPZ0pCMTg3bWVt?=
 =?utf-8?B?bUE1VEhvbGdQM1liWkRsdXdXMVpJRVlaeG1mYi9VUlRqVE9tWGdSMW5MT04z?=
 =?utf-8?B?ODJPZXQyVy8vOXNhYjJQOXNOSTMxSTlNajJndm01UTBkR0VqSk1HbFp3M1hy?=
 =?utf-8?B?T1ZzTU1JVWRaWXZHYTNYZ29sNUsyVWtjK1IycGsvcUsweXdDN09yeDJKeG5v?=
 =?utf-8?B?bEJodHk4UzhLOXJJYkx6NzA2blcyQ2UxY1UrZkp6Yk1QbE5RUWtjRkNmeHMv?=
 =?utf-8?B?bEowWlUweDhTQzZPMTJUVHQrY3VuQzhGczMxSXA3Z0MvTDRXejJaYkxjbGkv?=
 =?utf-8?B?OFpDVVJyMmZWYXIxbUhyRWpGNDlSSlJmaDRJWnpEanF0Y2JzbndPOWw2Z0hU?=
 =?utf-8?B?TmNHQ3ZpVzFuQzRYZHNqcmtrdDFoWmJ0Z0hEMlB0NkgrYndvL2NFNU4ra3hO?=
 =?utf-8?B?dkdOUWpVZTVoL0JOckJRMzFQdTRwZmZ3N252MFdad01haGdxazZBdUgrSFh2?=
 =?utf-8?B?cWx4WXg0ZUtNaEsrSWlsQkJEVExKUU5yUS9TTEVCWkpGMmU1Y0dtSnk4U0kv?=
 =?utf-8?B?aXplRzlvT2RUUmVuSVlqL25xVERVZHhIODBzMzFtdklMQXlDKzZ5cUdlRWxZ?=
 =?utf-8?B?dUlRS2dQa1ZSVTZLZm9HT2VEenEvZVY3SEdlb0hEVEZ1ajk3T2phUk9YaHY4?=
 =?utf-8?B?UmxYVHNzc05QcUdwZU10WFQzWDF1dHROOThqTmIvZi9nZ3ViaFFkdTB6Nmxk?=
 =?utf-8?B?ejdjRXpqRklYa0JXSk1PRzZCWmxmVkxrRVlWVXJGRWlPS2tSS25iKzRWMlNp?=
 =?utf-8?B?c1drdk1sd3pJQnZhSkVzdk95K3BXUThzdmk4ZmJmbXJzUmZTSzdYU1FiYnQ3?=
 =?utf-8?B?U2k2UFd4d3NXclNuSkJIVUtGS254b2hNMzRQbDNGRFdzUE9VZCs0WVNoaXpm?=
 =?utf-8?B?NG1GK0dldmV3b2o1d0hMdGtiY2VFMktMbzVYZTd1QnhRbGJ3bDZ3VHI2UkdG?=
 =?utf-8?B?bUJLcExzTCtMRFd5RUNYd0kwTk8rbGg2Tmk1ZHo0Y0U1RnlqOU5mSkhyTzVk?=
 =?utf-8?B?WGUrcUk0dDMyOFpUMTF6VWtkU240RGc2QitpSSt3MERwVTdObSsrVUUwRGha?=
 =?utf-8?B?NEM0WU1zNnk0WVYzdGlobUlKUDE5ZlN6K3FXUEo4Vmo1OXVYZ2Q4OXlxcWRs?=
 =?utf-8?B?cDM5VFRDYkcvYUdBUXZhd3cxbENhNXJhc0Q3WDg3WmdXRlR5aFVZcTg1b1ZI?=
 =?utf-8?B?WThaV2FmblVCRnlTVkZadnB1V3gxY3duWkRqRFNqZVJkTGx2NGZ0SlIrMlpk?=
 =?utf-8?B?dDJ6RVhWNjZkMjZ6bVMyczRlUzJqSVRoMHZRWHpxQ3dlM1VSTXdwRTlMdkZX?=
 =?utf-8?B?bW5qSEpTYVFzOWltQUwwekFMWlJCN253QkxDQ1lQL24zYkFac04xMlFlY25h?=
 =?utf-8?B?b3F6N1lmQzNma1B2Qk44RW9xWTBIbFZ3WUUybFdwR1NWbUc3TFZYazJrU0tR?=
 =?utf-8?B?bmZSNU42K3pKT3pxQk1TMThhREhVYWRycTZrYTVkdVlOSVEyMHVkV0JNdWIw?=
 =?utf-8?B?ckljMU9jdzZnTzhMa3o0MlAzTGhBc0xhSHlHSE9LSUpZWkRIdjQrQ1FTRkFw?=
 =?utf-8?B?Q2RSMC9DcHgzOUlvdmtIenA3RGFHNzVENWhWd0ZMWGxaMDV0TWYyMGZ1NHI3?=
 =?utf-8?B?bnlQNU9kTkswbGREYWJ5ZnYvK0ZOKzlpajY2ZFlMVzM4M2thZVNLSjhjRjht?=
 =?utf-8?B?cThFWWoxZ2swakZlUHJDR0phdWVxVFFaN2w2UFEzZmF5cjZXanQrVlU1Qk1V?=
 =?utf-8?B?WmlJRXE2aHo0S0M5ZlFJdC9FRVY0K3MvWE1wbzJzZEMyLzJvdEhOWWtZV2Vk?=
 =?utf-8?B?S3dKZDlvdG1BRGg4cUdYZHRMNnB5cHY0WE5xQkpXSGR1Rk1WNlcwbTJobStT?=
 =?utf-8?B?ZjIvUkkvRkZnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7599.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QkRVcHF4Yk9WTlpVcXc0eXNyWFRTNjJ6SW40aUtiU0I5cUlMMDlFeDgxbjJx?=
 =?utf-8?B?K2Rnb1lCTDJtSjJPQ2RpaE00bng1RzgvYzRKZVRIck9hWGRZTzEwa1ZlUHRo?=
 =?utf-8?B?d0lwa0pFNzlRU3VzL0FBdWRudVNNNU5MTDVCd3J5M3M5aTlLYjN5TXQ0VFhu?=
 =?utf-8?B?bUFzbW03TEpJaE1JSi8yWmxpT1hpK2VVN3FxMWNCeFNpODU2ZVJDRnV2MUJy?=
 =?utf-8?B?Rmh1S21oVUYrbkdRTzdqMnZ0MG1Hdi95MWVXU3dOU2s1Um5FWkRRSlNhQS9q?=
 =?utf-8?B?UlZ0bDhzV0tUSGNyRTNwbHJicFpJRU5tMnNkcWVXMnR5RUJGRm9kVktGRVV2?=
 =?utf-8?B?amxKa1IxTTlSMUxwZ2NXQW9jcHpCNE1BWCtaT0xPejZjVFMxYWpaT1RJQndZ?=
 =?utf-8?B?Y0RFRWc2KzhTZXhYSVZob2lUc2ZrSFF1azNjVjdYSjJRR2dlbmdZNW12d1c0?=
 =?utf-8?B?bCtad1cza1FYS3RBQW9LN3BpWEVyNkozY04yVWFFVU5ua0FEM3VwVGpSUHRo?=
 =?utf-8?B?ZjFHNFpFSk5TakdCUHpvTzBINXdpd1ZISFgxWEczZjRrQ2MxWDVTZzY0T1VF?=
 =?utf-8?B?YmN3NWNCdm1yc3g0VjlPVjRsSFRhQ2l0MkJEV3kvei9na21Wckk1aEViQnJl?=
 =?utf-8?B?Q3grSEh4VXoyQkJobXFxYzMreWRpYUZtM3pJd0k0dm43Smt1RllRdnB5WnJO?=
 =?utf-8?B?U2NjQk9SbWMwcnpxeDl6c3FBRloyMFZLZXlBTjZKcjR6NDVXYm0ydHZ1bjVL?=
 =?utf-8?B?Yk5jK1BwRzVqeVJXeVNTMW5hcU5KVzZJUVJzUzU2c3NHQUZ6U0UwOElTdXZZ?=
 =?utf-8?B?WW1PRWRRcm80ZWVSOXl1SXpWU0ZGSjRaaUlYWWJTazIzY05Ncy9pWVFodWgx?=
 =?utf-8?B?aGhnL3k0WlNmVkd2a1UrNXJoRFREYy9TTjVGRWhCKy9TTVV4RC9zbWFDMjBx?=
 =?utf-8?B?UkZsamoxaTJmcUFWNCtVTlZwUDZFVkZFbUJIS21sWmhhRWp3SjVuUVNPcmhQ?=
 =?utf-8?B?MVNFUFlkaERxd0tGZXFwdVdoOFRUQjh1Y2YxQ1ZJbVI3TVlkZFFjZzYzNjVU?=
 =?utf-8?B?UlZmV3JWSVAvQjJwNXRLa2h2K0tMQmZRY04vc1NLb0FXV0ZEYVdvMGRubG1B?=
 =?utf-8?B?MzRjaW5Wdmp5bkxVeFFlTVZ3OW1XK2Rya3ozZk02cHZDc1hncmZHSG05aEMw?=
 =?utf-8?B?WEpzbGJmZFNOWjRtZ2ZOZWI3L20vZjN3UUh6blNNYXdJUjBKM0IrTitzRU0z?=
 =?utf-8?B?RG51YjRzWWpNSGNCWEh0RjNRRGdQNmtSUzJPQjdVemtTTm1ydi9Tdy91MXVV?=
 =?utf-8?B?c3YrKytxN1kyeFIzakhYVmtzRDlRZXdtWmFqTWJMQTU5WlB2MEcvLzl5NTBD?=
 =?utf-8?B?TGtpQyt5c1pjYWVmNDIxa2liRzc1M3NBOExSNXc2VW1ZYi8yOGlTYUxSWTls?=
 =?utf-8?B?RVo3YkxoclgrL0tFSWhjZEJRalJuSVZRU1piSS9sTmMzZzVXam1tc0RDQ3ZE?=
 =?utf-8?B?c29mL0xUbEF5dDg5eU9xNXdiTVluei9XNEU0SVB1blFJSDNXM2NzQmh1cytM?=
 =?utf-8?B?eUp3bkQrQkJBdTBLdmtrMDVobitYVWt2QjhRNi9NOG0rQzhYMkNOa2U3S3Jk?=
 =?utf-8?B?SXNCV1VtM0t6RFI0cTBCamZqN2FwaWxjSTlDZEpzNWxOM0xtaWZlKzNQalJZ?=
 =?utf-8?B?NE1QVVNrU285S2VROWJVbjNPNndIdmYzSmpVNnRjWkxuU3dsb1ZDSFZvTDhi?=
 =?utf-8?B?dXRULzF5eTBjSDI4eW8rTy9QRGRWMk04dWxUNlBLREx1U0Y3SkhKUEYvVnE4?=
 =?utf-8?B?dGVxMFIyU3lrVzh5LzlublI5QWtLVHJBZENkdUlJYlhZV3d4TUhoU3hLdjA5?=
 =?utf-8?B?RWJCMFZxT0NMVFoxT1FEaXA0UlM3VmhoMzJ4REExRDY2YVdSQ2pSQnpXODQr?=
 =?utf-8?B?aXlseUEvdWtDVGs0TTBiOTBtVU8wcXRLT1pyQzRmYng4TCt2d3MzdU5IR0Ey?=
 =?utf-8?B?UVhTMkRtd3Q0V1F1OVhmWFlubDNXNEhBSExLcG9KdlpqMGpCd2haeVpPcVZG?=
 =?utf-8?B?dHNNaWp2SzVhRGRHQjVNSnBJbmxzd09wcWJ4eGgwYlE2VDNVa245cWkwbHV6?=
 =?utf-8?B?V0VES1V0cXVEZ3NBeStKY2ZvNGlKOUVPdUNNZCtCS3VzMFl1TWFnWnJCbExo?=
 =?utf-8?B?eUZpR1U0ZXhlcVQzYXBUeU00QS9OTEpJNGYzZEprcTY0ZThjOTJtSXNTOVVz?=
 =?utf-8?B?WFRGODlKRkh2Mmt2V0MwQWxpUmV1bDVkYjNBMGJHRWdzb1ZwZys3UWxaZVU0?=
 =?utf-8?B?YXRIVFRhT3ZOb1hwYmJtbldBZ1pNV3pEZ3VlWHQwUUJnNmFocDVuSlFEdW95?=
 =?utf-8?Q?bsr1HOT2eIbpYEfE=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 481686d5-0a2b-4b75-d38f-08de41f1d3f6
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7599.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 07:06:43.5286
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2uaQIR31HsRLhypvQAs7olvjK6SWbbdsLDbfQhmP+bSMHUmxmN0X8BwufHf+x6uJh8djS3wmA6jfrrKwN+MVaG6xXAhhlhhvEgQJr19dHOY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7751
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: UQDFrRYx2_Ra6ryd5ipHoIxaNiISBLRr
X-Authority-Analysis: v=2.4 cv=Q+vfIo2a c=1 sm=1 tr=0 ts=694a3f86 cx=c_pps
 a=c79N1uTKLHxLQxOLln6vMg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8
 a=20KFwNOVAAAA:8 a=AceISEsmv27cdGstBTsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA1OCBTYWx0ZWRfX+Dh9blpLk4XR
 VdtLZJuk5jdZQtSfaxO89iiHJ01ROvvZwKtFZ7Zl+lsT3lD7B020RVScLrFyxGnFiqLGU88qDQ0
 tYliFdw/J4/X0QxLU/1IYuEMkX2v5qBplhxMugkm85AL2tV/D9KGLAjCwQgGGQXYYbm3t53rU7c
 uIcUeCuFpTC/NQ4KS+ZydDehRHMjJmvZA48QXBLNuu1Gx1hn/2647ZkOr1rIiX9KRIBRN0DNPno
 hwDO5t2TYZe5eulQHZWNx+1OlU7R5PVY+ubLhgmqpGkx79wUWKpbdW5fNdFW9QdSTOcXsyfA1Si
 4vOeWdQhY9qX5uyPXckagqwenp4Uiqcuz7gLlUNgJVXRexJN/xFNjo+yjG6uYeQbxgBl7wx9wSd
 UrvK2eDhpuihdhLoZll68es8E0Stgbo9Jd6+5wlXFDjxTURxqrVYwc+/DK0/zjoXimLZ6cX51z/
 doXs5yIw3M8jbG2KNIA==
X-Proofpoint-ORIG-GUID: BKiiNUYbfyF1cthilZ3IgmRIeUt13QDb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230058
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5BN6sGPa3581393
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 07:06:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228452


On 22-12-2025 22:29, Steve Sakoman wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> This series doesn't apply to the current stable/whinlatter-nut branch:
There was a white-space issue.
I resolved it and sent a v2.
https://lists.openembedded.org/g/openembedded-core/message/228450


Regards,
Yash
>
> ~/Repos/openembedded-core (stable/whinlatter-nut) $ git am -3
> ~/Downloads/whinlatter-1-2-binutils-fix-CVE-2025-11839.patch
> Applying: binutils: fix CVE-2025-11839
> error: sha1 information is lacking or useless
> (meta/recipes-devtools/binutils/binutils-2.45.inc).
> error: could not build fake ancestor
> Patch failed at 0001 binutils: fix CVE-2025-11839
> hint: Use 'git am --show-current-patch=3Ddiff' to see the failed patch
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
>
> Steve
>
> On Sun, Dec 21, 2025 at 8:34=E2=80=AFPM <Yash.Shinde@windriver.com> wro=
te:
>> From: Yash Shinde <Yash.Shinde@windriver.com>
>>
>> CVE-2025-11839
>>
>> PR 33448
>> [BUG] Aborted in tg_tag_type at prdbg.c:2452
>> Remove call to abort in the DGB debug format printing code, thus allow=
ing
>> the display of a fuzzed input file to complete without triggering an a=
bort.
>>
>> https://sourceware.org/bugzilla/show_bug.cgi?id=3D33448
>>
>> Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gd=
b.git;a=3Dcommitdiff;h=3D12ef7d5b7b02d0023db645d86eb9d0797bc747fe]
>>
>> Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
>> ---
>>   .../binutils/binutils-2.45.inc                |  1 +
>>   .../binutils/0019-CVE-2025-11839.patch        | 32 +++++++++++++++++=
++
>>   2 files changed, 33 insertions(+)
>>   create mode 100644 meta/recipes-devtools/binutils/binutils/0019-CVE-=
2025-11839.patch
>>
>> diff --git a/meta/recipes-devtools/binutils/binutils-2.45.inc b/meta/r=
ecipes-devtools/binutils/binutils-2.45.inc
>> index 680ba82e86..2f61c9377b 100644
>> --- a/meta/recipes-devtools/binutils/binutils-2.45.inc
>> +++ b/meta/recipes-devtools/binutils/binutils-2.45.inc
>> @@ -44,4 +44,5 @@ SRC_URI =3D "\
>>        file://CVE-2025-11413.patch \
>>        file://CVE-2025-11495.patch \
>>        file://0018-CVE-2025-11494.patch \
>> +     file://0019-CVE-2025-11839.patch \
>>   "
>> diff --git a/meta/recipes-devtools/binutils/binutils/0019-CVE-2025-118=
39.patch b/meta/recipes-devtools/binutils/binutils/0019-CVE-2025-11839.pa=
tch
>> new file mode 100644
>> index 0000000000..7f2f6d553d
>> --- /dev/null
>> +++ b/meta/recipes-devtools/binutils/binutils/0019-CVE-2025-11839.patc=
h
>> @@ -0,0 +1,32 @@
>> +From 12ef7d5b7b02d0023db645d86eb9d0797bc747fe Mon Sep 17 00:00:00 200=
1
>> +From: Nick Clifton <nickc@redhat.com>
>> +Date: Mon, 3 Nov 2025 11:49:02 +0000
>> +Subject: [PATCH] Remove call to abort in the DGB debug format printin=
g code,
>> + thus allowing the display of a fuzzed input file to complete without
>> + triggering an abort.
>> +
>> +PR 33448
>> +---
>> + binutils/prdbg.c | 1 -
>> + 1 file changed, 1 deletion(-)
>> +
>> +Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-g=
db.git;a=3Dcommitdiff;h=3D12ef7d5b7b02d0023db645d86eb9d0797bc747fe]
>> +CVE: CVE-2025-11839
>> +
>> +Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
>> +
>> +diff --git a/binutils/prdbg.c b/binutils/prdbg.c
>> +index c239aeb1a79..5d405c48e3d 100644
>> +--- a/binutils/prdbg.c
>> ++++ b/binutils/prdbg.c
>> +@@ -2449,7 +2449,6 @@ tg_tag_type (void *p, const char *name, unsigne=
d int id,
>> +       t =3D "union class ";
>> +       break;
>> +     default:
>> +-      abort ();
>> +       return false;
>> +     }
>> +
>> +--
>> +2.43.7
>> +
>> --
>> 2.49.0
>>
--=20
Regards,
Yash Shinde


