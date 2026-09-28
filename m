Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4EE3C9833E
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 07:20:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.52072.1790580000092272240
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 00:20:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=SRmABPaw;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=373100349c=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S6cbjr1666899
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 07:19:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=8LyELaAXm
	xJXJ5Sk2mkXp2waZM3nmZs31V9kzFuzOe8=; b=SRmABPaw5V3Pgk44ESSe1D3fo
	c/jTbbxYHSOxuAo8RaBGiexslBIM76uGF8Yu6uf6lxzcV+CpUxaEwY+2WLUb94X+
	XZU19k5hNz452HKI+ndtt8tjjm/e45ghS1Tg3iuOsBK0hnh6YVP9Pq2HNmILQrS4
	Ojc08WtZcggWHQHXHzX+3+28M5dcpXI734XdDVEvINEsUyTVfBV7AIMxbUgT8TAu
	naRnGeghTG/xua2TeZVHC8iR35eVrl/QCOu134+ijHj8/zu72Pplkp9sUfy6bAhG
	FHhcvjXpxtAylR1M30YLp6RBUlq6exF+Bgd7LqX8jOJnNpkj7cukAHpFP8vbw==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022107.outbound.protection.outlook.com [52.101.48.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gx38wa7wm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 07:19:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lJww7VIr1dh9mo/mGz50I7bPcFfg3dzObLAiBo++i1DOTEw6cF+Gv+DfNH9q/IbK/zVXjQP79+1FzA04LWpnopmVSGqb0yulubwqUmEg6ZsDILnZctBLh1QEJ8YOqE8qtF1MX4GONpRA3YFFHGlpFEp3KQqGPsw/JMsSnxIp9iozyPEz34Kc2+RitlX74+a1n1aRg2eP20ABiRIpjcdDRJYiXr+7BrtgNmYmZsfhSImravDN82FjnoijN5m2dlkWOF0xPZzcuBLgAZI270f9Sv7CwxdnqiIHfs+oIpiMbllND9D4MNtV1LQTm2Bd9XUjmh4SYmM7xU8IBmAn0laQ9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8LyELaAXmxJXJ5Sk2mkXp2waZM3nmZs31V9kzFuzOe8=;
 b=W7Jdh4Re932Ct+ogY1tVExr6Ht+i2NAy9+fokAxTD0Xp59OYi834Jn3eJ4ssyvo36z+MkVmDYTJW/jbivC22hfH7gvPi71xRXMr9GRzU/nWYJvBBqcb3OpvyW2G9Q2nOhhPZ80ePeUKBEomy8ArdS/ZoR7ZdLdEX6O53NaLtWKRIQ0qmSzH2N1z6M/LhhvSHnIodUWEihwZvMXC9eHUlb8Wn4FkPN3hceTaTEYnCnQ7Qw3TimR7VvDWHoqoly4HC/TAZuey2Cdo+VWsVzOREgolP+DEc0T2HD5D6NI4U6TDGs3zq+Ln6UDIz0Ae5obXVE8x1RPPNxy/dEBmQpW9cuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from DM4PR11MB7328.namprd11.prod.outlook.com (2603:10b6:8:104::9) by
 MN6PR11MB8217.namprd11.prod.outlook.com (2603:10b6:208:47d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 07:19:55 +0000
Received: from DM4PR11MB7328.namprd11.prod.outlook.com
 ([fe80::26e8:ea57:9a33:9a86]) by DM4PR11MB7328.namprd11.prod.outlook.com
 ([fe80::26e8:ea57:9a33:9a86%4]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 07:19:54 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, SunilKumar.Dora@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [PATCH] clang: Replace OE-specific test guard with upstream backport
Date: Mon, 28 Sep 2026 00:19:40 -0700
Message-ID: <20260928071940.3890993-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0153.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::8) To DM4PR11MB7328.namprd11.prod.outlook.com
 (2603:10b6:8:104::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7328:EE_|MN6PR11MB8217:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a349e64-211f-4489-a6f3-08df1d30e4e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|52116014|376014|1800799024|366016|18002099003|13003099007|38350700014|10067099003|260925021311599003|260925021911599003|260925022911599003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	H+T884+4TO9HsNigSKoN41dawVR9CPql/VYig8+iKMzqoSzlJBq9HD15HZ7cfzz3DqEB/36Xh82e9rZSBCS3EKSGDmKMn9wSyKjAtWm18UOyZMaSncyVUwKfYA6YZ0F3LA0CBfLjkGYZUQzz1CSOomTobYjB7DcbiYyTOIBAzoGs3hSPBM93x824v1o2nB6DoYm614+HQSXvkXvXwR6ets9s5mb6UgHk2JI0wrkLkjDGEJc/bhL15kYovIMp4yckH9jOL25sLcpBThk1o4i3vUKojE8vRWsBSDE6dUSyG+dVLJ+bJpjosXAjpt96rMpVsq5aa0KUD1lG/SVlCt6qoPbmkazVTwkZ3dE+0wQFFbpYi8wF9O0kb1cVmOJtMe7vQTDOb7IVa+A733DywBwZNOe7MItvkt22idfH06neGviGTfduuYZwhG/5MHKGplxjgMcWGu2NcMd5uYFs1CUTl1Ov2f9yQP1EZRkk9c7BZSRAcrzl+eru2+ssrz35U0pUkeIholUTIRDhSLfL+PzP/X/qA5JN0rzKDdvp/QnESUaXJet6kO0JVt5KQWmvSvDl/y+XbteOYvMMtlp+oW1u0H5BniSVqFmdIBiQQdnvej+0a410Nan02g4XrAiJ6QITpKFWRvd5FTKF6TQ2d1kZjXbAI5HLkySlXeit3ftR0OBEJ1wqnmx//bvxuCl4nssbLZpW1+BA67AhAHEIJ7Vmqm4vHvmTGyUZ02lgtp/NIhI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7328.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(376014)(1800799024)(366016)(18002099003)(13003099007)(38350700014)(10067099003)(260925021311599003)(260925021911599003)(260925022911599003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JNR0EyE8nx06U+4iRy40LIi9Zkg9tTZYIDlhKewBmw3CIB+qYnaYLJlE4lXo?=
 =?us-ascii?Q?H4Du/nJL7q5r6W+qeuFMuujJwaj40F13bxTgnrPXMOWRskvJW+79WZ8OqvxO?=
 =?us-ascii?Q?fYlo3LE2F6LRrDijw+jtHpq/paxn46Sime6Er2LPN1EIs42n/EC/cO4UY+Jd?=
 =?us-ascii?Q?NZ4aviDHJWYbdJkPiT1/VCH0h8ROfDHSgvSuwVyg3eflw24ihx2pdWXIgaLD?=
 =?us-ascii?Q?ng4boi+5Rn0Ip40ZqPt0BfTuE32bWAOImQKZJ0sksdVerPQkv7oPMB2iBTEs?=
 =?us-ascii?Q?rCRqQqsZuu7o9zKJQA7Jhapi8FClV6ezYzKmDdlTRrP+h1IgFTTVWLHWcpvT?=
 =?us-ascii?Q?gsdbfCnuISdHUoe+rzxhtyNX8bD9eOwnfSalhTsBfHq+A8D051qjKWYnvosA?=
 =?us-ascii?Q?Gv1plIXo0aGKxdPIhPopGqVSodqO89PK5NBXLKsaaK7lsYuMIbAdnXdnReuD?=
 =?us-ascii?Q?vwmck7q2ES7RZmq+wCSi7JKu8BjbqI18+D2zd48Iy/qL2kWzan8ombVPG+iY?=
 =?us-ascii?Q?cZOh+4AILhgIie4ZjModrYKOdSO9+YF+EcX+TPqrmkAijOwhOb14A2+nldCo?=
 =?us-ascii?Q?re8EqnFAp6U9IjkEolPtuGO90xox+Wm9gjaNdpXe5CjqNu3ASyUmEKSYOc/0?=
 =?us-ascii?Q?672TnEmbzWLDg4hja5MPoINB8vWy8nI424/eFwznNEGU/YXn/eUXj/UvE0iv?=
 =?us-ascii?Q?FMrdUuXsqd/LO4iVa7pMOy9ozTb7hwg/KLyDvRE08j53znCSRIlGyVSfJLU/?=
 =?us-ascii?Q?0ovd6ZH2N9NOuf0BlkXEvlR+CPfhfl3GlGD0E5ZL9X8jco2x4teMjPbeQ2LJ?=
 =?us-ascii?Q?SsR+nkCUsf2e+kdmbft/kRuXeCFTLHss/8LbzPNeg22VBpfDaA1LKsEjm5cd?=
 =?us-ascii?Q?CczPO1ez43OmLYKLZJnaVP5rlNO7z9re0nsD+LR0f3il3YG5GrymEuv6m47X?=
 =?us-ascii?Q?XW2AzeJrq2P1/HS+4UZ0aRY3uEJ1zVOjr1M9HhQuYVgIq0xjsoNuftCTzjcT?=
 =?us-ascii?Q?7gUTKYG+nQouN/i6nZ8FnC2EGVtovwO5x40mT3B1Eh3rIJPIULq+3QuzBKTj?=
 =?us-ascii?Q?IPuqOMsItruqnV5oB9puTFRbNI42uVBr1NO586Sj1LlwVGvSodjaSmIyPBOT?=
 =?us-ascii?Q?m67xfCRZdUk1SyyDEFzFcuAl5lksQMHPACb20tOgrzqQGNiZoNyuY+Dd2ct1?=
 =?us-ascii?Q?5vH40e3bTTe/4ESjh7McxIg1Lz9+PFl8DVfiX3rGN4lrOUfQf0c9yA2jPpTx?=
 =?us-ascii?Q?M8p49jMgsrVT0yUKTZIKeCNSYsNvyHgHaWrzlzHuIYqWt8cCsH0Y9L2hRpwa?=
 =?us-ascii?Q?ib223MMbCB4UDoZ/Xp5aNHxzhOkl/eh3ttDwCliuc390j+rThJb7XDVvTxF6?=
 =?us-ascii?Q?U7/g1aWBmBV7JYCTvG/YRQ9b6O9YWIH34BjVkJyNdfoLWmLrl7qR2KKlrW9X?=
 =?us-ascii?Q?OiFBdfRieuEeF4mlc3IHPfQraUfFR5cVOe7BXSVaDCH86OH0nQnJ5h/s0G7S?=
 =?us-ascii?Q?6uF+X2AXinsSm7nsqA7MAZktmolYjmiNC3+J0xRTPhNuHlsWnGUz5sO8B0Io?=
 =?us-ascii?Q?dG3GW3hcyBFgDEEMk4XofTGPIOpT6CqM0xt2Dv33OMVSd6H+b1b8/dM9KQMe?=
 =?us-ascii?Q?zX3bzz+phoRs79RvlFtBsu4EscwNBa/HjrpAFzgh45lM3i9rvsbtySst9d9w?=
 =?us-ascii?Q?S9NoRd0TieoSTf8TzpP8TKC2JUHyqw0+f9aNQFY8INd4AvaDQZ+vSZ6KFO6+?=
 =?us-ascii?Q?L9/92bKE2ZoqPKtdiSxhyzKyh1Yygf61w3HGcYXRbV2N6Q4Io3yg?=
X-Exchange-RoutingPolicyChecked: 
	y6s+ayO9VF/E9hQsiRjMRUb6AOnDgv30lW5aj0uJCCxCCGubArdKlSM7tbrvFGSzotKioWCbopNUQMXTbD4fNgbRXZFZSTtD9I83D28Qfkq3w1lJDrkWuUcVcbnulXZym0H/IXY+Dnv1DyS77DoADd1+dh2STbKu+nyw65+s+Nyd4+VcHtKl8omOVuEYOpOUoChpOLRPAnSPmHG/tbRjpWTzC35OkSAYfOHu6FjyUQ9GyYA83ZnWTm9tJXdjUGV2LcFGaSs7+liL8VXabyepvdUmgAwrLpZUTc2TCjItN/z2D32KotXARrfYfSKjL72QkqbhOqVK5YtmSmDKjA/MrA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a349e64-211f-4489-a6f3-08df1d30e4e9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7328.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 07:19:54.7400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E9WsTM54/ptmdamKk+lf7/o5L+t+CWS0cczi2gJYQuXU4G6Bz+RHZsosYKWPM3sjSjc2TWDtP8UKTOxb5s5tfmUYWdVM4TSva9QZPXhaeAfWS3Cn1W9uoZa7JdILN7s1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8217
X-Proofpoint-GUID: SUYN0XZxH9e_pt0yPwmNaI5dMTmW2uMy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAyOCBTYWx0ZWRfX6+JQ0Hg76xbS
 RyfBP9zneRDHsIg+tz55pLMf6cgNaKnDsk3uH22UXVKDL9nwA1Z/ZdCWXhNkeuQJq+ELAC8d268
 hkQ/8jp6Il6nNeT0E7FgjYZBrvmp10UbrYEyI8E5Gz3Mrwz1MyGZF6Pj0tBM2G8DdqjzWY8G+3K
 ltchvxTD+GbGCVl7Gz+WYH4UDxTxc0J0YOjXLycmSlBxtPISj73x8ov62EOz3kU0ZTq6Llq85UK
 0L/eKFKtzmeVJdpju+j05yl9tNIXRRelWB8H2f/prqxHetM5/3mHSfouGw3aRstcUgYg/7QZx1K
 W8EjyTGxQl3UOphLEyjAXIoKIAuqz7h8cme37HC0/ad3FcsF6dTg1BQNRHLhP4lhHuWURDSMfaA
 ch4BglsPd+bZNT/8F0VJROVvCNkXqgZO0e8ZkqG83Q/a4Dw5EbENslo3DmoxGSIRIch1XD9Ew/v
 fgC/LFKD4TN668m5z4g==
X-Proofpoint-ORIG-GUID: SUYN0XZxH9e_pt0yPwmNaI5dMTmW2uMy
X-Authority-Analysis: v=2.4 cv=ZYSIpcVA c=1 sm=1 tr=0 ts=6aba151e cx=c_pps
 a=ZfDhP9WrRDodUAgXLfoXmg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=ImcG7QQyoc5K_-d7zUgA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAyOCBTYWx0ZWRfX4JNO1TZA4ogw
 WZYJ4gjT5k+FDrTC1kOZ/ISIa1wUSnO0CByr+MKdI0gqVLZ72cseLdN/5fwdZmEBE35m50uCczF
 vc4VJF2p/5T26cZoA7D0+wCe3H7WisW4A7BRFUlTdsTfGFeMlRW+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280028
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 07:20:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246737

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Drop 0034-guard-clang-tools-extra-test.patch (Upstream-Status:
Inappropriate) in favor of the upstream fix that introduces a separate
CLANG_TOOLS_EXTRA_INCLUDE_TESTS CMake option.

https://github.com/llvm/llvm-project/commit/f5fd1587149a039f4592b6e15647668175bb17a7

This lets Clang be built with CLANG_INCLUDE_TESTS=ON while disabling
clang-tools-extra tests, avoiding the missing llvm-bcanalyzer target
error when Clang is built separately from LLVM. Set
-DCLANG_TOOLS_EXTRA_INCLUDE_TESTS=OFF in clang_git.bb accordingly.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 ...a-Add-separate-CLANG_TOOLS_EXTRA_INC.patch | 82 ++++++++++++++++++
 .../0034-guard-clang-tools-extra-test.patch   | 85 -------------------
 meta/recipes-devtools/clang/clang_git.bb      |  1 +
 meta/recipes-devtools/clang/common.inc        |  2 +-
 4 files changed, 84 insertions(+), 86 deletions(-)
 create mode 100644 meta/recipes-devtools/clang/clang/0034-clang-tools-extra-Add-separate-CLANG_TOOLS_EXTRA_INC.patch
 delete mode 100644 meta/recipes-devtools/clang/clang/0034-guard-clang-tools-extra-test.patch

diff --git a/meta/recipes-devtools/clang/clang/0034-clang-tools-extra-Add-separate-CLANG_TOOLS_EXTRA_INC.patch b/meta/recipes-devtools/clang/clang/0034-clang-tools-extra-Add-separate-CLANG_TOOLS_EXTRA_INC.patch
new file mode 100644
index 0000000000..f7b5d03703
--- /dev/null
+++ b/meta/recipes-devtools/clang/clang/0034-clang-tools-extra-Add-separate-CLANG_TOOLS_EXTRA_INC.patch
@@ -0,0 +1,82 @@
+From f5fd1587149a039f4592b6e15647668175bb17a7 Mon Sep 17 00:00:00 2001
+From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+Date: Sun, 30 Aug 2026 01:34:52 +0530
+Subject: [PATCH] [clang-tools-extra] Add separate
+ CLANG_TOOLS_EXTRA_INCLUDE_TESTS option (#215761)
+
+clang-tools-extra tests depend on the llvm-bcanalyzer CMake target,
+which exists in LLVM's CMake project but is not visible when Clang is
+built separately from LLVM. This causes CMake errors when
+CLANG_INCLUDE_TESTS is ON but the LLVM tools are not available.
+
+This patch introduces CLANG_TOOLS_EXTRA_INCLUDE_TESTS as a separate
+CMake option to control clang-tools-extra tests independently, allowing
+users to build Clang with tests enabled (CLANG_INCLUDE_TESTS=ON) while
+disabling clang-tools-extra tests (CLANG_TOOLS_EXTRA_INCLUDE_TESTS=OFF)
+when building Clang separately from LLVM.
+
+For backwards compatibility, CLANG_INCLUDE_TESTS=OFF continues
+to turn off clang-tools-extra tests as well.
+
+Upstream-Status: Backport [https://github.com/llvm/llvm-project/commit/f5fd1587149a039f4592b6e15647668175bb17a7]
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+---
+ clang-tools-extra/CMakeLists.txt                 | 6 ++++--
+ clang-tools-extra/clangd/CMakeLists.txt          | 2 +-
+ clang-tools-extra/include-cleaner/CMakeLists.txt | 2 +-
+ 3 files changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/clang-tools-extra/CMakeLists.txt b/clang-tools-extra/CMakeLists.txt
+index 0dbdeaed9a9a..291e130ca390 100644
+--- a/clang-tools-extra/CMakeLists.txt
++++ b/clang-tools-extra/CMakeLists.txt
+@@ -7,8 +7,10 @@ option(CLANG_TIDY_ENABLE_STATIC_ANALYZER
+   "Include static analyzer checks in clang-tidy" ON)
+ option(CLANG_TIDY_ENABLE_QUERY_BASED_CUSTOM_CHECKS
+   "Enable query-based custom checks in clang-tidy" ON)
++option(CLANG_TOOLS_EXTRA_INCLUDE_TESTS
++  "Generate build targets for Clang Extra Tools tests." ON)
+ 
+-if(CLANG_INCLUDE_TESTS)
++if(CLANG_INCLUDE_TESTS AND CLANG_TOOLS_EXTRA_INCLUDE_TESTS)
+   umbrella_lit_testsuite_begin(check-clang-tools)
+ 
+   option(CLANG_TOOLS_TEST_USE_VG "Run Clang tools' tests under Valgrind" OFF)
+@@ -46,7 +48,7 @@ if (CLANG_ENABLE_CLANGD)
+ endif()
+ 
+ # Add the common testsuite after all the tools.
+-if(CLANG_INCLUDE_TESTS)
++if(CLANG_INCLUDE_TESTS AND CLANG_TOOLS_EXTRA_INCLUDE_TESTS)
+   add_subdirectory(test)
+   add_subdirectory(unittests)
+   umbrella_lit_testsuite_end(check-clang-tools)
+diff --git a/clang-tools-extra/clangd/CMakeLists.txt b/clang-tools-extra/clangd/CMakeLists.txt
+index 151f4ee028b8..3aa1b7bddb99 100644
+--- a/clang-tools-extra/clangd/CMakeLists.txt
++++ b/clang-tools-extra/clangd/CMakeLists.txt
+@@ -219,7 +219,7 @@ endif()
+ option(CLANGD_BUILD_DEXP "Build the dexp tool as part of Clangd" ON)
+ llvm_canonicalize_cmake_booleans(CLANGD_BUILD_DEXP)
+ 
+-if(CLANG_INCLUDE_TESTS)
++if(CLANG_INCLUDE_TESTS AND CLANG_TOOLS_EXTRA_INCLUDE_TESTS)
+   add_subdirectory(test)
+   add_subdirectory(unittests)
+ endif()
+diff --git a/clang-tools-extra/include-cleaner/CMakeLists.txt b/clang-tools-extra/include-cleaner/CMakeLists.txt
+index dc147f9ca08d..4ccd3da21f70 100644
+--- a/clang-tools-extra/include-cleaner/CMakeLists.txt
++++ b/clang-tools-extra/include-cleaner/CMakeLists.txt
+@@ -1,7 +1,7 @@
+ include_directories(include)
+ add_subdirectory(lib)
+ add_subdirectory(tool)
+-if(CLANG_INCLUDE_TESTS)
++if(CLANG_INCLUDE_TESTS AND CLANG_TOOLS_EXTRA_INCLUDE_TESTS)
+   add_subdirectory(test)
+   add_subdirectory(unittests)
+ endif()
+-- 
+2.49.0
+
diff --git a/meta/recipes-devtools/clang/clang/0034-guard-clang-tools-extra-test.patch b/meta/recipes-devtools/clang/clang/0034-guard-clang-tools-extra-test.patch
deleted file mode 100644
index 5e53d43944..0000000000
--- a/meta/recipes-devtools/clang/clang/0034-guard-clang-tools-extra-test.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From 9463b5d24fc62372fc2731d4d4665c64c72b55b2 Mon Sep 17 00:00:00 2001
-From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
-Date: Wed, 19 Aug 2026 22:46:10 +0530
-Subject: [PATCH] guard clang-tools-extra test
-
-clang-tools-extra tests depend on the llvm-bcanalyzer CMake target, which
-exists in LLVM's CMake project but is not visible when Clang is built
-separately. To run clang tests, disable clang-tools-extra tests for now.
-
-Without this patch when CLANG_INCLUDE_TESTS is ON got the following error
-
---------------------------------------------------------------------------------
-| CMake Error at ../clang/21.1.8/recipe-sysroot/usr/lib/cmake/llvm/AddLLVM.cmake:2113 (add_dependencies):
-|   The dependency target "llvm-bcanalyzer" of target
-|   "check-clang-extra-clang-tidy-infrastructure-header-filter-from-config-file-simple"
-|   does not exist.
-| Call Stack (most recent call first):
-|   ../clang/21.1.8/recipe-sysroot/usr/lib/cmake/llvm/AddLLVM.cmake:2221 (add_lit_target)
-|   tools/extra/test/CMakeLists.txt:87 (add_lit_testsuites)
-|
-| CMake Error at ../clang/21.1.8/recipe-sysroot/usr/lib/cmake/llvm/AddLLVM.cmake:2113 (add_dependencies):
-|   The dependency target "llvm-bcanalyzer" of target
-|   "check-clang-extra-modularize" does not exist.
-| Call Stack (most recent call first):
-|   ../clang/21.1.8/recipe-sysroot/usr/lib/cmake/llvm/AddLLVM.cmake:2221 (add_lit_target)
-|   tools/extra/test/CMakeLists.txt:87 (add_lit_testsuites)
--------------------------------------------------------------------------------
-
-Upstream-Status: Inappropriate [OE-Specific]
-
-Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
----
- clang-tools-extra/CMakeLists.txt                 | 4 ++--
- clang-tools-extra/clangd/CMakeLists.txt          | 2 +-
- clang-tools-extra/include-cleaner/CMakeLists.txt | 2 +-
- 3 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/clang-tools-extra/CMakeLists.txt b/clang-tools-extra/CMakeLists.txt
-index 87050db..3824129 100644
---- a/clang-tools-extra/CMakeLists.txt
-+++ b/clang-tools-extra/CMakeLists.txt
-@@ -8,7 +8,7 @@ option(CLANG_TIDY_ENABLE_STATIC_ANALYZER
- option(CLANG_TIDY_ENABLE_QUERY_BASED_CUSTOM_CHECKS
-   "Enable query-based custom checks in clang-tidy" ON)
- 
--if(CLANG_INCLUDE_TESTS)
-+if(CLANG_TOOLS_EXTRA_INCLUDE_TESTS)
-   umbrella_lit_testsuite_begin(check-clang-tools)
- 
-   option(CLANG_TOOLS_TEST_USE_VG "Run Clang tools' tests under Valgrind" OFF)
-@@ -45,7 +45,7 @@ if (CLANG_ENABLE_CLANGD)
- endif()
- 
- # Add the common testsuite after all the tools.
--if(CLANG_INCLUDE_TESTS)
-+if(CLANG_TOOLS_EXTRA_INCLUDE_TESTS)
-   add_subdirectory(test)
-   add_subdirectory(unittests)
-   umbrella_lit_testsuite_end(check-clang-tools)
-diff --git a/clang-tools-extra/clangd/CMakeLists.txt b/clang-tools-extra/clangd/CMakeLists.txt
-index 890562d..c4d6623 100644
---- a/clang-tools-extra/clangd/CMakeLists.txt
-+++ b/clang-tools-extra/clangd/CMakeLists.txt
-@@ -217,7 +217,7 @@ endif()
- option(CLANGD_BUILD_DEXP "Build the dexp tool as part of Clangd" ON)
- llvm_canonicalize_cmake_booleans(CLANGD_BUILD_DEXP)
- 
--if(CLANG_INCLUDE_TESTS)
-+if(CLANG_TOOLS_EXTRA_INCLUDE_TESTS)
-   add_subdirectory(test)
-   add_subdirectory(unittests)
- endif()
-diff --git a/clang-tools-extra/include-cleaner/CMakeLists.txt b/clang-tools-extra/include-cleaner/CMakeLists.txt
-index dc147f9..4855577 100644
---- a/clang-tools-extra/include-cleaner/CMakeLists.txt
-+++ b/clang-tools-extra/include-cleaner/CMakeLists.txt
-@@ -1,7 +1,7 @@
- include_directories(include)
- add_subdirectory(lib)
- add_subdirectory(tool)
--if(CLANG_INCLUDE_TESTS)
-+if(CLANG_TOOLS_EXTRA_INCLUDE_TESTS)
-   add_subdirectory(test)
-   add_subdirectory(unittests)
- endif()
diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devtools/clang/clang_git.bb
index c54a49b618..3b93f0d02c 100644
--- a/meta/recipes-devtools/clang/clang_git.bb
+++ b/meta/recipes-devtools/clang/clang_git.bb
@@ -67,6 +67,7 @@ EXTRA_OECMAKE += "-DLLVM_ENABLE_ASSERTIONS=OFF \
                   -DLLVM_TABLEGEN_EXE=${STAGING_BINDIR_NATIVE}/llvm-tblgen \
                   -DCLANG_TABLEGEN_EXE=${STAGING_BINDIR_NATIVE}/clang-tblgen \
                   -DLLVM_INCLUDE_TESTS=OFF \
+                  -DCLANG_TOOLS_EXTRA_INCLUDE_TESTS=OFF \
                   -DCROSS_TOOLCHAIN_FLAGS_NATIVE='-DCMAKE_TOOLCHAIN_FILE=${WORKDIR}/toolchain-native.cmake' \
                   -DLLVM_LIBDIR_SUFFIX=${LLVM_LIBDIR_SUFFIX} \
                   -DCMAKE_AR=${STAGING_BINDIR_NATIVE}/llvm-ar \
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
index 5b358f7284..d10337a720 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -53,7 +53,7 @@ SRC_URI = "\
     file://0031-Only-build-clang-tblgen-if-it-is-actually-needed.patch \
     file://0032-llvm-libgcc-Fix-symlink-path-for-libcc-when-LLVM_ENA.patch \
     file://0033-Consolidate-and-fix-sysroot-based-compiler-rt-search.patch \
-    file://0034-guard-clang-tools-extra-test.patch \
+    file://0034-clang-tools-extra-Add-separate-CLANG_TOOLS_EXTRA_INC.patch \
 "
 # Fallback to no-PIE if not set
 GCCPIE ??= ""
-- 
2.49.0


