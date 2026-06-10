Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99493CD98C5
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 05:12:23 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13458.1781068335114271961
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2026 22:12:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=U99vGU2v;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0621c479bc=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A4jdoW211755
	for <openembedded-core@lists.openembedded.org>; Tue, 9 Jun 2026 22:12:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=SuvOT6HDykiVZalcGYaf46uYDWfJfA5uSgNuiuQdsIo=; b=U99vGU2vh1pp
	oEvZCnygF6Jld8oCR6A9woBzYjDlZFCWJglpPgSliGgDluCoHlzoXGKnV9L9QFp+
	aHgZcnrGwcwK4qS0ZMQwhrydyCqx54wt5Ml2jy98qe68MS0MpIDoCDoUG5L/XO83
	A71+VsxBTGhnOLjosVkdupFD3EvGam90Bcjt7d6VBAn+G8dneWfZgWrtOdum2n6h
	ECLCRrWzIIqWRTt2mkhn1zze9NrrICRqeaskbNiqLg/5TNUpYY6QLOq3uZVHEyCM
	pItwTCW6tEJUFHP/8auEjzeU+mZhnqFQmRoHs7knA47hseLhd81SwEUwD7mQ1og0
	jwkB1N31Ug==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013052.outbound.protection.outlook.com [40.93.196.52])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4epwkb06kr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 09 Jun 2026 22:12:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o/ZZ0WQFKIZeJGV1chjaai98MXsZGKDWv4hMpIUsv1I7qUS65qSHFkH7q7lhjVHInLxx61QZyJFub27bYOEiklLzY8BQVC7e9pZNiRHUOg9hjFUArAoPgwuR+ANWU8zaiapkWUXKGvsqx2FCCtTRlawR28/H//L5pDTWsf9q/ZroQB6G6FzTNZ/dSJzvJ8UNikn4BVG6n+x9uRSoZXfqndAU5dlq58N6sFksKZILrCHGKfS6oQOO5X9ZuXBSV7z54ZaQ9gdyd3xlBNjGI65X5gJZBXngglsEJSUlcbOxvJsa6dUM8PnMbRAXHLeE2IEZ0jR6W9R4uzhIFjtl8Be2SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SuvOT6HDykiVZalcGYaf46uYDWfJfA5uSgNuiuQdsIo=;
 b=CVF9k8rS+hxAjxpxLZOn+1HPqX9Zorr5ZL9a5NobRR51qoe2VADSau6EAgdAMbiK9LOviP/VqvvJoldu46mbhd5sSlzwpnGQIcMHF31qFcmROkf4My5kXiAMIro/zXmRJlpGI3fMarjtPzcKF8TSGDVG+7c3ZFPv6sMQ31hlFOhm7R/2AALn00nyV8IdYOjKhJIl0o+NvABOuRJ4qty1EigqaosNETKvJqleynVubph3gkVlLFgbJBVzAXgl7+bu4hHWUDNivDazq4Xe3afRQ/pu1WYnvAKrPGE/WBqsapUs0vd31scPzWKHezkhgKroDxTaBrK01f+PSaMfpzIvcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by SA2PR11MB4857.namprd11.prod.outlook.com (2603:10b6:806:fa::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Wed, 10 Jun
 2026 05:12:12 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%6]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 05:12:09 +0000
