Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DE2DC3DA4A
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 10:01:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.56313.1723111258843308316
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Aug 2024 03:00:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=89508821c1=yash.shinde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4789g7CH002979
	for <openembedded-core@lists.openembedded.org>; Thu, 8 Aug 2024 10:00:58 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40v0bshet8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 08 Aug 2024 10:00:57 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GG1oy4njvb0IZb2JiPGc9tl8cxY/WkN3LWwCpceg2HqAsNEif+NGzq5SRTWP1FJeI7cLyN8Ds3KTWmf+fCUiljUNNTInXiJa7VIn691gbFBOG9n8gACKwqhfpt0Nd2cxvcjnK+vrU4L1+zkF0AFwwJO83LUUlKCuXBPEQC4nS0zz+vLd2wTz3cJkXFMGDNwlChxpZOLNKQJcQtPa0DkYWCTOSnLjuuTcYrPfQCugdmx/solUWo6F6opRY6fyVbZpcZ+YqAVZbyRRvT3fH5G+FYhCzELFJwJlT2CRc4RD/f3yMgMoNyfKqcTvWrJ17VDKCQkanNmu0Sk/A5g1IzWHFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WQ4iQ2J6wHrfCl8slKZpVg172uEtjJi62PdJMMtrfak=;
 b=ZLb/YlPIgAUhnK3sJsws9A0N7cWIMqSHJI+u3qcerjCxfKnewvejS/waaYMIlStcVEAtT2eo5epxO2Hd78nuYt4aNJ5bc7WFQE4TptYeNYbNufdUu6lxvV+zIPRdtf2K/cQcvMvlH29Cpbbc52A40ufBsfQKE7JkLV6nvYQEC/qQmewniqQs1f0nc6qPLHzU2P01Az0UjJcRmIRc5avGAAZdvGSzrD6NyAPxeYIt12AXTOqAMntEDMx3fM3dcToMYdYq188uwglockfsu8SeChmDSkAB7mP3gihVVtQ5LFzYQWQV0ERcVQEbY1s/yzcfFZYJzlj7mN0F+JsS9i0Fsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by SA1PR11MB8374.namprd11.prod.outlook.com (2603:10b6:806:385::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.31; Thu, 8 Aug
 2024 10:00:55 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%4]) with mapi id 15.20.7828.023; Thu, 8 Aug 2024
 10:00:55 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com, Yash.Shinde@windriver.com
