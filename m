Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20357D3E76E
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 18:23:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2953.1765391020592198907
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Dec 2025 10:23:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Nj84hWLY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=44393876b5=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA5A1tJ2757364
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 18:23:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=l5BeIG7eVImN9+m6ucNbSy
	qa0b+oAqvYgoV17BOs2u8=; b=Nj84hWLY61x5RRSyzsV1sx5XQG9dS86ck3HhOc
	KXw9eJVbaw/G7GgH3EGmcwSmtGxG1uTs/hzSnF/KaZn3EEdpnVpv5MVGFupXcGvf
	I075Ix6shKghkno5ztDmqLN/Ij3gIJ1/e0uYJFHa39zefPT67gkcv4jdZ5BHI6ar
	RQ/9q8WBPQlNL94w/uQ3A26D2w8UJtnIr7d2sjQgZCgkN85SKMs2CZkT99zYKFbd
	9gQBDQQMzs6yR5ZqwCr6FY6L+BF2wAy6JHc5kILs137WWW0KLOlLBnmSrCNYeSk3
	+YCS1KGaHKvRX4DGU6wtglMXDaI2xwr3hm6Uf5XocIfV6FEA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013035.outbound.protection.outlook.com [40.93.201.35])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ay01ngyup-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 18:23:39 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VN3ghBibf33mBjGP5r5HNj/cC1Wg+cibLcnGU455k6VPh/8a1yvAhMi3crjNqKQJTAIkE67a3wFG5htG4J+6KliWdOe2ZyykzVKwgfE5uB95y09ENJ8QXVfwO8JDJ/iO3jZMy4MAH0MUcQyCHb0Ve7K3co8/nnFIeR10fINjoZnErDWUjzEke+B7DteEg68kIJg+ThBPMHudH7ldoM+pfASh4FvtnWg/njHaEUFRSd8pT0vc0HnZZQ8qBCX5ajgccwslyDxcDgmLfK+aGOi9S0UiquJKOmpAsd/Vyh+CoijxDTme0zidyFWOK8V3+qakrQIoPN13mJeeleW4V6pVFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l5BeIG7eVImN9+m6ucNbSyqa0b+oAqvYgoV17BOs2u8=;
 b=yL8MYOnATarNtKdsZWEpr3gWWxCJz3Wxjho1rmAiyuBUJ9ctrfqiYZ1MsGqSHRBwYkzH4qGcJlk9yJDAKquPF9ZjLXMUN4qBj4P1epdHdFzBUV3V2WSNrXVjZgpMg09/TEkUXPVf+Otnj7oIJNwuFvKZ9uVyP8P7qH8LQW1NMvJlHO4ErI98FJ/E0xexiAgjsgZN12o0Bt69B6NsGWP8timIDEGCwOPdH0NnfFA5YsOKsqKiT3a411qkKHG2F1FXJcxnCi9LGrghbT1aENb1Fdh3/nadtkiicA1ejXAvN4T3wugX2wHsLHPTHQJRuZOPrW1qUGAw79dHlFy31FIBHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8505.namprd11.prod.outlook.com (2603:10b6:408:1b7::21)
 by CH3PR11MB7321.namprd11.prod.outlook.com (2603:10b6:610:150::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Wed, 10 Dec
 2025 18:23:36 +0000
Received: from LV3PR11MB8505.namprd11.prod.outlook.com
 ([fe80::e59d:2e70:4371:48cf]) by LV3PR11MB8505.namprd11.prod.outlook.com
 ([fe80::e59d:2e70:4371:48cf%6]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 18:23:36 +0000
Content-Type: multipart/alternative;
 boundary="------------sHbGL6Lt92c80WbXvutZ0j7H"
Message-ID: <02a4ac7b-613c-4b92-8c98-ac5bd865a62b@windriver.com>
Date: Wed, 10 Dec 2025 13:23:29 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] rust: Upgrade 1.91.0 -> 1.91.1
To: Yash.Shinde@windriver.com, openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, sunilkumar.dora@windriver.com
References: <20251210101803.1120711-1-Yash.Shinde@windriver.com>
 <20251210101803.1120711-5-Yash.Shinde@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20251210101803.1120711-5-Yash.Shinde@windriver.com>
X-ClientProxiedBy: YQBPR0101CA0351.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6b::10) To LV3PR11MB8505.namprd11.prod.outlook.com
 (2603:10b6:408:1b7::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8505:EE_|CH3PR11MB7321:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fa01e43-d391-4945-1160-08de38193bc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Mk1oRGZNOEFkc3d5MEhDdkprcHJxaXRRY3JoQ0lIVE5tdHhzbVoyTXU1elZW?=
 =?utf-8?B?MFp5dlhhelo5dmVIMEcyVzFxc2ttdFdSbkpCYTY4TXBYcFhtV2k0VXV2RTlz?=
 =?utf-8?B?Y3VMeDFnak85ZzU1SWFuSWIyN3N3bXBGVTRhQjdmbVdnZnJpb2dXSlVJd05s?=
 =?utf-8?B?bTJYOUM0NUU2dEJXVFlOZVhiejZzV3lHNExLcG11aWdpRWprL2dXeW5YdWth?=
 =?utf-8?B?VGF1MTc4YWtlOWVaK1BsYkxDbVl3YnhCcjUwOElWQnhLaHFVZmZaVkpwc1Fl?=
 =?utf-8?B?dmZzK1lFRDl5dTZ1a1VheWIxdVFMVjZ3R0kwVTNQdlEyaXN5ZERid2c4NWJ2?=
 =?utf-8?B?YUEybU11Y0Zic3NxU3Q0ZUNaQkVCSlNUbHBsdHRhOUQ4MUVqQXVEU2JkYnhG?=
 =?utf-8?B?R1g0Y3krbEl2ajBTQVB6c3gyeGlqdC9sRTY3MjU5UWgrcHE3RFE5NlVsM1dQ?=
 =?utf-8?B?MUxBeEdNdTFUaXpSMjhDcHlEWE1QYWZ2SEV5akNNZldHUVo3Z2F1ejIvVGdT?=
 =?utf-8?B?WHhjRDJEWmNHd3dYZWtzNDlXWEFrZUlCSFYrM3BZdSt6bVREY1JlKzBjZEVj?=
 =?utf-8?B?Qy8rendpaUM3WlVmZUhlRjJ6L2dFZ1B2RG1EaVd1b1piekVTV0c5N1JoNU0x?=
 =?utf-8?B?cFM5ZTJXVXpaTUZzNFNiQ1MyNDRtQkNOMUVDNC85dXhreCtFdHZxVFQvNHQ1?=
 =?utf-8?B?dUMvYmhFanA4T2ZSM0tMemlvMFVlQU84SVJoLzJ4UE12ck5sVlU3KzhrSHVk?=
 =?utf-8?B?czgxRUlablpXb2JCTjFDdjEwQW1PMU0vTFE5YWpqcEVLcWtOZFgxcUphMmdE?=
 =?utf-8?B?NWF0TkhyakZhK1hBZnRldUZCaXVUdzNlL0lXc250QXZRYUsvYWdPNXZWQzdT?=
 =?utf-8?B?aFkrTmdmU3RJZlE4aTRGaWxwd0JQRmZjUm1mdEdUcTRXVGtuRzBXZkRCeHdl?=
 =?utf-8?B?Q09OY2dYR1NzVWZGNWh2S0NRK2dxV0Y4eGtaN0hGQzJQRGdJQTRJUXJwVXF6?=
 =?utf-8?B?Rmw2OXRsNWRqSUx4T1BEc0ZCRXNLVkVXRzNFczlIV3kwWUtTb01OUkk1Uit2?=
 =?utf-8?B?b2VDN2R0dVozTXNXdTZmbUorQlp0b01EaDRkc09IZFlHOU1zSFgwUzliSTB5?=
 =?utf-8?B?R2RKR2s2QlEzSFF1ODdnZ1BsQzFjdHcrMk5DOTd1WXFDdktha3FHWDNkUFg1?=
 =?utf-8?B?Y0lZSXhzYTluZVdBamo3Ym5ia2dWK2JBQUtzWG94a21WbjNBQWw5YUZnd004?=
 =?utf-8?B?cXFMVU9YcUJXL3pxOFVnUjFrMDVaRi9vczQ4SVVXZFdlZXhkWjVqeWNDSnRk?=
 =?utf-8?B?dmVwazBmVHB6bGppVjB2S2Ryc0Y5NmxUODFNRHlRUG52L3MrNS8zMFlXUzlU?=
 =?utf-8?B?emxVYW4xaGxOZ2NXekhXWE1kNVJ6UnpEZXpKNStCZnR0R3piYi9UTHNKSFJm?=
 =?utf-8?B?L3hnMjRXbkkrdm9TK3d6RlZYQU56dGdFTnJwT1ZPbDk1UlRkUm9sS2dJZCsw?=
 =?utf-8?B?azRBUGR4MUc3ZiszdUxzR2ljYXRyN3NzQk5tN1k2MFcrZkZ2TUxtSmJDUUZ1?=
 =?utf-8?B?WDliVW8wcFJiNTRBMWwwSitFb2l3bGlkNEczdmlKZ0FzVFlOMzhNN2JhdjlM?=
 =?utf-8?B?RVFGaHJjVnU3bGkzYzlUbnJlMGxxTXl0RVhVTlBjdE1FbjJyLzgrUEc3TnYy?=
 =?utf-8?B?b0VZSFc1RUY4SWptaEdieE0wMnp6Z0pDUEgrdXhscGQzdGttWDN2NTk5RDda?=
 =?utf-8?B?SUpVZUx5M28rV2NyQzhGSjRSbGNSa1FRbUtTZnF1dm5LRGZ6amJHclRCM0E4?=
 =?utf-8?B?UUJqZ0RNOFFwWVN1aDlsK0RZNVVDQS82cS8wUW0xdlc2Rzh2NmtDd3pIT281?=
 =?utf-8?B?MjZVOUI2WlZhMFBuNXZPMXREWGhGNGFpQncxTE1PRGxmY1E9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8505.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?N2l5WFBSMVlmN0E4KzdLZEFvSSt3V2h1bm9SU1I5T3VMWnptZTNXSFZYNVdB?=
 =?utf-8?B?bWFRZlJPQkh2WHNGeW96dTl0SzY5bW12bkl0QUxEVEk2YTN2d2FLR3V2bXpy?=
 =?utf-8?B?eklUZ3Q1RHJpOUZOTllYak5CNDVXcmJqcUJTRFNBbWtFV1VNdlVlOXpMbmxm?=
 =?utf-8?B?RDlhVDFMaU0xSkx5bmZUOFVWRWFsSjNDNHU2OC9YbVlUNnlhTW9KbXlJcGNK?=
 =?utf-8?B?N0FhV3Y0RGVjYXJIRkVDZUhTNmZVRjF2UERGTkd1YTVKWDR0ZTBkYUtmTFNL?=
 =?utf-8?B?OTFWaU5yUTJFYlBkR1c0RmFCb2FmMFZRMm9ZZTM2ZkE1Rkd6QnVncGswcmdv?=
 =?utf-8?B?dW1nblVuU0UwdlhVR1VudXhzOVVlMEVjOWExNytSblR4SWgrNzlPeit1dlJz?=
 =?utf-8?B?OSt3VWtkTVRnRkg4RkY2T3ZJSm8vVGF6N2tLaEtSQjBhNTBhODBQcGtJdWtP?=
 =?utf-8?B?L3RURlU2S2h3cmg3VFhpQURQTmRjR3p0YVYzOXFLbWQ2UXhwZEJBUGNyaHhu?=
 =?utf-8?B?SE5WMVNMMzczaWNDRndmYTE0RlVSV0ZhZzJVbXc0VUFuR1E2SUt6VVIwL05t?=
 =?utf-8?B?YUpKWDNSUU0yY1hXZmYwR1MwRXpZbGd6UFlvYjdrbTczRHk3RUFUUW9sMFhZ?=
 =?utf-8?B?dlBreWlvL212WVdvd2Z1ZTlIWCszS3ZYVWFTbHAzc1NnQXpPRCtlUFFQZXYv?=
 =?utf-8?B?eEZhc3dYZ3k0M0pqYmdXM0dwZlI1M1NhakFGazh1Wk9jcHBiclhDK3hvTy9s?=
 =?utf-8?B?V3U3OHVIdFBuenFIZEFxVUF2b0VnYm9zbHdKZk9CZmxzTXRZUEtLVUV0NFFN?=
 =?utf-8?B?bjlUdWtOOHdRRExKbXh6UDlITmNUNGozZFJSYVpYdFo4NkJ5R1l5YmUzcFBZ?=
 =?utf-8?B?V1BzdDFwa1dkL3dPQ3lOaE1zbmFMbXVtNm1nQ2ZJVFZueHBSbm9jNHFpT2pP?=
 =?utf-8?B?NVdRcldQYVhSaTNXTXBIUThYM3o1OUtTVzVrYnBoZzMvNmpMQnB6MWpldW5p?=
 =?utf-8?B?Tk9jYnh5T0k1THdsYjB3YzA1T3NvYlFnaHovNTZOODliVUdCckFxNnRkenp2?=
 =?utf-8?B?U0wvMUtNMkNWNXFkT3Y2YjhkK1YwbFV1TW9MZEZnMHltTU9ZRGpVM0NsNTJ2?=
 =?utf-8?B?dU9JeVRnSFFYd3BKVmdBTGE3cmRZZWkyZzlXbjRFbzdPYmZBaTlsR2lEOCtP?=
 =?utf-8?B?UmI2b1B5TUlPK25mZS9EL3JTbFZER3hla1l3Zmp1Yk04NFZxbG1NWFZ1aisy?=
 =?utf-8?B?NUREMWc1T3pyaTZWdTdaWVpTVTBGRW9Kek9nbUljRFdldHJFVUZIRTY4Qm5i?=
 =?utf-8?B?Y1lyNmNpV05rakFCKzJ2SWl4aUxLK1k1YnZDeUFJa01IUDRpVjFRb1l2VFo4?=
 =?utf-8?B?VFFpMEROZXNpWE1NeVVWK3Bhd1hIZlZnUVNMYytmbW5PbkkxeUE1QlRQc2ZU?=
 =?utf-8?B?eEdBQUVnMkkvZlNSZGtMOUhKVlovdVdBZHU5aUE0MGJHZDBWWUt5N20xcUov?=
 =?utf-8?B?Qmw4NjVYZ2s4SW01bFhVLzNLODAwb0VqZ2NRM05BYWRHRnBmSjU5NXdFREEy?=
 =?utf-8?B?Ymh1by9WZlZhZWdtV3RCaGl1SkI2b1kwcUFONVNBUWYyVkV2OXdMVEs2YzlW?=
 =?utf-8?B?ZzJDUjBpZ091MHkxTFZkRzQ1OVROOEh1aXBVTUJ2OFFUYld1RXcvV1EvTS93?=
 =?utf-8?B?VkNJUlQ3dDU2WWl3Z0o3SlkxbkJZSVJqaGdvYlNFemVFYTIySzJYMUlYTTFk?=
 =?utf-8?B?bENyVzAySjl5bnBaNzlocTc1RUJiRGx5cTVvcEVCdWNVWDB6SVNHWkV6Ui8x?=
 =?utf-8?B?UzNGcEtTamY2aHBQSGlYNC8zMWd3RUZHRGFhUklON1JScFAya3N3RlFOd3Bn?=
 =?utf-8?B?WG9WNUZ2U1gxM3U0TFQ1anlUWHdvd2pVWGxHSDJsZWQ3T1QzRkhQMmJDL0dM?=
 =?utf-8?B?di8zMC9vbkViV1JYVUhZRUJZOG5JckdNa3QrMVd3cDlvamJ4SFgxVndZWXAw?=
 =?utf-8?B?NmYwM1R2bEhOdWtiZXJTZkhwTzIwb3puYUdHek5NWlFGNCtIZDVQSmdTQkVO?=
 =?utf-8?B?SHVoL1ZYYzdDanMySHhhRWtzRS9BR3Q2SU5oU3RnRENhZ2N5NkdkRnNCdnlT?=
 =?utf-8?B?WTFnMFR2dm1WZHRTWTJOVTJWcSt1UUtkWDhyaDlBdklnNUlTb2UzUzZsYmFw?=
 =?utf-8?B?OFE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fa01e43-d391-4945-1160-08de38193bc9
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8505.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 18:23:36.3738
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EYsXkk/ZAEgHB0ZOEAfv/5SFLaYdeWW8GSK0vjm275Y35BAFp8rCN7onbmih8ldLZzuSzvJbseWMFgq3weJ31/bjg9x0B6v+HqKUCW7mgE8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7321
X-Authority-Analysis: v=2.4 cv=d5/4CBjE c=1 sm=1 tr=0 ts=6939baab cx=c_pps
 a=5s0qIa4y+KO52koKvlB/mg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=ei4SEBeUAAAA:8 a=t7CeM3EgAAAA:8 a=JvTs8L8SvYVCQQWkj8IA:9
 a=t0EB5k7lhMAKNYPM:21 a=QEXdDO2ut3YA:10 a=T_XE1fNAp8Y85a0F2esA:9
 a=UC8JC2CifIwhI2-2:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=8zIOOLb7Ym0NljyPXbuS:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: g3DoJ2q7hjhHX0cLtACxoLe9Jve9bkq0
X-Proofpoint-ORIG-GUID: g3DoJ2q7hjhHX0cLtACxoLe9Jve9bkq0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDE1MCBTYWx0ZWRfXyPJjw9wFv5KH
 QZhq0EIFcGNxb1QF4QM4e17er5TNBKf1PROFhXAmGhZHkdp3byVTSohcDxPXfL+lO9rvY3IDdbe
 Q0+PRDh5ch3tLOlzfyJ3h6qLO/rXIbFaH4EAIdSSP9rY+f1nuoIiTN3hs0OsjkR3bVb4SRZK7WS
 q6qBFb0X+uJGh1Qb2nmzVlFpYsbiubxfLD4PTZLygZBbPSiaOTgk9Tz2bFMUFfAiG1X9dRkP6cX
 37r0gYqtxYFHm7WPmFzjm0XotO0AHXjHU+2cvg9uoizDfRFZZf9Tz4WyC1Ovh0Ilys7nJrBn6ee
 1G7vujh+QwrXCYUy3UvZeucxv6akMin6CU8ukSSh4WITmC07EUHgtW6h79AAKSf3HsiPHKhRpww
 JIFltMlFbqglu9z26IeTTafjwEFIOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_02,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512100150
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 18:23:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227496

--------------sHbGL6Lt92c80WbXvutZ0j7H
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-12-10 5:18 a.m., Yash.Shinde@windriver.com wrote:
> From: Yash Shinde<Yash.Shinde@windriver.com>
>
> https://blog.rust-lang.org/2025/11/10/Rust-1.91.1/
>
> Test results summary:
>
>     rust v1.91.1
>     +-----------+--------+---------+
>     | Machine   | Passed | Ignored |
>     +-----------+--------+---------+
>     | arm-32    | 29,968 |  1,510  |
>     | arm-64    | 30,071 |  1,447  |
>     | x86-32    | 29,985 |  1,489  |
>     | x86-64    | 30,229 |  1,247  |
>     | riscv-64  | 30,045 |  1,472  |
>     +-----------+--------+---------+
>
>     Test results difference (1.91.1 - 1.90):
>     +-----------+--------+---------+
>     | Machine   | Passed | Ignored |
>     +-----------+--------+---------+
>     | arm-32    |  +451  |   -19   |
>     | arm-64    |  +463  |   -24   |
>     | x86-32    |  +477  |   -18   |
>     | x86-64    |  +326  |   -28   |
>     | riscv-64  |  +461  |   -22   |
>     +-----------+--------+---------+

Nice work on reducing the number of ignored tests!

Only ~1300 more to go ! ;-)

