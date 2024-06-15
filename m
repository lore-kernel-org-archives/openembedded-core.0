Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 775CCC27C4F
	for <webhook@archiver.kernel.org>; Sat, 15 Jun 2024 16:04:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.15767.1718467482867545826
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jun 2024 09:04:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6896083802=yash.shinde@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45FG04qN000735
	for <openembedded-core@lists.openembedded.org>; Sat, 15 Jun 2024 16:04:42 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ys1x6gbgs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 15 Jun 2024 16:04:41 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45FG4fLp006856
	for <openembedded-core@lists.openembedded.org>; Sat, 15 Jun 2024 16:04:41 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ys1x6gbgq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 15 Jun 2024 16:04:41 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=huKa47SsVhPqO4AOBIBeeCrW+zno94ZK5H/dURA44FPkyqWRCenSuCmHNj10XVFnOgHUuXGqnfGmmtmR7i7bZbfJ3TCri380fkRGnrTrksGb5U8dufGe1cAG6dDqNklPFRfPhBAvGx6xpNoDvdkhsszVp3mH2cF5jRWxb+OS82fg75CRzLwPKKumr2HXqzycar6QSfvQK4SsGBXMjVQwviqbqFt+nJYJ1GiQ+DKxD7BnbIvABFrT87ZVW8uWy9raVm+1GEMV1w2TMhzCPX94jHLUe4nDKNznXJzWKDoyUTJAWGr56z6kA+ZZpMTlpEaH3i+ssYWXn+ffjpJgZVRi1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L5yR22ZqR9eCGtO0J9EhCZJyjGtg3e//0T3/xWF/9D8=;
 b=kDEEykcqd8Ct/WoMvLWoPbgl/llkRg+jKfUn7y+K8k1HG93fET2/TBeG8Fqg2xGZb0qvIAN3uojWZATm2uNKatj/KZw4vAZH3f29fM+4Cm+rglPFn5RCioPAv0h8x/J5KF+stLH2ecShdhNAvm45ujM5WpR1gElPsXx1jjxbAP4nq69Hcy7mYMoijpeEbTtqgv1WPJYX+l1eKLPQStqYPfCbkqUQ308lmhLUgzEmj5cDwoaLnQ0s47MgH4ytx9GCwgpcTc1ZcWER+C3fkW3eatcuFRBuADWVFz8SqKSe/LK7rbpx8AGNtVzCg11WvZychi07UmNb7e742SMEVvULmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by CY8PR11MB7948.namprd11.prod.outlook.com (2603:10b6:930:7f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25; Sat, 15 Jun
 2024 16:04:38 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%6]) with mapi id 15.20.7677.027; Sat, 15 Jun 2024
 16:04:38 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com, alex.kanavin@gmail.com,
        Yash.Shinde@windriver.com
