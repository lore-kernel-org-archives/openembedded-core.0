Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DB03E77188
	for <webhook@archiver.kernel.org>; Sun, 22 Dec 2024 10:23:16 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.22696.1734862983691424178
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Dec 2024 02:23:03 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2086c269b1=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BMAFa0t005007
	for <openembedded-core@lists.openembedded.org>; Sun, 22 Dec 2024 10:23:02 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43nmn88xef-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 22 Dec 2024 10:23:02 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RVIp2BPZ4du0VY/lEXql7Qz+u9YhudFZqOwKWyC06JPFMpqIEWRfnp2hj8Jzs3jFazq8BaFO8kzrg6qPQxi0KUB/PjbUDw/uv9FeFBaT5o8Mr7ngwFN3RTVfyPLzTJ/e9hbMGd4VygGG9b/qN3gqEYJhgcy+kiP3lMERRY2bJsE7ikKfmovvx6inWSSbhXbgHNnvhr2CwNKwF2voY+3esKCdGH2OzvImxr5Fr9WMYSaGfoQEpdLF/6HKV0kv5pNLznDd7tCAMHMKDkiiy1bHHyhy3XYFxQtBwLzeLTT0S54iGR9bh5EO9V5MC6iOI2yepwJjq3NNvqmbIozeBNvsdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WInuw8j13Fnie2d6cWEACGKMv5VdQt8t3PyDk0H/9G0=;
 b=v3KRduTzmzSDZnY7RYORrOhZ0BRpAPILqUoj09+rA/VeNJnuB0V+3SVCdLFiMiVVKDlDNYV+zyVwE63nA60ulstLhgzYTYw8DLrtFFlZ2Ojw0nW9tMFQDuXd4RpI+TW58jiJFkYfnNFuT7OpG3g5Sv6Xf1DBQ7BgkiLaPk3nUwPVkp5G7O8OOeAURFGlD6sz/bVwZfoeElmo6Jgka7EkVD9YIcFrIrZ7g6zYLiegrtxQT6665ufCYpFUNjSYvHuQQllSke4UDH1K6wRPlGomlgaUWEFABWAExLSSwg1VqYUFWaMRK0vDYBxmKAfzupnyHcf/03XHDPl+ydHFuZHalg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by SA0PR11MB4655.namprd11.prod.outlook.com (2603:10b6:806:9d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.19; Sun, 22 Dec
 2024 10:22:54 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f5f6:a389:b6fc:dbc3]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f5f6:a389:b6fc:dbc3%4]) with mapi id 15.20.8272.013; Sun, 22 Dec 2024
 10:22:54 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][scarthgap][PATCH] lttng-modules: fix sched_stat_runtime changed in Linux 6.6.66
Date: Sun, 22 Dec 2024 18:22:41 +0800
Message-ID: <20241222102241.2949689-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.44.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0183.apcprd04.prod.outlook.com
 (2603:1096:4:14::21) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|SA0PR11MB4655:EE_
