Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08D8010A1E69
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:01:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44769.1774522877777367099
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:01:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=CyYSUspO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7545a6f598=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q4NnRt193963
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 11:01:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=iv00dhAQkBoOk63Vo96rwZ6iQAjmdMg0OXtD5sFpagU=; b=CyYSUspOK6g8
	mxBdjAAcrcm8xI0Etax/SeLLbTJGtESEoCxVGEPS5Ez3TUlgddMSzn2goM5fgeqq
	+gEKxHlFeDly5P41Eb++D/kLkVWARfNKEH5HRdn/ZBLtwbaL5tN11nxxb8TKF/+b
	nA6AWS7K3GDXspeh80xtGfLBAWqL41DC3wrfH/aPjyPsvMN6fEr4FT0Xv9o8GT48
	42lvwHgZrm/zsaq91+Yx0X/vTN1fdbor2wAccVB+/paYV6V47kVrboh8o9AqA+rm
	X0DcnwNoBrDvSjn/66NGb254Pul+fBk2YMvkxx3Kzr3WCemF9r8U9/9XQzr6a7pG
	MupRHnwCpQ==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011049.outbound.protection.outlook.com [40.93.194.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1ja6xc53-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 11:01:14 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e1AlVLoqbvaU54HbewIooijBuX32h/7NmXP+cWIcgcZWAZuYx7bRnI4VOQmtXpHsxAbCwKMqWHqg0TRN8Ps5VCg5hdCQhmO2R9JP85blE2ueQt4j7ZsozXYBDcfnTbrrlumX7Jmd3oOrjP+Kn5vKwiv8CBMkr67e+aXtyDZSOORnyYBpaEaV1Lcsb5pxhhumV0sVPH/zcDdPjnfXq7NWek2+7cQ1EBt3hbd0xxz1Rd0JofPi60Ew7Lcb2c+MhaEoWg5kULbQ+BjIs6ONSNKfWSt+iPzmcYTSUCHjljwQMokuJ53lRc7WPu31kLyOGqEV//rPC8/pifKQB7SCCfWWdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iv00dhAQkBoOk63Vo96rwZ6iQAjmdMg0OXtD5sFpagU=;
 b=Rpt3rj3VeBPybDSz8hXVz5qpbYXR3najZH3MkjUsYHnlAo5QXd1Bj4ZZmpucCGooqZwnhlT8BM8oEmJmcLkSfTl1CA0GbFe83GZPsfMbUojlcbRJPV4CSuutCXLUnfe6pkLf4jJo9pgZFaWCt0bgJh7Ituwr64Q0frI9Apc6X8TnATGMGVPXPuayf4ZfTzDNgeh/HWnbFOUM+FeY3Ma9xRDUzZXb4jpxEPi769n9BdyXXadSKn+osvi/dNrNFBBelWYHwk7PPQrqgZdT9Ov75IWirT3CTBZHb47PPDhxwK5HSI2DJue6m/GYN6LGbx0URcwenBtVNfMTAhTTF9cfCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by PH0PR11MB5046.namprd11.prod.outlook.com (2603:10b6:510:3b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.6; Thu, 26 Mar
 2026 11:01:12 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::f908:c07a:c64d:67a3]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::f908:c07a:c64d:67a3%6]) with mapi id 15.20.9769.006; Thu, 26 Mar 2026
 11:01:12 +0000
Message-ID: <24090dd5-c298-4705-87b1-6ff45f36535c@windriver.com>
Date: Thu, 26 Mar 2026 19:01:04 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RR][LTS25][0/2] gtkmm3/gtkmm4: not set BPN
 [LIN1025-8580]
