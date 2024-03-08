Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB0F4C5475B
	for <webhook@archiver.kernel.org>; Fri,  8 Mar 2024 04:32:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.13637.1709872341388868844
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Mar 2024 20:32:21 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3797153437=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4284TUnY019361
	for <openembedded-core@lists.openembedded.org>; Thu, 7 Mar 2024 20:32:21 -0800
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wm4gm5bxd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 07 Mar 2024 20:32:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UdV0sEPC4GHU5hb4tWzy5V7nD8klPrd2z4FxRPpj+hgiwKLm1ZgHO8DBNZ8lpyNO6KZVGrdirThKazSNe29ND8OMHe9juRRniO06j64Zs0FwwE6HXkUwhreCITFAhcSgU5HNRq8PlxoJxd2CL/oTekQDW/D21yvpjYQCmHNs5cK09JBwTWX4cDuUMkwbo1IuPRci5o2l1pIwmw6+sAhKKutSmazU64zS8Zb+e0QPfLckETR/7X0aHDeFhTDnrAdS3XpCWiffQjK43kMwCQn6y/1pirrSDNptj3wSnP5aqu26zK7j77tiW6EDZUOIeY/dRTJaiejO97PFz61gNXPYJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R1UIwdJdHBgPdQVyCpZSCPcuMgGRiVfl8SOJAq/HAVI=;
 b=UHoMuzt8/Mie1upc4QO65QIQ0IlbUT/YzdjWh2aRaPHqRkgN5bWT0lEJhC+2CqygAKuV7G/z26K3qcJP3BxP5wmXQxc9tD5YHbH+ydaPXbYUo9TJYaZd+tipafLtptIr5fQxIs5KMxBTyOxT33nW2fR0cmuSWsMDMxwxNn7OAKzm9E3/6GjP/Oyd0qNDcJlNTKNG7TOzV2Ob3CXbHxDFcYq8+39tcktGh3HTLXUfUAeWFqMX2SzId0yKFRyjgGlrPCZ7dAJd3AT/F1iJr3Z477BhEpY1a8UmlCWpOiFj7phua2ShEh9mP4RGmdIsVRvpjhuSmgbXVVAldF1CgKHgSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by MW3PR11MB4585.namprd11.prod.outlook.com (2603:10b6:303:52::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.8; Fri, 8 Mar
 2024 04:32:17 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::5dcc:ddee:208a:33b5]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::5dcc:ddee:208a:33b5%4]) with mapi id 15.20.7386.006; Fri, 8 Mar 2024
 04:32:17 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH v3] lttng-tools: skip kernel tests if no kernel modules present
Date: Fri,  8 Mar 2024 13:11:48 +0800
Message-Id: <20240308051148.3813677-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset=utf-8
X-ClientProxiedBy: SI2PR02CA0018.apcprd02.prod.outlook.com
 (2603:1096:4:194::18) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|MW3PR11MB4585:EE_
