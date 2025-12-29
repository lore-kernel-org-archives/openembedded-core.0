Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1102E92725
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 11:25:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41669.1767007550733561111
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Dec 2025 03:25:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=m3yiett1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5458eb3737=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BT9QRcX4032974
	for <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 11:25:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=/LFQ/AC95VK+iuHYuDYzXH9xFz113T+ziRe2B9GY4sI=; b=
	m3yiett1RQjgJ+4Ctj+EZllcuT3Js36hF2QxhPho6PYF0S3wUtX1SA6xgszbor+k
	uD6Il/koflvBexpL5+7yqKY+6bjSsDR34eTe9LHPQbii1CRmqI8+5+h3H4XzlmtB
	93fPuTXAO7WukgyQtruVQ2OcVNLgg2DfZLFgIgQzDSkMfpSjSF/DBBwq3e7HGXX4
	kwJtg4sJRlws1heGfCNawsEaPnAx4l++/0RwRfswHxeEjAQ4iZrKneKfIdCjaQ7A
	Y36eYg/loA5JTd6AehtRBmIfwxGJNdqDxYGBCI42cTIXsEFkunHks5kwXCYavHgP
	UrxoW7dVqBsVGIk7Fc1FMQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013051.outbound.protection.outlook.com [40.93.201.51])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ba4nxsntm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 29 Dec 2025 11:25:49 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DUAWlxiftqLvXnCT0UUcwCeMPfWa2vjq5VZJEbr4gwda8uaxabPeD2JIZDVlvr5cvRKwYSzHeGrA1iehJvdUdSUyZqjTXlPAUw6gajaaZtxvjkuI8h97XNfFJjZZjNjCU2IHkdtlLw2NOa4qD+enHbO6TDjegRvBT9unWLc6JfLu8Oer7pQYH++C8M/JwZ4bkIPtr9DJT62ByOy0MGn4hvvcLSFENfiIv0ee9mxPozXWYUZjic+RlbOPoZG+sC4B+NHrf06qNRuKPVAKbeDlDi7LnooA7TSlUiOfnu7xfaJmqLgdbh46MXI/asm/g2RngWRd6WnYrzAu3wrBgW0vJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/LFQ/AC95VK+iuHYuDYzXH9xFz113T+ziRe2B9GY4sI=;
 b=L93jrtcywc0lw88KdIOi6SSNFDoRmvGLWxy+Y1rFyLJpN7wZ+mT92/5Nqs62WgaSLW5VyAZZ5Ft9MyyzyGF+AMqLzFipn9HBAznlR7oe1viLEMJNanQ196XF85YIi+dtKZqE4LZX3bFznu1nP3g5+vreUzchKO1D3rc255NyYWcgN2bMTgIDSKLJn9VgzydQqkWxRoqL41BhLh8UHWcSPWfX1pwtW8+WcWDT7Z1AMooP5vqXplfjaDKy5PqibkWnUbtEAvKLoyaqwMCG1IKSIUZiGSyssafJBU8vC+wPzhCNoB7tmRFCWz8VAw9cZRAngV7doFzTilCtrIiAyMKmRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Mon, 29 Dec
 2025 11:25:47 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9456.013; Mon, 29 Dec 2025
 11:25:47 +0000
Message-ID: <a0143cb6-96bf-4181-b1f4-df7db2e77563@windriver.com>
Date: Mon, 29 Dec 2025 16:55:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/16] kernel-devsrc: copying rust-kernel source to
 $kerneldir/build
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com,
        Sundeep.Kokkonda@windriver.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
References: <20251227113251.773795-1-Harish.Sadineni@windriver.com>
 <20251227113251.773795-11-Harish.Sadineni@windriver.com>
 <CADkTA4MO1Xxi_p+w6jV5ZCiVCG+QrK9o2KHucBK5TZruf1BjWQ@mail.gmail.com>
