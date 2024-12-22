Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3264E77188
	for <webhook@archiver.kernel.org>; Sun, 22 Dec 2024 10:25:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.22514.1734863139430949465
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Dec 2024 02:25:39 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2086c269b1=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BMANMaq014187
	for <openembedded-core@lists.openembedded.org>; Sun, 22 Dec 2024 02:25:39 -0800
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2047.outbound.protection.outlook.com [104.47.70.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43nsub0rkj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 22 Dec 2024 02:25:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IxYzIagwptJ5ET1Sa+Q1YPP4ucVZsCINV2O3s1llEY3Fk4LvH83JR7m+GzJJUokVjrvy1CLBD3h2J93Oq130OoP4EloaS3j+AIPxDsXSXxLkGY/Mt2J2vR6rpZiixdm/xNyJ/+4Q1BGz4HubwEHcpidGph52ySys04f58mygTql/Rhkfa4hHTZ+lxzyZtvnz2RxdzuwhH2fWVZyv7Ppf4G8c0OGklJmXkBxQ7GUgtlnUJpWchhP4ckMN/F1NW7mzBcCOffUj2uu0tnUA/2CIhFZiUOg3F8+D0Sm3fmhYI1oz4/Uud090Xd4XUVHvavlay2y5MC24EYSR6kpoa4zctg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bJ8GnduEYR7yitXtqPKQVIB1cVH3uTBkccLf0bW3dMo=;
 b=tFCdVuMUIQ4zWGb0W+Xt3VN04t7veCei8IIm5OTl++UaWv98Vt9rp4/Klhl+fY9+T0zxCvGHPp1j8/uYedhVVdZdTHLlEvqUMu5HzZ3RfVpUiRq4SrvLyHxNTaLOE6mkur2Xx2waWrG9kZEf/sB2QkqcbQzVTkT0Sch3vhH+px49tEmAUJEvRlWevR78UnuCYcj98/U7rThnQfKrVRwm1v89JAF5t3mNL9ezKeArRKirBTBN8kNDxg643f5EEdlSTT01kWJc7f6UrIQ++/A1ZtLT93p9s+ZBzFKR6m0oCb9ibjdM8XLEkZamj0GLX/bJZKREzWJLrVDsKPs66b9wPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by BL3PR11MB6385.namprd11.prod.outlook.com (2603:10b6:208:3b5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.17; Sun, 22 Dec
 2024 10:25:30 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f5f6:a389:b6fc:dbc3]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f5f6:a389:b6fc:dbc3%4]) with mapi id 15.20.8272.013; Sun, 22 Dec 2024
 10:25:29 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH] lttng-modules: fix sched_stat_runtime changed in Linux 6.6.66
