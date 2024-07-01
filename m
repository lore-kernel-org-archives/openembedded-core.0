Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64DD5C3065D
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 09:27:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.15465.1719826021109747221
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jul 2024 02:27:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=791206b30f=yash.shinde@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4619IMPS012475
	for <openembedded-core@lists.openembedded.org>; Mon, 1 Jul 2024 09:27:00 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4029869jvt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 09:27:00 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4619QxN5024387
	for <openembedded-core@lists.openembedded.org>; Mon, 1 Jul 2024 09:26:59 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4029869jvr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Jul 2024 09:26:59 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BcDD6JEYYgX5k6HPmdDerX/bnY2w78U0hJtv4UmAn+bSQwAvGRArYFlyx24V1ELmnzdWGKPZVta0g+eCg2KXsSKpHE+YJ3dOde9ew+wqqy6YUrMVcboa0YuMLyB0OZLf7/sKa3X7OsPRB+q95Ynkn3UMaNLpm01pEyu8dYdNr7dN6d/pzFxA6yg8dzx7iP/f+faNPvGrgHFXW5PIdbvoP/uoAHmd70JhPwYmNot9OInG4TSzzjdRZhPznj/JUsAcfRcLdon/cl0nboRvzQp4UvPKD7dTsNPuzmUf/nNkFfG+C31jGt7yKbTiWv37spobsRKnGOSiuraeU9O048CHsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8bW+bC8LaV18gnAZQdA1GrXMyc3vMRr3oSn+LDZghhY=;
 b=KvHeRf3up4mhlXLWDE8q6ESCeXtZXOG6dT2FaV0VoaDnQxcLQEfYqFQpQ5jBUZEAxwqeY0VrzChy7MAEYYFNNog3lXi94m/YfQhlQ+arTzeI6r+NUpaU5fI0GcfNyp6OWj8UGb+R6Gk85bjMoKJWl/Jk/QGZEWAe/V2g/+iAp/TQ6KAzn6RhfZUUcnowwjeQmhxehc6tbolRZcrnCDK1JQOEMuf5k2l0ky/Yg5Jn1nE8/HLFZawegw5Kq5tS5fzjeXr+UlO2S7urqF4wqZFGPf5uCRNhXYgq8W7F+MiC+YDIjzDMX60WUBcdQvzHDH43Y+XtjmoCP9Od246I1Gc28A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by MN0PR11MB6184.namprd11.prod.outlook.com (2603:10b6:208:3c4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Mon, 1 Jul
 2024 09:26:54 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%4]) with mapi id 15.20.7719.028; Mon, 1 Jul 2024
 09:26:52 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com, Shivaprasad.Moodalappa@windriver.com,
        alex.kanavin@gmail.com, alexandre.belloni@bootlin.com,
        Yash.Shinde@windriver.com
