Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96223F44850
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 12:28:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.154907.1775824100434322568
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Apr 2026 05:28:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=TNlVRb2p;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8560786bef=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A4wm9w029598
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 12:28:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=P/8WtgYKtq3E3AzL8DTy7g
	6KYwCYrcNJ1lTDGZmMlfM=; b=TNlVRb2pWRD1sm9S41YoP4TuV33gYC7R7co6AU
	SKF9PBs2EXXqNGxlUGA69OqT2ncsBmlDxh2ztR5SuiQPkPp6Po7MhHvO4gGJSnzN
	Yd7+puXYdI2MjKGqIkaMZnVMmannWtxAFdB9PegLQDr0ug5iWDazUe7N8uJVxxzw
	Qv0mkZGoijBpLYO1FwZukKWsetDGHlu2SdiXaJd/PGNsNx4cCDOOnSwia5MsFe+g
	cux6GL3aZvAKaDZHF8MQK0OQIViNOdyqHiDht8CHdaJwfhodkkVRP+VXt2l+lU37
	l0nAweU89IWennDXt5jqCWyqj/aLPWEfWovHv1p673bhQy2w==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012033.outbound.protection.outlook.com [52.101.43.33])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dcmrydg9k-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 12:28:19 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TjAeTlZoL1RmQzFN8imiFBVuMOFj9bGCYyW4MyZjqcTFHP1lE/uv7ahtpxCnsDxjgHo/QyhPb7DktYbq6lFQJMeI9QtFCOgjB3HiF+LXVnFWFeD328gQt6YPv5O4Myd+V1qQHMHOZBMHqcmtJYOruzKulzGAcebL/qJW9NnSCz7KxAfvGsyt5SI2q4VwGQfMIi7B3gPu1rYDGlle1r0j8leF0i+vrF0BW3kE0+ObN1yqCI6zOYlzIIJ+J0hCVl7uxjrzYaiUtNOqei0ZvG15EJdFbJOp9NlHC8d6yUVhBEziJuD53wURA9DdWQirkn9V6iZ5L9+v5Tn69lBjhgVP2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P/8WtgYKtq3E3AzL8DTy7g6KYwCYrcNJ1lTDGZmMlfM=;
 b=DboYobcji1TtoEWRKUgP8/MoVmgEtFkRH/y1KP7RIgKaV2gG/mTTdBytVnD3sMv+ulTr7+SyoKqKa4Zp7TioSYjgDJnmRm5wRPbwXBIuUugkB+Kqow1LzU7I+lgUDyAdaTApMyon9o7ZVFaakKyO34V3hJT8D9rfsdm8kQrws7nPMK5QOkPDcIXarwDitabJeaZhGKHFQm1hFLQ/xpjJFMQZOik4RaNXdZQmIQr6m8EN0Tf1cMLuYjv78NJnHWHIDpLqKG6krYFvXwkNqOwtyuSli9eKh5XOu+kbAgwviPmC2GRhNZkXUoH85IOXA9ibWe3MeI8qPMbnC50tq5R1Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 DM3PR11MB8670.namprd11.prod.outlook.com (2603:10b6:0:3d::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.42; Fri, 10 Apr 2026 12:28:14 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.20.9769.041; Fri, 10 Apr 2026
 12:28:14 +0000
Content-Type: multipart/alternative;
 boundary="------------mEYGynrd2OMLNBtDgRlr5aRZ"
Message-ID: <c0d953d8-7f12-4056-bd97-e4e908d4e12d@windriver.com>
Date: Fri, 10 Apr 2026 17:58:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [whinlatter][PATCH] glibc: stable 2.42 branch updates
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
References: <20260410120908.2669458-1-Hemanth.KumarMD@windriver.com>
Content-Language: en-US
From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
In-Reply-To: <20260410120908.2669458-1-Hemanth.KumarMD@windriver.com>
X-ClientProxiedBy: MA5P287CA0139.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::9) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|DM3PR11MB8670:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e9379e3-d69f-402a-56ee-08de96fca302
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|8096899003|13003099007|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	ADnfqhIxJorx6c//PHXoStZt8Q3JFRZvPXm8TLzAa2AtmNp1z4MGhY8D27zzGS6lsvE+aQX6y3fkxgWTqnr5im25NozeipXKpo/GMwuN6RPCngBXp6anCXdKmHLWa7auubShB1zyydpUzilasOSouJCWgq+iGdugdeLo1uolxZmAs3/Acji4vjxr+7v3PQycsFgNfoN8SbS9tuHa/fdsZA7bnLuuyklG93jwAhl53oi9x1zm75q2be+ileL/REj+OQckLH5Fs2Tc2YEiZ3oFH2exYuqVTFzrrWeS4RPY5QCwqM9PMyp8SpGVvOxaY+Qs+CFM6vCquVtBdgZCmdNZXzoB+CFy4sVdqlkHp0MP9VnVNi3sXgzMoX6+unKtMz+UD7K1Fn8Gnwnjh+hbXEdXClteLfrO3pmvex2YpW0jHo9tIm2MQCV/oJOIwQgFR4BotEA9I3nJyor0+b50RkmfEZrqDdgIZ0kpB1qBADNVE0A/VYrGCC1HLcM0rkglQikNj8wIeh1nz3zirny9gvd7qkX59HPCs70+/9u8Bu+fHwaspPLrfU7Qp/yZwlgqI3sAnTYtaeEKKucIpSs0Po8JMlp8Ads+yvy9lzf/TjHlHoLN4rdTgw36szviy5+VL3p3pCGL+bYhI9qPn1UYoqzSgKTU0L/WNDp/Wa/nkT/6gS0wCzmNIo9slJHrF73jwcVM
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(8096899003)(13003099007)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bjVyZ3g3KzBFdnp0MEw5K0dWa1BlVXYwVWQ1UE5pRzRYbXJ1RnFHTWVsaFhp?=
 =?utf-8?B?QnFYOE1kNkRwbnFrY3FGc0hnSFRTTUpFM0h5aHpVNXZFK25EVFBnWk1ZYi9y?=
 =?utf-8?B?c0Q1SGhaNE9WL1Z6SExmR1Y2NUlkMmsyb1Ryam9HY0xDY0tYcERUWDVGaHgr?=
 =?utf-8?B?ZW00VG1OdUxieXlQZm9Yb21zWW9NK0hYeEg3OGVjSUhLSzV0UjJZWnUrS0RZ?=
 =?utf-8?B?RlhlZnVnVUl4NjI1S2xSektTU1JSdmZHdnJwbldxQzZ4TXVlb3loRHRsUVFp?=
 =?utf-8?B?Q0VObkdadHU4cmZZR1k2enpoenNYK0VXS0VRMXJhS0laQmJaK3hVODFmVDJu?=
 =?utf-8?B?VWQ0OVI5eGJVdmVudjFNS1NrWmpCYlcwNlVZSEJYNWt0MitJU2Naam02bGFK?=
 =?utf-8?B?K2VHcTV0SVZWOFhwNzIyMUxUcnpjcm4yeXhLZ2o0Q1VvNDMwVGM4SnI5b0lI?=
 =?utf-8?B?NW94VlVEMjZSS2hYdlRPdUxOQURoOTd3TjZJQXFMblNCaDhwTWlUVFltNGg1?=
 =?utf-8?B?b1hMdHhlTGpDTEFFNW9UckdHcm01L0IvWHcyUjVnZ0IvL1lxdFJDVDZFZWRO?=
 =?utf-8?B?dFpBa2M4L3pkVWxhbEpHSGpWUVZURXcrcGJPOUpQWTY2Zk80a0hkQVpoTmdZ?=
 =?utf-8?B?T3lOeThHS0ZoV3lvcGdEcjB0bU5rUHVNQ3F4M1BGVHIzOEFaVmpSNUpKcFRM?=
 =?utf-8?B?UDVkY3lrQ2h2cFF4VGNQc2pjb2kxWWtQRFpQMzdhTUZ5bTB1VUVpQm9sNlhq?=
 =?utf-8?B?Y2p2d3B4ZlFXNkRWYkJrTE1tV1Q4N1FIeXVSYWhEenFlYXlYa2VacGhEbVZ4?=
 =?utf-8?B?RVQveVVnanhLVFNzS20vaUI4cHlsdTJUdmVjblM2dVU2aE9lSnlzYzNlSTN5?=
 =?utf-8?B?ZzlzQVNzUEhTUjhxQjJHdEczYllzK00wdXpHTWNaNktVT29HT1FhNEN5R0Ru?=
 =?utf-8?B?NDJiT25TSDZkQkdrK1MyeWw0RC8zNmZrZUNVZnFwTm5KNnZ0MCt5Z2ZIZFZR?=
 =?utf-8?B?VE1wb3NrVTBIRjQyUjJzMm1lc3NIUDdzN2VCcTEycVp2RnpSV09heWRuajA3?=
 =?utf-8?B?NDFjVGZValFoUnZXMysveDMwSm1qQ3l0alBKL3Q3RWFSUzIyenpaOW42K0lE?=
 =?utf-8?B?SFlEblZxR1pNYVgvK056OUpqQUVKUlE2SnhtVnZrTFJsQzJidFozaTVBcy9l?=
 =?utf-8?B?bGovNTFOYWsyaUhSS1F4TEU2Q0dscTgzTjhLYkliV20zcW1aVlFBWThpTWJ5?=
 =?utf-8?B?ZS8zQzZTTWk1RlNvWVlZdUc4SlFlcm1CaEtjQ2JrRG1HbHozUHVRZGJ3Vm9U?=
 =?utf-8?B?YXZzS3ZaWkpxZm9mWWxxeUsva00rcFQ1TUlvRnBBbFVLWUxzSjN6Vmg1c3M0?=
 =?utf-8?B?ZEQ1R3U4Q3c1SUhpREpLT2FndVlpVEhsWld5MC9Hb2lVRnRMNDJEbG1leXcz?=
 =?utf-8?B?dHdKeHgrNW92bklGc09tVDRqdlp4a0tyU0RIbHJZSjIzUFo4RTdDbXdROWY3?=
 =?utf-8?B?MGNLbXlDNXZWTHhSVzhNMDdqQWlIeVYxK09MTUtKTjZDMzVaZmRoWDJwYmN5?=
 =?utf-8?B?QzRBQks5VW1QckVGQTNxeWwyWkU0TUxRWWlTdWxBdUd4NVR6QUhGMHk4NzJV?=
 =?utf-8?B?M2I5TCs0VVc1SWc5WGZ1ZXlFYVB4SGN1MFBVZHFUdlVYUGxlb3YrZGNvdXFY?=
 =?utf-8?B?RjMzQnp6UC81UkVzVlJMUjV1a2xRU3p0NW1abEs4SmE1NlVvMEpBOFQ2MW1G?=
 =?utf-8?B?dElKNnV2ZmhoOEN5aTE3WEN3N2JRUEdPRWlOWndLR28rUG5yTjFHK2ZuT1lU?=
 =?utf-8?B?WXJjNmEwVWhaSUZRS1M5czB0a0dReGtjZ3BxR1FON0hvd3Axa3RDQ0hWSHda?=
 =?utf-8?B?bjV0MlJWZ3YvbU9GaWoxcU1PbUhlcXFwa0oyWGhkaTdNTjZDRy8rWGttNnd6?=
 =?utf-8?B?WnNxK1ljRXRublJxUnNrcHdPR0Vrcnd1RUZQdWlqaWJSTkFQaGtWenpDazk5?=
 =?utf-8?B?NTFycStqdnM0d0hGUmx0S3pZWlBaMThORks1RnM0czRmNC95d0lJTzlWbHk1?=
 =?utf-8?B?bTZSaE5kL0xub2JqalBvMDBiYWRzWDBpaWNzMnl1eFpLcDZ5SHRDNjJEbkRW?=
 =?utf-8?B?SWN4RnF2SjM4ajM3SkpNeTV6YjlDMXpTWHpDR2xzKzh4WEd4cHFXOU9lNGho?=
 =?utf-8?B?VlByZ1piMUdJZDRsd0tvN3lTT1YvSGFRb081a01BRTk1TXExL3lXS1JPeHJw?=
 =?utf-8?B?Q3J5QnU4YUx5QXh0SW5zNzhxRk1BK1BDZUtVMktpSEdRbm1YbmZNQWh3SURS?=
 =?utf-8?B?UDZ0b1g5SHRLc2JBN2hoMGNxclIvWWFXUitWMWd1bkp6VGxHcEhJUnBvODZl?=
 =?utf-8?Q?51lam3daE9IJuWJ4=3D?=
