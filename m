Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E912BC19F32
	for <webhook@archiver.kernel.org>; Fri, 28 Feb 2025 02:56:55 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.7566.1740711413636540822
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Feb 2025 18:56:53 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4154f24240=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51S2W9lm015741
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Feb 2025 02:56:52 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4533xa81c6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Feb 2025 02:56:52 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51S2uqJM018423;
	Fri, 28 Feb 2025 02:56:52 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2044.outbound.protection.outlook.com [104.47.73.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4533xa81c5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Feb 2025 02:56:51 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yd94KtKOg5zBP/LvFymDwVzdEoVc79XKrXqYIraOABypKHt6VlGfsh4ghuE9wiMna47za5zHNw/+sJt8YnmMbfCLwRxMRgm8C0nntsZ43SHW9CECBmP6G8vUNHDX3hzZgaabdAbmyrItY8iba2VwvZKZRrqubs14xO3OdjnUsHz6oLRgimatE7Vd86YvAWwF8Jz2Yq/8u63+gdg9eu6b1S5q4cqXT45HB6yCh41FTVVbGMx495hPyZoX1uUCWKF1K56PAyqhn46Xlws52hR3aOzhj5bob8H/qrzY41pE58PzIjSvpTQTFVT8PpvVhNpkd/oFLh2xXmMYw+rpY/7h+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ouxl7azqxT/my7UnnI9J48xBGMyCEhZ7NQMlLrRdsN0=;
 b=jVzG6AaCuaXXGaeNgLiiNMdJJxAkh6JXp1wDBM8Hx/AW+xZD7Djm/ww9dTOEVXewa0iBz82/FZyPX3bUC8BY2d4LvkCgirXvlGkWAF3QuA+R2YTUIXV2f0PLEcaxeJRQTozVlIX8uHIS91KfMeLAje81GDnZRDvd+hWnmPqywb4im5/CVeRqtTo2sRuftRVbseWdowKypf7PEbsgRXCkK+jWEDy5FgluympSB7YTL5b3WftaZByZuQffv4/RaBMsUelCExNBg4jPFpNiWZNHTZd/WQwMv9adCsnV0pR0+mj/cBGrur6iIEkAFpGNkWpUljCn40UYqoszEbNAGgWk/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by CH2PR11MB8780.namprd11.prod.outlook.com (2603:10b6:610:284::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Fri, 28 Feb
 2025 02:56:47 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%5]) with mapi id 15.20.8466.016; Fri, 28 Feb 2025
 02:56:47 +0000
Content-Type: multipart/alternative;
 boundary="------------QPPtbwwQNSKBbb9ap01Twk8I"
Message-ID: <d20d233c-08c0-490b-927a-fbfc6d4d2383@windriver.com>
Date: Fri, 28 Feb 2025 10:56:41 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] Revert "python3-ctypes: depend on ldconfig only
 if distro-feature set"
To: =?UTF-8?Q?J=C3=B6rg_Sommer?= <joerg.sommer@navimatix.de>,
        Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
References: <20250220035724.1460062-1-changqing.li@windriver.com>
 <nvmjowjub7hxr4wz4njvcwdi5mo2g4ppiixrsdgr5zrqs3dwch@mrwc5mgkqid4>
 <23e2fa72-4225-4dfd-8d5b-cd8afe03b411@windriver.com>
 <sozxs6figgef2mhn3bkcr2z7vy3u3idrrq4gkgzmxbibiiih4t@aoqiqffittgi>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <sozxs6figgef2mhn3bkcr2z7vy3u3idrrq4gkgzmxbibiiih4t@aoqiqffittgi>
