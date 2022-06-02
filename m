Return-Path: <zhe.he@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 034A5C43334
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 07:40:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.4015.1654155608705388490
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 00:40:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=YmxuWEI5;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=315255a86d=zhe.he@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 252705WG031338
	for <openembedded-core@lists.openembedded.org>;
 Thu, 2 Jun 2022 00:40:06 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=Pu663kdpQdpzyHeJbrK9VlUXM7JGRScDeoLbG2BywBg=;
 b=YmxuWEI5nF8u61yww6pDOn3aY7qOfOEa30aEX9fbXF38TVzIRaWm5egR+m/K7GXVT0UN
 IFpVDW9+7gpykThnKZB4Dovta/qnVGsZQRzpnLdcIF6Cpqca7y1TSnN3GqaQZEh0oCQ3
 8im1uKlARNGjWzr2OSp2rxX871YcYM8OA8xyMMdLM4aj4+6zjKf7yiOS0DP5NCd7ADZC
 6mtos5KfmBGgAEJ4x7gF90SAvDc+HxqbjgH8dm4PSSIF7M+wb4rItekMcz5VWVOVqCbr
 NIdYZdV5LcODj/sj+u0euq8nW5B9vL7W/pqpDBoWiTubT/EmJHyPNlw4ffOzliByzNl0 wA==
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam02lp2044.outbound.protection.outlook.com [104.47.56.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3gbk8jbf24-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jun 2022 00:40:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gbrs25BuTf3kHaV0ldVdP/tMBA/srtBqBHgiObjIE8/R/HPiw9vmHVd4e5QwVXC/J1xhuBbS3foaFYpdQnhabYZYGgMPBI8ddyGd1tdbBM3j5zl0i4z0rQJnAo8/x+Ep6ZpVax3r4zfFN+HimHU8xcbrvT6PXefrve0lMHY8oh7lrS8mpMZbtWOGPGr6WMU5jX8fbjAn0u6yYyU/grLggalnc0Kom8ZUGqmIwLbSVbIgx9dV5eTxV7L+Amwo3jtIxJ79XWSd0jjXy80FokCi7WBBMuxu34ydD9kZirTwqfafjuqHlogFw+3MHZwhrP6W3UIX2MkYXGsX3vXVpuTMbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pu663kdpQdpzyHeJbrK9VlUXM7JGRScDeoLbG2BywBg=;
 b=gPZt9sWSf1gPqxP3DAVaN8Mmz6tt3YbEEtxWb6/wJiaW2dPhjBathcQKVjqbMffUuUk30RRflDpt2Zhqrfc3s7s/mKTPPcOL4go0Q/fZxWb1+j0CHu+CgZPnlXNTAqhnl2kzPVW/N6zGrjzxZ+cr/Oa+WVbunc2djIhNBnq4bCQfJPT++tuTbUKaNoVyPKmtRSfzm3D3dzNBc93quJZevygmxA6DM6tbvplv8mNP15Xienpr8z4oYY+DzmHQu5PckKXwqFyC1QPYeVuqRTCEg1TIYm9mtz/l5EU3BeZijyEk4l/r7/5g32PCQ/hWGDzBED/jY14BbEbpZskWQh/4JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MWHPR11MB1358.namprd11.prod.outlook.com (2603:10b6:300:23::8)
 by SA0PR11MB4605.namprd11.prod.outlook.com (2603:10b6:806:95::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Thu, 2 Jun
 2022 07:40:03 +0000
Received: from MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::1cd4:125:344:9fc]) by MWHPR11MB1358.namprd11.prod.outlook.com
 ([fe80::1cd4:125:344:9fc%7]) with mapi id 15.20.5293.019; Thu, 2 Jun 2022
 07:40:03 +0000
From: He Zhe <zhe.he@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] lttng-modules: Fix build failure for 5.10.119+ and
 5.15.44+ kernel
