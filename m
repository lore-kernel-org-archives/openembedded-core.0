Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D21D8CD4F3C
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 11:03:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5923.1779102229364823679
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2026 04:03:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Y9Q0n0o4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9598960b98=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I9djeU1041540
	for <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 04:03:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=Wk4E8iLBh
	w3IBYaOfoXtDcWktJS2ZnGyz8xBm8q8S2w=; b=Y9Q0n0o47CIL1NDauKzwaQJnS
	Kl9zqdpZFVphkpCHKAkkkhDfdk6Pd+yKWgk7GbhUOFn2teq2//ymA6Lw8vWbFtiK
	gT7IdYi6HRVtQgm65mAROkc4vxq1pO85Bq8+Dxtk+vBHDDU3TCcY0/V59NFQVTZ4
	kgjyhiJmyIoy0iH8XtDD/dDTZ4OPitHrA9ZafWK2Gg1oWhHKqDD0wKrNHOAj2/xh
	nRxyT5nCiezU/3NqkvNHVlimtmliAkkOWWloFuyNQIKHFWuTPrXv5soVm57GmGtc
	Fn9lt5Px423Q71IZ2UCmvWe1xNtl3B6SqEYFrLLWsh6Lcu9u3c6AAnB8vtdXw==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010039.outbound.protection.outlook.com [40.93.198.39])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6r3g9pgk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 18 May 2026 04:03:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oVXcMU7vpMZRODGo7nn/8GlrjaTzzL3J3GnOuU5YgKTZJuuueZEPVqB5z3nGnM4SOa4KzGUuBnHp0Ol1HO0+Hfxopn74qoy6e4/gYp84qq2pcKdt2C5hTU9wCxeS6JE9WxEq8CsFQ9jJKC5SINigniIQj+M00PphfZ4aPI0NMjJ0EawgWONwc96/GsCl+Zym0AbDIIyHdfwYIRXxXYK8bJch7lGxZTTD63kUYgZqmmiStfagftEpLyuHdJ777WZu486PvomNuYmhKmLjbBVBI+dzlvzyG24PuX6ZhpTt1+5cCDFtPKDnKS2+Aw6UzLDEtp6p5EDvDBfr2+85+MplSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wk4E8iLBhw3IBYaOfoXtDcWktJS2ZnGyz8xBm8q8S2w=;
 b=a5DnCrDg+COn+49u1A8XgOEBjsTAms+h5C/yL4B7tEBk7ahkwDZzE9375MHq1XsUweEAjj1SxyRlxEt7TdHmCYLZ+tSoEmfrzbIGEBdaj4HfV9uLlkQJjcU3SXaV8v3CVSR0N8KcNfFpJUH+pteqsXdyIvIMIUUV2Ci1uSKgORSEwXB6NgryvQDPLhncP/eZJ9Bx3Ha1hHYu7FYaYWm0ky65Y0RUdesP9OaHs0F808yedaQGWFugyynQXPfgn1DWHr1GQZ7b+DhTENN5xPCQY4NE4MjlW53n3CLEkjP59v9cibcaeXCu6dygAnxrr1kmC+FivkhE1TOsZaXBep+D4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 PH7PR11MB7049.namprd11.prod.outlook.com (2603:10b6:510:20c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.22; Mon, 18 May
 2026 11:03:45 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.20.9913.009; Mon, 18 May 2026
 11:03:45 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: khem.raj@gmail.com, Sundeep.Kokkonda@windriver.com,
        Randy.MacLeod@windriver.com
Subject: [PATCH v2 00/12] gcc: Upgrade GCC to 16.1 release
Date: Mon, 18 May 2026 04:03:15 -0700
Message-ID: <20260518110327.2347543-1-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0058.namprd05.prod.outlook.com
 (2603:10b6:a03:74::35) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|PH7PR11MB7049:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e0b02a3-e5ce-49fd-5233-08deb4cd2128
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014|11063799003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	trENeLvkJsg3LIRKEVNFZ4d6ELPRwQ5xiFM1HDYNFtZZRwTNpyR+kLrctt8B7ZsiJX5TVLn9AxsraTNLDBP0xUyokFUgIL7XfzwQL6+ZekaXUnTX7NH2B/OisHfqGKOgo1pa3QBLtEHaDIQjiRk4B+SQKeK/LFqeDsTeIBbIfd0iwXpmw9WBo/xi1Aixic3vJMH1yBOnmx9QfVcCA/OHKO6dYbihIHadG4ujmsRW7bXQeJYzrpRKbu3k1e3mOhRG5xSMMx06kY+l1ZvhyNNZH/1Q+WILYm6JKKFMFPd0mdeeOE/b5i1L2+uzys5TpEdQWlwg22HIt4dAc/AWnZb736cm+HYDAn8z94Ifk5k2YOKd4Ey72QD87sQyUvhYeSfAK+jVAZUC8TRtga5HGkxSzMiYDUxMcTyGQOy9/FKsn1FdMvXoGmvO3/XtI9zjHVtzehxyGaE+v1qEzqsGyNGSPcneZTlU5Oz5G5DcaO3gnG193cZbhp9hnZ522LSSLV+PohzNsvbWJ2KVqVd6oj1kr8qkhlz2OmyJ4SUtkndcGdp9pw4VCLOEDo7RbSc+gF/a8FH4j/MQozcaxzF+szH1H3461ID/NQq47pjik526rc+bCKhwfyKH0x0EadNMDUhlXJA38rPhxS/JvuDaWjEgilqFL9FqNsFiaetA125PZfYJZpEjgmYd9f3IooVAZjedbw1nCsVspuwqF2DUv+sCloIB56rKZM5LdEkWIY3dtZ0Q+2vRDWwrHBmUhpfHovMw
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014)(11063799003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RvYnXvD+UtU+FRael5GaR/CS6um0Z9VfRSNHFbC0btxmQLwPn5Dd9mGFipn/?=
 =?us-ascii?Q?I1r1PI8CjiW7pdVRDg5xW+98Jt+gLKzEydHJfDoLa6PU27dqFm/2ywDg0Z0o?=
 =?us-ascii?Q?Ct6K5go2axVtEHXM+hIebCiy+dPsH+Q3PTM+R/TADa562a8wrklDWwozN2dT?=
 =?us-ascii?Q?W8e+sLeHz3+qLsQA4ktJwN8gptvzGMZKpCcStzFuyjsmvZrUpG90fgzAfsOs?=
 =?us-ascii?Q?LypK3WGO0AtujLrIpRaWTSaqct/IDE/ZHSvXKqasPuuUj/vAYYp1FKxXmLNv?=
 =?us-ascii?Q?50Rgi6k3nrICJlzqCmCY6Jm5ZhKbKGU2xu1Ar6MkgGh59N9XWDa5A8jASgKQ?=
 =?us-ascii?Q?QBlIOibM//9OiGbwnY2+6fWPrGT63plFlFPj9v/+pFRlXRwel5Y6tL4hexQ2?=
 =?us-ascii?Q?bFhujW3Luc/KXctcE3IE/bO4xyHzRwcWveShEpeyESsapUkyFVtb+gPlkuUO?=
 =?us-ascii?Q?vVFIwEM9or2Szw0PtsveXf7youhnIRXUSJVRrGnpln88rSgaIzarvEZAYp8s?=
 =?us-ascii?Q?XzekqyBjMPL/IraM3FoStiHSO39L8poDlHUAC5OPAj7lVvI3i5YIMGUnqWWK?=
 =?us-ascii?Q?ITCRjkghSh7u4+yHyI41r9pakZKPiTdzGbe06rxfoACeCZpIakhy1KWP/P9t?=
 =?us-ascii?Q?fGpOYHEN9p5QLW7ix2OYeYvLn1HqHFD8/WU4Z4sTtJwDwI15Iy4PCEIRrh4V?=
 =?us-ascii?Q?e3U6/ZbspAwM5uI5P/ju4WP7g44DxeviYdjRnx89Pa9yDvCf8ez1n6DmqTdB?=
 =?us-ascii?Q?9v5qt1fJVZ+qeJX/OSLJdIWYmuAZqkNktnzfV61u3R1Ows65kKRCEoDlHPGW?=
 =?us-ascii?Q?M8asji68+IMkN5KGQgZKk600hdsokpvjsR/7Bh80FlcXuHsqFOrA36UE0c9c?=
 =?us-ascii?Q?4wQ+YkRV9jgLuC4Ua9DN9qlZ9gaNtjnNHE3W4yGmwdTBKYQHWcua3s455s8y?=
 =?us-ascii?Q?Azz221GX+uwoJMf2ppKbq7E11lTB0c+fdXJUUrCa2JXG4W2TXw4uhcPGoIf4?=
 =?us-ascii?Q?fumbEPqRyeB4uqKl1rj2vDpf0s5cVZW1ekuepqEkY/eDZRYXNxsdWRba1RHo?=
 =?us-ascii?Q?9zMteRewElm6xgbp8r01l+fobNQBcRonCrJb/1WBEt5PUVTn7s2v9TiyiyPq?=
 =?us-ascii?Q?qgKoJAJW84F8yRUC66bJt0qoCaxG9Y1dqJwiChtkoCVB/KLC2yx1DbHickRk?=
 =?us-ascii?Q?pLJjvUGnXao6KTt29IRZRR8XtVNgvyoooz2TwwtbpfY2tS3YdUIZ6fo+JxJx?=
 =?us-ascii?Q?MKJMiYaKXLlwjGZfv1Mw+ZghgQNokVfCL2oSpCFd34BS0mRMKN0sIcOk1wog?=
 =?us-ascii?Q?ij53Ky9T/k3c7CvWs/rX2AlbLjwpiIDcEln4aPcB8E7057//704YvFh7MizL?=
 =?us-ascii?Q?GUePqmDVbpjsD1pUBK8faibYxYBL7XNzd5rrzlriuD0DbdwAp4VB1KJngYLr?=
 =?us-ascii?Q?SBgkEh3/LF9r+Sbrw3dXQu41S+SBS4F5DBEtUvDDS06jnggiSgEezxUZZrUn?=
 =?us-ascii?Q?ANoWc2A0zDITYhL9fpCywD1xdp9g7fb3r4BAxtll3b9kuqHHsFfxbj+p8dha?=
 =?us-ascii?Q?4heTWTpOl/dZ28s2g0KxXIU9KgfnwdFaw00p//rs0c3/qUcsa2BVZONkhYte?=
 =?us-ascii?Q?1nv62kRd8bjywFmIkfrYxuE3hfPz5Ad2xVG+pETsEOUQrSm5vM1gVFuMeds1?=
 =?us-ascii?Q?185JsDmVM8czIDAsH9+sgoHrlvgfHq9QMMwrpDYiB5BLUa1JIq+IdbJiaLPY?=
 =?us-ascii?Q?AltHiLXVkStuCpxYOx5qugh0DbTS8OU=3D?=
X-Exchange-RoutingPolicyChecked: 
	AgV+CNwRgafKEJM739dYVwgizc97Z90nCMFK/tICkyjXGFkS6PioncZFSSFGlytNrZ28lMkMtZmtNS3pGPR7//vLyQcH6R6DQwJBlR9lYntHDSU7ZABcrtFQlnp/lM9MmJGcp+zTxaPhFhStzieTVCb836UbJok6yt9ZsP4YRs50vOfWEQZL4saL+YNZ3o5dEJ5H2gLMHrpGw+evBYOR922DSfzGbFegZ6qxCLi6BaNdvk+hOLweKRzU65xZHA0k6ITl6+9kePrJNirU2YuFuXaYL8nkraA/NEZg9ZlZU0zrRYySvOBOGf9JLqvUS3wlnjkFE5cFPeFrXa11PxFSyg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e0b02a3-e5ce-49fd-5233-08deb4cd2128
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 11:03:45.2296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WS2ya4ZXzElf9m08C6j0DaRrUHKwAeNoIQpPZUPvd1zbln3owvWHB8mdJE5xlRE79K+c60x3od7qDHS2aSqbJIMxIDA3NWLx9Em5Q6Z6quY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7049
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: 3DFtvuCueVMFY9487WKDM-sYsYng0Yk9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEwNiBTYWx0ZWRfX999e8Sz5TBaD
 WMqLkO5TcCuq6W+Lr84oIBtEWTCFP9uHfP+vQwabW6h9WyXz3TAAeRZcgAYV9S2O1Gb97qOD8sL
 Pt7RZNGtpb216Qqm5CRWGnWg7k35qxS7BOu7gnZ+EywXx1lSqpNziK8qc6YlxZCRiLvMx/0H7ND
 PjtZZG/nlz4XpROZ+a5DOgOPdhPrwaFtkPTpoG7P/OgipRDoKz+jkuUNS9N4W4tvzYxZtOCjuGA
 Fv6KGWq2sjD4BaijwjLoWZu2Yamg7ZLI1CqyFXf77/tPwrQSwAml3KwFQHlIuRQbbQZivPoZEv/
 XQEf1a180vvsXx8wak7jGe5hQXEY7svaQoDkY2PxWod0XHHFuwC6Stm9QmuHSwe5SE7wPuW6GtQ
 Wd/Yk4o0RBG/mK4PMUBLrBxou4NzZH9k3kVZEg163SLnOEa6fvwyxBNXMEHYKcCNtGmMzkmMdjO
 wWghbfOvSqQZccOWKrw==
X-Authority-Analysis: v=2.4 cv=I45Vgtgg c=1 sm=1 tr=0 ts=6a0af214 cx=c_pps
 a=WWBLjRe7FI6dQUFhva+Khw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=dzkiSeTA7YgLB6kitIAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: I6XdOBkMT5mLjGvGLR5Jra_ffRLBpdYK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180106
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 May 2026 11:03:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237220

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

This patch series upgrades GCC to 16.1 and includes the required
runtime and compatibility fixes identified during testing in OE-Core.
The series also includes fixes for packages failing to build with
GCC 16, updates for libatomic runtime handling, and packaging
changes for newly generated libatomic_asneeded files.

Changes in v2:
- Add libatomic-dev to elfutils ptest RDEPENDS
- Add libatomic-staticdev to libc-test ptest RDEPENDS
- Package new libcaf_shmem.a static library in libgfortran
- Fix gn build with GCC 16 on musl
- Backport GCC i386 ICE fix with -ffloat-store and SSE [PR125308]

Summary of patches:
- Patch 01: Backport piglit fix for building with GCC 16.
- Patch 02: Backport rxvt-unicode fix for building with GCC 16.
- Patch 03: Disable automatic libatomic linking in glibc.
- Patch 04: Upgrade GCC to 16.1 release.
- Patch 05: Disable automatic libatomic linking during gcc-runtime build.
- Patch 06: Package new libatomic_asneeded runtime files.
- Patch 07: Avoid passing MULTIBUILDTOP to libatomic in OE builds.
- Patch 08: Package new libcaf_shmem.a static library in libgfortran.
- Patch 09: Fix gn build with GCC 16 on musl.
- Patch 10: Add libatomic-dev to elfutils ptest RDEPENDS.
- Patch 11: Add libatomic-staticdev to libc-test ptest RDEPENDS.
- Patch 12: Fix ICE on i386 with -ffloat-store and SSE [PR125308].


 meta/conf/distro/include/maintainers.inc      |  2 +-
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 meta/recipes-core/glibc/glibc.inc             |  3 +
 meta/recipes-core/musl/libc-test_git.bb       |  1 +
 .../elfutils/elfutils_0.194.bb                |  2 +-
 .../gcc/{gcc-15.2.inc => gcc-16.1.inc}        | 18 ++--
 ...ian_15.2.bb => gcc-cross-canadian_16.1.bb} |  0
 .../{gcc-cross_15.2.bb => gcc-cross_16.1.bb}  |  0
 ...-crosssdk_15.2.bb => gcc-crosssdk_16.1.bb} |  0
 meta/recipes-devtools/gcc/gcc-runtime.inc     | 18 +++-
 ...cc-runtime_15.2.bb => gcc-runtime_16.1.bb} |  0
 ...itizers_15.2.bb => gcc-sanitizers_16.1.bb} |  0
 ...{gcc-source_15.2.bb => gcc-source_16.1.bb} |  0
 ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch |  2 +-
 ...sroot-gcc-version-specific-dirs-with.patch |  4 +-
 ...omic-Do-not-enforce-march-on-aarch64.patch | 18 ++--
 ...025-gcc-testsuite-tweaks-for-mips-OE.patch | 78 ++++++++++-------
 ...6-fix-ICE-with-ffloat-store-PR125308.patch | 85 +++++++++++++++++++
 .../gcc/{gcc_15.2.bb => gcc_16.1.bb}          |  0
 ...initial_15.2.bb => libgcc-initial_16.1.bb} |  0
 .../gcc/{libgcc_15.2.bb => libgcc_16.1.bb}    |  0
 ...ibgfortran_15.2.bb => libgfortran_16.1.bb} |  1 +
 ...001-gn-fix-build-with-gcc-16-on-musl.patch | 31 +++++++
 meta/recipes-devtools/gn/gn_git.bb            |  4 +-
 ...h-rename-local-lerp-to-linear_interp.patch | 46 ++++++++++
 meta/recipes-graphics/piglit/piglit_git.bb    |  1 +
 .../rxvt-unicode/rxvt-unicode.inc             |  3 +-
 .../0001-rxvt-unicode-fix-gcc16-c-20.patch    | 61 +++++++++++++
 28 files changed, 317 insertions(+), 63 deletions(-)
 rename meta/recipes-devtools/gcc/{gcc-15.2.inc => gcc-16.1.inc} (88%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_15.2.bb => gcc-cross-canadian_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_15.2.bb => gcc-cross_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_15.2.bb => gcc-crosssdk_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_15.2.bb => gcc-runtime_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_15.2.bb => gcc-sanitizers_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_15.2.bb => gcc-source_16.1.bb} (100%)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0026-gcc-i386-fix-ICE-with-ffloat-store-PR125308.patch
 rename meta/recipes-devtools/gcc/{gcc_15.2.bb => gcc_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_15.2.bb => libgcc-initial_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_15.2.bb => libgcc_16.1.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_15.2.bb => libgfortran_16.1.bb} (51%)
 create mode 100644 meta/recipes-devtools/gn/files/0001-gn-fix-build-with-gcc-16-on-musl.patch
 create mode 100644 meta/recipes-graphics/piglit/piglit/0001-fbo-blit-stretch-rename-local-lerp-to-linear_interp.patch
 create mode 100644 meta/recipes-sato/rxvt-unicode/rxvt-unicode/0001-rxvt-unicode-fix-gcc16-c-20.patch

-- 
2.49.0