X-Exchange-RoutingPolicyChecked: 
	EARisBgnsCv1f8jyYnZkj6yYBAX/EkiLXzqn3Gs3EHfY/xC7/6W/GGcjZuGmqAYsFrnE8IROyh2wVz9FrafAE0FHLNSiRLDFuI5Yy++77AXjSL5la6kY2gJJFWs/srfaOJ9O5oMEONmLgwDJ0Ufpuhvn4kDv31O4SsfCCZFLVV+dNm/6P+9LPfLl9022tZeMVR7hdacSBpD41UoN+aiAHfKg/l+IUH5NXuA29/RkZ9GRaxHjpZj6vUs/v9yyN1suntXcuISARRBqZeNRgaeFdIxSGIplIhlAPiRNdsKAFWFl43RFaPiQH0ClRXWnVVco21rWfE5p6KdpDlz8Cwwjig==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e9379e3-d69f-402a-56ee-08de96fca302
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 12:28:14.7378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3S/PS7xnOmFU60jlwnN+2Yc1YZWRMCPxDWJlUed8CGy/b3F18Bs2/FTpNaT2hk+WaYGavxjWzkh6NsvrOYwtxvkQZInyjKJWJG4JpGH5ovU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8670
X-Authority-Analysis: v=2.4 cv=QoduG1yd c=1 sm=1 tr=0 ts=69d8ece3 cx=c_pps
 a=BRoDR27eCUDGJJSfTO8W4A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=CCpqsmhAAAAA:8 a=I7ru0v6EDKSe9o47WgYA:9 a=QEXdDO2ut3YA:10
 a=XmQ5O-EmEw9oFXjD4CIA:9 a=Mpz8B1Ci1QwkKRYs:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-GUID: W77P2utOxnzK91JsRnWjPcCBSi02TFNE
