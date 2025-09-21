Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 198FACAC59A
	for <webhook@archiver.kernel.org>; Sun, 21 Sep 2025 15:16:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.31045.1758467756402365514
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Sep 2025 08:15:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=FiKfUrA3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1359713421=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58LF7uiH3121158
	for <openembedded-core@lists.openembedded.org>; Sun, 21 Sep 2025 08:15:56 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=E9FPEgnRyRQMtHBadnR91WQVoEx6CcGHVK+z/B6wtUg=; b=
	FiKfUrA32HsVaFCUcwHM/xj42cVtoljOhgbzGbORkvSF0u9wj5nU4uuy9KuNZlrX
	D6OQl46zefHkIA+6KbdnQcbRthOqsVaRTczAcP5z1zvGT5P/85pYOM4nHRgQP00v
	Ak6bhA+X5W3twV1qeoNukgW/5+wEzSWj76FCmWbV4V2/SkA4GssevoeDhZgfRO4n
	OcYKNVYV5FfUlYu+MpJgO3PVYC5HEUjdvglGHyX6NKmPKSXeQ5Bk3CeVFe6Zoss5
	FLZJd81orxKRoUZ1gYPMSsiYrXUvLQHl6mCPF1OWx9VHmyZ04LhLeqF4paRBzddl
	Andea+vB9VB6y1xMPVobiw==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011014.outbound.protection.outlook.com [52.101.62.14])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 499qj2rugf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 21 Sep 2025 08:15:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B54tP9JcHVLpEHtIyu9nUyKAPQwlXIS05B4Lb0pGwOvuXY8FnGqcspLcgu3ilyuLW/aRxOuuBSf+aV8o46m5i1Vc2UVSZsHN8DgQl+3xIWZoZ+z1JxYkHOA53Igod2ENtbCLB/K5mZRW5mxOe78W7VG7ed62bF+yF14GpawITQ2T+jN7ofTwYsaYesx5gsJO3ESBz/1WqRurzMfCjKtUj/BOuxNR2FoA07vPiI033s7MVi3s4BpPPAFRgLARhgwBJBggp3SO4NcZLhCxliJjr266GaMz9ba7vG30OYGPAIogrXcGR3K9zcc5PCDzW2up/a0EJbRZriSfqZEd+VsMhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E9FPEgnRyRQMtHBadnR91WQVoEx6CcGHVK+z/B6wtUg=;
 b=L+OnF6gWYJPGYXKl/Tueu36fcubT9XoNnu1Zpb32cVC3I4WTcHzwcHsi6KKqrXRW8/7EhRos9+ZZ+hMi0BRe9+/WMOJ5FL5RM47EZ0n+VMmmVggjnvpVjjX9RncrCxa8KzdhwG7Y20SIqiWlpYntva8voVIkfQ8pRVmm2qEN06xVp3hhkAOLXbO+ZAc54ZljBQZZhB9hKie6Ds5rwNT9JkGZTP703dFbXNIglxhSFTHn6AdqHnsD6JwUxhNohi2FzmXdeEwbyOkFIdhKtiZAa1+bqYzotkf7s8mgyuVxDffYDYFvbwSTd9C7d5R1Z9r4PUpmIYshj75JZ1sF2P46dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by SA1PR11MB5876.namprd11.prod.outlook.com (2603:10b6:806:22a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.16; Sun, 21 Sep
 2025 15:15:53 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d%5]) with mapi id 15.20.9137.018; Sun, 21 Sep 2025
 15:15:53 +0000
Message-ID: <61af5d98-8e79-47c8-92c1-ea93fb221838@windriver.com>
Date: Sun, 21 Sep 2025 23:15:46 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/1] openssl: 3.4.2 -> 3.5.2
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <cover.1758250424.git.liezhi.yang@windriver.com>
 <c33930b39db477506067200c5c4f19cec0079b95.1758250424.git.liezhi.yang@windriver.com>
 <CANNYZj8_iTg7ukB=Zhimh5cDuUKs520AojDta3UyM7jDHFscNQ@mail.gmail.com>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <CANNYZj8_iTg7ukB=Zhimh5cDuUKs520AojDta3UyM7jDHFscNQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0018.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::7) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|SA1PR11MB5876:EE_
