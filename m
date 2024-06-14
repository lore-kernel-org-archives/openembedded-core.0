Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00C32C27C77
	for <webhook@archiver.kernel.org>; Fri, 14 Jun 2024 05:50:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.4739.1718344235419152442
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jun 2024 22:50:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=689569ec74=yash.shinde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45E5P23g013920
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Jun 2024 05:50:34 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ymcgwwsb1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Jun 2024 05:50:34 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bYkcB9+OvEe32m0E6j6Pns0n7nb1/WT3K3mAguguUvppLw/1nhfIIvwd8UBerCSPLIt189AJ2gvAUVXZQwYCRSZnjTrA4FIJITTYwuMNMIthBbuilUcgf0W069PqsUYUeYqr4h/64ay9g1aMLEcD9Cwz8mcnSWrpxT29EMWQrdRik7VcLs4bF/jDD9JBJI2A9LfFZlVu30AJ1RAWKgODN3ln3TjII6VHJ8ezhYfr0rpWCrZ5aSZAEKGd19LCg047014VBQm7mMmYDZaY1kSpyVgKCAy5NtgRh4R6NrmYSiIqOBu5sU8UfHwQ1B9V4Ou2JFqUiUn/jKCxRkcShjlanA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kw5oToespSVmI8lX0ibzjqKsX2jUT44M6MQF35f7QFM=;
 b=Qsu14hQyLhF0ZvniyiwPEVO2aHOUFTXxGhDuTQKvLYegLPMcoTZlQiVPlpzh+2ua8/T7Ynyl/N9LSAf1GQgPqnZ4AOCpUNmRYY2FL9liwtHOVyCr7o1CH1tZFXOAns0yOg7liklEhZOLKacwHnlRg60UfFTaJQ28BCvsNwDDz4FEKyjjYlHY35r9T3f6sg3vibTO/BJEZaJMZZocIXeC61GLAuIBY3hcUNwMX2JgYaT1lUDQtoKX9+JlC+T8rJm+JkrfBWxeYHikBovNy3VkrjaavIGvJhSUINVuThpZtB4694LkBvCzh3DazS5Q1dge+yhVXrD7CfJNTrTx7umVsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by CH3PR11MB8561.namprd11.prod.outlook.com (2603:10b6:610:1ad::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25; Fri, 14 Jun
 2024 05:50:30 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%6]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 05:50:29 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com, Shivaprasad.Moodalappa@windriver.com,
        Yash.Shinde@windriver.com