../Randy

>
> Signed-off-by: Yash Shinde<Yash.Shinde@windriver.com>
> ---
>   meta/conf/distro/include/tcmode-default.inc                     | 2 +-
>   meta/recipes-devtools/rust/{cargo_1.91.0.bb => cargo_1.91.1.bb} | 0
>   .../rust/{libstd-rs_1.91.0.bb => libstd-rs_1.91.1.bb}           | 0
>   ...t-cross-canadian_1.91.0.bb => rust-cross-canadian_1.91.1.bb} | 0
>   meta/recipes-devtools/rust/rust-source.inc                      | 2 +-
>   meta/recipes-devtools/rust/{rust_1.91.0.bb => rust_1.91.1.bb}   | 0
>   6 files changed, 2 insertions(+), 2 deletions(-)
>   rename meta/recipes-devtools/rust/{cargo_1.91.0.bb => cargo_1.91.1.bb} (100%)
>   rename meta/recipes-devtools/rust/{libstd-rs_1.91.0.bb => libstd-rs_1.91.1.bb} (100%)
>   rename meta/recipes-devtools/rust/{rust-cross-canadian_1.91.0.bb => rust-cross-canadian_1.91.1.bb} (100%)
>   rename meta/recipes-devtools/rust/{rust_1.91.0.bb => rust_1.91.1.bb} (100%)
>
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
> index 01e4c7812b..20acf3524f 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -12,7 +12,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
>   GCCVERSION ?= "15.%"
>   SDKGCCVERSION ?= "${GCCVERSION}"
>   GLIBCVERSION ?= "2.42%"
> -RUSTVERSION ?= "1.91.0%"
> +RUSTVERSION ?= "1.91.1%"
>   
>   PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
>   PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?= "${GCCVERSION}"
> diff --git a/meta/recipes-devtools/rust/cargo_1.91.0.bb b/meta/recipes-devtools/rust/cargo_1.91.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/rust/cargo_1.91.0.bb
> rename to meta/recipes-devtools/rust/cargo_1.91.1.bb
> diff --git a/meta/recipes-devtools/rust/libstd-rs_1.91.0.bb b/meta/recipes-devtools/rust/libstd-rs_1.91.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/rust/libstd-rs_1.91.0.bb
> rename to meta/recipes-devtools/rust/libstd-rs_1.91.1.bb
> diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.91.0.bb b/meta/recipes-devtools/rust/rust-cross-canadian_1.91.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/rust/rust-cross-canadian_1.91.0.bb
> rename to meta/recipes-devtools/rust/rust-cross-canadian_1.91.1.bb
> diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
> index 562bcbf4c5..f714487428 100644
> --- a/meta/recipes-devtools/rust/rust-source.inc
> +++ b/meta/recipes-devtools/rust/rust-source.inc
> @@ -9,7 +9,7 @@ SRC_URI +="https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n 
> file://revert-link-std-statically-in-rustc_driver-feature.patch;patchdir=${RUSTSRC} 
> \ 
> file://0001-riscv32-Define-plain-syscalls-as-their-time64-varian.patch;patchdir=${RUSTSRC} 
> \ "
> -SRC_URI[rust.sha256sum] = "9b94161dba3aa32192e0e75f7891912d98095ffb86087b07a05af35a0265a938"
> +SRC_URI[rust.sha256sum] = "66401bb815e236cc6b2aacbbe23b61b286c1fe27a67902e7c0222cfe77b3dbab"
>   
>   RUSTSRC = "${UNPACKDIR}/rustc-${RUST_VERSION}-src"
>   
> diff --git a/meta/recipes-devtools/rust/rust_1.91.0.bb b/meta/recipes-devtools/rust/rust_1.91.1.bb
> similarity index 100%
> rename from meta/recipes-devtools/rust/rust_1.91.0.bb
> rename to meta/recipes-devtools/rust/rust_1.91.1.bb


