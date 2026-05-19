Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CBFCCD4F5E
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 07:26:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16155.1779175558579570312
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 00:25:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=H9RSCdkP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9599376d2f=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J5F2wO3076794
	for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 00:25:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=O3G2oFeUxvrZBFhm/z8QbATlxtOKHi4ax2e3jtlTqC0=; b=
	H9RSCdkPomFCCugZqIz98hIcdS2p2ty6EqXKTTM8Cx5BYRH9CiGaA3uApIYak66F
	sapLi5MW8+4C2VsXPJbZlb1nlqp47+RZR6Fic+gB8G6z/M6qkEo6xuJHlZyC2tpW
	BJ/yrbguMbZ6Ra56GHdhFpqgLK2V7ycF3AxXK8dGmUPf+jXc9ebbAFWf+WfTckxe
	kjyIT/z+Lw0WuWah/NMjtmt3nFcMkw5C6WH4Hwl+xWuTlix+2R070DqMnGyuqMOY
	QaFyGx0DSBDsyWy+LVgUkDwoVzWXUZmuBaYkD/fLePo0AAVjcZxsOHAv3TAhrfJJ
	IvQ46aKbCeda7upSFnPGxg==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012022.outbound.protection.outlook.com [40.107.209.22])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6r3gaxe8-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 00:25:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gL2JPUekliyNSKph88ijFtGKfM8aCWFqROC4a/GHqGKTtA748Jmul1Xh7E9h1Nswmsq//yNudt+Htq4ZK+5OCB6D69ePTk8eBWRGQj9aseif7/HCxOdGEJdO3NWj4z0KJYJzOwOsCLCSOcg8FFg9X9vmlioNQWNGF8+tEH6m8spx3zIpY1/F4Uzz+wWojAj22loEeuRjRVUPeBvVoboD8x5ia4BvAQE0sAFSd08v496AbOeXjFjQsFx320CGXdjByueckjttlozva/WyJmcRz+lfN+o3ViU/4lrkeqUBwy4Q/FIlzJScrmiTINxHwhw6S37DD5ZP469LOeDH6VVsMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O3G2oFeUxvrZBFhm/z8QbATlxtOKHi4ax2e3jtlTqC0=;
 b=iT7kz+HK+GuGcrtBjYVaZnW+qCa/qDymoMprKdFrzFEV1sMmykcjZ3XYuTkeQ5nEyqagXBJ5TnATXnD3eCCtCqz0NV6oXptrdsHuCnQyLfYyoZBck2yHau+Lxbk8bXah6bsPZGyhdDbb/YTMbJB7Bv+kXMiubnUxjlujL47MsyLI1nXMl/U2cDymmbCNCyeSmaGZslNOOgdGJVAGAnLHcfeYevaQr5kHJOgLwrHr7U+j2xKhAkDWpnIGUTd/52Fpn0B6HfdaXtk+z92Fnc6w2IhNQfqt6Pa2ZncNavZIeY+AD067PhsTGmnvNOp298d1PIryXZFVPSeV3PhWwARrsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 IA1PR11MB8175.namprd11.prod.outlook.com (2603:10b6:208:44f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.21; Tue, 19 May
 2026 07:25:53 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.20.9913.009; Tue, 19 May 2026
 07:25:53 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Randy.MacLeod@windriver.com
Subject: [PATCH v3 09/12] gn: fix build with GCC 16 on musl
Date: Tue, 19 May 2026 00:25:31 -0700
Message-ID: <20260519072534.24588-10-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260519072534.24588-1-Hemanth.KumarMD@windriver.com>
References: <20260519072534.24588-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM6PR02CA0076.namprd02.prod.outlook.com
 (2603:10b6:5:1f4::17) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|IA1PR11MB8175:EE_
X-MS-Office365-Filtering-Correlation-Id: 0110d1ef-f953-461b-b99d-08deb577dc61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|22082099003|18002099003|56012099003|3023799003|11063799003|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	VBEntgyoQbI7dc2JkDjxjphFJrqteHeUZj6e9HehYWPm3G0j1IQ/BYlDdUWnnfV8lo91eRmWK171Vw9llsIUOpvxU+7+vwLQD0KJOxTI/mciuYk270sydTfy447AqlO3BMHCjZiTGEPEwjgMAdlk2YjQeJmGh9gGfdjIlbsIay+UM0TnSzH5syzcmi2BD8sa0OBN+MUbu2Q2XzyExTea8aIrLe54W+J8HlhS2zptH2G8EB5nFeO4dnA6OaUfaFhn53jQgjzlUzZH4L7pJUW/FRhH8GAph7AidwnIkoE6jwLXhLxkeD8cw+h116NDV68L3E/FteO+4AgaaHGP/CF17OKX7Z7yz39M0AjxPcdrr9vH8llK9PUJWKGH/D3gt7TPrl/cy/aLy0PnF9ooxuA9x01fpk6RqlS32vyVwx1ujFLhOLgzjpFnC9BIuHLlbstAqjoD8RFwEhC6RuQMETQAyZcnxekRvI0HANZlJrBxuMCTGCa1EF7ehEf5Q7XTsyYWrluTanUYQxOz3XoAkuBit27iHtofzEstr0Xa2q+DQgDofWXIwu+TnDb5o9IUoHy3dmHKq5VgLsYmCHHZcyp5T/7I9JPzmmrbrMI2x4Pc7ekS8h0ZBbj82eJHE/zFdB1TXSy3uUf375pSkDxwQbubhggkrrg4/WN1kNcWZ1jgFgLISSgRDGL4iuj2XEv0KTjdNpcuuj+QoLv9LYbUP20QoCEshrFIzioczKVCbfBW9AVT6/K3PW1VRCgjojW8cPgt
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003)(3023799003)(11063799003)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?H4Nc8y0fqnunH4pl7Klx8m7eJd96320jjVlqiGVgm3J57IGuVCGx/MQCDo8q?=
 =?us-ascii?Q?47loA3foCsreZcrbsNmCq/cm9vXy/c8cqfr14yEmH8XknSt3sqUzQxzsI07m?=
 =?us-ascii?Q?1jMQMgeIke7/rUJYdhC7YoiKNM1wKS5Z/04cFRcjM1vr+3Ugc3Hnp2QUCX7X?=
 =?us-ascii?Q?O7QWfQoOwmEnwOMyQRxnIVYci30qKSBeN9ZiuVZNAuV+KaBHXxTR6SkdXBMZ?=
 =?us-ascii?Q?lUaBfgaN8T6UDnchnf6takDbmFJCBQTAhPuxfNp5PBrPHzG85mBpKfmpkD1E?=
 =?us-ascii?Q?CNCw+2XSHzEvzzu5tJaR/5G4t+C6+cQ92zG50Q1n0Wj2hLo1faoDndPn4Ffd?=
 =?us-ascii?Q?DWt08ESk9PSoIefiAsWyMxq1Fa1Sy6D7z/H37LecNu/LeQwo7ORdMJmg/VA5?=
 =?us-ascii?Q?pVxGLmoWYSxc0LvFeuXLJpkNPlXa4u/seG6izJVhMmxSQ7KxEIFjL+Qyx/a8?=
 =?us-ascii?Q?u65J6niLze+SgYqyxYkJjcPQqRaHejc+0iEkbqS7329r34V2sqXcpTV0nwvg?=
 =?us-ascii?Q?pbH9ErwfA2Yvas4IJ0qQPLcjQAP2cNLjjWge44q7dB/SDX0jGJmNz2tjqvUu?=
 =?us-ascii?Q?Cg4KvbEEsS4orPDp8YowAF2QnIRJXiyp7tPqvMOMZd03fiThwF82apzHfDYk?=
 =?us-ascii?Q?NysMPbSkBAXL75g/0HTUSYVr/oAi/8ii+Y82jTGDJsReZuIowUtW2d16xbDV?=
 =?us-ascii?Q?64tsaY+36Ttntiy2k5v7mKy34E/Q7aN40lh0tQCIa4ZOKE8F7jrDSy1OQQDo?=
 =?us-ascii?Q?+oxrvJfVLY0dVH2En3oPqvdFYF22tm/RksznruxgbOpFYFCH7KtVjCEwg74i?=
 =?us-ascii?Q?ZWWtjSrf4tYcMk39o/yOJ87D1kjcWWGzNKGPqHsA6WGKvyZQjWH3K6ry+6UQ?=
 =?us-ascii?Q?aVrU1azGf3TUI7+kDP0Qa5WzXhnsnWU5zM4w+uA5tmqiIZRbjgVVdd7my9bj?=
 =?us-ascii?Q?lgasnghkpZvmc0SPj8Q9g6r1rqSFi10bPMjfjVOL3iP6wTJ1sh3YpVajEa9B?=
 =?us-ascii?Q?NkbPal1M40TT2MJy5y7V04FsLVpMjmWrOQv883h/2Y9gMNPmFq00XyAF0zQ8?=
 =?us-ascii?Q?Rng6h0acfuQFSytvdMTzH9cMfIc+3kF6Gnd+sy52S8Et8KzBt3mORG/l3Elt?=
 =?us-ascii?Q?nxJOUHXFiGoh8Lalo2iUGpbA+Ja1WR3lUF1Qp9b2VospXVfXP7Q3cgJ+vCTh?=
 =?us-ascii?Q?sWjv3sk2NfR7ZlYBiJFWWo3l6mgKJ70aKvKog7s7TpLmh6Xz8EAvjmuYfG+J?=
 =?us-ascii?Q?U0bOR8OksxZB2I0Kzl0w/1hvrJlx1tnnSi5HIQ1/RNjKM1fyaYgoeMbLkn2P?=
 =?us-ascii?Q?oGS9RxcR20TY+ouadOnmH/NDyfYXhixJ7/b+ff3tGEkIKBWFPc2qtF6ADc8Y?=
 =?us-ascii?Q?mAkCdx/jS2dGPpeGK8vvGF0V5527o1ySjM6zaWB1+DAzSiqk4Dtb47p1Yj+x?=
 =?us-ascii?Q?L5Jqx5cLsz7vaPPGsQXn6LS2f2oBQJbu23uaSTKqIWoDli9u4Qs9GDDpKadh?=
 =?us-ascii?Q?FnJYIdjMjUczqBnN0vHkl/IMrMbMLEsOeoHDLSyE96N6YEPr1huW9My19gRg?=
 =?us-ascii?Q?3UEUJLoy7GQdMxrNPYtPGYP0CSlyHvbE361nt5qye4GfniIjYsN7hyoopI8d?=
 =?us-ascii?Q?CsFPN/jVBz5ajrbc73zjXGQAmNSD9JOEJmdHtxhBVQo8RYNRqEiBjXllJM2Q?=
 =?us-ascii?Q?VCyDSYocVSJAynYE/cygB/nEdS7ks6ealjllhvufKjHG0zgzy0JsjtosZaSh?=
 =?us-ascii?Q?+YKkFSWEFDH6m+J7SDIz9Ysge4jNzxI=3D?=