X-Proofpoint-ORIG-GUID: W77P2utOxnzK91JsRnWjPcCBSi02TFNE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDExNiBTYWx0ZWRfX4t25ZtsSwjTP
 vcwVJExTDLvN7h1+9x5ys7REoEi7+6QgmNo3GGlf7eg4Ap16XvMz18znfiRtAdwRs4HjobQ3W8k
 mBHDOc5sdzOf21qLFkZSvjPsbUuJVv6zTyDKNp0kL++u4w1u85r3PJ6e3Dfm28nH+oo6Ztpqtp6
 NBWKsbZABs1yENkjtufeQODXmnCZaVEnhOVtWvc+QDs83z9YvtDdjiE94DUJqeXfCwU4wRYMhIs
 HKnjTgz6xe4uc3QCVT0CEXeObbipDxRpCwZoR6aDsV9MHivBIN2f6AuM1OthV89dqLdm2MSfmgX
 dSScLOd8vIBCQp3WsykSIru/3+lsnlIugqEej52qUX+kaMdRl6KUp/c1ZreVn0UPVRfShAiUnke
 5ww00oat8qAb82ZpbAIAXMVRLQamp09uz3Vj1ORSE26sfWSsa3La6fTjATbYrbP3f60oqPXOW95
 7A3B/qI6Z0MNzG+YMzw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100116
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 12:28:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235022