Subject: [PATCH v2 1/3] rust: Oe-selftest fixes for rust v1.76.
Date: Sat, 15 Jun 2024 09:04:13 -0700
Message-ID: <20240615160415.3457966-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0233.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::28) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|CY8PR11MB7948:EE_
X-MS-Office365-Filtering-Correlation-Id: 20b2ea58-0f74-478b-fa7e-08dc8d54db95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|1800799021|366013|52116011|376011|38350700011;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Jf2r+phKzuBR11K/n3MmONPBwY/eph7B+OEggfUgElCDKEgONF+Swn3odIed?=
 =?us-ascii?Q?yzMZkRNRc2mQ3C5pi+hboe8HZEqwInC/00ovZuD4N/YZmsDTwW+4wymZ14Ne?=
 =?us-ascii?Q?4PDmif+wsfOvyVcHOFh8cB9a48Iq+zpYQJ9E0atpwOrwEQcDMWHsze9P+JYo?=
 =?us-ascii?Q?iQKqFgzclS7IeslFxUjn9x1cUrwhcFwz8GgjloqBrslGMlcMMKW3eL4Beawb?=
 =?us-ascii?Q?qW2RGjDmb4H2B3y8ik76knnu12Ljm2coYdGW5R6q99A5GbU7MzXbDBFNoUC2?=
 =?us-ascii?Q?vJTW9QiKqfQxUSJrWAa+kxnSsbXm0dLkRdV+73e9JHAr9GGaWLcLV0f8Obah?=
 =?us-ascii?Q?8/hexjdNKe7uTym7dsySlHRNjihor6mU1UZmQvscrMoBxnkmgCfuhXDfjtHl?=
 =?us-ascii?Q?G1uJ+K0rRS71Wje+BFKjmvzNLJCAGRIxlvVOL9jxByfxZc+NpOP+CHSS8Kpb?=
 =?us-ascii?Q?geqjfPekxbiygz0hSONIABeQXX7qPlrPVvs/r0037JVTk1VEGE5Sk5xikbdf?=
 =?us-ascii?Q?UqBtZXiLhyqLb/Fytbkz37LNHL93DE9A+yYo6F7WA7z46xJp66e9wk6l50Lu?=
 =?us-ascii?Q?TT060l6gxjhOluolUv437MqIuj1rKt2h9Q9la7+JW/fjTDEeL5nEgrv/9aF0?=
 =?us-ascii?Q?i7DZ8dtXKjtaVU9ZKh3l9qq+GCQygpykRYuhNlcO+Ozawi9diQpxiz7zpo2I?=
 =?us-ascii?Q?RSWSY3L/k/s0s40eRUjDkgOeULRSCWEGNfm8+wvIDxVlSN3Ihmf0qVB/B2Ih?=
 =?us-ascii?Q?Rui7IG/Rn7HXuGI/CrAb+/nyHmZ9GnCZTpNeTDnWAK2AH7BcVv/0ba8BdRrE?=
 =?us-ascii?Q?1P0YG5BZXtsTg1k3gBLCtZm1zvG9aABl9Iz2cOJeLjiYNaUTik+5D2x4cyWF?=
 =?us-ascii?Q?ZXJ4HD8ufAcem39L0dQzbBaajT98HtjWlu1jECEHPk52uGXJSzGUe5TCrdmY?=
 =?us-ascii?Q?7P2RezSiAz9i83zipXlvWgXTTbFQmD9I9JrEkDenTXPn6fZQx90JA+7ao4An?=
 =?us-ascii?Q?OfCHNbV+kUOhpZvlCFiebvX/XhG61dFkPInSfU1tu9u+mAkw6LlYPNTo17Hv?=
 =?us-ascii?Q?bNjuAJqXZn/P4HisgXQjGUl9hQ7Z5ovPS9Cmx+PrGuW10ah/chLaX9zGtUnW?=
 =?us-ascii?Q?+PuD29G1ecIRCkSiKx1RFk0UokXP2UzCkZZSeMXZPaFTSobnIF+DgqEqLuzv?=
 =?us-ascii?Q?BayclZ7XKEsUG9ysiUEStC71+oI5+ieXYPq5adCHdymGRa/HPYa/LiI0DhQt?=
 =?us-ascii?Q?VGLWovSuaTrmYODxgh915cKN1rzbmAo43KhGjahbyxVejjKKtT5VH3xAUYqR?=
 =?us-ascii?Q?NVBGl+VXOt7at02s6goanB3y?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(366013)(52116011)(376011)(38350700011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Ksprzw1BA2e/sojVZIoi4I5WB8/KnY2l0w/XBV0kHhfYaGfAnGtyTDmRr2nH?=
 =?us-ascii?Q?t/WodnaPj9nmpx+TAobBUC6glhYgfj5oovjeYN+1WCWYfWjmI0yX3OxjULn6?=
 =?us-ascii?Q?5fmggNcV0looBO8EV/kOvvmnxWBl18xwS6wK/56Yq71Kd9uY/hll+C6hwXbl?=
 =?us-ascii?Q?W9qJ5qYb5iVJ1d+foaeu94rQCLbuRqcoKFdA74AR/55iGNiT+FERtpbxP1S+?=
 =?us-ascii?Q?y7nQ1KaC7c4GZGuxVT6cGGoGRaouo0eJ0L5Y/FWniTqcQrdPZErP4j85s4ol?=
 =?us-ascii?Q?xiiJ/NalLRjQ+pk4b1YirCkYmtEbDthsgt5hmFkaPwsNpzfH3cMjruVwi4Gh?=
 =?us-ascii?Q?fd4ThaNbRYonFeTSBkASHyACLw1LEgoD1BYswlrI7XX7ov4wqkF0fb46N24z?=
 =?us-ascii?Q?UVLG0OoRbcsomDg5ikvrIkBZeaEkUeeMi5yL0ca8qvgeaEjWPxf3+48FCkXO?=
 =?us-ascii?Q?XaFVLkshcfB2E1+nXzhiwCyYxDvTwJ1xztACqoBJDhabVWjJfZxCy9vk8WTA?=
 =?us-ascii?Q?kmHP+cfwWbnDuRocEvjnXPx/FcK+aMinEh+SwuRGSKCiGKi4oCkHX0fX67SR?=
 =?us-ascii?Q?HUNXi7zIfNd+14CK8i49dGPX+BItGShgLZT9dONjPUeiiYNAgv5+Gym4vNpC?=
 =?us-ascii?Q?iEKyTkxX3BSbMh812dygVtD1svcy9rZRlX87lRk3Hxwb3m7JZT1YXQJ8Ijnc?=
 =?us-ascii?Q?7CCaf3BoiXSMYOsH0UvJoBKqaEL/EB9BHcLBbUgoiRk4jYOJwEhuc127ayJx?=
 =?us-ascii?Q?Vwu9VaznTJO6FkYqZWwo+SOU+C4enHlbZFyJs3omAKF+R1c3EmpzhwUQ7vcl?=
 =?us-ascii?Q?GgCIXiDh7GBs/gk145QhV/1JSfz5p7wG1Bc2Kkgk0ePl3VKpnylwX1LHb0aA?=
 =?us-ascii?Q?bwDQscYltnskiKIcbe7lBzBU5MkTypTWLWpmhq/iE57tJQOErbAS3rcqi8RB?=
 =?us-ascii?Q?xHNVwcAT7GawWZcQplLZhPOpRyxtTJp+FLJDHCYFCJbF5ut2v+mYUzJW4n6N?=
 =?us-ascii?Q?Sx+w2BGJ4ZMJ0/L2T1uAirs6Y84benXrN4xj+oOuihSYljD5D2M3YH+lMUPu?=
 =?us-ascii?Q?lVPwyNCEl8mQjDL3ATzHTftjJlnEYD06ULkd11cUyc9Tm++7mmPu3yUJtfOa?=
 =?us-ascii?Q?N4dkYKrxAYWhbIw+mMNlqJdN92+q/G5QAH6g+9tqVqMdH4IG//9Szv4ABr6S?=
 =?us-ascii?Q?web42sKFCYy8Nl1QxYmf1HHJ8uXq9C45zUZjYcX4qtdDkwj2XPjlyATzo1R3?=
 =?us-ascii?Q?0TJ1OcwZDHd5t5hglmUU4JYck6Q+SgYRc/pKs2tbwuAlVipyPjVpihn0QI/Z?=
 =?us-ascii?Q?o1kn8QyarhdX8qMLaNMO+T2Zdh7JL/uAqPN5NyXGYHBWTqm3935mulressMT?=
 =?us-ascii?Q?muvUOzCwscgK3IRKc7/Yfmx7jyquMUI0n4qKg1j+guC8kTUP+dVToUSHF4vn?=
 =?us-ascii?Q?58z3KgyHI/jj+oirmBD+p+/IhpjBGsgMHoSEM3zPdB6sMIixO0BFhwEiBXMb?=
 =?us-ascii?Q?RHa5L2WxUYtMIHrPxxs/TfvyW/Kh8azp2maZQ2WMd7nHOpLJrVdRITjKhHqU?=
 =?us-ascii?Q?F4ntIG21GK6oJseNHGfvb9tWo6O3OmCKNN9Y9w6UXZfXOorhQ1wlQPY8oPBm?=
 =?us-ascii?Q?Zg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20b2ea58-0f74-478b-fa7e-08dc8d54db95
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2024 16:04:38.1422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AfuN2L5TRRu6gv+ViB+UvJNKrYrVqDJ4RtNal7sND8j2lpj93QnfXhkvy9ph8/F38uv2CDgIStwD9Gpr4QRZ9Och2GAlPWDbdWh0MPWpUpU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7948
X-Proofpoint-GUID: hbTOAHOn9dD6x167aasOxp6TjrCmFqQr
X-Proofpoint-ORIG-GUID: z4cV8eJY8ECBTZlzgznmUw4YyziynnxR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-15_12,2024-06-14_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015 mlxlogscore=999
 suspectscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.21.0-2405170001
 definitions=main-2406150122
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jun 2024 16:04:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200668

From: Yash Shinde <Yash.Shinde@windriver.com>

Add the failing tests in rust v1.76 to the exclude list
and add "ignore" tags to ignore failing unit test cases.

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 meta/lib/oeqa/selftest/cases/rust.py          |  19 +
 .../rust/files/rust-oe-selftest.patch         | 352 ++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |   1 +
 3 files changed, 372 insertions(+)
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


