Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9376CD5BC9
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 10:08:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17199.1779876530609729834
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 May 2026 03:08:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=lplKNVOF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=96079a5f83=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8kh9M2712903
	for <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 03:08:50 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=7/Gh4kfVvH6RKHSDJ1MITT
	SK+OK3bGxoGGa912fKXbQ=; b=lplKNVOFy/sM7uDeUqdS7sCN/W9V8WzX4mxmUy
	yRVX3enU3cDeoOsV/I9C2xpFsOVGW0WTdde8uoLShGN3OJnf1uRI33B9g+6xOTlc
	yWyyEAmCpqqlBOrc0b71wOFhxi+MfKMsnDrrs8/iNBgURoYz1GoI1V0BDPckhFk2
	zkjEyh+uRIypVBuAG9LuZ6zwMwp+EJ8tJ8Bc7GL5id6VyItGutnsMTXJRpFEzMSl
	UGSlBV7mn9qL6h9bYp8LAaRVy3u4SV0xdo0+bYg3ngLDIO1V4yfdHkgDHiYSfvTz
	ax2xOe6AUsCuTzrCUCFBM7bRm8RnnwoVE2HsVeyZ7EMGxo3w==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013054.outbound.protection.outlook.com [40.93.201.54])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4eb7h1weh9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 27 May 2026 03:08:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rc42z83OTFnRVmj50GFEuXf+F7O7RCJfaIb94kgkTLoQZ/UV/qyF2XQ7R7V+rVjpr65hP9hRZvee95OnJyAHQYUU0ydUgVXiboz0D1qjN3noO7wVsaKbb8UFq5TNDVQ1MNdnwfgX+txqI3w4iEFWV/o4SAva2Ox9x8cRyoDKduJr5eW9XMfxx5RQhz+06rQcqPZmaBW4H6s5IqDxGULifYOQ7Svoe5yvcbaB2k5w5K/j4NI+9X176lPNFmA3HDhN0lDrDdSswtovEwfhbO7GG9lVwmUW30sHjDOH5SRHB6wXNMP9HVh69DrfUdIFYKL9+jQB6QM2tlNgXtx46BcICA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7/Gh4kfVvH6RKHSDJ1MITTSK+OK3bGxoGGa912fKXbQ=;
 b=XNhhnSqpU84cyhO3q4Khq/uJbEgdDBq1etzR9G3LLkhk1lrLCawQmdd5t5yo1wQrE9UbvyJOW5KWDm8B92vAC5/ouvEugGMIuF7+cn1JjyaVGpaHwK5xrjWY1DSnP0qgN1DFipPlLBD9aPeEnwhucCYG0v4hHW+A5Ba+dgDWq4bC8rr5aMeSsgI1q6mG64Pt58HsQZX1ToPterOISHndSwDyOZgniagUGpC7egZ63Uxpwu8OkAwrzBk5m1La0Yk8z7EHU+ii4JnqRHInkFZ05LO85rTv+J9eEhf9SZLEqUZCbBYIHFn1Vw3FeDq19kX7L4k5JpAQwbzacHakXen1BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 SN7PR11MB7509.namprd11.prod.outlook.com (2603:10b6:806:346::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.17; Wed, 27 May 2026 10:08:44 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 10:08:44 +0000
Content-Type: multipart/alternative;
 boundary="------------Kw4SLppvRt0AIzIPOLW1R3sx"
Message-ID: <0772bf17-e742-445b-ab55-5f626525af7b@windriver.com>
Date: Wed, 27 May 2026 15:38:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v3 03/12] glibc: disable automatic libatomic
 linking
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com,
        Randy.MacLeod@windriver.com
References: <20260519072534.24588-1-Hemanth.KumarMD@windriver.com>
 <20260519072534.24588-4-Hemanth.KumarMD@windriver.com>
 <CAMKF1srHDEKUZ40644GCYRyfCQAVocziGrBRk1TPtAvVnqnh7Q@mail.gmail.com>
