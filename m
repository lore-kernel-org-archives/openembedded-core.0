Return-Path: <zhe.he@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72A73C3DA78
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 12:13:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.194463.1673957615476529642
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jan 2023 04:13:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=fjM5lQud;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=038157a73e=zhe.he@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30HC8aD8003291
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 12:13:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=blX/mKVCv/vlz1OdnZk75426MgN3nD5ZzV7wZC2/t58=;
 b=fjM5lQudLaqkLepf5nzdZwsGXI8U1Y0bHAWFiYZwWMoKG7zCkNwG85fyaYZxr8mrwvGF
 6jWcy/B8DQoNKyKIBYzqbAKaGXMoKTZYOg0undnE2HVi5rW7/9wbKIi5QkDbS2dEx3eH
 Cc1a2QEHeVfZ01Rki0b18i+MxIRDs7t3gis83o3iWjMxy/MiyS76uR6CS8lpt1j6tEVt
 8+dq487fJIXLZJPtnwD1kF451LbC6Uda6jrI71mAkFhEfXp/FKVfjgDNI9MO+Rh9eyHE
 9v5ZAMfe3NXQeWvJprUzR9cD/bQ20QWSQhOo+Ow+hj24LFFGK+q8Ws3O9eFtJTv0PzWQ bw== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2104.outbound.protection.outlook.com [104.47.70.104])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3n3kc8avey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 12:13:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K1pZA+LoWWNILAq+H918aFwkbnGT01fc32KJKw4ksoz/x8jO34/5q36SF0ztl2k0PE5pqr5/wOMDuZRyhsWwxIFcBPJwarXdOvSb4FKH9RxmuWu3p2DEZDVzjwG3ynAiZqWejahyRBX65FUloXW/mcVNDjoLkU55gHCYv2fd1n6hG6Oyf3YjgQJY5VR7Kx9RISkk8rchcB4TU/kB3YG3ph0H+5I3Lj2wjUt8/BII6Zedo8w9f4/50HJgkP+dL+UPmcBmOzW18YpWUtqBTB7rE5dkFPeihf21nFvW7UYc7wh2FU1kFnVki2codRtax3wMPIaI5dO15Fx/M3oMJSw92w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=blX/mKVCv/vlz1OdnZk75426MgN3nD5ZzV7wZC2/t58=;
 b=fOLFKBDaGyq9fUwv0aZ8+zjw9IiRRmS7NktykJmnIZWfiHdNhl7IUwKaxfbprWcmGqUJkUh+Bu5GCcvIWdVrVTX5qybPTV98DnG5YIruOURLL1e0JjzRTAvB5J08MLnvBAZ+HDAa7Oo6o8gWhBQXzd0MEpcpvomV1Ny5UFmoSOP/qpQvf4kwR8gHKMCj6yo7I6GyyokDgruwexxvjH3g9V40NQjg+SmRFhCU4R9oEkGWkv8HwVsr0+482PiNz/xEvE1yQbzAluXiWBgI/ULU3OmmRWWk2i8oXF7NWcBJAVCP8EYYuummfdves0geriVtwhNsPk35/zBYQxuG6sgLGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MWHPR11MB1358.namprd11.prod.outlook.com (2603:10b6:300:23::8)
 by SN7PR11MB7590.namprd11.prod.outlook.com (2603:10b6:806:348::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 12:13:31 +0000
Received: from MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::c5d7:fdca:caeb:3e50]) by MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::c5d7:fdca:caeb:3e50%7]) with mapi id 15.20.5986.023; Tue, 17 Jan 2023
 12:13:31 +0000