Date: Sun, 22 Dec 2024 18:25:20 +0800
Message-Id: <20241222102520.2949822-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0340.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::20) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|BL3PR11MB6385:EE_
X-MS-Office365-Filtering-Correlation-Id: c9531c1b-66d2-4683-9a77-08dd2272f567
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Md6g+L+Tkc0eggYpU+jJIzzddStmI3L1XslYPFH4C3ReWCXo1DJnyeAJmxZT?=
 =?us-ascii?Q?mGXRI0jglPKR7+OMfHJB7qTT3aEISsDutq5v2j7mPIGtMiIXNdnen3FwEG+9?=
 =?us-ascii?Q?dyQpJoF28PAZmoxf+vUmX56B8yXMbd7/8POVC9TdzneU7fnBBxmKxA9380Au?=
 =?us-ascii?Q?jHzeNMYHlBm9yDM+NnJF1GCPeN88MjT/sDwwiwJlUETFF2jht4rvou1y6IDn?=
 =?us-ascii?Q?NBA3Mv0yGF0ou2TIerfYt2Si0elEuRV034KAUWsLvWmRUIZ0pq0CulkiptYY?=
 =?us-ascii?Q?lv/dTwxLOKZNhZ9VvJwJyZ+Sx7MswdtV/jK6Vh3fOI4vLOpd1V8pXegt4fE+?=
 =?us-ascii?Q?M9jNHOOL59tLiYB93lWS4YzWiVTJOkBg2EqO6Af8NMY8CA0lcNPsPRFp+ekJ?=
 =?us-ascii?Q?go3i6Ua84H8h+BgkrEAwskyKFwwa8p061zjWr34FIbQMrRhfwdY2Oduz51wd?=
 =?us-ascii?Q?UJ9cbPiYY++uXJ9vr3uotn3fz8/csURMSnnQYcapi3G1aTDr7Ld9oTbceF4n?=
 =?us-ascii?Q?AJjOK2F4XmUs6jQfaNgguUiUTTAgd0FKqM3NoKwPxZk7OdNxkvhoAU9g53nx?=
 =?us-ascii?Q?U4hMtnYFfUQIMWOwsR6PjloSg4ApRZhQZEqRjgL7f58PkgU1/3xhiMDelVJa?=
 =?us-ascii?Q?oqgJm1RncTpRUqqbmRfNUqdKpyWlCTI9yPqgT4taWEIXd4Mg4G0XoAITAHgg?=
 =?us-ascii?Q?aXRD9t0ku281CGtivAM+HhhSat6/j+FDlC3dRfXI5+1Y7X8bXihHvVwpLbym?=
 =?us-ascii?Q?PimfYwHPe/GCv3g9+jk7GDz3wo6BToGhaDlKEOjT3/UoSXFGXI/r2hKmfCwp?=
 =?us-ascii?Q?w/HMmEG3SJJnnCnLYWQQ88V23yUB0VGlB4Orl15bGk3cth0hlcR5ybMrEb1Y?=
 =?us-ascii?Q?5wiAZ8R768HXoLCrvWugJiRNkw7yp4ahhxem/RaVdhPuqDP+OkD4bASEAiCW?=
 =?us-ascii?Q?nospxmQHp1+7QA/NRFI+ttsUqoFHHTd5ynG2zCwHHM4YwbA5kpFEHkQzkFtD?=
 =?us-ascii?Q?t0PTE988HkEtG1hAkRd5E6zLW0b9LTzpxsNOpciG04IhHPZ/s24hz4j8+Qny?=
 =?us-ascii?Q?N31xRzmwWTbEfYx446BYuOi0DibVIdK8ANaV8DUHhrLyUefiPx0VGk8svR7F?=
 =?us-ascii?Q?vkPMH+bwvulPo0g+nlpvM3cTuGZbGNuw96TUVHXe4sCU7xxGr2vcKHxPPrX4?=
 =?us-ascii?Q?Sk7z30ZBjiuVEI+6H0EjfxzJhuhl6y7dPuOa1fx6Bp2LusdR9QpbtGlyNNfM?=
 =?us-ascii?Q?TMyVdkfOw/KuHWmWsiDReajpPS7cGaX7T/NCEuQbTdZ5BvU0/jHa+ed30eRa?=
 =?us-ascii?Q?AWB0QNkLGOD7C1urqwpo45HRKsR053ucEhQKfJ+k/NG8pXyPQKny/yBDaZIG?=
 =?us-ascii?Q?1M636TV5R6eQJ9GpePjVrAPCpd70?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GUADuN0nU/U4ef/PqW7JGT9KAiAU0s/F7K4Ap6JFSzZ0QEaJigNipcyadLvh?=
 =?us-ascii?Q?o9fM4Y0QsBJzaQ/QYgFTzeL7WJmmFNe8cRJoxRJQUrqq1jwjTRu4EPbRNZzf?=
 =?us-ascii?Q?4XPzhJnzNpqMl/vn9BpPkpoTTSIo3F9Qa0MvNnfHRpWJooFm/JKJyXeACGJM?=
 =?us-ascii?Q?urvwu3lEYXAm7yemvmNVY7kNQuE8Go9oapO9IFr3JCWL4ZjB/7FoH7Enle5T?=
 =?us-ascii?Q?i8vxOBTXtnMjaMIFwI1VrPUTlu8M7Rpg5T7JqGUEPE1CsSWpV/ZjQVwPNrf7?=
 =?us-ascii?Q?nlZt/aBu46kPOAfVdGHaZ5cWXMz4SubIroIXCwCMd2Z7N4zyET6hTqwxhQDm?=
 =?us-ascii?Q?Y3yMM6Oq2ctDguPVAl5/8gGqTbdqyUA9/EAEzFzgrXXKhmMxO2qfAo/br3pM?=
 =?us-ascii?Q?pckdGc0NeHQ7ZGtEK4IdFshuJvz/wu/7VjOdig3L2YoE0QZev2lWOyKyyo36?=
 =?us-ascii?Q?40t12W584j4/qgNeBcfKjSc448JQ+GQGnuW+LkIMRU775NLRqAhX4bTAvDkx?=
 =?us-ascii?Q?p91fdrdSApq6/6mcVrWvYmbK1ZvK2bLV21GUL5qJDGKWzYNSKAQj/I5ywYAa?=
 =?us-ascii?Q?WCAKkO9vxsdgCFq22WTG+H8Cmv+jJnQ56g6EdFx0OrBz9rq1vlqtsMp86qg1?=
 =?us-ascii?Q?WstxUpNiBfz1VWuoF42cJD60wWQe80je1UGERQa+ge3OacJoOn2YMrVpiBf7?=
 =?us-ascii?Q?hp0IsVO1LeYiGqOE2IorlgIgz4cQnejZnBCMjM09VAhrXDBNq7L2XmiIhqEh?=
 =?us-ascii?Q?fFcjAulhq1lj8Gy+UZgT1xhepRDgifVPrkvPN569aCVBAYvqzQnpEeLL2ySz?=
 =?us-ascii?Q?M9JRV/ZbwOC8tFdCfcbT46CX1pYUYS0lqb3BxKJng+5yy71NTLxWRR17MWUy?=
 =?us-ascii?Q?aEevCdt91HMbHz3a1aZudfPFoocBQf5LpXX3QNJ0biPg32lSxqR/hUrGGlTP?=
 =?us-ascii?Q?9u9C36fml+g19J6K6lMQPbyxN3bItOWzQkRcNH3oefarILb1e0IzCmwAvstE?=
 =?us-ascii?Q?f/M+4KFsmoYE3TUZLZkuoB49waaEZcmzmdZV7lZ+OQS4WLk880G0lbZD0ey+?=
 =?us-ascii?Q?NbqlxOSBfXHeScl891AE/Kwu7I8SrGtNl6RN1EAdozfuoe6NmRfuu+Wr1ZgD?=
 =?us-ascii?Q?DJKsvmm+P0GG9OhmmnYBkMGi5FbgHjXbfo1jDDUCq8ZeC3tLWCTD/6FUMGqp?=
 =?us-ascii?Q?znfpCAgIm6z0i5N0hrCAL5/NV8JV6m18XTU1XMH2ySvy9lx4zgazRPHKwww/?=
 =?us-ascii?Q?Fld/v8/pXLIUk1LkDECG7wxObXSrmu1HxDuP8eR2wA6wulBlMtrmcDcwnVT0?=
 =?us-ascii?Q?bHFSLXdBdeoQlvrE1j4rH2PszBS9RWyL6ZLx2M2w17EmxO+FRAQjc7K0nuM8?=
 =?us-ascii?Q?qfiCiLRepspxxzlRS/xE+pwYZpGDjdSi0R9zahg8Zo3NZGiAryQgKhrHsPs2?=
 =?us-ascii?Q?ykY2pFKAxNf/NBdFcVwhU+T8Qch2YN1F/F3P7ST2Lx1Jryl8W7yTwUImNJG/?=
 =?us-ascii?Q?ll17TlnvSHq9IS0ZGws88B1P3mydy3kH+G7RA5mPkGuAt2Vu2qeBIaMg5/az?=
 =?us-ascii?Q?/2vuf47Dz6x70a2hrJHBBEaZMIx2a8NwVczdlA++lvQ0WZo0XhWATryeh4zJ?=
 =?us-ascii?Q?cg=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9531c1b-66d2-4683-9a77-08dd2272f567
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2024 10:25:29.6845
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zleFtlu8nPRA87vn8CytVkQg241iKT8Wtxd2NrZmh4SNkHuKHGfExnsJUKvoblt3UnNY+WdtKi+PSJr/w1vPIc7x106gI2dg7A/peUj/SOQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6385
X-Authority-Analysis: v=2.4 cv=Ns8rc9dJ c=1 sm=1 tr=0 ts=6767e922 cx=c_pps a=l9lnEPKonMfu/vbXsUzXcw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=RZcAm9yDv7YA:10 a=_Eqp4RXO4fwA:10 a=a5LkSv8FAAAA:8
 a=t7CeM3EgAAAA:8 a=JfrnYn6hAAAA:8 a=7d_E57ReAAAA:8 a=9UzJNNNRWKt2vyI9G7UA:9 a=E2cWBXyb0kjxxB1PlMdk:22 a=FdTzh2GWekK77mhwV6Dw:22 a=1CNFftbPRP8L7MoqJWF3:22 a=jhqOcbufqs7Y1TYCrUUU:22 a=Omh45SbU8xzqK50xPoZQ:22