X-Exchange-RoutingPolicyChecked: 
	HPkKvFuZEw8fCGyBgSgffEurzFGnBS0UAyPIS29FtRHb9aEPEOpTUy5d+CxMowfJ0Ul4mp4iSKkP0/rchjUxd0F0phnvG/VHPwpBWPMTfnqm3vTnkybIwEjiQNU5IPIzF6PvLaA8IMpxg3UNbFS6nqwc1WAovf03k/ZGiCRlGNP5vjBFdg3kueO914Y159CaJhCOwyLmgRfopgYjn4H2CPHrjWwmmoJx7Xeb5QAlykNmK5b2H4pYe116QuqTLXPvYs6C+IcpwYAr0nk5NYZh9PbjHQS1VUpixKaQeFaLWdN/HkOj/RZH2+6CjUqbWJppKQ7J71oTicUHCUuUFM2d5Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0110d1ef-f953-461b-b99d-08deb577dc61
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 07:25:53.7655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PaE91PF833gATWnfn4VhdGTdDQgofbWESCGmS+fzoII5o92S+8CQft0XgKmfxj2GhF1h7v2+JGw1khQYIlaCA029R2n1TyBcGsWi0oo778w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8175
X-Proofpoint-GUID: kz6wq9TNvTaGwEJETbcORsnMZLnMFoAA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA3MiBTYWx0ZWRfX0tF+IIjEYDSV
 RfA53qJhYmOipyEzE7t03g9PpurrYQZBCnDfUOgvvDAGgdtnI0ZzbOV0PqOJIFdsEnw+sVMVtt0
 ujO8Gs0sJY9EZArnKCAi1c8GFkoe+YkGekWoVuBourBVBE5DAJOpJndUgPPRez6GSJrGqohlpqM
 Fd1UMcEU3SsmYabcK8cZp/9bGuSc2AAKbSFxO3DHYy5G6qvMvx/KxHIsn5K0hTr0V8sK5YUMUIj
 CY1dGske5RV4krxzbpX3D3E/u1/zRlp3RKPKRge+jzc1GDPaZSRo9vti5vpbJV9k05z3GfI+Awc
 LjH+XBzesrKD982eSrBpR5K/7x3H57hyVWTWIaz9NC1s3YWOMwgh/r+D5ZBK3az2aa5fmRF6LyR
 omgtNbW1nrcxS2Uq68uTSkGckquDWw+EnL9pI7xriKWkLiCy6rHsjbqGusgYTsW/Xt0KLOZ+Dky
 w+i8610ZNRXPLmqejBQ==