Content-Language: en-US
From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
In-Reply-To: <CAMKF1srHDEKUZ40644GCYRyfCQAVocziGrBRk1TPtAvVnqnh7Q@mail.gmail.com>
X-ClientProxiedBy: MA5PR01CA0042.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d6::9) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|SN7PR11MB7509:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b848fe8-e18b-47a2-bfc3-08debbd7ef60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|4022899009|376014|8096899003|13003099007|22082099003|18002099003|4133799003|56012099006|3023799007|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info: 
	d66is+CxV7fM+S9mEeludtyBZBXC5IRAlNvf4K6Mkb/K4BXZxQDHFjC8AcGXy/GF6yFT/c5x8sUMv3cGOeT8jPHoUMuQZ2E9YY7sEoME0wcHZoHWQ+2rhf3rW9nl4ooFoeW0R3VsT3TLS1tC3XmGmwwNYI2YCBjYQfbV6tM5OBF6l6Lk5hO02QPdNThAGohtN6tX55RmzNn0+HwafUUowylpF+8OZG7GV15EuRycjTZ25t+OcigJfBEXZM9uPWuIPbTer0ODHDpa7VQv7rJpCWYoUXO02nNXUm0UfzRn4ZXS3d0rjeSp3BBYB4rTFA72/VEyEmVB0Neg4YiluMraLtnA0nSLBxug/lJ/UBhubgcEStUBpRT1slWoHtWzRUikDkLKQu3dLWLuB83hYZDkPq7fXSqr0KFrVxZ/lnL8rkAHf8C2Jlp7rA6nwgqaxfyfiWMUj6SBezdgInD6Ud4nwDhaumViDJcbNf6yRI9YErmCA3JKRIuAd6aOPN4hCCMFDdZzLdPNWNX3QJZj1PvTwE0H5dmygkebbHnG711GZ3iEU9hX34IdkmYzAAWmtjUCGrv6kX0oCdj2+Sz00i13jWMbLZVE97Aqaf1sM6yOidMFVdb3Iqd/sA+cNSFAENLvSqD25NLfVaNMsKSmJPFzuQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(4022899009)(376014)(8096899003)(13003099007)(22082099003)(18002099003)(4133799003)(56012099006)(3023799007)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cjdKYUlreXVxZnpWdXVxajJsNWc1RUpDMjhLdlVNUE4yZ2N4MmtWZC9LMThI?=
 =?utf-8?B?UUtEMnFBMndBQmhid2cwbHlXZFdScmRlTFlxRzNzaHYvaFFpbjFtQXRLOVU3?=
 =?utf-8?B?ZjliODR0VXBHeTFlSG8wZTdNQXBXelo4NzBSUmdyZnQ5QkdVOTlaeHpqK3di?=
 =?utf-8?B?YTNsVTdxTy9XYndId0ZyUDNrMXU4RFErd2Uyc3dNK3l3dWRZMWNnSFpiYStK?=
 =?utf-8?B?RFlCUDVqaWV6VDNVYXNyeStpdW9MVEdlaDhYQTZ2SXBFajJrc25XZEdScW4x?=
 =?utf-8?B?U2JDakdKVU4vTlpBL0VscE9VTHpsSSttcGY4MGhWWEJWbWVjbTRJQnFlTzBK?=
 =?utf-8?B?dnk1OFNoOVg2MFhXVS9wRHU5OVl3ZndQaUc4b3JhbXlJN2hYSmwzNTl4TmQ0?=
 =?utf-8?B?MUFSa0o0S1pwaFVFL1JUWE9Wd2Izd0ZxS1JpSU9DVXJOWHZ6aHY1ZldPc2tx?=
 =?utf-8?B?UDdBWnNnRE8rRHhyNVFuUlhtRjI3K1FOL21lYkswWk1GNWxjYi9NKzdXUkh4?=
 =?utf-8?B?dFZEUDhFL3VZc3Y4MWp1Yzl4SGtPdkhSTzNicDFzWnNpMjVMeGI1a1lZSW8w?=
 =?utf-8?B?ZEhwbWYvbTdxVEpjSWcySWJ6bXZPTEZxZzJnTDlid25acGI5VjF1Y3BhMW9q?=
 =?utf-8?B?YkhMK1RVVmNrcEdMMnptaDgremh0dC9YQ25EYlBEZG9zemllUkpZM2s5V0s4?=
 =?utf-8?B?Qk0rRVdqVXprM1JmdjVyWnZ0YVdzd045K2V5WVdUMUtreWtEVGh6NDRjVm1D?=
 =?utf-8?B?RlVEUUpMWlA0UWhCTEdkZ0J0Skp3TzU2ZjZKcUtkVVROU2ZNSCs1SVNCVk5Z?=
 =?utf-8?B?TVc0S25CT2RvUWxTZUFzTjR1TmVOWTZlYy9rRWQ2aitVMDMvTEtJTlY2Q3Va?=
 =?utf-8?B?N1hlcG15KzExZVFzWGwrV2N3MG4veHU4NlVHN0swSjhaSEhpeVA5NisxdWJU?=
 =?utf-8?B?Sk5raHBGc1FRZ3R3TXpNbEVvZHhESDB5N01CSW9saFVEU1ZDNDhsOWVZV1NP?=
 =?utf-8?B?SVUvanpxRkR2cVhqUU5zZmRuRnBnWjhVd2Voc3NDeXFib1VhZU45dk9DTlEz?=
 =?utf-8?B?bWlHWnQva01uMFZTenVTQ3kzWFN3Nk5JbmtvVnZPN0FvRnEyd1JrdnBaaXdq?=
 =?utf-8?B?eGlzbWNLemFOY2R3eDk5Uk9jVkhoRzUrYjdoRkhEL0FnbEhScTcrajZKM0M5?=
 =?utf-8?B?cTBsN1FaUFMvYWRveGVFbWhJMkJ2Yi9HNEkwOGtXdkNrZmdMS1AwVnpydlBW?=
 =?utf-8?B?czBYYjFtV2hYM2JSSVFOdXNGeVRnQUN3bkpQZFJZUDQxcDNsWXZ4RWhTc0p1?=
 =?utf-8?B?NTVvNXFNVUtjeEFzSHAyaXJxZzQxRnpSdDZBRHFsT0FTZE0xQ0dmVG9QSTRS?=
 =?utf-8?B?NnlEaGlRZlp6akNtcXd2QUFYd0tjNWtReVFrK3gwYyt5T0VUa2puODkrclEr?=
 =?utf-8?B?OUFLUUIza3RLSitmYTcya1N3a3R0dDgyYnMwRnJQMjRLU3Q0NzdqY0toZ0M4?=
 =?utf-8?B?NXpjZUhKaEs2WmtXR0QzMURQV2ZBdUxkcXl3djg2Y1ZOZE9DNGNpRDJ2Mmt3?=
 =?utf-8?B?NER3RTNqRFZ3bC9ENDhqWEE3QzgrVTRnZkEwNXBQMk8xc09GOWFJTlFFcXRF?=
 =?utf-8?B?MzNPVkhJcnA0R2FadDA1Y1NmQ3RSdnVsc3d6ZXk5djNhVjJsMUhYOXRBcGc0?=
 =?utf-8?B?R2kvR0dpMFYvWlRJVkN4RkpkNHlSSGtETzk2UmxOdERBcENYamR0dnYzQ2Uz?=
 =?utf-8?B?dkhxWkVjcUx6dzBjYmhhS0V3VlZKN3RIc3JPZnNzS1VpVEZLMGpCOCtkQklV?=
 =?utf-8?B?aUYxZE9tUTBhQ3dJbmRaRUhRY1lqUHQrS1hzRXhGNWJQTVRHKzZHdU1vS0sy?=
 =?utf-8?B?TXFDeWJLZTc1TEhyMXZOZmZaVWZlL0s3eVRrYXAwdTBKWW9IU2dpdVcwWTR6?=
 =?utf-8?B?R2NMQm1EZkkwMUVadVJoalZwRi9wRVMra0t4SGdLMWZEcUl1NW9OelVmMGJH?=
 =?utf-8?B?bTlJcitiRlJhVjVOdmxWMGgvd3pQTXQ1ZlU0TlFUM0dvK3VhQzkzQ3BMci90?=
 =?utf-8?B?TExkNmV2ZTFrRGFWZUdHeGdJbWFyT2tYNllyUXVtZGZORDdscjZvWGR3YVpY?=
 =?utf-8?B?dDlQeStNL3AzekplbVd6ZThGaDRCZWQ2S0dQWkxOVENNdXhnL0xtOHdjNkxB?=
 =?utf-8?B?Ym5xOTR4SGxTdEE0Ny9waStLeVlVMDB2Z3dabUtwbU1PbS95M3JtakpPMXpz?=
 =?utf-8?B?ekFLaEJSclJzVkgzeVJ4bVI2S3NTVVdWbktmc0lVSGlrM1pTNmUrWG1yaU85?=
 =?utf-8?B?M2llWGFGY2thb091eFhMVG81aHRlc2RiRWpqb0pMSVRiTVB5MzlROThiYkJC?=
 =?utf-8?Q?00aboQbQUhnTgaVo=3D?=