X-Proofpoint-GUID: c7qGxCHZx-CVhKtr1azwtm6uwbFvrgLt
X-Proofpoint-ORIG-GUID: c7qGxCHZx-CVhKtr1azwtm6uwbFvrgLt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-22_04,2024-12-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 mlxscore=0 clxscore=1015 mlxlogscore=999
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412220094
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Dec 2024 10:25:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209000

From: Xiangyu Chen <xiangyu.chen@windriver.com>

The following commit has been backported into the 6.6.y branch.

See upstream commit:

    commit 5fe6ec8f6ab549b6422e41551abb51802bd48bc7
    Author: Peter Zijlstra <peterz@infradead.org>
    Date:   Mon Nov 6 13:41:43 2023 +0100

        sched: Remove vruntime from trace_sched_stat_runtime()

That caused building the lttng-modules report compile error:

       tracepoint-event-impl.h:133:6: error: conflicting types for
       'trace_sched_stat_runtime';

The fix is still pending on lttng review board, backport it to oe-core to
de-block the build issue.

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 ...stat_runtime-changed-in-Linux-6.6.66.patch | 51 +++++++++++++++++++
 .../lttng/lttng-modules_2.13.16.bb            |  4 +-
 2 files changed, 54 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-Fix-sched_stat_runtime-changed-in-Linux-6.6.66.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-sched_stat_runtime-changed-in-Linux-6.6.66.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-sched_stat_runtime-changed-in-Linux-6.6.66.patch