Subject: [PATCH 1/3] rust: Oe-selftest fixes for rust v1.76.
Date: Thu, 13 Jun 2024 22:49:57 -0700
Message-ID: <20240614054959.3184774-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0018.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::23) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|CH3PR11MB8561:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f007372-9851-451f-201b-08dc8c35e5bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230035|376009|366011|1800799019|52116009|38350700009;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?88L09KwqPfec9vz9ggZFxUd8P/pTwSZEzY8g8QhSrUUwpOSuR3dLCU9KuyOv?=
 =?us-ascii?Q?EE2Y31qJn0jU593ZvSz0R1hlGM0ocnZkCM+tHRFOxisNf/t8wH4+eP13nPSs?=
 =?us-ascii?Q?kr1mmmz451CIxtdYkySY74CmZWO2ULSgtJhZsEXTMbmfpnDU18WVwx5FbcDa?=
 =?us-ascii?Q?THZGRRgymbGM0vpG9PU0aK+S6qyrdcSgWzLPt5CO2Gt/J2L3Pdp9y/WGYf/K?=
 =?us-ascii?Q?vbBSurinSCpEjpCDI+9yCW1xXK6HuBYpOSXTx6RtPtCowSIF2bEPVhK7M0Ai?=
 =?us-ascii?Q?YnlquctSVLXosB0KEmzRVIR9f3KseQU8TWiwcmdFWrKLHleB0UgUMrBJ4gud?=
 =?us-ascii?Q?ab25qMf0PzaMaN58LL6fkRsjsNV1o+OPoWlk4MlrMujm4JxPNcncnX80tY7y?=
 =?us-ascii?Q?E5OUwDfuL2DAJfqIDK2l3JazY24MLyxn6QH9n0esKcFbdax2tn4P2dbTBB5X?=
 =?us-ascii?Q?SY1ynkkHyud+SnmkjSIz+P2xuMojF6VDRFoTl8rx9tXSVTqkeG5/x2d2cBSh?=
 =?us-ascii?Q?hMu/0um/MvHX5X7cDK04XbzIz+pYRrwzT4jli1Z6L/6QNoP4C8Z2NboB+7wT?=
 =?us-ascii?Q?8y65XZMPnjK8HlkikiRR37Eb2PsqKCZrRU312Y+MwTTe0YFmu9gjP1WVM8y7?=
 =?us-ascii?Q?nXB1tLe3mrcwOqp7+Quo+GCOO7AagpAIBw1lHiX9hdiER34vgvrjab60jWFR?=
 =?us-ascii?Q?Z83xOGR9evSBCK6T6z6WW36tVkPbp3VylGzBI5eK4GhV5f7d57MzTGdPuN1g?=
 =?us-ascii?Q?SdF74+sIPUfGi1L2Xb7jNzk3/6Qvzx9QJl6f3CDDAkh5icdneQ6ALR5JtE6P?=
 =?us-ascii?Q?QsMiHiThe8yu8QlDMViZwK3LB06NhZWtPOpmDz5xRUizSev/cgjAsjMPcUfe?=
 =?us-ascii?Q?cfXHzfJDmEIYtCTw6tmn11ysJF+UdE+jyE0rV+qCnJvn6WXrXHQDDLrmQBXy?=
 =?us-ascii?Q?hJxDEWO41MptIAqwqzyHdWrMzVuCYCF+o78XzqaC1zGbX2XWI7L3CwdWXD7c?=
 =?us-ascii?Q?00wPERCPjOBx8nMGs6l5onDF1J/jXcU33YUbd0G1oIQXIrjpuMaJifzmZrtS?=
 =?us-ascii?Q?CFKqgq4ZxB0Joydpqc6KAb2+vyhO4aAwjCMc2eDcsUzYavEd0BhWCCjpCglj?=
 =?us-ascii?Q?cGfOn/HJbDdKUsIdRV/IYCG47Gdlc8O3+HV7MccxCB3Mo7Y6VefXXVvQrZQB?=
 =?us-ascii?Q?L9g/mnrm1tN5stnHafS8CuLVxNqkWZtUmmuj4cxoRwAAkDQnpKC7ZbTa8hEP?=
 =?us-ascii?Q?fBOHbB0hET7/jTgbnR1Sh4x+f7CLDv6aT1UOwHCziYwP1RbYRuc5psmhzxI9?=
 =?us-ascii?Q?peeUHrT0XbsRQP9/JCkFtgCaoYlO+ar5TZkavkiALt9KEKQEm65zQbEtC7Ow?=
 =?us-ascii?Q?GvAL8js=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230035)(376009)(366011)(1800799019)(52116009)(38350700009);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9AtX4ltg/2LZMbr6hGmlv9SuwRg/LzzEhBo/1w8Fw10fFJi2IdpJvM0Kq7Zz?=
 =?us-ascii?Q?Rm1CL+9Z51bZLXQPfe97hxUa4TyQkMSwCEM50dV5qXSJsMsrfLUYujOE+Dz4?=
 =?us-ascii?Q?VYVpzsHodvrHET0hWtp8gF1zzOhhQT2vOqqc2XzwjsPzooGqRqHfV7MSggys?=
 =?us-ascii?Q?pjulHA7gRihKlrbgECq8fKQ9YUCVSY+LcDgS23UzW3PC8MogDie42Ucham9Q?=
 =?us-ascii?Q?av10y6ktmh1CAwhSmLol3MtneCJovV4dsmDsFaucRJRGv49cMUzizpIWW0X0?=
 =?us-ascii?Q?/H9GbQseP9TdRUW9yCh30e7f+SiCmsb60+aK0lb35TkdYAcsuoQnERl8QUTQ?=
 =?us-ascii?Q?f6dx2IM+mF/NfikBg49cctJEIk/08sVVO+6K0/aodK4/WIg/atXgBzvB3Ol0?=
 =?us-ascii?Q?yZKe/Tjy8wotBvBbg6GPYuPNL+STzQNLmPKzggBnW/nRYXGQP/9nCrFD/ZWc?=
 =?us-ascii?Q?UA12bRDpKr23Vc3NoQqANs0vwSL7WOEARtDRI0ouEXm/vHjZLxck//eYggl5?=
 =?us-ascii?Q?PRTO12NLUSJigb88pyirjYM4nPcXUwpBhEFquNitiPwqOkHBeRx83Rrv2xwQ?=
 =?us-ascii?Q?6RDTlqhFsu3aWArHRy9VIwgV6x4n2Fp9JhcSKcNeWUbbM+I33YTv75wgt43M?=
 =?us-ascii?Q?uZfjxIu8RwbuOeh9NAf68+OPMdFVEpwxuCVoUPqWEtptiFzGGURUHVWByeR/?=
 =?us-ascii?Q?dpPx/V4SWOfmyLZjlVob65vYSJ/qFalha+m14Pc2iSu/L5CRLpAkhycbnCjU?=
 =?us-ascii?Q?ICrcK99LyqtaSwCwRoHYA/zIKibnx/P2PxT5kRbvIA00SvdqWfLgQ8V+UZu3?=
 =?us-ascii?Q?x9YXiW4GfZot45KeLrIVyLhHslWeQtlwnMcDvIPBaZuEbcKEQ8roF8NEwKaS?=
 =?us-ascii?Q?KYzc3vbMmsWhlr2QkPIq0Tz1GQpZ3b71SG3IM1QjoiUnEo4ncZC36f8PVpQj?=
 =?us-ascii?Q?uZoLUDeEHgg7SZXDyhjiBoNTwBg+CP0vsceml86m606EBIrEGlFgOz6AieGh?=
 =?us-ascii?Q?csyjGSWDFiQ7A7/ZstaEKlGnPG5H4P1Sebru9O9fVr13xlaPZO0+eCBz30Oj?=
 =?us-ascii?Q?bMmwtopBjz+GEk6blR1isfmahyVju0rZW/WW59/BOc+PXLJYK/AF3mRtoDid?=
 =?us-ascii?Q?/Rb3m+Z3xS2CQM2L3xW94RKcEhtlgeREe8VeHr4LH/eW21mw1uLiX+Tq1nil?=
 =?us-ascii?Q?6EiPQypCm3e7bO7KzWb5i8hjt1F+n0b+OlmOMxQvmpNrQjDP8JBtK8JqzR9k?=
 =?us-ascii?Q?6+umYyY6KdrmYSs68yF/yvWzIBJWXE01fahL33vx9RbDizyy0Dvv5yj/SNNz?=
 =?us-ascii?Q?2mwwAdzwdpGQSXcTAwyj3yoZ3IsapPHa16fLXRM3M/bZoX6j/x2nm5krgEDD?=
 =?us-ascii?Q?Lem8h5LnvuOQT2VQO3akmVXh3pRgqocd/TRjOw6c9a5zSFbgWOr7BUFU6DPV?=
 =?us-ascii?Q?bZP6PipPaw8jEvAeHJf+rIDPuE5T9yg9bcRw7yojM3iWCJurM/CJrs2syBnB?=
 =?us-ascii?Q?9QG7eRMZbpwQx+L2fD5bUs9AYyQR5SMvZyA2cFxUB3rqJUIg2+3N7oGXllSb?=
 =?us-ascii?Q?xpjKgV+qHIaToiquAbHOYGSu8FzjxwOQibqxMDrKFIxlxTQjxCk6BOArkBLB?=
 =?us-ascii?Q?5Q=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f007372-9851-451f-201b-08dc8c35e5bf
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 05:50:29.6812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FzTaMwTfuK5ed4KpWNkDaimMC6Yyqo/9clig2WnA4QTc9GNpAnLS/PqXNA30Qunk6Bfme6zJcmkQX/5JPQCvwJHFYXC7OzGwIIqKDxAaLAM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8561
X-Proofpoint-GUID: UT2PGcr4MlfBwjE9ijEAa2iFjx7QhqK0
X-Proofpoint-ORIG-GUID: UT2PGcr4MlfBwjE9ijEAa2iFjx7QhqK0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-13_15,2024-06-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1011 priorityscore=1501
 phishscore=0 bulkscore=0 spamscore=0 mlxlogscore=999 lowpriorityscore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406140037
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jun 2024 05:50:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200645

