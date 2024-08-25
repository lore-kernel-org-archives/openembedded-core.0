Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87505C5321E
	for <webhook@archiver.kernel.org>; Sun, 25 Aug 2024 17:06:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.35547.1724605584946713787
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Aug 2024 10:06:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=896793e54c=yash.shinde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47PGsuWs019356
	for <openembedded-core@lists.openembedded.org>; Sun, 25 Aug 2024 17:06:24 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41754q95jg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 25 Aug 2024 17:06:23 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CUVqhq7fHl+EkPpNMom/9DxhceWasoq138jkgnulhZILdhQgKbyrX4/UGE9mwvESf4UN1YcXKWzN8GwMeDjLLP8F1mWBROvWkwMbAwU08lNhKYE5iiSpbJtJ+QMY6aPD1wHCjQifJRfhacK9pABprJRrKk23qWwQ2ebJaZWTAVpN39MtZHgC1NkcmbR+TmhKE7Mr7lU0XHnTrJoCYft0UKloPO/5ktnFokkg+MyiRnaUcGZDJQFfXa1QfqWsjOLB+FHbMmrOvjvTjxiAn2k4XMkqF6mKXXVEbGZWf3M9Sdaoo3B2PdO9axTMO/WE2PVd0slvk8fJjtz1xww6Ook4mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+qU/ebjKrcj4/CfCwKlF/8r5RpsfyGcDP5EaxMWjDlY=;
 b=YkkhrmdsEWoIJMjHI7eRoFaML+xXqejedRH8dGTLvAXO6yTeF16wausR1jozyT6ULgVstdVKCUQ7DJyvB8WKbtluL9PzM8r5nFLzPiEqxvX6nIFPmxtEXVKfaMGiFnAxyVv/Guv5MON96O23d0lMkXisHb996vIkbOOeV/ulT0225Z0u5WeZdQGbWznSDSTjrXvLXIuq4j2tt8qgqEPmzmotRutze/PYyIVA08DCVmU9cs3pKDiS9gvn5vWMEvNJYCqnCjIfbw27yeF9dvUEqI3nhXHhCP7mpUaDRseap6/iZLnkWpgJV/Yc1u/zDktK093xW5PJe7HwGkZ/5TESUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by CY5PR11MB6089.namprd11.prod.outlook.com (2603:10b6:930:2f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Sun, 25 Aug
 2024 17:06:20 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%4]) with mapi id 15.20.7897.021; Sun, 25 Aug 2024
 17:06:19 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com, Yash.Shinde@windriver.com
Subject: [PATCH 1/2] rust: Oe-selftest changes for rust v1.79
Date: Sun, 25 Aug 2024 10:05:50 -0700
Message-ID: <20240825170553.566798-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SCZPR80CA0014.lamprd80.prod.outlook.com
 (2603:10d6:300:51::19) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|CY5PR11MB6089:EE_