Content-Language: en-US
From: Harish Sadineni <Harish.Sadineni@windriver.com>
In-Reply-To: <CADkTA4MO1Xxi_p+w6jV5ZCiVCG+QrK9o2KHucBK5TZruf1BjWQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCPR01CA0189.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::14) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DS0PR11MB7312:EE_
X-MS-Office365-Filtering-Correlation-Id: 9090a4e7-4e68-4f69-723f-08de46cd0320
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WlZXRGhvTEIzOU5iM0Q1NWV5VjBLV1BrRDQ3U21aVkdlM204NndxSmVUT0lC?=
 =?utf-8?B?OTA0UkgwKzgzOVVWc1hpaFkwWTkvbDZJVVFCUGpWVHVva0pJdkVxTXlIdVVi?=
 =?utf-8?B?YkFBUTNoWm9ZWlRldWV0YWRtUk40aDRKa0VPKzVFWTZtQzJsakZRbjZNbEV1?=
 =?utf-8?B?bTVqaGhLcnV5bmtUSElNSDFHY01kVmg0dkpHL3RMNTJPcEtIUFZ3VTNvOU1V?=
 =?utf-8?B?cks3Zk9UVitZZUxLdm5MYy9lK1pnRHFqTlF1UE42QU54NURtV2xrLzJUMGl2?=
 =?utf-8?B?cmpXdWZzU3lFcDdxdDFmYWx2ay8vd25zUXFRbGpIZXNTVWcyTkZHWEI4Tjls?=
 =?utf-8?B?VUtYZnJidnlTMEFmOHRVZjBSSUZEQjRZcGJzejNBL3BwaFREQzR6QVNLUXZj?=
 =?utf-8?B?UUNTY3ZUVVU3VW5jdVZFMXM1Nk1FWXBobGhucFVkMnJEcTRBaG9ZTHNwWjVZ?=
 =?utf-8?B?bHVleTdubzRkdEJnRG9aS3VNdFE5M1RWU2R0SDNDenI5cHhvQlh5ZDU2NHJD?=
 =?utf-8?B?N2Y3T3FkZTA0SFNVTUgwVGIxcFBBZlpENFZQbTllSVYyeG5TOXNBaWk5M09l?=
 =?utf-8?B?dHJvSHYwT0pUdFBuckJ0V1F2bmplS0FYUTJkSUpkaWVBQ0R0VHMxaGY2MjlZ?=
 =?utf-8?B?elM3QlA0cFNDNFVmRnNvWnRJdGE2dGhYZXI3cTNKK3ZocUpvY3VpdFluaFFF?=
 =?utf-8?B?d0Ewc3QvUmZZVjdhUUVrM2FjR0dPRjVaUkRJRGV2ZmNXN1hicGI2V3cxT3RH?=
 =?utf-8?B?UllaWjdsWGRuMlRTbHBHZGxnZEtubVJSOUFpcUdSQUVDdEdNV090UVZPS2Z3?=
 =?utf-8?B?UC9tSm9KTkRRS3k1K0JGNzNpNElRcGNFQUJKbmxQWUZnU2lzZmVTUHdacVhX?=
 =?utf-8?B?L3NrWjRTZGdWTExFRHhoMHBmejhqem53MTZvaDNYU1NPZ1IxZ0ludGxlZmtp?=
 =?utf-8?B?bWdWMmE3RFN3TU5FdWtlZzlqaTJNVmRpeTFpWXlJYndSY0VvcHZ3M2I0ZW0x?=
 =?utf-8?B?QVUxZFk5MzVBb3piYTlpL05KWHBvUm0vcmZqbm5NSy9PdjJoajFYY0FCUDQy?=
 =?utf-8?B?OTlYWUJxTlEzcXo1RnN1Ry9NRzZjd0JydWhERzZYMFRsTGszOWY2bCs1QVc4?=
 =?utf-8?B?M2VIQ21jckQ2T0JTUFp0MCthQnN2cWZaSDRXZXg1am9ZQVNwWVNOeWFKYmVt?=
 =?utf-8?B?N09oU1JISk8yZEVTd05TOFdLaDgzSHFvVTduaHRSandyTEJmeUZjVFJ2V1VZ?=
 =?utf-8?B?SU96bU5wRWhBbVpJN0NqLzlFYXpWSHF5ZGVLbGVYRjhLT0VxT1Izc1lZVVdN?=
 =?utf-8?B?THJ5V2pVOWlKczdyREh4amN6cTAyTjhCVy8yRXhNUlJtc3JVWmRVN1VENThR?=
 =?utf-8?B?UDdaOHJJWUR3dXpmK2tnRHdjSXNoMW8xUmhuekN3Mkx0YnA0ZzVlSnNKalpC?=
 =?utf-8?B?S1Z0dWRrd3lhZUFHSEJvcEI3K2hhUnVQWmxOc3J6ZUFFbUtvZEJlbWdmQnkv?=
 =?utf-8?B?VytCUmJvcmxHYzBUNFZLaDg4Vm9xNnZuVGZwclltWlB5WHN1TkY2Vk1FTXZu?=
 =?utf-8?B?djFRQW1rTk5JOVZJOW83SHpJdmpLYytHZjhWdHlDVmxJSzBWRGZHYmlSNThO?=
 =?utf-8?B?cC9SOXNpRUcvSjFndnVmN0ZudUt5dHNEYlpkbDlzOUZPMmhSTkNML2dqZENm?=
 =?utf-8?B?VXhub1YraWFyZ0VwZGZQQkp4TkJVV3duWWlTUkY5VGsyUzhBQmF0UmRTbzFN?=
 =?utf-8?B?K2tEQ1pDWTV4V2JuSlpkdXRKSDNrZWtWMDl2WTc1MEl0MnExbHFYZ0JudUEz?=
 =?utf-8?B?N0JZdHJ3T0dWb0hRWk5Pa2JWV2loRXBNL3pmRHBCdFhCMEd0cXJYZ0Yyak9X?=
 =?utf-8?B?T29pbWdQbmczZDRFVUhLQ08yQ2o2VklEeE9UZlJEZVA4VWh2WUdZTnFHa0Ew?=
 =?utf-8?B?NkdOVDRESkdFUm5iMjZCM2tVWmgydWdDT2RIZzBzTnhhamxSR3U5SHNaWU1Y?=
 =?utf-8?B?dm5Md1lwMUtYNmlCdlFYY0dicHB6RmIva3dMM1F6MTE1S04wc1QxUzQ2MjU5?=
 =?utf-8?Q?hpFqEF?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Q0RRbTZBY1FaVWxVbXlOcktheVBWRjE3NmhLejV2RjNKcWVHYlZyUnpWdnVN?=
 =?utf-8?B?cktoa0NLYWp6RHhyM1E3dE5FT3cwei9JZzZuMmEvZ2MrUGRBQyswaFJnR1V2?=
 =?utf-8?B?SkR5OGsrQVlZWElTTW1NVysrbjdiMFZRdnRpTXFqU3Y3cUFxQkJIeFJpbFZV?=
 =?utf-8?B?VmxncllYZU5MV3hPcFhtOGduSGpvYWJzT3lSME93L1Bmb3FWMDlUd3YzRmxq?=
 =?utf-8?B?dUM2SW1UcnNHTlpMQzRxWDZvYjgwL1F0MHhxTzFnOWNwUURvZXpSR0tBbXdn?=
 =?utf-8?B?N2g5bmFKdWlDQXYrM0VtV21CbTZCOElZRW14UEpteXZiVHBoNklMUDlGY3Vv?=
 =?utf-8?B?dlNPZ0VqMjFtTFVoM0RuRjlXUjNUaXlRRUtBZjFmRXF1Y29lWEQrcGNxUDVT?=
 =?utf-8?B?UlVwQkZJRmVJWkRMaWJQK3U5amdrRmNTeVFqMWYrZ2ZZbGRuNVo2TGxOOWFr?=
 =?utf-8?B?ODdoVDVJbk84TjV6UlgrUXNNWlN3T1ZhczdoYjJNaWkySFhQSUVrWUFVa0FT?=
 =?utf-8?B?c3pGVVZ2WVRCQ3dyZWpJT3d5eTNMbTAwRXUxVUhaWlNhT0VBaml4dTh2bDF6?=
 =?utf-8?B?NWo4RS9XaFdsRXZJRENvcmgrQVRMUFMwa3NNREhTelB2S1pvMHRMaUM5dUto?=
 =?utf-8?B?QmNVeGxFREpsVnVJV3M5N1psQzBpR1ZFQlpUSUtxUFBRb045VzVMMnhNWTVv?=
 =?utf-8?B?WlZURE5heWppWGhKS0JrM1ZHWjlaejZqVFFLVEZzd3o4eFpoNGM3SW9sd3Qy?=
 =?utf-8?B?bHRFaXZCYVdNbXJid3lRT2xzbFVWSjMrTU5aSzhqZlBSbGYvSzBLZDQxbzE5?=
 =?utf-8?B?N0J4NEJBbGIwNGR6dnYralA5WkVtZlRIdTVhUVdCTUFWWkdiYzFIeUV5MVcz?=
 =?utf-8?B?YlVQdFpPNW1sOEJkRzFlVkVrUVRLeHNwWDNXNU1rcm1Kcit3VnhFNW5TT0th?=
 =?utf-8?B?T2hJenNmNjRzR3FjRG1sd3Vkem16QW91YXJkRkQ3YUV2OUN5N0VBWmtWbCtK?=
 =?utf-8?B?anNqblNUK01KSnowNi83R1dVeFIwNWpSMVo0WldoRGRrNjBGczFKdTlONW9X?=
 =?utf-8?B?SUowUzFNZGJ3K1loUE1Sdmx0OHNCWkVXanBJZnZEYjlmUG5IZzFwcEM1aDVQ?=
 =?utf-8?B?S1lDRXJHamdlZHFTajRXdlhpV0kzQmZkUjFCQXUxMTVsay9qYmlaSWVCQURK?=
 =?utf-8?B?QkZjWEU0WnhCYjFsdER6NTlUTUZmZ20rMENtbWtReUJIYWpWWU9JbXkzZmpm?=
 =?utf-8?B?T1hCN3hQYUt4TkRiaTBkWVp3THJuTkd1U09KSlh2MmdwS2RZblZPblJhckhS?=
 =?utf-8?B?cVltcHlvdzR5ZDlET1NlSE8ya2xGbG8xNlRRYWdRTC9IdktWZDRCNjZidkdr?=
 =?utf-8?B?Y1FCNllkRTB1VG5ZOGhXZ0Z4Sk9BZS9ML2V2cmw5Zmg1T0Vmd3o1ZTQrYmJ2?=
 =?utf-8?B?c2N3NlhZOWRVdElhaGRhdGwybEVUcWlTYW0rWVhiN2IyckplWnIrV044RHRM?=
 =?utf-8?B?S05WZWM5LzErWUR5RmVCK1lMYUl0NE9kT0Zob3FnMFZpL1UxUnNkSGZDMUlW?=
 =?utf-8?B?NG9BZUlzcWNSbUJCaHU1d0IxZkNFcStKRHlYK0pRV0ZSRVRPSEFVYVNCYm5o?=
 =?utf-8?B?enYxOUFuMUI5Z3p2ZWZCVWtZQ3JkVUUzYzFINEJ0TnFjUUx5Z0Zjc0hYekQ2?=
 =?utf-8?B?dVE4Y1NQUkVBZ3ZRRlZjRWw2dk9nUGhvVmR4WlFOR3JkWDVMT2tKRlBYRlpv?=
 =?utf-8?B?eTlQVlBtbkVvTEp1RVUveUdpeGljcmhTNnhvS25pWUVqWFN6K1Nld2JncDkw?=
 =?utf-8?B?NWlNSTVzMmlONjlqaFpRbG1zWVBDcG1ZK0NRKzhYWitvR2g3RVdUalFsYUsy?=
 =?utf-8?B?bDMzSU1Ca2JRdU1pb0lHZlA1Qkx4N1ZvZE9jK2wvS0JoU3BIOVN4bG9BRFdt?=
 =?utf-8?B?d25Yb2tWeCtmVFF0SCtWRXNTak1GVjMxY1BPWm5hSi9rdWV3Qk80aGM4bDV0?=
 =?utf-8?B?bFpFRzVYU1o0M3RSR1ZvK3hiTGdvMWZqZjZ3ZUlwZHVZNzRvaEh2THZVRzdy?=
 =?utf-8?B?cVRhc2tibTBjYmVuQUwwamxwMjBNcHFOUldleVd2eStIQ3RrTUd2dDVWbWR6?=
 =?utf-8?B?Nk5yNmpnWlBucE5wTml5Z1NhMnZDY1kwUmRUenJxZjFyUjRFSElaU05zaHhO?=
 =?utf-8?B?V3FOU2dzRDFUQXhEVksyWHlGQ2laM1MwNlNaTGkxYTJHR0tUQ0lvTEJCblVU?=
 =?utf-8?B?SWdPS2M0L01ncktiWisxRG5TSUZEZ0tUbnN6aTg5RE11NXJZNVFSMGFLNXhC?=
 =?utf-8?B?Qld2ODJOSzV4K0VvOXNDbXgyODl2RHJQaERJN0hILzBFWU1paEdXTXVvWXZr?=
 =?utf-8?Q?PWJuYBnMwoMEeBkw=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9090a4e7-4e68-4f69-723f-08de46cd0320
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2025 11:25:47.0683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VP51Y2pgI88dzFgjHnjWFAa6Nekfe89n8npsjSGq6JELJ7LEY0ChemXPiqFCm/BUa9OnfzmbCUOn2gZSyLm0Vt9o72C3XC5K3u11pNBn7gc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7312
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDEwNiBTYWx0ZWRfX6llRkVwKPL1C
 yyPzrdX5Oqaka7p3q/9y5GKnN78FGaV5TRhGuDaKcy2BJGTjz3X2DxgeE5ONClMg6EwqYgYkS++
 jOo/ZqieCg2+iutBhH7ytbGx1MEUI4jzSXNs1AixdPByZQlQzLb7A5bRj0vIIQAPkl38quMfq0z
 YLmx0DNiWfj1X5byBDdYpAHPCVaXlgbVwERguhpikQasE05KDZ2q9QPNg9SMVXIB2jAw4WTC2yK
 50Cp622KGxZAlqhyoiO2Tdk9w4mkkSuJwiWi8/NJzG1HBk1TMRzeDl4hBh2jEKW9rWZib3Q8bQu
 CyeRgV43NWtkcaWg9fLZxS4C5CuCdGh/f74Bx6FuSNhZJcFMLCBIpvsSCNB73NNKyi3HTgnAvsf
 Nh+tdzfarEs7QB2cIUlmjdNVM37/0qzqCy7oxgdLM5uv+Ti0T7AN4kAyxbNz2AWmrAuKE9Q6hWI
 SXVL8gRubkUzawpFmtA==