X-MS-Office365-Filtering-Correlation-Id: 9983dddb-78b3-45a7-ab4d-08ddf921c169
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NHVpYnpGY2NjRU1RVWE1SldoVENRRVdLaUxIb1VCQkx6VVBwL2pZVXJNbzNE?=
 =?utf-8?B?TVMzd3VZVnBNRVNPRUdvK3RTbC9zbUFkTWdRNEhQVmIvNkNxRldPNUo5U0ZE?=
 =?utf-8?B?aEFoM0dSSU15REV3TDBHQ3BMVFg1dUVoL1gzT0Nyb2lPb1hOS2tCUkRQQldo?=
 =?utf-8?B?ZjBHU2FJZndTSHM2d25jcEZXb0lhV0ZmS1RSanE0UGhJVlk0WWVsaFdlaHAx?=
 =?utf-8?B?S1p2M2ljRFdlb0N1UWhUUUNOWVBPWjk1S1BOKzV1VUFHV1lISXZEclVBbE8v?=
 =?utf-8?B?dFBUdnBRQ1B5ZVQrUytaU09uOEdUakczUy9GdStoa1ZpaldGQ0ZsdWczTEU5?=
 =?utf-8?B?TWRqTXJUQ2lrVmZydnY4UUtFYU1RUzdyNGRBSDlORVp1ZU9TcDB0T21ocE1r?=
 =?utf-8?B?dEZPS3FOVmtDL0JvajFnOTVpUmhSUUVBWlYvSmR2V2ZrMmwrelBNWXNoR2RR?=
 =?utf-8?B?Y05rL2RLUHBUWEhJcnF5V1FCZXJlWUVwVE5VRHFmYzM3RE0zeEI3T0I2ak5i?=
 =?utf-8?B?bFI2YmhaM1E4b3B1Y1FiNWFxUmVJZVZ2WUV5djRzZ2pCbklDYSs1ajNab2Jw?=
 =?utf-8?B?bUJQVmtiOWkrZ3FpNTZrVWJUMkJ3bjJ3dmo2aVRza0h6aFZuck4ydmRlSkFw?=
 =?utf-8?B?SlJ4bzNYSFIzbWo5bFBmWFU1amdIaXRYUjd3S2ZRbjZZQ0pNeW1icUJlL1FJ?=
 =?utf-8?B?YmplVUMreEUzUHQzVmZ4ZVdSRXZwV1c1K1N6aWhlMWsrUHhySHdPM091bjRY?=
 =?utf-8?B?QSs4Tjl6V05namRHakY4WEswOXl0bktxR080cW9uSG5vUWRMZUJoMTdvdXpy?=
 =?utf-8?B?amw2MkUzenZFWERpTi9Gc0VNOXhSQUNmaHRwYXZaRy9QUnpUc04xaXJFd0pH?=
 =?utf-8?B?MlhMTFFMdjRzNWhOazIwL0tkbHVsZklCR0hqK2RRM1ZyQVNPN2VNaS95S3Qr?=
 =?utf-8?B?Z0pRWEtTRlkzM2tSSXFKUTFpYjZmMFpaRzRoOE0vbWFqN0YyQ3lCK3hGelNv?=
 =?utf-8?B?WFlEenZ2MXNONXlWaDJRbHU1bzhLK2hma3hrUWt1NnFWbFI1YVNVcU45OWNS?=
 =?utf-8?B?VXEyUHRSSkFHZy9ucGlJTENBMEtOTkhYSDUwOEZZWDNyT3lqVFhLSUM1Um4w?=
 =?utf-8?B?SnBJbTR3ZDdhYlpMRFFKaG5JcGdTRWozWlBkVjdPSzRzVHBzYlYzTDJpd0tS?=
 =?utf-8?B?S0l4ZjF2N29EMjNrRGVxQVFqVDlKUWxXelliQVJScmowUjB3YXh5U0ZLcDRk?=
 =?utf-8?B?UWZobk4xQ2lZNm44RFpjcWJqZW9kVlJKWFJwV3ptMm11RjFTbHM0blJyUzZj?=
 =?utf-8?B?MTM1WTVRZUR4WDdueHFVd0dXbms3c3dKRGZBR1NtTmdZRlk1eUZnODVGcWhu?=
 =?utf-8?B?d2U2OWJIeGt4R0hjUDVQRkRGdy81akQvejl0OEZkbHd0WU03QTZrM1ZtQ2VU?=
 =?utf-8?B?YlN4ZVRhRDQ1RzhpUlhBaSsrdkoza2tRUFd0YWc4ejZPZTJQamFMS3o0RC9W?=
 =?utf-8?B?THJ2Q3p1YnhvY3BMSHlOTWJHcDl3NXBKNkpRSUhTN2FGR2JtdHhYODVaaE5T?=
 =?utf-8?B?QXg4SXJrczd1eUdCSjc1MDFNS2d3M3VNanlPeEpSUWZCVUtZcFBtQjFSRTdp?=
 =?utf-8?B?SGpMeTM0WXEvc3Z0QklMb2J6S1I3NXpDYkdnN3BnellRSSt1b3hib0xFOXAr?=
 =?utf-8?B?WmIrQmFiZTNBMTQvNGdBOXVKZTNaNk5Mc0xyMGxFY01QbWh1c2hzZnNWS05B?=
 =?utf-8?B?THpPVHRzQ25XS3BnUjVYTkowSmlPVjJpRnFmR2xIeTRYRTBBN0RnNzlxbXVS?=
 =?utf-8?B?SnVsV0R4L2l1Nm9WTjdJdDkwR0FOMXRoUUJsTzFoczAvaDRJUkVhVER3MHlE?=
 =?utf-8?B?a0x1UGgwbXN3NmwyTzNQTy9XN1Z1a3hyQXYrQkVKM0h2VVE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eEUrMmlvczFJR1VUY0d5S1pQSE5QV3d6V25LYUl2QlowblpVclFmWFlQYmtT?=
 =?utf-8?B?Zm5wTkw5dHBUVUJRYSt4V1d2UEs3VzZsKzhQeFJOdHJiVk4ybzJycjc0eVJw?=
 =?utf-8?B?eVJBMmt5M2xYaWUwRUJCbWVOc082ekdZbVJ0cGt6MWNwV2E5YmJLTmRRZVhs?=
 =?utf-8?B?R1dKaG0rT1RiSktiUXc0aFArNjVYazRwMU4rTFBVWlpiMElRTGtvVlJPSmZh?=
 =?utf-8?B?YXRNQ0ZBc2Z4WTBxY1JFalp1UkljRDBPQUZjUDA5SU56ditVbE1RanRGYVNm?=
 =?utf-8?B?UnR0LzdDVXkwVmVmV1dHTGxOODAraVRVZmF5MmREeXhUaW0xdGcrTXUzdC9v?=
 =?utf-8?B?YnRTU3ovd3I3NGRKWDRxdDM2TGpWbUszR3pJRC8vbWlsWGRBbGVoaXZrRVdT?=
 =?utf-8?B?WnoxZGZCTEJ1elZiN0t2aTNyVDMwS3FwdlhZTzg5dEwrRTRZb2w2dHhxZm1L?=
 =?utf-8?B?TGk2ckhPclZXTkJ5YkFVNnZ1bExyeHZVOURNVDZmRGxOR0ZtWk8wMEt4TTg1?=
 =?utf-8?B?bDhpQS9LczZEVDJXQWJPMndoY0dNc0VVVzY4M2xPNjY3YW9KSlRiTnlpcUt6?=
 =?utf-8?B?WGZ2MnkwM2hIZllLaGJmU0kweURLZTRxMlYzZlp4ZFFFOHlrazJjZlF1endm?=
 =?utf-8?B?dENyaWFxLzN5UHZaTTlLcmV3ZXBCSnpBNzRPbVZUQllhSmFWWnhKNjBSRHNY?=
 =?utf-8?B?ajlCY0c0eU5Hc0FNcTNhOUtRZ0lHM25vQ1dQUUhjTWR5VDk5VEFPN0dIWExD?=
 =?utf-8?B?RE81YkNJTXdkUlRYYkpNYUpXZEl6cnppYmFXV2w0T2s3UXZpOVBUOW41VGlR?=
 =?utf-8?B?U1lSTEdKTnBnMEZ3YXNPV25Sajl4cVlyZ1ZIUkZUVjFvMHpYMTQzaW1aNzBQ?=
 =?utf-8?B?cFV5STh0ODVEeVAyeHRkNEt6NVBmRzlFR25HVm5oektmOHpGNHhYSWZMQ1Qy?=
 =?utf-8?B?UWt6VXdzK2Q2OUdTbUozVEwzZllQQWxHUHpobXJjb3ZYdUVVWmpVVWx2MlBQ?=
 =?utf-8?B?QmpmQnRyOHg2YUZlZW5OSEY3YWRoV3BISnVtem1TZkx0aGF2R1lmWHJYYm5N?=
 =?utf-8?B?NllOVk5iZUJ3cW53N0crVUdPSExnMWUvbTBCaE42SHNlS2NwTDRMVER6SWVE?=
 =?utf-8?B?dVRJVWVkZ2lRL09kODBMSGhlWWlaeGdleGd4MmlxU29lOEN6TDlwdWNNeHc2?=
 =?utf-8?B?WWFtWjk2T2FnN2pQcGJzNDRTM2d3YnB2ZzhDTERSTGNXa3kxalpqK1VhLzNn?=
 =?utf-8?B?cnhaMXRYVTdaOE9sODFVSHljbC9oWjJqWnA3ZWQ4blMxemFqUUVmc3ZESGJp?=
 =?utf-8?B?OGRBbE1Hb2FveVlkTFJpS055bENyNzNNQ28yekVUcWJTWFZpNU9zbjNRMS9q?=
 =?utf-8?B?aEpXakZrRnFwMlA3TlFmcU1oWXVha2g1Tk9zZEx6ZE52a01GMStqalRNZkJv?=
 =?utf-8?B?SFpQRjcvSDJrUDRFZWtuT0ZNRXU3Z3hROXBCaUxLR1U2YlkyMFkrUmFIdHNH?=
 =?utf-8?B?bXl6dnJCaGZGNk4zbEtqb1M1MEtDSnYyWHVCUWxSM3diejVlZlcxWVFDSWhp?=
 =?utf-8?B?YUp6V1hhbGgrY0pZRTJTY3grTGt4Wjl3aUlNa29ZcmE0MkxTd1hkVkJiUWlU?=
 =?utf-8?B?citjTjNFbzZFUGpDSEpQaC9CVXhXeEFMMFFWdmQ4a2hiUUJTQ01aZXZRTnJW?=
 =?utf-8?B?dUVJd0FJWXorQkZ0c0NBUEkwNjN1U0VnczhFaVowQ281eGkrdUJZVTJNT1hm?=
 =?utf-8?B?K1p6M2p2SVBzakMvVGpVKzZpMzRkWWpMWW14RjNCaHVoZW83NGNhSFJheTVh?=
 =?utf-8?B?S1lUWEZ2Qlk3d2NNM3NHSFNKQjJHai91dDlsMXhIQmQ2Z1NwL1pIMklhb1pZ?=
 =?utf-8?B?S1owdTJlOTBzR0VyYnNTS1hiVUlTTTlzMkRneW1YeEFpTGJUUzRmRWlMVlV5?=
 =?utf-8?B?MkwyNUVIUldpaWVkUHhPcWpHVjc3OXNJWTJhUVRDUmg2OVZJRWZtMDcrSE4r?=
 =?utf-8?B?cklETWFjaGI0bG1VbEZkT1JoSml1NFZWSXprTTJJd2F2YTF6cDZ1cyt4YTdX?=
 =?utf-8?B?eGcydkdvbVhodEtDVmlFa0pVTWV5Uko1bGtXR3FncDZFM3p6d1VDdnlDTUNC?=
 =?utf-8?B?MGdxRnVGa2puOGlXblhVOEJNN2s0cGtyWEVTdXFqZWdOakJ1OFh6RTdpQWU3?=
 =?utf-8?B?cEE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9983dddb-78b3-45a7-ab4d-08ddf921c169
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2025 15:15:53.4108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /1YbbNr0rNI/8Rjir9nxDO64BgrDaB81m0GorsC3JS4UeUzxh6+B/qDyBJs4DDYMRB/yW31JMHtaDGfG5ib6coLBm/3+3HV61sPQcHZV3Nw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5876
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIxMDE1NyBTYWx0ZWRfX2ctbtB43e4r6
 vGwItbY7ansY+xqM6zCipKaWYoG9ojaVyE8a8ZuHRxbsknFUMLkG6LMCkhy21+NAWGCVKy9090u
 F3VL2wn/hp+pt75xj7hxj9PbzFwWxA47eTeQ+oOoBRJcFrw5BZ4icAiCPIpcwam4L111PcEESFH
 vuatmheOj14GNuvFMgmWJxso20sRg7WmuYutx0NYYJ3UBO1QhaHSAOxMSgmpXdluWIF1tKZVelj
 V15dPWfKUJt6diCpmvlEphE+Bk/K+BI+xwR+X7S+sTjY7EJQTk+2n/0l6qSk1zfAaS8walTs1bJ
 bAv4qFnlu7vFLl22M1/r5NJVH3MdRFtxud36SieAylJaWVKBa0CdDk73vTLRdk=
X-Authority-Analysis: v=2.4 cv=btpMBFai c=1 sm=1 tr=0 ts=68d016ac cx=c_pps
 a=yA2OuHN0nunLSqluPLsRVQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=Q4-j1AaZAAAA:8
 a=nrB0nObPknLobnaIPmAA:9 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: _xBssc9VERrWDIIYE0Vl5hoBKMBoD8r1
X-Proofpoint-ORIG-GUID: 2yY-gTTnyvkwrbzx0Dm4g9J8NYmn2MjI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-21_04,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 phishscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Sep 2025 15:16:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223800

Hi Alex,

On 9/19/25 18:21, Alexander Kanavin wrote:
> On Fri, 19 Sept 2025 at 04:55, Robert Yang via lists.openembedded.org
> <liezhi.yang=windriver.com@lists.openembedded.org> wrote:
>> The benefit of OpenSSL 3.5 is that it is an LTS supported to 2030, which can
>> save the maintenance time in the long run.
> 
> Yes, and it also add new features, breaking the promise the project
> makes to its users.
> 
> This update cannot be done without TSC approval. You need to get that first.

This has been talked on TSC, but not approved yet, so I sent the patch out.

// Robert

> 
> Alex