X-Exchange-RoutingPolicyChecked: 
	rjTyq1/ftyqGjZ4bcIcrFBm+QhRqfW6KugAiNEprqyqVYoDBFFT+FvDHiT09akxc+Shgmk1vVHvPX+yOLhbWI4stua0Yc7/sogMRlmPOArvPD6ZPGfw2h4sqUPZd8DwyxDsLKpoil841oqq+9i6YOKuQyn9OePmI6XvrwzvCIJBV8VxvRD5sVhoNBYKB/M9GKpsgxIzl/DxizK0IvMZDbsrYM70Db/XTcirfoqiTKXYIAW51GsYloczQkSIMy8BDA3MPayNptSVL0hLu0GuVAWSMFNQvX7JlUoKhRQn2mYZp5WeJuTZpPAPvs8Qp+ktQbfxiLRT3s+iqWgeS+ts9nQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b848fe8-e18b-47a2-bfc3-08debbd7ef60
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 10:08:44.5082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EQ7pPBWS6yNmKGUjPTyYCvxbT+FWC+jmiD9zzHG98BBXZADjOVkQDUDUwlYqVyHVGL/SjY2O7jORR8le3KaIlo6w0CRqfJtjZS75VxYjnb4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7509
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: Lh8WpaqU4zfwMYBJUl_PANiBMo1ASxlR
X-Proofpoint-ORIG-GUID: nLh0HMDPx9n0Dec_vZkdnSpDe0f_8Gij
X-Authority-Analysis: v=2.4 cv=OuB/DS/t c=1 sm=1 tr=0 ts=6a16c2b1 cx=c_pps
 a=KqPiDrE7WZWwkLuZ9HJZeQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=Q4-j1AaZAAAA:8
 a=NEAV23lmAAAA:8 a=kFitNYaTAAAA:8 a=qu0_1r6LAAAA:8 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=efCuXuqrEV8n9xNR-8UA:9 a=lqcHg5cX4UMA:10 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=ApW9bLQNKI5i_pVAx58A:9 a=hwIJyvbnCfH8DrLN:21
 a=_W_S_7VecoQA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=BJUKY3XvT8OqBkSI9ojT:22
 a=YxNG67JA86XBIJqV6KEL:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5NyBTYWx0ZWRfXxNZ0iK4J6gEG
 9ShqAdX614A4wj6z82gQH6fqm80eIKvVORqGIPWpnfuEMlxGUFI5PfYYTKoHWeUf1Y+7U6r/SWy
 LYYzRIEhBfMCiXxTPf2cxF/lHoNz5b74MLfaC+0MmI2SlsWgMQOr1NUsK4fp2Hcf6a1SOBwefKR
 i8ACZSxVOrsZABHvx6l73GSf36bBnkE1c2S5vKVGyMltF68fpAgiqbl7nKEjcxXqq9zi9CdW/F9
 MwReKCV5cMnlHzM4M0xjbPmpJk5F4CNv1EkootKxItl4w/Ld7IqoyAekUKts4qRETP0qHlGEOW5
 6J5MJEddLqWoHFsVAZ01do2xmMjjmjTZOZxp7C5AS3DbJAwKR3dkHk3CrbVhhMl4WnCklfZQyEM
 2rPgW4pGwntm0g+MNpQXXBNCPWMziKToZFWQjC71qNNbZC09pmYEBwv7UqsqR9lu/70+h/Ueukd
 eMHtUn21uf/Zgj0ufcQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605270097
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 May 2026 10:08:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237637