To: openembedded-core@lists.openembedded.org, kai.kang@windriver.com
References: <20260326102150.1059814-1-liezhi.yang@windriver.com>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <20260326102150.1059814-1-liezhi.yang@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR06CA0005.apcprd06.prod.outlook.com
 (2603:1096:4:186::12) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|PH0PR11MB5046:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ec40176-f26b-426f-ee56-08de8b26fdf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|4022899009|376014|366016|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	bnZUr08zRsc2pR3QyaTWCvL/E6VIcTWWQCKayWG4dCOsUBtP6Ws5mNy/pXQ7JzcZLUPYFSHQekENzvEKKBSef4ANl196OWutx1fzGndyVLaLZn6odASHhGND4tilL1cpt2vOceZnrXXZJByLWDIQ0MUvPTTJ+fxJgzwHcx63PkYIoq6MIU/IZv3GFbj1wQLpo6wYxdQw+602xXk9+2cUCZoTTy60PkteLP2v7DGEx4xYiFhpHXm1gv08BrSsnc68Kra9hx0sKgKgFa6nAQfdv9R71VolV87XNSu80zIuoIskJpGd1HFje7OgMUM+Rtp0neVZKVf8CO0ZeweSGqbr/aLuirTrk4+adm7FOMlPT949nBrHGnP+LCEOKfKtJMBk9hhPkqwYETfDQ0Cpu+IcmSCh4h7cUDJlhalDUDMc7wZkqq3AETZboUiFLF58EcwSmla5Py6WsfLYswA/zx6Td9uby5aDa/WbjqJICWoa5w3slbGkTJrACmLJCM+nupdBXwCqOzCIaPXWtRjc3tret+fK3pxlC/USQmSBUvJo+mQI5PjN2Y692Y0AMTYcOE2Qqw6gknO3IlvUy+n0IMGtRcbKbtJUVUS7g9uZrt/UBTVCpVHxLzxfUWU6Bw4GebhpjtuLgH0N49w0XfxwvHbjTNm5FRS+BviB/G0+/biAyS8zDIbBzycrG67W2TAgC2XS
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(376014)(366016)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WkN3U3pOUXhtNUo0and0ZVhBc3B0WDRicW1jN25kSVdaRUJKZjdxWkpXZW1m?=
 =?utf-8?B?WVJ0WmRKYmlCUUpyTVBKVEpkNUdTSmxBam1MeGRXUFh0LytGUC9FMC9Bd0FI?=
 =?utf-8?B?VTJJU1FUQzM0WGtJMjMrSGlGZExLYjZubVR2RllYRjVwY282TTNEQ3V6aWVz?=
 =?utf-8?B?N1hZM2ZvWVdWUWtnT2NjQ01kbjF1YXZlSk8veEFzYk1ySEt6MmkvOHBReDFt?=
 =?utf-8?B?Y3NkTnF5aThPcGxySjRKemRGZTFNbmZnUGU0V1cxUmR1Vm0vc2xYZ0Q5dWJ6?=
 =?utf-8?B?S0p2TWdQQlI4NFhwZExhcVRFaUIzb1VBY0NrVmpuWkk2WmE1QWYwbVlTSC9n?=
 =?utf-8?B?T05YYWxtY3kvMHpDdmF3YzJSUjZMVWpPaEdGWEM2WUJJVWN2b1RoMkNQanZX?=
 =?utf-8?B?SVU5anVHdmtGVWlEWXhWOTVaMFRKTFI4N3Vzem5aRGR4SDkzckNpRjMwSHpS?=
 =?utf-8?B?bFdtUC9UdC9hMzExdWRjR29MWnZBWnY3OHZ3YXRjVEpNQkdVZ1ArdEdlYm01?=
 =?utf-8?B?bzNucDhzOWVWMllBcnc1NGY5TlJQMDloRm9QV1QwNVFrUVowV25SaGRKT2xG?=
 =?utf-8?B?eFEyRkd4c2diU3VUUVVBSG9jSndLSjJxOVk1eElsRHFTR2JMN202RDVZcEpO?=
 =?utf-8?B?S2lGOFM4eS9OeUNndm5KRlYxLzRpSTJnWGE1akVpN3cyQnFiRXlZQ3gvWStm?=
 =?utf-8?B?Q1VFamhBaVlIR2ZycGNDcG9nZzVFQW5tejVIVmRzei9qeEdSYktyRGl4aHlV?=
 =?utf-8?B?cUQ4dUh6dkJ3bnpVMTZlWThHZHUzVHZTOTJlVmI5TWNWWm8yRmVKSHRMclpZ?=
 =?utf-8?B?R0hxblhoOERXdkRpRFNzTk90U2xReWFma3Y4ZmRNZ01SMEZGZEFYdGhMRjg2?=
 =?utf-8?B?V001RitlUGp2N0lUMzUzMFUyeHFkWmxGNVNHSUY2eUJoVkg1ZHFsSjhzb2l4?=
 =?utf-8?B?WnhxL2NkQ2FMcmVNaEd3ZDZJb2dabFVpVXg3aHJROVFRREsxYjFaT2pVc3NO?=
 =?utf-8?B?OFJodGRwdThHYjVaNElPS21kaXpRakVJMXc4bmNZNW9PRWxXdC9UUkRFamNM?=
 =?utf-8?B?aW1zRDI3Q2cxd25MaWpaMzYybjNpMEVoMXU3aThYNE9BN0RkTk5XY0R3cFJI?=
 =?utf-8?B?SHJxWTFBWnQ1Ujd3QzBBazBZT0pJanViaWJQbWM3Q0NEV3loVklqRm5kT2V0?=
 =?utf-8?B?RDdFNEgzZGZsb0UwWG9veEJuaVVyQ2JCRUhLVFNzSlQxeXpmcEdPVktoSExV?=
 =?utf-8?B?S1ZmVExFR0dGQVZiRmtCZFBMdnhhY0pzd0RkSU8rVG5XZUlUYzQ3VXNLY1Zw?=
 =?utf-8?B?aExyU2RSZTZjbnpab0Y1dSt6Mi9neTB1QTJCZXR0ZHplT0h6L2FJT0padERu?=
 =?utf-8?B?MWdJSG02aW1jZi8zSGtLTEFrbFUzSDdrZjFXNEh1bUxSZko4cXdpYmlNbmlG?=
 =?utf-8?B?VVhITkUrWCt1QWg2WUdRRWdEaStZV0huY2Nmb3FCa3h2SGtRSlhFbzhhMzgr?=
 =?utf-8?B?T3kxR1E4Z0FYK0hhaUZ0YUFGbTRBRkFLUjJzS0ljY1FZcXc5bmVXYWpCTXlZ?=
 =?utf-8?B?NlAwSEM4ajdzQm1CM3VBMWovcHN5R1hDZ0trWEdxL0hqT0dPM0xpaTlVVlVp?=
 =?utf-8?B?WmFEZnpSKzc0YnhUeEpDUFZOV05GQlJpN0hpdHVYNUUvUHhjQWRUbks0bWE4?=
 =?utf-8?B?anc5N3FaWkZxUnlpR21CUG9DVzgxbW05WE5wZzhnOTQxV2c2cklEa2xxR0ZM?=
 =?utf-8?B?dVJ1NCtDb1hFSnNVWm0wSjYvV0xQZGdtVVhUTDF4MElVVTJLNVZTTm4zKzVy?=
 =?utf-8?B?NUlBY3FVS3l1eE9iRkNGNWZNMmo1Sys5aitRNUdoMWwvN2RoSzJkYjBVTHFi?=
 =?utf-8?B?dkdhSXY1YzV5d3lNN3JBT1JEWjdMUlFDUmsyN0lEMGVsSjY5NERpM2dXbGFi?=
 =?utf-8?B?enpLL25hRzFGR3ZqNW9QbElYLzlUMC9ock5tc1VOY093cTNhZ0tkbDFIVlhW?=
 =?utf-8?B?eFNXYklhYkFjdk9CMFBkaURkN1RSOHBxU0Ztd0gvS1M3ZG0rVDA3cGFPcTdi?=
 =?utf-8?B?ejFaWXZYVXZlTkZMckdQaDEwTU05OWFsUWlaTVRKT1VNQS9xaFRtRjVZbU44?=
 =?utf-8?B?QkNDei9ULzIxOHdSV1drNkx0WlYyWUZQK01iYkxPMEhETVlSRVRoUnJnUlBw?=
 =?utf-8?B?RUExd0VIS1lkc0grN1lWYzZWN210TmJtRSttWEE2aU5PaXpBTnIzV0pZck9z?=
 =?utf-8?B?WEdtNUwrZU9sMVBUSGJKSVAvQ0o1TDZCKy96cE1qNHdxamE4THNTNDlpN2xr?=
 =?utf-8?B?NnRrV0ptK0JONCsvSDVVR3EyVkFoYWVGT3l2U2gvZVRmY29wa2RLV0Qxc1VK?=
 =?utf-8?Q?hY/YspBJOXD89M0s=3D?=
