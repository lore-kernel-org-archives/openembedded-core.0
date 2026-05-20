Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DE4ACD4F54
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 10:02:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8692.1779271320941521869
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 03:02:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=rBcYrRUj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9600e7f06c=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K9XkSt1748946
	for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 10:02:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=vufViU9ug
	E3z3XEDYgK9vXTHOpb4nWBgnWQiUsPOlow=; b=rBcYrRUjPUodvC2DBJDEJyJMg
	hhkuUKBqRuXzfl0Skvy45IYYxg5mgEztErPvANW7VK81BeZ0URLxeYSrmDXMR7C/
	uwahH3anw2Ei0TndWEv3AABShVr188jMZiax0YSgXhvB6TB0hySP34qq/4AF1FO+
	t3InQdBjfrzqjVdXTDPhTEZqHkqxqRDOeKMlvtZe1Skz5R6RQk8ISqs1vKauFOJl
	SyF7aMKkWEsg66usbjmCYnptb/1dokx09Z0IY+BhcNx+k1F/UyBUOqmrKZKsX2V+
	2r/5Q7jOLtfhRMxS/jZ0oZtBZ8U3wmY952Ui6BxZltO0nBkMipUv0kDB1OmUA==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010005.outbound.protection.outlook.com [40.93.198.5])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6fj3w2e2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 10:01:59 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f3jzsheaKYa+2MBc50IZi7T0m+lBbLocaflkH+ggppV5U59N2XSMj6rK8TmGTCPXU/Jn+GOy2DnrMq0dm6mKFZJyfRyUjzfssYuXLgl3ELuf78RdTYbEWeN+zzNmvRqP47m5GLBuFUziets4NkiPeYOD2mn7Oa5KfXwd5QLO2iA823WYewOIyducbdRee0MQ3hqdyIbTx19BzkwLtM8j5OsxQhfoJMZnMik5T9GVGXiuM217bPQFY++zFWDLg70Baps6PhAXiXxlSANpCE7yo3tNg0Mzg9W/FFeS92vr+M9cEzIddCxZFp0dCKQXaBUrlR6XUETgdqQKO2YZBuOqJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vufViU9ugE3z3XEDYgK9vXTHOpb4nWBgnWQiUsPOlow=;
 b=dnNVO5mFhEfQP2WiN/XKxHRWhERQrV8yFkDJs+Pr5onAq4OP8EdeoujDGORX7ZYyx/eTaNUTNMGI5fuVN7m2NmjoR78hpPDStduyqYBTCOooQ4U1NQlw0bLvW/fL2QZI6IxSswt9u4SQ1GW1mbqp5e9N4nIpv1Lnq2MaxTW9VmC9c9k/suXEi5kw54n1nyWAD2pThhow2ojJSqxBuwC/Dz9VbciwtVVRl3CtLwGdZBCt+DzS2ygY97B2jFBcAJ7z0CZDMNvFbzcj4PJvwjga5Uv6yMG0pgi8VyEilLk3jQ+GOc4knBW1Cr/gLGhcSpKEhGOZWBUzDPDnB6FOFNwa/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DSWPR11MB9956.namprd11.prod.outlook.com (2603:10b6:8:3a4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 10:01:57 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%6]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 10:01:57 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [PATCH] perf: disable BUILD_BPF_SKEL by default
Date: Wed, 20 May 2026 03:01:37 -0700
Message-ID: <20260520100137.2414829-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0209.namprd05.prod.outlook.com
 (2603:10b6:a03:330::34) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DSWPR11MB9956:EE_