-- 
# Randy MacLeod
# Wind River Linux

--------------sHbGL6Lt92c80WbXvutZ0j7H
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2025-12-10 5:18 a.m.,
      <a class="moz-txt-link-abbreviated" href="mailto:Yash.Shinde@windriver.com">Yash.Shinde@windriver.com</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20251210101803.1120711-5-Yash.Shinde@windriver.com">
      <pre wrap="" class="moz-quote-pre">From: Yash Shinde <a class="moz-txt-link-rfc2396E" href="mailto:Yash.Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a>

<a class="moz-txt-link-freetext" href="https://blog.rust-lang.org/2025/11/10/Rust-1.91.1/">https://blog.rust-lang.org/2025/11/10/Rust-1.91.1/</a>

Test results summary:

   rust v1.91.1
   +-----------+--------+---------+
   | Machine   | Passed | Ignored |
   +-----------+--------+---------+
   | arm-32    | 29,968 |  1,510  |
   | arm-64    | 30,071 |  1,447  |
   | x86-32    | 29,985 |  1,489  |
   | x86-64    | 30,229 |  1,247  |
   | riscv-64  | 30,045 |  1,472  |
   +-----------+--------+---------+

   Test results difference (1.91.1 - 1.90):
   +-----------+--------+---------+
   | Machine   | Passed | Ignored |
   +-----------+--------+---------+
   | arm-32    |  +451  |   -19   |
   | arm-64    |  +463  |   -24   |
   | x86-32    |  +477  |   -18   |
   | x86-64    |  +326  |   -28   |
   | riscv-64  |  +461  |   -22   |
   +-----------+--------+---------+</pre>
    </blockquote>
    <p>Nice work on reducing the number of ignored tests!<br>
      <br>
      Only ~1300 more to go ! ;-)<br>
      <br>
    </p>
    <p>../Randy<br>
    </p>
    <blockquote type="cite" cite="mid:20251210101803.1120711-5-Yash.Shinde@windriver.com">
      <pre wrap="" class="moz-quote-pre">