X-Exchange-RoutingPolicyChecked: 
	PeKmyP5hvjDAog6CAfr9j6N9K5RQy3WTG+AyY0oENZkFi9OI7SckVu4L0CYniQtDuigQqNd9XqA2ecRB6JWKoI/d9nDIIxfBq4KnW+IYUr0ZAOHTylrjOH+IrVAmvU0TWJ3beJ0/o3SYCLfTgJbmF67I3FUulQF3Of6oY1nZdkr5QzW3WcjxNhVqPCf7bENT3wjtOsgfPxF2z7nSAvMWd5Qwo/6dC9+wIRngcTpecoZsMIYiDgagTylViMpeE2WWr/KeuUdwmTKvTjtx/qhXsnh0Uuv14Cs6V5m/5ZcfKVxPw0FaVSe2Bv7k4C3Qy45BdOsTtgEh0/2a5aqk/V5O4g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ec40176-f26b-426f-ee56-08de8b26fdf2
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 11:01:12.2173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gwbQ4/7AM25whjHSudG/Ze5rFuyRCQgAVNwAgvrX4UHl4CM1CEqXSCdi/x1mXDSQubviOITe4b2ODCwvOwAtBu0LABC9adGQtYZxPEe6buI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5046
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA3NiBTYWx0ZWRfXyErt/Y+qSXQa
 wueZx68guRusZav2yjrFk0rkSP15J/MPb9unz97qtU75fZzoouo8vNd5VtehyNNt4g22wEjoIX2
 NZEa9rp350+ZhuK2AOTThd7JjN+P3osu/haZjn7ltppZ7NYaT9AL0OzziN3Z4rxmYqd0OqRvRko
 h5LlDqBK70fNzTIe1bb5H1dFdH4wCCh/+7vM+z2UuqcEGyEy7+njftKPuzsdAScmdTotP/siBp8
 LJKpGXusnitP+IUZwD9vVM2q7BJdJp9Ydz34QVaF9ROmxyIEica2F9af358loO+qyfrWKD4otFA
 L9mzkZ2VvAM1oZdg8sTmApN7FV0VgJ1tlE4kmNnotVIYL5r30Cs9RiSA3iri0SnLtpndl1kht+u
 xz2dClP82Pc25YBjF/dsIjgXJ4i6Y8+atchzamdOd+t+oSfaVosu+wLhJ9X12K+H2XitYsjZnAH
 CTAtrCLh9MAUrh+Vacw==