X-MS-Office365-Filtering-Correlation-Id: 249e0f96-f2f6-43e5-d284-08deb656d3b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|18002099003|38350700014|11063799006|56012099003;
X-Microsoft-Antispam-Message-Info: 
	dhb0mSpfRr4miMYI+QIsi2nXNxGMpgVGwM6PmlqGp36VEltgea4/S4SFDTtT+SYfxzM3LISwWTATPksnD/P7kVd/gB9AFD0iW70YbLTh7YSbjnKQkaXf5B3aMBKYzSTGvXWb+v+o+rYPMqsozj6UpSqgR/LTq9jZnwLT9n3VqeRVPthsbHDm9TuRG50nRkckjbr5Crm/3wfEQum7ZWRiu9KPF/bGBxmt2HN6MIzZee0WKKDKRBl1fZO5cD/4MOh79tPpdzsTLexb6yv7CuGojPUxmJnHJ/647/+2sKLAN2qCWdnPvOnhEYC4L587cTD5IqK672sokbKhXQ+Ypik8Zo7d0p0V1scH2R30TXDgO3yQUXvJz4Enajc5lkihx7GbFBxBgkRdKKCAuP9ezQafzUBkeVg4In3lglRV+bLrYJj9Dw4yjB1zN0rPIOBM6qAUshIP1MSx8iuOnWg/JLPxvakhg3ZivpfKa+iyT6v1qNjgsHOxxL6qkdUWMpOz/PMPoTKLPqvIL5Lpj/lOpILhkAw/cw8DfOWaS9U+BmUHbbcyazyjJW6nIF/ZpHVv6tJhqR0i7Q2PAFr1fy55EHLzZ+EfqzfqiSEU0AnRYhgKda+bopas0Cz8//mEK9pzpg+7Jg0+5nS9YFC8mfoEfbHs/Ah62RZQqWmrgejAalcinKV5U23e+WaurPXMyRA2sbBlHT97R/wemnfyL6MqhcrX+Pc/RMVjqf+5JubPPdW8JJ7kZd7JgwB46q/WBt/UGzUb
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(18002099003)(38350700014)(11063799006)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ta+YqxJK6VMlII0w8wochx6+WidXi51LMiriKSdhs/vSGBEUwSWLQtYuyVEd?=
 =?us-ascii?Q?W7Y2FAu2pStHViPlaCw4jQkRWsj9N2024G2yBsZqvBE7Q0s8354h1ceVm/Su?=
 =?us-ascii?Q?wD2eKXF85qWozhh+L3yuhYQ4lC57obE9XqBocIEGVv85UY34ovvNDF2H2qCr?=
 =?us-ascii?Q?2gpNuZ1hMNPNC8LDaX6TiJf8azkH1BGsU79aqwBvPsvDzIfSgh9fnT2Vw03X?=
 =?us-ascii?Q?5TBJDAgGU5u33guCMbmFSu2BhdtfP1lFkHSPR9fbpa/yrnT5l5QecBBEEQlv?=
 =?us-ascii?Q?ERQlKA+Co0DcybUy4A0uV0xQNXYjg9ZjM99WImrTkiz6jsajPP0CJ4YVdXPR?=
 =?us-ascii?Q?gHrG4Fh+24VOvGHHQA5Ud0WrT6DyHO++ld+DwCTIMA+uyEcq5TI6PtNNjKuj?=
 =?us-ascii?Q?ma7he2PptCoHB0E1IU7QgcwtFEy5Vp22l8ygUb5FtuJgWn+vDLoHqKBJBSKF?=
 =?us-ascii?Q?vUzB+L5nI6fQaPnWCq6+/2/K8m217YgHNMsoaWkGtj2xJpxxfTG77ukpLlUx?=
 =?us-ascii?Q?W5RJz7wTvr7yLPiqyyd8Ijp45fA1tUGcuKl2N5KSPkRwj86PjT3qBaXi9Qoe?=
 =?us-ascii?Q?TayGwD9azCnu3eL86UJUUievjR99KcMRAiKZRp92i1WjlRJg3BRLuLNKg487?=
 =?us-ascii?Q?UOvyhqroPVTjoTvodm+ljplIWJU1KPOs/sBr3m00CCPPxkRDiB/IJe4pi4es?=
 =?us-ascii?Q?fReQDvko180wt8ZH5YCjA2oYHNMVKQAhqD30KdmuRL/bXAx7vWkinH+EVOMi?=
 =?us-ascii?Q?1rAem1IuvdPJiqRwnjygdrZIcwGxx+BPVz2iKhWG34+8nTgo5KBbhN034Ru6?=
 =?us-ascii?Q?Mzr4wa67I9dNqR+pQObhXnbWfEBtpUMRC9ASMDykWaC5hxpXNKoawCFnCyFw?=
 =?us-ascii?Q?QatjkBsSq7nplMFb/69JwzJdqi8u6DkojdujCF88unvU0XBBFN3YyxfwIoJ+?=
 =?us-ascii?Q?HHlaQkBWj8iwWwYW6usebsGN3rNhNRu4kTW3JXElglIB0vZep2oZoQQjFOAA?=
 =?us-ascii?Q?zIELvpk6q56oYpnCOKl6lCfp/wy9N+8NPhS2ITNMI64N/aoZohQW61byq0DD?=
 =?us-ascii?Q?lhvoauGD7BCD2Lu8kfYoembreYGZSqU83+iUMlW1Zep+3Nw28JhQ2gYeRB96?=
 =?us-ascii?Q?rIpyLaQ4Y+7h5ftMJNMCFm4bXORyv2d/+McJofQuHLA4kzFSx8uRBaXCYW0q?=
 =?us-ascii?Q?enY2fFT5d3/y1n57bQed4URUw5B8JjmBiY415FmJpawanMjem8XGu0g+aW4P?=
 =?us-ascii?Q?B/8qTe3DjODP4fL2RyG3elPoxJaloqqHGaAA9HQseDjpNV3pUrSRKULV8gbL?=
 =?us-ascii?Q?pXW9snODblrsA13o2SHyGzkYtg+LzfDr97+IAofTbMxjSoz+3uXZZSb032Pm?=
 =?us-ascii?Q?VQ27XJiiCc/Q0UY2prECrOvHpoIJVvr20FbXtKQ6LHUHA+53b2TS5kWB/ZSS?=
 =?us-ascii?Q?8eKO4ZKeIvyM2ibrvzhJ13bMHsxk3c2713c0XVaPvGUBuNssEZ/kHsiRqmok?=
 =?us-ascii?Q?UjLM7mHE5B0nDl4IuTeuu5yZhNUONYQHqnb7JQvEjvVtWvxsAcXwdM78/lbc?=
 =?us-ascii?Q?HCmlzVEGtthZ3wpbgYOt0ze2IF2jh49+e3yp/EtAARZOPkRlt0E6faXA0aJT?=
 =?us-ascii?Q?qp+K1V1KFw1wmA0IFEDyL6B2PtNySCW84ewMShLWTj1YCxcrws96jTPl50hl?=
 =?us-ascii?Q?5Twnm84VVDR3qo0Auw2VLQY6O3A3c0aUjBJU3u4pNUB2Fmwnptj/p8KfXEPV?=
 =?us-ascii?Q?Q8TflWdmTHDbRwyHT0fSBgPqvbOjphQ=3D?=