X-ClientProxiedBy: TYCP286CA0052.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::13) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|CH2PR11MB8780:EE_
X-MS-Office365-Filtering-Correlation-Id: 03a58757-5e92-4a8b-a059-08dd57a38a4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Y3BSS3l2bHRpcHR5b3BXU0cwUlA5cFdsNlhCRzZCRGhJRFlzcU1uNHFsK0V2?=
 =?utf-8?B?UDNzeDVkb244cytvQUNydzg5Rm83MjNLZ052NmFiVExxS2tTV0lxcUowOEh6?=
 =?utf-8?B?emYyUVo5RklsN0ZuQ2ZLdUtmTHU0ZnAzaGp4MzQzUTBGa2JCMkNmNDJzakFB?=
 =?utf-8?B?RDAwdzN2WWIxMWRlanZtd2VpOHYvZ1lpQjBWNjMyQnBzQzJYN3pLc3NhUy9U?=
 =?utf-8?B?VE50cmptVDNiTWdWeUdnU3d2VlBNSm4wTmtSMC9DSFVTallQcHhEOUQ0aHdL?=
 =?utf-8?B?cnp4WmJkRyszdGtWQVZPY0NpRGszSFZ6cXYrT1ZFV1VJM1d4UEFkUS9ScnVX?=
 =?utf-8?B?ZjdnK3FCT2toS2o4REhrMnVuRzNDV3RiWGR5d3VBanlIbnVCWm80WUJ0UVNR?=
 =?utf-8?B?ZG91bzRFaDFIeWxIN05qVGJvUUFYUWYvTndtUEs2RVUxWnZHZzZjd3kvSCtT?=
 =?utf-8?B?eWRKUCtpcm91WEVoS3RCYnRRVW9VSnZYV1haOVFSZW5lSjBsSVdseU1FeUph?=
 =?utf-8?B?czgvbW1OY21YOVZUMWZnRlpyRE8rdldMdllSeUJ2TFZWSDB0R1VUbmlXUGVw?=
 =?utf-8?B?eVdBekZKcmVMTFJzSEdzSzRHYXpIWkZIbHBKcEo3eUo1TzZRZGdhZFlrc1h1?=
 =?utf-8?B?NFE3YVVPRjVEMXA0K0VvMGhEd1FoZ24rRkdKSGxsbVR6VENVb1dnY2J5RVNS?=
 =?utf-8?B?OVJDWldpS1l6TWNjb0dZMUszeXFEUGRRUTYyQkxOUkxrNDc4RklTUUVBOEpV?=
 =?utf-8?B?ZWJXRWk3ejh0azRGMSttanFsbHo5c3RKSWQwU1BGblFXTHpEeFJzditoa3JK?=
 =?utf-8?B?S3FFV2NoTGVyNTBGczA0OW9KMmd0V1JKMi85U3NLd3FsNmFiU0I1NlhUY3Q1?=
 =?utf-8?B?TzdxVkNlUkZUUWxpNFNFdnBVYzFLUWtZdDZ2aytoTDZoL0lIVEtUYVBzR2tI?=
 =?utf-8?B?SUJPZktsQ1EvZHFSOER2WXloSFFtTHVJWmFuMzQ2WjBOR2M4MG8zK2g2UGRH?=
 =?utf-8?B?OHNYTW9DVHM1N2d2RE1wbmh2TnNYTzBkTVNQTVFvN2Y1aEVwVUp0ellQUGFw?=
 =?utf-8?B?b2Z6aklpY0hQNGNWS2ZNcDJkMHdzdmZlNGt0SXNLYXpmNUtEUTkyUGZIemxF?=
 =?utf-8?B?SzdYWG5Sb1NHeUlCZ0xUdnoyQnkyaWl3Tnd1dDNxRko5ajJWOW1WSXA2Wk9X?=
 =?utf-8?B?Z0JPQnJBZ014K3dSQVg4ako2SVVDeDBSeFpkMzJUTUxhOGJZMDZScGtseHJ6?=
 =?utf-8?B?a3I0VlE2T0NjY1BuQXF1V1RVY1k1ajhIam5wMU9nVFBBZ2pqZDQyNVZpNzJL?=
 =?utf-8?B?TlVFOGM5WFZKNzlYc29vRDJjeGZ6SndwRE5SRzNwUmZyY3JJZ1kvUFNXQzhy?=
 =?utf-8?B?bjdtaEd0ZElEQUxzZk1wN1BjSEgxQnhDd2pQbWtLb3BwTFdZNElrSmRGQmNX?=
 =?utf-8?B?UTNWU2k2dWRZTVBiTkU2U2UvMnQ4eEJCTTBjSVRNaC9vZlcvcFB5cmsvWjUx?=
 =?utf-8?B?VnlzUG83dzZWQVNjNjFaVXNIdWtkSHNZSHJJV283QUpIaTNFY3VPOFo1c0lo?=
 =?utf-8?B?a3pQdlJ6M2J5U2swMy9kOEZRcXBweG1OazZDbVZGb2tmQ3d5VWMrWUdUNDVu?=
 =?utf-8?B?cFVKYU9xT0dkQVFjeGtqTFp4WEVGaUVheGdpTnJYR2JDeTc1NE5mN0RDOUlt?=
 =?utf-8?B?dWhiVXovQVgxUUU0M0RoTWhPMlZWWGJ6VDZHQWZZbzV4ODlhR3VlSXJsNHho?=
 =?utf-8?B?M1p2S3dGNmZJU1pVU3dpSEszTSs0a3JueUdZUWtTbHhsaEF2RkhRTUR2OXVF?=
 =?utf-8?B?S0N0dHgzNGRnaGpKL0I0dz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZngrbERLVEdGT1pobkhXYXUxcXdkSDllTTYxN2owT2s5aUdmdkViWG5JWlNE?=
 =?utf-8?B?RC9nMHI1eEZ5TTFrdlRYaEpjcGR2ODhxOThHc0RzWUtYRDBLTzNKVTY4S05w?=
 =?utf-8?B?WWpaREF2ZU9VQzFycHd5a2NRTGRDaFJmbEVSaWRvQ0F6QWMxakZPeitKY3hr?=
 =?utf-8?B?Uy9BMzJjZWRVLzJkTFF3Y3RwaDg0SENDaGkxOUNFUEx1V3pYNTFENVZMckdu?=
 =?utf-8?B?THJWbW1Zc2hKSW5OZk93blVoRDA1ZTdaSWhkalpqMm03RWk4dHpZYkMvMkM5?=
 =?utf-8?B?VHpLczRLWVVNVzk2UFROU1VxQzFjRVpHRDgwbjFKbkU4cFJRME9Ya3ZOdHky?=
 =?utf-8?B?cUVMU3AwZ0lORE5ubkx4d0JwN2lyQ1k0eU5PY0tDSnNzeGJMdklJV3pROGor?=
 =?utf-8?B?Tno5bE1xSG9nbTBlR1lmSll6K3lWd3NkWk56anpEcXc5UFZiRThEd3hlclJp?=
 =?utf-8?B?dkVubjBqaGxoSmxueE91WGJwOFI3U1dUVVNVdk1MT0F6bHNQMUNNOVo0L3Qv?=
 =?utf-8?B?aStKUGt5V0swbTFYV3VaZ0t4WGxUQU5NVXBQRDNmb0VpK29PeG9DQTg5WlZB?=
 =?utf-8?B?bmVLRlRQV3ZVNGxhMzhhdk9udndPdTlXVmd4d0pVTnQzNk9IdUtUUFd2V3NN?=
 =?utf-8?B?c3E2b2p1REUxWi9FQ3I5UGdGTlN1VW56Qi95eURPOExZU1pibWlHemtSV2VD?=
 =?utf-8?B?WGcvdGdmaG1zR1pQa1ZyUkNTc09uQnZkSGxlS3phdkZIRm1tUlVtQlpJZi9C?=
 =?utf-8?B?SzZ3WXkwR0poazlNdU0xNHNKZGN0TGY4NE1hYitiOE0zRUVaTWxwMTN0cE1k?=
 =?utf-8?B?NzdGQXE2MmY5dGpnYWVDd3B1LzdIMXk2MFZjeGRxREZvN1JNTzZvWlcyNTVz?=
 =?utf-8?B?enpLM0Q2Q2FFS2k2dXhtRG1FZlFVMThOMndkVlQ5Q2ZmSjRnS085b1loUGF1?=
 =?utf-8?B?N1gvUGFnN0pkeUgwS2RZVlFQelZCUlQ5aUU3T0dNaThjTk13eG5rSlhqeXRy?=
 =?utf-8?B?TjRHRzF0Q3BvMWI2U3RpRTJOSEFpZnlQQTl4SDU3RG1uK3ZkMzluSU5sMm8r?=
 =?utf-8?B?d1V4QWllV0lsSGxhSVFJVXQ0UnNlUzlnb2pDTTFDZk9PZ3VUN0tmTjFLTDV3?=
 =?utf-8?B?N1ZrUkFsN3RGeGpOenpmS2tTUTRlUXd6L3k1dWREQVJZRTRvT1dkUUlTT3Za?=
 =?utf-8?B?TWYrM2ZNUzBsWTFVTEx5aUFYT2FSWUN4dkpteWZUSnRuNUdGRzlmUW81Sjlk?=
 =?utf-8?B?OUZkZERKcWp2UlNXRTRoNXVuLzgrOWJhWXRNY1RYdG9ZQWVJY2NpWjV3RE5H?=
 =?utf-8?B?R1lJSTAzR3BFcUNXbW1LTWl3Y1l6T2laQWk1ZklmblU4QktncWlpbUttZ1B2?=
 =?utf-8?B?ZmFXdE9WMDdTNXhFbkZobzgycW96MmxGUnk2NVB5TGhjZ2Z1TEJoNW82MExY?=
 =?utf-8?B?QUsxTWJTOHRYaThjcUpaNWl0M2wydzlJTjZnT245ZWpsK2V6MElPYnNKOXdB?=
 =?utf-8?B?d1VMU2pOQVRSRklQY244UFU4OHBzVWN3YldoM205TDMxUUxEUVpQWXM0ckgx?=
 =?utf-8?B?aGg3TmUyZVRqNHZMaE1OS0l5UmZGclJtL3k2blllRmYyWXYzTUJudFNpcjZq?=
 =?utf-8?B?cDRMaUU0V3c5Z2RGNEdpMUVwZ3BiUnZ2ZWxNdURFeTRBSFJWRXB6QzYvanla?=
 =?utf-8?B?cDZDMGg4YlVLUFpBdkx5WFJENU53c04xdzdxTDJsNGhsb0NoSkFkZDNZUmh5?=
 =?utf-8?B?ZmpQUjlNUGNkS0owWithTkRrckkxbnRST0pQMUp3c244SHowLzF0b0FqMXVT?=
 =?utf-8?B?MjNjUlpPeEJabXUzSlJzR1E3Uk9RQ2h3WkNuOFZRQ2VOVktuTzJNazFONlBm?=
 =?utf-8?B?ZDhrcjRPckRyRXRKZWV0N2RwYjZReEptTndZVGcvc0hOUWNTaGREU1Zrem5S?=
 =?utf-8?B?WVRXdzdDNjhHMFhlRldIa0VSTnFjMGZMYm00dW1jcXpncDRXYlJxZnlydlN6?=
 =?utf-8?B?QWdEQlcveTNad0MrbWNsMFV4M2RkdHJ4Nk9PbEFLMlI0SWR2QmgxQVdIYzhZ?=
 =?utf-8?B?L1BuRVFibUFJSFY5b1Awc2tNR29qNytiVEVTR3JqRTdyWU1NTFpqN1JCNVk3?=
 =?utf-8?B?R0lBbENnRm1STmxoZjdRa0xhUTZNVFpWOWxFdGY4QWVzMUV4K1ZLUE9hWmlK?=
 =?utf-8?B?bmc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03a58757-5e92-4a8b-a059-08dd57a38a4f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 02:56:46.9761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SitiqIYgMdPqxLp516Bucqk8h6d3Tk5m3TN929Muuhy9Sr4JWrUytAzkB/CBQ1JZYeB9XLyIuZzYIuyohpeQfdhYEqBgWfRoaGOogMFc/RU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8780