--------------mEYGynrd2OMLNBtDgRlr5aRZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

This patch depends on the related whinlatter backport series addressing 
build issues with newer glibc:

https://lists.openembedded.org/g/openembedded-core/message/235011?p=%2C%2C%2C20%2C0%2C0%2C0%3A%3ACreated%2C%2C%5Bwhinlatter%5D%5BPATCH+1%2F9%5D+dtc%3A+backport+fix+for+build+with+glibc-2.43%2C20%2C2%2C0%2C118744346 
<https://lists.openembedded.org/g/openembedded-core/message/235011?p=%2C%2C%2C20%2C0%2C0%2C0%3A%3ACreated%2C%2C%5Bwhinlatter%5D%5BPATCH+1%2F9%5D+dtc%3A+backport+fix+for+build+with+glibc-2.43%2C20%2C2%2C0%2C118744346>


On 10-04-2026 05:39 pm, Hemanth.KumarMD@windriver.com wrote:
> From: Hemanth Kumar M D<Hemanth.KumarMD@windriver.com>
>
> $ git log --oneline 912d89a766847649a3857985a3b5e6065c51bfd4..a56a2943d2ce541102c630142c2eae0fbfc5886b
>
> a56a2943d2 tests: fix tst-rseq with Linux 7.0
> 68099ccc94 elf: parse /proc/self/maps as the last resort to find the gap for tst-link-map-contiguous-ldso
> 426378547e resolv: Check hostname for validity (CVE-2026-4438)
> 8e863fb1c9 resolv: Count records correctly (CVE-2026-4437)
> 1a19d5a507 posix: Run tst-wordexp-reuse-mem test
> 9cd9c90544 iconvdata: Fix invalid pointer arithmetic in ANSI_X3.110 module
> ebd45473f5 nss: Missing checks in __nss_configure_lookup, __nss_database_get (bug 28940)
> 937ef7aaf3 Linux: In getlogin_r, use utmp fallback only for specific errors
> 3989780591 nss: Introduce dedicated struct nss_database_for_fork type
>
> Testing Results:
> +--------------+--------+--------+------+
> | Result       | Before | After  | Diff |
> +--------------+--------+--------+------+
> | PASS         | 6934   | 6938   | +4   |
> | XPASS        | 4      | 4      |  0   |
> | FAIL         | 76     | 75     | -1   |
> | XFAIL        | 16     | 16     |  0   |
> | UNSUPPORTED  | 108    | 109    | +1   |
> +--------------+--------+--------+------+
>
> Changes in testcases:
> +------------------------------------------------------+--------+-------------+
> | Testcase                                             | Before | After       |
> +------------------------------------------------------+--------+-------------+
> | elf/tst-glibc-hwcaps                                | FAIL   | PASS        |
> | elf/tst-ldconfig-soname                             | FAIL   | PASS        |
> | nptl/tst-thread-affinity-pthread2                   | PASS   | FAIL        |
> | nss/tst-nss-malloc-failure-getlogin_r               | N/A    | UNSUPPORTED |
> | posix/tst-wordexp-reuse-mem                         | N/A    | PASS        |
> | resolv/tst-resolv-dns-section                       | N/A    | PASS        |
> | resolv/tst-resolv-invalid-ptr                       | N/A    | PASS        |
> +------------------------------------------------------+--------+-------------+
>
> Signed-off-by: Hemanth Kumar M D<Hemanth.KumarMD@windriver.com>
> ---
>   meta/recipes-core/glibc/glibc-version.inc | 2 +-
>   meta/recipes-core/glibc/glibc_2.42.bb     | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
> index 9991c02495..9f1003570d 100644
> --- a/meta/recipes-core/glibc/glibc-version.inc
> +++ b/meta/recipes-core/glibc/glibc-version.inc
> @@ -1,6 +1,6 @@
>   SRCBRANCH ?= "release/2.42/master"
>   PV = "2.42+git"
> -SRCREV_glibc ?= "912d89a766847649a3857985a3b5e6065c51bfd4"
> +SRCREV_glibc ?= "a56a2943d2ce541102c630142c2eae0fbfc5886b"
>   SRCREV_localedef ?= "cba02c503d7c853a38ccfb83c57e343ca5ecd7e5"
>   
>   GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git;protocol=https" diff --git a/meta/recipes-core/glibc/glibc_2.42.bb 
> b/meta/recipes-core/glibc/glibc_2.42.bb index a8717c0eae..7e0aa3d5fc 
> 100644 --- a/meta/recipes-core/glibc/glibc_2.42.bb +++ 
> b/meta/recipes-core/glibc/glibc_2.42.bb @@ -17,7 +17,7 @@ Allows for 
> ASLR bypass so can bypass some hardening, not an exploit in itself, m 
> easier access for another. 'ASLR bypass itself is not a vulnerability.'"
>   
>   CVE_STATUS_GROUPS += "CVE_STATUS_STABLE_BACKPORTS"
> -CVE_STATUS_STABLE_BACKPORTS = "CVE-2025-15281 CVE-2026-0861 CVE-2026-0915"
> +CVE_STATUS_STABLE_BACKPORTS = "CVE-2025-15281 CVE-2026-0861 CVE-2026-0915 CVE-2026-4437 CVE-2026-4438"
>   CVE_STATUS_STABLE_BACKPORTS[status] = "cpe-stable-backport: fix available in used git hash"
>   
>   DEPENDS += "gperf-native bison-native"

