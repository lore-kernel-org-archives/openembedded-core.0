Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 586CACA0ED3
	for <webhook@archiver.kernel.org>; Mon,  2 Sep 2024 07:39:47 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.33583.1725262782199779344
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Sep 2024 00:39:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=99757bbfde=deepthi.hemraj@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4826ekwu004991
	for <openembedded-core@lists.openembedded.org>; Mon, 2 Sep 2024 00:39:41 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41c2pkhbp1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 00:39:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aWCzXMJQxq8T/A+X/YyNOa7/5l8Jh40v71t3od/CQFzk1fwPDJcks6zALzICQmo/u2Al2r5K6ixxvNZ8y1GiyBmLb8ktBkQnDXh3MH7ybnh5IZ1Et0d16LoYn2Kdr4hq1flEJwOKRbgxConA5bC5DuyHRSlGYEA00PEVQWww27pZPQVJfSZpdexn+wyQcjUNWjGPhSJ37LcRxHIw2w/V0P5fmfVeeV5sQ7JJy25ctv39+9ZxNvPIFc8hDe0Kdq/MMFrnE5rsAjvNfXEycVpyqbXVaf7xsIJr027tdGOJ+oDeDnR09EO4oILW4M+ZdDb54lfZl0EiAK+fimYyUp9+SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SvE4g10/EYI4joDNJjB0JZeusLqKb0iJ/oAfzllxh+M=;
 b=j7r2dL1jcAPWeAoaoNkkjHjfZku0BZbFL90Wem0Tn2Op9omNcFeTH77ZbQ+7rmVU+j1rceuYmcyqJtBU/kiZ8ep3CaGd65h8BAKCBSCvwNooImoBSrMbbfjaaMMcedLO9vzqkV5wipVbUv7pvxXpfWzKeFpN0f05qyxf7CyQD+Jzlvgvz0jJHt5I0IWgzwgfshpsTF/M9nMmnA65eS8EryL1xia/+Cjdo1RFzmsvsG8jsOKz2tIA8bv4XFj15RCYWpMzvPQI0fcTtThRDHjPL3iikpuquaUnFrs6sGmz47Qq4ElQ7XH4bASRdpKmBAqqpYRnK9P55+4qZr+v+3AE2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8602.namprd11.prod.outlook.com (2603:10b6:408:1b3::11)
 by SJ0PR11MB8271.namprd11.prod.outlook.com (2603:10b6:a03:47a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.23; Mon, 2 Sep
 2024 07:39:36 +0000
Received: from LV3PR11MB8602.namprd11.prod.outlook.com
 ([fe80::5e20:4508:a523:df39]) by LV3PR11MB8602.namprd11.prod.outlook.com
 ([fe80::5e20:4508:a523:df39%6]) with mapi id 15.20.7918.024; Mon, 2 Sep 2024
 07:39:35 +0000
From: Deepthi.Hemraj@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com
Subject: [PATCH] gcc-sanitizers: Add ptest support for AddressSanitizer tests
Date: Mon,  2 Sep 2024 00:39:18 -0700
Message-ID: <20240902073918.490722-1-Deepthi.Hemraj@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0266.namprd04.prod.outlook.com
 (2603:10b6:303:88::31) To LV3PR11MB8602.namprd11.prod.outlook.com
 (2603:10b6:408:1b3::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8602:EE_|SJ0PR11MB8271:EE_
X-MS-Office365-Filtering-Correlation-Id: 2aa97e12-dad9-407f-7842-08dccb226475
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rkErF8CEwtsFAXgzlxbA/xvKMonT/yQ6nRgJmJBHYhTrN0Pul7DztMcYjhAk?=
 =?us-ascii?Q?k97YBEfTPqdHUTz+M1gKvuh8ZvYlhsUzwHM3gCfFOI2fxUcUNrSMA3UEyqsQ?=
 =?us-ascii?Q?r66mJ+YAEc1ooK+bPbZGX9F2IAsCp6xcXqA+jN+TyroP1AWP/xJMaTcnc7OL?=
 =?us-ascii?Q?59OGErfrqrdYjA7If6hgpaJwwJ0yNY4r719ebmiDVuoHzNDIwvZHUdxrk90y?=
 =?us-ascii?Q?4Kvb4oPjrek9PPZEbx/WlHAHsPneqk2Ttdu8jC7yU0b35FuQxcREIl26b+g/?=
 =?us-ascii?Q?hjBfLv2Kp1dtR6tFPi6igwUl4cRPkrEAZF/g+agasBbrxABNW8G8FrqQne9n?=
 =?us-ascii?Q?QbZEhxpQl0nouuJ6a7E6u1kkCMidbf7rrN7rVSgY28GzJLJ9rz6KXk4fvHh8?=
 =?us-ascii?Q?TTBVQ7/op0mDZ+2S/VGfu7VC0bf0tfk4UacFJ3ieCRFPX83hSanv96/CTHWH?=
 =?us-ascii?Q?Jx8mu2yNEOwutL+f9ayIQLi+nsOMF2J9I9ZGG52m01i9pkDf2Ln1MUXR4O2W?=
 =?us-ascii?Q?ZSg/8z3P5Ey4yJiOolliGC9IWUFyayR9pNGvPxWt8ElAQ30ShGkqaTsY/Nr2?=
 =?us-ascii?Q?woFmEAiNtMrwAhho50xjePRHKBDdEkWx4lAhdVGV3pv+2RrtC31a1N3hdLfl?=
 =?us-ascii?Q?kDnj4orIOG/5Qdsrf5rMYoT3mDsCvwAirrpHpY5OjNMU6PSm/HanncZLSdf7?=
 =?us-ascii?Q?mR9eEzFmFMTpdKBs/dsbQhq9D7UY1ydX7G6V0LaYuqEAV1AcvfgqgvaoTvAJ?=
 =?us-ascii?Q?bPYvb7TSCQra0+/EGVub5ekUMA1ZdwYf7C+4AY2XEKQJSeXZa4/nunkFd2SZ?=
 =?us-ascii?Q?ajNPhphK5KFlC7H0d5UnBOrPDbIhqashwMB49oQaSrwU54e0O8cVbrXUGe26?=
 =?us-ascii?Q?gTyNm2BZAG5r+UIFJsdrrD+xQqyhDwU358D4TKuutQij/FSoQVoxnjlJvxKK?=
 =?us-ascii?Q?P/Me8GmN8CWFu4ZYuZTqBRusI2XWwQH7BA8JYNz/DKSgwW7Z5xowXSUhWxIv?=
 =?us-ascii?Q?nN7Z8u3yVGfPF+JtXtfnva2fVTd0bhxHHuH3HkfVI7UnmYDlff+5AR14yQNf?=
 =?us-ascii?Q?F9TkXxVsVtfqRxxphpU0MatGvlfnbuVikd4i8IDjrVRNaXzDKjrB87EOACo9?=
 =?us-ascii?Q?anWFUBlKJhXZgXjb170fqz1XwcA9WmexlnEUeHAJ6SoyFAuT5JXXw9H7HHiG?=
 =?us-ascii?Q?n+o5VW3zaU3YhozSFnxCMqMbHJmIUJZjzaSXcZ6yrm+EwQ/csTP2fUW07tWe?=
 =?us-ascii?Q?5yf2d8zPtB8/k2rHe+kQ7Pe8j0wu/xCdnn+DwQ4Np30i0D6WmiXOeNKgKpeh?=
 =?us-ascii?Q?CRlnfCEMxiW6HFl/EpMHhJIpTbhaZRRsfqbiHqI84X8HBMfLFO4ACLlNX2c+?=
 =?us-ascii?Q?8kJHxcTeFbziCSiyENo09u2GJPyPThsqrUEORMVrPxRgZXKmAA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?w3fQaI9zL5u+6CQwZwFKV2Gmm0foU4Zj6TmNQBAt6cL8RXRP9zk+CBl7Vkf3?=
 =?us-ascii?Q?XqW2aGZR/hjljdF1A36GcW0EuQKXmfP6QMPZcgEecb10hDIOcFKTUorZy2aF?=
 =?us-ascii?Q?JzNTQotlDMEq3MyC0WRsi0QkVReQW6nM5QnZEcEo8QVmqJilEYdZKQ4xuD/Z?=
 =?us-ascii?Q?rRymoG/+OP9Ta2SDpPHe1DnqJQ/eViCsfhLFfygSH3QLKlBU5zw+QBr29OMW?=
 =?us-ascii?Q?s8KwrifjGdTqKbvGLC5vDO2NKEdj0YDmSxVcuS8iLuyyQDUA6ovGhdl02YuV?=
 =?us-ascii?Q?XZNhAgC4X6bLbRICr3vEgbjhv94tJ3GUER26PfMuCnjjZb1Hl4dUUsrkgd8o?=
 =?us-ascii?Q?YkBM/BglZ+uacqUJX9ZGiEExOYqSSnAN5Zbxt3jqq/RABHijlpPjZ+vTw0HB?=
 =?us-ascii?Q?gUh/7ivnkGVs4gEDaMpxSrh/oW5Ije8DnWKAA7b3ImuxScTeNymAH3HAqohG?=
 =?us-ascii?Q?bHUg0AvgOiEd/5d/t66niYlgUP5D5igOlkiS27PUaHiP0nb6aOs15E8AkntH?=
 =?us-ascii?Q?TQ9FuFVLLfY8VRDVtGlHcKt4IvbCoLNQmgl7rmBNefcBO5q5t9cKNgfxs38W?=
 =?us-ascii?Q?O3Hk4kZm2tT3WmP2gBEN5YBV0AVuAcaeKZKdULgtlwroA0WeKCOGv1G1Al5k?=
 =?us-ascii?Q?xY38kdET8/rOawvA3pGMV0YQuls5yV6zNE/wxr8licfI1k1f7R8/pIrP3Hsk?=
 =?us-ascii?Q?6LWruH+uvKFtwtXOhaTbN48cUokFcepFBIZI+sFzrq2WaKxkS+oDnYGYWUSs?=
 =?us-ascii?Q?oTfyc0krNoSbWkCS3QFNxH/IcEtau+mCfJFLq1atE7NJ4oIN0ilDfq/j7TTV?=
 =?us-ascii?Q?lGL57I0BSIVMPlUkWT6/I4Pq2TTd0P2D6KLLzlCypVqOUuJhPm4cQshmEDT9?=
 =?us-ascii?Q?durMpITf4f0Ln4wRgbIN0s908IWJJXdFBK19UjR/xCqdjM5B5ah82oMUi66l?=
 =?us-ascii?Q?ITGjq8v//iIUYslxB8T2E44XrTAQm5VTxp/GQ7O315LHzgfiMZZQIXqXeRkF?=
 =?us-ascii?Q?Lop6ZeiKlqZ+BD28rBIrLy3n2V6+OPPRBxYfKXQvhzOQ94RXaS24JUaRGrK0?=
 =?us-ascii?Q?F46uXfviyH4ueD65L2HLcfuEFOkCdCGpdNEm0KxU00v1QyZcqw9HTzI+71ox?=
 =?us-ascii?Q?Vh/tgG9AEhNOc28w1UY45bBaz3kn5qF/wIL0gcB/Yw1l42DtroBz44A7p+mt?=
 =?us-ascii?Q?3IuFLH7wBVuq5hlpvWBDESVn7+lhNPRuhp30A3FT1tOccQ1O/ixLNLTAMyHF?=
 =?us-ascii?Q?7BzKAEiqm20sDISDCwtRx6fRubk6QIW/g/vAv2lMn65O9nfeOH3lRwjC4/Xn?=
 =?us-ascii?Q?ZEhfw22/lYHMfBbtq+staGWDdY7ZxlduyH2bHbX4S9TGs55MqFHdCa6zPugV?=
 =?us-ascii?Q?xSspT5Re/LRUnt3qkCbMx8mKI6T0tNHo/T+8Q+kJLeulHLYpyjiwkd0EKc+S?=
 =?us-ascii?Q?vAyBbI74a8I9kt1cSqj+3t9fMfR50D1fiHZXyOWJV7CdPMJuDFlS8NM/J9IG?=
 =?us-ascii?Q?yHCW1CvS3A90C7I1aNXuc1EvkgsW6AHo9JhA3P8CNly/Y2gkNVpbDcO2Ldtd?=
 =?us-ascii?Q?+Rlxue495U6mCIi9xduV9m/W8ur2sa3nFcZtmi8r3mSdJJr4F5z9n0Ajgirj?=
 =?us-ascii?Q?5Q=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aa97e12-dad9-407f-7842-08dccb226475
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2024 07:39:35.5999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: efJLjR/7b4rhszzDZydOvA7VXygSGWOxX+EDq7HrMHN10W0SQZdxCWEYPKNmbKR+2D6Ay1RkjFMkA/gJKuH+FKk9Cynw1S2dSIhi5tnvOqk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8271
X-Authority-Analysis: v=2.4 cv=c+X5Qg9l c=1 sm=1 tr=0 ts=66d56bbd cx=c_pps a=5b96o3JgDboJA9an2DnXiA==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=mDV3o1hIAAAA:8 a=MLAF8eHlqB6hnzG2DQsA:9
 a=t_K9ZgMfbzkpIzTG:21 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: bxVkUvm5xwiVIB8wgTrxMPCJxCx-fQPn
X-Proofpoint-GUID: bxVkUvm5xwiVIB8wgTrxMPCJxCx-fQPn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-09-01_06,2024-08-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxscore=0 clxscore=1011 lowpriorityscore=0 malwarescore=0 impostorscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.21.0-2407110000
 definitions=main-2409020062
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 07:39:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204060

From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>

[YOCTO #15338]
Enabled ptest integration in gcc-sanitizers.inc to facilitate the proper testing and execution of address sanitizer (ASan)

Defined the do_check task to execute ASan tests with proper environment setup and updated do_install_ptest_base to copy ASan test executables to the ptest directory. Included the run-ptest script to automate test execution.

The run-ptest script iterates through executable files copied from the host, runs each on the target, and logs the outcomes as either 'PASS' or 'XFAIL'. XFAIL is because these tests are expected to fail on the host system as per dejagnu as { dg-shouldfail "asan" }

Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 meta/recipes-devtools/gcc/gcc-14.2.inc        |  2 +
 meta/recipes-devtools/gcc/gcc-sanitizers.inc  | 43 ++++++++++++++++
 meta/recipes-devtools/gcc/gcc/asan-exp.patch  | 51 +++++++++++++++++++
 meta/recipes-devtools/gcc/gcc/run-ptest       | 28 ++++++++++
 5 files changed, 125 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/asan-exp.patch
 create mode 100755 meta/recipes-devtools/gcc/gcc/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 7b8418654a..13b15b8647 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -85,6 +85,7 @@ PTESTS_FAST = "\
     wayland \
     xz \
     zlib \
+    gcc-sanitizers \
 "
 PTESTS_FAST:append:libc-glibc = " glibc-y2038-tests"
 PTESTS_PROBLEMS:remove:libc-glibc = "glibc-y2038-tests"
diff --git a/meta/recipes-devtools/gcc/gcc-14.2.inc b/meta/recipes-devtools/gcc/gcc-14.2.inc
index f05484cfc0..72cd93f4bd 100644
--- a/meta/recipes-devtools/gcc/gcc-14.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-14.2.inc
@@ -68,6 +68,8 @@ SRC_URI = "${BASEURI} \
            file://0023-Fix-install-path-of-linux64.h.patch \
            file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.patch \
            file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
+	   file://asan-exp.patch \
+	   file://run-ptest \
 "
 
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/${SOURCEDIR}"
diff --git a/meta/recipes-devtools/gcc/gcc-sanitizers.inc b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
index 524ebd4ba4..bb617cc9de 100644
--- a/meta/recipes-devtools/gcc/gcc-sanitizers.inc
+++ b/meta/recipes-devtools/gcc/gcc-sanitizers.inc
@@ -119,3 +119,46 @@ FILES:libtsan-dev += "\
 FILES:libtsan-staticdev += "${libdir}/libtsan.a"
 
 FILES:${PN} = "${libdir}/*.spec ${libdir}/${TARGET_SYS}/${BINV}/include/sanitizer/*.h"
+
+require gcc-testsuite.inc
+inherit ptest
+
+# test only asan.exp related testcases
+MAKE_CHECK_RUNTESTFLAGS ??= "${MAKE_CHECK_BOARDARGS} asan-ptest.exp"
+
+# specific host and target dependencies required for test suite running
+do_check[depends] += "dejagnu-native:do_populate_sysroot expect-native:do_populate_sysroot"
+do_check[depends] += "virtual/libc:do_populate_sysroot"
+# only depend on qemu if targeting linux user execution
+do_check[depends] += "${@'qemu-native:do_populate_sysroot' if "user" in d.getVar('TOOLCHAIN_TEST_TARGET') else ''}"
+do_check[prefuncs] += "extend_recipe_sysroot"
+do_check[prefuncs] += "check_prepare"
+do_check[dirs] = "${WORKDIR}/dejagnu ${B}"
+do_check() {
+    export DEJAGNU="${WORKDIR}/dejagnu/site.exp"
+    oe_runmake -i check-gcc RUNTESTFLAGS="${MAKE_CHECK_RUNTESTFLAGS}"
+}
+addtask check after do_compile before do_install_ptest_base
+
+do_install_ptest_base() {
+
+
+    ls ${B}/gcc/testsuite/gcc/*.exe > exe_files
+    tmp_file=$(cat exe_files)
+
+    echo "${tmp_file}"
+
+    install -d ${D}${PTEST_PATH}/tests/sanitizers-ptest/
+
+    for f in ${tmp_file}
+    do
+        cp -rf ${f} ${D}${PTEST_PATH}/tests/sanitizers-ptest/
+    done
+
+    install -d ${D}${PTEST_PATH}
+    cp ${S}/../sources-unpack/run-ptest ${D}${PTEST_PATH}/
+}
+
+INSANE_SKIP:${PN}-ptest += "ldflags buildpaths"
+INSANE_SKIP:${PN}-dbg += "buildpaths"
+FILES_${PN} += "${PTEST_PATH}/"
diff --git a/meta/recipes-devtools/gcc/gcc/asan-exp.patch b/meta/recipes-devtools/gcc/gcc/asan-exp.patch
new file mode 100644
index 0000000000..6ad8db56ef
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/asan-exp.patch
@@ -0,0 +1,51 @@
+Upstream-Status: Pending [gcc specific]
+---
+diff --git a/gcc/testsuite/gcc.dg/asan/asan-ptest.exp b/gcc/testsuite/gcc.dg/asan/asan-ptest.exp
+new file mode 100644
+index 000000000..4f05d90d0
+--- /dev/null
++++ b/gcc/testsuite/gcc.dg/asan/asan-ptest.exp
+@@ -0,0 +1,43 @@
++# Copyright (C) 2012-2024 Free Software Foundation, Inc.
++#
++# This file is part of GCC.
++#
++# GCC is free software; you can redistribute it and/or modify
++# it under the terms of the GNU General Public License as published by
++# the Free Software Foundation; either version 3, or (at your option)
++# any later version.
++#
++# GCC is distributed in the hope that it will be useful,
++# but WITHOUT ANY WARRANTY; without even the implied warranty of
++# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++# GNU General Public License for more details.
++#
++# You should have received a copy of the GNU General Public License
++# along with GCC; see the file COPYING3.  If not see
++# <http://www.gnu.org/licenses/>.
++
++# GCC testsuite that uses the `dg.exp' driver.
++
++# Load support procs.
++load_lib gcc-dg.exp
++load_lib asan-dg.exp
++
++# Initialize `dg'.
++dg-init
++# libasan uses libstdc++ so make sure we provide paths for it.
++asan_init 1
++
++# Main loop.
++if [check_effective_target_fsanitize_address] {
++    foreach testcase [lsort [glob -nocomplain $srcdir/$subdir/*.c ]] {
++        dg-test -keep-output $testcase  "" "" 
++    }
++    
++    foreach testcase [lsort [glob -nocomplain $srcdir/c-c++-common/asan/*.c ]] {
++        dg-test -keep-output $testcase  "" "" 
++    }
++}
++
++# All done.
++asan_finish
++dg-finish
diff --git a/meta/recipes-devtools/gcc/gcc/run-ptest b/meta/recipes-devtools/gcc/gcc/run-ptest
new file mode 100755
index 0000000000..b8dcd16e95
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/run-ptest
@@ -0,0 +1,28 @@
+#!/bin/sh
+
+# This script is used to run sanitizers test suites
+
+ptestdir=$(dirname "$(readlink -f "$0")")
+export SRC_PATH=$ptestdir
+
+cd $ptestdir/
+files=$(ls tests/sanitizers-ptest/*.exe)
+total_testcases=$(ls tests/sanitizers-ptest/*.exe | wc -l)
+passed=0
+failed=0
+
+for f in $files; do
+    $f >/dev/null 2>&1
+    retcode=$?
+    if [ $retcode -eq 0 ]; then
+        echo "PASS" : $f
+        ((passed++))
+    else
+        echo "XFAIL" : $f
+        ((failed++))
+    fi
+done
+
+echo "Total Testcases: $total_testcases"
+echo "Passed: $passed"
+echo "Xfailed: $failed"
-- 
2.43.0