--------------Kw4SLppvRt0AIzIPOLW1R3sx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 64R8kh9M2712903


On 23-05-2026 07:02 am, Khem Raj wrote:
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
>
>
> On Tue, May 19, 2026 at 12:25=E2=80=AFAM Hemanth Kumar M D via=20
> lists.openembedded.org=20
> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8=
EvQ!ep_WpaZmir4Aw1K_c2XMB01Y8AuFDouyrw1F8TpQr78EckKFe8ujYgJ9slTPRbu3p6yeU=
rHqulvlTck6iGu8T68$>=20
> <Hemanth.KumarMD=3Dwindriver.com@lists.openembedded.org> wrote:
>
>     From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
>
>     GCC 16 introduced -flink-libatomic which automatically injects
>     -latomic_asneeded into link commands via LINK_LIBATOMIC_SPEC.
>     When glibc is built with a GCC 16 cross-compiler, the compiler
>     would attempt to link against libatomic which does not exist yet
>     at this stage.(libatomic is built later as part of gcc-runtime)
>
>     Link:
>     https://github.com/gcc-mirror/gcc/commit/e63cf4b130b86dd7dde1bf499d=
3d40faca10ea2e
>     <https://urldefense.com/v3/__https://github.com/gcc-mirror/gcc/comm=
it/e63cf4b130b86dd7dde1bf499d3d40faca10ea2e__;!!AjveYdw8EvQ!ep_WpaZmir4Aw=
1K_c2XMB01Y8AuFDouyrw1F8TpQr78EckKFe8ujYgJ9slTPRbu3p6yeUrHqulvlTck690KqPG=
s$>
>
>     Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
>     ---
>     =C2=A0meta/recipes-core/glibc/glibc.inc
>     <https://urldefense.com/v3/__http://glibc.inc__;!!AjveYdw8EvQ!ep_Wp=
aZmir4Aw1K_c2XMB01Y8AuFDouyrw1F8TpQr78EckKFe8ujYgJ9slTPRbu3p6yeUrHqulvlTc=
k6_ujwH0A$>
>     | 3 +++
>     =C2=A01 file changed, 3 insertions(+)
>
>     diff --git a/meta/recipes-core/glibc/glibc.inc
>     <https://urldefense.com/v3/__http://glibc.inc__;!!AjveYdw8EvQ!ep_Wp=
aZmir4Aw1K_c2XMB01Y8AuFDouyrw1F8TpQr78EckKFe8ujYgJ9slTPRbu3p6yeUrHqulvlTc=
k6_ujwH0A$>
>     b/meta/recipes-core/glibc/glibc.inc
>     <https://urldefense.com/v3/__http://glibc.inc__;!!AjveYdw8EvQ!ep_Wp=
aZmir4Aw1K_c2XMB01Y8AuFDouyrw1F8TpQr78EckKFe8ujYgJ9slTPRbu3p6yeUrHqulvlTc=
k6_ujwH0A$>
>     index dae087d53f..751cc0c572 100644
>     --- a/meta/recipes-core/glibc/glibc.inc
>     <https://urldefense.com/v3/__http://glibc.inc__;!!AjveYdw8EvQ!ep_Wp=
aZmir4Aw1K_c2XMB01Y8AuFDouyrw1F8TpQr78EckKFe8ujYgJ9slTPRbu3p6yeUrHqulvlTc=
k6_ujwH0A$>
>     +++ b/meta/recipes-core/glibc/glibc.inc
>     <https://urldefense.com/v3/__http://glibc.inc__;!!AjveYdw8EvQ!ep_Wp=
aZmir4Aw1K_c2XMB01Y8AuFDouyrw1F8TpQr78EckKFe8ujYgJ9slTPRbu3p6yeUrHqulvlTc=
k6_ujwH0A$>
>     @@ -46,6 +46,9 @@ EXTRA_OEMAKE +=3D "SHELL=3D/bin/bash"
>     =C2=A0# bash but it can be configured by setting KSHELL Makefile va=
riable
>     =C2=A0EXTRA_OEMAKE +=3D "KSHELL=3D/bin/sh"
>
>     +TARGET_CC_ARCH +=3D "-fno-link-libatomic"
>     +SDK_CC_ARCH +=3D "-fno-link-libatomic"
>
>
> This might be better controlled with toolchain-gcc override.
Hi Khem,