X-Authority-Analysis: v=2.4 cv=Q5vfIo2a c=1 sm=1 tr=0 ts=69c511fa cx=c_pps
 a=LWr4lAA3g636x20Wckjs+g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=bLZqKDXHAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=F44fuX4FiofK58Z3yycA:9 a=QEXdDO2ut3YA:10 a=SM0NOtVXJcAQk9PFKD3C:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: g3NZEjVr53TCL3wRAdT2t6hYaMr4IekH
X-Proofpoint-GUID: g3NZEjVr53TCL3wRAdT2t6hYaMr4IekH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603260076
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 11:01:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233971


Sorry, I sent it to the wrong mailing list.

// Robert

On 3/26/26 18:21, Robert Yang via lists.openembedded.org wrote:
> From: liezhi.yang@windriver.com Mon Sep 17 00:00:00 2001
> 
> Summary: gtkmm3/gtkmm4: not set BPN
> Tech Review: Kai
> Gatekeeper: Hongxu
> Lockdown Approval (if needed):
> Branch Tag: WRLINUX_10_25_LTS
> 
> ====== Sanity Issues: (DO NOT EDIT this section) ======
> 
> 
> 
> ====== Impacted area             Impact y/n ======
> docs/tech-pubs                      n
> tests                               n
> build system                        n
> host dependencies                   n
> RPM/packaging                       n
> toolchain                           n
> kernel code                         n
> user code                           n
> configuration files                 n
> target configuration                n
> Applicable to Yocto/upstream        n
> New Kernel Warnings                 n
> Other                               n
> 
> 
> ====== Comments (indicate scope for each "y" above) ======
> * Conditions of submission
> 
> * Documentation Changes/Release Notes
>    = Doc changes
> 
>    = Release notes
> 
> * Git logs
> [meta-openembedded]
> commit e8ab7f1c4dd8358c5aec784b28afc6b5b6c8580d
> Author: Robert Yang <liezhi.yang@windriver.com>
> Date:   Fri Mar 20 14:59:08 2026 +0800
> 
>      gtkmm3/gtkmm4: Set S to fix patch failure after BPN -> GNOMEBN change
>      
>      Issue: LIN1025-8580
>      
>      Commit 8e038dee175eeaaa4bb0835b935ef7a2a72fa7e0 replaced BPN with GNOMEBN, with
>      to avoid the confusing BPN override. However, this change makes the default
>      doesn't work, this patch fixes teh problem.
>      
>      (LOCAL REV: NOT UPSTREAM) -- Not applicable, upstream out of maintenance,
>                                   master branch doesn't need it
>      
>      Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> 
> commit 8e038dee175eeaaa4bb0835b935ef7a2a72fa7e0
> Author: Kai Kang <kai.kang@windriver.com>
> Date:   Wed Jan 21 14:46:14 2026 +0800
> 
>      gtkmm3/gtkmm4: not set BPN
>      
>      Issue: LIN1025-8580
>      
>      Set BPN in gtkmm3 and gtkmm4 recipes is to inherit gnomebase.bbclass
>      properly. But it uses variable GNOMEBN rather than BPN for SRC_URI and
>      S in gnomebase.bbclass now, update in the recipes accordingly.
>      
>      (master rev: 96a6c18a8cc6551a1aa6acc9644177b4218cb3fb)
>      
>      Signed-off-by: Kai Kang <kai.kang@windriver.com>
>      Signed-off-by: Khem Raj <raj.khem@gmail.com>
>      Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> 
> 
> 
> ====== Testing ======
> * Commands
> $ bitbake gktmm3 gtkmm4 lib32-gtkmm3 lib32-gtkmm4 -cpatch
> 
> * Expected Results
> Works well
> 
> * Applicable to
> 
> * Tested configurations
> 
>    Arch    built      boot     boardname
>    -------------------------------------
>    ARM32     n         n
>    ARM64     n         n
>    MIPS      n         n
>    MIPS64    n         n
>    MIPS64n32 n         n
>    PPC       n         n
>    PPC64     n         n
>    RISCV64   n         n
>    x86       n         n
>    x86_64    n         n
> 
> 
> ====== Reviewer Checklist ======
> [Submitters: make sure that your review doesn't trigger any checkmarks!]
> http://lxgit.wrs.com/cgit/bin.git/tree/etc/review.txt
> 
> 
> ====== PULLs ======
> * PULLs
> 
> 
> * WRH-PULLs ("wrh -m" can merge it):
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#233964): https://lists.openembedded.org/g/openembedded-core/message/233964
> Mute This Topic: https://lists.openembedded.org/mt/118515748/7304958
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [liezhi.yang@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


