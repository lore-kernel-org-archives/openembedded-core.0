Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03E88CF58DF
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 20:04:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16525.1763582664534766525
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Nov 2025 12:04:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=C9QIfk84;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3418077aaa=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJBxF001863032
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 12:04:22 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=gcyJxV7/oGKnm92lTgQTOr
	qD8weUMhha2MKQQUKppv8=; b=C9QIfk84pBSAcBzU2DpWrR7fxCOFkQbermidz7
	zxIoYaEN+msizwKn9gO1e5kWKuMKCgWibcwI0q0dgEM7PzI3fjIREVdjd6njTt15
	zWAOz6vAJUVcLA5VX2S5lP4++gTyPe/9x8jPSRkt66J/vNBC71p8QjFcODusv5ek
	FwdBX0R/mONrLWHd2Vw/0h6nGEs+NGaveCmoNdyD3OUvPDjq7/WYshl5d75sqAnL
	8hHHq7WVQ4nShsf9pLIagk4kw3rsi2CZEX0fviTWwbryI4S2ULDJQW10Jbq6ucdK
	JwwveO1QNDJaYuQMcO3Boh4HnLNN2ZUg8tNBUvJPxRVy2e9A==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013051.outbound.protection.outlook.com [40.93.196.51])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aeswjdc5x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 12:04:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v8ZEn5YJX9nwqBumBh3cInQxnEyCHRR47dJ7wYzoROtGib2MWtW/sxGlUrm1FM0OBf5icARNoFrqLBLM6KXs9UhuUwEiqSm73VVRK8KvtPF1VxXAo7O6IX8e2hPbJHGnffSavfzWsHlVCC1nVYyg3eTwA6TJbSyz7kvsYnAHteXqkKWEqQGrkRvHit2ewuhDYXVrbrOwtXL6aIHjGUUm97eaiTUay7x4simsB4xlxXVDGGvLc4xq7T2b55cjeSYTk9NabgJThScnsZJP1bTdXVk7xAxDGWjYGOiRcf2XS0iat2IFejlYQTOoXSNkGig0e8glUYGKba2fKBJ2k0QUzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gcyJxV7/oGKnm92lTgQTOrqD8weUMhha2MKQQUKppv8=;
 b=giosHZZ7nzffyo6r0Ij59B1iMAaOv2Y9pLRxgEXmPh458QG9V67Rc5SeZ9qCtTiza1ylDJjcgzitG203Y48k4eBMpkJfIJFFnhboeqJI0435oeiwlDH6y30NyewR+CSsmAI42GivV4fMyLxOdmQd3iJ6WbQnWC1rl5uG73h+yJhFYIq7RNmVzQkI7SgL818V31xyZosFMBMMfgPAByC9LIt8iGwK376Fu1LANdICHDZfVZw9HD0d9r3OuinUPwtrrTFWJk0QoLa2as39xJ/r6vly74P9dT9EhGaqmNsYjT59+Vjes15bHA7wwxyvnVs3S8lR1VrJmoUVzGZ6ykLT2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by DS7PR11MB6101.namprd11.prod.outlook.com (2603:10b6:8:86::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 20:04:18 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::5627:e3a5:cb26:b555%6]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 20:04:18 +0000
Content-Type: multipart/alternative;
 boundary="------------fkQ0JpR30xI7otntrY41OyHH"
Message-ID: <5130cd4b-ac12-4135-8d19-2b608ed95b7b@windriver.com>
Date: Wed, 19 Nov 2025 15:04:12 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 03/11] rust: install Rust library sources for 'make
 rustavailable' support
To: Harish.Sadineni@windriver.com, openembedded-core@lists.openembedded.org
Cc: bruce.ashfield@gmail.com, Sundeep.Kokkonda@windriver.com,
        yoann.congal@smile.fr, elmehdi.younes@smile.fr
References: <20251119164804.256364-1-Harish.Sadineni@windriver.com>
 <20251119164804.256364-4-Harish.Sadineni@windriver.com>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20251119164804.256364-4-Harish.Sadineni@windriver.com>