Updated this to use the toolchain-gcc override:

 =C2=A0 =C2=A0 TARGET_CC_ARCH:toolchain-gcc +=3D "-fno-link-libatomic"
 =C2=A0 =C2=A0 SDK_CC_ARCH:toolchain-gcc +=3D "-fno-link-libatomic"

Will be sending the fix in the coming series.

>     +
>     =C2=A0do_configure:prepend() {
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -e "s#/bin/bash#/bin/sh#" -i ${S}/e=
lf/ldd.bash.in
>     <https://urldefense.com/v3/__http://ldd.bash.in__;!!AjveYdw8EvQ!ep_=
WpaZmir4Aw1K_c2XMB01Y8AuFDouyrw1F8TpQr78EckKFe8ujYgJ9slTPRbu3p6yeUrHqulvl=
Tck6yiEC9_0$>
>     =C2=A0}
>     --=20
>     2.49.0
>
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#237276):
>     https://lists.openembedded.org/g/openembedded-core/message/237276
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/message/237276__;!!AjveYdw8EvQ!ep_WpaZmir4Aw1K_c2XMB01Y8AuFD=
ouyrw1F8TpQr78EckKFe8ujYgJ9slTPRbu3p6yeUrHqulvlTck6I4oFiHo$>
>     Mute This Topic:
>     https://lists.openembedded.org/mt/119387074/1997914
>     <https://urldefense.com/v3/__https://lists.openembedded.org/mt/1193=
87074/1997914__;!!AjveYdw8EvQ!ep_WpaZmir4Aw1K_c2XMB01Y8AuFDouyrw1F8TpQr78=
EckKFe8ujYgJ9slTPRbu3p6yeUrHqulvlTck68YPSyXM$>
>     Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-core/unsub
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/unsub__;!!AjveYdw8EvQ!ep_WpaZmir4Aw1K_c2XMB01Y8AuFDouyrw1F8T=
pQr78EckKFe8ujYgJ9slTPRbu3p6yeUrHqulvlTck6TBdEFcI$>
>     [raj.khem@gmail.com]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--=20
Regards,
Hemanth Kumar M D

