Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D6F1C47DDB
	for <webhook@archiver.kernel.org>; Wed, 31 Jan 2024 03:01:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6203.1706670102519504775
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jan 2024 19:01:42 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2760740ec4=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40V2wGYV029439
	for <openembedded-core@lists.openembedded.org>; Wed, 31 Jan 2024 03:01:41 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vyatvg44g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 31 Jan 2024 03:01:41 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QNb+/YGKI67CBOyI95KPeB2m8E1XkuU3Bsvg3g15Cqp+oFQKArvTc8n2kKKFuqaBLvo9wyTznyxFqloAbtfcd+FZWbc1/wDSsnSN3KrF3BAqbb7q2WE4zWoEwh+mVfRygP7VK+FesGPI5wTCuxfB9Qj/mDQhGu0BwjUvWBGrNqEFqEnZYLLdVnpcpkBVFcGKwxrJOypZBAHyy+Ze9YAlaYhsPWS2c9+P8LrdgnpN8jTEQRjIIsAx7wA7Yovx94rUvZ8y0GzLPwZ5GxtfqMLs/zuMORhvLgy+a3RlN7or//ieGXbmjth4XqXIEtASSRtM2sN+j3GXuV41eAKA0bm2kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L3XNC26xIzHvOVhfugwFkyr+xPvmwwSqI9rAUirZgxo=;
 b=dFzR53kQNu5R/PXfp7xfJG2ZJ1c1eewT8R2DBf394ypGj0MYlz+6isqSqQ67J28+wRCwD6p0N+EcfyZpTUVlqXBFntyyWUHx4cjqw0l8tMBng8pPgcxjM6BXTGMbQB9N4J0mm2nKAlxYQAognXZPwCstzxctkIJ/Huq5Xp1lnuFBlSSfssTfAsDjD+vG1/EWz/qqDHL55irJ6Y2YVEMJFG2qDgbbmgvGojzzpZ/yuJCXrIFT45Jibuni0WAjN7iprw1Fie7Y0WQqgqVfxRKeU9RRQrOBA+YjtKHy71BLQHjzWpY3zf6XGOyvxFsri29KOXVtj8UNljKaw8szYuVizQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by DM4PR11MB5517.namprd11.prod.outlook.com (2603:10b6:5:388::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.35; Wed, 31 Jan
 2024 03:01:36 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f816:c534:1377:b673]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::f816:c534:1377:b673%4]) with mapi id 15.20.7228.029; Wed, 31 Jan 2024
 03:01:36 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] lttng-tools: skip lttng kernel related test if lttng kernel modules not present
Date: Wed, 31 Jan 2024 11:40:36 +0800
Message-Id: <20240131034036.3161817-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0050.apcprd02.prod.outlook.com
 (2603:1096:4:196::11) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|DM4PR11MB5517:EE_