X-ClientProxiedBy: FR4P281CA0060.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::20) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|DS7PR11MB6101:EE_
X-MS-Office365-Filtering-Correlation-Id: 321ccd21-bce1-43bc-7064-08de27a6d23c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Ni9mV1JBMThXYlVuVGZ5b0Zab2NSdCsxOGc0bmJTVUFTQnhGb1pVc1UwdHBv?=
 =?utf-8?B?S0pDM3A0RVhDRjIxUmo3OVVGemZDWkk2aGtZd3BSZ3l5MXF2NlY3cjV6cjM5?=
 =?utf-8?B?ZXdBMWVuVEs5dmdKWW43VXB3bC80MVVHd0h0NFhURGlPOEFkVTM5aWJiZ0VQ?=
 =?utf-8?B?VXNWVFBYM3ZyMm1LWXpYY1JCL25GZE9XR01qSnRKQmRzc2M1TmYxZUNsOWhx?=
 =?utf-8?B?cy9UbmRhL3VSQzRPQmVETjlkd3RidVNZU0xKbzZHVnFxR0E3YklyWGFsOXZZ?=
 =?utf-8?B?MG5MOEI0OGNkeFZNeCtGRnhKc1RtL2FHV204YjVwdVFtNS9qL2w4dlQ3aEpV?=
 =?utf-8?B?eEM3bVE5NHlXSXRQc0Z6Ni9UYUczWDVrYzJmVGo1SzZiWWVIVEFrRVlXZVBS?=
 =?utf-8?B?Q2NTZzlSSm5qSWM4d2RBRFIzM2RlSmN6bUlLcGR3aFNIRklHblhXNTN3S1gy?=
 =?utf-8?B?a2VNTEo2YVYyb3dYays3OFVPQUUxOHkzMCtPeHhXSXZmNHYyNXFwb1I5ajVr?=
 =?utf-8?B?MmV4MDRwSHZ3Z2c2ZE5OdGlOanhyMWNtbTJLZ0orQzZZWmwwVllEOFlwWElM?=
 =?utf-8?B?aVNUQTJhL2dTUWxDby9ESVg4c0tLZ2NJZ3g1T0ZtSEg5OG14ckxUanhzNWtt?=
 =?utf-8?B?MkhFQk95WDhJRXJVQXJLV1NOOFRNOG51c3lXV0JLQUk4ejdVMjl4NWVHalR1?=
 =?utf-8?B?YzBaN2gzVmdTUmo4ZEhHSXhVMjJrWm9kUzJDNnZZdmRQVU40WTBodnh0OWF0?=
 =?utf-8?B?a3JSeCtIZnpnK0VXM3h6V2RtSHA5MXR0a2lWVDdIRzNTaWgwU3MrakkwNmky?=
 =?utf-8?B?enV5by9DRlF2NWtJdnJzeUZNeVM0b29DZ3hKM1JvQis4RWN2V2J2d1QxUTlX?=
 =?utf-8?B?TnVYSEUzdXgwSjNVejJkT3U5eFFVZVRrVGZxSjBOMXFxb0xMSXN3THBUQWVJ?=
 =?utf-8?B?NVJQYTR1eFRaRXo1VFdIZjNkeHNxTytRMjVEUlZNa0hZS0dxVEhrQk5aUUFs?=
 =?utf-8?B?dXRUeG5mOHluQ3JVcythbjRjSCtVWmY2ZFBmejB3LzljUGhUQXZIeHE5cnhS?=
 =?utf-8?B?RlBsTnZKTmExUmNVRFpVT0R3dDNVa3ZxVGF6Q3RGVUNXRmt0bEZRajVCU1pX?=
 =?utf-8?B?THcyWnRlT3hOR3NsSVJTVmVseEdBdlBTVDFJWURFbFJIcWlTSW5nRURLR0lq?=
 =?utf-8?B?dk50eDQ4TnU0UHFMWUhBdjV4cHBXYWloMHM0VEZ2K0pRL0ZXRXlhcVl0Q0h1?=
 =?utf-8?B?SVBZT3Y3cXp2blF6SExjRFk2SW9aTkxhTVphQTl0RXA5WVRVbS9mWUo1azRq?=
 =?utf-8?B?WndoTnNyZFMzOHZBaUV3NFhyV25UVHg2OHcrZ05FMUs5eExTYkJUMVA0ZzQx?=
 =?utf-8?B?OUxWS01zQkJJOExJQnliM1I2QzJ2S2w4enA3Z1ZTMkhIV04xZU0vNWY3S1BN?=
 =?utf-8?B?VHJJRTZhVEpVdGZqN0dPcFdzT3JwZ2V6VDFkMVR4NWVsNkdPZC9BbFcxdTdR?=
 =?utf-8?B?WmQyUmRyQ09oMkMxV0dzTTVaZ0RSV3REdEp5STRuK29UYW4xUEdSS1pSWU1p?=
 =?utf-8?B?M0hwMitLdWlaMjAzdFgra2JwaGprbkE2L3kzQ2FpWkFsZUVwc1BrRjh0YXBh?=
 =?utf-8?B?TjB5WTlBdDhrU0VvQ0dQQ1JVanUrZ3F0VW5zWWllNnFPNW1mNmJubm1RZFZt?=
 =?utf-8?B?UW9UaE5MRE5acFVMY1FGZGxscXVUcWNScS9rRXNmZzAxcmk5VFNPdGNOS1BU?=
 =?utf-8?B?WVErV2x4VlpBSFVhWUt4Si9LcDM0YmJONmhlU2tYak85QjJuSCtld3I3M3Mr?=
 =?utf-8?B?eEJjQUJxeStsb3pmcmFENGduMUtqckV3Yk9wSUVsQ1RUb0RKWGRaRU9TYWxS?=
 =?utf-8?B?eGlVVTAzR05VM2JBaWVzTnZycjliQVJPNWVmeTBKNmprTnFPUlZiZGc1OG5Y?=
 =?utf-8?B?R0dyYjdiUnNZU2ZaQnJmVnlEYWxMa3dGaFN3VWdqUnhmQnRkTUMyczJUaGg1?=
 =?utf-8?B?VWpDRS9UTVdnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YXU1TXNYTzlkcDJyOFFqbTkvUEtqWHBLc3RGcEJ5bHJmRWVzYWxkV1BMd2V1?=
 =?utf-8?B?anowblNjM2FtQ3F4SzBQNFB1NDBJdXBNZUs4a0lxbkp2dW9iRnFSQllWSGhG?=
 =?utf-8?B?VGdITGJiVEpKVWloMldyMnBQWURDSnVBMHU5OU5ZUU1ibjhiV0Vlam8vcitM?=
 =?utf-8?B?Z3NFMDZSeGNJa205MXBHdVVkbGJMMUtNaXlhdS9vMmhRRFFTTkhPZ1NETzFN?=
 =?utf-8?B?RDFQVDlsNGVaN3NvMlpsTWFLYlV6TkUvN2JqZmYrVGlVNnpvcE5WMlQ4Q25Q?=
 =?utf-8?B?VlNXL2xlRE5PT1pIZU5rS2Fwdmd1NzYwSjB3cnpodnluZGJIY0dZaFJMaWdS?=
 =?utf-8?B?S3VSV040T3VEZGNRRDd2U3BQZnMyRnlyckJMb0YzMndSaitmUWtWZis4WGha?=
 =?utf-8?B?OWdFZEd4OG9XMSt6SEZFanpmcWtWdnpUTUxzTEwzOE50Sno4S3ZzSG9vV2Iz?=
 =?utf-8?B?eUpsVU9iaHl2eXBWVmgrTm1BK1Z4Y1pnMGpwOWkvMlloaTFVN0ZqTkhabC9Z?=
 =?utf-8?B?NlBzU244aWVQanlIRkhNOGtiMTE1TnZ6bnN5RlpTYml2TWNTYld3QUdEdzNX?=
 =?utf-8?B?a2tBaFpvclFHWmVEeGtkQVZkeEJEM2tGOGJpcFdlVnRaK0xxNXFwVisrcVdy?=
 =?utf-8?B?RE4ydzkvUEljZS9pa3Vma2R1bTQ2S0N6UTdaZ3RHSjdrY0ZKcmZGWEZ3UlFs?=
 =?utf-8?B?bGZXL1JOQnN6Y3lEM2hRTFRRZGI2VkY4UEszRG1yNVM1RGg1NjRtSFo2alJv?=
 =?utf-8?B?UnVUcVhadDBON0R0cHpKRFlVWHBSSWNTby9peTVoTUdHV0R4Rytsa3lybnRM?=
 =?utf-8?B?QnVOQ2s1dlpUclFCS09IUldQS201NHJwMHhwTHJYWW9DVGVGOThhMkhGRFFU?=
 =?utf-8?B?cWMxZEtLT2s1ZE4wa3UvTjVHNGhrQXd1eXl2Z1ZKTDF3YkZQaWZiS2swNlBv?=
 =?utf-8?B?cVQ1TkVBeEdNMmc1ejJBeHBrK2VHMTNMeVEvRU5HdWpxZkdRejhTU0FLS0JC?=
 =?utf-8?B?SjJwc08vdXpsQlNGcDhhR1RqcU96SGZjaEpCZjcraGVtNmpPSUUvTThtbzFU?=
 =?utf-8?B?K290TVhKTkxpcm91cVlWYXBWTnJHODZBN1JxOEJrTGJLc0VIMVhxZTk1QnJk?=
 =?utf-8?B?Wm9xUFJQRmU4Wk9mSUlGRnNycDVQc2VXZkM4VTNSVmVUUFFVMFkrNnA4L29Y?=
 =?utf-8?B?SUJHNEg1V2JvdzltTDJNMURKbGNMc3J4b05qazVnbXliTTcwMGMrazZGa3Vn?=
 =?utf-8?B?akZJVzZhZGp5OXFhcUdtTWFkMnVzRmpJQUliVEhVTlY0V2NrYmorUGlGUG05?=
 =?utf-8?B?NCtZNElnL09FVG1HcDhMcnhFVTZNWHVOaEJIZDhaUVdQVmtUNVJqdFBIRmxq?=
 =?utf-8?B?bm5IRjBuYWlTT1VuUFBDSVdNSktaOHFiRk91VUNpeW1GOG11RWhIZnhiTlpW?=
 =?utf-8?B?SXFaWGlERXpWUHh1L0YwVEllTU1HdGFEZ1FBSVNzdmRDSHdPRCtGT1pPYmo3?=
 =?utf-8?B?WEM1L1p5cjRxd2hLbnNtSlNRSnhpdmIwb3ZDRER4Rnoyb200ai83UFBZbmlN?=
 =?utf-8?B?Y0tETEFsR1AyY2NiaHdTdWNTVnlUd0N2U01QODVLTHllMXdtZGpwajlISUZ0?=
 =?utf-8?B?c1llT1pGdXBLd01CcFQ5d3RiU25FMnpKWk1Ddlo3RTRxMW9LWFFKeEE1Ti9S?=
 =?utf-8?B?L1dtWllLUUpLYUxpK1AzTnZqTmdSMEcvaUJUUUx1TjRyV2c1ME02ZVVVbU1u?=
 =?utf-8?B?YkRmTG1OVVBKeklLOU9nbGxaeEZ0RC8yK0U1a1lzMnplcXN2bTN3VzFBd0l3?=
 =?utf-8?B?cWZaZWxwekQ5Mjg4QU5KdEN3TjhRMzJOcHFXM2MrSW11aEd0VGdTQWk5eDVq?=
 =?utf-8?B?cDFMVXZienhZVmpxdmhqR1JzajdjUTBDQXpLN21SZWlUMFQrVXBMOTd6TTlI?=
 =?utf-8?B?RHhFZGk1RGJNck5nRXo4bXMyOE04ZnFSWkU1cXFXTTNqWXJJOWtLYzFzdnl3?=
 =?utf-8?B?SkhPWE1IYXpHRWwrVXBTdUhZemsxc2NQb0phL3ArS0pBQ091d1JGcWFmajh4?=
 =?utf-8?B?YytxR2k0UFV3V1Uxd2w4akpKUXlIc21yYUVMWldvOFQ2c2FSWlpyVTJsUEI1?=
 =?utf-8?B?NG9zOFo1bnZiMGNteWd1cGtES1FwMEdKWWpVTVhjcW5tTWZiOVNNbGw3RDR6?=
 =?utf-8?B?ZEE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 321ccd21-bce1-43bc-7064-08de27a6d23c
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 20:04:18.0819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sMDtxRkLLCApGjm/ZEQ9zTFhHovgsYJRzAI5NBEPwhqIlgftxEuFcPLyCgpInNQXdL2DyHlcqEGaKcXXJvpYXi/dbfnHiWHLyJYe0K45CvU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6101
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=BqiQAIX5 c=1 sm=1 tr=0 ts=691e22c6 cx=c_pps
 a=021mb8W6rIxzgUEI7A/+3A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=np4rsjI1tSqgjkOyRyYA:9 a=QEXdDO2ut3YA:10
 a=QeMy5WPdU9dpobuweN8A:9 a=ZuO1YYvkTjEHw8_T:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 8zDoSjunFvaDLM8YMApKnb7Ljujwz2Ys
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDE1NyBTYWx0ZWRfX57D6PNEa2N+s
 h3SZtkinEmhCTZAK9NLtdNJ6nVda9YHrQMoc9wo2/eFXEE2WfHPyWQrPE8OMufVVae3QN3xpdQD
 PUEHCZzWueMuSZwgRA7qoSr4LiRfOhR1FHWc+qOPp6jbCoXKN7Ye0hSImO5XhnO267FSyDuYr8Q
 s24B/yU2i9/Yd2akoYRiCsW1U9LPEdh/VMigaoUc1DqUM2zu9PvoATVekG0gWSeek9+Kdl8gZTG
 2TUtdgKogKqRk86ptDuItZ9mcDvztplg16at1iRfom/WWfQMw6zfb53vkCrdxAJfyH255u/6pfk
 +atBhR2vDw8++Nl32Qw5XvdJ1yya5Oowc2CjYDA9IXvmjAS3Vvnrzd9j71WK/+TJTfuszsY4KNO
 pkJf2TSd/ba/0+VIjE5wIsjdF45uSQ==