X-Authority-Analysis: v=2.4 cv=I45Vgtgg c=1 sm=1 tr=0 ts=6a0c1085 cx=c_pps
 a=LdSsacNKwWtvIYfRw5AjOg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=Oh2cFVv5AAAA:8
 a=t7CeM3EgAAAA:8 a=OyRh3rS2erfsevdoCagA:9 a=7KeoIwV6GZqOttXkcoxL:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: kz6wq9TNvTaGwEJETbcORsnMZLnMFoAA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 07:26:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237282

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

Add missing <cstdint> include in src/gn/pool.h for int64_t.

Fixes:
| ../sources/gn-0+git/src/gn/pool.h:26:3: error: 'int64_t' does not name a type

Upstream-Status: Submitted [https://gn-review.googlesource.com/c/gn/+/22740]

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 ...001-gn-fix-build-with-gcc-16-on-musl.patch | 33 +++++++++++++++++++
 meta/recipes-devtools/gn/gn_git.bb            |  4 ++-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/gn/files/0001-gn-fix-build-with-gcc-16-on-musl.patch

diff --git a/meta/recipes-devtools/gn/files/0001-gn-fix-build-with-gcc-16-on-musl.patch b/meta/recipes-devtools/gn/files/0001-gn-fix-build-with-gcc-16-on-musl.patch
new file mode 100644
index 0000000000..e933c17d8a
--- /dev/null
+++ b/meta/recipes-devtools/gn/files/0001-gn-fix-build-with-gcc-16-on-musl.patch
@@ -0,0 +1,33 @@
+From 6d22f5c9e96811f1abcedd8fb1849fe72747b5c4 Mon Sep 17 00:00:00 2001
+From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
+Date: Mon, 11 May 2026 02:43:10 -0700
+Subject: [PATCH] gn: fix build with GCC 16 on musl
+
+Add missing <cstdint> include in src/gn/pool.h for int64_t.
+
+Fixes:
+| ../sources/gn-0+git/src/gn/pool.h:26:3: error: 'int64_t' does not name a type
+
+Upstream-Status: Submitted [https://gn-review.googlesource.com/c/gn/+/22740]
+
+Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
+
+---
+ src/gn/pool.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/gn/pool.h b/src/gn/pool.h
+index e03113608..247cb6425 100644
+--- a/src/gn/pool.h
++++ b/src/gn/pool.h
+@@ -6,6 +6,7 @@
+ #define TOOLS_GN_POOL_H_
+ 
+ #include <string>
++#include <cstdint>
+ 
+ #include "gn/item.h"
+ 
+-- 
+2.49.0
+
diff --git a/meta/recipes-devtools/gn/gn_git.bb b/meta/recipes-devtools/gn/gn_git.bb
index d2f61c2098..6047ab5e2b 100644
--- a/meta/recipes-devtools/gn/gn_git.bb
+++ b/meta/recipes-devtools/gn/gn_git.bb
@@ -6,7 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0fca02217a5d49a14dfe2d11837bb34d"
 DEPENDS += "ninja-native"
 UPSTREAM_CHECK_COMMITS = "1"
 
-SRC_URI = "git://gn.googlesource.com/gn;protocol=https;branch=main"
+SRC_URI = "git://gn.googlesource.com/gn;protocol=https;branch=main \
+           file://0001-gn-fix-build-with-gcc-16-on-musl.patch \
+"
 SRCREV = "eab8a9f92dca9b8548a89d9e5eb6aeb8ac6bba77"
 PV = "0+git"
 
-- 
2.49.0