X-Authority-Analysis: v=2.4 cv=b75I4sGx c=1 sm=1 tr=0 ts=67c125f4 cx=c_pps a=coA4Samo6CBVwaisclppwQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8
 a=l_88qD64AAAA:8 a=Z40U_OuD_i2Zf3AHJ40A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=XcwGy2eOlZMA:10 a=9rZr2YRNBOWqsuKE2nwA:9 a=P19l3ke6FZegZTE2:21 a=_W_S_7VecoQA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=sgQlBcfP8EIGAiSWe9Wv:22
X-Proofpoint-ORIG-GUID: ZrEuN0tttKylu0AerDCfOmVc37lCAypU
X-Proofpoint-GUID: YlNLCUU4eJcCCNhKoyCJ7hwLXqajIWs4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_08,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 mlxlogscore=999 spamscore=0 mlxscore=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502280020
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Feb 2025 02:56:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212046

--------------QPPtbwwQNSKBbb9ap01Twk8I
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 51S2W9lm015741


On 2/28/25 06:32, J=C3=B6rg Sommer wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> Changqing Li schrieb am Di 25. Feb, 10:02 (+0800):
>> On 2/25/25 07:36, J=C3=B6rg Sommer wrote:
>>> CAUTION: This email comes from a non Wind River email account!
>>> Do not click links or open attachments unless you recognize the sende=
r and know the content is safe.
>>>
>>> Changqing Li via lists.openembedded.org schrieb am Do 20. Feb, 11:57 =
(+0800):
>>>> The reverted commit causes regression when ldconfig not in
>>>> DISTRO_FEATURES, before, without ldconfig in DISTRO_FEATURES,
>>>> ctypes.util.find_library(name) can find the lib if it is installed,
>>> Hello Changqing Li,
>>>
>>> Did I understand correctly that gtk+3 was found before, indent of ldc=
onfig
>>> was in der DISTRO_FEATURES? But after the change, if fails.
>>>
>>> Where is libgdk installed? In /usr/lib or somewhere else?
>> Hi,
>>
>> libgtk is under /usr/lib. See:
>>
>> root@qemux86-64:~# ldconfig -p | grep gtk-3
>>
>> libgtk-3.so.0 (libc6,x86-64) =3D> /usr/lib/libgtk-3.so.0
>>
>> root@qemux86-64:~# python3
>>
>> Python 3.13.2 (main, Feb 4 2025, 14:51:09) [GCC 14.2.0] on linux Type
>> "help", "copyright", "credits" or "license" for more information.
>>
>>>>> from ctypes.util import find_library
>>>>> find_library('gtk-3')
>>   'libgtk-3.so.0'
> I have reverted your patch and this works:
>
> ```
> root@qemux86-64:~# python3 -c 'from ctypes.util import find_library; pr=
int(find_library("m"))'
> libm.so.6
> root@qemux86-64:~# python3 -c 'from ctypes.util import find_library; pr=
int(find_library("gtk-3"))'
> libgtk-3.so.0
>
> root@qemux86-64:~# ldconfig --version
> ldconfig (GNU libc) 2.41
> Copyright (C) 2024 Free Software Foundation, Inc.
> This is free software; see the source for copying conditions.  There is=
 NO
> warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURP=
OSE.
> Written by Andreas Jaeger.
> ```
>
> Here are my settings from local.conf:
>
> ```
> EXTRA_IMAGE_FEATURES +=3D "\
>      allow-empty-password allow-root-login empty-root-password \
>      ssh-server-openssh tools-debug \
> "
>
> INIT_MANAGER =3D "systemd"
> DISTRO_FEATURES:append =3D " usrmerge"
> IMAGE_INSTALL:append =3D " conserver-ptest"
> PACKAGECONFIG:append:pn-systemd =3D " coredump"
>
> IMAGE_INSTALL:append =3D " python3-ctypes gtk+3"
>
> MACHINE ??=3D "qemux86-64"
> DISTRO ??=3D "poky"
> ```
>
> I have used poky with 40b5f61a8f and the revert and meta-openembedded w=
ith
> 0b83551ff2.