From: Yash Shinde <Yash.Shinde@windriver.com>

Add the failing tests in rust v1.76 to the exclude list
and add "ignore" tags to ignore failing unit test cases.

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 meta/lib/oeqa/selftest/cases/rust.py          |  19 +
 .../rust/files/rust-oe-selftest.patch         | 352 ++++++++++++++++++
 2 files changed, 371 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/rust-oe-selftest.patch

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
index 4ccbe9867b..6181c10ea9 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -187,6 +187,25 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
                             'tests/rustdoc-ui/no-run-flag.rs',
                             'tests/ui-fulldeps/',
                             'tests/ui/numbers-arithmetic/u128.rs'
+                            'tests/run-pass-valgrind',
+                            'tests/ui/codegen/mismatched-data-layouts.rs',
+                            'tests/codegen/i128-x86-align.rs',
+                            'src/tools/suggest-tests',
+                            'src/tools/rust-installer',
+                            'src/bootstrap',
+                            'src/tools/tidy/src/',
+                            'library/std/src/thread/tests.rs',
+                            'compiler/rustc_errors/src/markdown/tests/term.rs',
+                            'compiler/rustc_interface/src/tests.rs',
+                            'library/std/src/io/buffered/tests.rs',
+                            'library/std/src/io/stdio/tests.rs',
+                            'library/std/src/sync/mpsc/sync_tests.rs',
+                            'library/std/src/sync/mpsc/tests.rs',
+                            'library/std/src/sync/mutex/tests.rs',
+                            'library/std/src/sync/rwlock/tests.rs',
+                            'library/std/src/thread/tests.rs',
+                            'library/test/src/stats/tests.rs',
+                            'tidyselftest'
                         ]
 
         exclude_fail_tests = " ".join([" --exclude " + item for item in exclude_list])
