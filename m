Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33E0ACAC5AE
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 06:15:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.11250.1758867327880872268
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Sep 2025 23:15:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Ij3sk7Lw;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=136492bdb6=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58Q4ldAu1099848
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 06:15:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=lM2OApnjqyQwodlR4CRjjUg+rjDoztxiwRzSs9bgSNs=; b=
	Ij3sk7LwjY4knw1G+5iPOzbe2tDz3Ulx0F0rl1k3IIgugXl2e2g5B2LMRsKP5e9E
	vQC8zL+CsxpPTWNOjk85QafvEXmT+xf6PQDkakOix2iPxLmq1NGArEf7UQstSs6b
	ZhHSPPcRXHsxm6UmnjgYNvwhQEe5Upel23Opt7i1Piq/CxiwCZ3WbN3ohgev10Hs
	ipcLB6yz6OP+LhLbhMVx78E6qxfYEEFCAazRuQvaCv5xkNAzGHboZcQQolrDM/nC
	3xDWVq95RpVHr/pHKzfgwPGQkl92f4nkSOJorxsWAstRNqbMs5AQyB1MDVirx5Ev
	UWfdoo6E6jmAiNViP7AK2A==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012059.outbound.protection.outlook.com [40.107.200.59])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49dbsh8eu0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 26 Sep 2025 06:15:26 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wja6c6sKCEdbLMGLBz7XNg346Y54JaD61Xgj7Ar6Y5YZT5WNG6dLtJURqtC5UtGu2OUqhpw7kqhgDS3KEjc/BI/S+yQCTzHTs0Z9miIOfDNFCSqoD7O5KR+y+V5/oWxJlhDGhQhc/Z3BQWn+6wFoozt0aC3CY3TYXrlwT7mY7N9E4W9HJf+4co3eN24ennWRBB7DX80vAAmApDe1xTKyEkYCJq8hZ+6+tuMSw+Mx0+QB9BDi71hWEZB9EH10C1XKEEmIlf0m7jXu70xmCBs1IoqF2rzZBx4wYOkuGMuWZ8HtROXv3xyrz7clwocaB6drKMii++ypgF6VdnO/fjngnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lM2OApnjqyQwodlR4CRjjUg+rjDoztxiwRzSs9bgSNs=;
 b=xN8Bcjz2WMBs1zXqcuy2ux7OqXo/B47coCSb9GmrTNE2nt1sisBkA2WTrvczIp5y6UV7Rgl1BpIAiVaWfDqQEs8jNW/SA6t/h00qK8EqVoZwjWSm+Tf6/jTr4RNb/QzdWXXxqbpk7ZUql58DA0xdHhDSzY69y84uGCF2H189DKZ9BCs4Cpse22zfRJwh2ysQPcLDnQXT0dl4OJwTPrURIKVmH/vIgIKtCMe2DpZwmhRbjrKQUbschD4AHrx4Zzpilg28MM9rZolpv6goFUZsI1+h9J4Gz4vgZJrC5S6s2PvR/OEOjNHI0Xa49IAzXONc/N3mJiAfuDyCyFCop/sr1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by CYYPR11MB8307.namprd11.prod.outlook.com (2603:10b6:930:ba::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Fri, 26 Sep
 2025 06:15:22 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d%5]) with mapi id 15.20.9160.011; Fri, 26 Sep 2025
 06:15:21 +0000