This works because poky have ldconfig in DISTRO_FEATURES by default,=20
https://git.yoctoproject.org/poky/tree/meta/conf/bitbake.conf#n933

if remove ldconfig from DISTRO_FEATURES in local.conf, it will not work.

>> For the case that ldconfig is NOT in DISTRO_FEATURES, gtk+3 can be fou=
nd.
>> After commit "python3-ctypes: depend on ldconfig only if distro-featur=
e set"
>> is merged,
>>
>> ldconfig is not installed, so ctypes.util.find_library cannot found gt=
k+3.
> You can also install ld or gcc. But if you prefer ldconfig, you should =
set
> this DISTRO_FEATURES. It's like x11 support, if you want it you have to=
 set
> the feature.

ctypes.util.find_library need ldconfig or ld or gcc to work. No matter=20
what the DISTRO_FEATURES is, we should make a package at least work once=20
it is installed.

python3-ctypes need rdepend at least one of ld, ldconfig, gcc, it should=20
be a hard dependency.

certainly=EF=BC=8Cit doesn't have to be ldconfig.=C2=A0 I am not sure dep=
ends on=20
binutils or gcc it better, since binutils and gcc are more big packges.

>
> Quotinghttps://docs.yoctoproject.org/ref-manual/features.html:
>
> | ldconfig: Include support for ldconfig and ld.so.conf on the target.
>
>
> @Mathieu: I think you should revert the commit 0df1318e5c, because it p=
ulls
> in ldconfig even it is unselected in DISTRO_FEATURES. It leaves no way =
to
> build without ldconfig (what was the intend of my commit).