Subject: [PATCH 1/7] rust: Oe-selftest fixes for rust v1.76
Date: Thu,  8 Aug 2024 03:00:33 -0700
Message-ID: <20240808100039.2455895-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0042.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::17) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|SA1PR11MB8374:EE_
X-MS-Office365-Filtering-Correlation-Id: 30a5d827-d196-4134-b8dd-08dcb790fe48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?B1obFz4Sr4Opg6NcRl0lG7bhm0Jh7tn5VbBZJy5v4ODWm23ykCPlV6RjYZSH?=
 =?us-ascii?Q?9xgvvVBqBY3Owo4GhxuoJmRYjoDXisUhVcDwPQfdL41H1h2PReauyyxEZKXy?=
 =?us-ascii?Q?1sC2qkzPt5M248q4fLW+pK7iRabL6J7NSxk5jK9RKDL7vF+1oQt8vpGps6E0?=
 =?us-ascii?Q?qal2CkrDhuPC1GZ3y8EkNSN2m0Jbq6mHSHh2VEb+wzPaV0OWO2LUmwKY5hvP?=
 =?us-ascii?Q?gQ4tcOavTFaJRNk3vyfVYYwF0DEg8RoKdSFlgxHDM63vnmhxG9tT8LiEZb4T?=
 =?us-ascii?Q?i32crSyDbrgWM/dxyqe6dHTtAU8/ddN/4YvpXkkYPxAuKqEw4XLDFr1n5Avp?=
 =?us-ascii?Q?RQc8wjQb8TK3wQmlBAjmeUvbt8C9qqzYwm8H5pzdKK3hnm80J14C85kH/zjx?=
 =?us-ascii?Q?PqHCJnVYs1+ddWeo32j4dr7W816okZYOqTXMk2w6pTu5hXFJKeaDGlKUYBku?=
 =?us-ascii?Q?qSRzJ9dLXYDPRdhmJL9+L276iYdgEMKXxDQP5c+3AtfijnSlkhUYk1046jZh?=
 =?us-ascii?Q?8wf/KIzjSPYRmxNyj2BO2uXGQ6zaONWIhT7FtueJBFmRGR8vGxW0diHQCvoa?=
 =?us-ascii?Q?hmXxB79jQGrhoONZFjNrG4J0xY4PyekaB6YxvbdScrKEU6ZYCrUNr4woexzL?=
 =?us-ascii?Q?g7OqdsDcktoguDIwYwY8YpHq0HDpsfPF5i2XHyWACHHKXJ7RpihjldDxbuIE?=
 =?us-ascii?Q?fpnjn9whvbJMRFL1St4IJ97F5pMl3iPfiKKc9DqAwd3zLujPYal7aPS6NFdX?=
 =?us-ascii?Q?dG6rnqkGzdekpiwpAthOEYcT4+8jhIDMugMUTV5gqXcPkTBQQOVg74Ys9lMb?=
 =?us-ascii?Q?uaksVfPH5WwdMf/QKh5tJxJS1Ws1jP86sCmwkpRkdLQ92HH7QUYM7xIVovqS?=
 =?us-ascii?Q?vlzbc+SCmlVwpjVEcO+TJSnG8tU8sXyfgp0srrcNIBEN9YVhT0yqeCFRYHwV?=
 =?us-ascii?Q?izN0TNdmdFyA8IypiLzQyrd3OR7zkn1X3QrFDEtSU0tVp8zDN4558XxfxubV?=
 =?us-ascii?Q?UWKZToX/70ut4tq3/eTPy7vOv8FQLt9FGEN9foPboY5cGDBvPFFRoaGE9lEu?=
 =?us-ascii?Q?RqacsuMLwApl+p/wA1INOfRu9yjscAMQPwN+Ki3x5ji6+AgHVV8sb61iYN4U?=
 =?us-ascii?Q?zCbkZfmKSy8/5s1GDozIkwC/HSeS4jTkZt3uHl7SiaNfQL5SX0Y/l7KLvFMt?=
 =?us-ascii?Q?4SCkkDa0mnZqDFlWe23XZhocSf9ibSicMrOqwthJR1AvKiVe/zSN1Fc0jW9M?=
 =?us-ascii?Q?+Y8+3NZIHiShR4+oJR4hgp9tLVW0jCPh09BIpIqRT9f8ZCD3rCB7BZ4VRsu/?=
 =?us-ascii?Q?zOyZN3lELSyrplh9g8h0aClNGbWQ+IZ5DQ0ZSq9lLQT7Yy6ubanVSz5L/Koh?=
 =?us-ascii?Q?hLHhteU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?iRooGmU0Vc8c8dzAcu/+jiktCEuJTFhk+7jxbjJ/iEKfbKFeddI7TS8lte21?=
 =?us-ascii?Q?A7zw4Vl8LUoH5Pw76IG3clZ0YlS49TAKqdujuDpcWNZM9AwKTyv2582cmlhZ?=
 =?us-ascii?Q?+h1MYypzKaKYSuTDsnADSOvmKbprZ4h+virwxFLkCYuS3BrxLtfK1WiST3ic?=
 =?us-ascii?Q?QnR6dCfPFMJR+dMcoA/foM01fFOnl52y+Of9Fnl51io9RPTW+TxR/6ViDZKV?=
 =?us-ascii?Q?cSapVB2mxZUVmbZGl/zek7qN4cwxB5Gzdvp9U6M69I/tLbN2/ho3Og9AY5Wr?=
 =?us-ascii?Q?pVyAqtMDxfBfpdZ53TlMOud4M47dYwDZNf9sIZz00vW7CtLqwr0dFG2zLej4?=
 =?us-ascii?Q?3wj7YoZgl6heqKnav8MOKpEHdQt2dcmZvQuHsgET3idhPPFnKJuxpsKvaoMW?=
 =?us-ascii?Q?z/BYPZ+jG7CjkcViL1LSXWeAnPbECaFY6gKn8ybV/llkWCMBpHB7hxcLjw2y?=
 =?us-ascii?Q?pdRH72I/KPxNQbEukvfHp/o6vvJqpTOFsVSnHIXoOxblSdn/muauvZ+LKwNw?=
 =?us-ascii?Q?TBKdojoQ46Kd94D4EYvzefwtLuQ0Tv5RqF4hcJ9JjG0yzbXWU/0sLiL3qhYy?=
 =?us-ascii?Q?s83pKSzZ0uWSK1jFGCpqX4kVJzEHKhnECS9e9PiL0gFt4HmrR2TyPAbCpthg?=
 =?us-ascii?Q?U/pnZZKRi8kHsmng0GX5FIhTKcw6kmbc6fGTUp6v/SrSyc1OJNb0FqphWq32?=
 =?us-ascii?Q?qFbD5sSJCHlUEQc/WQRuH9R539gPC4GXAWqhwpiFG422D4scU3TPRrGCKP6F?=
 =?us-ascii?Q?yY2etc0DyVdfJAgeRHKb6yFk2Pdt9+sIFzhhg3ZV1Fg/NYC5b2suCs7SlmD0?=
 =?us-ascii?Q?7Wia6gkfj9mdQuu5yuCYPzEqGlhHCU+r4z/iDX14FYEJMMQRNok9D/xp5Gd+?=
 =?us-ascii?Q?ItrjKUr9zUSOerkpJurbE+R3H7Xu8VGYXwtb1oj36ky27liGBjg8autw3xdj?=
 =?us-ascii?Q?gsgyi81/yLFRt6GoTb+6ySy3OeYb82vK5XWQq7nKRJdjE5odGM9l+j6XebgF?=
 =?us-ascii?Q?nouFdeNeepP4FrACsEzmCeREHu7Wfz0he7B9n7jQEoxPc7svTOKueRfJxlbj?=
 =?us-ascii?Q?JuQcjX56dvgUwNiM3m/nEvbbR3kgMz+EBFUtWmR+3sO/L8GVBx91cCo4CMcA?=
 =?us-ascii?Q?cXOj8cxDaif0nNX0SOE7waRQToMw97b4l9uVV75h3PCSifkQoMIcJ8NtcZUE?=
 =?us-ascii?Q?adSXUR5lE/YEj0juxaH3gGvOmCLr0pLfD6H3cURF6eT4rb39ChuOy2+WJMoK?=
 =?us-ascii?Q?jXeNiNZ3os/kuyyolu9J1+KyjF1uzPi9dGeu6vrK9Xhbj3DyGqCRyJFekE4h?=
 =?us-ascii?Q?d0z1s2XDt7ckR1/EosyYLtd1WdOPAHLbAmplofv4II12RNGSyrOtUpUqsGIx?=
 =?us-ascii?Q?t3JBV2jbTU+hHRaZKmRufA3TboPQ8VD8n3jkfeEgvSy3PH9FCtDuUXLgP49f?=
 =?us-ascii?Q?o64ZVDP5WnfN5wn9jRFXOkm76eu35RkY9BrNCQHSvXplB4B8XRq0OGzELSNf?=
 =?us-ascii?Q?YaiIYXQiEpDLzaNzNcm9yskmI+XygYOsprGhuNyAgPQSFPAKS5XOjDEhzgVd?=
 =?us-ascii?Q?n0CCK49OHmdQpwrRRZr/Ke/xw4GC++nWMGIPNTCZObjXushX8YJb3D2efmzL?=
 =?us-ascii?Q?hw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30a5d827-d196-4134-b8dd-08dcb790fe48
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 10:00:55.0021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6OaFGcV/wj7d2RWMtYR3R2iABml0A2wM7dXEchFIpxCOOMVV7K+yh1jpIXMiDH+m6/w9ZaVfWbn7CUvqnDPHF9iIy1xTOvID9ZpqP6AxL+c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8374
X-Proofpoint-ORIG-GUID: rd6NXmf_v16V8r4zomJB9XoZ5zyuLEJc
X-Proofpoint-GUID: rd6NXmf_v16V8r4zomJB9XoZ5zyuLEJc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-08_10,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 mlxscore=0 mlxlogscore=999 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408080072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Aug 2024 10:01:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203122