--------------Kw4SLppvRt0AIzIPOLW1R3sx
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 64R8kh9M2712903

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 23-05-2026 07:02 am, Khem Raj wrote=
:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1srHDEKUZ40644GCYRyfCQAVoc=
ziGrBRk1TPtAvVnqnh7Q@mail.gmail.com">
     =20
      <strong>
      </strong>
      <div style=3D"border: 1pt solid rgb(156, 101, 0); padding: 2pt; bac=
kground-position: 0% 0%; background-repeat: repeat; background-attachment=
: scroll; background-image: none; background-size: auto; background-origi=
n: padding-box; background-clip: border-box;"><strong><class=3D"msonormal=
" style=3D"line-height:11pt"><span style=3D"font-size: 11pt;">CAUTION:
              This email comes from a non Wind River email account!</span=
></class=3D"msonormal"></strong><br>
        <class=3D"msonormal" style=3D"line-height:10pt3"><span style=3D"f=
ont-size: 10pt;">Do not click links or open
            attachments unless you recognize the sender and know the
            content is safe.</span><br>
        </class=3D"msonormal"></div>
      <div>
        <div dir=3D"ltr">
          <div dir=3D"ltr"><br>
          </div>
          <br>
          <div class=3D"gmail_quote gmail_quote_container">
            <div dir=3D"ltr" class=3D"gmail_attr">On Tue, May 19, 2026 at
              12:25=E2=80=AFAM Hemanth Kumar M D via
              <a href=3D"https://urldefense.com/v3/__http://lists.openemb=
edded.org__;!!AjveYdw8EvQ!ep_WpaZmir4Aw1K_c2XMB01Y8AuFDouyrw1F8TpQr78EckK=
Fe8ujYgJ9slTPRbu3p6yeUrHqulvlTck6iGu8T68$" moz-do-not-send=3D"true">
                lists.openembedded.org</a> &lt;Hemanth.KumarMD=3D<a href=3D=
"mailto:windriver.com@lists.openembedded.org" moz-do-not-send=3D"true" cl=
ass=3D"moz-txt-link-freetext">windriver.com@lists.openembedded.org</a>&gt=
;
              wrote:<br>
            </div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              From: Hemanth Kumar M D &lt;<a href=3D"mailto:Hemanth.Kumar=