when ldconfig is disabled in DISTRO_FEATURES, if we don't want ldconfig=20
be pulled in, how about just not install the package that depend on=20
ldconfig, eg: python3-ctypes.

if revert my commit, and ldconfig is disabled in DISTRO_FEATURES, and=20
python3-ctype is installed, ctypes.util.find_library will not work.

I tried with my commit in oe-core, and=20
DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D "ldconfig" in local.conf:

boot core-image-minimal, ldconfig is not pulled.

root@qemux86-64:~# ldconfig --version -sh: ldconfig: command not found=20
root@qemux86-64:~#

Regards

Changqing

>
>
> Kind regards, J=C3=B6rg
>
> --
> Navimatix GmbH           T: 03641 - 327 99 0
> Tatzendpromenade 2       F: 03641 - 526 306
> 07745 Jenawww.navimatix.de
>
> Gesch=C3=A4ftsf=C3=BChrer: Steffen Sp=C3=A4the, Jan Rommeley
> Registergericht: Amtsgericht Jena, HRB 501480
--------------QPPtbwwQNSKBbb9ap01Twk8I
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 51S2W9lm015741

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body text=3D"#000000" bgcolor=3D"#cceed0">
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 2/28/25 06:32, J=C3=B6rg Sommer wro=
te:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:sozxs6figgef2mhn3bkcr2z7vy3u3id=
rrq4gkgzmxbibiiih4t@aoqiqffittgi">
      <pre class=3D"moz-quote-pre" wrap=3D"">CAUTION: This email comes fr=