-- 
Regards,
Hemanth Kumar M D

--------------mEYGynrd2OMLNBtDgRlr5aRZ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p class="isSelectedEnd"><span>Hello,</span></p>
    <p class="isSelectedEnd"><span>This patch depends on the related
        whinlatter backport series addressing build issues with newer
        glibc:</span></p>
    <p><a href="https://lists.openembedded.org/g/openembedded-core/message/235011?p=%2C%2C%2C20%2C0%2C0%2C0%3A%3ACreated%2C%2C%5Bwhinlatter%5D%5BPATCH+1%2F9%5D+dtc%3A+backport+fix+for+build+with+glibc-2.43%2C20%2C2%2C0%2C118744346"><span>https://lists.openembedded.org/g/openembedded-core/message/235011?p=%2C%2C%2C20%2C0%2C0%2C0%3A%3ACreated%2C%2C%5Bwhinlatter%5D%5BPATCH+1%2F9%5D+dtc%3A+backport+fix+for+build+with+glibc-2.43%2C20%2C2%2C0%2C118744346</span></a></p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 10-04-2026 05:39 pm,
      <a class="moz-txt-link-abbreviated" href="mailto:Hemanth.KumarMD@windriver.com">Hemanth.KumarMD@windriver.com</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260410120908.2669458-1-Hemanth.KumarMD@windriver.com">
      <pre wrap="" class="moz-quote-pre">From: Hemanth Kumar M D <a class="moz-txt-link-rfc2396E" href="mailto:Hemanth.KumarMD@windriver.com">&lt;Hemanth.KumarMD@windriver.com&gt;</a>

