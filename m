Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D15DBC4167B
	for <webhook@archiver.kernel.org>; Fri,  1 Dec 2023 13:30:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.22784.1701437401734090383
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Dec 2023 05:30:01 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0699760636=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3B1BhWrC013712
	for <openembedded-core@lists.openembedded.org>; Fri, 1 Dec 2023 05:30:01 -0800
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uph6dhrce-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 05:30:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i4PCGr3AJfOhRc25SyPNwIhRVxmLYBqzoQK4DVNCjoLUgO215SyLsghsTehIzQxH8GNqIqUMYV60fbhohIcssMRjN9rc7OnpO5vX1sr8twFvOOO4iLhXzUYqenoYtSxVotcbAPY2j3plj8CEI4FJWyQ8+wMu1EWlNqtbtmzwak/t3uXrrelQ7AO1YOufy+FJhm4irOJKHrAK3nuIR12Yy7HHOoxhZ2z74noXdgYlnk+oyc/oLmLWvUr3rHJjFYEpcvhOYLGyS4qv7FgtrvXNCF6YK5sfM9pOPokIB+/yOJ1KYZ3XJ52hG3tYhauCLiLdIDhpomkYz91BsNFdndIMCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RlboqybidPld6Nbzg7YyEG92c8Lhea4lLEsVIHEAQSw=;
 b=bjAZOHkRm4FVt83GWPR/s0XnALUCWO6ZpvavYgmHB8DaGhR1/tvuLTxjhwxiZYDGjj05iOiBX8jhTFfHCifl1ExaZhsSHkngVeKE6MoR4Eo1HNE4tYnSPbA4LB2QhrwsNFRVF/JM0uBxOqRJu1wirtszBvembsSEeKagbbTOYxXvL/5qNaF8DNcczyJgI8F2wa+ooFUVbrQt8J4dvlqNC3kO+LHbP4ltHK8Mwnq0hSvvklT3lzswxg771TySeptCQeBU8iyxVpeJUFo/HFNCO0wmU/J/PRYhEA8S+tgPa08LyEo+yvHX7PvBFkkduTghcN9TlQTFoM9k6EIGdDMWrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by CY8PR11MB7035.namprd11.prod.outlook.com (2603:10b6:930:51::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.28; Fri, 1 Dec
 2023 13:29:57 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::6162:ed58:51f5:efd]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::6162:ed58:51f5:efd%4]) with mapi id 15.20.7046.024; Fri, 1 Dec 2023
 13:29:55 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] lttng-tools: add a flag to test the userspace only