X-Proofpoint-ORIG-GUID: B7mScFTSUM4bUhwo8u6yFQ8G2qlyspTC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_06,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190157
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 20:04:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226586

--------------fkQ0JpR30xI7otntrY41OyHH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-11-19 11:47 a.m., Harish.Sadineni@windriver.com wrote:
> From: Harish Sadineni<Harish.Sadineni@windriver.com>
>
> The `make rustavailable` process expects the Rust standard library source files (e.g., `lib.rs`)
Help kernel newbies by saying:

The `make rustavailable` process (1) expects the Rust standard library source files (e.g., `lib.rs`)


and then in the footer:

1) See the kernel tree for Documentation/rust/quick-start.rst in the section: Requirements: Building

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/rust/quick-start.rst#n145


../Randy

>
> to be present in the `library/` directory under `rustlib/src/rust/`.
>
> This patch ensures the required sources are available by:
> - Copying the `library/` directory from the Rust source tree into `${TMPDIR}/work-shared/rust`
>    during the snapshot setup.
> - Installing the `library/` directory into `${SDKPATHNATIVE}/usr/lib/rustlib/src/rust` for the
>    `nativesdk` class, making them available in them available in sdk
>
> Signed-off-by: Harish Sadineni<Harish.Sadineni@windriver.com>
> ---
>   meta/recipes-devtools/rust/rust_1.90.0.bb | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
>
> diff --git a/meta/recipes-devtools/rust/rust_1.90.0.bb b/meta/recipes-devtools/rust/rust_1.90.0.bb
> index e7f3985332..f4cd2b923e 100644
> --- a/meta/recipes-devtools/rust/rust_1.90.0.bb
> +++ b/meta/recipes-devtools/rust/rust_1.90.0.bb
> @@ -63,6 +63,16 @@ do_rust_setup_snapshot () {
>           done
>       fi
>   }
> +
> +do_rust_setup_snapshot:append:class-native () {
> +   if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'true', 'false', d)}; then
> +         if [ ! -d "${TMPDIR}/work-shared/rust" ]; then
> +                mkdir -p ${TMPDIR}/work-shared/rust
> +                cp -r ${RUSTSRC}/library ${TMPDIR}/work-shared/rust/.
> +         fi
> +   fi
> +}
> +
>   addtask rust_setup_snapshot after do_unpack before do_configure
>   addtask do_test_compile after do_configure do_rust_gen_targets
>   do_rust_setup_snapshot[dirs] += "${WORKDIR}/rust-snapshot"
> @@ -314,6 +324,13 @@ rust_do_install:class-nativesdk() {
>   	export CARGO_TARGET_${RUST_HOST_TRIPLE}_RUNNER="\$OECORE_NATIVE_SYSROOT/lib/${SDKLOADER}"
>   	export CC_$RUST_HOST_CC="${CCACHE}${HOST_PREFIX}gcc"
>   	EOF
> +
> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'true', 'false', d)}; then
> +           if [ ! -d ${D}${SDKPATHNATIVE}/usr/lib/rustlib/src/rust ]; then
> +                mkdir -p ${D}${SDKPATHNATIVE}/usr/lib/rustlib/src/rust
> +                cp -r --no-preserve=ownership  ${S}/library ${D}${SDKPATHNATIVE}/usr/lib/rustlib/src/rust/
> +           fi
> +    fi
>   }
>   
>   FILES:${PN} += "${base_prefix}/environment-setup.d"