Message-ID: <a7261bf9-0d16-4803-b2e8-cab2885588e0@windriver.com>
Date: Fri, 26 Sep 2025 14:15:37 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/1] openssl: 3.4.2 -> 3.5.2
To: Randy MacLeod <randy.macleod@windriver.com>,
        Alexander Kanavin <alex.kanavin@gmail.com>,
        Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <cover.1758250424.git.liezhi.yang@windriver.com>
 <c33930b39db477506067200c5c4f19cec0079b95.1758250424.git.liezhi.yang@windriver.com>
 <CANNYZj8_iTg7ukB=Zhimh5cDuUKs520AojDta3UyM7jDHFscNQ@mail.gmail.com>
 <61af5d98-8e79-47c8-92c1-ea93fb221838@windriver.com>
 <d9b18d9c-3a33-4bf3-996f-5d620dcf36bc@windriver.com>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <d9b18d9c-3a33-4bf3-996f-5d620dcf36bc@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0137.apcprd02.prod.outlook.com
 (2603:1096:4:188::17) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|CYYPR11MB8307:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f8cb6a7-522f-4919-7c60-08ddfcc41284
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|4022899009|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?bllIV2dYVFpReFRHeGZmc2lvWis0aVRtWGhoekU4YkhrOThTQU5MdUV6cTJR?=
 =?utf-8?B?VXcyd2tsRWZzOWNUL3FERkk0endLVGgvbVh3ZmVldjFyTUx0empHaEVDMTNW?=
 =?utf-8?B?aGpVRFhpdDBONTQweDgrT25Xalc1SitEakZXcDRRMW93SlRqREdPWU1oUk5W?=
 =?utf-8?B?K2Y1RTk3L1QxZURHRmlDWWlHTkdQanFFaytuOERwRk1LdGtldzMremp4U2RQ?=
 =?utf-8?B?RkEvNWt5QUd4WHBVVkNIS3phbUVPUHhXaVBMMmFiT2xweTZTMEgrcC8zUU5l?=
 =?utf-8?B?M2xZWS9kSXBPaEphTjVlSUppcTZjeUlTQ1lIdEw0b2h5MVdXbTZxRlVaYXJy?=
 =?utf-8?B?N09IWFdHNnpxaUJVOU52K3d4N3BlTkZXQlplRzhCd3ZFTUNFR2djS0dtZjBq?=
 =?utf-8?B?ZlBZeGdJYWIzcERBeWRiNVFhZm1EMkx2NUo4YW91QWRJQVE3M29PVFRlV1ZN?=
 =?utf-8?B?UTZkaUlxSnNTWWZnMDFmMmNja2VWU0cyY3J0eUtpRTJ3UzlJbG56Q3JPOWNz?=
 =?utf-8?B?K3pPVnBjWkZRQmsra00yb1cvVWFXeG5xSGc2TWNuK01HanhDV092bmtERm1H?=
 =?utf-8?B?WEJ3a0dyS1lGTVp2NEJGT3ZVdUdGWmdwRmtQd1AwUlZ5UWxEVWRJTVhKQnVT?=
 =?utf-8?B?SlBFQUJGcWVKN1JYTXY0YnUxMXdDM1J2anNpN0hyTW9FcDAxbkhQRmdYVUsv?=
 =?utf-8?B?ckpMZTNsM0xxdFFySXJJUElvb3FpenM5Q2syakZUTlRjQUowM1lYQ3BNQW9Q?=
 =?utf-8?B?Yy8waFUyd0QzUlVSdVJRcmRiWVYwS1ltTGJDRGx6TjBybWx4SEhGaTdRUFA0?=
 =?utf-8?B?ejFFbE1tRVJ2MWFpbkh3YVcvbjVoM29VNDI5aU8yMmF2Y2JMUkQ2M3FvNGo1?=
 =?utf-8?B?STJxT2ZBRzNrdEpvYUxjclVKTnVuTmphbXFGcTIrNStLMHpaSFhNbTFReVRh?=
 =?utf-8?B?YURYL280a0U4NXo0ckxRUkNCYWJsY0UxQXB2Wm5oQjJ1WTVpWm13TWZRV2Ur?=
 =?utf-8?B?SmtsME1FU2ZWMHg0UXp1VUxLdk1UVi9wck5QdXp6Ync2Z2ZtdC9WcnYxamhQ?=
 =?utf-8?B?Z1Y0Y2RMcUNNeHBYTXhDNkQyR2lJcDhwQlVoTldES1ZZSlkrZG9xRWFSNW9m?=
 =?utf-8?B?N3Y5TVRRVnRYTnlaci9rRTFqVkNTaXBrWUVmbkU0VHVNUHF5a2p0K3N5NWFv?=
 =?utf-8?B?RW1tY2g5bjQwaytjUGpnZk1uTjdUcjlLTkJTRjVFU3NQZWVwc25pcXl1N1JV?=
 =?utf-8?B?UW5DTHh5V0xjUlJPREVZLzJQdFE1VEV6dGVOT2gwSmJNYWNGZDAyS1krNy94?=
 =?utf-8?B?c3NkUVhCeDhibjBKelZqYWlpcXdzeERpQkpXeHVPRS9yVnBwR1lqNUN2Uktp?=
 =?utf-8?B?N3BwTC9lS0NpRVhWYjJKWnkvazRxSzBTRTNzYkVPM3Njazhrb3lsdjBKK09x?=
 =?utf-8?B?amtqOTl4eDZuS2xZRlJqdTYyS1JLdjBrcWhUT0J0Tlcyc0lqWFNUYUFnU0dZ?=
 =?utf-8?B?d0EwM1pQQmVKNC9FeTNtQ1hxUmdUdkJIMnVhRER0SWhkczVHMmxseDdzWXJM?=
 =?utf-8?B?endTOUlibmdZZk0vWGpiOU5ZMGkxWm81c3M0ZHhicFU4ajBHOVZGQy90ckNF?=
 =?utf-8?B?MUQ3bE9yUER2UzNLc1ZrZXByWHJCam4wQnJtZUpzYm16bW01VVFZSHk0aEIv?=
 =?utf-8?B?T2hxQUVhbVM5Mkx5QmF0bjJUeGhzOEdqMm5zbmxKenpmN2NCZ3lBcmIrRUNu?=
 =?utf-8?B?N0Ird3F3Q3kwdUh6R2RCaDZpejVSUWFNY3FYdmUwNlJFZHFnNGJaaklDdlZ1?=
 =?utf-8?B?SzdrU3FSY2x1d3JvaG5ST2JFTktuclpoSEkyYktHakRGMnRTeVpobVdJMzcw?=
 =?utf-8?B?S216OW8vMnZNUHZ4OTl4S0dKdWRjcjVqaEpRZTk1TWZCYmZNeDNwNjBFSnkz?=
 =?utf-8?Q?T6NxTplRuzQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(4022899009)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eXFNYjRieDNRaUxLMGhhZ0tRNFhmTHJvUDUzVVR6WjNSQmhCc1IrRzMvOXE0?=
 =?utf-8?B?ODNhcWpPSGZTcjc4KzlNb0dWS0ZNNUxFTk9Xdk16NU9Pcm54MHdaaFh1SVUv?=
 =?utf-8?B?UlI3NXJySUJKMWtCTDhyd1g2TER5Yk50ZWlLKzF4TlhqSHV6YlN6ZEJyVHJn?=
 =?utf-8?B?TERnV3dOc3pHQy9vcEMwcUN5VmlhdjZwQjczZ2RMVzlOMHBnZEdyaHdQZWsx?=
 =?utf-8?B?bHF2ZG1FZHpPbG5vVXFqSzMwTmNRQXhnbmlXcjdjK0EybEVBV3RlbCtyT1R3?=
 =?utf-8?B?MG1VSllUa0xPNFdHRTlzaTFyQm5FRDJFSjBrTEVpZThMUkFLSGtvL1k3VjJh?=
 =?utf-8?B?Z3Rqb29IcHBCU1dwc01tT0hTU0FOdFM2UmNjZ2Zwajg1VUtHdEJ6THA2MXFw?=
 =?utf-8?B?TG9WSlpoWEt5WFh4NkI1VE1hTG8wdnpBU29UbEdvTThRU2VpZ2FrazhyajlN?=
 =?utf-8?B?SHJONXQ4Y0NNQUs2YVg3WVdVTkZ1bE1JYzVjbUFwM1VwTlUvWkFXYUV2OEpE?=
 =?utf-8?B?NnFPRDZZeGw4ckNPWmpHS09qc3h5TmZqeExjNG1SYVFRTGZwUDZEMTczaW14?=
 =?utf-8?B?YWkzVGdIYjZyZGx5dFNLTDNDWVQ0ckdKSXFyL25GYldocHpueFduSDBzK08x?=
 =?utf-8?B?U3BMTUtSVkZVSGtBTGx2bGxDZmJOVy9VVkYyRWMxY2kvdUh4S08rSTF5WkU3?=
 =?utf-8?B?SlYrMVdFajloeERkYjR5T2IvV0tmbVVrZ3NreFFVdk9hbmlXYzhWQlBjbHZF?=
 =?utf-8?B?Q2htYkF0emlaNnZXK2cxWTJKcWVScGR1Qkg2VjBBQytCNkU4V2RRbGR0cWRD?=
 =?utf-8?B?ZUpEa0lUWlM4blBOQzFqbkdJTmd3cDgzTW9NMlFMRVhiTUh6dDYyN0VHRVNH?=
 =?utf-8?B?VnlHZEhhY054S0JqTmF3QnVOajJWdlZvbGgwWkJ4Z0hpSWJ4UWZTWEN1bjR3?=
 =?utf-8?B?RndKREpPT1BOeklIWjY0RGZSQWM4cFIwcHg1ejFVTXdDNEJWR3JrT3FLTktG?=
 =?utf-8?B?aFBjNnpXQWxTRFNLT1lVU1RTUGNlYkJOUnU2Y240UmM3MXkzdjFEaTZUY2Ew?=
 =?utf-8?B?TS9DZlczNzFTb0R3N1JRSE1MRGk4ZlhENUFIaUJ4dHEzMklxRGNmdjh3clls?=
 =?utf-8?B?K1VJc0VWNEdHVld1TllqaSswY0JLZ282b1lVMHM5SndUcjFCWCt2NnRlaWd4?=
 =?utf-8?B?M0hObjAvU0diTG9qL2pxQkN5NXQ5aGFJOTljMi9NdmlZUllYWE94SGNpa2E5?=
 =?utf-8?B?b25hT2JLNkYvdFVFdEEwdGFJT2xlY3dhY3cvT2RYUkdXYUt2QitIREFPWStJ?=
 =?utf-8?B?VmUyMmlQbnF1UTVydnpFNFhscW5LZkJmaUU1RGZvc0ZvMmxwN3Q3clRLOVha?=
 =?utf-8?B?WHlXREoxVXJzVDEyUUluZy9ZdkMxS2Jnck1mNVo3K1VlNmxTeXNuUVF5anha?=
 =?utf-8?B?Ukswc2pER1hMZ044SUxrNk1hNzhSTHNsVlRhZVpaMDJXaFN4eE9UcmZGNnEw?=
 =?utf-8?B?UHgwVktGc2tGQ0ZuTGpHSkEvVDBUSlNUQlFjMmpQL0hlTU9FMUJ4QXFrYzQ0?=
 =?utf-8?B?TldBMFd6bjROMWtLRnd2MWJpSU51N1ppSEk5R0RtMnFQOHFWMXMzbVJWYXpE?=
 =?utf-8?B?d05USHo3YVZEb2tyLzFwaEcyTkM4UVczQWdocE9Oa0M2cmRpbmZtdGl5d2dW?=
 =?utf-8?B?c1RIK1M3WkJpZWdGVytwcHpHb0NMOStpUDlkYkM0UTdrc0tqakdia25CVEtD?=
 =?utf-8?B?SDZlSFp6WEplamFCMHJwR0pWQnNmVDlwNUJ5UjBYMS9PSlpxa0huWHg1QXBy?=
 =?utf-8?B?T01RWjNMcDNFWkdMU3g0K3U5ckdBWHlHZEpMZjZ3UGFEOVVIcFlpOHkvbEc0?=
 =?utf-8?B?UWVRb0Q2YmF6TWdMY0xuRExWWUx1L2t3U2NJeDJ1bXFxcGUzc3BvLzRXVEJz?=
 =?utf-8?B?RnZtdk5VZjBIRDA4ajhKRmltMjliRXFrWU92QlB3aWFnZ0UxTjQ0UEhuT3BQ?=
 =?utf-8?B?Ymt5L1BiVXJnM082NjBaaUtFSUR3TlBoT1hmandncG82UERaVjlRczUrSEpT?=
 =?utf-8?B?UHh2azdnNVlIcy9CVVpRMFRaYmdUUGczbjBscXFFSFFvb0lMS2t2Zy9RcEV0?=
 =?utf-8?B?amk2VDhYL1RwdnVDY2ovN1dScWZ1aXN0TmI5eXR2cFN4SktDakQzOEhtZEF5?=
 =?utf-8?B?Smc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f8cb6a7-522f-4919-7c60-08ddfcc41284
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 06:15:21.5080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wzwi1po00W+rBOyCSO3MVKMwIaGlN6k5RCLjkvKNOBJ2ZVqsYIvtH8FCh7MM1S6tZ7wbhTiodZOgY8nv99/QVJ/yaAgFn/jEYDFph4YMBas=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8307
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDA1NiBTYWx0ZWRfX98hblcgYYNv9
 i5efxtZUDuWrS3nd2gJj5D5gG/1+AfuOFoB95TbxyOAZYz5MTPcE2QKrUv4zGmx680doHyRCaUM
 MC6cNoCd0m1+uLuumdezS5+P8I6gMj8LiTo/QI23nBZ2/mKN8YRbldYsXLMqxtVcooa/mt5WFLW
 RjUCXNj5Ew7aVsizXJA3wB2F9KnV33uM+hMW9U7Cx0Ok6nGeHc3TkjSDw8iSPDRRto7GEv3PSps
 LjzJ0MQNwnNr2hSTZlphE2CNUBvobwKawHbz8CQ2pbJH3W3Mi+XtV02OkDaevKmOwvWQdKABvNd
 Ua77I5zjZw1PJfLVWcgyGY0h93wn1CWLJGg1ovFlCwPTDxLaiq6TJyZP1ddaIY8icr/EeOM1GV7
 jdN6u3/oMFKJqrGTZbF4lJDajsIPHw==