From: He Zhe <zhe.he@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] lttng-modules: update 2.13.7 -> 2.13.8
Date: Tue, 17 Jan 2023 20:13:18 +0800
Message-Id: <20230117121318.3091266-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0010.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::15) To MWHPR11MB1358.namprd11.prod.outlook.com
 (2603:10b6:300:23::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR11MB1358:EE_|SN7PR11MB7590:EE_
X-MS-Office365-Filtering-Correlation-Id: 53771303-1079-450a-300f-08daf8843f75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2H3VDCPlMACWw00IfSh6qWqvEuE4JYRGUXVk5iCuDwUI+N0/Rxv95pNqfqG80rVCiq4NHP6RRc1ppyukMMZQyQFpTjPM4SIuP4ndnX4zLWgi6igJQa8gDvRO0jnkOCzSS2hxX2dsoSVwIFx9NB1p1HZWvFR2uracsg6PiTB3plZlBu1j35AWlELZkET4XXpcCzf2+H06ZPUxGGyxFEaebvYyI9MKllGfdxYiFGYU4NCQgJsAk5iey5rk1zUD6DvEc+u2iJ/avLCQMXL94JiwV8TDGY1C/HMw/rjubC6aqiNCu/7YZxdc+vv9w+DjGKxbM6y6Mti37evxsV7TJNP7JNOhRbf2H3PHjG62tLNmvPuiFgfEUNwTEBsmoeuPTimT7yU7/iVSeoUaimYUs62gFxgDNePWMc/pogSOiQD8nt4W7/HHfMpC9l/D4d/bqk35UceCuUnv4yr9ER26WB1/iuVq/CMxmgm0adlbnM9oiyc876G3qfGOWoZDlxp5fgSpFdwoWJjibRbb+F87vVnMpLkqS3E1p28h/cEuDFo/rhG9laeTt4syU8AVzE0jN+GK+7I6j3y4pMC+d3zE/qkH9vCpnXRtgh4uOU5eBeUyrAp40FlVakQYu/9/ZsRSuNLkPk0wpEyqUKE2f94q5oIV/LE3q1ip+J46MsgCvPYnlTsdSOSG1Z0jBpgoOg42whJXvcb/o/MVhyB28aRr8PqKXrcq2s/xjTZ3Bx1b/TBE3SQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1358.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(39850400004)(366004)(346002)(396003)(376002)(451199015)(83380400001)(38100700002)(38350700002)(30864003)(2906002)(5660300002)(8676002)(15650500001)(6916009)(8936002)(66946007)(66556008)(66476007)(41300700001)(26005)(6506007)(186003)(1076003)(2616005)(6512007)(316002)(6666004)(6486002)(52116002)(86362001)(478600001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?q14Lc8a5geKvjo1wqA5RXJZDnkynepLSQ51L4aKFHTcHXQPymm2H2iRcGbmM?=
 =?us-ascii?Q?1L4HoxfxN6KB5rFU+rpYmcCefBTudZvCKzh2nMc6O/iRqMQY0bdWe9qbJcy9?=
 =?us-ascii?Q?uQjwwcI7DDY/nTF17T8YGXglAQfQJ7R0+rDApm3EsenUMhBmA3jqJQvlbd58?=
 =?us-ascii?Q?AQ3qf6dIievaBbcsfk5DLqCErkTvqlThy+Ak3J7/cPiOkC2p6eam6TdVm3oU?=
 =?us-ascii?Q?r5LX9lvDQ/6HOGWDJngf8lj8Aix+RocIoevncZKG7aKFDHzhgi9QR8TaanbH?=
 =?us-ascii?Q?9tasFzHDIZvCjm7x3JxlwHhoLagc4ACAmL0iDXkFIvvpVXVRSJXxEZScqQqS?=
 =?us-ascii?Q?SzY/b6+RfCTTdyYDgr15q3wtJ1hOLDXiRrS2V2y5mH8wQ6K2cDx7KLKfWKuI?=
 =?us-ascii?Q?/y9GABH7MHBCZoeBCoFwe84ksMP8W3GNtDZVlTRqy/yxKVDibBuqSgI3+tjs?=
 =?us-ascii?Q?aqMZXjTN32/Lzpz+xCgndtctvNlhqzoL0Lm3B5Vtd0wmHwELYVSFOEySg15m?=
 =?us-ascii?Q?7laAmOv1IR3Fo8osL2K+Jx9a2mjoL2bn5x6seZMQIP00kyFR36ElaeGAeVYq?=
 =?us-ascii?Q?NeQb66/ki6dPp396v3IeWo+2zqjHEVfQidSvNZEfxjUesDIEl6cvExuoXVay?=
 =?us-ascii?Q?ZwFdrgG4BS37xy1qEhEvcPQfZpS4T/1O20ipVAhDC6aQS/EFfc2lrocpGOa4?=
 =?us-ascii?Q?WPkGt4dP4+avv6xPUj7+E/I7JmtJI8roo0yDkbOqnyMk59n3IAP4Mei90vXM?=
 =?us-ascii?Q?ywNkTRG9/rTTGGj3Vre3IGoz6HVpD34IC0mOlggJU5AfryiLDDWOHR9sZUKi?=
 =?us-ascii?Q?Cu8/X8R5aa0HwMtc1/x0ZYq4oeIVLkLBbSEYnjWsO7dX3NUWVf1xtXKJtob9?=
 =?us-ascii?Q?3g3u7Db/FM5Ax/SS2MW9WynI3ZZmE9zk90w644lhYvaj5MRgc7df/iHDtQQp?=
 =?us-ascii?Q?KsNCR26tAZWfadCHdQ3WM8G8n6J9AWPk+ZgOSajXxvzR4wzXolwntQFNkNvK?=
 =?us-ascii?Q?jdu3jniQ1ARQlIe23fbOnoXQlgkZbkd/vO7iU62Es091gNh6eeU2i4ClOTu/?=
 =?us-ascii?Q?IEWpKAzsFMlbIPJG2pm1xMqz92Fw0AmArzs3cOSPh+jJiFATC19wPMMS5esF?=
 =?us-ascii?Q?sMC1l8qHsGS+eJ//vaG5UvyjBtc0ltqPwnhFDirWP0BwJTGjdsR+xxAItzrX?=
 =?us-ascii?Q?duu0tLEVPXyd2dHNTaepiyqZelN4OzqvbTgHx6aAu4fViwZjwawzQfPejR2H?=
 =?us-ascii?Q?fovBPVhW92q6cgchpV3f4R4Nm39b/7iQw1XsVmtEvm81Aqw5g1qbu7jw+Rh2?=
 =?us-ascii?Q?tQ6RkHipCccIXp98osvDWXIdtd7jPcw6+QMZig0JRD/kkpvja5eaT1u5Q4dK?=
 =?us-ascii?Q?Upcgio+pIwM3YGcIQ/OLOttZy9HZ79/ynaqd7En8QOW54msRkJx6bgvMszsm?=
 =?us-ascii?Q?3TgnKLF14QXVoz87HAIsiHEC5KR4iAzHHxCwN4aR6S1Qq66u2BtvqUqBExvf?=
 =?us-ascii?Q?PtFJkyzHq5wIaDqDq9o6wdBzlHB+WpjGgk99QY4lG3RPN9QkVacVJp+fmhTb?=
 =?us-ascii?Q?lbJeb0Wc6ma0V0UD1gnOwl6AmhzkpzdOjQvRWWWs?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53771303-1079-450a-300f-08daf8843f75
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 12:13:31.3487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I/50FW6+XtWXwkV90DkHgJY68+TOu6TPpsaQtElI1G8YrJHlkrddK9ltzUWKwWLjrlpmzer4XeW9iaCS08haLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7590
X-Proofpoint-GUID: pYPZPEFm7grPT7VDZXvspdJqotux8n2G
X-Proofpoint-ORIG-GUID: pYPZPEFm7grPT7VDZXvspdJqotux8n2G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-17_05,2023-01-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 adultscore=0 malwarescore=0 impostorscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301170101
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 12:13:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176033

Drop backported 0001-fix-mm-slab_common-drop-kmem_alloc-avoid-dereferenci.patch
0009-Rename-genhd-wrapper-to-blkdev.patch is present only on the master branch
and not on 2.13 branch, so keep it in the recipe.

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 ...on-drop-kmem_alloc-avoid-dereferenci.patch | 278 ------------------
 ...ules_2.13.7.bb => lttng-modules_2.13.8.bb} |   3 +-
 2 files changed, 1 insertion(+), 280 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-slab_common-drop-kmem_alloc-avoid-dereferenci.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.13.7.bb => lttng-modules_2.13.8.bb} (89%)

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-slab_common-drop-kmem_alloc-avoid-dereferenci.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-slab_common-drop-kmem_alloc-avoid-dereferenci.patch
deleted file mode 100644
index 99402ea5e9..0000000000
--- a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-mm-slab_common-drop-kmem_alloc-avoid-dereferenci.patch
+++ /dev/null
@@ -1,278 +0,0 @@
-From b977f96d0a414e76d4c544f65791919dde1bc57e Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Mon, 17 Oct 2022 13:49:51 -0400
-Subject: [PATCH] fix: mm/slab_common: drop kmem_alloc & avoid dereferencing
- fields when not using (v6.1)
-
-See uptream commit:
-
-  commit 2c1d697fb8ba6d2d44f914d4268ae1ccdf025f1b
-  Author: Hyeonggon Yoo <42.hyeyoo@gmail.com>
-  Date:   Wed Aug 17 19:18:24 2022 +0900
-
-    mm/slab_common: drop kmem_alloc & avoid dereferencing fields when not using
-
-    Drop kmem_alloc event class, and define kmalloc and kmem_cache_alloc
-    using TRACE_EVENT() macro.
-
-    And then this patch does:
-       - Do not pass pointer to struct kmem_cache to trace_kmalloc.
-         gfp flag is enough to know if it's accounted or not.
-       - Avoid dereferencing s->object_size and s->size when not using kmem_cache_alloc event.
-       - Avoid dereferencing s->name in when not using kmem_cache_free event.
-       - Adjust s->size to SLOB_UNITS(s->size) * SLOB_UNIT in SLOB
-
-Upstream-Status: Backport [commit b977f96d0a414e76d4c544f]
-
-Change-Id: Icd7925731ed4a737699c3746cb7bb7760a4e8009
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
----
- include/instrumentation/events/kmem.h | 156 ++++++++++++++++++--------
- 1 file changed, 111 insertions(+), 45 deletions(-)
-
-diff --git a/include/instrumentation/events/kmem.h b/include/instrumentation/events/kmem.h
-index 219533a1..0f5bd8e6 100644
---- a/include/instrumentation/events/kmem.h
-+++ b/include/instrumentation/events/kmem.h
-@@ -10,9 +10,58 @@
- #include <lttng/kernel-version.h>
- 
- #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,0,0))
--
- #include <../../mm/slab.h>
-+#endif
-+
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,1,0))
-+LTTNG_TRACEPOINT_EVENT_MAP(kmalloc,
-+
-+	kmem_kmalloc,
-+
-+	TP_PROTO(unsigned long call_site,
-+		 const void *ptr,
-+		 size_t bytes_req,
-+		 size_t bytes_alloc,
-+		 gfp_t gfp_flags,
-+		 int node),
-+
-+	TP_ARGS(call_site, ptr, bytes_req, bytes_alloc, gfp_flags, node),
-+
-+	TP_FIELDS(
-+		ctf_integer_hex(unsigned long, call_site, call_site)
-+		ctf_integer_hex(const void *, ptr, ptr)
-+		ctf_integer(size_t, bytes_req, bytes_req)
-+		ctf_integer(size_t, bytes_alloc, bytes_alloc)
-+		ctf_integer(gfp_t, gfp_flags, gfp_flags)
-+		ctf_integer(int, node, node)
-+		ctf_integer(bool, accounted, (IS_ENABLED(CONFIG_MEMCG_KMEM) &&
-+			(gfp_flags & __GFP_ACCOUNT) ? true : false))
-+	)
-+)
-+
-+LTTNG_TRACEPOINT_EVENT(kmem_cache_alloc,
-+
-+	TP_PROTO(unsigned long call_site,
-+		 const void *ptr,
-+		 struct kmem_cache *s,
-+		 gfp_t gfp_flags,
-+		 int node),
-+
-+	TP_ARGS(call_site, ptr, s, gfp_flags, node),
- 
-+	TP_FIELDS(
-+		ctf_integer_hex(unsigned long, call_site, call_site)
-+		ctf_integer_hex(const void *, ptr, ptr)
-+		ctf_integer(size_t, bytes_req, s->object_size)
-+		ctf_integer(size_t, bytes_alloc, s->size)
-+		ctf_integer(gfp_t, gfp_flags, gfp_flags)
-+		ctf_integer(int, node, node)
-+		ctf_integer(bool, accounted, IS_ENABLED(CONFIG_MEMCG_KMEM) ?
-+			((gfp_flags & __GFP_ACCOUNT) ||
-+			(s->flags & SLAB_ACCOUNT)) : false)
-+	)
-+)
-+#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,0,0))
- LTTNG_TRACEPOINT_EVENT_CLASS(kmem_alloc,
- 
- 	TP_PROTO(unsigned long call_site,
-@@ -53,18 +102,16 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(kmem_alloc, kmem_cache_alloc,
- 
- 	TP_ARGS(call_site, ptr, s, bytes_req, bytes_alloc, gfp_flags)
- )
--
--LTTNG_TRACEPOINT_EVENT_CLASS(kmem_alloc_node,
-+#else
-+LTTNG_TRACEPOINT_EVENT_CLASS(kmem_alloc,
- 
- 	TP_PROTO(unsigned long call_site,
- 		 const void *ptr,
--		 struct kmem_cache *s,
- 		 size_t bytes_req,
- 		 size_t bytes_alloc,
--		 gfp_t gfp_flags,
--		 int node),
-+		 gfp_t gfp_flags),
- 
--	TP_ARGS(call_site, ptr, s, bytes_req, bytes_alloc, gfp_flags, node),
-+	TP_ARGS(call_site, ptr, bytes_req, bytes_alloc, gfp_flags),
- 
- 	TP_FIELDS(
- 		ctf_integer_hex(unsigned long, call_site, call_site)
-@@ -72,42 +119,40 @@ LTTNG_TRACEPOINT_EVENT_CLASS(kmem_alloc_node,
- 		ctf_integer(size_t, bytes_req, bytes_req)
- 		ctf_integer(size_t, bytes_alloc, bytes_alloc)
- 		ctf_integer(gfp_t, gfp_flags, gfp_flags)
--		ctf_integer(int, node, node)
--		ctf_integer(bool, accounted, IS_ENABLED(CONFIG_MEMCG_KMEM) ?
--			((gfp_flags & __GFP_ACCOUNT) ||
--			(s && s->flags & SLAB_ACCOUNT)) : false)
- 	)
- )
- 
--LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(kmem_alloc_node, kmalloc_node,
-+LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(kmem_alloc, kmalloc,
- 
--	kmem_kmalloc_node,
-+	kmem_kmalloc,
- 
- 	TP_PROTO(unsigned long call_site, const void *ptr,
--		 struct kmem_cache *s, size_t bytes_req, size_t bytes_alloc,
--		 gfp_t gfp_flags, int node),
-+		 size_t bytes_req, size_t bytes_alloc, gfp_t gfp_flags),
- 
--	TP_ARGS(call_site, ptr, s, bytes_req, bytes_alloc, gfp_flags, node)
-+	TP_ARGS(call_site, ptr, bytes_req, bytes_alloc, gfp_flags)
- )
- 
--LTTNG_TRACEPOINT_EVENT_INSTANCE(kmem_alloc_node, kmem_cache_alloc_node,
-+LTTNG_TRACEPOINT_EVENT_INSTANCE(kmem_alloc, kmem_cache_alloc,
- 
- 	TP_PROTO(unsigned long call_site, const void *ptr,
--		 struct kmem_cache *s, size_t bytes_req, size_t bytes_alloc,
--		 gfp_t gfp_flags, int node),
-+		 size_t bytes_req, size_t bytes_alloc, gfp_t gfp_flags),
- 
--	TP_ARGS(call_site, ptr, s, bytes_req, bytes_alloc, gfp_flags, node)
-+	TP_ARGS(call_site, ptr, bytes_req, bytes_alloc, gfp_flags)
- )
--#else
--LTTNG_TRACEPOINT_EVENT_CLASS(kmem_alloc,
-+#endif
-+
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,0,0))
-+LTTNG_TRACEPOINT_EVENT_CLASS(kmem_alloc_node,
- 
- 	TP_PROTO(unsigned long call_site,
- 		 const void *ptr,
-+		 struct kmem_cache *s,
- 		 size_t bytes_req,
- 		 size_t bytes_alloc,
--		 gfp_t gfp_flags),
-+		 gfp_t gfp_flags,
-+		 int node),
- 
--	TP_ARGS(call_site, ptr, bytes_req, bytes_alloc, gfp_flags),
-+	TP_ARGS(call_site, ptr, s, bytes_req, bytes_alloc, gfp_flags, node),
- 
- 	TP_FIELDS(
- 		ctf_integer_hex(unsigned long, call_site, call_site)
-@@ -115,27 +160,33 @@ LTTNG_TRACEPOINT_EVENT_CLASS(kmem_alloc,
- 		ctf_integer(size_t, bytes_req, bytes_req)
- 		ctf_integer(size_t, bytes_alloc, bytes_alloc)
- 		ctf_integer(gfp_t, gfp_flags, gfp_flags)
-+		ctf_integer(int, node, node)
-+		ctf_integer(bool, accounted, IS_ENABLED(CONFIG_MEMCG_KMEM) ?
-+			((gfp_flags & __GFP_ACCOUNT) ||
-+			(s && s->flags & SLAB_ACCOUNT)) : false)
- 	)
- )
- 
--LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(kmem_alloc, kmalloc,
-+LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(kmem_alloc_node, kmalloc_node,
- 
--	kmem_kmalloc,
-+	kmem_kmalloc_node,
- 
- 	TP_PROTO(unsigned long call_site, const void *ptr,
--		 size_t bytes_req, size_t bytes_alloc, gfp_t gfp_flags),
-+		 struct kmem_cache *s, size_t bytes_req, size_t bytes_alloc,
-+		 gfp_t gfp_flags, int node),
- 
--	TP_ARGS(call_site, ptr, bytes_req, bytes_alloc, gfp_flags)
-+	TP_ARGS(call_site, ptr, s, bytes_req, bytes_alloc, gfp_flags, node)
- )
- 
--LTTNG_TRACEPOINT_EVENT_INSTANCE(kmem_alloc, kmem_cache_alloc,
-+LTTNG_TRACEPOINT_EVENT_INSTANCE(kmem_alloc_node, kmem_cache_alloc_node,
- 
- 	TP_PROTO(unsigned long call_site, const void *ptr,
--		 size_t bytes_req, size_t bytes_alloc, gfp_t gfp_flags),
-+		 struct kmem_cache *s, size_t bytes_req, size_t bytes_alloc,
-+		 gfp_t gfp_flags, int node),
- 
--	TP_ARGS(call_site, ptr, bytes_req, bytes_alloc, gfp_flags)
-+	TP_ARGS(call_site, ptr, s, bytes_req, bytes_alloc, gfp_flags, node)
- )
--
-+#else
- LTTNG_TRACEPOINT_EVENT_CLASS(kmem_alloc_node,
- 
- 	TP_PROTO(unsigned long call_site,
-@@ -192,19 +243,6 @@ LTTNG_TRACEPOINT_EVENT_MAP(kfree,
- 		ctf_integer_hex(const void *, ptr, ptr)
- 	)
- )
--
--LTTNG_TRACEPOINT_EVENT(kmem_cache_free,
--
--	TP_PROTO(unsigned long call_site, const void *ptr, const char *name),
--
--	TP_ARGS(call_site, ptr, name),
--
--	TP_FIELDS(
--		ctf_integer_hex(unsigned long, call_site, call_site)
--		ctf_integer_hex(const void *, ptr, ptr)
--		ctf_string(name, name)
--	)
--)
- #else
- LTTNG_TRACEPOINT_EVENT_CLASS(kmem_free,
- 
-@@ -235,6 +273,34 @@ LTTNG_TRACEPOINT_EVENT_INSTANCE(kmem_free, kmem_cache_free,
- )
- #endif
- 
-+#if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(6,1,0))
-+LTTNG_TRACEPOINT_EVENT(kmem_cache_free,
-+
-+	TP_PROTO(unsigned long call_site, const void *ptr, const struct kmem_cache *s),
-+
-+	TP_ARGS(call_site, ptr, s),
-+
-+	TP_FIELDS(
-+		ctf_integer_hex(unsigned long, call_site, call_site)
-+		ctf_integer_hex(const void *, ptr, ptr)
-+		ctf_string(name, s->name)
-+	)
-+)
-+#elif (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(5,12,0))
-+LTTNG_TRACEPOINT_EVENT(kmem_cache_free,
-+
-+	TP_PROTO(unsigned long call_site, const void *ptr, const char *name),
-+
-+	TP_ARGS(call_site, ptr, name),
-+
-+	TP_FIELDS(
-+		ctf_integer_hex(unsigned long, call_site, call_site)
-+		ctf_integer_hex(const void *, ptr, ptr)
-+		ctf_string(name, name)
-+	)
-+)
-+#endif
-+
- #if (LTTNG_LINUX_VERSION_CODE >= LTTNG_KERNEL_VERSION(3,3,0))
- LTTNG_TRACEPOINT_EVENT_MAP(mm_page_free, kmem_mm_page_free,
- #else
--- 
-2.19.1
-
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.7.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.8.bb
similarity index 89%
rename from meta/recipes-kernel/lttng/lttng-modules_2.13.7.bb
rename to meta/recipes-kernel/lttng/lttng-modules_2.13.8.bb
index d444f9ab0c..542f42ae19 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.7.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.8.bb
@@ -11,13 +11,12 @@ include lttng-platforms.inc
 
 SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0009-Rename-genhd-wrapper-to-blkdev.patch \
-           file://0001-fix-mm-slab_common-drop-kmem_alloc-avoid-dereferenci.patch \ 
            "
 
 # Use :append here so that the patch is applied also when using devupstream
 SRC_URI:append = " file://0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch"
 
-SRC_URI[sha256sum] = "5a99679df7903160cbde3918fee5af90ffafc90fc96ccdefaa57cf230492b234"
+SRC_URI[sha256sum] = "f525d3d48ea3a475cb535339c201666d0e4c75ec8c46d29837bcf381ea02cb19"
 
 export INSTALL_MOD_DIR="kernel/lttng-modules"
 
-- 
2.25.1