$ git log --oneline 912d89a766847649a3857985a3b5e6065c51bfd4..a56a2943d2ce541102c630142c2eae0fbfc5886b

a56a2943d2 tests: fix tst-rseq with Linux 7.0
68099ccc94 elf: parse /proc/self/maps as the last resort to find the gap for tst-link-map-contiguous-ldso
426378547e resolv: Check hostname for validity (CVE-2026-4438)
8e863fb1c9 resolv: Count records correctly (CVE-2026-4437)
1a19d5a507 posix: Run tst-wordexp-reuse-mem test
9cd9c90544 iconvdata: Fix invalid pointer arithmetic in ANSI_X3.110 module
ebd45473f5 nss: Missing checks in __nss_configure_lookup, __nss_database_get (bug 28940)
937ef7aaf3 Linux: In getlogin_r, use utmp fallback only for specific errors
3989780591 nss: Introduce dedicated struct nss_database_for_fork type

Testing Results:
+--------------+--------+--------+------+
| Result       | Before | After  | Diff |
+--------------+--------+--------+------+
| PASS         | 6934   | 6938   | +4   |
| XPASS        | 4      | 4      |  0   |
| FAIL         | 76     | 75     | -1   |
| XFAIL        | 16     | 16     |  0   |
| UNSUPPORTED  | 108    | 109    | +1   |
+--------------+--------+--------+------+