om a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

Changqing Li schrieb am Di 25. Feb, 10:02 (+0800):
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">On 2/25/25 07:36, J=C3=B6r=
g Sommer wrote:
</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">CAUTION: This email come=
s from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

Changqing Li via lists.openembedded.org schrieb am Do 20. Feb, 11:57 (+08=
00):
</pre>
          <blockquote type=3D"cite">
            <pre class=3D"moz-quote-pre" wrap=3D"">The reverted commit ca=
uses regression when ldconfig not in
DISTRO_FEATURES, before, without ldconfig in DISTRO_FEATURES,
ctypes.util.find_library(name) can find the lib if it is installed,
</pre>
          </blockquote>
          <pre class=3D"moz-quote-pre" wrap=3D"">Hello Changqing Li,

Did I understand correctly that gtk+3 was found before, indent of ldconfi=
g
was in der DISTRO_FEATURES? But after the change, if fails.

Where is libgdk installed? In /usr/lib or somewhere else?
</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">
Hi,

libgtk is under /usr/lib. See:

root@qemux86-64:~# ldconfig -p | grep gtk-3

libgtk-3.so.0 (libc6,x86-64) =3D&gt; /usr/lib/libgtk-3.so.0

root@qemux86-64:~# python3

Python 3.13.2 (main, Feb 4 2025, 14:51:09) [GCC 14.2.0] on linux Type
&quot;help&quot;, &quot;copyright&quot;, &quot;credits&quot; or &quot;lic=
ense&quot; for more information.

