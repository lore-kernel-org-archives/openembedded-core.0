Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D7A3CA0EEB
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 03:25:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.924.1755746713563139159
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Aug 2025 20:25:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=QLUpHxlp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0328fb377e=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57L3PDvY2862961
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 20:25:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=MdWBjcpc9PVvcyfctLShqx/l5m6KgDPjfO5m6ZPgJ80=; b=
	QLUpHxlp4djfOiR6z3XxG35rndtdTw/cER12oV38xHoeCDqeLHb1WmVjImVFm82F
	wEt3I3Femawuj2UAxhz+rq3lrHiUlxKPi87CICtv/lY8QQRAihgXC2NyO04vPuJS
	T4X/X6uVVRx6WCmQfKLPu5i9oMGoDfdYfhwZEhjV8Kpe/X9O7vynhyXDZ1ItOTKT
	8W0PH8cNol5Em0ATO2F8r9rroAOOoTlEi1K1JYAOCqpgFVuH1ERR8QvrSVqhMeoR
	m1KBOV+2cvwTuj8yc0jUjDUDxsgqY94o700gGyAJJ9hWcfUYqWKhyj/dYppf35cO
	ia+wPXpKAUaqXHzel4qurQ==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2052.outbound.protection.outlook.com [40.107.237.52])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48mydmhp2m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 20:25:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XIyLsonfgjlAYON65aP5Ic88Np37fSHF9V1fDe3N/SYOkCQmADS6pRF3dUkLpEjdEeSz7wgEdHQVYNaUufGSHm/JzK/LTMmGvFYhyOo7htN8CF6iVusxJPrhtBbeJOoeklEFaeKjUMmirjESW4gIa8lBDGn6j7sM4fX05XRNUGni2s4pgm0cTan+QP5AbE1NKuL79ZIR9HaXxHDtDXX6Izg5wDi9+Twk0LBL6VLnP97LnTlJop7a/7/i7mhviaW4qLD4CNNuoQRt81Aar5V0Jc1CyJbw0Nwlu/HC+YRL2g13Kv2hNI0/seJzc58VnkKxsToxsuAl0+sfWptXSxdeCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MdWBjcpc9PVvcyfctLShqx/l5m6KgDPjfO5m6ZPgJ80=;
 b=HL8kTyupLeMwcXYpdvlb8Ctp4RrEDxuIEua/SoxgFkoQLnhAynt01s845DD7ETI0lCIJk/pPN43VlgiZ+WMJ3yRLtPL6b6+gfnl62/yZ+aE7Z2zfPUwwoiX4sYxKWeytGVmCG36nrSxHK1dh3Q3QJA0sQ7R/LTJJjJDv9r9NSiLPS0CM0aR+DLBh2WGMHoW8ZdNivAdwd2Q6PXPlR3oq6vUGA2GLn5jAwJFb1N6Igo+SYwAAeyXwtz58b9Bu4ZnjxlQ0Dvz1XXjoyvI4d6o14G+e4GfqUrf1sD/L8Mub7EoRlynPVA6+2i0LcA2uWyCbrh6aUqG44ANFx3wpaGUc7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by PH3PPF740777B0C.namprd11.prod.outlook.com (2603:10b6:518:1::d2f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 03:25:11 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9052.013; Thu, 21 Aug 2025
 03:25:11 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [PATCH 3/3] gcc-testsuite: Fix test failures with output pattern due to ssh warning.
Date: Wed, 20 Aug 2025 20:24:24 -0700
Message-ID: <20250821032424.92606-3-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250821032424.92606-1-Harish.Sadineni@windriver.com>
References: <20250821032424.92606-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0030.prod.exchangelabs.com (2603:10b6:a02:80::43)
 To PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|PH3PPF740777B0C:EE_
X-MS-Office365-Filtering-Correlation-Id: ba77b937-2493-406d-245f-08dde06255ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?wgni+pDiOwYc1rr2bTJNxiCqIvFk214z+Dlroz+Ieo5rctSHI63pyRioCiHI?=
 =?us-ascii?Q?5ff3pN1363Yg9Q+N0CJw+3M37gbm9KqnorVHtybUCa/NPgtG74kG8ELxHE7N?=
 =?us-ascii?Q?kPFTvWZ3f0OAJM1T/kFqxniWAYpuPkzF0kQl641imnMoE2ITobgNgF8hm2Ae?=
 =?us-ascii?Q?S6xmnC4HoH05PASw5TvZGWMpyHXbZikTpY1hGcjAThjcw5RGnRaJR6i19HAT?=
 =?us-ascii?Q?R68N2rgbsJu5ZwwPGLMTcVaOChNG7TL4S7WXiLEZUKKfXPbNyl0gx0ezGyuo?=
 =?us-ascii?Q?44qhl6E17JwO6zNxLg+Q3wJQLioBpyB4JgWuoo5JuYdBPsPcADBY737Oi2+j?=
 =?us-ascii?Q?3B3f5izRqOFLdX0LC/Nlhc7/RtVCbig6yE477ivT4IQ0DawZ1DOBUVKl2Qyx?=
 =?us-ascii?Q?BfA071MYjw6ZCcV2SS0aoPDOfQcKXUrogvq71WeTiDdtixm8qSEFYhiW7slH?=
 =?us-ascii?Q?4GYupL58TQaWTj9O4QLxvXjnrtD/iRyqrCtkXI6bSQKjl+LG7VqAFs41xoEj?=
 =?us-ascii?Q?jFyODc0CpvmyMW2IEzv32PSjUQv+i3vgJQQbkO9ENLlKlpkg8c7dNoKQcOic?=
 =?us-ascii?Q?OgzQo2gY51aK0BGVJcWrNG4U6z+Wm5WGCj8gBiLHVrSE/EzlQEpx8ihtQzhg?=
 =?us-ascii?Q?CLlR4WV2qHkxn6H/rLV2UkCwO+J3WhqhAkG4qkEqJ7I+msQbzkuxiQWPzg6Y?=
 =?us-ascii?Q?YiqigATZS0QxBnl209F27NW0VBIxIOf6kVvW7IsSCuFLE76aThtPpWJuO+Cc?=
 =?us-ascii?Q?mraT2BvxQGopsGYcCu2Mvr1yQzu0Ce6h6GVdF01J6CjX6pTS38cZggmLuQLL?=
 =?us-ascii?Q?a2UzfEXYnMrmRrxbSM7cgB72IG5G+wWg0GKKc+joq3Lb0vLT+tjrmnTqbN/B?=
 =?us-ascii?Q?QrG9L/2OfkxXt2O8z/vW3jPkx3mcHF/pwAnSes6yYsHZFpsyh69OHXMsNCKR?=
 =?us-ascii?Q?Vkn84ELtaf54FN841JQMRp+FL5cLCK9U/RbyNc+zNLyvAuoKo8Kqh9PYGcRY?=
 =?us-ascii?Q?io8Pghd3xWwCFy4YHW+CpDodzwUaHIw5v6OINRoH4iiUnQzasyVB4WUovs7G?=
 =?us-ascii?Q?pcLAqIau2i4R9Tc9ZR+aXBSjCUtChbqAXRQmkkYGQZgZj+IVfp5rs1EHTMFQ?=
 =?us-ascii?Q?NA2EIsXDAA5L86ShPWl0AlNJI7d+75RdmA2+HsAZp2PiXXRT3RcvvVEK0Coh?=
 =?us-ascii?Q?5ziGigxpw2akKp8LjS2j0j8HPVTQJko/UlIQ8L8JSFYUykEXPusWCx3b3ubG?=
 =?us-ascii?Q?0DApY5N6yjWH0JPyJBajEe14Ve/u+vHGm+sOUvGzjDcSjzP2oy5jTjX+ITsA?=
 =?us-ascii?Q?QVYMzMDNF5RPLnUHzlDogXnRJHVhHUegOHlt5hTlQ3YkeCTm8Qbowr4T3PIX?=
 =?us-ascii?Q?wDI/0rksi84E72Dd63oCQ8ek13Dm4LRiSpk/zboX//DuUiSsT5HnyF1WOKzo?=
 =?us-ascii?Q?vkW6eu6JV2PCvNNO8B5qPa2fGlODXTc/Vuc3C0xP54jW8WipSeksDw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?c7X7+3R4voJ9Z0EobvrnJHZPyapjjnssGyhNKHYqrwgakECXVF3Bw4t/9OOe?=
 =?us-ascii?Q?wsAEJIy7WJp1niSyCgDX+7fjU+JLNjuEBQaCy5i8PrmAe/G0DvwexdoAPtS0?=
 =?us-ascii?Q?vdmy/YWlVniSKbAMLqqftIbnUvVtvVeO+G0vMO1kLcYE/mUO2Dfp8WyC7lVg?=
 =?us-ascii?Q?XOFQju3a52MvH1L1ZOdUTzyNrbmuRCTbwOT8MC8hOfMPu18uI7ERFQ1Cj/iO?=
 =?us-ascii?Q?BoYPnSJMG/8542tb1dub3Py92NBikzT525g6iI4q/zKdYkk97PXvvbul8Io3?=
 =?us-ascii?Q?atH+jcblw3ybyds8PMD45mCJRp2lWJPJ0U8oDt9t7umUjXIMyv0n6bKG9MQD?=
 =?us-ascii?Q?e0sqn4Mt5PAvOSqmmpN833R/VckgWNZy0zA1nATCfSi8PMkyaorJP8SiwodV?=
 =?us-ascii?Q?CCaWERXacmTc3iHLN/+j8QfYtJUktxGwKIRENY2oSiL7FPjBV45+Kdk9c/G2?=
 =?us-ascii?Q?WTP7miypXtXVOeTW1xyR7lx0A/TTT+yrr10v7lMos9pkxGcnx6thVyJbHFQa?=
 =?us-ascii?Q?14H73wHORO7a+vI1VVTWhWIFlMI1eSJ0EpaaEtOcH53Uu3HuSrBBwaDi5knQ?=
 =?us-ascii?Q?tSa2u930ceqyPYTTwx+0JrIxuWSSFQYzbXssaEWYtG9+vEu9OYgeID0WmQFj?=
 =?us-ascii?Q?CHv3oI+saeijlteyTl54V8vkjdtf4ML+qHzNrwPEIJMRSKGXlLP3exzrYwjb?=
 =?us-ascii?Q?bwoB7G7kZBmbQBYM14OpprPT1roMIqa24h7BJoi6d7idqK4AV3C2ked/zJiZ?=
 =?us-ascii?Q?JJJRHlL9nGlvQAh5Yond+clTmnVMKa20Ff2dVOymGVBUOOqUSXI0SCoSBlS8?=
 =?us-ascii?Q?4yDGF4fRe5wLS+Se8BDej88+KUwpZFBXiu0GkPEb+tU5FZ4m2HkDvrYELvob?=
 =?us-ascii?Q?5SvI+U4WUQzbdicZI8uG42OGS2EMlIXxcUuIdFzRs4PTOQYOwU3rQshtszcF?=
 =?us-ascii?Q?rSxZbluh4qrttjf2ido4MuYAnGZGYTpHLqm+3gWgRs+kEHEcqNZkf9sd9hXe?=
 =?us-ascii?Q?WnYbHgV5XCQlL1eZvA16Oz1a8q/XZl5n3EJZfA09AjVZKyw3Jj+z64dua3+l?=
 =?us-ascii?Q?4MDiFrRJ5KOZDPtJygVT04sklNl+9EV+UpSdNLrtyBNFXfk9lmh0/VlYejCf?=
 =?us-ascii?Q?fzJ+Hy19k7ZP0V2ArBBTBPteq/EIfWgCHL5MmySrSQm7StDyZRds2Rr4TWZi?=
 =?us-ascii?Q?2JucBqLHEGmPstxbkqXLEedw393q4ZDyD2Vuk4N5ElnYWxrGEDvImwb69T3n?=
 =?us-ascii?Q?sF4CtGMo8VtMNyxdONHcEwrmmjxE+w6uVCT4I7Ei6AchkG6FGgBbcG9FZY3g?=
 =?us-ascii?Q?phf2M0VkbG6rOQkjgKYs1qUxzFWpRNR11jmnlK7CUDmFcp7Hc0DQKfrZlMIJ?=
 =?us-ascii?Q?bDsOdTyqaQ7KVVdhfJgRnxOrOyqZ0EIzaJB7Pn7ZoCiIhZFyIDjqjgMp/CUZ?=
 =?us-ascii?Q?U3lD57iy4eqmXCA3ie7T+S0W7NEnWv/tRvrcSiVVFFWCK46LvOf4KdrvkBqU?=
 =?us-ascii?Q?R40xtz8vHu7HcLUNPjsG8e5g6UbWJGXOV5zklRNWFQ32gLePnX5nzhDVOf/t?=
 =?us-ascii?Q?9xqGWp3+oIG9Q6Wax8313ixRGRWjQ5IK/ierHbZwnxCJByM2p/nXetmaT8KQ?=
 =?us-ascii?Q?LQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba77b937-2493-406d-245f-08dde06255ad
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 03:25:11.3252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dOwsb00xaD57qlEb/6P/392x67TgUPPFhwZc3hSHQBlUAH5Y4F0vLWXC+qsNKy0rwafsrdZ06XqZE3lcnenHCgVPVh64gwurj6hMS6zBUdg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF740777B0C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIxMDAyNSBTYWx0ZWRfX7AHVBFcsbUbJ
 MJNpNixeBAVBudHXAJjmwh6WSWeXFGDAmhZ3brsKt6CsDiviH2s9oUboxgFwV0Z5NwdKa2618mm
 k0cEGUG34+n0nYlkn5BcBxX3LWRO4sPzgq+gxhv7iBlPQhKH8/i2dwP4bSA3wW6lUbUbnMTlqyR
 r0gwIMqExXWWVTbMcQ+ZWuZPxWinOKEH01XvuJ/zF6mI/stLFIjSP/botcQwGlzbatS9vJN9hfg
 XE1slIuulqlzlVw/sfUfOvAe00+te0XYLf2gPC3fdB8ERqyGBOGNiNiyUpHNibsqK6mVE7qcVbg
 VfmSoYkn9IBIvwi5htRT9f4F9IJDDzCct58gEZa2BCJe1SLz1IPq8y5rs8pxsrDUJ9FdnGxcNyn
 gNnVKy+sXsoEStiC1+5SC4gZHj/cdQ==
X-Proofpoint-ORIG-GUID: YFsNGzIovsmuTmFGCHYUJUJcgFXuYTIQ
X-Authority-Analysis: v=2.4 cv=INNbygvG c=1 sm=1 tr=0 ts=68a69199 cx=c_pps
 a=dBbZTlqSfnsoIqN4OI7SHg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10 a=t7CeM3EgAAAA:8 a=F4tIFueueO1QkZny2J8A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: YFsNGzIovsmuTmFGCHYUJUJcgFXuYTIQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2508110000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Aug 2025 03:25:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222202

From: Harish Sadineni <Harish.Sadineni@windriver.com>

when running oe-selftest for gcc some of the output pattern matchng test cases
were getting failed due to below issue.

Output line 1 was:
Warning: Permanently added '192.168.7
Should match (from /poky/poky/build-st/tmp/work-shared/gcc-15.1.0-r0/sources/
gcc-15.1.0/gcc/testsuite/gcc.dg/dg-output-file-1-lp64.txt):
This is a test output for lp64 target
Failed test for output line 1 This is a test output for lp64 target

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-testsuite.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-testsuite.inc b/meta/recipes-devtools/gcc/gcc-testsuite.inc
index 3257f86907..4859d6d84c 100644
--- a/meta/recipes-devtools/gcc/gcc-testsuite.inc
+++ b/meta/recipes-devtools/gcc/gcc-testsuite.inc
@@ -87,8 +87,8 @@ python check_prepare() {
         content.append("set_board_info username {0}".format(d.getVar("TOOLCHAIN_TEST_HOST_USER")))
 
         port = d.getVar("TOOLCHAIN_TEST_HOST_PORT")
-        content.append("set_board_info rsh_prog \"/usr/bin/ssh -p {0} -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no\"".format(port))
-        content.append("set_board_info rcp_prog \"/usr/bin/scp -P {0} -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no\"".format(port))
+        content.append("set_board_info rsh_prog \"/usr/bin/ssh -p {0} -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o LogLevel=ERROR \"".format(port))
+        content.append("set_board_info rcp_prog \"/usr/bin/scp -P {0} -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o LogLevel=ERROR \"".format(port))
 
         return "\n".join(content)
 
-- 
2.49.0