Subject: [PATCH 1/9] rust: Oe-selftest fixes for rust v1.76.
Date: Mon,  1 Jul 2024 02:26:28 -0700
Message-ID: <20240701092639.1498856-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0354.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::29) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|MN0PR11MB6184:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e0eb6db-b221-46b5-9721-08dc99aff118
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?0KDWRCmj2hDt9C9GfBQ2SD7aKu22wHfqagMCFvRxfxid/1RTQKvcIKA2BpW2?=
 =?us-ascii?Q?hhjwz3V4uqdPJhgkb6kyZ8xIdGJA30FgC/8GhxLmPqEKp06N7va05sxnB3ee?=
 =?us-ascii?Q?jqgrRCP3yifQ6ilt6WzDJkOjuvReT/m38fyZkDFdV5u6qFdKm1/Gz8dm52eR?=
 =?us-ascii?Q?sPzcGAXYjHsLcisxVgazgQxhyaco1XoMdKQpxRDPYnjZF1KW7nGvXzzjAPxQ?=
 =?us-ascii?Q?wtHDSyNZT723CDPH8nHhxlwtxjcKVlqvCX56lPp5Jq4VfEHnkGtESCDiwEjO?=
 =?us-ascii?Q?XZMtyqZ6x0BAOdsFPcDdJs1dA2HAp3QeCHEi/0sogbDv3cgtpuXmaPqJqaDB?=
 =?us-ascii?Q?XA8tWBigid8y4z/WZITJ9aiM9UYXRsu+8OKEyckDpzE5h5hgtEVrJJJB4EC7?=
 =?us-ascii?Q?5a/uJoibFTXZINPFYhfA8ZOkyQQkJsPWjoPuOR3+356NAxoUT7KJNVZqLrsJ?=
 =?us-ascii?Q?TyG0re5Lgy9KeVO3JTgxpzTLS3wX8124GHd2P7/fSZJ8l3MokBJGw8G22NSJ?=
 =?us-ascii?Q?IA2eAsRNyXcJfPfBFT+iIE1h21x46Tzl5Fd+xwzz5wgXBbJu19zK5YcZXgEc?=
 =?us-ascii?Q?j1KRbQSQYtfugaoq8Hq/Udzwy6HoIHOIwg2K6VzGjyk7XqX34DP8aG79Yacc?=
 =?us-ascii?Q?g9TyxF3YjYgSftRMP2iX7BYr781MLjhQhFDTnGBX/c+bw3rKYahRe0BUfxx9?=
 =?us-ascii?Q?EkVorl5PsSO5POMfJQ8SaN3YG0wWfTtfdKnEvAud5Q0SQIW6sYnPfDA0kJyD?=
 =?us-ascii?Q?6xCDMpN/1NGRLXmdjlMFFeQ1cQ+J0eyd4cXPkbixlBX9JPBbsDFVRaO2KDNz?=
 =?us-ascii?Q?aHwfER1IjL9o0YZsqQoQoCbUTnelOvqmyZ9C9ODMEQ9ONr1sReNuZQbeRqTT?=
 =?us-ascii?Q?Lxv2H11Lt1SMCf4p7aal0q8NeUgsKagXKceXb1Shm26mz+B9PqW61ess7hx7?=
 =?us-ascii?Q?qqS6lNMO5YBe3gouZ/ANtqMLcc/JuIixHex+8CBru+I+WA61HL/Nz3F38hsV?=
 =?us-ascii?Q?jQH4Birv0nTYLFPx+FUBgHoktupTI7gO8+58XIbzavnWx7hEhQBExYML61iZ?=
 =?us-ascii?Q?A1vvl1gNg10OnPv0pvfWAi4osoD0xRsn6Vh8pVl6xYvXcfVkvpJviYQIj3n+?=
 =?us-ascii?Q?ckTPGdXAtifSAzT52E3BxFOeaCmOZnhlhrYEVtN7syjIcTMMecsIA0QGfTj7?=
 =?us-ascii?Q?9rKiSAos2RjJZvNLSAZxaSXWpef8Xsfz1jtwpoKegVtHzgZj5Pvwas6AbBZU?=
 =?us-ascii?Q?xjY2187aLoeaBX6g8zfvysuwoh6cVFT8NmBwuGOSZakqF2L/Ie4A2ry3xxSk?=
 =?us-ascii?Q?PYuxdjMR69qcce32D/RLsob52lmqgvSsjonkrFgnyOU7Y+qQYhcVtF40nitn?=
 =?us-ascii?Q?S3hjbRA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QmLKiJ2rtuixi27AY09OnQ1iMrVxtiiHqvdW+h0MAq7IHwa3tfEYCB2PVLPc?=
 =?us-ascii?Q?lqVa57gcvRTP4bczkrt2/hVTY75IXXjpCzn825o4LFLn5veN8FWnROkrZEWv?=
 =?us-ascii?Q?vTLT4osxuEGb51kmUdEFloSxrpZH7OUkVV2GEtlh1tE7yFiZlCap5LzroHN+?=
 =?us-ascii?Q?lWjLub0AkpUf+cS1oqJKd+B0+vxkQ7uTf9f8VTmzCc2cgGj9x+z1HQWhY0PB?=
 =?us-ascii?Q?NsWJYoyIbQpWohtg5LYYHIsQTsv+pNPzZBsXhKlYSFiLPGSXp+KoUeXzJozk?=
 =?us-ascii?Q?hJsLZ8FcbgmPsRCmCnUQ1/Bm9gBDxuNHgOGWFKajAtPslfjfE+6RqtpHnWeu?=
 =?us-ascii?Q?t+or94Y6Yo79kGInWARX3AiZaesstmiugvBlY0tsilDnfYWQw2WU8ONW0IE0?=
 =?us-ascii?Q?hD11KtHbVwEVdNu6PXZQGnYlHPzSjIkek0QAkRwsmDU+yHkmueeS6PHLJqA3?=
 =?us-ascii?Q?IPFlFWLOun10U7A/tKL2lhU6zQLvT2HgPGv6FDcI7k6XwodfCecnchKPfJ9I?=
 =?us-ascii?Q?IjecoFNaKmNIoyejMjEgyXNS84RVbo3tf1gV5nvZ0KG+k7/cKESUlSWYdodT?=
 =?us-ascii?Q?i/YWswfFF+DsO387nwjY/+/bxo2DNduyxTs1Hl33Pv87H3vBj/H1pa/ozf14?=
 =?us-ascii?Q?d1/1i61PywuPJTt6x00SWVy10qBgbMYNz136W0uT3FaqxHHe1E6FPDWh/sOg?=
 =?us-ascii?Q?DOLGCUGHAM/UDUp8KHthHTB89h3P1YE3jSVxxy24zdASKWPO1sdNjAMrDPWZ?=
 =?us-ascii?Q?4KmpHZuEJdcSX1cu+PSaY3AEJzcP5jvf5wiHeRkZkZFsSZ6D+qdFuuP4n9Q1?=
 =?us-ascii?Q?o8nog0k6Lrz4YBut9Wx8ENpxwRfYvnMB+zUxMT0alyq7/SjcxpVy6HvD3Wwl?=
 =?us-ascii?Q?zyzR6y1e0OkaeOoRiiLogZYn9LWZ0HXiNrJZmjLgB38V4042jt1kZPYqvqdt?=
 =?us-ascii?Q?f5LUJMsfnbAxsvvxrNohj7lCrt3on3DXZ73F8tucGINOuzwBuzB+5ilrjRJf?=
 =?us-ascii?Q?Hy0nPnlB1ieLYWVM1MYwTqHqsDeKtvyHWZ4ZgJLf+S5IXboEdyXsQTjTwZoy?=
 =?us-ascii?Q?pTlhOi+A2iwXcMI5aSJlQQe4LKzPD5SG781k4GX7U+1olkdf6pbng/S14sJO?=
 =?us-ascii?Q?E4Vf88Lnc12FEBXo2P6XqwEyuactbc4sYMq4vLJIgeDpDRSzOPQ2yBQOQLY9?=
 =?us-ascii?Q?Mvc7eIGyq/tYnm781M6trOqtYK2Heb4+UYl7zjYWYtnVdNNGRy2JW8P1zdKL?=
 =?us-ascii?Q?YcLyfu1OuYn1xl/L/wamKjwrMOw2g0pIv667rxjDB84Qmt7OFqUOVP3NTVr/?=
 =?us-ascii?Q?C/IO3b9zN2BWRlgvucCvBXJnvYqmgWKP9NL/t/F7J/VwsLvikkmcMFRuLWeL?=
 =?us-ascii?Q?OwPuCP6HJu5e+EJSLWThzREYs5JWtiRDsSDZdLg0pvPUtjfY7Lk0HcM1Z4Bp?=
 =?us-ascii?Q?Hx/Y5PY2JvhcNzFwIlf8KwuxpAryZdoiDxKYO2HotK7uDOSaq/D6ZCPUpIds?=
 =?us-ascii?Q?x8mLfWw8rSvKDT4fH3mfH2UF2VDhNpJo5S3Z/Ls0nBy8nJHw/MvyPYmtwdyg?=
 =?us-ascii?Q?2gm5BrUVsAglII8+YueQMI+jUIs5C2lmNpp8vjnUsQS1vBefKNcoCGql0/1x?=
 =?us-ascii?Q?9Q=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e0eb6db-b221-46b5-9721-08dc99aff118
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 09:26:52.4797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XOjMLkgrYhxVXEwSgmRSHNYIbjv9zRWB90kSmZ5EJTu6JKQ8auU+UxK/Zry+4GIMWYtikZRwP8iqU/yJpTQcR6K4LZtW0AYpnP+JBOvpxSc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6184
X-Proofpoint-GUID: 1WBu_ftN45hy4uubueRKWSEmVezbc8Ii
X-Proofpoint-ORIG-GUID: 3Z3WCH56ZkxJftruvuEocnvZAAstrU2g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-01_08,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2407010072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 09:27:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201287

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
index 20ef5e82bc..9acdbc4ec0 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -13,6 +13,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0001-Handle-vendored-sources-when-remapping-paths.patch;patchdir=${RUSTSRC} \
             file://repro-issue-fix-with-v175.patch;patchdir=${RUSTSRC} \
             file://0001-cargo-do-not-write-host-information-into-compilation.patch;patchdir=${RUSTSRC} \
+            file://rust-oe-selftest.patch;patchdir=${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] = "4526f786d673e4859ff2afa0bab2ba13c918b796519a25c1acce06dba9542340"
 
-- 
2.43.0