MD@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz=
-txt-link-freetext">Hemanth.KumarMD@windriver.com</a>&gt;<br>
              <br>
              GCC 16 introduced -flink-libatomic which automatically
              injects<br>
              -latomic_asneeded into link commands via
              LINK_LIBATOMIC_SPEC.<br>
              When glibc is built with a GCC 16 cross-compiler, the
              compiler<br>
              would attempt to link against libatomic which does not
              exist yet<br>
              at this stage.(libatomic is built later as part of
              gcc-runtime)<br>
              <br>
              Link: <a href=3D"https://urldefense.com/v3/__https://github=
.com/gcc-mirror/gcc/commit/e63cf4b130b86dd7dde1bf499d3d40faca10ea2e__;!!A=
jveYdw8EvQ!ep_WpaZmir4Aw1K_c2XMB01Y8AuFDouyrw1F8TpQr78EckKFe8ujYgJ9slTPRb=
u3p6yeUrHqulvlTck690KqPGs$" rel=3D"noreferrer" target=3D"_blank" moz-do-n=
ot-send=3D"true">
https://github.com/gcc-mirror/gcc/commit/e63cf4b130b86dd7dde1bf499d3d40fa=
ca10ea2e</a><br>
              <br>
              Signed-off-by: Hemanth Kumar M D &lt;<a href=3D"mailto:Hema=
nth.KumarMD@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" cla=
ss=3D"moz-txt-link-freetext">Hemanth.KumarMD@windriver.com</a>&gt;<br>
              ---<br>
              &nbsp;meta/recipes-core/glibc/<a href=3D"https://urldefense=
.com/v3/__http://glibc.inc__;!!AjveYdw8EvQ!ep_WpaZmir4Aw1K_c2XMB01Y8AuFDo=
uyrw1F8TpQr78EckKFe8ujYgJ9slTPRbu3p6yeUrHqulvlTck6_ujwH0A$" moz-do-not-se=
nd=3D"true">glibc.inc</a> | 3 +++<br>
              &nbsp;1 file changed, 3 insertions(+)<br>
              <br>
              diff --git a/meta/recipes-core/glibc/<a href=3D"https://url=
defense.com/v3/__http://glibc.inc__;!!AjveYdw8EvQ!ep_WpaZmir4Aw1K_c2XMB01=
Y8AuFDouyrw1F8TpQr78EckKFe8ujYgJ9slTPRbu3p6yeUrHqulvlTck6_ujwH0A$" moz-do=
-not-send=3D"true">glibc.inc</a>
              b/meta/recipes-core/glibc/<a href=3D"https://urldefense.com=
/v3/__http://glibc.inc__;!!AjveYdw8EvQ!ep_WpaZmir4Aw1K_c2XMB01Y8AuFDouyrw=
1F8TpQr78EckKFe8ujYgJ9slTPRbu3p6yeUrHqulvlTck6_ujwH0A$" moz-do-not-send=3D=
"true">glibc.inc</a><br>
              index dae087d53f..751cc0c572 100644<br>
              --- a/meta/recipes-core/glibc/<a href=3D"https://urldefense=
.com/v3/__http://glibc.inc__;!!AjveYdw8EvQ!ep_WpaZmir4Aw1K_c2XMB01Y8AuFDo=
uyrw1F8TpQr78EckKFe8ujYgJ9slTPRbu3p6yeUrHqulvlTck6_ujwH0A$" moz-do-not-se=
nd=3D"true">glibc.inc</a><br>
              +++ b/meta/recipes-core/glibc/<a href=3D"https://urldefense=
.com/v3/__http://glibc.inc__;!!AjveYdw8EvQ!ep_WpaZmir4Aw1K_c2XMB01Y8AuFDo=
uyrw1F8TpQr78EckKFe8ujYgJ9slTPRbu3p6yeUrHqulvlTck6_ujwH0A$" moz-do-not-se=
nd=3D"true">glibc.inc</a><br>
              @@ -46,6 +46,9 @@ EXTRA_OEMAKE +=3D &quot;SHELL=3D/bin/bash=