-- 
# Randy MacLeod
# Wind River Linux

--------------fkQ0JpR30xI7otntrY41OyHH
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2025-11-19 11:47 a.m.,
      <a class="moz-txt-link-abbreviated" href="mailto:Harish.Sadineni@windriver.com">Harish.Sadineni@windriver.com</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20251119164804.256364-4-Harish.Sadineni@windriver.com">
      <pre wrap="" class="moz-quote-pre">From: Harish Sadineni <a class="moz-txt-link-rfc2396E" href="mailto:Harish.Sadineni@windriver.com">&lt;Harish.Sadineni@windriver.com&gt;</a>

The `make rustavailable` process expects the Rust standard library source files (e.g., `lib.rs`)</pre>
    </blockquote>
    Help kernel newbies by saying:<br>
    <pre wrap="" class="moz-quote-pre">The `make rustavailable` process (1) expects the Rust standard library source files (e.g., `lib.rs`)


and then in the footer:

1) See the kernel tree for Documentation/rust/quick-start.rst in the section: Requirements: Building

<a class="moz-txt-link-freetext" href="https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/rust/quick-start.rst#n145">https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/rust/quick-start.rst#n145</a>


../Randy

</pre>
    <blockquote type="cite" cite="mid:20251119164804.256364-4-Harish.Sadineni@windriver.com">
      <pre wrap="" class="moz-quote-pre">