X-MS-Office365-Filtering-Correlation-Id: 49751ec0-ea57-4847-ac84-08dc3f28bc3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ib2bjxBUjItSwfu37yKk84mXdKEFkJy4CxZZdlSM+/NE6YS0fNACjDswzTI+e94QPweEkuL80+L8GfRMrsld6GQz0wu5lzLMEfl9W3L4Vq7r2EBqSikOB5cgSEUlvpvyDi+A8nw9QqqqHUmMOq3A+6zOgwREoo7Lhe5qZmZUxGllOQivejwWTejip0gu0aU+aLDnuJ/+SkkXI54uuPPInr5fC8GLc5f76Ds0EU7OiqGDZHc31aShY/dE9CdhP9hM94NUKcs4PF62iatDWRIEdKuckBuVEWhJ+ljnjDrtSSgpi62jvXiWxHjeARfgqx4TicEd7Zn7jxeXzf2oBnJoZ0ZRow6IyGLBOkffhBjGmo1hWuhmwF+4iTVtzbn4PghyQwCfNZJvwVGlIwWHcMevsK3UpPt+nFYIkusb8kX85BlcNlOdxLcqidBn9fj7sEQ4S1rcT9wTGLk7HQM4WLUMaPBE5iW10iVmsN0UiR5L7eaiSJbON4+fHo7P3z4txeBLwK48S5My4enL+6CC+SPBINgIxzJvBWnS5JNp02vaHZ95xt6jFHyp3OrM62uN+G2EpGqDU7MZwKbYm6xsBzWcqFlE8nCF7wSUvuZvg0yYrT/puVlmA7Wsbfa6BU82B78UxnRoRytN1riAyT4h4O9jehkcxwXHP/0cJOAbrqYIb3g=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(1800799015)(376005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cm1Ea3Z3YStTZVZTT2wwTGZGL0R4bGcvMXVvekxxSE4rcFl0c2o4NmlRUjFa?=
 =?utf-8?B?SC9malFIbE1ETkZmNi9udTdwcGpDUjQwTi9VN2c4TXBVbGZPTm1SUkpiYXRV?=
 =?utf-8?B?aGpkR2ZZMmJySFhjSUFEVW5ReDVnekJXUG8wcE9Nelg1LzgzK2t2ZzBhOTZV?=
 =?utf-8?B?WTNqRGR4cTV6N1gwbTlpTlRnUXlCbStKMzRYcGNlSlRZYkphalkxaWV2ZHlo?=
 =?utf-8?B?YjNrTEZpTDQ0Ym5HN25odVBiV2hnWWdqTjVpQWN6VE5YcGxtTmZiNmVKQlNY?=
 =?utf-8?B?RVlsdXZiN3JMY240bXNudFEwemxkcEtYUUpVeGlhUmJibG82QjZTWWdSL3pM?=
 =?utf-8?B?a3lacGoyaXRkay84d2VTelZGMi9tNFRxblFXSmpnTjQ1cXFNZk5vcFkxNm1m?=
 =?utf-8?B?ckk1WFBxaWVnblBMNmhlRmY2NnF2NU81anl3bTRCdUtxcFJCbTVpaWdSbElw?=
 =?utf-8?B?UGIzR1BXZTU5ejdUMERkNENVN0dOWHUvSk9jcVBCK0gwZGtNM1M1VkRVeFR2?=
 =?utf-8?B?c0E5dm5ZWFFxazQwcmRONVFoSXdrYkZLMjZIQWpmcENMRkZ0bTFyT0paejBB?=
 =?utf-8?B?OHowNjJFRDZub2UxaW1xR05HWVR1SzBOM2EyZmE0ZUpIdlNaZDQwblVKUmhR?=
 =?utf-8?B?RGlkQlB0YnEyMncwUzVoa2lveEp4enJFNkNsTnprOWNiNGpxS2l6ZlJmNUpP?=
 =?utf-8?B?MnJpcjN1aCtMSU1HM29hQkNDOFdudG5oNUdqRWxJbmlXbUtBOVU3VjRUMzJt?=
 =?utf-8?B?VXhuOVN4K25EYkgwWGV5UDB5VDNHbExaRjdjYlp1a3grK2owNFczM2FBQ0lv?=
 =?utf-8?B?UC9zZkUwUHA4Yml5MXZWUU9kakc1ZmJ5N1AzUkZHSDB0VjNFbkd6cm1CT1dO?=
 =?utf-8?B?c3lZL1MvVXcyb0NramRxeHNjN3ArbStsWlhoVk5qcUxSK0h1dDBpZFZ0WVFP?=
 =?utf-8?B?Unp5UUduMVRZK1lrYzNWa1FlWGE2YkI2Qi9aYW55UlNxcjZjdkdyR3ppN0ov?=
 =?utf-8?B?cG96OUtwTnJxVzZKWWVSYVFYZHlETmNRR2x4QmdWNmlPSVdaQ1RRWUltQit3?=
 =?utf-8?B?SUVpaEFFZDJtQldTakd1UklDK3RSYXdjUGFGclJkMTR2ZWU4ditiTXBldWNY?=
 =?utf-8?B?b21YME1DaVdpRENsUGZ0eTd3TlRCQXlteFFmRThEVnAxeWtDQmxvRllvcDZQ?=
 =?utf-8?B?U0ZFSEtTZFhvZmkxQnBRU2lYM2x4RUtieVp4TTQwNExJMm9TWEtkYjB4Uzhk?=
 =?utf-8?B?bHB1TnNCanJ3WXBsS09peDlJcEpmZ2drbm5zK2xUNVhSTTFxdEhEMW11cm5r?=
 =?utf-8?B?ZzVkY2tqU2JSM2c5dWxheDNSNUN4Vi9vK2ZlYXNVVitGVVU5VHpCWmpYV2Z6?=
 =?utf-8?B?bkFBQnpXNDZhUzNVM095enAyL3hxZTNWUVR1OC9LYnd6ajJxTW5yNktCbUY4?=
 =?utf-8?B?RkNuNnVkSzA1WXlXVFpzVmNscUlRcytGaW9xazQ3NWlwbDFQeVVjOERSVWR3?=
 =?utf-8?B?bnZHZFE3VUxPczFqWXUxVSsyL3llK09QZ045MDVmZnU1RzJQcGZMRGxvOExQ?=
 =?utf-8?B?SEFSWXZzSEJ2YWJMbmI0LzlhUFJmU3JnV2VmUWpmZ1lwaXl0VjVyOGNrL3Jz?=
 =?utf-8?B?QjE5MFFOeGNyQTRtbHVIdVZTSzNOSUF1UFZyRytmdFlIc3FDSkZ3T0daWjlp?=
 =?utf-8?B?VG9DTy9ldDVqWXl4NmI0UFViL2FnS2QrVlNuRlFjZG93ZkRjUjJOYTJrc3NB?=
 =?utf-8?B?aWp6eWRJK3pTTU9nalozOVhzNk44L3lRb2hzVXdHVk52UVA2Y0twSW1kN2hE?=
 =?utf-8?B?M05RbXRFK1p5OTlDRTRrTlFTSU5jM0V2dEt3TUhFTUtuTE9nRWFyYk9RQTBD?=
 =?utf-8?B?NnFYZGtJUG5zT2tjQTlPYkR0ZDNpMUtIUVJiOWQ0NGRzYTVZTXovV2lpUTN6?=
 =?utf-8?B?aVZDLzJXQUwvbTRML3o5SXdHS3F6QlowaW81RkVGb1lqMmJacjNyTFg0YTQ5?=
 =?utf-8?B?V1g0VVVmN29GZVZXdXlaRkt5bGxDZTRheGdXb3p6WFFNM0xJSmNxbStKYlc3?=
 =?utf-8?B?eUo4THRjRy9UOXZpVDZDSEFrczN1RXQwakxmdWptRG1YcFhQQmMrWFNRQ0ZX?=
 =?utf-8?B?b3Y3OFdWNVlTWWY0R0p2dzBEdEdOYXVoQ2p2TGRiNlloN3hKWUJCV1QxczhR?=
 =?utf-8?B?OFE9PQ==?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49751ec0-ea57-4847-ac84-08dc3f28bc3d
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2024 04:32:17.3458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P/WeV+GvyIJKINISaVTe0S99euluD5JRz7qz4MI9cA0qmr9+XQtD+5fjAiKFE0xhTz/wKldK9hjHA5YJiBLkiIGumBwTSWSLHXk1eqUVarE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4585
X-Proofpoint-ORIG-GUID: fjgrL7WoMwOmEbkwvNe34ugqAjKGHpqf
X-Proofpoint-GUID: fjgrL7WoMwOmEbkwvNe34ugqAjKGHpqf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-08_02,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 mlxscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403080033
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4284TUnY019361
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Mar 2024 04:32:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196842

From: Xiangyu Chen <xiangyu.chen@windriver.com>

The current tests will run both userspace and kernel testing. Some of use=
 cases
only use lttng for one kind of tracing (e.g. userspace). If the lttng
modules(.ko files) is not present during the test,it would end up with lo=
ts of
failing.

Add a check in ptest script, if current system doesn't contain lttng kern=
el
modules, passing LTTNG_TOOLS_DISABLE_KERNEL_TESTS=3D1 to make to skip all=
 lttng
kernel related testing.

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
changes:
v1->v2: the patch has been merged to lttng-tools master
v2->v3: fix patchtest, edit shortlog less than 90 characters
---
 ...skip_kernel_test-to-check-root-user-.patch | 1246 +++++++++++++++++
 .../lttng/lttng-tools/run-ptest               |   25 +
 .../lttng/lttng-tools_2.13.11.bb              |    1 +
 3 files changed, 1272 insertions(+)
 create mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-tests-add-=
check_skip_kernel_test-to-check-root-user-.patch

diff --git a/meta/recipes-kernel/lttng/lttng-tools/0001-tests-add-check_s=
kip_kernel_test-to-check-root-user-.patch b/meta/recipes-kernel/lttng/ltt=
ng-tools/0001-tests-add-check_skip_kernel_test-to-check-root-user-.patch
new file mode 100644
index 0000000000..2671a1908e
--- /dev/null
+++ b/meta/recipes-kernel/lttng/lttng-tools/0001-tests-add-check_skip_ker=
nel_test-to-check-root-user-.patch
@@ -0,0 +1,1246 @@
+From cf558f802b259a33605fe0ede4d74ae2ff6be699 Mon Sep 17 00:00:00 2001
+From: Xiangyu Chen <xiangyu.chen@windriver.com>
+Date: Mon, 12 Feb 2024 09:23:54 -0500
+Subject: [PATCH] tests: add check_skip_kernel_test to check root user an=
d
+ lttng kernel modules
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+The current tests will run both userspace and kernel testing. Some of
+use cases only use lttng for one kind of tracing on an embedded
+device (e.g. userspace), so in this scenario, the kernel modules might
+not install to target rootfs, the test cases would be fail and exit.
+
+Add LTTNG_TOOLS_DISABLE_KERNEL_TESTS to skip the lttng kernel features
+test, this flag can be set via "make":
+
+  make check LTTNG_TOOLS_DISABLE_KERNEL_TESTS=3D1
+
+When this flag was set, all kernel related testcases would be marked as
+SKIP in result.
+
+Since the the LTTNG_TOOLS_DISABLE_KERNEL_TESTS was checked in function
+check_skip_kernel_test, lots of testcases also need to check root
+permission, so merging the root permission checking into
+check_skip_kernel_test.
+
+Upstream-Status: Backport from
+[https://git.lttng.org/?p=3Dlttng-tools.git;a=3Dcommit;h=3D3a1744008331a=
0604479d3d7461f77056fad3a64]
+
+Change-Id: I49a1f642a9869c21a69e0186c296fd917bd7b525
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
+Signed-off-by: J=C3=A9r=C3=A9mie Galarneau <jeremie.galarneau@efficios.c=
om>
+---
+ tests/destructive/metadata-regeneration       |  8 +----
+ tests/perf/test_perf_raw.in                   |  8 +----
+ tests/regression/kernel/test_all_events       |  8 +----
+ tests/regression/kernel/test_callstack        |  8 +----
+ tests/regression/kernel/test_channel          |  8 +----
+ tests/regression/kernel/test_clock_override   |  8 +----
+ tests/regression/kernel/test_event_basic      |  8 +----
+ tests/regression/kernel/test_kernel_function  |  8 +----
+ tests/regression/kernel/test_lttng_logger     |  8 +----
+ tests/regression/kernel/test_ns_contexts      |  8 +----
+ .../regression/kernel/test_ns_contexts_change |  9 +----
+ .../kernel/test_rotation_destroy_flush        |  8 +----
+ .../regression/kernel/test_select_poll_epoll  |  8 +----
+ tests/regression/kernel/test_syscall          |  8 +----
+ tests/regression/kernel/test_userspace_probe  |  8 +----
+ tests/regression/tools/clear/test_kernel      |  8 +----
+ .../tools/filtering/test_invalid_filter       |  8 +----
+ .../tools/filtering/test_unsupported_op       |  8 +----
+ .../tools/filtering/test_valid_filter         |  8 +----
+ tests/regression/tools/health/test_health.sh  | 10 ++----
+ tests/regression/tools/health/test_thread_ok  |  9 +----
+ tests/regression/tools/live/test_kernel       | 10 +++---
+ tests/regression/tools/live/test_lttng_kernel |  8 +----
+ tests/regression/tools/metadata/test_kernel   |  8 +----
+ .../test_notification_kernel_buffer_usage     | 36 +++++++++----------
+ .../test_notification_kernel_capture          | 23 ++++++------
+ .../test_notification_kernel_error            | 23 ++++++------
+ .../test_notification_kernel_instrumentation  | 23 ++++++------
+ .../test_notification_kernel_syscall          | 19 +++++-----
+ .../test_notification_kernel_userspace_probe  | 20 +++++------
+ .../notification/test_notification_multi_app  | 14 +++-----
+ ...test_notification_notifier_discarded_count |  9 +++--
+ .../tools/regen-metadata/test_kernel          |  8 +----
+ .../tools/regen-statedump/test_kernel         |  8 +----
+ tests/regression/tools/rotation/test_kernel   |  8 +----
+ tests/regression/tools/snapshots/test_kernel  |  8 +----
+ .../tools/snapshots/test_kernel_streaming     |  8 +----
+ .../streaming/test_high_throughput_limits     |  8 +----
+ tests/regression/tools/streaming/test_kernel  |  8 +----
+ .../tools/tracker/test_event_tracker          |  8 +----
+ .../tools/trigger/test_add_trigger_cli        | 12 ++-----
+ .../tools/trigger/test_list_triggers_cli      | 26 +++++---------
+ .../tools/wildcard/test_event_wildcard        |  8 +----
+ .../test_relayd_working_directory             |  4 +--
+ .../ust/namespaces/test_ns_contexts_change    |  7 +---
+ tests/regression/ust/test_event_perf          |  8 +----
+ tests/utils/utils.sh                          | 35 ++++++++++++++++++
+ 47 files changed, 166 insertions(+), 363 deletions(-)
+
+diff --git a/tests/destructive/metadata-regeneration b/tests/destructive=
/metadata-regeneration
+index b81e7af32..36b130d17 100755
+--- a/tests/destructive/metadata-regeneration
++++ b/tests/destructive/metadata-regeneration
+@@ -185,19 +185,13 @@ function test_ust_streaming ()
+ 	rm -f ${file_sync_before_last}
+ }
+=20
+-if [ "$(id -u)" =3D=3D "0" ]; then
+-	isroot=3D1
+-else
+-	isroot=3D0
+-fi
+-
+ if ! destructive_tests_enabled ; then
+ 	echo 'You need to set the LTTNG_ENABLE_DESTRUCTIVE_TESTS to "will-brea=
k-my-system" as argument to run this test'
+ 	echo 'Moreover, please make sure that ntp is not running while executi=
ng this test'
+ 	exit 0
+ fi
+=20
+-skip $isroot "Root access is needed. Skipping all tests." $NUM_TESTS ||
++check_skip_kernel_test $NUM_TESTS "Skipping all tests." ||
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
+=20
+-if [ "$(id -u)" =3D=3D "0" ]; then
+-	isroot=3D1
+-else
+-	isroot=3D0
+-fi
+-
+ # MUST set TESTDIR before calling those functions
+ plan_tests $NUM_TESTS
+=20
+@@ -154,7 +148,7 @@ have_libpfm
+=20
+ test_ust_raw
+=20
+-skip $isroot "Root access is needed for kernel testing, skipping." 9 ||
++check_skip_kernel_test 9 ||
+ {
+ 	modprobe lttng-test
+ 	test_kernel_raw
+diff --git a/tests/regression/kernel/test_all_events b/tests/regression/=
kernel/test_all_events
+index 2e20888df..044f9b65f 100755
+--- a/tests/regression/kernel/test_all_events
++++ b/tests/regression/kernel/test_all_events
+@@ -43,13 +43,7 @@ plan_tests $NUM_TESTS
+=20
+ print_test_banner "$TEST_DESC"
+=20
+-if [ "$(id -u)" =3D=3D "0" ]; then
+-	isroot=3D1
+-else
+-	isroot=3D0
+-fi
+-
+-skip $isroot "Root access is needed. Skipping all tests." $NUM_TESTS ||
++check_skip_kernel_test "$NUM_TESTS" "Skipping all tests." ||
+ {
+ 	validate_lttng_modules_present
+ 	start_lttng_sessiond
+diff --git a/tests/regression/kernel/test_callstack b/tests/regression/k=
ernel/test_callstack
+index a4477fd7c..d8d6b5e0f 100755
+--- a/tests/regression/kernel/test_callstack
++++ b/tests/regression/kernel/test_callstack
+@@ -134,13 +134,7 @@ plan_tests $NUM_TESTS
+=20
+ print_test_banner "$TEST_DESC"
+=20
+-if [ "$(id -u)" =3D=3D "0" ]; then
+-	isroot=3D1
+-else
+-	isroot=3D0
+-fi
+-
+-skip $isroot "Root access is needed. Skipping all tests." "$NUM_TESTS" =
||
++check_skip_kernel_test "$NUM_TESTS" "Skipping all tests." ||
+ {
+ 	validate_lttng_modules_present
+ 	start_lttng_sessiond
+diff --git a/tests/regression/kernel/test_channel b/tests/regression/ker=
nel/test_channel
+index 9cc74c4e8..4c377bd2a 100755
+--- a/tests/regression/kernel/test_channel
++++ b/tests/regression/kernel/test_channel
+@@ -47,13 +47,7 @@ function test_channel_buffer_too_large()
+ plan_tests $NUM_TESTS
+ print_test_banner "$TEST_DESC"
+=20
+-if [ "$(id -u)" =3D=3D "0" ]; then
+-	isroot=3D1
+-else
+-	isroot=3D0
+-fi
+-
+-skip $isroot "Root access is needed. Skipping all tests." $NUM_TESTS ||
++check_skip_kernel_test "$NUM_TESTS" "Skipping all tests." ||
+ {
+ 	start_lttng_sessiond
+=20
+diff --git a/tests/regression/kernel/test_clock_override b/tests/regress=
ion/kernel/test_clock_override
+index 72892898b..48a3f926a 100755
+--- a/tests/regression/kernel/test_clock_override
++++ b/tests/regression/kernel/test_clock_override
+@@ -172,13 +172,7 @@ TESTS=3D(
+ TEST_COUNT=3D${#TESTS[@]}
+ i=3D0
+=20
+-if [ "$(id -u)" =3D=3D "0" ]; then
+-	isroot=3D1
+-else
+-	isroot=3D0
+-fi
+-
+-skip $isroot "Root access is needed. Skipping all tests." $NUM_TESTS ||
++check_skip_kernel_test "$NUM_TESTS" "Skipping all tests." ||
+ {
+ 	validate_lttng_modules_present
+ 	trap signal_cleanup SIGTERM SIGINT
+diff --git a/tests/regression/kernel/test_event_basic b/tests/regression=
/kernel/test_event_basic
+index ac9ec0549..387e2f733 100755
+--- a/tests/regression/kernel/test_event_basic
++++ b/tests/regression/kernel/test_event_basic
+@@ -73,13 +73,7 @@ plan_tests $NUM_TESTS
+=20
+ print_test_banner "$TEST_DESC"
+=20
+-if [ "$(id -u)" =3D=3D "0" ]; then
+-	isroot=3D1
+-else
+-	isroot=3D0
+-fi
+-
+-skip $isroot "Root access is needed. Skipping all tests." $NUM_TESTS ||
++check_skip_kernel_test $NUM_TESTS "Skipping all tests." ||
+ {
+ 	validate_lttng_modules_present
+ 	start_lttng_sessiond
+diff --git a/tests/regression/kernel/test_kernel_function b/tests/regres=
sion/kernel/test_kernel_function
+index b1d5491fc..ea16cdeef 100755
+--- a/tests/regression/kernel/test_kernel_function
++++ b/tests/regression/kernel/test_kernel_function
+@@ -43,13 +43,7 @@ plan_tests $NUM_TESTS
+=20
+ print_test_banner "$TEST_DESC"
+=20
+-if [ "$(id -u)" =3D=3D "0" ]; then
+-	isroot=3D1
+-else
+-	isroot=3D0
+-fi
+-
+-skip $isroot "Root access is needed. Skipping all tests." $NUM_TESTS ||
++check_skip_kernel_test "$NUM_TESTS" "Skipping all tests." ||
+ {
+ 	start_lttng_sessiond_notap
+ 	validate_lttng_modules_present
+diff --git a/tests/regression/kernel/test_lttng_logger b/tests/regressio=
n/kernel/test_lttng_logger
+index b8f7ded82..00eaae823 100755
+--- a/tests/regression/kernel/test_lttng_logger
++++ b/tests/regression/kernel/test_lttng_logger
+@@ -110,13 +110,7 @@ plan_tests $NUM_TESTS
+=20
+ print_test_banner "$TEST_DESC"
+=20
+-if [ "$(id -u)" =3D=3D "0" ]; then
+-	isroot=3D1
+-else
+-	isroot=3D0
+-fi
+-
+-skip $isroot "Root access is needed. Skipping all tests." $NUM_TESTS ||
++check_skip_kernel_test "$NUM_TESTS" "Skipping all tests." ||
+ {
+ 	validate_lttng_modules_present
+ 	start_lttng_sessiond
+diff --git a/tests/regression/kernel/test_ns_contexts b/tests/regression=
/kernel/test_ns_contexts
+index 0c8718d78..59e2568f6 100755
+--- a/tests/regression/kernel/test_ns_contexts
++++ b/tests/regression/kernel/test_ns_contexts
+@@ -108,13 +108,7 @@ plan_tests $NUM_TESTS
+ print_test_banner "$TEST_DESC"
+=20
+=20
+-isroot=3D0
+-if [ "$(id -u)" =3D=3D "0" ]; then
+-	isroot=3D1
+-fi
+-
+-skip $isroot "Root access is needed. Skipping all tests." "$NUM_TESTS" =
&& exit 0
+-
++check_skip_kernel_test "$NUM_TESTS" "Skipping all tests." && exit 0
+=20
+ system_has_ns=3D0
+ if [ -d "/proc/$$/ns" ]; then
+diff --git a/tests/regression/kernel/test_ns_contexts_change b/tests/reg=
ression/kernel/test_ns_contexts_change
+index 42a61276b..3f5e4eeab 100755
+--- a/tests/regression/kernel/test_ns_contexts_change
++++ b/tests/regression/kernel/test_ns_contexts_change
+@@ -162,14 +162,7 @@ plan_tests $NUM_TESTS
+=20
+ print_test_banner "$TEST_DESC"
+=20
+-
+-isroot=3D0
+-if [ "$(id -u)" =3D=3D "0" ]; then
+-	isroot=3D1
+-fi
+-
+-skip $isroot "Root access is needed. Skipping all tests." "$NUM_TESTS" =
&& exit 0
+-
++check_skip_kernel_test "$NUM_TESTS" "Skipping all tests." && exit 0
+=20
+ system_has_ns=3D0
+ if [ -d "/proc/$$/ns" ]; then
+diff --git a/tests/regression/kernel/test_rotation_destroy_flush b/tests=
/regression/kernel/test_rotation_destroy_flush
+index cb773d7df..0af514b49 100755
+--- a/tests/regression/kernel/test_rotation_destroy_flush
++++ b/tests/regression/kernel/test_rotation_destroy_flush
+@@ -120,13 +120,7 @@ TESTS=3D(
+ TEST_COUNT=3D${#TESTS[@]}
+ i=3D0
+=20
+-if [ "$(id -u)" =3D=3D "0" ]; then
+-	isroot=3D1
+-else
+-	isroot=3D0
+-fi
+-
+-skip $isroot "Root access is needed. Skipping all tests." $NUM_TESTS ||
++check_skip_kernel_test "$NUM_TESTS" "Skipping all tests." ||
+ {
+ 	validate_lttng_modules_present
+ 	trap signal_cleanup SIGTERM SIGINT
+diff --git a/tests/regression/kernel/test_select_poll_epoll b/tests/regr=
ession/kernel/test_select_poll_epoll
+index d8245a0e7..20f0ef0ae 100755
+--- a/tests/regression/kernel/test_select_poll_epoll
++++ b/tests/regression/kernel/test_select_poll_epoll
+@@ -374,13 +374,7 @@ if test $? !=3D 0; then
+ 	exit 0
+ fi
+=20
+-if [ "$(id -u)" =3D=3D "0" ]; then
+-	isroot=3D1
+-else
+-	isroot=3D0
+-fi
+-
+-skip $isroot "Root access is needed. Skipping all tests." $NUM_TESTS ||
++check_skip_kernel_test "$NUM_TESTS" "Skipping all tests." ||
+ {
+ 	validate_lttng_modules_present
+=20
+diff --git a/tests/regression/kernel/test_syscall b/tests/regression/ker=
nel/test_syscall
+index 401a18a8d..219d94703 100755
+--- a/tests/regression/kernel/test_syscall
++++ b/tests/regression/kernel/test_syscall
+@@ -664,13 +664,7 @@ plan_tests $NUM_TESTS
+=20
+ print_test_banner "$TEST_DESC"
+=20
+-if [ "$(id -u)" =3D=3D "0" ]; then
+-	isroot=3D1
+-else
+-	isroot=3D0
+-fi
+-
+-skip $isroot "Root access is needed. Skipping all tests." $NUM_TESTS ||
++check_skip_kernel_test "$NUM_TESTS" "Skipping all tests." ||
+ {
+ 	validate_lttng_modules_present
+ 	start_lttng_sessiond
+diff --git a/tests/regression/kernel/test_userspace_probe b/tests/regres=
sion/kernel/test_userspace_probe
+index 1091ee65e..5d984d666 100755
+--- a/tests/regression/kernel/test_userspace_probe
++++ b/tests/regression/kernel/test_userspace_probe
+@@ -815,13 +815,7 @@ fi
+ plan_tests $NUM_TESTS
+ print_test_banner "$TEST_DESC"
+=20
+-if [ "$(id -u)" =3D=3D "0" ]; then
+-	isroot=3D1
+-else
+-	isroot=3D0
+-fi
+-
+-skip $isroot "Root access is needed. Skipping all tests." $NUM_TESTS ||
++check_skip_kernel_test "$NUM_TESTS" "Skipping all tests." ||
+ {
+ 	validate_lttng_modules_present
+ 	start_lttng_sessiond
+diff --git a/tests/regression/tools/clear/test_kernel b/tests/regression=
/tools/clear/test_kernel
+index 06fb1c368..48250a742 100755
+--- a/tests/regression/tools/clear/test_kernel
++++ b/tests/regression/tools/clear/test_kernel
+@@ -536,12 +536,6 @@ plan_tests $NUM_TESTS
+=20
+ print_test_banner "$TEST_DESC"
+=20
+-if [ "$(id -u)" =3D=3D "0" ]; then
+-	isroot=3D1
+-else
+-	isroot=3D0
+-fi
+-
+ streaming_tests=3D(test_kernel_streaming
+ 	test_kernel_streaming_rotate_clear
+ 	test_kernel_streaming_clear_rotate
+@@ -563,7 +557,7 @@ snapshot_tests=3D(test_kernel_streaming_snapshot
+ 	test_kernel_local_snapshot
+ )
+=20
+-skip $isroot "Root access is needed. Skipping all kernel streaming test=
s." $NUM_TESTS ||
++check_skip_kernel_test "$NUM_TESTS" "Skipping kernel streaming tests." =
||
+ {
+ 	trap signal_cleanup SIGTERM SIGINT
+=20
+diff --git a/tests/regression/tools/filtering/test_invalid_filter b/test=
s/regression/tools/filtering/test_invalid_filter
+index 7d9e524d9..8435e5546 100755
+--- a/tests/regression/tools/filtering/test_invalid_filter
++++ b/tests/regression/tools/filtering/test_invalid_filter
+@@ -168,13 +168,7 @@ done
+=20
+ test_bytecode_limit -u
+=20
+-if [ "$(id -u)" =3D=3D "0" ]; then
+-	isroot=3D1
+-else
+-	isroot=3D0
+-fi
+-
+-skip $isroot "Root access is needed. Skipping all kernel invalid filter=
 tests." $NUM_KERNEL_TESTS ||
++check_skip_kernel_test "$NUM_KERNEL_TESTS" "Skipping kernel invalid fil=
ter tests." ||
+ {
+ 	diag "Test kernel filters"
+ 	i=3D0
+diff --git a/tests/regression/tools/filtering/test_unsupported_op b/test=
s/regression/tools/filtering/test_unsupported_op
+index 299247a3c..91eb86d21 100755
+--- a/tests/regression/tools/filtering/test_unsupported_op
++++ b/tests/regression/tools/filtering/test_unsupported_op
+@@ -103,13 +103,7 @@ while [ "$i" -lt "$OP_COUNT" ]; do
+ 	let "i++"
+ done
+=20
+-if [ "$(id -u)" =3D=3D "0" ]; then
+-	isroot=3D1
+-else
+-	isroot=3D0
+-fi
+-
+-skip $isroot "Root access is needed. Skipping all kernel unsupported fi=
lter operations tests." $NUM_KERNEL_TESTS ||
++check_skip_kernel_test $NUM_KERNEL_TESTS "Skipping kernel unsupported f=
ilter operations tests." ||
+ {
+ 	diag "Test kernel unsupported filter operations"
+=20
+diff --git a/tests/regression/tools/filtering/test_valid_filter b/tests/=
regression/tools/filtering/test_valid_filter
+index e76ffa25f..1ba7c79bb 100755
+--- a/tests/regression/tools/filtering/test_valid_filter
++++ b/tests/regression/tools/filtering/test_valid_filter
+@@ -1452,13 +1452,7 @@ KERNEL_FILTERS=3D(
+=20
+ IFS=3D$OLDIFS
+=20
+-if [ "$(id -u)" =3D=3D "0" ]; then
+-	isroot=3D1
+-else
+-	isroot=3D0
+-fi
+-
+-skip $isroot "Root access is needed. Skipping all kernel valid filter t=
ests." $NUM_KERNEL_TESTS ||
++check_skip_kernel_test "$NUM_KERNEL_TESTS" "Skipping kernel valid filte=
r tests." ||
+ {
+ 	diag "Test kernel valid filters"
+=20
+diff --git a/tests/regression/tools/health/test_health.sh b/tests/regres=
sion/tools/health/test_health.sh
+index b3d6419d2..68716e6b9 100644
+--- a/tests/regression/tools/health/test_health.sh
++++ b/tests/regression/tools/health/test_health.sh
+@@ -82,7 +82,7 @@ function test_health
+ 		diag "With UST consumer daemons"
+ 		enable_ust_lttng_event_ok $SESSION_NAME $UST_EVENT_NAME $CHANNEL_NAME
+=20
+-		skip $isroot "Root access is needed. Skipping kernel consumer health =
check test." "1" ||
++		check_skip_kernel_test "1" "Skipping kernel consumer health check tes=
t." ||
+ 		{
+ 			diag "With kernel consumer daemon"
+ 			lttng_enable_kernel_event $SESSION_NAME $KERNEL_EVENT_NAME $CHANNEL_=
NAME
+@@ -113,7 +113,7 @@ function test_health
+=20
+=20
+ 	if [ ${test_needs_root} -eq 1 ]; then
+-		skip ${isroot} "Root access needed for test \"${test_thread_name}\"."=
 "1" ||
++		check_skip_kernel_test "1" "Skipping \"${test_thread_name}\"." ||
+ 		{
+ 			report_errors "${test_thread_error_string}" "${test_relayd}"
+ 		}
+@@ -276,12 +276,6 @@ STDERR_PATH=3D$(mktemp --tmpdir tmp.test_health_std=
err_path.XXXXXX)
+ TRACE_PATH=3D$(mktemp --tmpdir -d tmp.test_health_trace_path.XXXXXX)
+ HEALTH_PATH=3D$(mktemp --tmpdir -d tmp.test_health_trace_path.XXXXXX)
+=20
+-if [ "$(id -u)" =3D=3D "0" ]; then
+-	isroot=3D1
+-else
+-	isroot=3D0
+-fi
+-
+ THREAD_COUNT=3D${#THREAD[@]}
+ i=3D0
+ while [ "$i" -lt "$THREAD_COUNT" ]; do
+diff --git a/tests/regression/tools/health/test_thread_ok b/tests/regres=
sion/tools/health/test_thread_ok
+index e84adb611..e5e23543f 100755
+--- a/tests/regression/tools/health/test_thread_ok
++++ b/tests/regression/tools/health/test_thread_ok
+@@ -67,7 +67,7 @@ function test_thread_ok
+ 	$CURDIR/$HEALTH_CHECK_BIN > ${STDOUT_PATH} 2> ${STDERR_PATH}
+ 	report_errors
+=20
+-	skip $isroot "Root access is needed. Skipping kernel consumer health c=
heck test." "5" ||
++	check_skip_kernel_test "5" "Skipping kernel consumer health check test=
." ||
+ 	{
+ 		diag "With kernel consumer daemon"
+ 		create_lttng_session_no_output $SESSION_NAME
+@@ -115,13 +115,6 @@ STDERR_PATH=3D$(mktemp --tmpdir tmp.test_thread_ok_=
stderr_path.XXXXXX)
+ TRACE_PATH=3D$(mktemp --tmpdir -d tmp.test_thread_ok_trace_path.XXXXXX)
+ HEALTH_PATH=3D$(mktemp --tmpdir -d tmp.test_thread_ok_trace_path.XXXXXX=
)
+=20
+-# The manage kernel thread is only spawned if we are root
+-if [ "$(id -u)" =3D=3D "0" ]; then
+-	isroot=3D1
+-else
+-	isroot=3D0
+-fi
+-
+ test_thread_ok
+=20
+ rm -rf ${HEALTH_PATH}
+diff --git a/tests/regression/tools/live/test_kernel b/tests/regression/=
tools/live/test_kernel
+index b622b5214..fdaa09f0d 100755
+--- a/tests/regression/tools/live/test_kernel
++++ b/tests/regression/tools/live/test_kernel
+@@ -39,13 +39,11 @@ function clean_live_tracing()
+ 	rm -rf $TRACE_PATH
+ }
+=20
+-# Need root access for kernel tracing.
+-if [ "$(id -u)" =3D=3D "0" ]; then
+-	isroot=3D1
+-else
+-	plan_skip_all "Root access is needed. Skipping all tests."
++check_skip_kernel_test &&
++{
++	plan_skip_all "Skipping all tests."
+ 	exit 0
+-fi
++}
+=20
+ modprobe lttng-test
+=20
+diff --git a/tests/regression/tools/live/test_lttng_kernel b/tests/regre=
ssion/tools/live/test_lttng_kernel
+index a23d9373a..1b933648f 100755
+--- a/tests/regression/tools/live/test_lttng_kernel
++++ b/tests/regression/tools/live/test_lttng_kernel
+@@ -45,13 +45,7 @@ function clean_live_tracing()
+ }
+=20
+ # Need root access for kernel tracing.
+-if [ "$(id -u)" =3D=3D "0" ]; then
+-	isroot=3D1
+-else
+-	isroot=3D0
+-fi
+-
+-skip $isroot "Root access is needed. Skipping all tests." $NUM_TESTS ||
++check_skip_kernel_test "$NUM_TESTS" "Skipping all tests." ||
+ {
+ 	modprobe lttng-test
+=20
+diff --git a/tests/regression/tools/metadata/test_kernel b/tests/regress=
ion/tools/metadata/test_kernel
+index 57cace6ea..26e95d93a 100755
+--- a/tests/regression/tools/metadata/test_kernel
++++ b/tests/regression/tools/metadata/test_kernel
+@@ -91,13 +91,7 @@ plan_tests $NUM_TESTS
+ print_test_banner "$TEST_DESC"
+=20
+=20
+-if [ "$(id -u)" =3D=3D "0" ]; then
+-	isroot=3D1
+-else
+-	isroot=3D0
+-fi
+-
+-skip $isroot "Root access is needed. Skipping all kernel metadata tests=
." $NUM_TESTS ||
++check_skip_kernel_test "$NUM_TESTS" "Skipping kernel metadata tests." |=
|
+ {
+ 	validate_lttng_modules_present
+ 	modprobe lttng-test
+diff --git a/tests/regression/tools/notification/test_notification_kerne=
l_buffer_usage b/tests/regression/tools/notification/test_notification_ke=
rnel_buffer_usage
+index 76e69a77e..8fdaabb3e 100755
+--- a/tests/regression/tools/notification/test_notification_kernel_buffe=
r_usage
++++ b/tests/regression/tools/notification/test_notification_kernel_buffe=
r_usage
+@@ -60,29 +60,27 @@ function test_buffer_usage_notification
+ 	wait $APP_PID 2> /dev/null
+ }
+=20
+-if [ "$(id -u)" =3D=3D "0" ]; then
+-
+-	validate_lttng_modules_present
+-
++check_skip_kernel_test &&
++{
++	plan_skip_all "Skipping all tests."
++	rm -rf "$TEST_TMPDIR"
++	exit 0
++}
+=20
+-	modprobe lttng-test
++validate_lttng_modules_present
+=20
+-	# Used on sessiond launch.
+-	LTTNG_SESSIOND_ENV_VARS=3D"LTTNG_TESTPOINT_ENABLE=3D1 \
+-		CONSUMER_PAUSE_PIPE_PATH=3D${TESTPOINT_PIPE_PATH} \
+-		LD_PRELOAD=3D${TESTPOINT}"
+-	start_lttng_sessiond_notap
++modprobe lttng-test
+=20
+-	test_buffer_usage_notification
++# Used on sessiond launch.
++LTTNG_SESSIOND_ENV_VARS=3D"LTTNG_TESTPOINT_ENABLE=3D1 \
++	CONSUMER_PAUSE_PIPE_PATH=3D${TESTPOINT_PIPE_PATH} \
++	LD_PRELOAD=3D${TESTPOINT}"
++start_lttng_sessiond_notap
+=20
+-	stop_lttng_sessiond_notap
+-	rmmod lttng-test
++test_buffer_usage_notification
+=20
+-	rm -rf "${consumerd_pipe[@]}" 2> /dev/null
+-else
+-	# Kernel tests are skipped.
+-	plan_tests $NUM_TESTS
+-	skip 0 "Root access is needed. Skipping all kernel notification tests.=
" $NUM_TESTS
+-fi
++stop_lttng_sessiond_notap
++rmmod lttng-test
+=20
++rm -rf "${consumerd_pipe[@]}" 2> /dev/null
+ rm -rf "$TEST_TMPDIR"
+diff --git a/tests/regression/tools/notification/test_notification_kerne=
l_capture b/tests/regression/tools/notification/test_notification_kernel_=
capture
+index 88f123d3d..0f8a2bc6f 100755
+--- a/tests/regression/tools/notification/test_notification_kernel_captu=
re
++++ b/tests/regression/tools/notification/test_notification_kernel_captu=
re
+@@ -31,22 +31,21 @@ function test_basic_error_path
+ }
+=20
+=20
+-if [ "$(id -u)" =3D=3D "0" ]; then
+-	validate_lttng_modules_present
++check_skip_kernel_test &&
++{
++	plan_skip_all "Skipping all tests."
++	exit 0
++}
+=20
+-	modprobe lttng-test
++validate_lttng_modules_present
+=20
+-	start_lttng_sessiond_notap
++modprobe lttng-test
+=20
+-	test_basic_error_path
++start_lttng_sessiond_notap
+=20
+-	stop_lttng_sessiond_notap
+-	rmmod lttng-test
++test_basic_error_path
+=20
+-else
+-	# Kernel tests are skipped.
+-	plan_tests $NUM_TESTS
+-	skip 0 "Root access is needed. Skipping all kernel notification tests.=
" $NUM_TESTS
+-fi
++stop_lttng_sessiond_notap
++rmmod lttng-test
+=20
+ rm -f "$TESTAPP_STATE_PATH"
+diff --git a/tests/regression/tools/notification/test_notification_kerne=
l_error b/tests/regression/tools/notification/test_notification_kernel_er=
ror
+index 80fe6e5b5..b757ec2b4 100755
+--- a/tests/regression/tools/notification/test_notification_kernel_error
++++ b/tests/regression/tools/notification/test_notification_kernel_error
+@@ -30,23 +30,22 @@ function test_basic_error_path
+ 	wait $APP_PID 2> /dev/null
+ }
+=20
++check_skip_kernel_test &&
++{
++	plan_skip_all "Skipping all tests."
++	exit 0
++}
+=20
+-if [ "$(id -u)" =3D=3D "0" ]; then
+-	validate_lttng_modules_present
++validate_lttng_modules_present
+=20
+-	modprobe lttng-test
++modprobe lttng-test
+=20
+-	start_lttng_sessiond_notap
++start_lttng_sessiond_notap
+=20
+-	test_basic_error_path
++test_basic_error_path
+=20
+-	stop_lttng_sessiond_notap
+-	rmmod lttng-test
++stop_lttng_sessiond_notap
++rmmod lttng-test
+=20
+-else
+-	# Kernel tests are skipped.
+-	plan_tests $NUM_TESTS
+-	skip 0 "Root access is needed. Skipping all kernel notification tests.=
" $NUM_TESTS
+-fi
+=20
+ rm -f "$TESTAPP_STATE_PATH"
+diff --git a/tests/regression/tools/notification/test_notification_kerne=
l_instrumentation b/tests/regression/tools/notification/test_notification=
_kernel_instrumentation
+index 90545a541..705f7703d 100755
+--- a/tests/regression/tools/notification/test_notification_kernel_instr=
umentation
++++ b/tests/regression/tools/notification/test_notification_kernel_instr=
umentation
+@@ -28,22 +28,21 @@ function test_kernel_instrumentation_notification
+ 	wait $APP_PID 2> /dev/null
+ }
+=20
+-if [ "$(id -u)" =3D=3D "0" ]; then
+-	validate_lttng_modules_present
++check_skip_kernel_test &&
++{
++	plan_skip_all "Skipping all tests."
++	exit 0
++}
+=20
+-	modprobe lttng-test
++validate_lttng_modules_present
+=20
+-	start_lttng_sessiond_notap
++modprobe lttng-test
+=20
+-	test_kernel_instrumentation_notification
++start_lttng_sessiond_notap
+=20
+-	stop_lttng_sessiond_notap
+-	rmmod lttng-test
++test_kernel_instrumentation_notification
+=20
+-else
+-	# Kernel tests are skipped.
+-	plan_tests $NUM_TESTS
+-	skip 0 "Root access is needed. Skipping all kernel notification tests.=
" $NUM_TESTS
+-fi
++stop_lttng_sessiond_notap
++rmmod lttng-test
+=20
+ rm -f "$TESTAPP_STATE_PATH"
+diff --git a/tests/regression/tools/notification/test_notification_kerne=
l_syscall b/tests/regression/tools/notification/test_notification_kernel_=
syscall
+index d273cb55d..7fa235388 100755
+--- a/tests/regression/tools/notification/test_notification_kernel_sysca=
ll
++++ b/tests/regression/tools/notification/test_notification_kernel_sysca=
ll
+@@ -31,19 +31,18 @@ function test_kernel_syscall_notification
+ 	wait $APP_PID 2> /dev/null
+ }
+=20
+-if [ "$(id -u)" =3D=3D "0" ]; then
+-	validate_lttng_modules_present
++check_skip_kernel_test &&
++{
++	plan_skip_all "Skipping all tests."
++	exit 0
++}
+=20
+-	start_lttng_sessiond_notap
++validate_lttng_modules_present
+=20
+-	test_kernel_syscall_notification
++start_lttng_sessiond_notap
+=20
+-	stop_lttng_sessiond_notap
++test_kernel_syscall_notification
+=20
+-else
+-	# Kernel tests are skipped.
+-	plan_tests $NUM_TESTS
+-	skip 0 "Root access is needed. Skipping all kernel notification tests.=
" $NUM_TESTS
+-fi
++stop_lttng_sessiond_notap
+=20
+ rm -f "$TESTAPP_STATE_PATH"
+diff --git a/tests/regression/tools/notification/test_notification_kerne=
l_userspace_probe b/tests/regression/tools/notification/test_notification=
_kernel_userspace_probe
+index 8ef8d708d..abddd9be7 100755
+--- a/tests/regression/tools/notification/test_notification_kernel_users=
pace_probe
++++ b/tests/regression/tools/notification/test_notification_kernel_users=
pace_probe
+@@ -29,18 +29,18 @@ function test_kernel_userspace_probe_notification
+ 	wait $APP_PID 2> /dev/null
+ }
+=20
+-if [ "$(id -u)" =3D=3D "0" ]; then
+-	validate_lttng_modules_present
++check_skip_kernel_test &&
++{
++	plan_skip_all "Skipping all tests."
++	exit 0
++}
++
++validate_lttng_modules_present
+=20
+-	start_lttng_sessiond_notap
++start_lttng_sessiond_notap
+=20
+-	test_kernel_userspace_probe_notification
++test_kernel_userspace_probe_notification
+=20
+-	stop_lttng_sessiond_notap
+-else
+-	# Kernel tests are skipped.
+-	plan_tests $NUM_TESTS
+-	skip 0 "Root access is needed. Skipping all kernel notification tests.=
" $NUM_TESTS
+-fi
++stop_lttng_sessiond_notap
+=20
+ rm -f "$TESTAPP_STATE_PATH"
+diff --git a/tests/regression/tools/notification/test_notification_multi=
_app b/tests/regression/tools/notification/test_notification_multi_app
+index d8b639225..61891b56f 100755
+--- a/tests/regression/tools/notification/test_notification_multi_app
++++ b/tests/regression/tools/notification/test_notification_multi_app
+@@ -411,22 +411,18 @@ function test_on_register_evaluation ()
+ 	rm -rf "$output_dir"
+ }
+=20
+-
+ TESTS=3D(
+ 	test_multi_app_ust
+ 	test_on_register_evaluation_ust
+ )
+=20
+-if [ "$(id -u)" =3D=3D "0" ]; then
++check_skip_kernel_test "$NUM_TEST_KERNEL" "Skipping kernel multi-app no=
tification tests." || {
+ 	validate_lttng_modules_present
+ 	TESTS+=3D(
+-	test_multi_app_kernel
+-	test_on_register_evaluation_kernel
+-)
+-else
+-        skip 0 "Root access is needed. Skipping all kernel multi-app no=
tification tests." $NUM_TEST_KERNEL
+-fi
+-
++		test_multi_app_kernel
++		test_on_register_evaluation_kernel
++	)
++}
+=20
+ for fct_test in ${TESTS[@]};
+ do
+diff --git a/tests/regression/tools/notification/test_notification_notif=
ier_discarded_count b/tests/regression/tools/notification/test_notificati=
on_notifier_discarded_count
+index c9235393e..a6c31a728 100755
+--- a/tests/regression/tools/notification/test_notification_notifier_dis=
carded_count
++++ b/tests/regression/tools/notification/test_notification_notifier_dis=
carded_count
+@@ -391,7 +391,8 @@ function test_ust_notifier_discarded_regardless_trig=
ger_owner
+ test_ust_notifier_discarded_count
+ test_ust_notifier_discarded_count_max_bucket
+=20
+-if [ "$(id -u)" =3D=3D "0" ]; then
++check_skip_kernel_test "$KERNEL_NUM_TESTS" "Skipping kernel notificatio=
n tests." ||
++{
+=20
+ 	validate_lttng_modules_present
+=20
+@@ -413,9 +414,7 @@ if [ "$(id -u)" =3D=3D "0" ]; then
+ 	modprobe --remove lttng-test
+=20
+ 	rm -rf "${sessiond_pipe[@]}" 2> /dev/null
+-else
+-	# Kernel tests are skipped.
+-	skip 0 "Root access is needed. Skipping all kernel notification tests.=
" $KERNEL_NUM_TESTS
+-fi
++
++}
+=20
+ rm -rf "$TEST_TMPDIR"
+diff --git a/tests/regression/tools/regen-metadata/test_kernel b/tests/r=
egression/tools/regen-metadata/test_kernel
+index 49eea32a7..555a4e2ce 100755
+--- a/tests/regression/tools/regen-metadata/test_kernel
++++ b/tests/regression/tools/regen-metadata/test_kernel
+@@ -99,13 +99,7 @@ plan_tests $NUM_TESTS
+=20
+ print_test_banner "$TEST_DESC"
+=20
+-if [ "$(id -u)" =3D=3D "0" ]; then
+-	isroot=3D1
+-else
+-	isroot=3D0
+-fi
+-
+-skip $isroot "Root access is needed. Skipping all kernel streaming test=
s." $NUM_TESTS ||
++check_skip_kernel_test "$NUM_TESTS" "Skipping all tests." ||
+ {
+ 	validate_lttng_modules_present
+=20
+diff --git a/tests/regression/tools/regen-statedump/test_kernel b/tests/=
regression/tools/regen-statedump/test_kernel
+index 8a261355d..bbbac3942 100755
+--- a/tests/regression/tools/regen-statedump/test_kernel
++++ b/tests/regression/tools/regen-statedump/test_kernel
+@@ -39,13 +39,7 @@ plan_tests $NUM_TESTS
+=20
+ print_test_banner "$TEST_DESC"
+=20
+-if [ "$(id -u)" =3D=3D "0" ]; then
+-	isroot=3D1
+-else
+-	isroot=3D0
+-fi
+-
+-skip $isroot "Root access is needed. Skipping all kernel streaming test=
s." $NUM_TESTS ||
++check_skip_kernel_test "$NUM_TESTS" "Skipping all tests." ||
+ {
+ 	validate_lttng_modules_present
+ 	start_lttng_sessiond
+diff --git a/tests/regression/tools/rotation/test_kernel b/tests/regress=
ion/tools/rotation/test_kernel
+index f5f1f5553..efe3fd359 100755
+--- a/tests/regression/tools/rotation/test_kernel
++++ b/tests/regression/tools/rotation/test_kernel
+@@ -82,13 +82,7 @@ plan_tests $NUM_TESTS
+=20
+ print_test_banner "$TEST_DESC"
+=20
+-if [ "$(id -u)" =3D=3D "0" ]; then
+-	isroot=3D1
+-else
+-	isroot=3D0
+-fi
+-
+-skip $isroot "Root access is needed. Skipping all kernel streaming test=
s." $NUM_TESTS ||
++check_skip_kernel_test "$NUM_TESTS" "Skipping all tests." ||
+ {
+ 	validate_lttng_modules_present
+=20
+diff --git a/tests/regression/tools/snapshots/test_kernel b/tests/regres=
sion/tools/snapshots/test_kernel
+index abb243563..d91876867 100755
+--- a/tests/regression/tools/snapshots/test_kernel
++++ b/tests/regression/tools/snapshots/test_kernel
+@@ -217,13 +217,7 @@ plan_tests $NUM_TESTS
+=20
+ print_test_banner "$TEST_DESC"
+=20
+-if [ "$(id -u)" =3D=3D "0" ]; then
+-	isroot=3D1
+-else
+-	isroot=3D0
+-fi
+-
+-skip $isroot "Root access is needed. Skipping all kernel snapshot tests=
" $NUM_TESTS ||
++check_skip_kernel_test "$NUM_TESTS" "Skipping all tests." ||
+ {
+=20
+ 	validate_lttng_modules_present
+diff --git a/tests/regression/tools/snapshots/test_kernel_streaming b/te=
sts/regression/tools/snapshots/test_kernel_streaming
+index 0c92dc710..dd965afee 100755
+--- a/tests/regression/tools/snapshots/test_kernel_streaming
++++ b/tests/regression/tools/snapshots/test_kernel_streaming
+@@ -145,13 +145,7 @@ plan_tests $NUM_TESTS
+=20
+ print_test_banner "$TEST_DESC"
+=20
+-if [ "$(id -u)" =3D=3D "0" ]; then
+-	isroot=3D1
+-else
+-	isroot=3D0
+-fi
+-
+-skip $isroot "Root access is needed. Skipping all kernel streaming test=
s" $NUM_TESTS ||
++check_skip_kernel_test $NUM_TESTS "Skipping all tests." ||
+ {
+ 	validate_lttng_modules_present
+=20
+diff --git a/tests/regression/tools/streaming/test_high_throughput_limit=
s b/tests/regression/tools/streaming/test_high_throughput_limits
+index 2b9e3ad39..c55d51098 100755
+--- a/tests/regression/tools/streaming/test_high_throughput_limits
++++ b/tests/regression/tools/streaming/test_high_throughput_limits
+@@ -170,13 +170,7 @@ plan_tests $NUM_TESTS
+=20
+ print_test_banner "$TEST_DESC"
+=20
+-if [ "$(id -u)" =3D=3D "0" ]; then
+-	isroot=3D1
+-else
+-	isroot=3D0
+-fi
+-
+-skip $isroot "Root access is needed to set bandwith limits. Skipping al=
l tests." $NUM_TESTS ||
++check_skip_kernel_test "$NUM_TESTS" "Skipping all tests." ||
+ {
+=20
+ 	# Catch sigint and try to cleanup limits
+diff --git a/tests/regression/tools/streaming/test_kernel b/tests/regres=
sion/tools/streaming/test_kernel
+index 33334229f..113eea7bf 100755
+--- a/tests/regression/tools/streaming/test_kernel
++++ b/tests/regression/tools/streaming/test_kernel
+@@ -47,13 +47,7 @@ plan_tests $NUM_TESTS
+=20
+ print_test_banner "$TEST_DESC"
+=20
+-if [ "$(id -u)" =3D=3D "0" ]; then
+-	isroot=3D1
+-else
+-	isroot=3D0
+-fi
+-
+-skip $isroot "Root access is needed. Skipping all kernel streaming test=
s." $NUM_TESTS ||
++check_skip_kernel_test "$NUM_TESTS" "Skipping all tests." ||
+ {
+ 	validate_lttng_modules_present
+=20
+diff --git a/tests/regression/tools/tracker/test_event_tracker b/tests/r=
egression/tools/tracker/test_event_tracker
+index cc0f698d2..de0c79d36 100755
+--- a/tests/regression/tools/tracker/test_event_tracker
++++ b/tests/regression/tools/tracker/test_event_tracker
+@@ -466,13 +466,7 @@ test_event_track_untrack ust 0 "${EVENT_NAME}" "--p=
id --all"	# backward compat
+ test_event_tracker ust 1 "${EVENT_NAME}" "--pid --all"	# backward compa=
t
+ test_event_pid_tracker ust 1 "${EVENT_NAME}"
+=20
+-if [ "$(id -u)" =3D=3D "0" ]; then
+-	isroot=3D1
+-else
+-	isroot=3D0
+-fi
+-
+-skip $isroot "Root access is needed. Skipping all kernel tracker tests.=
" $NUM_KERNEL_TESTS ||
++check_skip_kernel_test "$NUM_KERNEL_TESTS" "Skipping kernel tracker tes=
ts." ||
+ {
+ 	diag "Test kernel tracker"
+=20
+diff --git a/tests/regression/tools/trigger/test_add_trigger_cli b/tests=
/regression/tools/trigger/test_add_trigger_cli
+index 98ecf6272..d1763aa2e 100755
+--- a/tests/regression/tools/trigger/test_add_trigger_cli
++++ b/tests/regression/tools/trigger/test_add_trigger_cli
+@@ -34,12 +34,6 @@ tmp_stdout=3D$(mktemp --tmpdir -t test_parse_cli_trig=
ger_stdout.XXXXXX)
+ tmp_stderr=3D$(mktemp --tmpdir -t test_parse_cli_trigger_stderr.XXXXXX)
+ uprobe_elf_binary=3D"${TESTDIR}/utils/testapp/userspace-probe-elf-binar=
y/.libs/userspace-probe-elf-binary"
+=20
+-if [ "$(id -u)" =3D=3D "0" ]; then
+-	ist_root=3D1
+-else
+-	ist_root=3D0
+-fi
+-
+ function test_success ()
+ {
+ 	local test_name=3D"$1"
+@@ -223,7 +217,7 @@ test_success "--exclude-name two" "trigger5" \
+ 	--condition event-rule-matches --type=3Duser --name=3D'jean-*' --exclu=
de-name jean-chretien -x jean-charest \
+ 	--action notify
+=20
+-skip $ist_root "non-root user: skipping kprobe tests" 18 || {
++check_skip_kernel_test 18 "Skipping kprobe tests." || {
+ 	i=3D0
+=20
+ 	for type in kprobe kernel:kprobe; do
+@@ -262,7 +256,7 @@ skip $ist_root "non-root user: skipping kprobe tests=
" 18 || {
+ 	done
+ }
+=20
+-skip $ist_root "non-root user: skipping uprobe tests" 6 || {
++check_skip_kernel_test 6 "Skipping uprobe tests." || {
+ 	test_success "--condition event-rule-matches uprobe" "uprobe-trigger-0=
" \
+ 		--name=3D"uprobe-trigger-0" \
+ 		--condition event-rule-matches --type=3Dkernel:uprobe --location=3D${=
uprobe_elf_binary}:test_function --event-name=3Dma-probe \
+@@ -274,7 +268,7 @@ skip $ist_root "non-root user: skipping uprobe tests=
" 6 || {
+ 		--action notify
+ }
+=20
+-skip $ist_root "non-root user: skipping syscall tests" 30 || {
++check_skip_kernel_test 30 "Skipping syscall tests." || {
+ 	test_success "--condition event-rule-matches one syscall" "syscall-tri=
gger-0" \
+ 		--name=3D"syscall-trigger-0" \
+ 		--condition event-rule-matches --type=3Dsyscall --name=3Dopen \
+diff --git a/tests/regression/tools/trigger/test_list_triggers_cli b/tes=
ts/regression/tools/trigger/test_list_triggers_cli
+index a04018013..02c3de3e9 100755
+--- a/tests/regression/tools/trigger/test_list_triggers_cli
++++ b/tests/regression/tools/trigger/test_list_triggers_cli
+@@ -36,22 +36,12 @@ uprobe_sdt_binary=3D$(realpath "${TESTDIR}/utils/tes=
tapp/userspace-probe-sdt-binar
+ register_some_triggers_bin=3D$(realpath "${CURDIR}/utils/register-some-=
triggers")
+=20
+ uid=3D$(id --user)
+-gid=3D$(id --group)
+=20
+-if [ "$uid" =3D=3D "0" ]; then
+-	ist_root=3D1
+-	ls "$uprobe_sdt_binary" >/dev/null 2>&1
+-	if test $? =3D=3D 0; then
+-		hast_sdt_binary=3D1
+-	else
+-		hast_sdt_binary=3D0
+-	fi
+-else
+-	ist_root=3D0
+-	hast_sdt_binary=3D0
++sdt_binary_present=3D0
++if [ -f "$uprobe_sdt_binary" ]; then
++	sdt_binary_present=3D1
+ fi
+=20
+-
+ test_top_level_options ()
+ {
+ 	diag "Listing top level options"
+@@ -2695,10 +2685,12 @@ start_lttng_sessiond_notap
+=20
+ test_top_level_options
+ test_event_rule_matches_tracepoint
+-skip $ist_root "non-root user: skipping kprobe tests" 13 || test_event_=
rule_matches_probe
+-skip $ist_root "non-root user: skipping uprobe tests" 9 || test_event_r=
ule_matches_userspace_probe_elf
+-skip $(($ist_root && $hast_sdt_binary)) "skipping userspace probe SDT t=
ests" 9 || test_event_rule_matches_userspace_probe_sdt
+-skip $ist_root "non-root user: skipping syscall tests" 17 || test_event=
_rule_matches_syscall
++check_skip_kernel_test 48 "Skipping kprobe, uprobe, SDT and syscall tes=
ts." || {
++	test_event_rule_matches_probe
++	test_event_rule_matches_userspace_probe_elf
++	skip $sdt_binary_present "No SDT binary. Skipping userspace probe SDT =
tests" 9 || test_event_rule_matches_userspace_probe_sdt
++	test_event_rule_matches_syscall
++}
+ test_session_consumed_size_condition
+ test_buffer_usage_conditions
+ test_session_rotation_conditions
+diff --git a/tests/regression/tools/wildcard/test_event_wildcard b/tests=
/regression/tools/wildcard/test_event_wildcard
+index f69baffc4..14d9bb88a 100755
+--- a/tests/regression/tools/wildcard/test_event_wildcard
++++ b/tests/regression/tools/wildcard/test_event_wildcard
+@@ -124,13 +124,7 @@ test_event_wildcard ust 1 'tp*tptest'
+ test_event_wildcard ust 1 'tp**tptest'
+ test_event_wildcard ust 1 'tp*test'
+=20
+-if [ "$(id -u)" =3D=3D "0" ]; then
+-	isroot=3D1
+-else
+-	isroot=3D0
+-fi
+-
+-skip $isroot "Root access is needed. Skipping all kernel wildcard tests=
." $NUM_KERNEL_TESTS ||
++check_skip_kernel_test "$NUM_KERNEL_TESTS" "Skipping kernel wildcard te=
sts." ||
+ {
+ 	diag "Test kernel wildcards"
+=20
+diff --git a/tests/regression/tools/working-directory/test_relayd_workin=
g_directory b/tests/regression/tools/working-directory/test_relayd_workin=
g_directory
+index c7e784cca..6bd1e504a 100755
+--- a/tests/regression/tools/working-directory/test_relayd_working_direc=
tory
++++ b/tests/regression/tools/working-directory/test_relayd_working_direc=
tory
+@@ -145,9 +145,9 @@ function test_relayd_debug_permission()
+ 	diag "Test lttng-relayd change working directory on non writable direc=
tory"
+=20
+ 	if [ "$(id -u)" =3D=3D "0" ]; then
+-	    is_user=3D0
++		is_user=3D0
+ 	else
+-	    is_user=3D1
++		is_user=3D1
+ 	fi
+=20
+ 	skip $is_user "Skipping permission debug output test; operation can't =
fail as root" 6 ||
+diff --git a/tests/regression/ust/namespaces/test_ns_contexts_change b/t=
ests/regression/ust/namespaces/test_ns_contexts_change
+index 8a4b62ce3..622241f7b 100755
+--- a/tests/regression/ust/namespaces/test_ns_contexts_change
++++ b/tests/regression/ust/namespaces/test_ns_contexts_change
+@@ -101,12 +101,7 @@ plan_tests $NUM_TESTS
+=20
+ print_test_banner "$TEST_DESC"
+=20
+-isroot=3D0
+-if [ "$(id -u)" =3D=3D "0" ]; then
+-	isroot=3D1
+-fi
+-
+-skip $isroot "Root access is needed. Skipping all tests." "$NUM_TESTS" =
&& exit 0
++check_skip_kernel_test "$NUM_TESTS" "Skipping all tests." && exit 0
+=20
+ system_has_ns=3D0
+ if [ -d "/proc/$$/ns" ]; then
+diff --git a/tests/regression/ust/test_event_perf b/tests/regression/ust=
/test_event_perf
+index 33aab2981..178959a19 100755
+--- a/tests/regression/ust/test_event_perf
++++ b/tests/regression/ust/test_event_perf
+@@ -119,17 +119,11 @@ plan_tests $NUM_TESTS
+=20
+ print_test_banner "$TEST_DESC"
+=20
+-if [ "$(id -u)" =3D=3D "0" ]; then
+-        isroot=3D1
+-else
+-        isroot=3D0
+-fi
+-
+ start_lttng_sessiond
+=20
+ test_parsing_raw
+=20
+-skip $isroot "Root access is needed. Skipping UST perf tests." 8 ||
++check_skip_kernel_test 8 "Skipping UST perf tests." ||
+ {
+ 	test_event_basic
+ }
+diff --git a/tests/utils/utils.sh b/tests/utils/utils.sh
+index faa87e783..da0e0569d 100644
+--- a/tests/utils/utils.sh
++++ b/tests/utils/utils.sh
+@@ -318,6 +318,41 @@ function conf_proc_count()
+ 	echo
+ }
+=20
++# Usage:
++# check_skip_kernel_test [NB_TESTS] [SKIP_MESSAGE]
++# Return 0 if LTTNG_TOOLS_DISABLE_KERNEL_TESTS was set or the current u=
ser is not a root user
++# If NB_TESTS is set, call skip() to skip number of tests.
++# If NB_TESTS is empty, just output a reason with diag.
++# An optional message can be added.
++
++function check_skip_kernel_test ()
++{
++	local num_tests=3D"$1"
++	local skip_message=3D"$2"
++
++	# Check for skip test kernel flag
++	if [ "$LTTNG_TOOLS_DISABLE_KERNEL_TESTS" =3D=3D "1" ]; then
++		if ! test -z "$num_tests"; then
++			skip 0 "LTTNG_TOOLS_DISABLE_KERNEL_TESTS was set.${skip_message+ }${=
skip_message}" "$num_tests"
++		else
++			diag "LTTNG_TOOLS_DISABLE_KERNEL_TESTS was set.${skip_message+ }${sk=
ip_message}"
++		fi
++		return 0
++	fi
++
++	# Check if we are running as root
++	if [ "$(id -u)" !=3D "0" ]; then
++		if ! test -z "$num_tests"; then
++			skip 0 "Root access is needed for kernel testing.${skip_message+ }${=
skip_message}" "$num_tests"
++		else
++			diag "Root access is needed for kernel testing.${skip_message+ }${sk=
ip_message}"
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
+--=20
+2.25.1
+
diff --git a/meta/recipes-kernel/lttng/lttng-tools/run-ptest b/meta/recip=
es-kernel/lttng/lttng-tools/run-ptest
index bf99322ef2..39d93e2bbf 100755
--- a/meta/recipes-kernel/lttng/lttng-tools/run-ptest
+++ b/meta/recipes-kernel/lttng/lttng-tools/run-ptest
@@ -1,8 +1,33 @@
 #!/bin/sh
 # Without --ignore-exit, the tap harness causes any FAILs within a
 # test plan to raise ERRORs; this is just noise.
+
+#Detecting whether current system has lttng kernel modules
+LTTNG_KMOD_PATH=3D/lib/modules/$(uname -r)/kernel/lttng-modules/lttng-tr=
acer.ko
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
 export LD_LIBRARY_PATH=3DFIXMEPTESTPATH/tests/utils/testapp/userspace-pr=
obe-elf-binary/.libs
 makeargs=3D"LOG_DRIVER_FLAGS=3D--ignore-exit top_srcdir=3DFIXMEPTESTPATH=
 top_builddir=3DFIXMEPTESTPATH"
+
+#If current system doesn't have lttng kernel modules, disable lttng kern=
el related tests.
+validate_lttng_modules_present || {
+	makeargs=3D"$makeargs LTTNG_TOOLS_DISABLE_KERNEL_TESTS=3D1"
+}
+
 make -k -t all >error.log 2>&1
 # Can specify a test e.g.:
 # -C tests/regression/ check TESTS=3D'kernel/test_callstack'
diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb b/meta/reci=
pes-kernel/lttng/lttng-tools_2.13.11.bb
index 44415fbf2d..08144e271c 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb
@@ -37,6 +37,7 @@ SRC_URI =3D "https://lttng.org/files/lttng-tools/lttng-=
tools-${PV}.tar.bz2 \
            file://lttng-sessiond.service \
            file://disable-tests.patch \
            file://0001-compat-Define-off64_t-as-off_t-on-linux.patch \
+           file://0001-tests-add-check_skip_kernel_test-to-check-root-us=
er-.patch \
            "
=20
 SRC_URI[sha256sum] =3D "ac5baeef9fa690936b1ca01ecd1742da762c2c08511ff1b4=
e923938d94d0f979"
--=20
2.25.1