Changes in testcases:
+------------------------------------------------------+--------+-------------+
| Testcase                                             | Before | After       |
+------------------------------------------------------+--------+-------------+
| elf/tst-glibc-hwcaps                                | FAIL   | PASS        |
| elf/tst-ldconfig-soname                             | FAIL   | PASS        |
| nptl/tst-thread-affinity-pthread2                   | PASS   | FAIL        |
| nss/tst-nss-malloc-failure-getlogin_r               | N/A    | UNSUPPORTED |
| posix/tst-wordexp-reuse-mem                         | N/A    | PASS        |
| resolv/tst-resolv-dns-section                       | N/A    | PASS        |
| resolv/tst-resolv-invalid-ptr                       | N/A    | PASS        |
+------------------------------------------------------+--------+-------------+

Signed-off-by: Hemanth Kumar M D <a class="moz-txt-link-rfc2396E" href="mailto:Hemanth.KumarMD@windriver.com">&lt;Hemanth.KumarMD@windriver.com&gt;</a>
---
 meta/recipes-core/glibc/glibc-version.inc | 2 +-
 meta/recipes-core/glibc/glibc_2.42.bb     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
index 9991c02495..9f1003570d 100644
--- a/meta/recipes-core/glibc/glibc-version.inc
+++ b/meta/recipes-core/glibc/glibc-version.inc
@@ -1,6 +1,6 @@
 SRCBRANCH ?= &quot;release/2.42/master&quot;
 PV = &quot;2.42+git&quot;
-SRCREV_glibc ?= &quot;912d89a766847649a3857985a3b5e6065c51bfd4&quot;
+SRCREV_glibc ?= &quot;a56a2943d2ce541102c630142c2eae0fbfc5886b&quot;
 SRCREV_localedef ?= &quot;cba02c503d7c853a38ccfb83c57e343ca5ecd7e5&quot;
 
 GLIBC_GIT_URI ?= &quot;git://sourceware.org/git/glibc.git;protocol=https<a class="moz-txt-link-rfc2396E" href="mailto:diff--gita/meta/recipes-core/glibc/glibc_2.42.bbb/meta/recipes-core/glibc/glibc_2.42.bbindexa8717c0eae..7e0aa3d5fc100644---a/meta/recipes-core/glibc/glibc_2.42.bb+++b/meta/recipes-core/glibc/glibc_2.42.bb@@-17,7+17,7@@AllowsforASLRbypasssocanbypasssomehardening,notanexploitinitself,measieraccessforanother.'ASLRbypassitselfisnotavulnerability.'">&quot;
diff --git a/meta/recipes-core/glibc/glibc_2.42.bb b/meta/recipes-core/glibc/glibc_2.42.bb
index a8717c0eae..7e0aa3d5fc 100644
--- a/meta/recipes-core/glibc/glibc_2.42.bb
+++ b/meta/recipes-core/glibc/glibc_2.42.bb
@@ -17,7 +17,7 @@ Allows for ASLR bypass so can bypass some hardening, not an exploit in itself, m
 easier access for another. 'ASLR bypass itself is not a vulnerability.'&quot;</a>
 
 CVE_STATUS_GROUPS += &quot;CVE_STATUS_STABLE_BACKPORTS&quot;
-CVE_STATUS_STABLE_BACKPORTS = &quot;CVE-2025-15281 CVE-2026-0861 CVE-2026-0915&quot;
+CVE_STATUS_STABLE_BACKPORTS = &quot;CVE-2025-15281 CVE-2026-0861 CVE-2026-0915 CVE-2026-4437 CVE-2026-4438&quot;
 CVE_STATUS_STABLE_BACKPORTS[status] = &quot;cpe-stable-backport: fix available in used git hash&quot;
 
 DEPENDS += &quot;gperf-native bison-native&quot;
</pre>
    </blockquote>
    <pre class="moz-signature" cols="72">-- 
Regards,
Hemanth Kumar M D</pre>
  </body>
</html>

--------------mEYGynrd2OMLNBtDgRlr5aRZ--