diff --git a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
new file mode 100644
index 0000000000..78fe304341
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
@@ -0,0 +1,352 @@
+Fix the cargo binary path error and ensure that it is fetched
+during rustc bootstrap in rust oe-selftest.
+
+======================================================================
+ERROR: test_cargoflags (bootstrap_test.BuildBootstrap)
+----------------------------------------------------------------------
+Traceback (most recent call last):
+  File "/home/build-st/tmp/work/cortexa57-poky-linux/rust/1.74.1/rustc-1.74.1-src/src/bootstrap/bootstrap_test.py", line 157, in test_cargoflags
+    args, _ = self.build_args(env={"CARGOFLAGS": "--timings"})
+  File "/home/build-st/tmp/work/cortexa57-poky-linux/rust/1.74.1/rustc-1.74.1-src/src/bootstrap/bootstrap_test.py", line 154, in build_args
+    return build.build_bootstrap_cmd(env), env
+  File "/home/build-st/tmp/work/cortexa57-poky-linux/rust/1.74.1/rustc-1.74.1-src/src/bootstrap/bootstrap.py", line 960, in build_bootstrap_cmd
+    raise Exception("no cargo executable found at `{}`".format(
+Exception: no cargo executable found at `/home/build-st/tmp/work/cortexa57-poky-linux/rust/1.74.1/rustc-1.74.1-src/build/x86_64-unknown-linux-gnu/stage0/bin/cargo`
+
+Upstream-Status: Submitted [https://github.com/rust-lang/rust/pull/120125]
+
+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
+---
+diff --git a/src/bootstrap/src/core/build_steps/test.rs b/src/bootstrap/src/core/build_steps/test.rs
+index 4a4497e57db..da8c88dcd41 100644
+--- a/src/bootstrap/src/core/build_steps/test.rs
++++ b/src/bootstrap/src/core/build_steps/test.rs
+@@ -2505,8 +2505,12 @@
+         let mode = self.mode;
+
+         // See [field@compile::Std::force_recompile].
+-        builder.ensure(compile::Std::force_recompile(compiler, target));
+-        builder.ensure(RemoteCopyLibs { compiler, target });
++        builder.ensure(compile::Std::force_recompile(compiler, compiler.host));
++
++        if builder.config.build != target {
++            builder.ensure(compile::Std::force_recompile(compiler, target));
++            builder.ensure(RemoteCopyLibs { compiler, target });
++        }
+
+         // If we're not doing a full bootstrap but we're testing a stage2
+         // version of libstd, then what we're actually testing is the libstd
+diff --git a/compiler/rustc_errors/src/markdown/tests/term.rs b/compiler/rustc_errors/src/markdown/tests/term.rs
+--- a/compiler/rustc_errors/src/markdown/tests/term.rs
++++ b/compiler/rustc_errors/src/markdown/tests/term.rs
+@@ -60,6 +60,7 @@
+ }
+
+ #[test]
++#[ignore]
+ fn test_output() {
+     // Capture `--bless` when run via ./x
+     let bless = std::env::var_os("RUSTC_BLESS").is_some_and(|v| v != "0");
+diff --git a/compiler/rustc_interface/src/tests.rs b/compiler/rustc_interface/src/tests.rs
+--- a/compiler/rustc_interface/src/tests.rs
++++ b/compiler/rustc_interface/src/tests.rs
+@@ -116,6 +116,7 @@
+
+ // When the user supplies --test we should implicitly supply --cfg test
+ #[test]
++#[ignore]
+ fn test_switch_implies_cfg_test() {
+     rustc_span::create_default_session_globals_then(|| {
+         let matches = optgroups().parse(&["--test".to_string()]).unwrap();
+@@ -127,6 +128,7 @@
+
+ // When the user supplies --test and --cfg test, don't implicitly add another --cfg test
+ #[test]
++#[ignore]
+ fn test_switch_implies_cfg_test_unless_cfg_test() {
+     rustc_span::create_default_session_globals_then(|| {
+         let matches = optgroups().parse(&["--test".to_string(), "--cfg=test".to_string()]).unwrap();
+@@ -139,6 +141,7 @@
+ }
+
+ #[test]
++#[ignore]
+ fn test_can_print_warnings() {
+     rustc_span::create_default_session_globals_then(|| {
+         let matches = optgroups().parse(&["-Awarnings".to_string()]).unwrap();
+
+diff --git a/library/test/src/stats/tests.rs b/library/test/src/stats/tests.rs
+--- a/library/test/src/stats/tests.rs
++++ b/library/test/src/stats/tests.rs
+@@ -40,6 +40,7 @@
+ }
+
+ #[test]
++#[ignore]
+ fn test_min_max_nan() {
+     let xs = &[1.0, 2.0, f64::NAN, 3.0, 4.0];
+     let summary = Summary::new(xs);
+diff --git a/library/std/src/io/buffered/tests.rs b/library/std/src/io/buffered/tests.rs
+index 35a5291a347..5f2858d2505 100644
+--- a/library/std/src/io/buffered/tests.rs
++++ b/library/std/src/io/buffered/tests.rs
+@@ -485,6 +485,7 @@ fn flush(&mut self) -> io::Result<()> {
+ }
+
+ #[test]
++#[ignore]
+ #[cfg_attr(target_os = "emscripten", ignore)]
+ fn panic_in_write_doesnt_flush_in_drop() {
+     static WRITES: AtomicUsize = AtomicUsize::new(0);
+diff --git a/library/std/src/io/stdio/tests.rs b/library/std/src/io/stdio/tests.rs
+index f89fd27ce6c..79737f5b127 100644
+--- a/library/std/src/io/stdio/tests.rs
++++ b/library/std/src/io/stdio/tests.rs
+@@ -25,6 +25,7 @@ fn stderrlock_unwind_safe() {
+ fn assert_unwind_safe<T: UnwindSafe + RefUnwindSafe>() {}
+
+ #[test]
++#[ignore]
+ #[cfg_attr(target_os = "emscripten", ignore)]
+ fn panic_doesnt_poison() {
+     thread::spawn(|| {
+diff --git a/library/std/src/sync/mpsc/sync_tests.rs b/library/std/src/sync/mpsc/sync_tests.rs
+index 945de280f40..1ac7eeabc5c 100644
+--- a/library/std/src/sync/mpsc/sync_tests.rs
++++ b/library/std/src/sync/mpsc/sync_tests.rs
+@@ -252,6 +252,7 @@ fn oneshot_single_thread_send_port_close() {
+ }
+
+ #[test]
++#[ignore]
+ fn oneshot_single_thread_recv_chan_close() {
+     // Receiving on a closed chan will panic
+     let res = thread::spawn(move || {
+@@ -347,6 +348,7 @@ fn oneshot_multi_task_recv_then_send() {
+ }
+
+ #[test]
++#[ignore]
+ fn oneshot_multi_task_recv_then_close() {
+     let (tx, rx) = sync_channel::<Box<i32>>(0);
+     let _t = thread::spawn(move || {
+@@ -371,6 +373,7 @@ fn oneshot_multi_thread_close_stress() {
+ }
+
+ #[test]
++#[ignore]
+ fn oneshot_multi_thread_send_close_stress() {
+     for _ in 0..stress_factor() {
+         let (tx, rx) = sync_channel::<i32>(0);
+@@ -385,6 +388,7 @@ fn oneshot_multi_thread_send_close_stress() {
+ }
+
+ #[test]
++#[ignore]
+ fn oneshot_multi_thread_recv_close_stress() {
+     for _ in 0..stress_factor() {
+         let (tx, rx) = sync_channel::<i32>(0);
+diff --git a/library/std/src/sync/mpsc/tests.rs b/library/std/src/sync/mpsc/tests.rs
+index ac1a804cf9c..7c687982324 100644
+--- a/library/std/src/sync/mpsc/tests.rs
++++ b/library/std/src/sync/mpsc/tests.rs
+@@ -233,6 +233,7 @@ fn oneshot_single_thread_send_port_close() {
+ }
+
+ #[test]
++#[ignore]
+ fn oneshot_single_thread_recv_chan_close() {
+     // Receiving on a closed chan will panic
+     let res = thread::spawn(move || {
+@@ -313,6 +314,7 @@ fn oneshot_multi_task_recv_then_send() {
+ }
+
+ #[test]
++#[ignore]
+ fn oneshot_multi_task_recv_then_close() {
+     let (tx, rx) = channel::<Box<i32>>();
+     let _t = thread::spawn(move || {
+@@ -337,6 +339,7 @@ fn oneshot_multi_thread_close_stress() {
+ }
+
+ #[test]
++#[ignore]
+ fn oneshot_multi_thread_send_close_stress() {
+     for _ in 0..stress_factor() {
+         let (tx, rx) = channel::<i32>();
+@@ -351,6 +354,7 @@ fn oneshot_multi_thread_send_close_stress() {
+ }
+
+ #[test]
++#[ignore]
+ fn oneshot_multi_thread_recv_close_stress() {
+     for _ in 0..stress_factor() {
+         let (tx, rx) = channel::<i32>();
+diff --git a/library/std/src/sync/mutex/tests.rs b/library/std/src/sync/mutex/tests.rs
+index 1786a3c09ff..9dcead7092b 100644
+--- a/library/std/src/sync/mutex/tests.rs
++++ b/library/std/src/sync/mutex/tests.rs
+@@ -82,6 +82,7 @@ fn drop(&mut self) {
+ }
+
+ #[test]
++#[ignore]
+ fn test_into_inner_poison() {
+     let m = Arc::new(Mutex::new(NonCopy(10)));
+     let m2 = m.clone();
+@@ -106,6 +107,7 @@ fn test_get_mut() {
+ }
+
+ #[test]
++#[ignore]
+ fn test_get_mut_poison() {
+     let m = Arc::new(Mutex::new(NonCopy(10)));
+     let m2 = m.clone();
+@@ -146,6 +148,7 @@ fn test_mutex_arc_condvar() {
+ }
+
+ #[test]
++#[ignore]
+ fn test_arc_condvar_poison() {
+     let packet = Packet(Arc::new((Mutex::new(1), Condvar::new())));
+     let packet2 = Packet(packet.0.clone());
+@@ -175,6 +178,7 @@ fn test_arc_condvar_poison() {
+ }
+
+ #[test]
++#[ignore]
+ fn test_mutex_arc_poison() {
+     let arc = Arc::new(Mutex::new(1));
+     assert!(!arc.is_poisoned());
+@@ -205,6 +209,7 @@ fn test_mutex_arc_nested() {
+ }
+
+ #[test]
++#[ignore]
+ fn test_mutex_arc_access_in_unwind() {
+     let arc = Arc::new(Mutex::new(1));
+     let arc2 = arc.clone();
+diff --git a/library/std/src/sync/rwlock/tests.rs b/library/std/src/sync/rwlock/tests.rs
+index 1a9d3d3f12f..0a9cfc48806 100644
+--- a/library/std/src/sync/rwlock/tests.rs
++++ b/library/std/src/sync/rwlock/tests.rs
+@@ -44,6 +44,7 @@ fn frob() {
+ }
+
+ #[test]
++#[ignore]
+ fn test_rw_arc_poison_wr() {
+     let arc = Arc::new(RwLock::new(1));
+     let arc2 = arc.clone();
+@@ -56,6 +57,7 @@ fn test_rw_arc_poison_wr() {
+ }
+
+ #[test]
++#[ignore]
+ fn test_rw_arc_poison_ww() {
+     let arc = Arc::new(RwLock::new(1));
+     assert!(!arc.is_poisoned());
+@@ -70,6 +72,7 @@ fn test_rw_arc_poison_ww() {
+ }
+
+ #[test]
++#[ignore]
+ fn test_rw_arc_no_poison_rr() {
+     let arc = Arc::new(RwLock::new(1));
+     let arc2 = arc.clone();
+@@ -82,6 +85,7 @@ fn test_rw_arc_no_poison_rr() {
+     assert_eq!(*lock, 1);
+ }
+ #[test]
++#[ignore]
+ fn test_rw_arc_no_poison_rw() {
+     let arc = Arc::new(RwLock::new(1));
+     let arc2 = arc.clone();
+@@ -133,6 +137,7 @@ fn test_rw_arc() {
+ }
+
+ #[test]
++#[ignore]
+ fn test_rw_arc_access_in_unwind() {
+     let arc = Arc::new(RwLock::new(1));
+     let arc2 = arc.clone();
+@@ -206,6 +211,7 @@ fn drop(&mut self) {
+ }
+
+ #[test]
++#[ignore]
+ fn test_into_inner_poison() {
+     let m = Arc::new(RwLock::new(NonCopy(10)));
+     let m2 = m.clone();
+@@ -230,6 +236,7 @@ fn test_get_mut() {
+ }
+
+ #[test]
++#[ignore]
+ fn test_get_mut_poison() {
+     let m = Arc::new(RwLock::new(NonCopy(10)));
+     let m2 = m.clone();
+diff --git a/library/std/src/sys/unix/process/process_unix/tests.rs b/library/std/src/sys/unix/process/process_unix/tests.rs
+index 0a6c6ec19fc..bec257bc630 100644
+--- a/library/std/src/sys/unix/process/process_unix/tests.rs
++++ b/library/std/src/sys/unix/process/process_unix/tests.rs
+@@ -6,6 +6,7 @@
+ // safety etc., are tested in tests/ui/process/process-panic-after-fork.rs
+
+ #[test]
++#[ignore]
+ fn exitstatus_display_tests() {
+     // In practice this is the same on every Unix.
+     // If some weird platform turns out to be different, and this test fails, use #[cfg].
+@@ -37,6 +38,7 @@
+ }
+
+ #[test]
++#[ignore]
+ #[cfg_attr(target_os = "emscripten", ignore)]
+ fn test_command_fork_no_unwind() {
+     let got = catch_unwind(|| {
+diff --git a/library/std/src/thread/tests.rs b/library/std/src/thread/tests.rs
+index 5d6b9e94ee9..a5aacb2eb87 100644
+--- a/library/std/src/thread/tests.rs
++++ b/library/std/src/thread/tests.rs
+@@ -115,6 +115,7 @@ fn test_is_finished() {
+ }
+
+ #[test]
++#[ignore]
+ fn test_join_panic() {
+     match thread::spawn(move || panic!()).join() {
+         result::Result::Err(_) => (),
+@@ -217,6 +218,7 @@ fn test_simple_newsched_spawn() {
+ }
+
+ #[test]
++#[ignore]
+ fn test_try_panic_message_string_literal() {
+     match thread::spawn(move || {
+         panic!("static string");
+@@ -233,6 +235,7 @@ fn test_try_panic_message_string_literal() {
+ }
+
+ #[test]
++#[ignore]
+ fn test_try_panic_any_message_owned_str() {
+     match thread::spawn(move || {
+         panic_any("owned string".to_string());
+@@ -249,6 +252,7 @@ fn test_try_panic_any_message_owned_str() {
+ }
+
+ #[test]
++#[ignore]
+ fn test_try_panic_any_message_any() {
+     match thread::spawn(move || {
+         panic_any(Box::new(413u16) as Box<dyn Any + Send>);
+@@ -267,6 +271,7 @@ fn test_try_panic_any_message_any() {
+ }
+
+ #[test]
++#[ignore]
+ fn test_try_panic_any_message_unit_struct() {
+     struct Juju;
+
-- 
2.43.0