X-MS-Office365-Filtering-Correlation-Id: 89872974-c1fe-4746-e8f2-08dc2208f02c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ONE1AoKgSeuQr5IzaNC4mPjyO7SyxTlWS31nimALsxb8uR5crm+b+h/m31qdiN6ShcJDyPleFGl16GjtJq5OuYsaysPVj69qO9GIDyNNyYcxlou4oedGfx1i2eFs72B8NGGjWItcz9qAE145Q+2MFAYMQEO7BFFUWjFHOCrhmcxkvRq6af2WGdHD71Hey3y/hXSmApY+zFKD5kLm0Wq0iRKH68ipHr3724zhqyytghc7AARPT8oIYymAzJH0Xym5i+A1VjheHkVCT09avbusG0n770/7qi37d3Hj/VdPQAw6UYDLhOdG8Kdd8+XYsUg68FefwV+ZZRlD7OCjdvRrRHYKUu+LaJMVzN3t8zXkUmkUsQt6h1t0fXaUq9t0A19l+at6nkMDWu9LZTyqioUF5Uc+7ueD+7CvSOJOO4m3fmHTorNRSB5huoKM/D2z1UMWF1XsFu23FUUve9aAG699IYOUJ6Mu4BK9oNbs3pQSv42pIQ3mvmB7T3RimYccUUjbZljYzktl00eZkzyelHY/So5BJEIRC1uWtOmFx4DNZQePs/rd8xFhSLaUoehav5bSr8K4ABfA/vLTalS99lTUi9l4yHDkOCSjR4RjJorhTtE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(136003)(39850400004)(396003)(376002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(8676002)(83170400001)(8936002)(41300700001)(38100700002)(316002)(6512007)(6916009)(478600001)(66556008)(66476007)(6486002)(52116002)(5660300002)(2906002)(30864003)(83380400001)(1076003)(6506007)(44832011)(2616005)(26005)(66946007)(38350700005)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TvRoxPLce37G3omL9UiQOiH/e8WZskktDeWsQyBM5aQQh/kIc/fku/GFStEJ?=
 =?us-ascii?Q?2Mu51bE3qyrnKVp/8iaeQnAopqC4XjrhsFvT0BFXJJSYoNcRJ/NAyq3ypK+k?=
 =?us-ascii?Q?0AZEx8HEHa7rOgSKVke7Wfb8iIHrcs3IHVpWY/FXge5/XQd59MrmA+z0sTQM?=
 =?us-ascii?Q?iT8dS+1V3RSHExyuUhftl4yzdtkg5WYRqwK6XzUpJ+wmnuml/9hwpUQh5f1/?=
 =?us-ascii?Q?HL4G/K+wBci3dvX4GeZKNVQXmR3+8ZGhPDJM9uggXZVW1auBaUECpANzpaSQ?=
 =?us-ascii?Q?pS1Cf5zmGDZ5hBJqF1Bnyd3cdIfoyWAvIIS+7j1dT1klkgzSoIkP4NeEqZFc?=
 =?us-ascii?Q?2R42yG1pFmLOLjWPayiV039xakU1PjuVlwH4f4jtQhXvZIfK/jDMdKuCnu3n?=
 =?us-ascii?Q?TZBfdMmWYCyeDNtOVqNZlswb+9vf3QVs1zMmUeiJYglMDKGMISgPV2u4K0y9?=
 =?us-ascii?Q?cn54auwH9ExYogEnSaqgbcer0I7JXlt7BUC8CQ35ybqdX4a0xxKz+5G4aHfj?=
 =?us-ascii?Q?sehTYta5pw2L4xW634PpFrd7TUIYO9z069pLBWMhvQMZEGiuJdCEchhTdyrw?=
 =?us-ascii?Q?dXoBpgWG5jchCGNm6meqhn5DMXMSnqMp8sv+Mob5smLJooos1bkKxtnT2/3P?=
 =?us-ascii?Q?sP8WcljLSkytV9gzsMOVzrXEYecmv9yIU8DmKuYO9XuZSOkkhGKW3noHsRnL?=
 =?us-ascii?Q?xFq1+MJe9a1ujgCstbhjYUJ3NdABE2WFaqTNMeHryAwpVbYq2LJjbjYX3r1L?=
 =?us-ascii?Q?zmYMM442jHchL5x4zTuJa+s1dwh9Xs/MAFn3DO6xowo5PI35oKHqh5HTY+4g?=
 =?us-ascii?Q?ks6W52hIswC2uGAW0PqxX21ujgJdmb+B3Fthx+xdWuvDkyyqefCioWk2CmF9?=
 =?us-ascii?Q?Y86VUTyUoVq/BtrvdlKD+I0ZI/OtlCj+qcPkLF+3U2fVxEZRuXJd9pZGFZAp?=
 =?us-ascii?Q?yHmCLnuLVTBI2ncHpWexYkbUURVPaCC53np4GKgPwJgtqNF+tkFPo5RZInY5?=
 =?us-ascii?Q?R1fQ46dhGPIhluXuhH6fbWjMmfD4zPXgA8k61VyX+CJE8tRUdSgTmhk5hfqG?=
 =?us-ascii?Q?AIu6Lp5ZqOJJ0DvhT6zS74pVronhK3hj9w05BBjtcYCqGUQiu7JrpHoqmk05?=
 =?us-ascii?Q?rYkas5hSHwzJk6GSjuZ2ZiNlWwvPWvbaKE3cTziPpFAGdcUsp5LnCYJwWzzD?=
 =?us-ascii?Q?Mdv/YZVpYXtookX+j/t5n4XKc/PYuSwG8yA66/2VEtd1OdDwIVD/i66TB+AT?=
 =?us-ascii?Q?kcbqc9Qjx84DB4IonO9wI+ybskjw1OK899cKhbVOdQlqaVNcxEMUz1+cGO4T?=
 =?us-ascii?Q?3MjgBNJI1OU8W38zPDVyKxY4ySFGuULsok1wT/ZoiJbA/yy1EWP2Np869SsQ?=
 =?us-ascii?Q?UvftvhhUKBgn/2HjeWfyguGVduJ53P131QHBSMK8LmL/J6A4vg62bLGTNM9N?=
 =?us-ascii?Q?KyjG5tlDOiFKacdiZ1/bD3XBZcZ0uuhuS7McfwME9RgRkhgaKCVLfGDgbNFs?=
 =?us-ascii?Q?9TDIvs8bG8C0qV9aU5brIcBRcBAlxrC3U3OvS3t7IXwMua+Se7aIEQnbYTfH?=
 =?us-ascii?Q?LDTqt9BgSFrL1pioIYm2LggJYYWmz2rFCKp+M5oDqFyofTi9JpSgVo8zlhjD?=
 =?us-ascii?Q?cg=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89872974-c1fe-4746-e8f2-08dc2208f02c
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 03:01:36.8250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5KRJSVlh6fdFWZ0g/xs47EgOaruuEf2r9Y2PAe+TTnDwJAzBuGOLq+s6J26o+djRVE0WszVF1lysHPCX/dE84kO3yNtiUo4Nw3B6fhvwVVg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5517
X-Proofpoint-ORIG-GUID: LXSJIqIAgu3DunaMKuZQwkYLJCGxbiCs
X-Proofpoint-GUID: LXSJIqIAgu3DunaMKuZQwkYLJCGxbiCs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-30_14,2024-01-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 priorityscore=1501 spamscore=0 clxscore=1011 lowpriorityscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401310024
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Jan 2024 03:01:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194508

From: Xiangyu Chen <xiangyu.chen@windriver.com>

The current tests will run both userspace and kernel testing. Some of use cases only
use lttng for one kind of tracing (e.g. userspace). If the lttng modules(.ko files)
is not present during the test,it would end up with lots of failing.

Add a check in ptest script, if current system doesn't contain lttng kernel modules,
passing LTTNG_TOOLS_DISABLE_KERNEL_TESTS=1 to make to skip all lttng kernel related testing.

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 ...skip_kernel_test-to-check-root-user-.patch | 1307 +++++++++++++++++
 .../lttng/lttng-tools/run-ptest               |   25 +
 .../lttng/lttng-tools_2.13.11.bb              |    1 +
 3 files changed, 1333 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-tests-add-check_skip_kernel_test-to-check-root-user-.patch

diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-tests-add-check_skip_kernel_test-to-check-root-user-.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-tests-add-check_skip_kernel_test-to-check-root-user-.patch
new file mode 100644
index 0000000000..2887b88d76
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-tools/0001-tests-add-check_skip_kernel_test-to-check-root-user-.patch
@@ -0,0 +1,1307 @@
+From d52c971d3a5489dda8821b7dbb2b32ad99116e24 Mon Sep 17 00:00:00 2001
+From: Xiangyu Chen <xiangyu.chen@windriver.com>
+Date: Wed, 24 Jan 2024 13:32:45 +0800
+Subject: [PATCH] tests: add check_skip_kernel_test to check root user and
+ lttng kernel modules
+
+The current tests will run both userspace and kernel testing.
+Some of use cases only use lttng for one kind of tracing on
+an embedded device (e.g. userspace), so in this scenario,
+the kernel modules might not install to target rootfs, the
+test cases would be fail and exit.
+
+Add LTTNG_TOOLS_DISABLE_KERNEL_TESTS to skip the lttng kernel
+features test, this flag can be set via "make":
+
+make check LTTNG_TOOLS_DISABLE_KERNEL_TESTS=1
+
+When this flag was set, all kernel related testcases would be marked
+as SKIP in result.
+
+Since the the LTTNG_TOOLS_DISABLE_KERNEL_TESTS was checked in function
+check_skip_kernel_test, lots of testcases also need to check root
+permission, so merging the root permission checking into check_skip_kernel_test.
+
+Upstream-Status: Submitted [https://review.lttng.org/c/lttng-tools/+/11586]
+
+Change-Id: I337b86d8d54e90f12e41671ab07cedf700f09901
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ tests/destructive/metadata-regeneration       |  8 +---
+ tests/perf/test_perf_raw.in                   |  8 +---
+ tests/regression/kernel/test_all_events       |  8 +---
+ tests/regression/kernel/test_callstack        |  8 +---
+ tests/regression/kernel/test_channel          |  8 +---
+ tests/regression/kernel/test_clock_override   |  8 +---
+ tests/regression/kernel/test_event_basic      |  8 +---
+ tests/regression/kernel/test_kernel_function  |  8 +---
+ tests/regression/kernel/test_lttng_logger     |  7 +---
+ tests/regression/kernel/test_ns_contexts      |  8 +---
+ .../regression/kernel/test_ns_contexts_change |  9 +---
+ .../kernel/test_rotation_destroy_flush        |  8 +---
+ .../regression/kernel/test_select_poll_epoll  |  8 +---
+ tests/regression/kernel/test_syscall          |  8 +---
+ tests/regression/kernel/test_userspace_probe  |  8 +---
+ tests/regression/tools/clear/test_kernel      |  8 +---
+ .../tools/filtering/test_invalid_filter       |  8 +---
+ .../tools/filtering/test_unsupported_op       |  8 +---
+ .../tools/filtering/test_valid_filter         |  8 +---
+ tests/regression/tools/health/test_health.sh  | 10 +----
+ tests/regression/tools/health/test_thread_ok  |  9 +---
+ tests/regression/tools/live/test_kernel       | 10 ++---
+ tests/regression/tools/live/test_lttng_kernel |  8 +---
+ tests/regression/tools/metadata/test_kernel   |  8 +---
+ .../test_notification_kernel_buffer_usage     | 36 ++++++++--------
+ .../test_notification_kernel_capture          | 23 +++++------
+ .../test_notification_kernel_error            | 23 +++++------
+ .../test_notification_kernel_instrumentation  | 23 +++++------
+ .../test_notification_kernel_syscall          | 19 ++++-----
+ .../test_notification_kernel_userspace_probe  | 20 ++++-----
+ .../notification/test_notification_multi_app  | 41 +++++++++----------
+ ...test_notification_notifier_discarded_count | 10 ++---
+ .../tools/regen-metadata/test_kernel          |  8 +---
+ .../tools/regen-statedump/test_kernel         |  8 +---
+ tests/regression/tools/rotation/test_kernel   |  8 +---
+ tests/regression/tools/snapshots/test_kernel  |  8 +---
+ .../tools/snapshots/test_kernel_streaming     |  8 +---
+ .../tools/snapshots/test_ust_streaming        |  6 ---
+ .../streaming/test_high_throughput_limits     |  8 +---
+ tests/regression/tools/streaming/test_kernel  |  8 +---
+ .../tools/tracker/test_event_tracker          |  8 +---
+ .../tools/trigger/test_add_trigger_cli        | 12 ++----
+ .../tools/trigger/test_list_triggers_cli      | 21 ++++------
+ .../tools/wildcard/test_event_wildcard        |  8 +---
+ .../test_relayd_working_directory             |  4 +-
+ .../ust/namespaces/test_ns_contexts_change    |  7 +---
+ .../test_rotation_destroy_flush               | 17 ++++----
+ tests/regression/ust/test_event_perf          |  8 +---
+ tests/utils/utils.sh                          | 33 +++++++++++++++
+ 49 files changed, 187 insertions(+), 385 deletions(-)
+
+diff --git a/tests/destructive/metadata-regeneration b/tests/destructive/metadata-regeneration
+index b81e7af32..15b310801 100755
+--- a/tests/destructive/metadata-regeneration
++++ b/tests/destructive/metadata-regeneration
+@@ -185,19 +185,13 @@ function test_ust_streaming ()
+ 	rm -f ${file_sync_before_last}
+ }
+ 
+-if [ "$(id -u)" == "0" ]; then
+-	isroot=1
+-else
+-	isroot=0
+-fi
+-
+ if ! destructive_tests_enabled ; then
+ 	echo 'You need to set the LTTNG_ENABLE_DESTRUCTIVE_TESTS to "will-break-my-system" as argument to run this test'
+ 	echo 'Moreover, please make sure that ntp is not running while executing this test'
+ 	exit 0
+ fi
+ 
+-skip $isroot "Root access is needed. Skipping all tests." $NUM_TESTS ||
++check_skip_kernel_test $NUM_TESTS ||
+ {
+ 	start_lttng_relayd "-o $TRACE_PATH"
+ 	start_lttng_sessiond
+diff --git a/tests/perf/test_perf_raw.in b/tests/perf/test_perf_raw.in
+index f293ccd71..d35529a87 100644
+--- a/tests/perf/test_perf_raw.in
++++ b/tests/perf/test_perf_raw.in
+@@ -137,12 +137,6 @@ function test_kernel_raw()
+ 	rm -rf $TRACE_PATH
+ }
+ 
+-if [ "$(id -u)" == "0" ]; then
+-	isroot=1
+-else
+-	isroot=0
+-fi
+-
+ # MUST set TESTDIR before calling those functions
+ plan_tests $NUM_TESTS
+ 
+@@ -154,7 +148,7 @@ have_libpfm
+ 
+ test_ust_raw
+ 
+-skip $isroot "Root access is needed for kernel testing, skipping." 9 ||
++check_skip_kernel_test 9 ||
+ {
+ 	modprobe lttng-test
+ 	test_kernel_raw
+diff --git a/tests/regression/kernel/test_all_events b/tests/regression/kernel/test_all_events
+index 2e20888df..9d240899e 100755
+--- a/tests/regression/kernel/test_all_events
++++ b/tests/regression/kernel/test_all_events
+@@ -43,13 +43,7 @@ plan_tests $NUM_TESTS
+ 
+ print_test_banner "$TEST_DESC"
+ 
+-if [ "$(id -u)" == "0" ]; then
+-	isroot=1
+-else
+-	isroot=0
+-fi
+-
+-skip $isroot "Root access is needed. Skipping all tests." $NUM_TESTS ||
++check_skip_kernel_test "$NUM_TESTS" ||
+ {
+ 	validate_lttng_modules_present
+ 	start_lttng_sessiond
+diff --git a/tests/regression/kernel/test_callstack b/tests/regression/kernel/test_callstack
+index a4477fd7c..6daea31f1 100755
+--- a/tests/regression/kernel/test_callstack
++++ b/tests/regression/kernel/test_callstack
+@@ -134,13 +134,7 @@ plan_tests $NUM_TESTS
+ 
+ print_test_banner "$TEST_DESC"
+ 
+-if [ "$(id -u)" == "0" ]; then
+-	isroot=1
+-else
+-	isroot=0
+-fi
+-
+-skip $isroot "Root access is needed. Skipping all tests." "$NUM_TESTS" ||
++check_skip_kernel_test "$NUM_TESTS" ||
+ {
+ 	validate_lttng_modules_present
+ 	start_lttng_sessiond
+diff --git a/tests/regression/kernel/test_channel b/tests/regression/kernel/test_channel
+index 9cc74c4e8..190134859 100755
+--- a/tests/regression/kernel/test_channel
++++ b/tests/regression/kernel/test_channel
+@@ -47,13 +47,7 @@ function test_channel_buffer_too_large()
+ plan_tests $NUM_TESTS
+ print_test_banner "$TEST_DESC"
+ 
+-if [ "$(id -u)" == "0" ]; then
+-	isroot=1
+-else
+-	isroot=0
+-fi
+-
+-skip $isroot "Root access is needed. Skipping all tests." $NUM_TESTS ||
++check_skip_kernel_test "$NUM_TESTS" ||
+ {
+ 	start_lttng_sessiond
+ 
+diff --git a/tests/regression/kernel/test_clock_override b/tests/regression/kernel/test_clock_override
+index 72892898b..964862de1 100755
+--- a/tests/regression/kernel/test_clock_override
++++ b/tests/regression/kernel/test_clock_override
+@@ -172,13 +172,7 @@ TESTS=(
+ TEST_COUNT=${#TESTS[@]}
+ i=0
+ 
+-if [ "$(id -u)" == "0" ]; then
+-	isroot=1
+-else
+-	isroot=0
+-fi
+-
+-skip $isroot "Root access is needed. Skipping all tests." $NUM_TESTS ||
++check_skip_kernel_test "$NUM_TESTS" ||
+ {
+ 	validate_lttng_modules_present
+ 	trap signal_cleanup SIGTERM SIGINT
+diff --git a/tests/regression/kernel/test_event_basic b/tests/regression/kernel/test_event_basic
+index ac9ec0549..5e8fd9120 100755
+--- a/tests/regression/kernel/test_event_basic
++++ b/tests/regression/kernel/test_event_basic
+@@ -73,13 +73,7 @@ plan_tests $NUM_TESTS
+ 
+ print_test_banner "$TEST_DESC"
+ 
+-if [ "$(id -u)" == "0" ]; then
+-	isroot=1
+-else
+-	isroot=0
+-fi
+-
+-skip $isroot "Root access is needed. Skipping all tests." $NUM_TESTS ||
++check_skip_kernel_test $NUM_TESTS ||
+ {
+ 	validate_lttng_modules_present
+ 	start_lttng_sessiond
+diff --git a/tests/regression/kernel/test_kernel_function b/tests/regression/kernel/test_kernel_function
+index b1d5491fc..69052fe6f 100755
+--- a/tests/regression/kernel/test_kernel_function
++++ b/tests/regression/kernel/test_kernel_function
+@@ -43,13 +43,7 @@ plan_tests $NUM_TESTS
+ 
+ print_test_banner "$TEST_DESC"
+ 
+-if [ "$(id -u)" == "0" ]; then
+-	isroot=1
+-else
+-	isroot=0
+-fi
+-
+-skip $isroot "Root access is needed. Skipping all tests." $NUM_TESTS ||
++check_skip_kernel_test "$NUM_TESTS" ||
+ {
+ 	start_lttng_sessiond_notap
+ 	validate_lttng_modules_present
+diff --git a/tests/regression/kernel/test_lttng_logger b/tests/regression/kernel/test_lttng_logger
+index b8f7ded82..07c7992f7 100755
+--- a/tests/regression/kernel/test_lttng_logger
++++ b/tests/regression/kernel/test_lttng_logger
+@@ -110,13 +110,8 @@ plan_tests $NUM_TESTS
+ 
+ print_test_banner "$TEST_DESC"
+ 
+-if [ "$(id -u)" == "0" ]; then
+-	isroot=1
+-else
+-	isroot=0
+-fi
+ 
+-skip $isroot "Root access is needed. Skipping all tests." $NUM_TESTS ||
++check_skip_kernel_test "$NUM_TESTS" ||
+ {
+ 	validate_lttng_modules_present
+ 	start_lttng_sessiond
+diff --git a/tests/regression/kernel/test_ns_contexts b/tests/regression/kernel/test_ns_contexts
+index 0c8718d78..2132328ab 100755
+--- a/tests/regression/kernel/test_ns_contexts
++++ b/tests/regression/kernel/test_ns_contexts
+@@ -108,13 +108,7 @@ plan_tests $NUM_TESTS
+ print_test_banner "$TEST_DESC"
+ 
+ 
+-isroot=0
+-if [ "$(id -u)" == "0" ]; then
+-	isroot=1
+-fi
+-
+-skip $isroot "Root access is needed. Skipping all tests." "$NUM_TESTS" && exit 0
+-
++check_skip_kernel_test "$NUM_TESTS" && exit 0
+ 
+ system_has_ns=0
+ if [ -d "/proc/$$/ns" ]; then
+diff --git a/tests/regression/kernel/test_ns_contexts_change b/tests/regression/kernel/test_ns_contexts_change
+index 42a61276b..4ae20bae2 100755
+--- a/tests/regression/kernel/test_ns_contexts_change
++++ b/tests/regression/kernel/test_ns_contexts_change
+@@ -162,14 +162,7 @@ plan_tests $NUM_TESTS
+ 
+ print_test_banner "$TEST_DESC"
+ 
+-
+-isroot=0
+-if [ "$(id -u)" == "0" ]; then
+-	isroot=1
+-fi
+-
+-skip $isroot "Root access is needed. Skipping all tests." "$NUM_TESTS" && exit 0
+-
++check_skip_kernel_test "$NUM_TESTS" && exit 0
+ 
+ system_has_ns=0
+ if [ -d "/proc/$$/ns" ]; then
+diff --git a/tests/regression/kernel/test_rotation_destroy_flush b/tests/regression/kernel/test_rotation_destroy_flush
+index cb773d7df..a1286e999 100755
+--- a/tests/regression/kernel/test_rotation_destroy_flush
++++ b/tests/regression/kernel/test_rotation_destroy_flush
+@@ -120,13 +120,7 @@ TESTS=(
+ TEST_COUNT=${#TESTS[@]}
+ i=0
+ 
+-if [ "$(id -u)" == "0" ]; then
+-	isroot=1
+-else
+-	isroot=0
+-fi
+-
+-skip $isroot "Root access is needed. Skipping all tests." $NUM_TESTS ||
++check_skip_kernel_test "$NUM_TESTS" ||
+ {
+ 	validate_lttng_modules_present
+ 	trap signal_cleanup SIGTERM SIGINT
+diff --git a/tests/regression/kernel/test_select_poll_epoll b/tests/regression/kernel/test_select_poll_epoll
+index d8245a0e7..d97eddeb2 100755
+--- a/tests/regression/kernel/test_select_poll_epoll
++++ b/tests/regression/kernel/test_select_poll_epoll
+@@ -374,13 +374,7 @@ if test $? != 0; then
+ 	exit 0
+ fi
+ 
+-if [ "$(id -u)" == "0" ]; then
+-	isroot=1
+-else
+-	isroot=0
+-fi
+-
+-skip $isroot "Root access is needed. Skipping all tests." $NUM_TESTS ||
++check_skip_kernel_test "$NUM_TESTS" ||
+ {
+ 	validate_lttng_modules_present
+ 
+diff --git a/tests/regression/kernel/test_syscall b/tests/regression/kernel/test_syscall
+index 401a18a8d..ccbaeb186 100755
+--- a/tests/regression/kernel/test_syscall
++++ b/tests/regression/kernel/test_syscall
+@@ -664,13 +664,7 @@ plan_tests $NUM_TESTS
+ 
+ print_test_banner "$TEST_DESC"
+ 
+-if [ "$(id -u)" == "0" ]; then
+-	isroot=1
+-else
+-	isroot=0
+-fi
+-
+-skip $isroot "Root access is needed. Skipping all tests." $NUM_TESTS ||
++check_skip_kernel_test "$NUM_TESTS" ||
+ {
+ 	validate_lttng_modules_present
+ 	start_lttng_sessiond
+diff --git a/tests/regression/kernel/test_userspace_probe b/tests/regression/kernel/test_userspace_probe
+index 1091ee65e..1afb7d29e 100755
+--- a/tests/regression/kernel/test_userspace_probe
++++ b/tests/regression/kernel/test_userspace_probe
+@@ -815,13 +815,7 @@ fi
+ plan_tests $NUM_TESTS
+ print_test_banner "$TEST_DESC"
+ 
+-if [ "$(id -u)" == "0" ]; then
+-	isroot=1
+-else
+-	isroot=0
+-fi
+-
+-skip $isroot "Root access is needed. Skipping all tests." $NUM_TESTS ||
++check_skip_kernel_test "$NUM_TESTS" ||
+ {
+ 	validate_lttng_modules_present
+ 	start_lttng_sessiond
+diff --git a/tests/regression/tools/clear/test_kernel b/tests/regression/tools/clear/test_kernel
+index 06fb1c368..2e0346b37 100755
+--- a/tests/regression/tools/clear/test_kernel
++++ b/tests/regression/tools/clear/test_kernel
+@@ -536,12 +536,6 @@ plan_tests $NUM_TESTS
+ 
+ print_test_banner "$TEST_DESC"
+ 
+-if [ "$(id -u)" == "0" ]; then
+-	isroot=1
+-else
+-	isroot=0
+-fi
+-
+ streaming_tests=(test_kernel_streaming
+ 	test_kernel_streaming_rotate_clear
+ 	test_kernel_streaming_clear_rotate
+@@ -563,7 +557,7 @@ snapshot_tests=(test_kernel_streaming_snapshot
+ 	test_kernel_local_snapshot
+ )
+ 
+-skip $isroot "Root access is needed. Skipping all kernel streaming tests." $NUM_TESTS ||
++check_skip_kernel_test "$NUM_TESTS" ||
+ {
+ 	trap signal_cleanup SIGTERM SIGINT
+ 
+diff --git a/tests/regression/tools/filtering/test_invalid_filter b/tests/regression/tools/filtering/test_invalid_filter
+index 7d9e524d9..12b5bbde8 100755
+--- a/tests/regression/tools/filtering/test_invalid_filter
++++ b/tests/regression/tools/filtering/test_invalid_filter
+@@ -168,13 +168,7 @@ done
+ 
+ test_bytecode_limit -u
+ 
+-if [ "$(id -u)" == "0" ]; then
+-	isroot=1
+-else
+-	isroot=0
+-fi
+-
+-skip $isroot "Root access is needed. Skipping all kernel invalid filter tests." $NUM_KERNEL_TESTS ||
++check_skip_kernel_test "$NUM_KERNEL_TESTS" ||
+ {
+ 	diag "Test kernel filters"
+ 	i=0
+diff --git a/tests/regression/tools/filtering/test_unsupported_op b/tests/regression/tools/filtering/test_unsupported_op
+index 299247a3c..8c7ddeeaa 100755
+--- a/tests/regression/tools/filtering/test_unsupported_op
++++ b/tests/regression/tools/filtering/test_unsupported_op
+@@ -103,13 +103,7 @@ while [ "$i" -lt "$OP_COUNT" ]; do
+ 	let "i++"
+ done
+ 
+-if [ "$(id -u)" == "0" ]; then
+-	isroot=1
+-else
+-	isroot=0
+-fi
+-
+-skip $isroot "Root access is needed. Skipping all kernel unsupported filter operations tests." $NUM_KERNEL_TESTS ||
++check_skip_kernel_test $NUM_KERNEL_TESTS ||
+ {
+ 	diag "Test kernel unsupported filter operations"
+ 
+diff --git a/tests/regression/tools/filtering/test_valid_filter b/tests/regression/tools/filtering/test_valid_filter
+index e76ffa25f..ed8b96d59 100755
+--- a/tests/regression/tools/filtering/test_valid_filter
++++ b/tests/regression/tools/filtering/test_valid_filter
+@@ -1452,13 +1452,7 @@ KERNEL_FILTERS=(
+ 
+ IFS=$OLDIFS
+ 
+-if [ "$(id -u)" == "0" ]; then
+-	isroot=1
+-else
+-	isroot=0
+-fi
+-
+-skip $isroot "Root access is needed. Skipping all kernel valid filter tests." $NUM_KERNEL_TESTS ||
++check_skip_kernel_test "$NUM_KERNEL_TESTS" ||
+ {
+ 	diag "Test kernel valid filters"
+ 
+diff --git a/tests/regression/tools/health/test_health.sh b/tests/regression/tools/health/test_health.sh
+index b3d6419d2..14ef0974d 100644
+--- a/tests/regression/tools/health/test_health.sh
++++ b/tests/regression/tools/health/test_health.sh
+@@ -82,7 +82,7 @@ function test_health
+ 		diag "With UST consumer daemons"
+ 		enable_ust_lttng_event_ok $SESSION_NAME $UST_EVENT_NAME $CHANNEL_NAME
+ 
+-		skip $isroot "Root access is needed. Skipping kernel consumer health check test." "1" ||
++		check_skip_kernel_test "1" ||
+ 		{
+ 			diag "With kernel consumer daemon"
+ 			lttng_enable_kernel_event $SESSION_NAME $KERNEL_EVENT_NAME $CHANNEL_NAME
+@@ -113,7 +113,7 @@ function test_health
+ 
+ 
+ 	if [ ${test_needs_root} -eq 1 ]; then
+-		skip ${isroot} "Root access needed for test \"${test_thread_name}\"." "1" ||
++		check_skip_kernel_test "1" ||
+ 		{
+ 			report_errors "${test_thread_error_string}" "${test_relayd}"
+ 		}
+@@ -276,12 +276,6 @@ STDERR_PATH=$(mktemp --tmpdir tmp.test_health_stderr_path.XXXXXX)
+ TRACE_PATH=$(mktemp --tmpdir -d tmp.test_health_trace_path.XXXXXX)
+ HEALTH_PATH=$(mktemp --tmpdir -d tmp.test_health_trace_path.XXXXXX)
+ 
+-if [ "$(id -u)" == "0" ]; then
+-	isroot=1
+-else
+-	isroot=0
+-fi
+-
+ THREAD_COUNT=${#THREAD[@]}
+ i=0
+ while [ "$i" -lt "$THREAD_COUNT" ]; do
+diff --git a/tests/regression/tools/health/test_thread_ok b/tests/regression/tools/health/test_thread_ok
+index e84adb611..50b583481 100755
+--- a/tests/regression/tools/health/test_thread_ok
++++ b/tests/regression/tools/health/test_thread_ok
+@@ -67,7 +67,7 @@ function test_thread_ok
+ 	$CURDIR/$HEALTH_CHECK_BIN > ${STDOUT_PATH} 2> ${STDERR_PATH}
+ 	report_errors
+ 
+-	skip $isroot "Root access is needed. Skipping kernel consumer health check test." "5" ||
++	check_skip_kernel_test "5" ||
+ 	{
+ 		diag "With kernel consumer daemon"
+ 		create_lttng_session_no_output $SESSION_NAME
+@@ -115,13 +115,6 @@ STDERR_PATH=$(mktemp --tmpdir tmp.test_thread_ok_stderr_path.XXXXXX)
+ TRACE_PATH=$(mktemp --tmpdir -d tmp.test_thread_ok_trace_path.XXXXXX)
+ HEALTH_PATH=$(mktemp --tmpdir -d tmp.test_thread_ok_trace_path.XXXXXX)
+ 
+-# The manage kernel thread is only spawned if we are root
+-if [ "$(id -u)" == "0" ]; then
+-	isroot=1
+-else
+-	isroot=0
+-fi
+-
+ test_thread_ok
+ 
+ rm -rf ${HEALTH_PATH}
+diff --git a/tests/regression/tools/live/test_kernel b/tests/regression/tools/live/test_kernel
+index b622b5214..fdaa09f0d 100755
+--- a/tests/regression/tools/live/test_kernel
++++ b/tests/regression/tools/live/test_kernel
+@@ -39,13 +39,11 @@ function clean_live_tracing()
+ 	rm -rf $TRACE_PATH
+ }
+ 
+-# Need root access for kernel tracing.
+-if [ "$(id -u)" == "0" ]; then
+-	isroot=1
+-else
+-	plan_skip_all "Root access is needed. Skipping all tests."
++check_skip_kernel_test &&
++{
++	plan_skip_all "Skipping all tests."
+ 	exit 0
+-fi
++}
+ 
+ modprobe lttng-test
+ 
+diff --git a/tests/regression/tools/live/test_lttng_kernel b/tests/regression/tools/live/test_lttng_kernel
+index a23d9373a..a25fdce04 100755
+--- a/tests/regression/tools/live/test_lttng_kernel
++++ b/tests/regression/tools/live/test_lttng_kernel
+@@ -45,13 +45,7 @@ function clean_live_tracing()
+ }
+ 
+ # Need root access for kernel tracing.
+-if [ "$(id -u)" == "0" ]; then
+-	isroot=1
+-else
+-	isroot=0
+-fi
+-
+-skip $isroot "Root access is needed. Skipping all tests." $NUM_TESTS ||
++check_skip_kernel_test "$NUM_TESTS" ||
+ {
+ 	modprobe lttng-test
+ 
+diff --git a/tests/regression/tools/metadata/test_kernel b/tests/regression/tools/metadata/test_kernel
+index 57cace6ea..0f9530403 100755
+--- a/tests/regression/tools/metadata/test_kernel
++++ b/tests/regression/tools/metadata/test_kernel
+@@ -91,13 +91,7 @@ plan_tests $NUM_TESTS
+ print_test_banner "$TEST_DESC"
+ 
+ 
+-if [ "$(id -u)" == "0" ]; then
+-	isroot=1
+-else
+-	isroot=0
+-fi
+-
+-skip $isroot "Root access is needed. Skipping all kernel metadata tests." $NUM_TESTS ||
++check_skip_kernel_test "$NUM_TESTS" ||
+ {
+ 	validate_lttng_modules_present
+ 	modprobe lttng-test
+diff --git a/tests/regression/tools/notification/test_notification_kernel_buffer_usage b/tests/regression/tools/notification/test_notification_kernel_buffer_usage
+index 76e69a77e..876d13e5d 100755
+--- a/tests/regression/tools/notification/test_notification_kernel_buffer_usage
++++ b/tests/regression/tools/notification/test_notification_kernel_buffer_usage
+@@ -60,29 +60,27 @@ function test_buffer_usage_notification
+ 	wait $APP_PID 2> /dev/null
+ }
+ 
+-if [ "$(id -u)" == "0" ]; then
+-
+-	validate_lttng_modules_present
+-
++check_skip_kernel_test && 
++{
++	plan_skip_all "Skipping all tests."
++	rm -rf "$TEST_TMPDIR"
++	exit 0
++}
+ 
+-	modprobe lttng-test
++validate_lttng_modules_present
+ 
+-	# Used on sessiond launch.
+-	LTTNG_SESSIOND_ENV_VARS="LTTNG_TESTPOINT_ENABLE=1 \
+-		CONSUMER_PAUSE_PIPE_PATH=${TESTPOINT_PIPE_PATH} \
+-		LD_PRELOAD=${TESTPOINT}"
+-	start_lttng_sessiond_notap
++modprobe lttng-test
+ 
+-	test_buffer_usage_notification
++# Used on sessiond launch.
++LTTNG_SESSIOND_ENV_VARS="LTTNG_TESTPOINT_ENABLE=1 \
++	CONSUMER_PAUSE_PIPE_PATH=${TESTPOINT_PIPE_PATH} \
++	LD_PRELOAD=${TESTPOINT}"
++start_lttng_sessiond_notap
+ 
+-	stop_lttng_sessiond_notap
+-	rmmod lttng-test
++test_buffer_usage_notification
+ 
+-	rm -rf "${consumerd_pipe[@]}" 2> /dev/null
+-else
+-	# Kernel tests are skipped.
+-	plan_tests $NUM_TESTS
+-	skip 0 "Root access is needed. Skipping all kernel notification tests." $NUM_TESTS
+-fi
++stop_lttng_sessiond_notap
++rmmod lttng-test
+ 
++rm -rf "${consumerd_pipe[@]}" 2> /dev/null
+ rm -rf "$TEST_TMPDIR"
+diff --git a/tests/regression/tools/notification/test_notification_kernel_capture b/tests/regression/tools/notification/test_notification_kernel_capture
+index 88f123d3d..0f8a2bc6f 100755
+--- a/tests/regression/tools/notification/test_notification_kernel_capture
++++ b/tests/regression/tools/notification/test_notification_kernel_capture
+@@ -31,22 +31,21 @@ function test_basic_error_path
+ }
+ 
+ 
+-if [ "$(id -u)" == "0" ]; then
+-	validate_lttng_modules_present
++check_skip_kernel_test &&
++{
++	plan_skip_all "Skipping all tests."
++	exit 0
++}
+ 
+-	modprobe lttng-test
++validate_lttng_modules_present
+ 
+-	start_lttng_sessiond_notap
++modprobe lttng-test
+ 
+-	test_basic_error_path
++start_lttng_sessiond_notap
+ 
+-	stop_lttng_sessiond_notap
+-	rmmod lttng-test
++test_basic_error_path
+ 
+-else
+-	# Kernel tests are skipped.
+-	plan_tests $NUM_TESTS
+-	skip 0 "Root access is needed. Skipping all kernel notification tests." $NUM_TESTS
+-fi
++stop_lttng_sessiond_notap
++rmmod lttng-test
+ 
+ rm -f "$TESTAPP_STATE_PATH"
+diff --git a/tests/regression/tools/notification/test_notification_kernel_error b/tests/regression/tools/notification/test_notification_kernel_error
+index 80fe6e5b5..9566ce0e4 100755
+--- a/tests/regression/tools/notification/test_notification_kernel_error
++++ b/tests/regression/tools/notification/test_notification_kernel_error
+@@ -30,23 +30,22 @@ function test_basic_error_path
+ 	wait $APP_PID 2> /dev/null
+ }
+ 
++check_skip_kernel_test && 
++{
++	plan_skip_all "Skipping all tests."
++	exit 0
++}
+ 
+-if [ "$(id -u)" == "0" ]; then
+-	validate_lttng_modules_present
++validate_lttng_modules_present
+ 
+-	modprobe lttng-test
++modprobe lttng-test
+ 
+-	start_lttng_sessiond_notap
++start_lttng_sessiond_notap
+ 
+-	test_basic_error_path
++test_basic_error_path
+ 
+-	stop_lttng_sessiond_notap
+-	rmmod lttng-test
++stop_lttng_sessiond_notap
++rmmod lttng-test
+ 
+-else
+-	# Kernel tests are skipped.
+-	plan_tests $NUM_TESTS
+-	skip 0 "Root access is needed. Skipping all kernel notification tests." $NUM_TESTS
+-fi
+ 
+ rm -f "$TESTAPP_STATE_PATH"
+diff --git a/tests/regression/tools/notification/test_notification_kernel_instrumentation b/tests/regression/tools/notification/test_notification_kernel_instrumentation
+index 90545a541..484bd787d 100755
+--- a/tests/regression/tools/notification/test_notification_kernel_instrumentation
++++ b/tests/regression/tools/notification/test_notification_kernel_instrumentation
+@@ -28,22 +28,21 @@ function test_kernel_instrumentation_notification
+ 	wait $APP_PID 2> /dev/null
+ }
+ 
+-if [ "$(id -u)" == "0" ]; then
+-	validate_lttng_modules_present
++check_skip_kernel_test && 
++{
++	plan_skip_all "Skipping all tests."
++	exit 0
++}
+ 
+-	modprobe lttng-test
++validate_lttng_modules_present
+ 
+-	start_lttng_sessiond_notap
++modprobe lttng-test
+ 
+-	test_kernel_instrumentation_notification
++start_lttng_sessiond_notap
+ 
+-	stop_lttng_sessiond_notap
+-	rmmod lttng-test
++test_kernel_instrumentation_notification
+ 
+-else
+-	# Kernel tests are skipped.
+-	plan_tests $NUM_TESTS
+-	skip 0 "Root access is needed. Skipping all kernel notification tests." $NUM_TESTS
+-fi
++stop_lttng_sessiond_notap
++rmmod lttng-test
+ 
+ rm -f "$TESTAPP_STATE_PATH"
+diff --git a/tests/regression/tools/notification/test_notification_kernel_syscall b/tests/regression/tools/notification/test_notification_kernel_syscall
+index d273cb55d..7fa235388 100755
+--- a/tests/regression/tools/notification/test_notification_kernel_syscall
++++ b/tests/regression/tools/notification/test_notification_kernel_syscall
+@@ -31,19 +31,18 @@ function test_kernel_syscall_notification
+ 	wait $APP_PID 2> /dev/null
+ }
+ 
+-if [ "$(id -u)" == "0" ]; then
+-	validate_lttng_modules_present
++check_skip_kernel_test &&
++{
++	plan_skip_all "Skipping all tests."
++	exit 0
++}
+ 
+-	start_lttng_sessiond_notap
++validate_lttng_modules_present
+ 
+-	test_kernel_syscall_notification
++start_lttng_sessiond_notap
+ 
+-	stop_lttng_sessiond_notap
++test_kernel_syscall_notification
+ 
+-else
+-	# Kernel tests are skipped.
+-	plan_tests $NUM_TESTS
+-	skip 0 "Root access is needed. Skipping all kernel notification tests." $NUM_TESTS
+-fi
++stop_lttng_sessiond_notap
+ 
+ rm -f "$TESTAPP_STATE_PATH"
+diff --git a/tests/regression/tools/notification/test_notification_kernel_userspace_probe b/tests/regression/tools/notification/test_notification_kernel_userspace_probe
+index 8ef8d708d..abddd9be7 100755
+--- a/tests/regression/tools/notification/test_notification_kernel_userspace_probe
++++ b/tests/regression/tools/notification/test_notification_kernel_userspace_probe
+@@ -29,18 +29,18 @@ function test_kernel_userspace_probe_notification
+ 	wait $APP_PID 2> /dev/null
+ }
+ 
+-if [ "$(id -u)" == "0" ]; then
+-	validate_lttng_modules_present
++check_skip_kernel_test &&
++{
++	plan_skip_all "Skipping all tests."
++	exit 0
++}
++
++validate_lttng_modules_present
+ 
+-	start_lttng_sessiond_notap
++start_lttng_sessiond_notap
+ 
+-	test_kernel_userspace_probe_notification
++test_kernel_userspace_probe_notification
+ 
+-	stop_lttng_sessiond_notap
+-else
+-	# Kernel tests are skipped.
+-	plan_tests $NUM_TESTS
+-	skip 0 "Root access is needed. Skipping all kernel notification tests." $NUM_TESTS
+-fi
++stop_lttng_sessiond_notap
+ 
+ rm -f "$TESTAPP_STATE_PATH"
+diff --git a/tests/regression/tools/notification/test_notification_multi_app b/tests/regression/tools/notification/test_notification_multi_app
+index d8b639225..313a47d69 100755
+--- a/tests/regression/tools/notification/test_notification_multi_app
++++ b/tests/regression/tools/notification/test_notification_multi_app
+@@ -411,32 +411,31 @@ function test_on_register_evaluation ()
+ 	rm -rf "$output_dir"
+ }
+ 
++check_skip_kernel_test "$NUM_TESTS" || {
++
++	TESTS=(
++		test_multi_app_ust
++		test_on_register_evaluation_ust
++	)
+ 
+-TESTS=(
+-	test_multi_app_ust
+-	test_on_register_evaluation_ust
+-)
+ 
+-if [ "$(id -u)" == "0" ]; then
+ 	validate_lttng_modules_present
+ 	TESTS+=(
+-	test_multi_app_kernel
+-	test_on_register_evaluation_kernel
+-)
+-else
+-        skip 0 "Root access is needed. Skipping all kernel multi-app notification tests." $NUM_TEST_KERNEL
+-fi
++		test_multi_app_kernel
++		test_on_register_evaluation_kernel
++	)
+ 
+ 
+-for fct_test in ${TESTS[@]};
+-do
+-	TRACE_PATH=$(mktemp --tmpdir -d tmp.test_notification_multi_app_trace_path.XXXXXX)
++	for fct_test in ${TESTS[@]};
++	do
++		TRACE_PATH=$(mktemp -d -t tmp.test_notification_multi_app_trace_path.XXXXXX)
+ 
+-	${fct_test}
+-	if [ $? -ne 0 ]; then
+-		break;
+-	fi
++		${fct_test}
++		if [ $? -ne 0 ]; then
++			break;
++		fi
+ 
+-	# Only delete if successful
+-	rm -rf $TRACE_PATH
+-done
++		# Only delete if successful
++		rm -rf $TRACE_PATH
++	done
++}
+diff --git a/tests/regression/tools/notification/test_notification_notifier_discarded_count b/tests/regression/tools/notification/test_notification_notifier_discarded_count
+index c9235393e..93a02b2d0 100755
+--- a/tests/regression/tools/notification/test_notification_notifier_discarded_count
++++ b/tests/regression/tools/notification/test_notification_notifier_discarded_count
+@@ -391,7 +391,8 @@ function test_ust_notifier_discarded_regardless_trigger_owner
+ test_ust_notifier_discarded_count
+ test_ust_notifier_discarded_count_max_bucket
+ 
+-if [ "$(id -u)" == "0" ]; then
++check_skip_kernel_test "$KERNEL_NUM_TESTS" || 
++{
+ 
+ 	validate_lttng_modules_present
+ 
+@@ -413,9 +414,6 @@ if [ "$(id -u)" == "0" ]; then
+ 	modprobe --remove lttng-test
+ 
+ 	rm -rf "${sessiond_pipe[@]}" 2> /dev/null
+-else
+-	# Kernel tests are skipped.
+-	skip 0 "Root access is needed. Skipping all kernel notification tests." $KERNEL_NUM_TESTS
+-fi
+ 
+-rm -rf "$TEST_TMPDIR"
++	rm -rf "$TEST_TMPDIR"
++}
+diff --git a/tests/regression/tools/regen-metadata/test_kernel b/tests/regression/tools/regen-metadata/test_kernel
+index 49eea32a7..db3247e7a 100755
+--- a/tests/regression/tools/regen-metadata/test_kernel
++++ b/tests/regression/tools/regen-metadata/test_kernel
+@@ -99,13 +99,7 @@ plan_tests $NUM_TESTS
+ 
+ print_test_banner "$TEST_DESC"
+ 
+-if [ "$(id -u)" == "0" ]; then
+-	isroot=1
+-else
+-	isroot=0
+-fi
+-
+-skip $isroot "Root access is needed. Skipping all kernel streaming tests." $NUM_TESTS ||
++check_skip_kernel_test "$NUM_TESTS" ||
+ {
+ 	validate_lttng_modules_present
+ 
+diff --git a/tests/regression/tools/regen-statedump/test_kernel b/tests/regression/tools/regen-statedump/test_kernel
+index 8a261355d..df587e2cf 100755
+--- a/tests/regression/tools/regen-statedump/test_kernel
++++ b/tests/regression/tools/regen-statedump/test_kernel
+@@ -39,13 +39,7 @@ plan_tests $NUM_TESTS
+ 
+ print_test_banner "$TEST_DESC"
+ 
+-if [ "$(id -u)" == "0" ]; then
+-	isroot=1
+-else
+-	isroot=0
+-fi
+-
+-skip $isroot "Root access is needed. Skipping all kernel streaming tests." $NUM_TESTS ||
++check_skip_kernel_test "$NUM_TESTS" ||
+ {
+ 	validate_lttng_modules_present
+ 	start_lttng_sessiond
+diff --git a/tests/regression/tools/rotation/test_kernel b/tests/regression/tools/rotation/test_kernel
+index f5f1f5553..b158e8be0 100755
+--- a/tests/regression/tools/rotation/test_kernel
++++ b/tests/regression/tools/rotation/test_kernel
+@@ -82,13 +82,7 @@ plan_tests $NUM_TESTS
+ 
+ print_test_banner "$TEST_DESC"
+ 
+-if [ "$(id -u)" == "0" ]; then
+-	isroot=1
+-else
+-	isroot=0
+-fi
+-
+-skip $isroot "Root access is needed. Skipping all kernel streaming tests." $NUM_TESTS ||
++check_skip_kernel_test "$NUM_TESTS" ||
+ {
+ 	validate_lttng_modules_present
+ 
+diff --git a/tests/regression/tools/snapshots/test_kernel b/tests/regression/tools/snapshots/test_kernel
+index abb243563..70e34dd01 100755
+--- a/tests/regression/tools/snapshots/test_kernel
++++ b/tests/regression/tools/snapshots/test_kernel
+@@ -217,13 +217,7 @@ plan_tests $NUM_TESTS
+ 
+ print_test_banner "$TEST_DESC"
+ 
+-if [ "$(id -u)" == "0" ]; then
+-	isroot=1
+-else
+-	isroot=0
+-fi
+-
+-skip $isroot "Root access is needed. Skipping all kernel snapshot tests" $NUM_TESTS ||
++check_skip_kernel_test "$NUM_TESTS" ||
+ {
+ 
+ 	validate_lttng_modules_present
+diff --git a/tests/regression/tools/snapshots/test_kernel_streaming b/tests/regression/tools/snapshots/test_kernel_streaming
+index 0c92dc710..1d25ba253 100755
+--- a/tests/regression/tools/snapshots/test_kernel_streaming
++++ b/tests/regression/tools/snapshots/test_kernel_streaming
+@@ -145,13 +145,7 @@ plan_tests $NUM_TESTS
+ 
+ print_test_banner "$TEST_DESC"
+ 
+-if [ "$(id -u)" == "0" ]; then
+-	isroot=1
+-else
+-	isroot=0
+-fi
+-
+-skip $isroot "Root access is needed. Skipping all kernel streaming tests" $NUM_TESTS ||
++check_skip_kernel_test $NUM_TESTS ||
+ {
+ 	validate_lttng_modules_present
+ 
+diff --git a/tests/regression/tools/snapshots/test_ust_streaming b/tests/regression/tools/snapshots/test_ust_streaming
+index ed109abd4..a6df586b0 100755
+--- a/tests/regression/tools/snapshots/test_ust_streaming
++++ b/tests/regression/tools/snapshots/test_ust_streaming
+@@ -232,12 +232,6 @@ plan_tests $NUM_TESTS
+ 
+ print_test_banner "$TEST_DESC"
+ 
+-if [ "$(id -u)" == "0" ]; then
+-	isroot=1
+-else
+-	isroot=0
+-fi
+-
+ start_lttng_relayd "-o $TRACE_PATH"
+ start_lttng_sessiond
+ 
+diff --git a/tests/regression/tools/streaming/test_high_throughput_limits b/tests/regression/tools/streaming/test_high_throughput_limits
+index 2b9e3ad39..4078203f9 100755
+--- a/tests/regression/tools/streaming/test_high_throughput_limits
++++ b/tests/regression/tools/streaming/test_high_throughput_limits
+@@ -170,13 +170,7 @@ plan_tests $NUM_TESTS
+ 
+ print_test_banner "$TEST_DESC"
+ 
+-if [ "$(id -u)" == "0" ]; then
+-	isroot=1
+-else
+-	isroot=0
+-fi
+-
+-skip $isroot "Root access is needed to set bandwith limits. Skipping all tests." $NUM_TESTS ||
++check_skip_kernel_test "$NUM_TESTS" ||
+ {
+ 
+ 	# Catch sigint and try to cleanup limits
+diff --git a/tests/regression/tools/streaming/test_kernel b/tests/regression/tools/streaming/test_kernel
+index 33334229f..4369df8a3 100755
+--- a/tests/regression/tools/streaming/test_kernel
++++ b/tests/regression/tools/streaming/test_kernel
+@@ -47,13 +47,7 @@ plan_tests $NUM_TESTS
+ 
+ print_test_banner "$TEST_DESC"
+ 
+-if [ "$(id -u)" == "0" ]; then
+-	isroot=1
+-else
+-	isroot=0
+-fi
+-
+-skip $isroot "Root access is needed. Skipping all kernel streaming tests." $NUM_TESTS ||
++check_skip_kernel_test "$NUM_TESTS" ||
+ {
+ 	validate_lttng_modules_present
+ 
+diff --git a/tests/regression/tools/tracker/test_event_tracker b/tests/regression/tools/tracker/test_event_tracker
+index cc0f698d2..065bc7323 100755
+--- a/tests/regression/tools/tracker/test_event_tracker
++++ b/tests/regression/tools/tracker/test_event_tracker
+@@ -466,13 +466,7 @@ test_event_track_untrack ust 0 "${EVENT_NAME}" "--pid --all"	# backward compat
+ test_event_tracker ust 1 "${EVENT_NAME}" "--pid --all"	# backward compat
+ test_event_pid_tracker ust 1 "${EVENT_NAME}"
+ 
+-if [ "$(id -u)" == "0" ]; then
+-	isroot=1
+-else
+-	isroot=0
+-fi
+-
+-skip $isroot "Root access is needed. Skipping all kernel tracker tests." $NUM_KERNEL_TESTS ||
++check_skip_kernel_test "$NUM_KERNEL_TESTS" ||
+ {
+ 	diag "Test kernel tracker"
+ 
+diff --git a/tests/regression/tools/trigger/test_add_trigger_cli b/tests/regression/tools/trigger/test_add_trigger_cli
+index 98ecf6272..e34aa42d8 100755
+--- a/tests/regression/tools/trigger/test_add_trigger_cli
++++ b/tests/regression/tools/trigger/test_add_trigger_cli
+@@ -34,12 +34,6 @@ tmp_stdout=$(mktemp --tmpdir -t test_parse_cli_trigger_stdout.XXXXXX)
+ tmp_stderr=$(mktemp --tmpdir -t test_parse_cli_trigger_stderr.XXXXXX)
+ uprobe_elf_binary="${TESTDIR}/utils/testapp/userspace-probe-elf-binary/.libs/userspace-probe-elf-binary"
+ 
+-if [ "$(id -u)" == "0" ]; then
+-	ist_root=1
+-else
+-	ist_root=0
+-fi
+-
+ function test_success ()
+ {
+ 	local test_name="$1"
+@@ -223,7 +217,7 @@ test_success "--exclude-name two" "trigger5" \
+ 	--condition event-rule-matches --type=user --name='jean-*' --exclude-name jean-chretien -x jean-charest \
+ 	--action notify
+ 
+-skip $ist_root "non-root user: skipping kprobe tests" 18 || {
++check_skip_kernel_test 18 || {
+ 	i=0
+ 
+ 	for type in kprobe kernel:kprobe; do
+@@ -262,7 +256,7 @@ skip $ist_root "non-root user: skipping kprobe tests" 18 || {
+ 	done
+ }
+ 
+-skip $ist_root "non-root user: skipping uprobe tests" 6 || {
++check_skip_kernel_test 6 || {
+ 	test_success "--condition event-rule-matches uprobe" "uprobe-trigger-0" \
+ 		--name="uprobe-trigger-0" \
+ 		--condition event-rule-matches --type=kernel:uprobe --location=${uprobe_elf_binary}:test_function --event-name=ma-probe \
+@@ -274,7 +268,7 @@ skip $ist_root "non-root user: skipping uprobe tests" 6 || {
+ 		--action notify
+ }
+ 
+-skip $ist_root "non-root user: skipping syscall tests" 30 || {
++check_skip_kernel_test 30 || {
+ 	test_success "--condition event-rule-matches one syscall" "syscall-trigger-0" \
+ 		--name="syscall-trigger-0" \
+ 		--condition event-rule-matches --type=syscall --name=open \
+diff --git a/tests/regression/tools/trigger/test_list_triggers_cli b/tests/regression/tools/trigger/test_list_triggers_cli
+index a04018013..5012e3267 100755
+--- a/tests/regression/tools/trigger/test_list_triggers_cli
++++ b/tests/regression/tools/trigger/test_list_triggers_cli
+@@ -38,20 +38,13 @@ register_some_triggers_bin=$(realpath "${CURDIR}/utils/register-some-triggers")
+ uid=$(id --user)
+ gid=$(id --group)
+ 
+-if [ "$uid" == "0" ]; then
+-	ist_root=1
+-	ls "$uprobe_sdt_binary" >/dev/null 2>&1
+-	if test $? == 0; then
+-		hast_sdt_binary=1
+-	else
+-		hast_sdt_binary=0
+-	fi
++ls "$uprobe_sdt_binary" >/dev/null 2>&1
++if test $? == 0; then
++	hast_sdt_binary=1
+ else
+-	ist_root=0
+ 	hast_sdt_binary=0
+ fi
+ 
+-
+ test_top_level_options ()
+ {
+ 	diag "Listing top level options"
+@@ -2695,10 +2688,10 @@ start_lttng_sessiond_notap
+ 
+ test_top_level_options
+ test_event_rule_matches_tracepoint
+-skip $ist_root "non-root user: skipping kprobe tests" 13 || test_event_rule_matches_probe
+-skip $ist_root "non-root user: skipping uprobe tests" 9 || test_event_rule_matches_userspace_probe_elf
+-skip $(($ist_root && $hast_sdt_binary)) "skipping userspace probe SDT tests" 9 || test_event_rule_matches_userspace_probe_sdt
+-skip $ist_root "non-root user: skipping syscall tests" 17 || test_event_rule_matches_syscall
++check_skip_kernel_test 13 || test_event_rule_matches_probe
++check_skip_kernel_test 9 || test_event_rule_matches_userspace_probe_elf
++check_skip_kernel_test 9 || skip $hast_sdt_binary "skipping userspace probe SDT tests" 9 || test_event_rule_matches_userspace_probe_sdt
++check_skip_kernel_test 17 || test_event_rule_matches_syscall
+ test_session_consumed_size_condition
+ test_buffer_usage_conditions
+ test_session_rotation_conditions
+diff --git a/tests/regression/tools/wildcard/test_event_wildcard b/tests/regression/tools/wildcard/test_event_wildcard
+index f69baffc4..60dcf0046 100755
+--- a/tests/regression/tools/wildcard/test_event_wildcard
++++ b/tests/regression/tools/wildcard/test_event_wildcard
+@@ -124,13 +124,7 @@ test_event_wildcard ust 1 'tp*tptest'
+ test_event_wildcard ust 1 'tp**tptest'
+ test_event_wildcard ust 1 'tp*test'
+ 
+-if [ "$(id -u)" == "0" ]; then
+-	isroot=1
+-else
+-	isroot=0
+-fi
+-
+-skip $isroot "Root access is needed. Skipping all kernel wildcard tests." $NUM_KERNEL_TESTS ||
++check_skip_kernel_test "$NUM_KERNEL_TESTS" ||
+ {
+ 	diag "Test kernel wildcards"
+ 
+diff --git a/tests/regression/tools/working-directory/test_relayd_working_directory b/tests/regression/tools/working-directory/test_relayd_working_directory
+index c7e784cca..6bd1e504a 100755
+--- a/tests/regression/tools/working-directory/test_relayd_working_directory
++++ b/tests/regression/tools/working-directory/test_relayd_working_directory
+@@ -145,9 +145,9 @@ function test_relayd_debug_permission()
+ 	diag "Test lttng-relayd change working directory on non writable directory"
+ 
+ 	if [ "$(id -u)" == "0" ]; then
+-	    is_user=0
++		is_user=0
+ 	else
+-	    is_user=1
++		is_user=1
+ 	fi
+ 
+ 	skip $is_user "Skipping permission debug output test; operation can't fail as root" 6 ||
+diff --git a/tests/regression/ust/namespaces/test_ns_contexts_change b/tests/regression/ust/namespaces/test_ns_contexts_change
+index 8a4b62ce3..2430b8637 100755
+--- a/tests/regression/ust/namespaces/test_ns_contexts_change
++++ b/tests/regression/ust/namespaces/test_ns_contexts_change
+@@ -101,12 +101,7 @@ plan_tests $NUM_TESTS
+ 
+ print_test_banner "$TEST_DESC"
+ 
+-isroot=0
+-if [ "$(id -u)" == "0" ]; then
+-	isroot=1
+-fi
+-
+-skip $isroot "Root access is needed. Skipping all tests." "$NUM_TESTS" && exit 0
++check_skip_kernel_test "$NUM_TESTS" && exit 0
+ 
+ system_has_ns=0
+ if [ -d "/proc/$$/ns" ]; then
+diff --git a/tests/regression/ust/rotation-destroy-flush/test_rotation_destroy_flush b/tests/regression/ust/rotation-destroy-flush/test_rotation_destroy_flush
+index 8ef4f0d8c..cee1a2489 100755
+--- a/tests/regression/ust/rotation-destroy-flush/test_rotation_destroy_flush
++++ b/tests/regression/ust/rotation-destroy-flush/test_rotation_destroy_flush
+@@ -126,14 +126,17 @@ TESTS=(
+ TEST_COUNT=${#TESTS[@]}
+ i=0
+ 
+-while [ "$i" -lt "$TEST_COUNT" ]; do
++check_skip_kernel_test $NUM_TESTS ||
++{
++	while [ "$i" -lt "$TEST_COUNT" ]; do
+ 
+-	trap signal_cleanup SIGTERM SIGINT
++		trap signal_cleanup SIGTERM SIGINT
+ 
+-	TRACE_PATH=$(mktemp --tmpdir -d -t tmp.test_rotation_destroy_flush.XXXXXX)
++		TRACE_PATH=$(mktemp -d -t tmp.test_rotation_destroy_flush.XXXXXX)
+ 
+-	# Execute test
+-	${TESTS[$i]}
++		# Execute test
++		${TESTS[$i]}
+ 
+-	let "i++"
+-done
++		let "i++"
++	done
++}
+diff --git a/tests/regression/ust/test_event_perf b/tests/regression/ust/test_event_perf
+index 33aab2981..30086f220 100755
+--- a/tests/regression/ust/test_event_perf
++++ b/tests/regression/ust/test_event_perf
+@@ -119,17 +119,11 @@ plan_tests $NUM_TESTS
+ 
+ print_test_banner "$TEST_DESC"
+ 
+-if [ "$(id -u)" == "0" ]; then
+-        isroot=1
+-else
+-        isroot=0
+-fi
+-
+ start_lttng_sessiond
+ 
+ test_parsing_raw
+ 
+-skip $isroot "Root access is needed. Skipping UST perf tests." 8 ||
++check_skip_kernel_test 8 ||
+ {
+ 	test_event_basic
+ }
+diff --git a/tests/utils/utils.sh b/tests/utils/utils.sh
+index faa87e783..0ccbe05d9 100644
+--- a/tests/utils/utils.sh
++++ b/tests/utils/utils.sh
+@@ -318,6 +318,39 @@ function conf_proc_count()
+ 	echo
+ }
+ 
++# Usage:
++# check_skip_kernel_test [NB_TESTS]
++# Return 0 if disable kernel test was set or current user is not a root user
++# If NB_TESTS passes to function, it would call the skip() to skip number of tests.
++# If NB_TESTS is empty, function just output a reason
++
++function check_skip_kernel_test ()
++{
++	local num_tests="$1"
++
++	# Check for skip test kernel flag
++	if [ "$LTTNG_TOOLS_DISABLE_KERNEL_TESTS" == "1" ]; then
++		if ! test -z "$num_tests"; then
++			skip 0 "LTTNG_TOOLS_DISABLE_KERNEL_TESTS was set. Skipping all tests." "$num_tests"
++		else
++			diag "LTTNG_TOOLS_DISABLE_KERNEL_TESTS was set"
++		fi
++		return 0
++	fi
++
++	# Check if we are running as root
++	if [ "$(id -u)" != "0" ]; then
++		if ! test -z "$num_tests"; then
++			skip 0 "Root access is needed for kernel testing, skipping." "$num_tests"
++		else
++			diag "Root access is needed for kernel testing"
++		fi
++		return 0
++	fi
++
++	return 1
++}
++
+ # Check if base lttng-modules are present.
+ # Bail out on failure
+ function validate_lttng_modules_present ()
+-- 
+2.25.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-tools/run-ptest b/meta/recipes-kernel/lttng/lttng-tools/run-ptest
index bf99322ef2..39d93e2bbf 100755
--- a/meta/recipes-kernel/lttng/lttng-tools/run-ptest
+++ b/meta/recipes-kernel/lttng/lttng-tools/run-ptest
@@ -1,8 +1,33 @@
 #!/bin/sh
 # Without --ignore-exit, the tap harness causes any FAILs within a
 # test plan to raise ERRORs; this is just noise.
+
+#Detecting whether current system has lttng kernel modules
+LTTNG_KMOD_PATH=/lib/modules/$(uname -r)/kernel/lttng-modules/lttng-tracer.ko
+function validate_lttng_modules_present()
+{
+	# Check for loadable modules.
+	if [ -f "$LTTNG_KMOD_PATH" ]; then
+		return 0
+	fi
+
+	# Check for builtin modules.
+	ls /proc/lttng > /dev/null 2>&1
+	if [ $? -eq 0 ]; then
+		return 0
+	fi
+
+	return 1
+}
+
 export LD_LIBRARY_PATH=FIXMEPTESTPATH/tests/utils/testapp/userspace-probe-elf-binary/.libs
 makeargs="LOG_DRIVER_FLAGS=--ignore-exit top_srcdir=FIXMEPTESTPATH top_builddir=FIXMEPTESTPATH"
+
+#If current system doesn't have lttng kernel modules, disable lttng kernel related tests.
+validate_lttng_modules_present || {
+	makeargs="$makeargs LTTNG_TOOLS_DISABLE_KERNEL_TESTS=1"
+}
+
 make -k -t all >error.log 2>&1
 # Can specify a test e.g.:
 # -C tests/regression/ check TESTS='kernel/test_callstack'
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb b/meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb
index 44415fbf2d..08144e271c 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb
@@ -37,6 +37,7 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://lttng-sessiond.service \
            file://disable-tests.patch \
            file://0001-compat-Define-off64_t-as-off_t-on-linux.patch \
+           file://0001-tests-add-check_skip_kernel_test-to-check-root-user-.patch \
            "
 
 SRC_URI[sha256sum] = "ac5baeef9fa690936b1ca01ecd1742da762c2c08511ff1b4e923938d94d0f979"
-- 
2.25.1