Message-ID: <fcaf1284-ccc3-4fec-8734-9f7979472023@windriver.com>
Date: Wed, 10 Jun 2026 10:42:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] llvm/rust: simplify llvm-config handling for
 target builds
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
References: <20260609141916.2724362-1-Deepesh.Varatharajan@windriver.com>
 <20324.1781014965849398736@lists.openembedded.org>
 <17026ba0e0798abb23fe7fdb5f14360c4bede4f3.camel@linuxfoundation.org>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <17026ba0e0798abb23fe7fdb5f14360c4bede4f3.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0181.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a9::13) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|SA2PR11MB4857:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d38b4e2-163f-4d61-7f5a-08dec6aed294
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|22082099003|18002099003|6133799003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	a+PJ2hroRbrpA1L/zM2hMVCps8pbnk0kKrOaosTeA2WKtOTaK04isIiBLIWle/Ga/3nY54qxQbdfNx52Zc+xidGgU/3opGaKdrGtunURWWtCdY0NngVz2DXFMma3xUHgnltWrNVBOxP6FcEWw1fIirmZ6AVmAeSmC3HgRvx/LfiCIGhYxeP01ep+CUB3cjmgYiMv6ZxutTIO+fbWXi1aXZG5VVYPDS/hwcbVk5hg/Wv57LNGph30/P7mLSijfSOkpKmkAzQpN035VQzzWCiqnHQYYZswFDQm3s8TZF5umixX/yhHMG8Y1Ig+1xyxmdCZ8hzMgXl555fY295lstFFE+A3tWGK/hQequajPNRbk6wnrEh6X7Vze3G6c6+JL2kxMnMwvQV6X64tzn5GW/BwKSr90VwNcRGBLzPvXwQ4RRbBfLLjK4olfAOxPL8bn+PyB1PfnUZXvk8fve3a3oOhOPmu+xZNQ+N8gNjXfysa9bKevzytZy6UJacu6IH1TtKOqJICUeiXECDthATgkt6mDJjClAt2NZjrGkqJcPRLd4g3dUjMfNZTfwGrtJ4taHm6ymR/eGpbKtp10iO23a7eXSY9QfJR7LbkIcX6PawwuA44w6uyG51uO8HfN3Q+a2v+dLL91Ql1CzA6KDfatsR3MA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(22082099003)(18002099003)(6133799003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?a245N3RORCtlM2txdEpkQWZBczVwdWh0aDd5Z0ZLbnpVaTNRazRhR2lINXlP?=
 =?utf-8?B?SmJJMFd3MnRDdWZpVEpwZmMyRUw1Q1hERCtLSVVOV3U3cmNQVVQ1NncxVGNP?=
 =?utf-8?B?YWJ5MXdHMXNDd3dnU1daR2NzOXRxV2srR1V3ZGVWVmFsaTVUZEMzYVBCazRD?=
 =?utf-8?B?clZMSDRiUmp1OUFJcm9xd2xEcnprMm9xQmszdDdZRUk0RC9jOW14c1Y4MlpF?=
 =?utf-8?B?dUpxOXRWWUxtWCs4aEdJOUtqV1M2aExpL3BHODBVbVFyaGJxQjlEMDYwY0xL?=
 =?utf-8?B?MG81NFF0M2Nlb0lyYWgxb05GQ3o5Tk8vaElzdDkweHMreTlaSEJvTkhYTnNC?=
 =?utf-8?B?Ym8xdWdXdDRCODU1OGhvNy8wV2diWVNUMTVXNExNR2IvM0lpVGU0U21DUE51?=
 =?utf-8?B?Y0kyNVprbStYR2h2ZG1rM3YycEpqR3YweWxzQ2pxNnlCQmUwK2dvWFp5SU5T?=
 =?utf-8?B?K1VseVN0d3RObDhLbmtMblVoWVRGMUFaYko3aTRzNTZCOGhMY0h3aTl2cFRZ?=
 =?utf-8?B?blNjZ1BNc1g4NzRhb0VwZ1dKbjRuUjIzdHVHcE52eVJKUUxIcVdCZmpjaDRk?=
 =?utf-8?B?NFFyd1JneXpzY0xjQ3pldkkyOVliZzN3MzhTeTIrM09LVXBjTzFlcE10dTdh?=
 =?utf-8?B?UFZQdTVRUWpIUUh0Y2lRUncvV2FDMHV4YTg5K1NwaVZEVnk1Q3FSRTlBNU4z?=
 =?utf-8?B?VmRFeHZYbkZVT2tvd29EZWFJV3I1OUxCdHhmQk9ORkVPa1AzVXFHQjNCWVha?=
 =?utf-8?B?bEpMQWJoeXlPNjZOanNkTXRBYmdHNlFrUldBWnhvazk4eEJkdlA4ZDVSanBY?=
 =?utf-8?B?RzVDVzc2ZitHamNaYlNqdFh5eDNteVFJdHI4SE1wbk1rNTBhdlpCK2kreFUz?=
 =?utf-8?B?Q05TSlhLSE50TVN3VTFxTUk2RVJ0UVRZUnJvd2x0a1B0MnlBTDBEeVJuOStM?=
 =?utf-8?B?NFlsOWpzY2pmM2RYZWhZVS91ZGU1MlVzdnJWWlVVSnNTdjNTdmFyRmRnUFNy?=
 =?utf-8?B?NGkxL3IrQWc1elh2bWFhckVOUDFjTm4zSndFWDhqd3BrcVpQT2s1dUlaWTB3?=
 =?utf-8?B?MDVTTTVIM3BvS0Q2OXYwR1hCcFpxamFIN0F6Y2I3bS9nRkZYOU9IOUNiUkp3?=
 =?utf-8?B?allqdXp6eGJHeVErWVBDMThXc1N1VUF3OG0wcE8rTUgwUk5WRE92TE9CKzhi?=
 =?utf-8?B?RENxejJBRTBFNzNTSkF4RHkvd0EzQzdURGFBUVl3U1hUMXhJbGVJcFE3NTFM?=
 =?utf-8?B?eG8wZUNpTzFJaDZCNjlndjdOb2J2ZkV1NTdnNFlncGNld0pCblAxZnN2U0Jp?=
 =?utf-8?B?aU9xM0pjRkhxenFHZmZ6c3IraElaWVAwOVlSbUpuV0JtOExldmRWcVZIaWNW?=
 =?utf-8?B?SFg0ZmE0ZHIwT1hweC9pSGtBeWRUMkM4N2NaQ3Zoc25jenMwK3JSTldwbisx?=
 =?utf-8?B?L0tEY3dpL1BmckQ3RTdheG5xOG9yK0xlRGJmZGtjWnN0ZTJ2d1ZvTWY1ZVIr?=
 =?utf-8?B?OWhCMGU5czZXTGRERHVtSm5rTjdZZDB2RzgvR09QL0h0b0tHcS9FYU9HMlZ0?=
 =?utf-8?B?aUV1b2prTUxmNVJ5VGVORkp2SlUvV1BBcnNZTldGR3dQaXpZZ09pUmVGbU03?=
 =?utf-8?B?SVpTZzdhRXZIK3BKekdsbk9HcGYwYWhLc2FrVE9JQUJEQnhUNDh2SHZnU202?=
 =?utf-8?B?MDNYeWRldGMrK0ZiT29tSnRIVkdmS0wycVNXN2R6VGs2L1FvSnlDYkxhYlZ4?=
 =?utf-8?B?bXJOMERjeG5kZE5MN0tNYklDb1VkN1lNMGJzdVlCem1lQ0pJQTNoU1Y4eWlt?=
 =?utf-8?B?MkFCZUhmbURIZ2NtUWpvVHlVd0dEaStDZVl0NEpaV0N6aG1zSVg1bjZhWjZ2?=
 =?utf-8?B?L2ZZNGFxcXVMcnRWSVZNSDFTYzY5ZXBleU04K2RETjZ6ZXViTDFydEhLdWJq?=
 =?utf-8?B?VlZxVmhCWjBkblhvOVZFdEJMRFJNRHdvVHhzUmRRcnhCUnhIbUdCUDZMdVpY?=
 =?utf-8?B?T3JwemlGb2preWJWNFU5ZkJ0TmsrWUNZSWJiSVJRdEtMYmhtOVhzaEZqc2E2?=
 =?utf-8?B?MlRxT21QcEdaR1pxTmtFelRsNG95T0lENnc1aFFYVk5tUFVvTkc1RllBaFN1?=
 =?utf-8?B?eURCb2djZ2RnODZianVVWmxmR1dORE9pNHFlaHV2NTJpL1g5MzNXaE9hTzUy?=
 =?utf-8?B?MFAwTHVlZWJVS1I4U1hzKzQ3SnlibEN4MjhoaDREL1NCaHJ6OEZ4bFIyQ05N?=
 =?utf-8?B?U0x3dVJrL0hBZFdTRmR1enI1YVJoR2Y2R1ZaTXpxTGltUGtldWp5alBQUFNW?=
 =?utf-8?B?UzYyL1lXOFQ3RUhoanFYUk42NEFKTjJ2YmpmMjNCMHJjQVpOSDRiaUd0Q0xh?=
 =?utf-8?Q?6RHo8eXSiDL5nsYt56BUqL0GGowdFXdRVc5mK?=
X-Exchange-RoutingPolicyChecked: 
	M65ebcdpTc5VeJXbBf4So42ZkobO9msWBkfA6JOCpIT7GwtbsKM93vgND3heIWYY2OcSOKIlznJPAUiCR33Z6tAr44XBh4Stj1+YQ7RALgk9ELJqqCfEYgCJVxotlvkkqLBbFiTAlUR6z0Znvyh0vm4oh98atpZvsLEl7x/syvMAvD8WBraczzxpbtYfwyJQpeOIzbvItJuMp7/23EXz9MLxt9hLwSvwojElwsM9TZctObsB7+iMy0eDpZ7JWOkkTnEXSQvCdEzxpCddJ3jEs5GSqhvKhkc/FkNgybdt7YYAwZF2mQ8N2IOgcZdu7gD/FtYooFBJxq9BzAHTpQBjDw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d38b4e2-163f-4d61-7f5a-08dec6aed294
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 05:12:09.4147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7+WQjWPCotlQW5zsxFdPYt6U/fBxDDBViAq8r7LT3Tk1ReweldjYEmlL1z3qU3S8SG1/h6jJTicg7xS8+T7x8gw4qZnqbL+5Frh+s2zIcz1qOX0Cxz4VLQJETaJpn38o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4857
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA0NiBTYWx0ZWRfXzuV1191l08Dn
 P2pQqzj4Xy/tBbny1vuhnjGMEu7FLORgI7hKEpsPzCJ4dG+cimMCTR9ypgR2qj42Lj7LdcztczW
 8bWIvh8L3WlQOIpFFfgmdGBuQtNa4SpMtuOKvjEOMJsYFpkwbRlo2xCXXzk995ioDB4xLzp7DEB
 LeEr8sCC1ym6SQ0AP1PfypffhwL5MMcX6akc2GX06eg7L0++aXQaOWhutvl+LrK0ussogYClkEk
 rN7JzLRD5rrd3pqnpJyvihXSiIaUIvp+LyoFTRk/Pe6JyTXg05leTexiNPE+gTWpuPMLPFJRvL6
 LY7ObzXgEIS3/g/rua8BImdEVkgq3FsPt3L4p95MEFgIlTepJfeukDI1apY4IKY8XAyeIYh2tIv
 7hawObgMqGycvOj+PPXBYp/ItR5nlDzwaXxxyI94+Cd61dcjHOEPLqgDKP1qXp6xdYgpWDt003f
 s0CePJwSyHCBypxt5Bw==
X-Proofpoint-GUID: wQOGupnmHxGq3TBs9ZkIjKcJQi-sc8vr
X-Proofpoint-ORIG-GUID: wICDtLKxmGvpFfhbd7FnEooo5MppsX8W
X-Authority-Analysis: v=2.4 cv=afhRWxot c=1 sm=1 tr=0 ts=6a28f22e cx=c_pps
 a=6cA/pxPA0XCUgbB+gUSklg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=9OB4AcKHDhToWpZ4ohQA:9 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 spamscore=0 phishscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100046
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 05:12:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238311


On 10-06-2026 02:52, Richard Purdie wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> Hi Deepesh,
>
> On Tue, 2026-06-09 at 07:22 -0700, Varatharajan, Deepesh via lists.openembedded.org wrote:
>> Tested the patch with the following builds and all completed
>> successfully:
>>
>> rust
>> clang
>> mesa
>>     --with multilibs enabled
>>
>> The changes correctly resolve llvm-config from the native sysroot,
>> eliminate the need for the previous llvm-config copy/symlink
>> workarounds, and work correctly with multilib (lib64) configurations.
> Did you test this on non-x86?
Hi Richard,

Yes, I did. The failures reported by the autobuilder are limited to the 
nativesdk builds.
The target builds completed successfully across all architectures.
>
> I ran this through the autobuilder and there was a lot of red:
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3956
>
> much of which look related to this change :(

The failures were traced back to two tasks:
nativesdk-rust:do_compile
nativesdk-mesa:do_configure.

Both issues have now been addressed. I'll complete some additional 
testing and
then send a V2.

Regards,
Deepesh

>
> Cheers,
>
> Richard