</pre>
        <blockquote type=3D"cite">
          <blockquote type=3D"cite">
            <blockquote type=3D"cite">
              <pre class=3D"moz-quote-pre" wrap=3D"">from ctypes.util imp=
ort find_library
</pre>
            </blockquote>
          </blockquote>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">
</pre>
        <blockquote type=3D"cite">
          <blockquote type=3D"cite">
            <blockquote type=3D"cite">
              <pre class=3D"moz-quote-pre" wrap=3D"">find_library('gtk-3'=
)
</pre>
            </blockquote>
          </blockquote>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">
 'libgtk-3.so.0'
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
I have reverted your patch and this works:

```
root@qemux86-64:~# python3 -c 'from ctypes.util import find_library; prin=
t(find_library(&quot;m&quot;))'
libm.so.6
root@qemux86-64:~# python3 -c 'from ctypes.util import find_library; prin=
t(find_library(&quot;gtk-3&quot;))'
libgtk-3.so.0

root@qemux86-64:~# ldconfig --version
ldconfig (GNU libc) 2.41
Copyright (C) 2024 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is N=
O
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOS=
E.
Written by Andreas Jaeger.
```

Here are my settings from local.conf:

```
EXTRA_IMAGE_FEATURES +=3D &quot;\
    allow-empty-password allow-root-login empty-root-password \
    ssh-server-openssh tools-debug \
&quot;

INIT_MANAGER =3D &quot;systemd&quot;
DISTRO_FEATURES:append =3D &quot; usrmerge&quot;
IMAGE_INSTALL:append =3D &quot; conserver-ptest&quot;
PACKAGECONFIG:append:pn-systemd =3D &quot; coredump&quot;

IMAGE_INSTALL:append =3D &quot; python3-ctypes gtk+3&quot;

MACHINE ??=3D &quot;qemux86-64&quot;
DISTRO ??=3D &quot;poky&quot;
```

I have used poky with 40b5f61a8f and the revert and meta-openembedded wit=
h
0b83551ff2.</pre>
    </blockquote>
    <p>This works because poky have ldconfig in <span style=3D"white-spac=
e: pre-wrap">DISTRO_FEATURES by default, <a class=3D"moz-txt-link-freetex=
t" href=3D"https://git.yoctoproject.org/poky/tree/meta/conf/bitbake.conf#=
n933">https://git.yoctoproject.org/poky/tree/meta/conf/bitbake.conf#n933<=
/a></span></p>
    <p><span style=3D"white-space: pre-wrap">if  remove ldconfig from </s=
pan><span style=3D"white-space: pre-wrap">DISTRO_FEATURES in local.conf, =
 it will not work.</span></p>
    <blockquote type=3D"cite" cite=3D"mid:sozxs6figgef2mhn3bkcr2z7vy3u3id=
rrq4gkgzmxbibiiih4t@aoqiqffittgi">
      <pre class=3D"moz-quote-pre" wrap=3D"">
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">For the case that ldconfig=
 is NOT in DISTRO_FEATURES, gtk+3 can be found.
After commit &quot;python3-ctypes: depend on ldconfig only if distro-feat=
ure set&quot;
is merged,

ldconfig is not installed, so ctypes.util.find_library cannot found gtk+3.
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
You can also install ld or gcc. But if you prefer ldconfig, you should se=
t
this DISTRO_FEATURES. It's like x11 support, if you want it you have to s=
et
the feature.</pre>
    </blockquote>
    <pre class=3D"moz-quote-pre" wrap=3D""></pre>
    <p><span style=3D"white-space: pre-wrap">ctypes.util.find_library  ne=
ed ldconfig or ld or gcc to work.  </span><span style=3D"white-space: pre=
-wrap">No matter what the </span><span style=3D"white-space: pre-wrap">DI=
STRO_FEATURES is,  we should make a package at least work once it is inst=
alled. </span></p>
    <p><span style=3D"white-space: pre-wrap">python3-ctypes need rdepend =