Date: Thu,  2 Jun 2022 15:39:42 +0800
Message-Id: <20220602073942.1570-1-zhe.he@windriver.com>
X-Mailer: git-send-email 2.32.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2PR01CA0015.apcprd01.prod.exchangelabs.com
 (2603:1096:100:41::27) To MWHPR11MB1358.namprd11.prod.outlook.com
 (2603:10b6:300:23::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b6de0a3-b3e1-4eb3-f955-08da446b1abc
X-MS-TrafficTypeDiagnostic: SA0PR11MB4605:EE_
X-Microsoft-Antispam-PRVS: 
	<SA0PR11MB4605252B7D9E32A7127CC1BD8FDE9@SA0PR11MB4605.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uKfavHf5212uCbGtpNSlIAzt32Ae8KIijNoizI1ccsE38+1mGI4T3ydzTWlwKszSEBa7L2r+RB8nNMvBI8Py9GSUE3yvAwV4Jj9I2zGahrJJ+4VGcfnGCklw4HkWwgy9ZjDm0p83YR5CBLGAXdoX4D23kQokJmdaddOaa4q8o6KOqNYCxw8L7+KF0ql+UhO+hPvkWf3EcLR5zvaLo6gaC2bgo0r+pE8DLhl6YqCw9F9jmjq3C7nbcrIm6YtDpBNKz1wrGSJl+HrDqvPbco064nPF8T89pycp9u3gHfpzD0u+vGIxvZUWrq9Gto0osD9wZEJVTjQYbsBVJOv+lEFVhXmz8CiqediPObAkCLcxeVdeT17p8fHkn1w7YoHTbsdiU7X8bvVUNzU3E9y270ed1azl0h/Ae7WE4U4QIcyiFG5LsdPdPlQ1mAzZJAfnmQVdz4PQ2913tkoEayX2cUrT5Ww0c2fJOHV/6UaheYb9PfFVSlm+FuT6M9clhr38uvd236hKUZfU3V8Nsp9qSnD4DSqvtYrAR/mPXU5+r1QsTixy2rAQFEMEMD1VzofKTfJxYFWcJhlNK7ysKEdpuHL5XRQAlQY8WTxDvt0qlEnjYxmsR93XpNtEL7eD9RYyDSPlWT3lVLKb1MagSODBOGk1X+b3rk3iDDoq428zMREh5nfEnBv+cbO/BzVKNLTKB6xoPQb3TGV5GTkSwCIash3VxzNe4QatPtrdJybaZQ2ynr8AWzMQ4nI3ZB+RSL8SvAis4nHbsUlAVm0LcBGBdhjYUESC2ewnobWb/TEHppwHcaM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR11MB1358.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(6486002)(8936002)(5660300002)(508600001)(316002)(6916009)(66476007)(66556008)(66946007)(8676002)(6512007)(2616005)(186003)(1076003)(6506007)(83380400001)(26005)(86362001)(38350700002)(2906002)(6666004)(38100700002)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dz91HDDfPN2awMnh2a90m8mD+guTrmEaZ+UHqbM0SdXDuXCU08Vs/w5WuX69?=
 =?us-ascii?Q?1vJpGA7RM1llgclvo1YZ2SDGcUA+v6J3VU2p0kPQftFJgi0aR/iXAfJ6Y83U?=
 =?us-ascii?Q?mYenz0ev+el2UuOXAsYczqZn2O0cRuG6tkTl72fFQNntOoFo406VGRoFnAme?=
 =?us-ascii?Q?I53PjxzTcRaXF4mN6eLGIKY7oFIEG4BtgjFHAT7HrEsO6YXzLSfgdTZCJ2fK?=
 =?us-ascii?Q?+T7SxU/CELi8WL5pKYT9gWa7PQtMWB5x7ON0+wF6u1NIdGRjyeuHEDHLyBw2?=
 =?us-ascii?Q?Q3Y+zt9unBmIizdpIcso8tLEd3w3ZPbLiyiiTFCRhMIJg8MN0MSZmbSMFmNY?=
 =?us-ascii?Q?CR0yjHL5xdN5b7fxzHsFQ+bqtUlrZZq0+8PImsXqRFjhAsjlx+GW17BPseoa?=
 =?us-ascii?Q?NZj3qE6V+Y+TY80GJxMATIR47TvMf/PtCPNEFpnBS8/3s8RuF7uszOKMIxQw?=
 =?us-ascii?Q?idnhRBfexbxEe1v0lghQePgEzEQriikCJ1KInqMs8M+/DggCx9B6YTPcFpLe?=
 =?us-ascii?Q?wAQaarcjt4Axmj2N2DgbJNg79WC0Nn9UY0Xyh6LVHZZsxUhcsMZ6weF4kvM9?=
 =?us-ascii?Q?qBSbSsHP+yxxb7duogdhDbxvwEVSJyoYxwgHH6fSe5rgGEOAHQcOoWp8gZ5p?=
 =?us-ascii?Q?0wsXJFYCfmriKwD+TJs9y3iQB2fh+W1VjnCmuJPa1UqjW5roPzzlb0CVNZ8K?=
 =?us-ascii?Q?5ZXGbTZ9t1SQOgUYE4uqBK4OnphYDH8vX3kmdNpFMn0AinDABTlAVy/z9CJN?=
 =?us-ascii?Q?nW32DglRIgfRZ9yWMJtKyTgrWMko+PMz+FVw4KpIvuA1aY/oGlxAEmutFbon?=
 =?us-ascii?Q?iDsb/5pBv7odgefxNSwr83CacXeF0u+cT8OWcQFFcAZEd07FJ/WnV5oYaJ8L?=
 =?us-ascii?Q?N0aBVaOc9SGjoyuE4OuV9WfMf55rvYClAXN5LgLw8eqW2czLGP9hHz18XJqe?=
 =?us-ascii?Q?uh8JJUGI9Fdt146L+KU7pTVg+US3JLSAw2OgNxq0jYqofdnq8CVXxCywhGt7?=
 =?us-ascii?Q?EeQ1ooDuLvbwSrK5as5/SYLzJa9suO01wkLRYHtPBmLQJbWLC7Nhm+SbpxRX?=
 =?us-ascii?Q?LLnyy7iT06jHbvUSJNkaZ4Yq+a7+1fo9SZ0lU3jvouJsNCCQEwBK8c2yjoEe?=
 =?us-ascii?Q?PxEF9cc4PjkF6manyXXhTmg85/we5Q3f+tXYZmKPbfqes6C9PRPI6s65rhPr?=
 =?us-ascii?Q?6qDB4XxxjuiIx7nQ0+G//GlAVGaBRYcSd9n8KQZZcLt8lMFnSqSCbvZQBEbG?=
 =?us-ascii?Q?CNPeYgea7GEwg3ZKjgfP9B4GDonj3YA9tzGymWNd1JjuLgJd6jwkw1XvMb7D?=
 =?us-ascii?Q?K7lvHXEqUPTnERxr3E8u3ydLYXVv2YT1Kv0+ucoLTP094qy1zYitBvyra/wt?=
 =?us-ascii?Q?dy360ouYSkvY0Gebqu8qtGq3ET29QzvWnU9+AkwPZHcsJ4kWsIKYCjPv9WUm?=
 =?us-ascii?Q?BqfARE2KvILmm/YeAlcaM7/Yeqr3jD2/DVEH6BaAc4UUYmvjeSGaGxptFsDH?=
 =?us-ascii?Q?ZBIg8tfvdd5Hemi6uLphRKoH11y+fY7Wv1ApDTkCxikpy8qQCNoRpSn6aFTa?=
 =?us-ascii?Q?PvAgAhpXvevTR99xyRZRaX1NmyTGvunLF8VRAnLVBjIE4XRtM1ZzCNidS9ZV?=
 =?us-ascii?Q?bGh15mYeYgSgGwLYCi/k2WfazAlpN2y+L5wyE870N/zBafxu/kyipvPTQdpw?=
 =?us-ascii?Q?YSgy3Q6fcCVImWvFF+Rz36b913abVJP2DNegPXdQxCDzUi0FD9HHO3AGV+7R?=
 =?us-ascii?Q?TZJ6ESTJfg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6b6de0a3-b3e1-4eb3-f955-08da446b1abc
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1358.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2022 07:40:02.9315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 e/6c18HiFSZDuGMm2cySCgNbs5l3e6Xmi9aXhXGDpv/p9uqu4wDlacEeVMXaVFdH4T/OqOZouoRdqj2qK5qEHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4605
X-Proofpoint-ORIG-GUID: oX1Xf_zwddl9WJC06yFk-rRCKIgmQ8OG
X-Proofpoint-GUID: oX1Xf_zwddl9WJC06yFk-rRCKIgmQ8OG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-02_01,2022-06-01_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=498 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206020029
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jun 2022 07:40:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166462

The following kernel commit has been back ported to v5.10.119 and v5.15.44.

commit 14c174633f349cb41ea90c2c0aaddac157012f74
Author: Jason A. Donenfeld <Jason@zx2c4.com>
Date:   Thu Feb 10 16:40:44 2022 +0100

  random: remove unused tracepoints

  These explicit tracepoints aren't really used and show sign of aging.
  It's work to keep these up to date, and before I attempted to keep them
  up to date, they weren't up to date, which indicates that they're not
  really used. These days there are better ways of introspecting anyway.

Which causes the following build failure
lttng-modules-2.13.3/src/probes/lttng-probe-random.c:18:10: fatal error: trace/events/random.h: No such file or directory
|    18 | #include <trace/events/random.h>
|       |          ^~~~~~~~~~~~~~~~~~~~~~~
| compilation terminated.

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 ...emove-unused-tracepoints-v5.10-v5.15.patch | 44 +++++++++++++++++++
 .../lttng/lttng-modules_2.13.3.bb             |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-random-remove-unused-tracepoints-v5.10-v5.15.patch

diff --git a/meta/recipes-kernel/lttng/lttng-modules/0001-fix-random-remove-unused-tracepoints-v5.10-v5.15.patch b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-random-remove-unused-tracepoints-v5.10-v5.15.patch
new file mode 100644
index 0000000000..361a59c2e5
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-modules/0001-fix-random-remove-unused-tracepoints-v5.10-v5.15.patch
@@ -0,0 +1,44 @@
+From 13e4c978d45237b8780f1de6d404812b3af26a49 Mon Sep 17 00:00:00 2001
+From: He Zhe <zhe.he@windriver.com>
+Date: Thu, 2 Jun 2022 06:36:08 +0000
+Subject: [PATCH] fix: random: remove unused tracepoints (v5.10, v5.15)
+
+The following kernel commit has been back ported to v5.10.119 and v5.15.44.
+
+commit 14c174633f349cb41ea90c2c0aaddac157012f74
+Author: Jason A. Donenfeld <Jason@zx2c4.com>
+Date:   Thu Feb 10 16:40:44 2022 +0100
+
+  random: remove unused tracepoints
+
+  These explicit tracepoints aren't really used and show sign of aging.
+  It's work to keep these up to date, and before I attempted to keep them
+  up to date, they weren't up to date, which indicates that they're not
+  really used. These days there are better ways of introspecting anyway.
+
+Upstream-Status: Pending
+
+Signed-off-by: He Zhe <zhe.he@windriver.com>
+---
+ src/probes/Kbuild | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/src/probes/Kbuild b/src/probes/Kbuild
+index 5478447..31e0ee8 100644
+--- a/src/probes/Kbuild
++++ b/src/probes/Kbuild
+@@ -204,7 +204,10 @@ endif
+ 
+ # Introduced in v3.6, remove in v5.18
+ obj-$(CONFIG_LTTNG) +=  $(shell \
+-    if [ \( ! \( $(VERSION) -ge 6 -o \( $(VERSION) -eq 5 -a $(PATCHLEVEL) -ge 18 \) \) \) \
++    if [ \( ! \( $(VERSION) -ge 6 \
++      -o \( $(VERSION) -eq 5 -a $(PATCHLEVEL) -ge 18 \) \
++      -o \( $(VERSION) -eq 5 -a $(PATCHLEVEL) -eq 15 -a $(SUBLEVEL) -ge 44 \) \
++      -o \( $(VERSION) -eq 5 -a $(PATCHLEVEL) -eq 10 -a $(SUBLEVEL) -ge 119\) \) \) \
+       -a \
+       $(VERSION) -ge 4 \
+       -o \( $(VERSION) -eq 3 -a $(PATCHLEVEL) -ge 6 \) \
+-- 
+2.32.0
+
diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb
index a5e6b906d2..e049bdc6d2 100644
--- a/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb
+++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.3.bb
@@ -21,6 +21,7 @@ SRC_URI = "https://lttng.org/files/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0009-Rename-genhd-wrapper-to-blkdev.patch \
            file://0010-fix-mm-compaction-cleanup-the-compaction-trace-event.patch \
            file://0001-fix-sched-tracing-Append-prev_state-to-tp-args-inste.patch \
+           file://0001-fix-random-remove-unused-tracepoints-v5.10-v5.15.patch \
           "
 
 # Use :append here so that the patch is applied also when using devupstream
-- 
2.32.0