X-MS-Office365-Filtering-Correlation-Id: 2418e56f-e9d0-46dd-d20d-08dd227298a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?7pJJlcOBR7iq2+xU68PX4eEUOP5G51swTUEPaJaeZ2DSmsqSZg+n4dKXMQ71?=
 =?us-ascii?Q?nnzmQMJMxgcUGsFfRbLO03SHV5/gOtxJG68FW8MHrO+M1izAv5QQ5Shv9Mld?=
 =?us-ascii?Q?EzdYrjKoXeRFSJKCgz59svz6b3ySB++lN5OmsBZLD6QYpAZg9fORTW3xHqu8?=
 =?us-ascii?Q?lcn9TS4W2+vaT5CQJCE/vVifRYSYyvf7vjup09NIGUGSGXR1PbTT4p7iEEvO?=
 =?us-ascii?Q?v6VRaIVbkr3iOEO0rJMTMck40kzZUIlBZXiEmQsDKBlXpbF/rjS0Wcx0HloM?=
 =?us-ascii?Q?KQi6T71UE9y8Mn/iqXgORzh6xW0B+yVzAy6gTP6pKzECSwkzsgwk1j6TLRIM?=
 =?us-ascii?Q?YXjGQYxHsyXmKa9VEGsHkJ3hegY9iMunF14lNg/QcQTcUnMn3JNgVUtg8ySz?=
 =?us-ascii?Q?6x/IPBDeDYl4Zwg11p70a9h9XXNL5BjVFGBqSrQcjw8SofW3DrdP36lGq72O?=
 =?us-ascii?Q?2hkMjTayQNHHyyICGzECQhEM3O6pp85iDD/bMdkv7WQn7wjTI97KLJgsf/Kx?=
 =?us-ascii?Q?I67mq9j633jEsOG8C5/m5vz3xFRHoqypccMQUHueTgdI797b8Sri7UpcwK0x?=
 =?us-ascii?Q?+wCuE9YnWUSjS7XTZL+C8MQXoCMxV+tPeOdqa9YkNY1Ga9qejQP3YnzuCOIz?=
 =?us-ascii?Q?koAEzzlx+ymrMdCfLwjLrg6ClOZrDjdjETkYpIQT6Vupk0vKkYFs7n8Lu1hy?=
 =?us-ascii?Q?soXXWfHQR35tNAJE+3/3L3zkXA4yuoHFp3zGjvg4/Xua4YvfTPS6lPuTX7T9?=
 =?us-ascii?Q?61f64/8WwDAaQiV2eZQ6RC8/4grMfkJq/jwpb54PtLcXStGWbjBnXaxkVl9u?=
 =?us-ascii?Q?CbeD4p0p1WzfyjLd+HnBzvvJnlG6YheiUrKz3on/O7lZz9lZ1fYos/jF1Azi?=
 =?us-ascii?Q?MUsqEVYg8Y8GEHTU9HpRCJ2ndPqISEKkPxZuYhCvSPQ2jmDATdHr3FOX2OBn?=
 =?us-ascii?Q?JG2ct6YDNhtOecYVTtLJRb3C7VQpOvB91GXNEvOlYU0JwGMJaEXEMn6yNytv?=
 =?us-ascii?Q?9jr5MQoMCWQ7j9m7e+5fV16SVdxpriZY5C2HbpJViHtCCR4SGg50Wr5NGrui?=
 =?us-ascii?Q?Ps8cfVOlTc5w1+ftB/qVxh2Q7EtOJi40RoRaD8cRGmgWwtEijPgSmx9vuj4K?=
 =?us-ascii?Q?hLkTHN5oH5ZCxg9SQFsfkcbAEt2Qn5PlW3749+8kSfiVqExbLks9Sn+kMWrE?=
 =?us-ascii?Q?OTomAR12kKG9gtchUdaFHPjWJLi60G812Lpy57daGksSfZeDbEjRIzUYBwuB?=
 =?us-ascii?Q?V8jm5+AWoORV7ZOM4YnTusYVj7x1a7tZTL7dOGk/OI+keq9o3YCMHQRYW7+j?=
 =?us-ascii?Q?tCaaVvRffcyGHMLKZ64h8VGCdsV4GU4ysYVG0UJWs/2NUQjOWJBWigM0Xo+X?=
 =?us-ascii?Q?vD5HT6ib/le6MokPomwIT7LkHkcV?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9HAVrZ5TioFYj0zvejf+hI0oN54SFIXha69JWiya90ke4c08SjUgI6VUWdcD?=
 =?us-ascii?Q?zY2ReDmjHtLvx708QTSlns5iou0SH0EyrlePOz4lWDrb0njr0x7y8dSeSGzN?=
 =?us-ascii?Q?XgzszjSXRxE1nF/2Wq58vnHXQdiK9Y7C63YlLcUtH+r0CRY79IO/D4KHJGD4?=
 =?us-ascii?Q?5koTK8vN8xn1vfpJNB77KDWBLXKRLFrP1jmk2RlQmFSBMZw2xUns8/W/VVUF?=
 =?us-ascii?Q?hzXVHG2WWOMaNF+b9lvHeT4n6ryX8yRfx3VROXj4mSqG9m7Yn95J8+Effee6?=
 =?us-ascii?Q?c8fcHYtGHjPlt6A4Rk4dqM+lNagY4XDQp0efeTDwrulRcWaPWFCTSilDMQTx?=
 =?us-ascii?Q?tGk32xMdnihgZilKTdgcZsUFUKq1qg+lf4xxKbAQTlWaG9Har2cctkCjyM4E?=
 =?us-ascii?Q?w2rOoh4Z+Ju64dVmRg08STSS+j9Yd8dGP2K3NV8JqcojeQXmcCdvFyOl1xec?=
 =?us-ascii?Q?mXIUEfB8tywX5TURUZoWEBARUxVaTdSI8Yb+k7I9yB6yn16aB0SpkyDysoqj?=
 =?us-ascii?Q?+akPf5cotLuQayEChb8xhE9SeenBmgI2X37tz8BaSCt0M7vtW089kUV9L8ZL?=
 =?us-ascii?Q?KXcxYzOePKVKbSJAWacbNO340KlksQ8Tzc52+kPRywybQKSeh4fD+EMV23Qr?=
 =?us-ascii?Q?h3eslDZgHl5mMwXqM+Kr10tKdswEo4iRd3m1cUwVSSyJBJKdEWmcz5QEusIZ?=
 =?us-ascii?Q?q3LXICpJCXJF49EEjO1pT6Wx5wicFjcM0itEHfZGh/g/OLEKUU5iGUfTlLBK?=
 =?us-ascii?Q?LwPwCOG0+L885xtbrNiXT6vgK/T8eEFkhhyk20rI3e0AEJKguF76wYwj3VrP?=
 =?us-ascii?Q?RjuMiB4HcKbKIkK0ejMBrO+LVuLxs7Emi1MNZdowNpxEIQnRKnToJJXjRqZN?=
 =?us-ascii?Q?jAO0z93O2NE2B+5pwKl2srwhLyyBUfo9tHnyuztmTEEX9KSycOzsY0k1HA4v?=
 =?us-ascii?Q?cAamhKH+99PaBAP0b8p4fYZNIqqzm2AO9f/Yfl3dnUqmWf1S+DypdedcRcaz?=
 =?us-ascii?Q?9RJL1G19S1hSsbZ9+OA5cLWIPw5t+nI/9pJtjHZvXdlk/I3uY0mF1XxvRUpN?=
 =?us-ascii?Q?O+3Q5mxdV5aY4kKO2QhJd3Jt3r6o6teW8SFLRcd3oEwcHK0kduSlShiU8QDz?=
 =?us-ascii?Q?OEv1P/F3PDUdJ2JKT/IsjswPq4EfBEscW0v9XObDrjkN4xA6jeYmGlaxPG/z?=
 =?us-ascii?Q?nLqNL+MnezbI3tP4/aX60e8gyqlVXjcAWh8gRyLTJpZ+k3v/0WBBALvq2QQP?=
 =?us-ascii?Q?G6D5nuYCM8XY51rbc/AByX8Xe3aadwVqWrJxwotLl1Rf458HbtmKjcnvZq7A?=
 =?us-ascii?Q?OwrlS68xl7/feBlqRCOc20Lq2YvLVDtE/No2c9qt0VY02Dt3I+Abll4tduRK?=
 =?us-ascii?Q?CZeCltJ9u5syXVZK8YA7GAWeLImufTUF4KcN5WeYoiyutGAMJbKPadQNovZ7?=
 =?us-ascii?Q?3En2Qj32Xx/Ktem9IsGviG3A7J17VSaHQNax1CKV9Tcm6uMUMs+axvpT7K+S?=
 =?us-ascii?Q?HwrKjqhzEoWWLae2ux9cC8Gnq6dgk0kHELxp13KWSxOlj/+SnaawVt4shJuL?=
 =?us-ascii?Q?eABU87155U/1+fznFbZ0fXQp6ti4zG8TTyo3XpWrLZPs4Z05ljt1WK162P8t?=
 =?us-ascii?Q?jg=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2418e56f-e9d0-46dd-d20d-08dd227298a7
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2024 10:22:54.1095
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x1EBjbSFV+kPJcHwjFMO/g/1JwcMuyLSZCXG744YSaO3D1Z7gTY+3/DKVl9UKliGeGQ7jH4c0VO7KuBKMdQJ26bPuli4dyctUwToJx12SPU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4655
X-Proofpoint-GUID: M-mPV44E5zBCnfnYbUFUlzuwdCwK13O5
X-Proofpoint-ORIG-GUID: M-mPV44E5zBCnfnYbUFUlzuwdCwK13O5
X-Authority-Analysis: v=2.4 cv=CeHy5Krl c=1 sm=1 tr=0 ts=6767e886 cx=c_pps a=mXs27GP3B2XOU+bPH1EGlQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=RZcAm9yDv7YA:10 a=_Eqp4RXO4fwA:10 a=a5LkSv8FAAAA:8
 a=t7CeM3EgAAAA:8 a=JfrnYn6hAAAA:8 a=7d_E57ReAAAA:8 a=9UzJNNNRWKt2vyI9G7UA:9 a=E2cWBXyb0kjxxB1PlMdk:22 a=FdTzh2GWekK77mhwV6Dw:22 a=1CNFftbPRP8L7MoqJWF3:22 a=jhqOcbufqs7Y1TYCrUUU:22 a=Omh45SbU8xzqK50xPoZQ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-22_04,2024-12-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1011 lowpriorityscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 adultscore=0 suspectscore=0
 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412220094
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Dec 2024 10:23:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208999

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
 .../lttng/lttng-modules_2.13.12.bb            |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-Fix-sched_stat_runtime-changed-in-Linux-6.6.66.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-sched_stat_runtime-changed-in-Linux-6.6.66.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-sched_stat_runtime-changed-in-Linux-6.6.66.patch