at least one of ld, ldconfig, gcc, it should be a hard dependency. </span=
><span class=3D"HwtZe" lang=3D"en"><span class=3D"jCAhz ChMk0b"><span cla=
ss=3D"ryNqvb"><br>
          </span></span></span></p>
    <p><span class=3D"HwtZe" lang=3D"en"><span class=3D"jCAhz ChMk0b"><sp=
an class=3D"ryNqvb">certainly=EF=BC=8Cit doesn't have to be ldconfig.&nbs=
p; I
            am not sure depends on binutils or gcc it better, since </spa=
n></span></span><span class=3D"HwtZe" lang=3D"en"><span class=3D"jCAhz Ch=
Mk0b"><span class=3D"ryNqvb">binutils and gcc are more big packges.</span=
></span></span></p>
    <blockquote type=3D"cite" cite=3D"mid:sozxs6figgef2mhn3bkcr2z7vy3u3id=
rrq4gkgzmxbibiiih4t@aoqiqffittgi">
      <pre class=3D"moz-quote-pre" wrap=3D"">

Quoting <a class=3D"moz-txt-link-freetext" href=3D"https://docs.yoctoproj=
ect.org/ref-manual/features.html">https://docs.yoctoproject.org/ref-manua=
l/features.html</a>:

| ldconfig: Include support for ldconfig and ld.so.conf on the target.


@Mathieu: I think you should revert the commit 0df1318e5c, because it pul=
ls
in ldconfig even it is unselected in DISTRO_FEATURES. It leaves no way to
build without ldconfig (what was the intend of my commit).</pre>
    </blockquote>
    <p><span style=3D"white-space: pre-wrap">when ldconfig is disabled in=
 </span><span style=3D"white-space: pre-wrap">DISTRO_FEATURES,  if we don=
't want ldconfig be pulled in,  how about just not install the package th=
at depend on ldconfig,  eg:  python3-ctypes.</span></p>
    <p><span style=3D"white-space: pre-wrap">if revert my commit,  and ld=
config is disabled in </span><span style=3D"white-space: pre-wrap"></span=
><span style=3D"white-space: pre-wrap">DISTRO_FEATURES,  and python3-ctyp=
e is installed,  </span><span style=3D"white-space: pre-wrap">ctypes.util=
.find_library will not work.</span></p>
    <p><span style=3D"white-space: pre-wrap">
</span></p>
    <p><span style=3D"white-space: pre-wrap">I tried with my commit in oe=
-core,  and  DISTRO_FEATURES_BACKFILL_CONSIDERED +=3D &quot;ldconfig&quot=
; in local.conf: </span></p>
    <p><span style=3D"white-space: pre-wrap">boot core-image-minimal, ldc=
onfig is not pulled.</span></p>
    <p><span style=3D"white-space: pre-wrap">root@qemux86-64:~# ldconfig =
--version
-sh: ldconfig: command not found
root@qemux86-64:~#</span></p>
    <p><span style=3D"white-space: pre-wrap">
</span></p>
    <p><span style=3D"white-space: pre-wrap">Regards</span></p>
    <p><span style=3D"white-space: pre-wrap">Changqing
</span></p>
    <blockquote type=3D"cite" cite=3D"mid:sozxs6figgef2mhn3bkcr2z7vy3u3id=
rrq4gkgzmxbibiiih4t@aoqiqffittgi">
      <pre class=3D"moz-quote-pre" wrap=3D"">


Kind regards, J=C3=B6rg

--
Navimatix GmbH           T: 03641 - 327 99 0
Tatzendpromenade 2       F: 03641 - 526 306
07745 Jena               <a class=3D"moz-txt-link-abbreviated" href=3D"ht=
tp://www.navimatix.de">www.navimatix.de</a>

Gesch=C3=A4ftsf=C3=BChrer: Steffen Sp=C3=A4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480
</pre>
    </blockquote>
  </body>
</html>

--------------QPPtbwwQNSKBbb9ap01Twk8I--