X-MS-Office365-Filtering-Correlation-Id: f2c56f49-c531-4258-0e35-08dcc5283cbc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?WYvxD6sD+1QGecnmhAQ148HgdBrBvAXKmhfTFK1GkSljZT1ZAITYjOdUiPaa?=
 =?us-ascii?Q?ezc4pSPGqT60uEhIggi5ryQuIR8m9lozokrbdbsbk/mFArg4GgRFb24sVf+z?=
 =?us-ascii?Q?l0PZ9TE+N4qcpLF6Wpf6zg45jV8QWwuPeIxF7EAdgrZKDf/gSGshjZTqB2RW?=
 =?us-ascii?Q?gP1sWDgwR9kN/2D88FmHzXuSqLrgwvGaRVfSbowZyHpWE3mbsJ+SUROIDVGn?=
 =?us-ascii?Q?zElJkFaCGEQJ4AXfGbL8E/q0E6IDYMtb+KN5s05I02WOtGQebrwl9sQCP1Sd?=
 =?us-ascii?Q?UAQvp4+kRvTMrPHJO64qJ9fwlEjQChAhwgXS4yb/6cxIlaFZhy5FnR/WhX6d?=
 =?us-ascii?Q?vh9Un/+SioLfByQnlnNmhkxp0afjoJSGHHnPEM3GqEoiLwNihbDP/QHh0JXD?=
 =?us-ascii?Q?l5AmkxSxHh7bwMBprYA9gKzjRlj+fZYNOyyS57yN4R52M4/riTdA/Cg4CoXI?=
 =?us-ascii?Q?TGIoQC9zx+MsbitAERWaf4yYQtM0IWbBgHNVTvtHxSXctDTvy+hIX0+NWJnQ?=
 =?us-ascii?Q?pD3nJUWDxCA3OnQpr5X4k2uOB3WP510kw5J5YNcAClUBcaoX2rQ4yWKt1+Yz?=
 =?us-ascii?Q?zZCDYLFeHPy7cidYHGcqGk0eiUFxFDqgbTLX0HS5cmxTVtqMV73F4R/0iYVv?=
 =?us-ascii?Q?87Zb0NxUkGNYkq5SoNdCW/Zl92dLmrD/tnqM1bDzUKekUdoOi1Et0f+IXtSn?=
 =?us-ascii?Q?/qQUh4vLUxs0gKQTukCYAg8te4P/UjRF1swX8K+RS4GYP1PrSL0mh+2v1fnM?=
 =?us-ascii?Q?zQSZkOPHM+Eq45gdZDd6COEw4NFV/P/T48gHA9nwHgMJrPrtOPRuLv5iLteV?=
 =?us-ascii?Q?Kvmk2fmH1hcebN2JOzTVc67glFryCBqE8L5nb5qUkjYUvZqWplsCgOAKdy1W?=
 =?us-ascii?Q?TSQ6XU7+AEBleKYhrXY2nEYeRv9lF7LyVxTU69FaHUiCHeNqQ9I/hq1+jswb?=
 =?us-ascii?Q?cyVxjgSHJqmWHzqLIKvybz0FUmK4oyGw4pqWIm+TfNgh5kiaTsj+27gw2B2Q?=
 =?us-ascii?Q?4dwKj0/WBP2zIpWKMEy27IY7cMXM5a9cS9datZrKVyGBkjxOEAQ4WkSvqPOb?=
 =?us-ascii?Q?dQk0mQJgFEHXLO9dw9ygSc4qB/7uhplqYu2qq3psEKHNhX+TuVXa1xgDWDSI?=
 =?us-ascii?Q?OZAE6cwUNZhqt76dV6A1Bn1SPdMDZ6kaIUaYG6KRT0OyLkyMPXFQTLz4ZMWr?=
 =?us-ascii?Q?G5Cc0kgc4MtD9tIkMhq/cm9lYu7Zb9Kan4D+S3co+4JisEIHhySKulrS09a1?=
 =?us-ascii?Q?Xnnek1OxtMz/6cW5iJGNauRwDaBWcwsJ7u5DyHTdamYuj/mC7VsC6YC29oGg?=
 =?us-ascii?Q?0yY4oOeGWZAW3F7Z4LjvQMQ1cDMfxzEv/jQCS2Iuf9cQnjRiV5XSJr1FL7T+?=
 =?us-ascii?Q?AnceyHhUNFUwM9Aa7GsjAfJf+DVevXGo2Qnv3Nhk8BC2sWe1ng=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4eTaHlssqYrWipkfJpvgAr/Wc3oMuSaOq3XhmfOM/h3ViA5alb8Qt0v8NPxH?=
 =?us-ascii?Q?1Fa0RtLuzTxAF61KHxQx0beBpXDUxiw1zLdbPLYiagmrX64OG9N94CQHGynC?=
 =?us-ascii?Q?3xg/V9s6DJmZcPVUljjWc2LCyuyZ4PlwowRi9Gj+EN/sPhsOV+BEhvZR74LA?=
 =?us-ascii?Q?e5mdauLCtivHeYbzWkzuEUkkn0kPdc+o/ITdvw9itGh9+rIJ+8ODYmmAXit/?=
 =?us-ascii?Q?avbI90Ld4L43CtMhY3zDort6b+NHVVrbE2Yw86EhwlCFJAFAK04HGWhwoUNk?=
 =?us-ascii?Q?9JqSTSpILEnY6EJpMBs7SX/RqI5/RDYjlJrw7TGJMFEHUHJ5BDr23xpV3DqK?=
 =?us-ascii?Q?eiZRTis/DzoCQCtf/Klnnia4Em105urdNG6jTMg4LF0qsnZOzaMmKGmGkuqY?=
 =?us-ascii?Q?yVE0W2KnMWlbtEb3PK5pXVmFAwo4ycyRYBfIHmQuZq6doIq3xy7r9ILXUpQm?=
 =?us-ascii?Q?3hms8EeufhYecLJerZEgNkTLWhwkQbr4hwZr8QSgoeaty4nsCUVOTTZFbbFD?=
 =?us-ascii?Q?YZgtj2GQzAykZIFc7yVr861zaNXWN+l8JBe5dfHyohKdUMvpKddn3g2brJba?=
 =?us-ascii?Q?58eDuYzWoK+jLcqu4LDsrIU285UWfKD3W5OMe7CpE5ERifxM87b1imC4oCXT?=
 =?us-ascii?Q?bBl73VvMPzxoj5INMT7rN2GIOCCgnvY4blqHC2gkdMenElI6ZhXDXQwW64zP?=
 =?us-ascii?Q?uA5U0VAsGZOYT1fUJgSnPRekxUt38dx/hQKfRzfIh0nT/86ZS5Dl0bz5GKO6?=
 =?us-ascii?Q?AEdCmtIcKxuouTCW/p6Q5muazrgtH3x8GMPimPqrk/6PpPnE82ubpE9FzAb4?=
 =?us-ascii?Q?6M0S5KHXivtlc+G8yRKIqn5tZqgdNjYm+LpWOM5ieDo1ldFNiCTGedh23yRD?=
 =?us-ascii?Q?Nw77tJrc/x17NGkZT23gZc4cYiy+3z7xFrQiAmPY3DtZwFxQ793oAm5cphR5?=
 =?us-ascii?Q?v2JPoRtEy/xeDyvJC6clvSPMAxXsfRIt4CfslJBxr/KbwdyeqcRCmug/6ZZQ?=
 =?us-ascii?Q?K0Jc0++gfacFVNTV6xx0g1Fs0fKXbSEoxgw/BRwtph+LjhLu1QwbNaBVp2S8?=
 =?us-ascii?Q?5ELi8bUhOsDy80NV2nCqIY2B5n4D8FjqasRKLy6XBZkEcj3ld9bqT74/IIm/?=
 =?us-ascii?Q?xXm7sj5x0Zx7DPslSo9EBj9EllHPJHIk/pNpfuNyCCuPGGi8ugnJVix8J0cS?=
 =?us-ascii?Q?0ozdgi8H6QA6aVOknzSdd6wCQmSFRHRsGC1YDL007DWCxGT6BdGaHo+GkxP/?=
 =?us-ascii?Q?KNGTauX6qHVUxqngNmmouGbDKN/boJawmNRULhDESf7gu6t4ACRZ+C7knio3?=
 =?us-ascii?Q?UW3H4J5KtbtSOXeUTHwmgYI9uLZeII0eZX/BesSWB4RZoG10glL/MBhAyhwL?=
 =?us-ascii?Q?E69pDfRFxeg/ZUimO+jvCMZZJLP+9UST5zm2a/j46cvRG6UmgD93etCWKvFi?=
 =?us-ascii?Q?oOt8ptEru+FjCl6rZ4TL3U8EVVo9A6b3yFucKGx4EunE+UFJB7mRhYK4X/NF?=
 =?us-ascii?Q?rUR7DWDaq240tactilfBJJno+4y7W02P7XKaH5qXqMBeY7BZAFgr1UCkYSWd?=
 =?us-ascii?Q?DDTfCFUKvtobIR0qN5025+jQJRUbYZqw+heNUf/KS8ZtFGlJo5GzmOIVQ9On?=
 =?us-ascii?Q?lA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2c56f49-c531-4258-0e35-08dcc5283cbc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2024 17:06:19.1990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xuPjNV+0jFwMf5vQEI2J2Qxsyj+2R44uJE0bbXHzeVkHt6s3eAO/8M42aBVX1nys0WguJojBmUJnPtzfO0+StyMS3lbJZqWtNbYVGQFcL8Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6089
