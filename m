Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0208DF4644D
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 11:03:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47796.1773659021383628533
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 04:03:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=P3TjtqJG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7535cd1d29=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G5WbnA3052891
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 04:03:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=9vC67+KSdFlyV+/38BFyqG7/obd/tRPBe9RSxT78lNk=; b=P3TjtqJGAB1x
	GB3P4ciHEEzxLNlkhGUiRRZ72IeyacMhNs61rItqlgGLHQt+O8CkD0PocJHkHeDP
	U9JzzsItODlDvsNUCuTH+FSk3gWfbJrJsdeq1mlcPWmQh88fQWNKtDwRtvPqPLer
	cUtmsRmnBT7DzECB4jk9MtuqrY0V8KziqJs6gQ2japV+Gqra1OKD8LuPhRFYvq3F
	ZYTuT2CBH1PSqGI5lF47eRN4+HEcyKO8EAjJyLd1J7hBKWa9XgBVnYfuGVz5ojJ5
	vPyWbzGj/KnhSst8kmbQYWekLcWPYtLObtjb2Q7TlS6sjOKJdS6mDPxFy/r59Wc1
	Ura803t7TA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011059.outbound.protection.outlook.com [52.101.62.59])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cw2y11r0y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 16 Mar 2026 04:03:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qg5cZjHLYJMN1wlE9uo1aC5wRB02ZHG4Laaw7g3oVbayrlPVD6sYWT5xozdWzvbL8H/EHtyfnZ5A/f+pcxURep17ZmFAfk7e7NsXI0P2BRXrUFkEKL202X7rss5Ew0uJ/v37X/+TfzMuJ14+qKlnjqBBUpDhY64YKgxaOIVeSA2Qe83886mReJWwavJTO+jmPyJCzbhFTUktry6ybZ+TF4KjNAiT8qtDeIs5IJeP5TOUSDqQX6c2MRQhWW+Hm7Pa02Bu9altLOGMBFcISG1esR4dTQ/NVQz0PQtorwcUqSivgGAnRPQvZfY+MxBrXIGoXJD1UWSz2gDGywX3DHriGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9vC67+KSdFlyV+/38BFyqG7/obd/tRPBe9RSxT78lNk=;
 b=ZDNzVYHpryUoChoK1qiOWBKxkBLT3+zqps1a0SuqQeBHdMAEsjFvIwANt90+aXnD6yLaVuMTLgscc0d1rDLGmtPgj9fV/FNAETHogs+iM0SU3Xmth/Rr86vdy/d233YJsxz+stAzWjLb+G1hYQV+69paH3bBpqvpeXfCRUdirt32Ko4V8QnAK1YG9LL8UZmI5ZAnWhZVLubv3Ewge9aqFVYzkUrvrufIq2IJN43kjeqzbxuKjMvkjqEAswKSnrVK+pRiAQXOPcF1yYviFO2l23OgOI8YvREsrmCgklBYckclJ5z16PEkx/JmpUqyi9PTLltkFa4l6dZiFYy1RD2Viw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 IA4PR11MB8915.namprd11.prod.outlook.com (2603:10b6:208:560::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.8; Mon, 16 Mar
 2026 11:03:37 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.20.9723.014; Mon, 16 Mar 2026
 11:03:37 +0000
Message-ID: <420d9aeb-72b4-448a-8e41-9e20f1fd3a47@windriver.com>
Date: Mon, 16 Mar 2026 16:33:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [AUH] barebox-tools: upgrading to 2026.03.0 SUCCEEDED
References: <0101019cf1bb5bec-59c0036d-cf9f-4133-9a27-4f70a7286fa7-000000@us-west-2.amazonses.com>
Content-Language: en-US
From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
To: richard.purdie@linuxfoundation.org,
        Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
In-Reply-To: <0101019cf1bb5bec-59c0036d-cf9f-4133-9a27-4f70a7286fa7-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0225.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f3::18) To SA0PR11MB4574.namprd11.prod.outlook.com
 (2603:10b6:806:71::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|IA4PR11MB8915:EE_
X-MS-Office365-Filtering-Correlation-Id: b4e513ba-5cff-420f-71e7-08de834bac05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|376014|1800799024|366016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	DGophLCbwyHPRyTomxPmB0SPwmfEhoqwQjUTzKQuZSptzU+FLorE70FiV8otsc9klSJj3ibrFj7ncSHycF2tcm4COWuPTGC0shFYLe3tjucM1fmtcWh6E8QH/YVbujj/sXggd5CyjjtePgYIh1fAFgJycPaTL37vrwrbTbk/3BRgPZLvC3xJIeYAer19WPacKPuH8jj1eQFsG7ZID3ZxATODhQzI7dGdMZ4vzxNuYSQz6hv0bNpWk5c5pYYRHnuCHGvcpM9/GUZJwxXBnSXw2oHaC7K/CW52eESnoCvN+wkwOpuYdgP5adAhx6O/3DQ4eHkjHu0LvkWjO/BgmctKC2ulXiJq2xb9X26BlDB1pZ8FbTDOmiuQ7GC4RTGn3M/GQBrOLkaxNCn9vOsaQWlswP6dJIfvFJjnvT8FKYWxyocghSOhqRQbV41FuqjpbQKNEafwtnTLbCVWgvN97ikyGHz4DwWCsczQkIybqwHnSh4dUZGVbFwZ8PIupuEZnqi5dLeTjl/SAo851e5FRf/+LDcEkyESr4PWkHdYqmvC0Je1ohh3xrJQU4WJxXmpxNmM5isfb/dBHWAy+pRsR+FO8f8fpqcneuMLs9GcOaUtrLqN/gPOkR3/bWabbYsQ2uSEF+ceECBMgG7LUsSz8A23SyRkOtvWm9V9qJJJn2OKQ6jX3ZkYaa3rrVBDZmAIi9r3
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MTI3US9NUUdYeUNKdVFoWitYdmg5MTVadnNXc3FIU0g0WU91d09QQWttUWU1?=
 =?utf-8?B?WTkvdnJENTFXVC92dGQvdGVtZFM3OGtIankzU0JrQi9qWEtIcFZkUGxrbzRi?=
 =?utf-8?B?VWh0eldGaWhDdzB6TFpGbmJBYmsvRjJ5MFpsZlQrRzRRZFFCSU5ka25pT0xB?=
 =?utf-8?B?WUVGS0p1L0psa0JPOUN2Z0RaMCt3TlBIWkJoTEIzeHFFUkg4OE1xTTZkZnc1?=
 =?utf-8?B?VFROSmRGN2dTbEN2M0VlakkreVVXUlZPTytpYk5FN0tTUDlrRjVaZVlsRS9K?=
 =?utf-8?B?KzFmaytCK2cyRlA5VmxoeHJWY04rY2pMaGpmdXlId29WZ21Oc2tDTHQrMU5q?=
 =?utf-8?B?Y2pKVVk1UjNVVTBCcDhhai8yekhFZVRBcnBRL1hNU3pkTStXYkRNbXpEZzRp?=
 =?utf-8?B?WnFuV05Nejc1Z2xvaG5TcTViTzlZQ3k0YXFxY09UZUxvSjZjR2pKUm1LZ1h0?=
 =?utf-8?B?ZEtPM0VpcTcwUy96b1lzVXNkVmZUN2VWbUY2V0xUOXJjRVlPbStFdkpNV0RW?=
 =?utf-8?B?T3hWYVBBL3l4SVRVNHQrSTdKbXVheG82RmJRMUVsc1pXdWxlVFcyY2RpWVNt?=
 =?utf-8?B?REFDMlFwa2VWR01ZK0dscWtXd1I2Z3pqU2tUdkJ3dzVTNDFjaUtUeVZ0UnM3?=
 =?utf-8?B?Vk8vZndnRVZ4WWV5YnBueW5VbTlXNEhKNEdQWUJHMHlLSmkwTnBsZGtQUmJ0?=
 =?utf-8?B?c25SRjZacEd6cUpYZmtURE9SQ2hFM3FSTlh6cmFpTCtqbUZTb0d5YVJWdTVM?=
 =?utf-8?B?a0VWN3hhajlObzNnKzk0c3NoM3pNbTB4REQ3MTNyTGw2dUZEV29rbWpDWjkz?=
 =?utf-8?B?S3AzYnhZY2JtOG1kUnhYaFlxYWNNQ0RTK09hOGVmajJLdzRvRiswSS9zMm5U?=
 =?utf-8?B?RFBDZVM0NmtCZWZrdmhRYWcrUGZhb0RGaHNoZ3AxcS92TDdsQXFKWGFIMHRU?=
 =?utf-8?B?U2RRTHJGTURFdi9TaHByeGxZc3ZjdkhndWYwUTJHWW8va09xNjlwbDVvcXpq?=
 =?utf-8?B?ZHo0amMydW1YMlgrUmZQZXdzenJsaitkVjVXemdCMGFPZWpvcERQaVVIU2pD?=
 =?utf-8?B?VUlpaDZQYzRTeUkxTEJVaWhKY0t0ektwRGFqWXJkeFBLTURDOXpZN3VZamdE?=
 =?utf-8?B?VFIwUDVKekRHOWpuMVhCWVMxbFdLUkozem9vU0VjS0gyZk9WZDB1RGxTRUEr?=
 =?utf-8?B?ZzNVQ0Z6aFBGWXpGZHh0ME0xbUNLV3BGVGUwUU83QmdVTGZrWlViMHBZT0Nv?=
 =?utf-8?B?NXFhMURBamVIMGdySFVUSkUvcndUKzF5eHZ2NUhFVDRDcGZjM1VMNUpMN3Vn?=
 =?utf-8?B?YVE3OUZkcFVUYTVmMkNGTnJtN1hiVWpTMGxrOVMrb2ZwS09Dd0RFZFZTcTBy?=
 =?utf-8?B?eVBEUzdHY0J1bjByVFQvMEFwTUpYdEVNTEk3TERITjY3cGViM3lNT3ZiME1v?=
 =?utf-8?B?eWZPdEZ0TnBGYVZBV1ZIbFo3Y21CM0xxUllNaVlFSGZmTTNiVDBNQ2dxaUVT?=
 =?utf-8?B?eWNXdW5uV0pHaHNHSXNhQzlyRlRUU2Rrdkw1ajNONE5aWVc3b0RaNmZRMTY3?=
 =?utf-8?B?bkE2VU9LU1JaejArY2lJL0phZnl1OU9JYWVOOFhNSmJrSm1IVXI3NUc2cy95?=
 =?utf-8?B?ei9Tc3dONmh3NldqWVgvWUc1NEEvc0hqNU5BaFI2TGxLVC9pNHhBK2orN0ds?=
 =?utf-8?B?VEIrZFR4cFp6cUFLMDQ4U0tSeElSN2ZRWWpJM2dhYUJRcytsalVIZkJCYW91?=
 =?utf-8?B?NnhhMG5JbjRNTzBkVGowS2hGaFJocC9rOEx4RGhscDM0MlVyQ0FXZkU4b3pH?=
 =?utf-8?B?OGFJd0dmekplYUZjbzNFTkVkNnJFV04wOVBzbWcrcFNYWEJiNFVLcGJvTit3?=
 =?utf-8?B?M0s3clJjaHlncW4zMGZkZnZsL1J2NlBDSDBzSjdBcVUxZlZvOWZiclhjUkxD?=
 =?utf-8?B?NHRPWnN5U0wzV3ZpUlpkYk9nOHlSeWkvMDJGOU9PeWFmVlB2Vi9KN1RFSFor?=
 =?utf-8?B?QUprUjR2cFZ5UDBTeU5SamVpcUN6R1A3SU0vdWhkRVk0bXhMWHE4KzhpQm5M?=
 =?utf-8?B?bWxTcmpqYmh2TUtrL0JpbXNNQ25NTzBRMnJHTW12NUZXUnc0eVJ1TlN0L3d3?=
 =?utf-8?B?c0ZwVFduRmYydUlMc1NMcHlFdmtjSDMzMW1BdmRlZ3dFL2FWalh3TnBLMGJm?=
 =?utf-8?B?WVNHR3pjRUtRM29XbjFBRVVBWExWUkNNV0dCMFU0blIzTy9uMndsclZSbUsy?=
 =?utf-8?B?WHloaEVLZ2wzNzhibHJ2dkNFbjdKd3lidDBaLzJmcTh1SExiWFBnY05pY2kx?=
 =?utf-8?B?OFVmZk1ObkxzbGlyY2ZjVGJkem1uSjFPRzFKNmZnWWo0YWVwQ3U2TGJHdVEx?=
 =?utf-8?Q?33ngEC++5zt7uZro=3D?=
X-Exchange-RoutingPolicyChecked: 
	g2Z835LUupXCZqNwrLBbuYHYff0T9JmYnK7MePdFUrS6YMrej+XlfsUDaBsRvS6ctkO2Br68vIMtO3bKptCeJaRXfkDnGmHkYH1HGat4uX4R1mfkz+N2rVb4+YZUO4k71sx9GbX5NCK7zi2YlaM1Tu9FhNIs0oe710woWz8nFqe6PAJOXf8YksJGwoPMZpXf0inbVeUnAg20WbJzRrrPwMixvA8UWvueAjaYiGhe7nJg2/LyjK1k9pDPvNRUygU7Lan4CeEQeIbAsq8L5I2BwZTwP5EvW3aS4eFj9AtFqT4kNNuqUcagNcGQ+7/7/yFDBEmUrjE5SGHkpyzwzIKUmg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4e513ba-5cff-420f-71e7-08de834bac05
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4574.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 11:03:37.4751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bN1AtraMSVOTgaQ2lDole3OoJQyqfrPOlYtwf+SMvOWRAG4ziMXqM0vfynjzOsY2eH3jhyDoGRoKjYDh5aFD7LFm8RqzNBQ1dLQtTQXScqw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB8915
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=CekFJbrl c=1 sm=1 tr=0 ts=69b7e38c cx=c_pps
 a=huIvVN+S9WGU6koxVvae6w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=iGHA9ds3AAAA:8 a=nTWVe4aRAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=Wt-VWGWodgszWGL_PuUA:9 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=OCs18tFjoTMAgHLyVtgT:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA4NCBTYWx0ZWRfX4hBMMRH/gfhE
 V9EbS6aBGhxVf3Zj/+S3oKD5F50WzlRNqkXluvYuke+E6Y1qU5yKGQR977fdLxCDaIAtuIfsfL9
 QvQcYgd59dEn1fsAaNHztBMdPOjOFs/Zjl29+Avt0h9hGNct0jnidHIYs3wTC2UgzLNavIlg5DQ
 haI4DtxYZ5E97h6Iby/sjsnoalmEPwT0Y6qoQIdh+n30ftiVZXVYaCN+hfq6wAtIxJJli/6nC6L
 27wnQpDzD+xbRaMbnFHJQcSppVIwtZstPfOtgg3Mf73CMxCau0/Y5wmGbmfdI6Rf9q9omr/PmKr
 RxMEUElUXgeEDm1W4PQpwCBidTOXW5Vchs/C/9DA65Vao4qfEufMvwop40CxyCGzEH7zHGSXQ3j
 AXH0569NZ5GgnsZFn2nSwUyeGrs0ol/TLZouQ4KpBTkP9g6QisCvOg50kHOl3BqUmdlv6LQlVUE
 qD6BbUUSslr29UWwKcQ==
X-Proofpoint-GUID: Yb5ksLDWxB9rjqx2MiMGT6lyIzTjkv_L
X-Proofpoint-ORIG-GUID: -ldthjUH8eqzNaINXAOwiPoGBzXcSWHG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 adultscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 11:03:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233245


On 15-03-2026 07:11 pm, Auto Upgrade Helper via lists.openembedded.org 
wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> Hello,
>
> this email is a notification from the Auto Upgrade Helper
> that the automatic attempt to upgrade the recipe(s) *barebox-tools* to *2026.03.0* has Succeeded.
>
> Next steps:
>      - apply the patch: git am 0001-barebox-tools-upgrade-2026.01.0-2026.03.0.patch
>      - check the changes to upstream patches and summarize them in the commit message,
>      - compile an image that contains the package
>      - perform some basic sanity tests
>      - amend the patch and sign it off: git commit -s --reset-author --amend
>      - send it to the appropriate mailing list
Hi ,

The recipe currently carries a local patch added for a glibc 2.43 build 
issue (which is anyway dropped in this AUH update).
Will this upgrade be taken automatically, or should we prepare and send 
the upgrade patch?
> Alternatively, if you believe the recipe should not be upgraded at this time,
> you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
> automatic upgrades would no longer be attempted.
>
> Please review the attached files for further information and build/update failures.
> Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler
>
> Regards,
> The Upgrade Helper
>
> -- >8 --
>  From 438f0f0ffae24211eea1172ab8ab5a734f317b94 Mon Sep 17 00:00:00 2001
> From: Upgrade Helper <auh@yoctoproject.org>
> Date: Sun, 15 Mar 2026 06:01:23 +0000
> Subject: [PATCH] barebox-tools: upgrade 2026.01.0 -> 2026.03.0
>
> ---
>   meta/recipes-bsp/barebox/barebox-common.inc   |  4 +-
>   meta/recipes-bsp/barebox/barebox-tools.bb     |  2 -
>   ...x-tools-fix-glibc-2.43-openat2-build.patch | 43 -------------------
>   3 files changed, 2 insertions(+), 47 deletions(-)
>   delete mode 100644 meta/recipes-bsp/barebox/files/0001-barebox-tools-fix-glibc-2.43-openat2-build.patch
>
> diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes-bsp/barebox/barebox-common.inc
> index 14a5ca9709..17cfc25692 100644
> --- a/meta/recipes-bsp/barebox/barebox-common.inc
> +++ b/meta/recipes-bsp/barebox/barebox-common.inc
> @@ -3,6 +3,6 @@ SECTION = "bootloaders"
>
>   LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
>
> -PV = "2026.01.0"
> +PV = "2026.03.0"
>   SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
> -SRC_URI[sha256sum] = "219283d67c5d2f79bd22915b8a71906531223cb01e6e5b8d1658f299441e4169"
> +SRC_URI[sha256sum] = "760f22ff34ca00539d29826cce07d83210e41ebb51266616c6969b855c099bc2"
> diff --git a/meta/recipes-bsp/barebox/barebox-tools.bb b/meta/recipes-bsp/barebox/barebox-tools.bb
> index 1459f48db2..eb327306d9 100644
> --- a/meta/recipes-bsp/barebox/barebox-tools.bb
> +++ b/meta/recipes-bsp/barebox/barebox-tools.bb
> @@ -2,8 +2,6 @@ SUMMARY = "barebox bootloader tools"
>
>   require barebox-common.inc
>
> -SRC_URI += "file://0001-barebox-tools-fix-glibc-2.43-openat2-build.patch"
> -
>   LICENSE = "GPL-2.0-only"
>
>   DEPENDS = "bison-native flex-native libusb1"
> diff --git a/meta/recipes-bsp/barebox/files/0001-barebox-tools-fix-glibc-2.43-openat2-build.patch b/meta/recipes-bsp/barebox/files/0001-barebox-tools-fix-glibc-2.43-openat2-build.patch
> deleted file mode 100644
> index 2ff7cb82a6..0000000000
> --- a/meta/recipes-bsp/barebox/files/0001-barebox-tools-fix-glibc-2.43-openat2-build.patch
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -barebox-tools: fix build failure with glibc 2.43
> -
> -glibc 2.43 introduces linux/openat2.h through the fcntl include chain
> -(bits/fcntl-linux.h -> linux/openat2.h). This header expects the
> -__u64 type to be defined before inclusion.
> -
> -In barebox scripts/include/linux/types.h the header <fcntl.h> was
> -included before the __u64 typedef, causing build failures such as:
> -
> -  linux/openat2.h:20:9: error: unknown type name '__u64'
> -
> -Move the inclusion of <fcntl.h> after the typedef definitions so that
> -__u64 and related types are defined before linux/openat2.h is parsed.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
> ----
> -
> - scripts/include/linux/types.h | 3 ++-
> - 1 file changed, 2 insertions(+), 1 deletion(-)
> -
> -diff --git a/scripts/include/linux/types.h b/scripts/include/linux/types.h
> -index 5b01333..33cea19 100644
> ---- a/scripts/include/linux/types.h
> -+++ b/scripts/include/linux/types.h
> -@@ -4,7 +4,6 @@
> - #include <stdbool.h>
> - #include <stddef.h>
> - #include <stdint.h>
> --#include <fcntl.h>
> -
> - typedef uint64_t __u64;
> - typedef int64_t __s64;
> -@@ -15,6 +14,8 @@ typedef int16_t __s16;
> - typedef uint8_t __u8;
> - typedef int8_t __s8;
> -
> -+#include <fcntl.h>
> -+
> - #ifndef __linux__
> - typedef long long loff_t;
> - #endif
> --
> 2.47.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#233128): https://lists.openembedded.org/g/openembedded-core/message/233128
> Mute This Topic: https://lists.openembedded.org/mt/118327905/10244482
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [Hemanth.KumarMD@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
-- 
Regards,
Hemanth Kumar M D