X-Proofpoint-ORIG-GUID: G2x7NkYYGhjKiJNLHzVy6YRuQbWXKxu-
X-Proofpoint-GUID: 2VXehOfOv5Yb_51ySY9mFTHIKdO34Ktf
X-Authority-Analysis: v=2.4 cv=U4WfzOru c=1 sm=1 tr=0 ts=68d62f7e cx=c_pps
 a=+/t0CT+QaJpOasvqRK9qOg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=ndnjdrWSqaIicfQNvHMA:9 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_01,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2509150000
 definitions=main-2509260056
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 06:15:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224053



On 9/25/25 02:31, Randy MacLeod wrote:
> On 2025-09-21 11:15 a.m., Robert Yang via lists.openembedded.org wrote:
>> Hi Alex,
>>
>> On 9/19/25 18:21, Alexander Kanavin wrote:
>>> On Fri, 19 Sept 2025 at 04:55, Robert Yang via lists.openembedded.org
>>> <liezhi.yang=windriver.com@lists.openembedded.org> wrote:
>>>> The benefit of OpenSSL 3.5 is that it is an LTS supported to 2030, which can
>>>> save the maintenance time in the long run.
>>>
>>> Yes, and it also add new features, breaking the promise the project
>>> makes to its users.
>>>
>>> This update cannot be done without TSC approval. You need to get that first.
>>
>> This has been talked on TSC, but not approved yet, so I sent the patch out.
>>
>>
> Hi Robert,
> 
> 
> Richard was saying that the TSC needs a formal email proposal
> with pros, cons and some data about testing in order to discuss this idea.

Since walnascar will be EOL in about 2 months, so I'm leaning to drop this patch.

// Robert

> 
> Can you gather that and send an email to:
> tsc@lists.openembedded.org ?
> I think that Adrian, who I've CCed, is also interested so maybe he can help
> to review the email? Just send a draft here to the list if you like.
> 
> ../Randy
> 
> 
> 
>>
>> // Robert
>>
>>>
>>> Alex
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#223800):https://lists.openembedded.org/g/openembedded-core/message/223800
>> Mute This Topic:https://lists.openembedded.org/mt/115322467/3616765
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [randy.macleod@windriver.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
> 
> -- 
> # Randy MacLeod
> # Wind River Linux
> 