X-Proofpoint-GUID: M6QL1JkUfYdIVYDMzTFWUt1tfAL7iiOJ
X-Authority-Analysis: v=2.4 cv=OO0qHCaB c=1 sm=1 tr=0 ts=6952653d cx=c_pps
 a=xsj2MuQvL1s4LVRwU0hgyg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8 a=kttUxI2lFKCQ7hC1JXMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: L_IA11dNO6lZO72NfUGOY05vWshxBS-O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_03,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290106
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5BT9QRcX4032974
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Dec 2025 11:25:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228598


On 12/27/2025 8:39 PM, Bruce Ashfield wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Sat, Dec 27, 2025 at 7:33=E2=80=AFAM <Harish.Sadineni@windriver.com>=
 wrote:
>> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>>
>> In sdk while running: 'make prepare' in kernel-source directory after =
enabling rust config,
>> it will throw errors since only makefile is present in rust kernel sou=
rces.
> Can you show exactly how much of the infrastructure is needed for
> make prepare to succeed ? We've gone through a lot of effort over
> the years to not copy whole directories, many which have plenty
> of source code just like the rust directories do.
>
> If we can just copy the Makefiles and Kbuild files + a few elements
> that are needed for regeneration, that is ideal.
Without this patch:

After populating the SDK and sourcing the environment, in the kernel=20
source directory I run 'make rustavailable', then 'make scripts',
and enable Rust support (RUST) in the kernel configuration. When running=20
'make prepare', the build fails.