Date: Fri,  1 Dec 2023 22:04:30 +0800
Message-Id: <20231201140430.792362-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0114.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::18) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|CY8PR11MB7035:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b8a244d-bd37-401e-7642-08dbf2719b54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6/iUYXYhn8WmzToTKAfo1KgHmAguFqMYRm8m80PrQ2Yl+cGFCaU3FWzrI7LwpIm690gHCQ9MN/rZRunamgn45WOTer3PwgUmpFcnvrd0V+KXfK+Pptg9lY1FnsTh7pZlekmdBM1J3kP7bmTHM2CZfwvn2ao+gSf6Cy76UV8Q9cCs6xM2N1YMEv4x8ISnfkbaRS1/Don57Co6UXznfs7oHaL8l0SWa5qZsYfb3VA2Jq7CgYWXa/lFmEUdZHmbskV1dQudYq4Qze8VLxwnitIiXBQBVl50DsFtU6cZCWQusZTkcmcVRmVDoCY6SgJ0Mxh1xY8vLFIWVp8obJBdsWf45XgCCgBhaVK6F23XXmgAKXk+6XzCUnI8wOcs0FpyRw0hE5nrPA51odlF+IcaIYgGBp1ej37QR4LuUxFKyIMzWYHz7x0SRTUSTzVgSYczLchF9BPSpCwTFgjCMMhAILi417m805PmoFsXjXJCdUkEnCwInJcqtqrLhaQy8jXyUvNH8tT2Djkem9v/f+kRFW5NgDowLiwSTf38Sarg+WdDJl4WQlXnCfDDx2oJLSdLI3IC9qaQM0CXjZU6QZEmcVByEpXY9BJDAesPxdwhNDLSXAo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(366004)(396003)(346002)(136003)(376002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(83170400001)(1076003)(2616005)(8936002)(6666004)(6506007)(66946007)(8676002)(6916009)(66556008)(44832011)(66476007)(316002)(5660300002)(478600001)(83380400001)(38100700002)(26005)(6486002)(52116002)(6512007)(30864003)(38350700005)(41300700001)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nJvX1zdQ1hi5uau/Grff/ibcpxEM0+33MuTNjdKf0ek/RQ+8TOteocwRepx1?=
 =?us-ascii?Q?7hAIKbDdVm+WIzfY3EvKGzTSCwu4I5Aa7hwQe0TwECoErjVpUdj//ckr2hmD?=
 =?us-ascii?Q?9NrY7s5gEaMPucIapWH7lZSWWDwmAjwloFKhy0HCA1wKnaqsyTTPmAemg5aw?=
 =?us-ascii?Q?St34i+cTusTrEUIoqYZlwtO4PMEj2A/bLLvaVG65NDVTmxVAZKl4PlbwUygY?=
 =?us-ascii?Q?pQ44vWtSK6EWXsMBA/BXGxLa/eg8T/ZZKZbnAAU/PzP3iNs8wOo8B3fwBRjw?=
 =?us-ascii?Q?xcJ7woVNXaA4N6IFQmn1X1L1/yK8p5oLBeBL1H7bpc1u34hWiBagTdPGeqkD?=
 =?us-ascii?Q?piIge/Cvf+lyhtOFTOe+NT2mrmjOUsoXyqJvBKe3DC0dCngULfQ4J0mgfYkO?=
 =?us-ascii?Q?NDHPSpadrgpjcLtadx42PR6WYskTkpUftn5BLpaAQuyWp9qQBRbM+6MoAO30?=
 =?us-ascii?Q?EMnopKpHfvt/cB1giEcBG7wD6doi/1rVw4GzkErDtcFm3E5lVTGynV8SJn0s?=
 =?us-ascii?Q?OqJMVZCCLwxvJ+KG0OjeHO02BZeUVxP10GJgrgj+zsgp78VfikQgZRZglgsX?=
 =?us-ascii?Q?7G/PeLqOF5/QpT7bsWoz/lHbda2wvcdJFgQdycF+LKxu2LwEZGHJ+Vcevl9n?=
 =?us-ascii?Q?uu2YXDCtb9rwg0KwMjGwdnVP/V0Twa20NsfFBOyeAGDlNfEFwHOCVSnU2JQD?=
 =?us-ascii?Q?sNu7llJGGl1ND8mYIreUEvFaR3Az/aOd79TC44JB46cR98JdD/V+fanw4aQ/?=
 =?us-ascii?Q?O4Jn5dZ9sPlteyX4ifn/gbihPQEXvvuipJGhr7Oeb+lX9jjQGfRyg/gj3Ql6?=
 =?us-ascii?Q?N8uVWsXHHaczrNkovRPQQhvQ+e3AOp8OJCgLeCv5Ipm1gu2K2Ll1JDPpsZPc?=
 =?us-ascii?Q?+bXBJTUTJhKZnmx6zdUkEWcYXSgBv2xKoLWUbgSKkHjB+kt+UgLRG9p819KT?=
 =?us-ascii?Q?YtUc5SlscBJg9k1jBa+STl1FeF4flZvyrCx4ceoaWMNnoZz0CeD+v4i4kstQ?=
 =?us-ascii?Q?sWwAnoocmumrcTi9byZLCjjKpj9lZA+9RVjrc6mbzdN9Ci5MJ5eckARzU6Dh?=
 =?us-ascii?Q?ll1SJDw8vZUQTKT88eEEmSR5cEKBzHUMYio25sJObj8ljpUVIoxAWyDg+kZm?=
 =?us-ascii?Q?wWl3Y88ZtbFZlROF27SEOQhft+ak1URmU4VSHpkQY1joU/QGT6MhBQnVRROL?=
 =?us-ascii?Q?K1XmxBHfvVxNIp3t8X9KKCvYsV4mHnQX4ZUlOAz7y5YakLV9stM+JlO3FdXM?=
 =?us-ascii?Q?NbDOlh+Fz942JbymX7YB3R78NN/hd0s9hSaTDPNz09hUwJOb7fuMr+t0agCS?=
 =?us-ascii?Q?TTYNbrM6Q+XC4BoYxecn5NoR6AXtslUbfbOuhcpDxdOdgdjOgmuDxiufAWI7?=
 =?us-ascii?Q?k4a5QhFk+HgqJpChfyX7+Xn8uVy4ynLKjMaN3wEPphMFQcMPKSEnIyqjxSNO?=
 =?us-ascii?Q?Z5qlmu86YhUQmZpNOcSlyCj15Vz1xqzWWq+hub9VmH6gSSAr3xjRnf9tPuqk?=
 =?us-ascii?Q?COgavo26ytXILYidkSJ/8gJVAdOup7+dL5yfDUzJF15OmGJJWJ6P0hUF0PIt?=
 =?us-ascii?Q?46IQr5xZwSwbQ5BqXaJBvACU3x9rEP9cQl1D2bj8mnJBBukpJYVoKA88fTop?=
 =?us-ascii?Q?8A=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b8a244d-bd37-401e-7642-08dbf2719b54
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 13:29:55.7431
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nm2he6/ooMNPsGheHI2ROEU0h10PQSGa2XAibVdqj5QHBB0F2ybV+71WRMqXPlvNj/W4OtNHi9E+MyyRJ6bCJzip6jEnTsGI5+znXCm+2EM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7035
X-Proofpoint-GUID: QLYRFpoPYir4T42wsn2ibg2Jvf5M3q4B
X-Proofpoint-ORIG-GUID: QLYRFpoPYir4T42wsn2ibg2Jvf5M3q4B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2312010092
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Dec 2023 13:30:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191665

From: Xiangyu Chen <xiangyu.chen@windriver.com>

The current tests will run both userspace and kernel testing.
Some of use cases only use lttng for one kind of tracing (e.g. userspace).
If the lttng modules(.ko files) is not present during the test,
it would end up with lots of failing.

This commit separate the tests by allowing a flag to be passed
and marked the kernel related tests as SKIP instead of FAIL
if the modules is not presented.

If running the userspace test, just raise an environment variant
"export SKIP_KERNEL_TEST=1" before running the ptest, it would skip
lttng modules related test. Without SKIP_KERNEL_TEST=1, the ptest
would run all test cases.

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 ...d-flags-to-test-lttng-userspace-only.patch | 862 ++++++++++++++++++
 .../lttng/lttng-tools_2.13.11.bb              |   1 +
 2 files changed, 863 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-Tests-Add-flags-to-test-lttng-userspace-only.patch

diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-Tests-Add-flags-to-test-lttng-userspace-only.patch b/meta/recipes-kernel/lttng/lttng-tools/0001-Tests-Add-flags-to-test-lttng-userspace-only.patch
new file mode 100644
index 0000000000..4678348347
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-tools/0001-Tests-Add-flags-to-test-lttng-userspace-only.patch
@@ -0,0 +1,862 @@
+From 747c8ff5eac97533ee21fe50618fa4bfc575d533 Mon Sep 17 00:00:00 2001
+From: Xiangyu Chen <xiangyu.chen@windriver.com>
+Date: Wed, 29 Nov 2023 08:16:23 +0000
+Subject: [PATCH] Tests: Add flags to test lttng userspace only
+
+The current tests will run both userspace and kernel testing.
+Some of use cases only use lttng for one kind of tracing on an embedded device (e.g. userspace)
+If the lttng modules(.ko files) is not present during the test, it would end up with lots
+of failing.
+
+This commit separate the tests by allowing a flag to be passed and marked the kernel related
+tests as SKIP instead of FAIL if the modules is not presented.
+
+e.g. before running the tests with make, add a flag to environment like "export SKIP_KERNEL_TEST=1"
+the test cases would skip kernel test.
+
+Tested with this commit under a local setup, the result as below:
+
+====================================================
+lttng-tools 2.13.11: tests/unit/test-suite.log
+====================================================
+     TOTAL: 1032
+     PASS:  1032
+     SKIP:  0
+     XFAIL: 0
+     FAIL:  0
+     XPASS: 0
+     ERROR: 0
+    .. contents:: :depth: 2
+==========================================================
+lttng-tools 2.13.11: tests/regression/test-suite.log
+==========================================================
+     TOTAL: 11091
+     PASS:  7243
+     SKIP:  3848
+     XFAIL: 0
+     FAIL:  0
+     XPASS: 0
+     ERROR: 0
+    .. contents:: :depth: 2
+    PASS: tools/filtering/test_valid_filter
+=======================================
+
+Upstream-Status: Submitted [https://github.com/lttng/lttng-tools/pull/166]
+
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ tests/destructive/metadata-regeneration       |  1 +
+ tests/perf/test_perf_raw.in                   |  1 +
+ tests/regression/kernel/test_all_events       |  5 +++
+ tests/regression/kernel/test_callstack        |  5 +++
+ tests/regression/kernel/test_channel          |  5 +++
+ tests/regression/kernel/test_clock_override   |  5 +++
+ tests/regression/kernel/test_event_basic      |  5 +++
+ tests/regression/kernel/test_kernel_function  |  5 +++
+ tests/regression/kernel/test_lttng_logger     |  5 +++
+ tests/regression/kernel/test_ns_contexts      |  4 ++
+ .../regression/kernel/test_ns_contexts_change |  4 ++
+ .../kernel/test_rotation_destroy_flush        |  5 +++
+ .../regression/kernel/test_select_poll_epoll  |  5 +++
+ tests/regression/kernel/test_syscall          |  5 +++
+ tests/regression/kernel/test_userspace_probe  |  5 +++
+ tests/regression/tools/clear/test_kernel      |  5 +++
+ .../tools/filtering/test_valid_filter         |  6 +++
+ tests/regression/tools/health/test_thread_ok  |  7 +++
+ tests/regression/tools/live/test_kernel       |  5 +++
+ tests/regression/tools/live/test_lttng_kernel |  5 +++
+ tests/regression/tools/metadata/test_kernel   |  5 +++
+ .../test_notification_kernel_buffer_usage     | 43 +++++++++++--------
+ .../test_notification_kernel_capture          | 32 ++++++++------
+ .../test_notification_kernel_error            | 32 ++++++++------
+ .../test_notification_kernel_instrumentation  | 33 ++++++++------
+ .../notification/test_notification_multi_app  | 28 +++++++-----
+ ...test_notification_notifier_discarded_count |  5 +++
+ .../tools/regen-metadata/test_kernel          |  5 +++
+ .../tools/regen-statedump/test_kernel         |  5 +++
+ tests/regression/tools/rotation/test_kernel   |  5 +++
+ tests/regression/tools/snapshots/test_kernel  |  5 +++
+ .../tools/tracker/test_event_tracker          |  6 +++
+ .../tools/trigger/test_add_trigger_cli        |  9 ++++
+ .../tools/trigger/test_list_triggers_cli      |  6 ++-
+ .../tools/wildcard/test_event_wildcard        |  6 +++
+ .../test_rotation_destroy_flush               |  5 +++
+ 36 files changed, 259 insertions(+), 64 deletions(-)
+
+diff --git a/tests/destructive/metadata-regeneration b/tests/destructive/metadata-regeneration
+index b81e7af32..91d7df589 100755
+--- a/tests/destructive/metadata-regeneration
++++ b/tests/destructive/metadata-regeneration
+@@ -197,6 +197,7 @@ if ! destructive_tests_enabled ; then
+ 	exit 0
+ fi
+ 
++skip $SKIP_KERNEL_TEST -ne 0 "SKIP_KERNEL_TEST was enabled. Skipping all tests." $NUM_TESTS ||
+ skip $isroot "Root access is needed. Skipping all tests." $NUM_TESTS ||
+ {
+ 	start_lttng_relayd "-o $TRACE_PATH"
+diff --git a/tests/perf/test_perf_raw.in b/tests/perf/test_perf_raw.in
+index f293ccd71..4b61cc927 100644
+--- a/tests/perf/test_perf_raw.in
++++ b/tests/perf/test_perf_raw.in
+@@ -154,6 +154,7 @@ have_libpfm
+ 
+ test_ust_raw
+ 
++skip $SKIP_KERNEL_TEST -ne 0 "SKIP_KERNEL_TEST was enabled, skipping." 9 ||
+ skip $isroot "Root access is needed for kernel testing, skipping." 9 ||
+ {
+ 	modprobe lttng-test
+diff --git a/tests/regression/kernel/test_all_events b/tests/regression/kernel/test_all_events
+index 2e20888df..3dc8102ae 100755
+--- a/tests/regression/kernel/test_all_events
++++ b/tests/regression/kernel/test_all_events
+@@ -49,6 +49,11 @@ else
+ 	isroot=0
+ fi
+ 
++if [ "$SKIP_KERNEL_TEST" == "1" ]; then
++        skip 0 "SKIP_KERNEL_TEST was enabled, skipping." $NUM_TESTS
++        exit 1
++fi
++
+ skip $isroot "Root access is needed. Skipping all tests." $NUM_TESTS ||
+ {
+ 	validate_lttng_modules_present
+diff --git a/tests/regression/kernel/test_callstack b/tests/regression/kernel/test_callstack
+index a4477fd7c..934e504df 100755
+--- a/tests/regression/kernel/test_callstack
++++ b/tests/regression/kernel/test_callstack
+@@ -140,6 +140,11 @@ else
+ 	isroot=0
+ fi
+ 
++if [ "$SKIP_KERNEL_TEST" == "1" ]; then
++        skip 0 "SKIP_KERNEL_TEST was enabled, skipping." $NUM_TESTS
++        exit 1
++fi
++
+ skip $isroot "Root access is needed. Skipping all tests." "$NUM_TESTS" ||
+ {
+ 	validate_lttng_modules_present
+diff --git a/tests/regression/kernel/test_channel b/tests/regression/kernel/test_channel
+index 9cc74c4e8..b8f9835a5 100755
+--- a/tests/regression/kernel/test_channel
++++ b/tests/regression/kernel/test_channel
+@@ -53,6 +53,11 @@ else
+ 	isroot=0
+ fi
+ 
++if [ "$SKIP_KERNEL_TEST" == "1" ]; then
++        skip 0 "SKIP_KERNEL_TEST was enabled, skipping." $NUM_TESTS
++        exit 1
++fi
++
+ skip $isroot "Root access is needed. Skipping all tests." $NUM_TESTS ||
+ {
+ 	start_lttng_sessiond
+diff --git a/tests/regression/kernel/test_clock_override b/tests/regression/kernel/test_clock_override
+index 72892898b..63c0e6350 100755
+--- a/tests/regression/kernel/test_clock_override
++++ b/tests/regression/kernel/test_clock_override
+@@ -178,6 +178,11 @@ else
+ 	isroot=0
+ fi
+ 
++if [ "$SKIP_KERNEL_TEST" == "1" ]; then
++	skip 0 "SKIP_KERNEL_TEST was enabled, skipping." $NUM_TESTS
++	exit 1
++fi
++
+ skip $isroot "Root access is needed. Skipping all tests." $NUM_TESTS ||
+ {
+ 	validate_lttng_modules_present
+diff --git a/tests/regression/kernel/test_event_basic b/tests/regression/kernel/test_event_basic
+index ac9ec0549..5e57f15d4 100755
+--- a/tests/regression/kernel/test_event_basic
++++ b/tests/regression/kernel/test_event_basic
+@@ -79,6 +79,11 @@ else
+ 	isroot=0
+ fi
+ 
++if [ "$SKIP_KERNEL_TEST" == "1" ]; then
++        skip 0 "SKIP_KERNEL_TEST was enabled, skipping." $NUM_TESTS
++        exit 1
++fi
++
+ skip $isroot "Root access is needed. Skipping all tests." $NUM_TESTS ||
+ {
+ 	validate_lttng_modules_present
+diff --git a/tests/regression/kernel/test_kernel_function b/tests/regression/kernel/test_kernel_function
+index b1d5491fc..9865c8b55 100755
+--- a/tests/regression/kernel/test_kernel_function
++++ b/tests/regression/kernel/test_kernel_function
+@@ -49,6 +49,11 @@ else
+ 	isroot=0
+ fi
+ 
++if [ "$SKIP_KERNEL_TEST" == "1" ]; then
++	skip 0 "SKIP_KERNEL_TEST was enabled, skipping." $NUM_TESTS
++	exit 1
++fi
++
+ skip $isroot "Root access is needed. Skipping all tests." $NUM_TESTS ||
+ {
+ 	start_lttng_sessiond_notap
+diff --git a/tests/regression/kernel/test_lttng_logger b/tests/regression/kernel/test_lttng_logger
+index b8f7ded82..6f691aee3 100755
+--- a/tests/regression/kernel/test_lttng_logger
++++ b/tests/regression/kernel/test_lttng_logger
+@@ -116,6 +116,11 @@ else
+ 	isroot=0
+ fi
+ 
++if [ "$SKIP_KERNEL_TEST" == "1" ]; then
++        skip 0 "SKIP_KERNEL_TEST was enabled, skipping." $NUM_TESTS
++        exit 1
++fi
++
+ skip $isroot "Root access is needed. Skipping all tests." $NUM_TESTS ||
+ {
+ 	validate_lttng_modules_present
+diff --git a/tests/regression/kernel/test_ns_contexts b/tests/regression/kernel/test_ns_contexts
+index 0c8718d78..ce358bfbc 100755
+--- a/tests/regression/kernel/test_ns_contexts
++++ b/tests/regression/kernel/test_ns_contexts
+@@ -115,6 +115,10 @@ fi
+ 
+ skip $isroot "Root access is needed. Skipping all tests." "$NUM_TESTS" && exit 0
+ 
++if [ "$SKIP_KERNEL_TEST" == "1" ]; then
++        skip 0 "SKIP_KERNEL_TEST was enabled, skipping." $NUM_TESTS
++        exit 0
++fi
+ 
+ system_has_ns=0
+ if [ -d "/proc/$$/ns" ]; then
+diff --git a/tests/regression/kernel/test_ns_contexts_change b/tests/regression/kernel/test_ns_contexts_change
+index 42a61276b..de4045ed5 100755
+--- a/tests/regression/kernel/test_ns_contexts_change
++++ b/tests/regression/kernel/test_ns_contexts_change
+@@ -170,6 +170,10 @@ fi
+ 
+ skip $isroot "Root access is needed. Skipping all tests." "$NUM_TESTS" && exit 0
+ 
++if [ "$SKIP_KERNEL_TEST" == "1" ]; then
++        skip 0 "SKIP_KERNEL_TEST was enabled, skipping." $NUM_TESTS
++        exit 1
++fi
+ 
+ system_has_ns=0
+ if [ -d "/proc/$$/ns" ]; then
+diff --git a/tests/regression/kernel/test_rotation_destroy_flush b/tests/regression/kernel/test_rotation_destroy_flush
+index cb773d7df..d06b04229 100755
+--- a/tests/regression/kernel/test_rotation_destroy_flush
++++ b/tests/regression/kernel/test_rotation_destroy_flush
+@@ -126,6 +126,11 @@ else
+ 	isroot=0
+ fi
+ 
++if [ "$SKIP_KERNEL_TEST" == "1" ]; then
++	skip 0 "SKIP_KERNEL_TEST was enabled, skipping." $NUM_TESTS
++	exit 1
++fi
++
+ skip $isroot "Root access is needed. Skipping all tests." $NUM_TESTS ||
+ {
+ 	validate_lttng_modules_present
+diff --git a/tests/regression/kernel/test_select_poll_epoll b/tests/regression/kernel/test_select_poll_epoll
+index d8245a0e7..1372fe930 100755
+--- a/tests/regression/kernel/test_select_poll_epoll
++++ b/tests/regression/kernel/test_select_poll_epoll
+@@ -380,6 +380,11 @@ else
+ 	isroot=0
+ fi
+ 
++if [ "$SKIP_KERNEL_TEST" == "1" ]; then
++        skip 0 "SKIP_KERNEL_TEST was enabled, skipping." $NUM_TESTS
++        exit 1
++fi
++
+ skip $isroot "Root access is needed. Skipping all tests." $NUM_TESTS ||
+ {
+ 	validate_lttng_modules_present
+diff --git a/tests/regression/kernel/test_syscall b/tests/regression/kernel/test_syscall
+index 401a18a8d..b3b8e5e98 100755
+--- a/tests/regression/kernel/test_syscall
++++ b/tests/regression/kernel/test_syscall
+@@ -670,6 +670,11 @@ else
+ 	isroot=0
+ fi
+ 
++if [ "$SKIP_KERNEL_TEST" == "1" ]; then
++        skip 0 "SKIP_KERNEL_TEST was enabled, skipping." $NUM_TESTS
++        exit 1
++fi
++
+ skip $isroot "Root access is needed. Skipping all tests." $NUM_TESTS ||
+ {
+ 	validate_lttng_modules_present
+diff --git a/tests/regression/kernel/test_userspace_probe b/tests/regression/kernel/test_userspace_probe
+index 1091ee65e..17582f909 100755
+--- a/tests/regression/kernel/test_userspace_probe
++++ b/tests/regression/kernel/test_userspace_probe
+@@ -821,6 +821,11 @@ else
+ 	isroot=0
+ fi
+ 
++if [ "$SKIP_KERNEL_TEST" == "1" ]; then
++        skip 0 "SKIP_KERNEL_TEST was enabled, skipping." $NUM_TESTS
++        exit 1
++fi
++
+ skip $isroot "Root access is needed. Skipping all tests." $NUM_TESTS ||
+ {
+ 	validate_lttng_modules_present
+diff --git a/tests/regression/tools/clear/test_kernel b/tests/regression/tools/clear/test_kernel
+index 06fb1c368..46de64d88 100755
+--- a/tests/regression/tools/clear/test_kernel
++++ b/tests/regression/tools/clear/test_kernel
+@@ -563,6 +563,11 @@ snapshot_tests=(test_kernel_streaming_snapshot
+ 	test_kernel_local_snapshot
+ )
+ 
++if [ "$SKIP_KERNEL_TEST" == "1" ]; then
++        skip 0 "SKIP_KERNEL_TEST was enabled, skipping." $NUM_TESTS
++        exit 1
++fi
++
+ skip $isroot "Root access is needed. Skipping all kernel streaming tests." $NUM_TESTS ||
+ {
+ 	trap signal_cleanup SIGTERM SIGINT
+diff --git a/tests/regression/tools/filtering/test_valid_filter b/tests/regression/tools/filtering/test_valid_filter
+index e76ffa25f..b3aa3d07f 100755
+--- a/tests/regression/tools/filtering/test_valid_filter
++++ b/tests/regression/tools/filtering/test_valid_filter
+@@ -1458,6 +1458,12 @@ else
+ 	isroot=0
+ fi
+ 
++if [ "$SKIP_KERNEL_TEST" == "1" ]; then
++        skip 0 "SKIP_KERNEL_TEST was enabled, skipping." $NUM_KERNEL_TESTS
++        stop_lttng_sessiond
++        exit 1
++fi
++
+ skip $isroot "Root access is needed. Skipping all kernel valid filter tests." $NUM_KERNEL_TESTS ||
+ {
+ 	diag "Test kernel valid filters"
+diff --git a/tests/regression/tools/health/test_thread_ok b/tests/regression/tools/health/test_thread_ok
+index e84adb611..baaa40bf9 100755
+--- a/tests/regression/tools/health/test_thread_ok
++++ b/tests/regression/tools/health/test_thread_ok
+@@ -67,6 +67,7 @@ function test_thread_ok
+ 	$CURDIR/$HEALTH_CHECK_BIN > ${STDOUT_PATH} 2> ${STDERR_PATH}
+ 	report_errors
+ 
++	skip $ist_skip "SKIP_KERNEL_TEST was enabled. Skipping kernel consumer health check test." "5" ||
+ 	skip $isroot "Root access is needed. Skipping kernel consumer health check test." "5" ||
+ 	{
+ 		diag "With kernel consumer daemon"
+@@ -122,6 +123,12 @@ else
+ 	isroot=0
+ fi
+ 
++if [ "$SKIP_KERNEL_TEST" == "1" ]; then
++	ist_skip=0
++else
++	ist_skip=1
++fi
++
+ test_thread_ok
+ 
+ rm -rf ${HEALTH_PATH}
+diff --git a/tests/regression/tools/live/test_kernel b/tests/regression/tools/live/test_kernel
+index b622b5214..275aa19bc 100755
+--- a/tests/regression/tools/live/test_kernel
++++ b/tests/regression/tools/live/test_kernel
+@@ -39,6 +39,11 @@ function clean_live_tracing()
+ 	rm -rf $TRACE_PATH
+ }
+ 
++if [ "$SKIP_KERNEL_TEST" == "1" ]; then
++	plan_skip_all "SKIP_KERNEL_TEST was enabled. Skipping all tests."
++	exit 0
++fi
++
+ # Need root access for kernel tracing.
+ if [ "$(id -u)" == "0" ]; then
+ 	isroot=1
+diff --git a/tests/regression/tools/live/test_lttng_kernel b/tests/regression/tools/live/test_lttng_kernel
+index a23d9373a..d028e03f3 100755
+--- a/tests/regression/tools/live/test_lttng_kernel
++++ b/tests/regression/tools/live/test_lttng_kernel
+@@ -51,6 +51,11 @@ else
+ 	isroot=0
+ fi
+ 
++if [ "$SKIP_KERNEL_TEST" == "1" ]; then
++        skip 0 "SKIP_KERNEL_TEST was enabled, skipping." $NUM_TESTS
++        exit 1
++fi
++
+ skip $isroot "Root access is needed. Skipping all tests." $NUM_TESTS ||
+ {
+ 	modprobe lttng-test
+diff --git a/tests/regression/tools/metadata/test_kernel b/tests/regression/tools/metadata/test_kernel
+index 57cace6ea..d56838f43 100755
+--- a/tests/regression/tools/metadata/test_kernel
++++ b/tests/regression/tools/metadata/test_kernel
+@@ -97,6 +97,11 @@ else
+ 	isroot=0
+ fi
+ 
++if [ "$SKIP_KERNEL_TEST" == "1" ]; then
++        skip 0 "SKIP_KERNEL_TEST was enabled, skipping." $NUM_TESTS
++        exit 1
++fi
++
+ skip $isroot "Root access is needed. Skipping all kernel metadata tests." $NUM_TESTS ||
+ {
+ 	validate_lttng_modules_present
+diff --git a/tests/regression/tools/notification/test_notification_kernel_buffer_usage b/tests/regression/tools/notification/test_notification_kernel_buffer_usage
+index 76e69a77e..b17d73ca0 100755
+--- a/tests/regression/tools/notification/test_notification_kernel_buffer_usage
++++ b/tests/regression/tools/notification/test_notification_kernel_buffer_usage
+@@ -60,29 +60,38 @@ function test_buffer_usage_notification
+ 	wait $APP_PID 2> /dev/null
+ }
+ 
+-if [ "$(id -u)" == "0" ]; then
++if [ "$SKIP_KERNEL_TEST" == "1" ]; then
++        skiptest=0
++else
++        skiptest=1
++fi
+ 
+-	validate_lttng_modules_present
++skip $skiptest "SKIP_KERNEL_TEST was enabled. Skipping all tests." $NUM_TESTS ||
++{
++	if [ "$(id -u)" == "0" ]; then
+ 
++		validate_lttng_modules_present
+ 
+-	modprobe lttng-test
+ 
+-	# Used on sessiond launch.
+-	LTTNG_SESSIOND_ENV_VARS="LTTNG_TESTPOINT_ENABLE=1 \
+-		CONSUMER_PAUSE_PIPE_PATH=${TESTPOINT_PIPE_PATH} \
+-		LD_PRELOAD=${TESTPOINT}"
+-	start_lttng_sessiond_notap
++		modprobe lttng-test
+ 
+-	test_buffer_usage_notification
++		# Used on sessiond launch.
++		LTTNG_SESSIOND_ENV_VARS="LTTNG_TESTPOINT_ENABLE=1 \
++			CONSUMER_PAUSE_PIPE_PATH=${TESTPOINT_PIPE_PATH} \
++			LD_PRELOAD=${TESTPOINT}"
++		start_lttng_sessiond_notap
+ 
+-	stop_lttng_sessiond_notap
+-	rmmod lttng-test
++		test_buffer_usage_notification
+ 
+-	rm -rf "${consumerd_pipe[@]}" 2> /dev/null
+-else
+-	# Kernel tests are skipped.
+-	plan_tests $NUM_TESTS
+-	skip 0 "Root access is needed. Skipping all kernel notification tests." $NUM_TESTS
+-fi
++		stop_lttng_sessiond_notap
++		rmmod lttng-test
++
++		rm -rf "${consumerd_pipe[@]}" 2> /dev/null
++	else
++		# Kernel tests are skipped.
++		plan_tests $NUM_TESTS
++		skip 0 "Root access is needed. Skipping all kernel notification tests." $NUM_TESTS
++	fi
++}
+ 
+ rm -rf "$TEST_TMPDIR"
+diff --git a/tests/regression/tools/notification/test_notification_kernel_capture b/tests/regression/tools/notification/test_notification_kernel_capture
+index 88f123d3d..e99825194 100755
+--- a/tests/regression/tools/notification/test_notification_kernel_capture
++++ b/tests/regression/tools/notification/test_notification_kernel_capture
+@@ -30,23 +30,31 @@ function test_basic_error_path
+ 	wait $APP_PID 2> /dev/null
+ }
+ 
++if [ "$SKIP_KERNEL_TEST" == "1" ]; then
++        skiptest=0
++else
++        skiptest=1
++fi
+ 
+-if [ "$(id -u)" == "0" ]; then
+-	validate_lttng_modules_present
++skip $skiptest "SKIP_KERNEL_TEST was enabled. Skipping all tests." $NUM_TESTS ||
++{
++	if [ "$(id -u)" == "0" ]; then
++		validate_lttng_modules_present
+ 
+-	modprobe lttng-test
++		modprobe lttng-test
+ 
+-	start_lttng_sessiond_notap
++		start_lttng_sessiond_notap
+ 
+-	test_basic_error_path
++		test_basic_error_path
+ 
+-	stop_lttng_sessiond_notap
+-	rmmod lttng-test
++		stop_lttng_sessiond_notap
++		rmmod lttng-test
+ 
+-else
+-	# Kernel tests are skipped.
+-	plan_tests $NUM_TESTS
+-	skip 0 "Root access is needed. Skipping all kernel notification tests." $NUM_TESTS
+-fi
++	else
++		# Kernel tests are skipped.
++		plan_tests $NUM_TESTS
++		skip 0 "Root access is needed. Skipping all kernel notification tests." $NUM_TESTS
++	fi
++}
+ 
+ rm -f "$TESTAPP_STATE_PATH"
+diff --git a/tests/regression/tools/notification/test_notification_kernel_error b/tests/regression/tools/notification/test_notification_kernel_error
+index 80fe6e5b5..ef1abf97e 100755
+--- a/tests/regression/tools/notification/test_notification_kernel_error
++++ b/tests/regression/tools/notification/test_notification_kernel_error
+@@ -30,23 +30,31 @@ function test_basic_error_path
+ 	wait $APP_PID 2> /dev/null
+ }
+ 
++if [ "$SKIP_KERNEL_TEST" == "1" ]; then
++	skiptest=0
++else
++	skiptest=1
++fi
+ 
+-if [ "$(id -u)" == "0" ]; then
+-	validate_lttng_modules_present
++skip $skiptest "SKIP_KERNEL_TEST was enabled. Skipping all tests." $NUM_TESTS ||
++{
++	if [ "$(id -u)" == "0" ]; then
++		validate_lttng_modules_present
+ 
+-	modprobe lttng-test
++		modprobe lttng-test
+ 
+-	start_lttng_sessiond_notap
++		start_lttng_sessiond_notap
+ 
+-	test_basic_error_path
++		test_basic_error_path
+ 
+-	stop_lttng_sessiond_notap
+-	rmmod lttng-test
++		stop_lttng_sessiond_notap
++		rmmod lttng-test
+ 
+-else
+-	# Kernel tests are skipped.
+-	plan_tests $NUM_TESTS
+-	skip 0 "Root access is needed. Skipping all kernel notification tests." $NUM_TESTS
+-fi
++	else
++		# Kernel tests are skipped.
++		plan_tests $NUM_TESTS
++		skip 0 "Root access is needed. Skipping all kernel notification tests." $NUM_TESTS
++	fi
++}
+ 
+ rm -f "$TESTAPP_STATE_PATH"
+diff --git a/tests/regression/tools/notification/test_notification_kernel_instrumentation b/tests/regression/tools/notification/test_notification_kernel_instrumentation
+index 90545a541..6750475d9 100755
+--- a/tests/regression/tools/notification/test_notification_kernel_instrumentation
++++ b/tests/regression/tools/notification/test_notification_kernel_instrumentation
+@@ -28,22 +28,31 @@ function test_kernel_instrumentation_notification
+ 	wait $APP_PID 2> /dev/null
+ }
+ 
+-if [ "$(id -u)" == "0" ]; then
+-	validate_lttng_modules_present
++if [ "$SKIP_KERNEL_TEST" == "1" ]; then
++        skiptest=0
++else
++        skiptest=1
++fi
+ 
+-	modprobe lttng-test
++skip $skiptest "SKIP_KERNEL_TEST was enabled. Skipping all tests." $NUM_TESTS ||
++{
++	if [ "$(id -u)" == "0" ]; then
++		validate_lttng_modules_present
+ 
+-	start_lttng_sessiond_notap
++		modprobe lttng-test
+ 
+-	test_kernel_instrumentation_notification
++		start_lttng_sessiond_notap
+ 
+-	stop_lttng_sessiond_notap
+-	rmmod lttng-test
++		test_kernel_instrumentation_notification
+ 
+-else
+-	# Kernel tests are skipped.
+-	plan_tests $NUM_TESTS
+-	skip 0 "Root access is needed. Skipping all kernel notification tests." $NUM_TESTS
+-fi
++		stop_lttng_sessiond_notap
++		rmmod lttng-test
++
++	else
++		# Kernel tests are skipped.
++		plan_tests $NUM_TESTS
++		skip 0 "Root access is needed. Skipping all kernel notification tests." $NUM_TESTS
++	fi
++}
+ 
+ rm -f "$TESTAPP_STATE_PATH"
+diff --git a/tests/regression/tools/notification/test_notification_multi_app b/tests/regression/tools/notification/test_notification_multi_app
+index d8b639225..1ccbd109e 100755
+--- a/tests/regression/tools/notification/test_notification_multi_app
++++ b/tests/regression/tools/notification/test_notification_multi_app
+@@ -427,16 +427,24 @@ else
+         skip 0 "Root access is needed. Skipping all kernel multi-app notification tests." $NUM_TEST_KERNEL
+ fi
+ 
++if [ "$SKIP_KERNEL_TEST" == "1" ]; then
++        skiptest=0
++else
++        skiptest=1
++fi
+ 
+-for fct_test in ${TESTS[@]};
+-do
+-	TRACE_PATH=$(mktemp --tmpdir -d tmp.test_notification_multi_app_trace_path.XXXXXX)
++skip $skiptest "SKIP_KERNEL_TEST was enabled. Skipping all tests." $NUM_TEST_KERNEL ||
++{
++	for fct_test in ${TESTS[@]};
++	do
++		TRACE_PATH=$(mktemp --tmpdir -d tmp.test_notification_multi_app_trace_path.XXXXXX)
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
+index c9235393e..9798e72c1 100755
+--- a/tests/regression/tools/notification/test_notification_notifier_discarded_count
++++ b/tests/regression/tools/notification/test_notification_notifier_discarded_count
+@@ -391,6 +391,11 @@ function test_ust_notifier_discarded_regardless_trigger_owner
+ test_ust_notifier_discarded_count
+ test_ust_notifier_discarded_count_max_bucket
+ 
++if [ "$SKIP_KERNEL_TEST" == "1" ]; then
++        skip 0 "SKIP_KERNEL_TEST was enabled, skipping." $KERNEL_NUM_TESTS
++        exit 1
++fi
++
+ if [ "$(id -u)" == "0" ]; then
+ 
+ 	validate_lttng_modules_present
+diff --git a/tests/regression/tools/regen-metadata/test_kernel b/tests/regression/tools/regen-metadata/test_kernel
+index 49eea32a7..7bb884c8e 100755
+--- a/tests/regression/tools/regen-metadata/test_kernel
++++ b/tests/regression/tools/regen-metadata/test_kernel
+@@ -105,6 +105,11 @@ else
+ 	isroot=0
+ fi
+ 
++if [ "$SKIP_KERNEL_TEST" == "1" ]; then
++        skip 0 "SKIP_KERNEL_TEST was enabled, skipping." $NUM_TESTS
++        exit 1
++fi
++
+ skip $isroot "Root access is needed. Skipping all kernel streaming tests." $NUM_TESTS ||
+ {
+ 	validate_lttng_modules_present
+diff --git a/tests/regression/tools/regen-statedump/test_kernel b/tests/regression/tools/regen-statedump/test_kernel
+index 8a261355d..5248af0be 100755
+--- a/tests/regression/tools/regen-statedump/test_kernel
++++ b/tests/regression/tools/regen-statedump/test_kernel
+@@ -45,6 +45,11 @@ else
+ 	isroot=0
+ fi
+ 
++if [ "$SKIP_KERNEL_TEST" == "1" ]; then
++        skip 0 "SKIP_KERNEL_TEST was enabled, skipping." $NUM_TESTS
++        exit 1
++fi
++
+ skip $isroot "Root access is needed. Skipping all kernel streaming tests." $NUM_TESTS ||
+ {
+ 	validate_lttng_modules_present
+diff --git a/tests/regression/tools/rotation/test_kernel b/tests/regression/tools/rotation/test_kernel
+index f5f1f5553..a687a305f 100755
+--- a/tests/regression/tools/rotation/test_kernel
++++ b/tests/regression/tools/rotation/test_kernel
+@@ -88,6 +88,11 @@ else
+ 	isroot=0
+ fi
+ 
++if [ "$SKIP_KERNEL_TEST" == "1" ]; then
++        skip 0 "SKIP_KERNEL_TEST was enabled, skipping." $NUM_TESTS
++        exit 1
++fi
++
+ skip $isroot "Root access is needed. Skipping all kernel streaming tests." $NUM_TESTS ||
+ {
+ 	validate_lttng_modules_present
+diff --git a/tests/regression/tools/snapshots/test_kernel b/tests/regression/tools/snapshots/test_kernel
+index abb243563..eecad7cef 100755
+--- a/tests/regression/tools/snapshots/test_kernel
++++ b/tests/regression/tools/snapshots/test_kernel
+@@ -223,6 +223,11 @@ else
+ 	isroot=0
+ fi
+ 
++if [ "$SKIP_KERNEL_TEST" == "1" ]; then
++        skip 0 "SKIP_KERNEL_TEST was enabled, skipping." $NUM_TESTS
++        exit 1
++fi
++
+ skip $isroot "Root access is needed. Skipping all kernel snapshot tests" $NUM_TESTS ||
+ {
+ 
+diff --git a/tests/regression/tools/tracker/test_event_tracker b/tests/regression/tools/tracker/test_event_tracker
+index cc0f698d2..070cb4607 100755
+--- a/tests/regression/tools/tracker/test_event_tracker
++++ b/tests/regression/tools/tracker/test_event_tracker
+@@ -472,6 +472,12 @@ else
+ 	isroot=0
+ fi
+ 
++if [ "$SKIP_KERNEL_TEST" == "1" ]; then
++        skip 0 "SKIP_KERNEL_TEST was enabled, skipping." $NUM_KERNEL_TESTS
++        stop_lttng_sessiond
++        exit 1
++fi
++
+ skip $isroot "Root access is needed. Skipping all kernel tracker tests." $NUM_KERNEL_TESTS ||
+ {
+ 	diag "Test kernel tracker"
+diff --git a/tests/regression/tools/trigger/test_add_trigger_cli b/tests/regression/tools/trigger/test_add_trigger_cli
+index 98ecf6272..d756d5a74 100755
+--- a/tests/regression/tools/trigger/test_add_trigger_cli
++++ b/tests/regression/tools/trigger/test_add_trigger_cli
+@@ -40,6 +40,12 @@ else
+ 	ist_root=0
+ fi
+ 
++if [ "$SKIP_KERNEL_TEST" == "1" ]; then
++        ist_skip=0
++else
++        ist_skip=1
++fi
++
+ function test_success ()
+ {
+ 	local test_name="$1"
+@@ -223,6 +229,7 @@ test_success "--exclude-name two" "trigger5" \
+ 	--condition event-rule-matches --type=user --name='jean-*' --exclude-name jean-chretien -x jean-charest \
+ 	--action notify
+ 
++skip $ist_skip "SKIP_KERNEL_TEST: skipping kprobe tests" 18 ||
+ skip $ist_root "non-root user: skipping kprobe tests" 18 || {
+ 	i=0
+ 
+@@ -262,6 +269,7 @@ skip $ist_root "non-root user: skipping kprobe tests" 18 || {
+ 	done
+ }
+ 
++skip $ist_skip "SKIP_KERNEL_TEST: skipping uprobe tests" 6 ||
+ skip $ist_root "non-root user: skipping uprobe tests" 6 || {
+ 	test_success "--condition event-rule-matches uprobe" "uprobe-trigger-0" \
+ 		--name="uprobe-trigger-0" \
+@@ -274,6 +282,7 @@ skip $ist_root "non-root user: skipping uprobe tests" 6 || {
+ 		--action notify
+ }
+ 
++skip $ist_skip "SKIP_KERNEL_TEST: skipping syscall tests" 30 ||
+ skip $ist_root "non-root user: skipping syscall tests" 30 || {
+ 	test_success "--condition event-rule-matches one syscall" "syscall-trigger-0" \
+ 		--name="syscall-trigger-0" \
+diff --git a/tests/regression/tools/trigger/test_list_triggers_cli b/tests/regression/tools/trigger/test_list_triggers_cli
+index a04018013..659ac4bde 100755
+--- a/tests/regression/tools/trigger/test_list_triggers_cli
++++ b/tests/regression/tools/trigger/test_list_triggers_cli
+@@ -51,7 +51,6 @@ else
+ 	hast_sdt_binary=0
+ fi
+ 
+-
+ test_top_level_options ()
+ {
+ 	diag "Listing top level options"
+@@ -2690,6 +2689,11 @@ test_notify_action ()
+ 
+ plan_tests $NUM_TESTS
+ 
++if [ "$SKIP_KERNEL_TEST" == "1" ]; then
++        skip 0 "SKIP_KERNEL_TEST was enabled, skipping." $NUM_TESTS
++        exit 0
++fi
++
+ # shellcheck disable=SC2119
+ start_lttng_sessiond_notap
+ 
+diff --git a/tests/regression/tools/wildcard/test_event_wildcard b/tests/regression/tools/wildcard/test_event_wildcard
+index f69baffc4..584d97923 100755
+--- a/tests/regression/tools/wildcard/test_event_wildcard
++++ b/tests/regression/tools/wildcard/test_event_wildcard
+@@ -130,6 +130,12 @@ else
+ 	isroot=0
+ fi
+ 
++if [ "$SKIP_KERNEL_TEST" == "1" ]; then
++        skip 0 "SKIP_KERNEL_TEST was enabled, skipping." $NUM_KERNEL_TESTS
++        stop_lttng_sessiond
++        exit 1
++fi
++
+ skip $isroot "Root access is needed. Skipping all kernel wildcard tests." $NUM_KERNEL_TESTS ||
+ {
+ 	diag "Test kernel wildcards"
+diff --git a/tests/regression/ust/rotation-destroy-flush/test_rotation_destroy_flush b/tests/regression/ust/rotation-destroy-flush/test_rotation_destroy_flush
+index 8ef4f0d8c..96522f024 100755
+--- a/tests/regression/ust/rotation-destroy-flush/test_rotation_destroy_flush
++++ b/tests/regression/ust/rotation-destroy-flush/test_rotation_destroy_flush
+@@ -126,6 +126,11 @@ TESTS=(
+ TEST_COUNT=${#TESTS[@]}
+ i=0
+ 
++if [ "$SKIP_KERNEL_TEST" == "1" ]; then
++        skip 0 "SKIP_KERNEL_TEST was enabled, skipping." $NUM_TESTS
++        exit 1
++fi
++
+ while [ "$i" -lt "$TEST_COUNT" ]; do
+ 
+ 	trap signal_cleanup SIGTERM SIGINT
+-- 
+2.25.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb b/meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb
index 44415fbf2d..1e247189d2 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb
@@ -37,6 +37,7 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://lttng-sessiond.service \
            file://disable-tests.patch \
            file://0001-compat-Define-off64_t-as-off_t-on-linux.patch \
+           file://0001-Tests-Add-flags-to-test-lttng-userspace-only.patch \
            "
 
 SRC_URI[sha256sum] = "ac5baeef9fa690936b1ca01ecd1742da762c2c08511ff1b4e923938d94d0f979"
-- 
2.25.1