Signed-off-by: Yash Shinde <a class="moz-txt-link-rfc2396E" href="mailto:Yash.Shinde@windriver.com">&lt;Yash.Shinde@windriver.com&gt;</a>
---
 meta/conf/distro/include/tcmode-default.inc                     | 2 +-
 meta/recipes-devtools/rust/{cargo_1.91.0.bb =&gt; cargo_1.91.1.bb} | 0
 .../rust/{libstd-rs_1.91.0.bb =&gt; libstd-rs_1.91.1.bb}           | 0
 ...t-cross-canadian_1.91.0.bb =&gt; rust-cross-canadian_1.91.1.bb} | 0
 meta/recipes-devtools/rust/rust-source.inc                      | 2 +-
 meta/recipes-devtools/rust/{rust_1.91.0.bb =&gt; rust_1.91.1.bb}   | 0
 6 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/rust/{cargo_1.91.0.bb =&gt; cargo_1.91.1.bb} (100%)
 rename meta/recipes-devtools/rust/{libstd-rs_1.91.0.bb =&gt; libstd-rs_1.91.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.91.0.bb =&gt; rust-cross-canadian_1.91.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust_1.91.0.bb =&gt; rust_1.91.1.bb} (100%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 01e4c7812b..20acf3524f 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -12,7 +12,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= &quot;gettext&quot;
 GCCVERSION ?= &quot;15.%&quot;
 SDKGCCVERSION ?= &quot;${GCCVERSION}&quot;
 GLIBCVERSION ?= &quot;2.42%&quot;
-RUSTVERSION ?= &quot;1.91.0%&quot;
+RUSTVERSION ?= &quot;1.91.1%&quot;
 
 PREFERRED_VERSION_gcc ?= &quot;${GCCVERSION}&quot;
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?= &quot;${GCCVERSION}&quot;
diff --git a/meta/recipes-devtools/rust/cargo_1.91.0.bb b/meta/recipes-devtools/rust/cargo_1.91.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/cargo_1.91.0.bb
rename to meta/recipes-devtools/rust/cargo_1.91.1.bb
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.91.0.bb b/meta/recipes-devtools/rust/libstd-rs_1.91.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/libstd-rs_1.91.0.bb
rename to meta/recipes-devtools/rust/libstd-rs_1.91.1.bb
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.91.0.bb b/meta/recipes-devtools/rust/rust-cross-canadian_1.91.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross-canadian_1.91.0.bb
rename to meta/recipes-devtools/rust/rust-cross-canadian_1.91.1.bb
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index 562bcbf4c5..f714487428 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -9,7 +9,7 @@ SRC_URI += <a class="moz-txt-link-rfc2396E" href="https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;nfile://revert-link-std-statically-in-rustc_driver-feature.patch;patchdir=${RUSTSRC}\file://0001-riscv32-Define-plain-syscalls-as-their-time64-varian.patch;patchdir=${RUSTSRC}\">&quot;https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://revert-link-std-statically-in-rustc_driver-feature.patch;patchdir=${RUSTSRC} \
             file://0001-riscv32-Define-plain-syscalls-as-their-time64-varian.patch;patchdir=${RUSTSRC} \
 &quot;</a>
-SRC_URI[rust.sha256sum] = &quot;9b94161dba3aa32192e0e75f7891912d98095ffb86087b07a05af35a0265a938&quot;
+SRC_URI[rust.sha256sum] = &quot;66401bb815e236cc6b2aacbbe23b61b286c1fe27a67902e7c0222cfe77b3dbab&quot;
 
 RUSTSRC = &quot;${UNPACKDIR}/rustc-${RUST_VERSION}-src&quot;
 
diff --git a/meta/recipes-devtools/rust/rust_1.91.0.bb b/meta/recipes-devtools/rust/rust_1.91.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust_1.91.0.bb
rename to meta/recipes-devtools/rust/rust_1.91.1.bb
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------sHbGL6Lt92c80WbXvutZ0j7H--

