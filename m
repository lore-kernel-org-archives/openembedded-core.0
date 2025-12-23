Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31078E6F066
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 07:36:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.96665.1766475375982976439
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 23:36:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=OT+A4c60;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=445255b06c=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN4vRSH3392718
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 23:36:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=BNal+mAyzBgQ88uZGBCPjgmD5AnNcyLX4gsnKclgMv0=; b=
	OT+A4c60tlPuQDVPLkpl71Cw7XQ0AuDvNkk1Ldsk/ZX1FSHQAiI6G+yrZAcavrn2
	Fi8UMMjoV7tqPfvmDZjOWYET1Xh2CDZUs9vyHsw2E0OlhpzK3NDZkJM72bQU4CFE
	I9l1a54i4vbsk63Wq12DhzDh1S/aISFOVR4zFprVvo0yX5sEbVdN58tobTiwwdSq
	HuBD9b3+IOxd1PUfzz4qiV6KGbs7ftsJ3yhtMxwqYJZk64MM91ocPDnN5XWoxA8f
	oB6QADkRxGx81ciI8Lo48AD14ougmjSDco8/i+Be9/w2rYQMkhK/JeYzS1sue8cV
	pRL0xATmtfcxamFHbaD4gw==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013002.outbound.protection.outlook.com [40.107.201.2])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b5qy4tm5e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 22 Dec 2025 23:36:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=grpHs4FzgsinCgW2MrJ2hmxT0BfuzVMw7cvOTiIx8B25zOTmFZFQywd8f/UyGLd77JPdb4FKYVQmSp1D1vDu+T82exwJV8YZOUvhs/VJOf/t3bWZA+5hV6EjzYjtSd4DVJk1lHSc9+mrMWyy+YwK/Gcy2XVsqaKDGH50XT+NVBQCjEX8VwDKXvdMtMd1sG8H1Y5RClDqTTYsUZq6gyNUByStDDPFZ01u6SWh1/42OSDB3J2TDbcD60AOyRq1xt/3l18R+giH20adXNX9RD6RUsToQTiYSg5KR50fAL/b2khEHnbbEtJ0TpaZFWfKo/4PqLYOM7otIgyWYVn/0S2Zrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BNal+mAyzBgQ88uZGBCPjgmD5AnNcyLX4gsnKclgMv0=;
 b=B2dBIr7bJ3Rvz8pL1pAXhB9MW4ZtJHq0Pms4wR49KM9/iTaOdQgg8Uno7p9gyq4ZUXIBQxzAaXXmJx8X1n4BANaMioQZQA7UPpHN6ahie5fw8D4lFjt3MI39qYH5ZScpXexwz84jYsnw3hb1f9Rzgs+I/zE1ncUsvwlIPwWTQJWuaEgcAiaA2NkPVtXXPOIgTy304jhagFrK0G1wEUmn0+hI57UPBr7ERdgxPEEgNw/vMtYP0WY4H6DHT6f7GXRZ8QYbW+ixh6PFKqFE9pqCOHWhJmXBa0cbLRnDnDo2zL7XMlfKy+61sEt2qwpDgUDDvx82pXNXcA55FFwJmAl+3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by SJ2PR11MB8586.namprd11.prod.outlook.com (2603:10b6:a03:56e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Tue, 23 Dec
 2025 07:36:12 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d%5]) with mapi id 15.20.9456.008; Tue, 23 Dec 2025
 07:36:12 +0000