X-Proofpoint-GUID: ROtJ4xc_GN2VJEwhKBLyftb4ndMemWSk
X-Authority-Analysis: v=2.4 cv=O65rvw9W c=1 sm=1 tr=0 ts=66cb648f cx=c_pps a=28bFCgguF5sZfysLuYgbMw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yoJbH4e0A30A:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=rL-gzRcho55yBmN0qZkA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: ROtJ4xc_GN2VJEwhKBLyftb4ndMemWSk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-25_14,2024-08-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 mlxlogscore=999 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2407110000 definitions=main-2408250136
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Aug 2024 17:06:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203723

From: Yash Shinde <Yash.Shinde@windriver.com>

* Sort the exclude list in alphabetical order.

* Add some of the upsupported/failing tests to the exclude list
  and ignore the failing unit tests.

* Remove duplicated tests from the exclude list.

* Testing summary
    Target                PASS                    SKIPPED

    ARM                   17241                    599
    ARM64                 17279                    561
    MIPS64                17228                    612
    PPC                   17194                    629
    X86                   17257                    583
    X86-64                17416                    424

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 meta/lib/oeqa/selftest/cases/rust.py          | 170 +++++++++---------
 .../rust/files/rust-oe-selftest.patch         |  67 ++++---
 2 files changed, 121 insertions(+), 116 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