The failure is due to missing Rust infrastructure. To understand the=20
minimum required set, I attempted to add files incrementally based on=20
the reported errors.
This resulted in the following dependency chain:

Initial failure during make prepare:

RUSTC=C2=A0=C2=A0 L rust/core.o
EXPORTS rust/exports_core_generated.h
make[2]: *** No rule to make target 'rust/bindings/bindings_helper.h',
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 needed by '=
rust/bindings/bindings_generated.rs'.=C2=A0 Stop.

After adding rust/bindings/bindings_helper.h:

make[2]: *** No rule to make target 'rust/bindgen_parameters',
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 needed by '=
rust/bindings/bindings_generated.rs'.=C2=A0 Stop.

After adding rust/bindgen_parameters:

BINDGEN rust/bindings/bindings_generated.rs
make[2]: *** No rule to make target 'rust/helpers/helpers.c',
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 needed by '=
rust/bindings/bindings_helpers_generated.rs'. Stop.

After adding rust/helpers/helpers.c, bindgen fails due to additional C=20
source dependencies:

rust/helpers/helpers.c:10:10: fatal error: 'auxiliary.c' file not found
rust/helpers/helpers.c:11:10: fatal error: 'blk.c' file not found


At this point, it becomes apparent that make prepare continues to pull=20
in further Rust and C source dependencies(chain of dependency is very=20
large),
and in practice ends up requiring most of the Rust infrastructure rather=20
than just a small set of Makefiles or files.

After applying this patch total size of rust directory=C2=A0 is 1.8MB.
> Bruce
>
>> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
>> ---
>>   meta/recipes-kernel/linux/kernel-devsrc.bb | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes=
-kernel/linux/kernel-devsrc.bb
>> index 23a9093ede..1505a1d70c 100644
>> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
>> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
>> @@ -139,6 +139,10 @@ do_install() {
>>           cd ${S}
>>
>>           cp -a scripts $kerneldir/build
>> +
>> +        if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'tr=
ue', 'false', d)}; then
>> +            cp -a rust ${kerneldir}/build
>> +        fi
>>
>>           # for v6.1+ (otherwise we are missing multiple default targe=
ts)
>>           cp -a --parents Kbuild $kerneldir/build 2>/dev/null || :
>> --
>> 2.49.0
>>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