new file mode 100644
index 0000000000..3c7731ae8f
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-Fix-sched_stat_runtime-changed-in-Linux-6.6.66.patch
@@ -0,0 +1,51 @@
+From a04234d63999f91405574928c80ded870dca157a Mon Sep 17 00:00:00 2001
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
+index 24cf37c8..637a1e3a 100644
+--- a/include/instrumentation/events/sched.h
++++ b/include/instrumentation/events/sched.h
+@@ -646,7 +646,8 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(sched_stat_template, sched_stat_blocked,
+ 	     TP_ARGS(tsk, delay))
+ #endif
+ 
+-#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,8,0))
++#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,8,0) || \
++	LTTNG_KERNEL_RANGE(6,6,66, 6,7,0))
+ /*
+  * Tracepoint for accounting runtime (time the task is executing
+  * on a CPU).
+-- 
+2.43.0
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.12.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.12.bb
index 95d5e2d615..34aff1ba8d 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.12.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.12.bb
@@ -14,6 +14,7 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0002-Fix-ASoC-add-component-to-set_bias_level-events-in-l.patch \
            file://0003-Fix-mm_compaction_migratepages-changed-in-linux-6.9-.patch \
            file://0004-Fix-dev_base_lock-removed-in-linux-6.9-rc1.patch \
+           file://0001-Fix-sched_stat_runtime-changed-in-Linux-6.6.66.patch \
         "
 
 # Use :append here so that the patch is applied also when using devupstream
-- 
2.44.1