new file mode 100644
index 0000000000..bb40ff7243
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-sched_stat_runtime-changed-in-Linux-6.6.66.patch
@@ -0,0 +1,51 @@
+From 74cdd186fdd540b98ecded94d506b812d7d2bae5 Mon Sep 17 00:00:00 2001
+From: Kienan Stewart <kstewart@efficios.com>
+Date: Sun, 22 Dec 2024 17:39:35 +0800
+Subject: [PATCH] Fix: sched_stat_runtime changed in Linux 6.6.66
+
+The following commit has been backported into the 6.6.y branch.
+
+See upstream commit:
+
+    commit 5fe6ec8f6ab549b6422e41551abb51802bd48bc7
+    Author: Peter Zijlstra <peterz@infradead.org>
+    Date:   Mon Nov 6 13:41:43 2023 +0100
+
+        sched: Remove vruntime from trace_sched_stat_runtime()
+
+        Tracing the runtime delta makes sense, observer can sum over time.
+        Tracing the absolute vruntime makes less sense, inconsistent:
+        absolute-vs-delta, but also vruntime delta can be computed from
+        runtime delta.
+
+        Removing the vruntime thing also makes the two tracepoint sites
+        identical, allowing to unify the code in a later patch.
+
+Change-Id: I74acf0b8340c371e8411116e07e5c97b10f9c756
+Signed-off-by: Kienan Stewart <kstewart@efficios.com>
+
+Upstream-Status: Pending [https://review.lttng.org/c/lttng-modules/+/13813]
+
+[Xiangyu: BP to fix compile error on linux 6.6.66, Minor conflict resolution]
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ include/instrumentation/events/sched.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/include/instrumentation/events/sched.h b/include/instrumentation/events/sched.h
+index 32d18133..0c62f2e6 100644
+--- a/include/instrumentation/events/sched.h
++++ b/include/instrumentation/events/sched.h
+@@ -647,7 +647,8 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(sched_stat_template, sched_stat_blocked,
+ #endif
+ 
+ #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,8,0) || \
+-	LTTNG_RHEL_KERNEL_RANGE(5,14,0,452,0,0, 5,15,0,0,0,0))
++	LTTNG_RHEL_KERNEL_RANGE(5,14,0,452,0,0, 5,15,0,0,0,0) || \
++	LTTNG_KERNEL_RANGE(6,6,66, 6,7,0))
+ /*
+  * Tracepoint for accounting runtime (time the task is executing
+  * on a CPU).
+-- 
+2.43.0
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.16.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.16.bb
index feba35fd2d..f2f7947903 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.16.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.16.bb
@@ -13,7 +13,9 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            "
 
 # Use :append here so that the patch is applied also when using devupstream
-SRC_URI:append = " file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch"
+SRC_URI:append = " file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch \
+                   file://0001-Fix-sched_stat_runtime-changed-in-Linux-6.6.66.patch \
+                "
 
 SRC_URI[sha256sum] = "6694414a3701fcd6e05b3cb20cfecae3b46b3dfb9e5361b344851c1f8052e854"
 
-- 
2.25.1