to be present in the `library/` directory under `rustlib/src/rust/`.

This patch ensures the required sources are available by:
- Copying the `library/` directory from the Rust source tree into `${TMPDIR}/work-shared/rust`
  during the snapshot setup.
- Installing the `library/` directory into `${SDKPATHNATIVE}/usr/lib/rustlib/src/rust` for the
  `nativesdk` class, making them available in them available in sdk

Signed-off-by: Harish Sadineni <a class="moz-txt-link-rfc2396E" href="mailto:Harish.Sadineni@windriver.com">&lt;Harish.Sadineni@windriver.com&gt;</a>
---
 meta/recipes-devtools/rust/rust_1.90.0.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta/recipes-devtools/rust/rust_1.90.0.bb b/meta/recipes-devtools/rust/rust_1.90.0.bb
index e7f3985332..f4cd2b923e 100644
--- a/meta/recipes-devtools/rust/rust_1.90.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.90.0.bb
@@ -63,6 +63,16 @@ do_rust_setup_snapshot () {
         done
     fi
 }
+
+do_rust_setup_snapshot:append:class-native () {
+   if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'true', 'false', d)}; then
+         if [ ! -d &quot;${TMPDIR}/work-shared/rust&quot; ]; then
+                mkdir -p ${TMPDIR}/work-shared/rust
+                cp -r ${RUSTSRC}/library ${TMPDIR}/work-shared/rust/.
+         fi
+   fi
+}
+
 addtask rust_setup_snapshot after do_unpack before do_configure
 addtask do_test_compile after do_configure do_rust_gen_targets
 do_rust_setup_snapshot[dirs] += &quot;${WORKDIR}/rust-snapshot&quot;
@@ -314,6 +324,13 @@ rust_do_install:class-nativesdk() {
 	export CARGO_TARGET_${RUST_HOST_TRIPLE}_RUNNER=&quot;\$OECORE_NATIVE_SYSROOT/lib/${SDKLOADER}&quot;
 	export CC_$RUST_HOST_CC=&quot;${CCACHE}${HOST_PREFIX}gcc&quot;
 	EOF
+    
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'true', 'false', d)}; then
+           if [ ! -d ${D}${SDKPATHNATIVE}/usr/lib/rustlib/src/rust ]; then
+                mkdir -p ${D}${SDKPATHNATIVE}/usr/lib/rustlib/src/rust
+                cp -r --no-preserve=ownership  ${S}/library ${D}${SDKPATHNATIVE}/usr/lib/rustlib/src/rust/
+           fi
+    fi
 }
 
 FILES:${PN} += &quot;${base_prefix}/environment-setup.d&quot;
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------fkQ0JpR30xI7otntrY41OyHH--