X-Exchange-RoutingPolicyChecked: 
	ojKD9jNMuPDWy8ruFmriVbgESAHiVydbitYx/htqoIgk81JwNrV/eY2A1EdDMoACedzri7+vAFEQqruRkcb1fzcXmGG2lKTF0SSNPNa3ULNUZzAD748frBbaq1CyovVivei3C25Hj1lxUgTeBYNnKvp1hKjPJRh82u08bu6Ropc5r981cpu5PQgiLEguERxZMvT5R6/pmqUmFAvKcrok10G5faOZ4Yd174UXbPlrM9MdGPvBSVt5YQQVpeu0M/Hu76RnzcSt7UgDP4br9W96ZIBPU3CU9wMYMUUzkxkFv13McQ3Zm1NGDuvNFZR4N1TyIyHBOVH1ffdEXjdR3nyt6Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 249e0f96-f2f6-43e5-d284-08deb656d3b9
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 10:01:57.0337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ueyy8KEA2IbHrVQZPPPR1zbb9OzcnK5+RcYpYpX5ni1IpuiYeLvvoImHQNhW/N/LRbnd/8S/c3IUOlQf3KmPY5DYv0p4ZZGfuiOkFdvidNA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSWPR11MB9956
X-Proofpoint-GUID: rWOTKHcbUYz0e_56EPFkB2GvjiiCdU__
X-Proofpoint-ORIG-GUID: rWOTKHcbUYz0e_56EPFkB2GvjiiCdU__
X-Authority-Analysis: v=2.4 cv=VssTxe2n c=1 sm=1 tr=0 ts=6a0d8697 cx=c_pps
 a=bt8r0o3PvT4lvF5YbTRm1A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=tfS-ctL4uiHXehzguyEA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA5NiBTYWx0ZWRfX6K8fohLrtspn
 bkVaAPPagnnbf4H8ygRyPaxXfoYHVyHpuBOtinoJ+o7VvtzdogL5PR/2Qv0ARdpHoGgSkmhoEi0
 RFrQ6m6VojmA2uu7q94t5gucm5UTs1I6F/gaI1AJo6HbqheUn1dvF/nIkeVb2S3Fd17I0v4zBGq
 DI36X0YpyVrTeX6wBRhGzq98AtMIT3+yVpNZX5zTIlJQk4wmwM9inX0RFWAEi9xTy6C0AKJkEs2
 yG+DK9Cjxm7EZyi/TT//P/kTGCsPliXgOJeR9tjpgGq+5bt76C3BJn1PUHcUOmZ8Oj6bIlDhtSm
 zr9LuRkR+5sqFzNHbdGfWv14xrvzrt+gpdQqpdwyomuodL70vXUKeMl91tPjxhMN/38zOh6lSjF
 hNhFxjTkfZRntLwUMwSr6T+TTUB7amSCGM4zWIzksHXrixvIVWuCmlRz4bP7q/iOhsL91Q8SocK
 6WAaT/jk0eJDF2IuFxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 adultscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200096
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 10:02:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237440

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Enabling the Rust in-kernel feature pulls in clang-native as a
dependency for the kernel build. During the perf build, the presence of clang
causes all BUILD_BPF_SKEL dependency checks to succeed, which makes perf attempt
to build bpftool as part of its build process and make build to fail.

Previously, When Rust support was not enabled, BUILD_BPF_SKEL is set 0 due to missing
clang dependency.

The perf recipe does not currently provide/support the required
bpftool build environment, resulting in build failures such as:

Error:
| make[3]: *** ../bpf/bpftool: No such file or directory.  Stop.

As a workaround currently disabling BUILD_BPF_SKEL by default to make perf to build.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-kernel/perf/perf.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index c3ef25fd99..e3e5d55e39 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -438,3 +438,9 @@ perf_fix_sources () {
 		fi
 	done
 }
+
+# Disable BUILD_BPF_SKEL by default.
+# Rust in kernel support pulls in clang-native, which satisfies the
+# BUILD_BPF_SKEL dependency checks and causes perf to attempt
+# building bpftool, resulting in a build failure.
+PACKAGECONFIG[bpf-skel] = ",BUILD_BPF_SKEL=0" 
-- 
2.49.0


