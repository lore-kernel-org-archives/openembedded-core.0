Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAD5FCF6499
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 02:20:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.45643.1727662812116426964
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Sep 2024 19:20:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0003b76a2b=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48U1EOYc003036
	for <openembedded-core@lists.openembedded.org>; Sun, 29 Sep 2024 19:20:11 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41xhakha58-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 29 Sep 2024 19:20:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KDeOmqH0F3tZS9dhHUS52KHpNEI0vSvD1hFRA2N+krvJiuLgBZLZfVAsBvsDhrclMOX+VhmlwArEWcqaZqRdQEu+f0Borf4pvF5+bNpytvtx71dkkEJeu0FGUd2nQbHCiJQoDM+2TBKA1tJFFj/e4dQZgH2aKbbjS980T8lTXNNaBx1DosCxp3cYFaePe58l5tHHy/xN9H6KGTOMb1N8KjDIPeOPCiSLLz1NtnNYZZmujgWLPqADX5q0a//EGM7IxVn1M2SgraO6EQEE2YiRSOiWV1h/4fLdTI0s7+1jZe5LBY9cazcL4qAgYnJxo75f6x3kRlnmVXhJQ0dSnxw8QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o//3+IblpE8pGXRw4eFXQMBwLn6l1OJ5+Hu6ppX8nUk=;
 b=qHFIlPHu9K+0oq9JUWb8H/+2zXFutAcQnwZwsPMLjp4611rZNpgCPuvNOYw++Sza7CE1e4wUMO4p2vcMeNJAz0wr80Ib5zAYNqiFDTGiRp7OgeZZSbRfqPLWJkDHj9eAxTDb24uGxcbB/pIu7uWYq9rh6M7fupzpnTE2exW6yail9Jt9nPIuOZviqi0kq87wxWxLGn/PsiRxkqsyku/B3fgxiZhZxRelvDeW6z5zVsbehKfYGuFRKibeYnz8suiXqTkMZ4kE1UsDU6+SzvH69n3LWZLjkeSD4WnXIKmDj80p6ij2jgSgoUw6h3pcG3EiN/zieuiCJAy409LVA6kdSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5533.namprd11.prod.outlook.com (2603:10b6:5:38a::7) by
 DS7PR11MB8784.namprd11.prod.outlook.com (2603:10b6:8:257::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8026.11; Mon, 30 Sep 2024 02:20:07 +0000
Received: from DM4PR11MB5533.namprd11.prod.outlook.com
 ([fe80::8ce3:74f6:33ca:3dfd]) by DM4PR11MB5533.namprd11.prod.outlook.com
 ([fe80::8ce3:74f6:33ca:3dfd%3]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 02:20:07 +0000
From: jinfeng.wang.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone][PATCH] procps: patch CVE-2023-4016
Date: Mon, 30 Sep 2024 10:19:50 +0800
Message-Id: <20240930021950.3561731-1-jinfeng.wang.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0151.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::7) To DM4PR11MB5533.namprd11.prod.outlook.com
 (2603:10b6:5:38a::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5533:EE_|DS7PR11MB8784:EE_
X-MS-Office365-Filtering-Correlation-Id: 14e0efce-f12f-41c3-f615-08dce0f666ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?yyPJrvl21bvoNfUbw5YilgUnDBumaaBaNcdYHcbZ71kuO02PbSfxNzKzVyuY?=
 =?us-ascii?Q?wvJoVTDYvVrjhGfRhtfU1SCaCHqOvzvHuzb3YUl5gndWCuHpccWgPy76TF6V?=
 =?us-ascii?Q?H8mgAVdMdHNJ9ngIAMx5AE9hOnLnsN1BDDyeRoAJrhYQdTkomP9LY6inXBVN?=
 =?us-ascii?Q?/Ve5RG74VghAE1ddoJB3ulXU1n1NGmnXIqH4jxP/cmdoQGkY+IORV87B8Ue9?=
 =?us-ascii?Q?NVQbCImnw7Oj80ur7S9gtIzS35txgbvnXZlq+HQldWTsbTORmu22OQDilrrk?=
 =?us-ascii?Q?lORR+MD8/8VErT9b4BzCeUa14fbXOCIF5jSdIX0jZ1cRqvb35wF3LblkQ5nn?=
 =?us-ascii?Q?aVUxVao0H98BLrLqgPh61Vfum6WI+a5iKgog/IcQTtlZ2ExWrPpxmdrJMYts?=
 =?us-ascii?Q?YQ9qcFfaaWOi2sWLW6Jua81vacyT2k/bocniSYNL2Wktlzpvu8Q1TodxHg3X?=
 =?us-ascii?Q?GAugY0o+EgM1pf/Fq9utDyDOYKadznp5vC24HVGJKp8X2SRw55stlaMwZK+d?=
 =?us-ascii?Q?VmncC8Pa0dmI04LQyKO5eWktnGHQNPk5pPnTgWcKPxXyjv8zuo2qZpNefoZY?=
 =?us-ascii?Q?7FYwm9df85BPVCXIwPWYwgsBf711kqonwb6xRqF498UXLak+TahN8UrWeOrn?=
 =?us-ascii?Q?cxoThLvTGoEQVaUkbubqraKaaNmmT0LWfVYKEy5FxHz6afRP4DDC6MRTAjQu?=
 =?us-ascii?Q?+O7o69h3S4kR+PYg7Jx856BncC2Hs92R1bbBujBfl0XJBsmd8F0NYIzanVdr?=
 =?us-ascii?Q?/lHnlcniAovDEe1J01hCwxxyKDF65vdA6DecXyTtzVvff5LnNuX4XDRScG35?=
 =?us-ascii?Q?wKXJnbSO0gH0WhzJeJTsxjfeTRn59ozu0MW5snd97LQicsjV6dxC7cg6FgxZ?=
 =?us-ascii?Q?svC1+gu5lJXI5qjnC9licYnXlezZLfHwGRetv7dNDK4dCpXVTXpmP06cqv/e?=
 =?us-ascii?Q?a243oDDwyn4uYcwZZbV0YjVjqYrEmpnkt/cs1Zd+v4yB/Liz+U64Fz2uA7gP?=
 =?us-ascii?Q?f+oTzj2Wr/VLYB7IEulR+dsAOKp/u0dI6fXuAIfXFVh3asa7lebKEvZjH0IP?=
 =?us-ascii?Q?ppdKsL7Kii+nYCKj/0vcuuRun5j0bB3fDmRM4UzLAL8mzZBigJV4tVUdBfph?=
 =?us-ascii?Q?AheSGUDi9X5F9S8y5Id9BKrJhNrvv/+IgEhNEK7vd2Tg/VztsImeT+UX7V7V?=
 =?us-ascii?Q?UJXPZUYwN7j9sjBppSOAWT8GR4Dno9NAmTaXtRWpY7fL+y3BUPX4tq+5yDIJ?=
 =?us-ascii?Q?c1zK7CXCTpsL4hpy2MbfdmBDcz+toKE1EyCzObkFJ9bvYv+r00b72nZF3V4z?=
 =?us-ascii?Q?JnUpCpERBz0XRvwDQZLzFgRIrKPUVLHCcLmPqK/5lTgLqXEXOIncRUgZd4iC?=
 =?us-ascii?Q?rw1doCQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5533.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Ahks/Q3yHReMJ1X8cFG8suve5F3ou2oby2Sabys8OfWWPMolVC/Zt/HwNvzU?=
 =?us-ascii?Q?CD1lGg0YqipSLKxUZbGBnm30/tmbP6n5RIHkY43iqfJYtu06yMxE5swrD2OT?=
 =?us-ascii?Q?uLOy5UFPlRa6g/13e+X98iRkgE4AMZNN9a41F9rr95AmS4EZ3rnow3wchnVM?=
 =?us-ascii?Q?qokPf0dnojaiNZA4/+Ao6lAcde985pyM0zuVm0qLAO2nawFSL1yyN7nRsBsc?=
 =?us-ascii?Q?N7khnSaHsIFx1MirsH1Jayrfnhaoumi0YQacuFMRAVDjcRelQk/1SHyB8Hsz?=
 =?us-ascii?Q?4DiT/jr2QyML/JRg3wTpFZ66LFsW9wm3X7kq9kfhTRRtSP3MCCgg3+LgeP4d?=
 =?us-ascii?Q?Tl4nqcrPUAMCyAqxeQfv7OJC+d8Z9l0Fk70z03WvaOUdcMhHd3kftUsH8SjI?=
 =?us-ascii?Q?LwDgh+MG5qBjavDjZA2hk1I+YFIrfdF0o4fF6UowS2Cel86jQgjsYuAQMn2q?=
 =?us-ascii?Q?d8Buf6tOrpI+Ewcm0rv+zeu4twwf3bra88VP0gOADM8mA/eGCyh6k9TeeDao?=
 =?us-ascii?Q?6C4gcERZFV0l/YsWV8DnqaWCRDbSl2z49rEeKsFpogtJy6+h+mNsAKadp0DB?=
 =?us-ascii?Q?XJAAbRvywdggqkTOEDo1B/FXzbhDl7+QeVKwXthUbiHncJkhlW8GKIPSSkhx?=
 =?us-ascii?Q?XusRlV/Ljzdorl+d4Rz4wnL9fVEFAF54ZT/2kf695Jw50QIBTM7mYxVCaJvB?=
 =?us-ascii?Q?RyHr6UTlDcAtQjPFJbnyQSL+Nm8+mqp6F7E6fFYVx+6qnXKE0+5bpAHDxDXV?=
 =?us-ascii?Q?mHpi580Lcql5vTwtnRl/3gB+iIJdrCjBRAGcCV4+QmfSjw+5IPdr7erZ9bac?=
 =?us-ascii?Q?D8x6t1bCYGjxhdLCGkomwai614hXoZDssXO5EzWhFHQ6UoD6NXfHpagl8N8s?=
 =?us-ascii?Q?Dkr2Q1OwI0qTyF9KVdjH8y3E6my1PgOCOVOmuGtRT3o+6pu0WBeQbrfF44eb?=
 =?us-ascii?Q?GqI46YnDPzA0QV/ZagjK3uZ8qOA+GfaoRQhTKbr0SYQneJgfbKYjbDaVs4q7?=
 =?us-ascii?Q?LftWi4V2zZJP1p93dlbrkIYh+nCV7l1rBdDu4wK5miGeuhTN9BBKKeePcCzQ?=
 =?us-ascii?Q?IqPr2jUc0uKF0CNJ8i4bAZg4EhtHHAKdCHcmqt33022tkzB0/yROjtnjRNQw?=
 =?us-ascii?Q?jCyY6YjAPYm9bXyvcMoYIdCmypY8C+T4BLaQoHzOOvx8FauDHRqJ3nRNHCuG?=
 =?us-ascii?Q?aj3WOQFY//3pPZFuvpEyfz6hH2GwWbaKTwnXvEAOSOsfWRLfwZPDF13C5L40?=
 =?us-ascii?Q?23zDg/rykKhpTcsoehkUoiDUhUz1hkIOujOrsZVlhFjtLYXVaYhtMbo2lQnR?=
 =?us-ascii?Q?0OK/zuwHoS1gzA9k6HuiDQpqiBX35wsMDtwKqqZ99ieoHVrvej06scuHThF8?=
 =?us-ascii?Q?BJx18HcsPiXRRL5zhV/HD/X85BFkmOOkbLwtGQ8uKVUr27OzcaCgqxp/gl4V?=
 =?us-ascii?Q?87NzPFrcdfHpqL4Gj67dajoN5HYCus/G1l5yjakGFQOLOGL/gM41hFlGPxG0?=
 =?us-ascii?Q?m1xEUqeqF5apBn96baFJAR6xE8LkrIbQJH8eJhgO6+yn8Ys9MXmq4l2n4SmS?=
 =?us-ascii?Q?HdBfQ+GmnjY8GLkdz6N/e8/6P8btwVr9976aKk3PFftRApom9/0n+tmanUaI?=
 =?us-ascii?Q?bw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14e0efce-f12f-41c3-f615-08dce0f666ae
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5533.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 02:20:07.0734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BU9ROL9xP6h8OgxX5cDzY5elafjLFf1HiwYS/KtkcBGdlKIuZ8AYpUarB7YhTZ2SPSO8pvSheoGtdu29zolZU74ZBCwh1/nZO+2a84Ylqn8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8784
X-Authority-Analysis: v=2.4 cv=YOLNygGx c=1 sm=1 tr=0 ts=66fa0adb cx=c_pps a=LxkDbUgDkQmSfly3BTNqMw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8 a=p0WdMEafAAAA:8
 a=eJF83aCV0dl3YAmEgTgA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: SLVvFj19RnA7Xsge90sYVcH3pvurgnkH
X-Proofpoint-ORIG-GUID: SLVvFj19RnA7Xsge90sYVcH3pvurgnkH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-30_01,2024-09-27_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1011 suspectscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0 phishscore=0
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409300016
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 02:20:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205091

From: Jinfeng Wang <jinfeng.wang.cn@windriver.com>

Previous patch[1] for CVE-2023-4016 is insufficent.
Backport more from upstream master.

There is one change needed to apply this patch:
* change file location from local/xalloc.h to include/xalloc.h

[1] https://git.openembedded.org/openembedded-core/commit/meta/recipes-extended/procps/procps/CVE-2023-4016.patch?h=kirkstone&id=71d0683d625c09d4db5e0473a0b15a266aa787f4

Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
---
 .../procps/procps/CVE-2023-4016-2.patch       | 60 +++++++++++++++++++
 meta/recipes-extended/procps/procps_3.3.17.bb |  3 +-
 2 files changed, 62 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/procps/procps/CVE-2023-4016-2.patch

diff --git a/meta/recipes-extended/procps/procps/CVE-2023-4016-2.patch b/meta/recipes-extended/procps/procps/CVE-2023-4016-2.patch
new file mode 100644
index 0000000000..7269068045
--- /dev/null
+++ b/meta/recipes-extended/procps/procps/CVE-2023-4016-2.patch
@@ -0,0 +1,60 @@
+From 93bb86a37a0cf7b9c71e374f3c9aac7dbfe2953a Mon Sep 17 00:00:00 2001
+From: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
+Date: Fri, 27 Sep 2024 14:22:32 +0800
+Subject: [PATCH] procps: patch CVE-2023-4016
+
+ps/parser: parse_list(): int overflow for large arg, free() of uninit. ptr
+
+* ps/parser.c:parse_list(): Regression (2c933ecb): node->u is uninitialized at
+  free(node->u) when reached before node->u=xcalloc().
+* ps/parser.c:parse_list(): When "arg" is very long, CVE-2023-4016 is triggered.
+  2c933ecb handles the multiplication issue, but there is still the possibility
+  of int overflow when incrementing "items".
+
+CVE: CVE-2023-4016
+
+Upstream-Status: Backport [https://gitlab.com/procps-ng/procps/-/commit/f5f843e257daeceaac2504b8957e84f4bf87a8f2]
+
+Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
+---
+ include/xalloc.h | 2 +-
+ ps/parser.c      | 3 ++-
+ 2 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/include/xalloc.h b/include/xalloc.h
+index 8b4d368f..a8046892 100644
+--- a/include/xalloc.h
++++ b/include/xalloc.h
+@@ -42,7 +42,7 @@ void *xcalloc(const size_t nelems, const size_t size)
+ {
+ 	void *ret = calloc(nelems, size);
+ 	if (!ret && size && nelems)
+-		xerrx(XALLOC_EXIT_CODE, "cannot allocate %zu bytes", size);
++		xerrx(XALLOC_EXIT_CODE, "cannot allocate %zu bytes", nelems*size);
+ 	return ret;
+ }
+ 
+diff --git a/ps/parser.c b/ps/parser.c
+index 5c92fce4..a94b49ff 100644
+--- a/ps/parser.c
++++ b/ps/parser.c
+@@ -185,6 +185,7 @@ static const char *parse_list(const char *arg, const char *(*parse_fn)(char *, s
+   /*** prepare to operate ***/
+   node = malloc(sizeof(selection_node));
+   node->n = 0;
++  node->u = NULL;
+   buf = strdup(arg);
+   /*** sanity check and count items ***/
+   need_item = 1; /* true */
+@@ -198,7 +199,7 @@ static const char *parse_list(const char *arg, const char *(*parse_fn)(char *, s
+       need_item=1;
+       break;
+     default:
+-      if(need_item) items++;
++      if(need_item && items<INT_MAX) items++;
+       need_item=0;
+     }
+   } while (*++walk);
+-- 
+2.34.1
+
diff --git a/meta/recipes-extended/procps/procps_3.3.17.bb b/meta/recipes-extended/procps/procps_3.3.17.bb
index 897f28f187..bbec5a543c 100644
--- a/meta/recipes-extended/procps/procps_3.3.17.bb
+++ b/meta/recipes-extended/procps/procps_3.3.17.bb
@@ -17,6 +17,7 @@ SRC_URI = "git://gitlab.com/procps-ng/procps.git;protocol=https;branch=master \
            file://0001-w.c-correct-musl-builds.patch \
            file://0002-proc-escape.c-add-missing-include.patch \
            file://CVE-2023-4016.patch \
+           file://CVE-2023-4016-2.patch \
            "
 SRCREV = "19a508ea121c0c4ac6d0224575a036de745eaaf8"
 
@@ -101,4 +102,4 @@ ALTERNATIVE_LINK_NAME[ps] = "${base_bindir}/ps"
 
 ALTERNATIVE:${PN}-sysctl = "sysctl"
 ALTERNATIVE_TARGET[sysctl] = "${base_sbindir}/sysctl"
-ALTERNATIVE_LINK_NAME[sysctl] = "${base_sbindir}/sysctl"
\ No newline at end of file
+ALTERNATIVE_LINK_NAME[sysctl] = "${base_sbindir}/sysctl"
-- 
2.34.1