Message-ID: <473904dd-5f19-4331-91a3-4ccdab694c1c@windriver.com>
Date: Tue, 23 Dec 2025 15:36:06 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/1] strace: 6.17 -> 6.18
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, randy.macleod@windriver.com
References: <cover.1765878985.git.liezhi.yang@windriver.com>
 <1fc8161d254e37709e63cf9d07ebd32a2f1023cc.1765878985.git.liezhi.yang@windriver.com>
 <CANNYZj8=3egJPC3dT1bc-9n=38-OAyAKfwb81mJjuiSiqVcaQw@mail.gmail.com>
 <b127705e-0b9a-4a5b-9fcc-c3014e4c680c@windriver.com>
 <CANNYZj8c1DRLJfxZMVVT3fx2Db8fnUc8A73_pE3AasKRMQ6U1A@mail.gmail.com>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <CANNYZj8c1DRLJfxZMVVT3fx2Db8fnUc8A73_pE3AasKRMQ6U1A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY4P286CA0108.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:380::14) To PH7PR11MB8527.namprd11.prod.outlook.com
 (2603:10b6:510:2ff::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|SJ2PR11MB8586:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b3c7b36-a676-4eca-bab6-08de41f5f1bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?T3p6cFphTnNEZ09OdWp3Z1dHNWlLK0RRbzllakxWZ0VIVElLTkxSOFU1Q0Ux?=
 =?utf-8?B?VzdyMlhmbnRkTjlFd3N1TkZhZDZ2d01kaDdBOTBkTWpiYytLc2VUelVNbFNP?=
 =?utf-8?B?OEpjem9PNU4rMTI1M0JaQU4vMU1vclg5UE50VHM1cmx1bXZrdSt0NVJmVHIz?=
 =?utf-8?B?ZHNlaytiVUpXcktKaytrNGpYVTJIRVNWaXVUVnlXSG5qR3UwSlhLL0xIMVM5?=
 =?utf-8?B?OWRmOTVpL1hRcGl2bDRKVS9MblY3aGY1NzhtQkJJRmF1YkZsNE9DY0RRUlpn?=
 =?utf-8?B?aVY5ZldpblhDdXVQU2xLNitNbVFJaHNIbzd6a1JlcFBzemx0cXN6MTVLaFZC?=
 =?utf-8?B?OTJEOXJBNEpVcnRJcEpJQWU3TkdWaUZGS0R3OEJxTld4QTVDd3NLVEsrMWps?=
 =?utf-8?B?anFTVGpyZFIvMGNCMGtlN0FaY2FXMC8yUVBxSk93N2F1ZzVYclh5VGdyRFJT?=
 =?utf-8?B?cHVvTjFISDFTZGxjN3BraEhNRVdtRTV5cEhWaitiSm1DKzZtT0pkbjNQai95?=
 =?utf-8?B?czN4RWpodWRiL3p1ekNUMnlUSFJ1aWpIZGxobDIwM05aYlVUZGEySVJXRjk3?=
 =?utf-8?B?NDN0UkhhNitvR0lOQlEzbWwxTlFkTThZRS9WUVlXUnhjY25maFh5WlhkbW1G?=
 =?utf-8?B?NUh4cFpqeWN5QjhlM3FYTDQwSGdGTVZFL1o0WFRsWTBIVkxwRjdwMTl1WmNK?=
 =?utf-8?B?VlZzSlBzOTltODFWdlRRajF2VEYrSmdPNVkyLzJiUVcwZ2JmL1dOM2VXUHBY?=
 =?utf-8?B?NHpMK2pScnAwZXNkcElxVTVLWE5DY214bGEvL3NtU2NmNFkrSHBRS1FtelND?=
 =?utf-8?B?b2RUaWZTaGw5cGQ2c1o5bDYydUV3UkRRY0JCb09yNmpsZ1Y0K3BGS2xPQkdZ?=
 =?utf-8?B?UXBJVHFBV1JGdFdhVFFWQXoySWI4RURQRHVxb3dhOXpmQm1RN2x6aVVoMFBx?=
 =?utf-8?B?cUVuUEo4a1ZERzlwdDJydjBVQnE1MkVDSnhDeUkzQ3UyR3pjSjZ2SGlyZzhT?=
 =?utf-8?B?RklvNmZaemZ4dmpNa2s2M05xN3J4UXVPaDg3bktzNzFXbHd5SWZMWlBGa1F4?=
 =?utf-8?B?T2x2aXFDQzEvVldmb2VZQUdUbzIvWTJHMnRBMi9PVmZ0VVY2VnFBNHFoaVph?=
 =?utf-8?B?eFdDVndmSDJmVmI5RURUR3BUd2xJSXNZU1hWNGtJZkFvOG43ejFqT2ZiY2NN?=
 =?utf-8?B?N2RiZ0xtREJLZEo0ZjJXZVRVSmVjRm5uQnJaRmtNaDYzN1o2OXJZdnJabU5R?=
 =?utf-8?B?U2lTcmw4VG14Z0RJY3hBVW5rVkVRS3dDTlFGT2gxcG9sM1VDNmFjQU44MkV1?=
 =?utf-8?B?bTdBcXVQWnliOExGalJVbDZ5VDFPLzFwV0p2dUliZ1JyMEVnVElGdmRrelJj?=
 =?utf-8?B?eHBKQnVSc1NaZVp3Y2NtbGp0b254bjlSTXMwbWxocHhLVzdYVDYxRzNlM1Fh?=
 =?utf-8?B?ekdHWUI2M3pETkV6RFhINVJzU3M1aGhBUEh2MWw1c3liaGlXMWhaL1FOVUdN?=
 =?utf-8?B?eVBKQ0xlT0dERk5SZE5lbGR5Y0hyWXpFVFQ5SFRwM1ZLa0RBRnc1bWF4UjNW?=
 =?utf-8?B?RGVlN2h6VVp4N2RlM1JtZG9LODI0WDJIQytEcjFFZFprWlZlK3ZHUVlaOHNZ?=
 =?utf-8?B?cGhWOXBPL25FL2JGK3NWd2hlMjlkTlQ3MkN1WjlQSGZHaHhoV3o1L09GTmlT?=
 =?utf-8?B?MEt1dlZZTm0rb2ZyMHJwaHdudVkweVc0SkwvUTdOSTNQaStIYnQ2SWtwQ3dO?=
 =?utf-8?B?eUUyRk1UVmsxTWhpVVZ1eVRoQTU3NGNZZFNaRkFtQkVtL01yTGI4RnY4TGJO?=
 =?utf-8?B?akpwMEYwS0hmcC8xR1ZhbDBMb1Jzdld3MitWWDNYaFBudWovS1dmeFB0V3dv?=
 =?utf-8?B?aS9CV21KVHZIV3JXc1BMSVMycFJvU1JOenBWNjNYUWJVUkE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?M1lVdUdIZkUrQ0x4dGFaa3RacEdvMmcrajAyT2lxSm5Fd3lZTGFMa0pkTWFy?=
 =?utf-8?B?d01sVURrVjVWN09DcXZrejE5UlEra1VmRjZOMXBCSjJzeFQ0MThRcFVGbDVu?=
 =?utf-8?B?MS9Dd0NpTVF3RWRUK2wyb3Q3Q1VOazU3NGZtVS9zZnM0eTAvemQ4MWV4S3Jp?=
 =?utf-8?B?aUJOaTM4MktMTlZTNVNsWjJZWDRDMWNRNDdGekNVVm5HbGEzVHFRcFViOVh6?=
 =?utf-8?B?YkZXQTYwbVMyQkRhSHE5d1dPTTJ5VklMWFpja2poL3V0WTZ3b3B6UUgwVkR5?=
 =?utf-8?B?TWpCa2gxOUQwZytlQWtwNkd1MWtBWUpLamdzNStzcjFpY20zVmVSRHJrbHZJ?=
 =?utf-8?B?QjZDcXJPd2tndjZGWk95NXd5a1ZIS21ESHM0VUhHSjVTaHFxbWhPUnVoTERZ?=
 =?utf-8?B?Q2E0UGFnSFg3SDNpYzZTYkhEZjlIR2hPbEtjdXBYMy80L2pBdDBwYUVEcnlr?=
 =?utf-8?B?V0d4eUtkUjAxb1Y0K1FkUEFJWnUydHV0RDJtK3ZSK09QamJmQmM4UWpmVFdJ?=
 =?utf-8?B?RFIvcnZDTVpObkhiQ242REhiTVQ5Snh1QkxxRnpxekNLNkIzNFE0Yk9FOHE4?=
 =?utf-8?B?c2VhSFJlZW1nV2lNN1ZmaGVhV1J6RXJwK3BoVnFyVnZGU1hwSHZYUjZ3YUNa?=
 =?utf-8?B?T1piZW55NjhhcmdCRmtIOVY4WVJNVlhLbDZuN3czUjhSZjdxeHpBSE1SNU9P?=
 =?utf-8?B?eXdReTROQ3Q1b2JQR2hCY2JQdVd0cFM1VHlHb2ZaSUFFSjZZeGhPMStmMGdO?=
 =?utf-8?B?NlBScGhWb2drMFVhTGJjM0dZTmVRdVhwQXdEZ2FpUWE1WmpITDczRDllL1o5?=
 =?utf-8?B?NGZjVHZTRlJ4c01NeVY5aEFyWGNmRjNRWjJzbnFITEc0ZUQzUUcvYnBsTTly?=
 =?utf-8?B?RFoydzR4a2pLT0JWTDQrakg3Y1l0ZnpXaVI4MGt4TnR0SUgwNUFZdGFjT05k?=
 =?utf-8?B?SjF1UTRjakVkQVBaRENNcFpOL2xMV3V5L0NmaG1ENVdGVE5oZTZzWlI3KzNV?=
 =?utf-8?B?eDJuUnAyUkJnS1V2OWd3bDVBTDZialNEYzkyUFpUcjlmbFAwUlhkbU83VXQv?=
 =?utf-8?B?eGc0eHVCYWlEWWFGcG5TT2tPQUxqdXFEUTFvSkFlQ2dtalF6eHVaWCtpdlkv?=
 =?utf-8?B?UnFKOUszdFFLUXFVYXNtTzdZWWVxK3c3dldFR2RPUGk3cUQzOEZuNUM4Ymlx?=
 =?utf-8?B?OE4rMUpBbkdHdlNCcVhEcHh5YnQ2OGFPc1hBWld3TzNGVkFZb1kwdGo3cXd4?=
 =?utf-8?B?UitURW1icjBnL2dJQlovVnR3WFB1cm0zcHV1WlNtcmhZeVlkNGIwMFN6aFlC?=
 =?utf-8?B?MVY4UkdxeFMvZEZMVEJmN2pIbGVWZ29qNHZGWXNkN1EyRloyZFkrQ3JHdnJh?=
 =?utf-8?B?RU9RaHFXMGFLOStObGNmVzRXREhoSHNVcUlHWmcxZTh2alRaSTl1MUdHMms2?=
 =?utf-8?B?ZVlJWjhBY1l4U2YrTm9UTVZJSVEzc3FqSXp2RDB2SFBwazBJWGFxL3NnTDBN?=
 =?utf-8?B?Ny9SdWRKcEx6TE5SdVEwbDdiY0x3d25xcFkzN3JPb0ZOOFhjMWI5WnpOR0RC?=
 =?utf-8?B?ekpNNStLbU5GTUFubDdhdDhSdkFxdGZ3eVpDS0hxckluZWJzRWgxWTI0bXdH?=
 =?utf-8?B?bUNUL3VKb056cTVtNlJVMTAwamM0SHU3c0Z3bFIzYWpYNWFzSEZSdjJsaDBa?=
 =?utf-8?B?Zk1nWWNDcWNmZmpxOWt2Qk9jR1RjTml1cWUwM0xTOEFMbTFRZUszd1NTVzIr?=
 =?utf-8?B?UDJSVXJiYmVlcVlaN1liak1MYUpGaGw5OFFIcTVIMitWdElzbk1WZXY0ejdK?=
 =?utf-8?B?UmgzZFB0aXdPdEhLYlZHK2o1S3AyeFh2Qzhjd21ETVY3U25ZY0NOaWE4clpm?=
 =?utf-8?B?U3l4TmR2SXBCZ3dDSS9CZDZSblU4ZWVXMlNjdnVxOW1wKzdSMTgwd0tPeTUx?=
 =?utf-8?B?dEZqK3h3MUZoY2xNUkpzeGRBQ3UyWFZjVldDT2MzRFlmeWtPZmVFYzVDQThT?=
 =?utf-8?B?UkplUXpoeGpZcWhmcWZDNENwd21URkI4M1dYdDl1dnpVWWJpeWlxdVJUTEVl?=
 =?utf-8?B?S0RHZVM5VkdSek4vUzRhSTF4VUZDY2c2NlhKRVJSS25FTWZwSEJWdnBIYUZC?=
 =?utf-8?B?WUxxT0ZXaUhoNW51K3Q1VGs4RHpXem9rMkVYbWFTSFJuMFFoeGVOdmxBQ2sx?=
 =?utf-8?B?Z256dmlCbzlQUk1QZHN5ejEzelI4V3QyVUUyaVFZejlNMHdIMUdYS1YvMDZG?=
 =?utf-8?B?QlNzdXV1YitpeXBzRS84WHpVK20zRXFPdDVkemNaMGU5UzVNMlIremdIZVQr?=
 =?utf-8?B?TVBoem5uVGJzNEtZSm9QZzlSTUp0K2dXckhrY3gvTGhPbnk1SVhDbmwySXY5?=
 =?utf-8?Q?R4BR0Zba4hNm2B40=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b3c7b36-a676-4eca-bab6-08de41f5f1bc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8527.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 07:36:12.0523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y0TTlThsCZijU0VrZGgtOMLd1iLtYdVabacgQi8DrjVJeLNpRSvDzoywu+lShJ2VNSlbRP1P9FnVpj6mcLnYqEk3mt4gJgtF34Qat9F3l2o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8586
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: lJKbzvz3WLbXdadOecR47WM0tuMQRitD
X-Authority-Analysis: v=2.4 cv=Q+vfIo2a c=1 sm=1 tr=0 ts=694a466f cx=c_pps
 a=uYXQfM3GD41LpGGBCGkGnQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=ypdlUNQ7jKSNdMkla-MA:9 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA2MiBTYWx0ZWRfX6XiK8V7ypUX9
 JYC3jX44rgiYrs6pTBPJcV4q4k+eCdDmLzxRocoXmeedPcZtghBQ2OsrHVriTZ+Gngr9MMupjfM
 DOAydxhdKahV9HBAlswAcivdDVCdJcPkTeF7sP3PRhNiWOeJPzDgYc4X1b6M6qvp9kJZVpy9SrV
 GaGQdZ4cTXmujEcgDYQoxlnWj+8lMHp/GczZ40roLAiZihsxifsjLrpeNFjgucgqJ63FbtuQHYk
 LQgIeHLMybnuHRIbb+g/LJ9mYNzus8cXKzxS718E0QjMdO3BV1NImaSYNN1ZgdRP1e9S1V0nGkm
 W4ukxFpuvGAvoGnyDprToPc0eQjxVWzYgO2sW8n4A1b36/nO2SaLguNooRoMcDa4qeUEku5L1Ch
 VqO9vdxSBseq8AnFDosxSLhtcD1UbB2kcB0y9WH7wwUT/aw/3lQcfPmlQvexVjDENFjqCYAA75i
 mOshhzrhfq6Y7S0Dpzg==
X-Proofpoint-ORIG-GUID: ceipFkffflY7B4ZloBYP_nSOBU1rj4-q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230062
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 07:36:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228457

Hi Alexander,

On 12/17/25 16:41, Alexander Kanavin wrote:
> On Wed, 17 Dec 2025 at 03:58, Robert Yang <liezhi.yang@windriver.com> wrote:
>>>> The 6.17 has 27 failed test cases, and 6.18 only has 2 failed ones:
>>>> FAIL: bpf.gen.test
>>>> FAIL: bpf-v.gen.test
>>>
>>> This needs a bit more context. If the old version had failures, and
>>> the new version still has failures, why aren't they seen in testing?
>>
>> They are ptest failures, and there is no specific test for it, so we don't see
>> the failures. I did look into the failures, but didn't know how to fix that, the
>> newer version has less failures than the older one, so I sent the upgrade patch.
> 
> But we do run strace ptests, and they do not fail, e.g. with latest
> nightly master:
> 
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/2761/steps/14/logs/stdio
> 
> Does bitbake -c testimage core-image-ptest-strace fail for you? How
> did you set up and ran the tests to see them fail?

You didn't see the failure is because core-image-ptest has PTEST_EXPECT_FAILURE
as reported by Qi:

https://lists.openembedded.org/g/openembedded-core/message/227411

I can see the failure after applied Qi's patches. Or we can manually see the
failures via:
# pest-runner strace

// Robert

> 
> Alex