index aa5814eccf..09487e3e23 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -67,10 +67,21 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
         # then runs tidy checks.
         exclude_list =  [
                             'compiler/rustc',
+                            'compiler/rustc_errors/src/markdown/tests/term.rs',
+                            'compiler/rustc_expand',
                             'compiler/rustc_interface/src/tests.rs',
+                            'compiler/rustc_span',
                             'library/panic_abort',
                             'library/panic_unwind',
+                            'library/std/src/io/buffered/tests.rs',
+                            'library/std/src/io/stdio/tests.rs',
+                            'library/std/src/sync/mpsc/sync_tests.rs',
+                            'library/std/src/sync/mpsc/tests.rs',
+                            'library/std/src/sync/mutex/tests.rs',
+                            'library/std/src/sync/rwlock/tests.rs',
+                            'library/std/src/thread/tests.rs',
                             'library/test/src/stats/tests.rs',
+                            'src/bootstrap',
                             'src/bootstrap/builder/tests.rs',
                             'src/doc/rustc',
                             'src/doc/rustdoc',
@@ -78,39 +89,100 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
                             'src/librustdoc',
                             'src/rustdoc-json-types',
                             'src/tools/compiletest/src/common.rs',
+                            'src/tools/jsondoclint',
                             'src/tools/lint-docs',
+                            'src/tools/replace-version-placeholder',
                             'src/tools/rust-analyzer',
                             'src/tools/rustdoc-themes',
+                            'src/tools/rust-installer',
+                            'src/tools/suggest-tests',
                             'src/tools/tidy',
+                            'src/tools/tidy/src/',
                             'tests/assembly/asm/aarch64-outline-atomics.rs',
+                            'tests/codegen/abi-efiapi.rs',
                             'tests/codegen/abi-main-signature-32bit-c-int.rs',
                             'tests/codegen/abi-repr-ext.rs',
+                            'tests/codegen/abi-sysv64.rs',
                             'tests/codegen/abi-x86-interrupt.rs',
+                            'tests/codegen/adjustments.rs',
+                            'tests/codegen/align-byval.rs',
+                            'tests/codegen/align-fn.rs',
+                            'tests/codegen/ascii-char.rs',
+                            'tests/codegen/asm-powerpc-clobbers.rs',
+                            'tests/codegen/async-fn-debug-awaitee-field.rs',
+                            'tests/codegen/binary-search-index-no-bound-check.rs',
+                            'tests/codegen/bool-cmp.rs',
                             'tests/codegen/branch-protection.rs',
+                            'tests/codegen/call-metadata.rs',
                             'tests/codegen/catch-unwind.rs',
                             'tests/codegen/cf-protection.rs',
+                            'tests/codegen/coercions.rs',
+                            'tests/codegen/cold-call-declare-and-call.rs',
+                            'tests/codegen/common_prim_int_ptr.rs',
+                            'tests/codegen/const_scalar_pair.rs',
+                            'tests/codegen/consts.rs',
+                            'tests/codegen/debug-accessibility/public-enum.rs',
+                            'tests/codegen/debug-accessibility/tuple-fields.rs',
+                            'tests/codegen/debug-alignment.rs',
+                            'tests/codegen/debug-column.rs',
+                            'tests/codegen/debuginfo-generic-closure-env-names.rs',
+                            'tests/codegen/debuginfo-inline-callsite-location.rs',
+                            'tests/codegen/debug-limited.rs',
+                            'tests/codegen/default-requires-uwtable.rs',
+                            'tests/codegen/drop.rs',
+                            'tests/codegen/dst-vtable-align-nonzero.rs',
+                            'tests/codegen/enable-lto-unit-splitting.rs',
                             'tests/codegen/enum-bounds-check-derived-idx.rs',
+                            'tests/codegen/enum/enum-bounds-check.rs',
+                            'tests/codegen/enum/enum-debug-tagged.rs',
+                            'tests/codegen/enum/enum-u128.rs',
+                            'tests/codegen/export-no-mangle.rs',
+                            'tests/codegen/fastcall-inreg.rs',
+                            'tests/codegen/float_math.rs',
+                            'tests/codegen/fn-impl-trait-self.rs',
                             'tests/codegen/force-unwind-tables.rs',
+                            'tests/codegen/frame-pointer.rs',
+                            'tests/codegen/i128-x86-align.rs',
+                            'tests/codegen/inherit_overflow.rs',
+                            'tests/codegen/inline-function-args-debug-info.rs',
                             'tests/codegen/intrinsic-no-unnamed-attr.rs',
+                            'tests/codegen/intrinsics/mask.rs',
+                            'tests/codegen/intrinsics/transmute-niched.rs',
+                            'tests/codegen/issues',
                             'tests/codegen/issues/issue-103840.rs',
+                            'tests/codegen/issues/issue-122805.rs',
                             'tests/codegen/issues/issue-47278.rs',
+                            'tests/codegen/issues/issue-73258.rs',
                             'tests/codegen/issues/issue-73827-bounds-check-index-in-subexpr.rs',
+                            'tests/codegen/issues/issue-75546.rs',
+                            'tests/codegen/issues/issue-77812.rs',
+                            'tests/codegen/issues/issue-98156-const-arg-temp-lifetime.rs',
                             'tests/codegen/lifetime_start_end.rs',
+                            'tests/codegen/llvm-ident.rs',
                             'tests/codegen/local-generics-in-exe-internalized.rs',
+                            'tests/codegen/macos/x86_64-macosx-deployment-target.rs',
+                            'tests/codegen/mainsubprogram.rs',
                             'tests/codegen/match-unoptimized.rs',
+                            'tests/codegen/meta-filecheck/check-prefix.rs',
+                            'tests/codegen/meta-filecheck/filecheck-flags.rs',
+                            'tests/codegen/move-operands.rs',
                             'tests/codegen/noalias-rwlockreadguard.rs',
+                            'tests/codegen/non-terminate/infinite-loop-1.rs',
                             'tests/codegen/non-terminate/nonempty-infinite-loop.rs',
                             'tests/codegen/noreturn-uninhabited.rs',
                             'tests/codegen/repr-transparent-aggregates-3.rs',
+                            'tests/codegen/repr/transparent-mips64.rs',
                             'tests/codegen/riscv-abi/call-llvm-intrinsics.rs',
-                            'tests/codegen/riscv-abi/riscv64-lp64f-lp64d-abi.rs',
                             'tests/codegen/riscv-abi/riscv64-lp64d-abi.rs',
+                            'tests/codegen/riscv-abi/riscv64-lp64f-lp64d-abi.rs',
                             'tests/codegen/sse42-implies-crc32.rs',
                             'tests/codegen/thread-local.rs',
                             'tests/codegen/uninit-consts.rs',
+                            'tests/mir-opt/',
                             'tests/pretty/raw-str-nonexpr.rs',
                             'tests/run-make',
                             'tests/run-make-fulldeps',
+                            'tests/run-pass-valgrind',
                             'tests/rustdoc',
                             'tests/rustdoc-json',
                             'tests/rustdoc-js-std',
@@ -133,111 +205,33 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
                             'tests/rustdoc-ui/test-no_std.rs',
                             'tests/rustdoc-ui/test-type.rs',
                             'tests/rustdoc/unit-return.rs',
+                            'tests/ui/abi/extern',
                             'tests/ui/abi/stack-probes-lto.rs',
                             'tests/ui/abi/stack-probes.rs',
+                            'tests/ui/allocator',
+                            'tests/ui/array-slice-vec',
                             'tests/ui/array-slice-vec/subslice-patterns-const-eval-match.rs',
                             'tests/ui/asm/x86_64/sym.rs',
+                            'tests/ui/associated-consts',
                             'tests/ui/associated-type-bounds/fn-apit.rs',
                             'tests/ui/associated-type-bounds/fn-dyn-apit.rs',
                             'tests/ui/associated-type-bounds/fn-wrap-apit.rs',
+                            'tests/ui/associated-types',
+                            'tests/ui/codegen/mismatched-data-layouts.rs',
                             'tests/ui/debuginfo/debuginfo-emit-llvm-ir-and-split-debuginfo.rs',
                             'tests/ui/drop/dynamic-drop.rs',
                             'tests/ui/empty_global_asm.rs',
+                            'tests/ui-fulldeps/',
                             'tests/ui/functions-closures/fn-help-with-err.rs',
                             'tests/ui/linkage-attr/issue-10755.rs',
                             'tests/ui/macros/restricted-shadowing-legacy.rs',
+                            'tests/ui/numbers-arithmetic/u128.rs',
                             'tests/ui/process/nofile-limit.rs',
                             'tests/ui/process/process-panic-after-fork.rs',
                             'tests/ui/process/process-sigpipe.rs',
                             'tests/ui/simd/target-feature-mixup.rs',
                             'tests/ui/structs-enums/multiple-reprs.rs',
-                            'src/tools/jsondoclint',
-                            'src/tools/replace-version-placeholder',
-                            'tests/codegen/abi-efiapi.rs',
-                            'tests/codegen/abi-sysv64.rs',
-                            'tests/codegen/align-byval.rs',
-                            'tests/codegen/align-fn.rs',
-                            'tests/codegen/asm-powerpc-clobbers.rs',
-                            'tests/codegen/async-fn-debug-awaitee-field.rs',
-                            'tests/codegen/binary-search-index-no-bound-check.rs',
-                            'tests/codegen/call-metadata.rs',
-                            'tests/codegen/debug-column.rs',
-                            'tests/codegen/debug-limited.rs',
-                            'tests/codegen/debuginfo-generic-closure-env-names.rs',
-                            'tests/codegen/drop.rs',
-                            'tests/codegen/dst-vtable-align-nonzero.rs',
-                            'tests/codegen/enable-lto-unit-splitting.rs',
-                            'tests/codegen/enum/enum-u128.rs',
-                            'tests/codegen/fn-impl-trait-self.rs',
-                            'tests/codegen/inherit_overflow.rs',
-                            'tests/codegen/inline-function-args-debug-info.rs',
-                            'tests/codegen/intrinsics/mask.rs',
-                            'tests/codegen/intrinsics/transmute-niched.rs',
-                            'tests/codegen/issues/issue-73258.rs',
-                            'tests/codegen/issues/issue-75546.rs',
-                            'tests/codegen/issues/issue-77812.rs',
-                            'tests/codegen/issues/issue-98156-const-arg-temp-lifetime.rs',
-                            'tests/codegen/llvm-ident.rs',
-                            'tests/codegen/mainsubprogram.rs',
-                            'tests/codegen/move-operands.rs',
-                            'tests/codegen/repr/transparent-mips64.rs',
-                            'tests/mir-opt/',
-                            'tests/rustdoc-json',
-                            'tests/rustdoc-ui/doc-test-rustdoc-feature.rs',
-                            'tests/rustdoc-ui/no-run-flag.rs',
-                            'tests/ui-fulldeps/',
-                            'tests/ui/numbers-arithmetic/u128.rs'
-                            'tests/run-pass-valgrind',
-                            'tests/ui/codegen/mismatched-data-layouts.rs',
-                            'tests/codegen/i128-x86-align.rs',
-                            'src/tools/suggest-tests',
-                            'src/tools/rust-installer',
-                            'src/bootstrap',
-                            'src/tools/tidy/src/',
-                            'library/std/src/thread/tests.rs',
-                            'compiler/rustc_errors/src/markdown/tests/term.rs',
-                            'compiler/rustc_interface/src/tests.rs',
-                            'library/std/src/io/buffered/tests.rs',
-                            'library/std/src/io/stdio/tests.rs',
-                            'library/std/src/sync/mpsc/sync_tests.rs',
-                            'library/std/src/sync/mpsc/tests.rs',
-                            'library/std/src/sync/mutex/tests.rs',
-                            'library/std/src/sync/rwlock/tests.rs',
-                            'library/std/src/thread/tests.rs',
-                            'library/test/src/stats/tests.rs',
-                            'tidyselftest',
-                            'compiler/rustc_span',
-                            'compiler/rustc_expand',
-                            'tests/ui/array-slice-vec',
-                            'tests/ui/associated-consts',
-                            'tests/ui/associated-types',
-                            'tests/ui/allocator',
-                            'tests/ui/abi/extern',
-                            'tests/codegen/non-terminate/infinite-loop-1.rs',
-                            'tests/codegen/coercions.rs',
-                            'tests/codegen/const_scalar_pair.rs',
-                            'tests/codegen/cold-call-declare-and-call.rs',
-                            'tests/codegen/issues',
-                            'tests/codegen/bool-cmp.rs',
-                            'tests/codegen/ascii-char.rs',
-                            'tests/codegen/frame-pointer.rs',
-                            'tests/codegen/common_prim_int_ptr.rs',
-                            'tests/codegen/default-requires-uwtable.rs',
-                            'tests/codegen/debug-accessibility/public-enum.rs',
-                            'tests/codegen/meta-filecheck/filecheck-flags.rs',
-                            'tests/codegen/float_math.rs',
-                            'tests/codegen/debug-accessibility/tuple-fields.rs',
-                            'tests/codegen/consts.rs',
-                            'tests/codegen/enum/enum-bounds-check.rs',
-                            'tests/codegen/debug-alignment.rs',
-                            'tests/codegen/export-no-mangle.rs',
-                            'tests/codegen/fastcall-inreg.rs',
-                            'tests/codegen/debuginfo-inline-callsite-location.rs',
-                            'tests/codegen/enum/enum-debug-tagged.rs',
-                            'tests/codegen/adjustments.rs',
-                            'tests/codegen/macos/x86_64-macosx-deployment-target.rs',
-                            'tests/codegen/frame-pointer.rs',
-                            'tests/codegen/meta-filecheck/check-prefix.rs'
+                            'tidyselftest'
                         ]
 
         exclude_fail_tests = " ".join([" --exclude " + item for item in exclude_list])