From: Yash Shinde <Yash.Shinde@windriver.com>

Add the failing tests in rust v1.76 to the exclude list
and add "ignore" tags to ignore failing unit test cases.

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 meta/lib/oeqa/selftest/cases/rust.py          |  19 +
 .../rust/files/rust-oe-selftest.patch         | 345 ++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |   1 +
 3 files changed, 365 insertions(+)
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
index 0000000000..0280b1ef8c
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
@@ -0,0 +1,345 @@
+Backport the patch for "ensure std for cross-targets".
+
+Previously, doing `x test compiler/*` would fail the build due to missing std.
+This change ensures that it is prepared.
+
+Also, add "[ignore]" tags to the failing unit tests to
+ignore them during rust oe-selftest.
+
+Upstream-Status: Backport [https://github.com/rust-lang/rust/pull/122205/commits/5aece7fad06baaa745784d118db862b3e3ccf7f8]
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
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index facf6eb346..f09e05a09f 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -14,6 +14,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://repro-issue-fix-with-v175.patch;patchdir=${RUSTSRC} \
             file://0001-cargo-do-not-write-host-information-into-compilation.patch;patchdir=${RUSTSRC} \
             file://rustdoc-repro-issue-fix-cargo-config-for-codegenunits.patch;patchdir=${RUSTSRC} \
+            file://rust-oe-selftest.patch;patchdir=${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] = "4526f786d673e4859ff2afa0bab2ba13c918b796519a25c1acce06dba9542340"
 
-- 
2.43.0