&quot;<br>
              &nbsp;# bash but it can be configured by setting KSHELL
              Makefile variable<br>
              &nbsp;EXTRA_OEMAKE +=3D &quot;KSHELL=3D/bin/sh&quot;<br>
              <br>
              +TARGET_CC_ARCH +=3D &quot;-fno-link-libatomic&quot;<br>
              +SDK_CC_ARCH +=3D &quot;-fno-link-libatomic&quot;<br>
            </blockquote>
            <div><br>
            </div>
            <div>This might be better controlled with toolchain-gcc
              override.</div>
            <div>&nbsp;</div>
          </div>
        </div>
      </div>
    </blockquote>
    <span>Hi Khem,<br>
      <br>
      Updated this to use the toolchain-gcc override:<br>
      <br>
      &nbsp; &nbsp; TARGET_CC_ARCH:toolchain-gcc +=3D &quot;-fno-link-lib=
atomic&quot;<br>
      &nbsp; &nbsp; SDK_CC_ARCH:toolchain-gcc +=3D &quot;-fno-link-libato=
mic&quot;<br>
      <br>
      Will be sending the fix in the coming series.<br>
      <br>
    </span>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1srHDEKUZ40644GCYRyfCQAVoc=
ziGrBRk1TPtAvVnqnh7Q@mail.gmail.com">
      <div>
        <div dir=3D"ltr">
          <div class=3D"gmail_quote gmail_quote_container">
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
              +<br>
              &nbsp;do_configure:prepend() {<br>
              &nbsp; &nbsp; &nbsp; &nbsp; sed -e &quot;s#/bin/bash#/bin/s=
h#&quot; -i ${S}/elf/<a href=3D"https://urldefense.com/v3/__http://ldd.ba=
sh.in__;!!AjveYdw8EvQ!ep_WpaZmir4Aw1K_c2XMB01Y8AuFDouyrw1F8TpQr78EckKFe8u=
jYgJ9slTPRbu3p6yeUrHqulvlTck6yiEC9_0$" rel=3D"noreferrer" target=3D"_blan=
k" moz-do-not-send=3D"true">ldd.bash.in</a><br>
              &nbsp;}<br>
              -- <br>
              2.49.0<br>
              <br>
              <br>
              -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
              Links: You receive all messages sent to this group.<br>
              View/Reply Online (#237276): <a href=3D"https://urldefense.=
com/v3/__https://lists.openembedded.org/g/openembedded-core/message/23727=
6__;!!AjveYdw8EvQ!ep_WpaZmir4Aw1K_c2XMB01Y8AuFDouyrw1F8TpQr78EckKFe8ujYgJ=
9slTPRbu3p6yeUrHqulvlTck6I4oFiHo$" rel=3D"noreferrer" target=3D"_blank" m=
oz-do-not-send=3D"true">
https://lists.openembedded.org/g/openembedded-core/message/237276</a><br>
              Mute This Topic: <a href=3D"https://urldefense.com/v3/__htt=
ps://lists.openembedded.org/mt/119387074/1997914__;!!AjveYdw8EvQ!ep_WpaZm=
ir4Aw1K_c2XMB01Y8AuFDouyrw1F8TpQr78EckKFe8ujYgJ9slTPRbu3p6yeUrHqulvlTck68=
YPSyXM$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">
                https://lists.openembedded.org/mt/119387074/1997914</a><b=
r>
              Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@li=
sts.openembedded.org" target=3D"_blank" moz-do-not-send=3D"true">
                openembedded-core+owner@lists.openembedded.org</a><br>
              Unsubscribe: <a href=3D"https://urldefense.com/v3/__https:/=
/lists.openembedded.org/g/openembedded-core/unsub__;!!AjveYdw8EvQ!ep_WpaZ=
mir4Aw1K_c2XMB01Y8AuFDouyrw1F8TpQr78EckKFe8ujYgJ9slTPRbu3p6yeUrHqulvlTck6=
TBdEFcI$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">
                https://lists.openembedded.org/g/openembedded-core/unsub<=
/a>
              [<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank" mo=
z-do-not-send=3D"true" class=3D"moz-txt-link-freetext">raj.khem@gmail.com=
</a>]<br>
              -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
              <br>
            </blockquote>
          </div>
        </div>
      </div>
    </blockquote>
    <pre class=3D"moz-signature" cols=3D"72">--=20
Regards,
Hemanth Kumar M D</pre>
  </body>
</html>

--------------Kw4SLppvRt0AIzIPOLW1R3sx--