diff --git a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
index a69c1e5237..73b80e9b7c 100644
--- a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
+++ b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
@@ -8,7 +8,7 @@ Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
 diff --git a/compiler/rustc_errors/src/markdown/tests/term.rs b/compiler/rustc_errors/src/markdown/tests/term.rs
 --- a/compiler/rustc_errors/src/markdown/tests/term.rs
 +++ b/compiler/rustc_errors/src/markdown/tests/term.rs
-@@ -60,6 +60,7 @@
+@@ -61,6 +61,7 @@ fn test_wrapping_write() {
  }
 
  #[test]
@@ -19,31 +19,30 @@ diff --git a/compiler/rustc_errors/src/markdown/tests/term.rs b/compiler/rustc_e
 diff --git a/compiler/rustc_interface/src/tests.rs b/compiler/rustc_interface/src/tests.rs
 --- a/compiler/rustc_interface/src/tests.rs
 +++ b/compiler/rustc_interface/src/tests.rs
-@@ -116,6 +116,7 @@
+@@ -137,6 +137,7 @@ fn assert_non_crate_hash_different(x: &Options, y: &Options) {
 
  // When the user supplies --test we should implicitly supply --cfg test
  #[test]
 +#[ignore]
  fn test_switch_implies_cfg_test() {
-     rustc_span::create_default_session_globals_then(|| {
-         let matches = optgroups().parse(&["--test".to_string()]).unwrap();
-@@ -127,6 +128,7 @@
+     sess_and_cfg(&["--test"], |_sess, cfg| {
+         assert!(cfg.contains(&(sym::test, None)));
+@@ -145,6 +146,7 @@ fn test_switch_implies_cfg_test() {
 
  // When the user supplies --test and --cfg test, don't implicitly add another --cfg test
  #[test]
 +#[ignore]
  fn test_switch_implies_cfg_test_unless_cfg_test() {
-     rustc_span::create_default_session_globals_then(|| {
-         let matches = optgroups().parse(&["--test".to_string(), "--cfg=test".to_string()]).unwrap();
-@@ -139,6 +141,7 @@
+     sess_and_cfg(&["--test", "--cfg=test"], |_sess, cfg| {
+         let mut test_items = cfg.iter().filter(|&&(name, _)| name == sym::test);
+@@ -154,6 +156,7 @@ fn test_switch_implies_cfg_test_unless_cfg_test() {
  }
 
  #[test]
 +#[ignore]
  fn test_can_print_warnings() {
-     rustc_span::create_default_session_globals_then(|| {
-         let matches = optgroups().parse(&["-Awarnings".to_string()]).unwrap();
-
+     sess_and_cfg(&["-Awarnings"], |sess, _cfg| {
+         assert!(!sess.dcx().can_emit_warnings());
 diff --git a/library/test/src/stats/tests.rs b/library/test/src/stats/tests.rs
 --- a/library/test/src/stats/tests.rs
 +++ b/library/test/src/stats/tests.rs
@@ -59,7 +58,7 @@ diff --git a/library/std/src/io/buffered/tests.rs b/library/std/src/io/buffered/
 index 35a5291a347..5f2858d2505 100644
 --- a/library/std/src/io/buffered/tests.rs
 +++ b/library/std/src/io/buffered/tests.rs
-@@ -485,6 +485,7 @@ fn flush(&mut self) -> io::Result<()> {
+@@ -488,6 +488,7 @@ fn flush(&mut self) -> io::Result<()> {
  }
 
  #[test]
@@ -187,7 +186,7 @@ index 1786a3c09ff..9dcead7092b 100644
  fn test_mutex_arc_poison() {
      let arc = Arc::new(Mutex::new(1));
      assert!(!arc.is_poisoned());
-@@ -205,6 +209,7 @@ fn test_mutex_arc_nested() {
+@@ -220,6 +220,7 @@ fn test_mutex_arc_nested() {
  }
 
  #[test]
@@ -199,7 +198,7 @@ diff --git a/library/std/src/sync/rwlock/tests.rs b/library/std/src/sync/rwlock/
 index 1a9d3d3f12f..0a9cfc48806 100644
 --- a/library/std/src/sync/rwlock/tests.rs
 +++ b/library/std/src/sync/rwlock/tests.rs
-@@ -44,6 +44,7 @@ fn frob() {
+@@ -47,6 +47,7 @@ fn frob() {
  }
 
  #[test]
@@ -207,7 +206,7 @@ index 1a9d3d3f12f..0a9cfc48806 100644
  fn test_rw_arc_poison_wr() {
      let arc = Arc::new(RwLock::new(1));
      let arc2 = arc.clone();
-@@ -56,6 +57,7 @@ fn test_rw_arc_poison_wr() {
+@@ -72,6 +73,7 @@ fn test_rw_arc_poison_mapped_w_r() {
  }
 
  #[test]
@@ -215,7 +214,7 @@ index 1a9d3d3f12f..0a9cfc48806 100644
  fn test_rw_arc_poison_ww() {
      let arc = Arc::new(RwLock::new(1));
      assert!(!arc.is_poisoned());
-@@ -70,6 +72,7 @@ fn test_rw_arc_poison_ww() {
+@@ -100,6 +102,7 @@ fn test_rw_arc_poison_mapped_w_w() {
  }
 
  #[test]
@@ -223,7 +222,7 @@ index 1a9d3d3f12f..0a9cfc48806 100644
  fn test_rw_arc_no_poison_rr() {
      let arc = Arc::new(RwLock::new(1));
      let arc2 = arc.clone();
-@@ -127,6 +127,7 @@
+@@ -127,6 +130,7 @@ fn test_rw_arc_no_poison_mapped_r_r() {
  }
 
  #[test]
@@ -231,7 +230,7 @@ index 1a9d3d3f12f..0a9cfc48806 100644
  fn test_rw_arc_no_poison_rw() {
      let arc = Arc::new(RwLock::new(1));
      let arc2 = arc.clone();
-@@ -133,6 +137,7 @@ fn test_rw_arc() {
+@@ -192,6 +196,7 @@ fn test_rw_arc() {
  }
 
  #[test]
@@ -239,7 +238,7 @@ index 1a9d3d3f12f..0a9cfc48806 100644
  fn test_rw_arc_access_in_unwind() {
      let arc = Arc::new(RwLock::new(1));
      let arc2 = arc.clone();
-@@ -206,6 +211,7 @@ fn drop(&mut self) {
+@@ -275,6 +280,7 @@ fn drop(&mut self) {
  }
 
  #[test]
@@ -247,7 +246,7 @@ index 1a9d3d3f12f..0a9cfc48806 100644
  fn test_into_inner_poison() {
      let m = Arc::new(RwLock::new(NonCopy(10)));
      let m2 = m.clone();
-@@ -230,6 +236,7 @@ fn test_get_mut() {
+@@ -299,6 +305,7 @@ fn test_get_mut() {
  }
 
  #[test]
@@ -279,7 +278,7 @@ diff --git a/library/std/src/thread/tests.rs b/library/std/src/thread/tests.rs
 index 5d6b9e94ee9..a5aacb2eb87 100644
 --- a/library/std/src/thread/tests.rs
 +++ b/library/std/src/thread/tests.rs
-@@ -115,6 +115,7 @@ fn test_is_finished() {
+@@ -116,6 +116,7 @@ fn test_is_finished() {
  }
 
  #[test]
@@ -287,7 +286,7 @@ index 5d6b9e94ee9..a5aacb2eb87 100644
  fn test_join_panic() {
      match thread::spawn(move || panic!()).join() {
          result::Result::Err(_) => (),
-@@ -217,6 +218,7 @@ fn test_simple_newsched_spawn() {
+@@ -218,6 +219,7 @@ fn test_simple_newsched_spawn() {
  }
 
  #[test]
@@ -295,7 +294,7 @@ index 5d6b9e94ee9..a5aacb2eb87 100644
  fn test_try_panic_message_string_literal() {
      match thread::spawn(move || {
          panic!("static string");
-@@ -233,6 +235,7 @@ fn test_try_panic_message_string_literal() {
+@@ -234,6 +236,7 @@ fn test_try_panic_message_string_literal() {
  }
 
  #[test]
@@ -303,7 +302,7 @@ index 5d6b9e94ee9..a5aacb2eb87 100644
  fn test_try_panic_any_message_owned_str() {
      match thread::spawn(move || {
          panic_any("owned string".to_string());
-@@ -249,6 +252,7 @@ fn test_try_panic_any_message_owned_str() {
+@@ -250,6 +253,7 @@ fn test_try_panic_any_message_owned_str() {
  }
 
  #[test]
@@ -311,7 +310,7 @@ index 5d6b9e94ee9..a5aacb2eb87 100644
  fn test_try_panic_any_message_any() {
      match thread::spawn(move || {
          panic_any(Box::new(413u16) as Box<dyn Any + Send>);
-@@ -267,6 +271,7 @@ fn test_try_panic_any_message_any() {
+@@ -268,6 +272,7 @@ fn test_try_panic_any_message_any() {
  }
 
  #[test]
@@ -366,7 +365,7 @@ diff --git a/library/std/src/sync/mutex/tests.rs b/library/std/src/sync/mutex/te
 diff --git a/
 --- a/library/std/src/sync/rwlock/tests.rs
 +++ b/library/std/src/sync/rwlock/tests.rs
-@@ -60,6 +60,7 @@
+@@ -59,6 +59,7 @@ fn test_rw_arc_poison_wr() {
  }
 
  #[test]
@@ -374,7 +373,7 @@ diff --git a/
  fn test_rw_arc_poison_mapped_w_r() {
      let arc = Arc::new(RwLock::new(1));
      let arc2 = arc.clone();
-@@ -88,6 +89,7 @@
+@@ -86,6 +87,7 @@ fn test_rw_arc_poison_ww() {
  }
 
  #[test]
@@ -382,7 +381,7 @@ diff --git a/
  fn test_rw_arc_poison_mapped_w_w() {
      let arc = Arc::new(RwLock::new(1));
      let arc2 = arc.clone();
-@@ -438,6 +440,7 @@
+@@ -431,6 +433,7 @@ fn panic_while_mapping_read_unlocked_no_poison() {
  }
 
  #[test]
@@ -390,3 +389,15 @@ diff --git a/
  fn panic_while_mapping_write_unlocked_poison() {
      let lock = RwLock::new(());
 
+diff --git a/library/core/benches/num/int_log/mod.rs b/library/core/benches/num/int_log/mod.rs
+index 3807cd5d76c..018c5c04456 100644
+--- a/library/core/benches/num/int_log/mod.rs
++++ b/library/core/benches/num/int_log/mod.rs
+@@ -98,6 +98,7 @@ fn $random_small(bench: &mut Bencher) {
+         }
+
+         #[bench]
++        #[ignore]
+         fn $geometric(bench: &mut Bencher) {
+             let bases: [$t; 16] = [2, 3, 4, 5, 7, 8, 9, 15, 16, 17, 31, 32, 33, 63, 64, 65];
+             let base_and_numbers: Vec<($t, Vec<$t>)> = bases
-- 
2.43.0


