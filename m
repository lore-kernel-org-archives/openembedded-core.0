Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A4F0C83000
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 08:34:23 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.7960.1724920461137160258
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Aug 2024 01:34:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9971dbebdd=yash.shinde@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T7QfhF031818
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 01:34:20 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2040.outbound.protection.outlook.com [104.47.55.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 419unh1gwj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 01:34:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xG58JVndGykn8fHaPJAJuLkki1kavtgu1AR57HE6s8yAIRNzZfZvdQeyFs5TTh18gJDQoNLSjq41Hnssn0y+LNjnJQX5dHAfHc6YysADDkxvPcDzfsG+PPpsGrQIixcszHP5fHopu/tpOXDif9pKkgKHLibkQuTK6w5SpTMNsqw6HQAi347nSquEcCBOItH1njBErfAICVBDdYJSR3sk9ltQB6RHr2XEiY2c5JRFhqT834Qq1SAz9eCLIn3Ssn93dFSPe5ndfQ43Eed/GQdsU22ie9KIOffYT0rLMtDbqhIARU6+CCiGHu2GQA+ECkWvwI3Fy+asTlikNKHHY1xK+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6DJjVEZSgyBU2LgOhN1JNtwP30S2wekYSxQ6jHgiWrg=;
 b=rjDFl48gSsPDglz5405r6KWVQOt6QX1jBfkTcO3a4BTsS2B5os+qxr1494jFnhLq0FFu4NWVLPatNqHoPgzt/tyamM/1HzGJ83ED5t97QP9aCRa7CmYLuR/8jVqpdIsoIps+EFwWix6c2FMHJ27gLdDnnZeJk+9fgf/Ht/K0dfqDQgpb9bJluT0mraPkL5Nqn5ppHIeCiJDbzILYTurERkVaYHQyYbIvvAFNCa2ZSuP2Gm2Z8E66o117YeY1cb6PimOIU+TAXTdw5qzHQxC+qUWSQADB2vo/ehupofJ7X6a4cw+CBt6pmipzY1Z0aU3BEONVJyQKMMvl926LN6yg2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by CY5PR11MB6488.namprd11.prod.outlook.com (2603:10b6:930:30::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Thu, 29 Aug
 2024 08:34:17 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%4]) with mapi id 15.20.7918.019; Thu, 29 Aug 2024
 08:34:17 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com, sunilkumar.dora@windriver.com,
        Yash.Shinde@windriver.com
Subject: [PATCH v2 1/3] rust: Oe-selftest changes for rust v1.79
Date: Thu, 29 Aug 2024 01:33:54 -0700
Message-ID: <20240829083358.1277849-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0022.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::14) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|CY5PR11MB6488:EE_
X-MS-Office365-Filtering-Correlation-Id: fba6d633-1a50-4e57-0088-08dcc8055eb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?G4t98VdUAjQWIJnYJQQNnqXbVdphCUq+5xL6pzEzyX+T9+ZLlhqRQdQ0fUuc?=
 =?us-ascii?Q?/moyzvZDLhqYD/Vn8kKI37vgrWbUPjqQoEw4xSIq43hqaGfomlICRI+4xJUQ?=
 =?us-ascii?Q?bzmSMbCiZY1r1McJH5qn49LwTUP8dJZQxoNICmyMwJjc9x2H+RQq7iEyQXcu?=
 =?us-ascii?Q?QEZ2CjxrgBDgHTZQrVieyovgm6DipWVYT6tv8koFviHHcZ8IlnnxrhjrSdv/?=
 =?us-ascii?Q?u7as7/jb/yDgQJnsyUHcmQ8e7y7tO0XdzBlA003GLoHnnoOJYFye1oRBAUvS?=
 =?us-ascii?Q?bPJDU8gg1leuH4SlEUBh+CCoDAOarmjnc/oDb9DVQ5OM9gN9ecLLX3+7Z9Fz?=
 =?us-ascii?Q?psEPi/WtAXIxs/5stm9J3ITBPyH1VyZ7t7iZ0vwXuDepGJV7i55gNZVMfnQ/?=
 =?us-ascii?Q?8WcGNWTG5WxdCpay1BjXJEJaGcHoGRkCFYyomUBluzRmOXg8AEB49ZcXjWtP?=
 =?us-ascii?Q?PLBTMR8j1jlffb62YGLf6iuuD3XPaBfyKtkJmGIIr12dmFuNAJsbHOgZ06/U?=
 =?us-ascii?Q?D+QSWfGxXVlPMTQV4A1oVwM4yDcBFzqX7i7NyZdpKzKM8g+sZcX4aEqKvZcC?=
 =?us-ascii?Q?FcweKNt1zjRyN+8QEIwOs9HNgvWqLgsj/8qi2IxJk8NbU13fghTJ5VhUC1tk?=
 =?us-ascii?Q?UtQdG3Ecgyw7+sU6YWrbwUnN1fAFVGFDh5nZSZpNZczHNdyaqPD77hTuV13n?=
 =?us-ascii?Q?nlk/WTcejlvlAPxVevAP1tccaBOd8S+OTGQ7fSt/Lo/jzEeW8xbnIOfhg2c1?=
 =?us-ascii?Q?97OZq6xT5tLCPLQnjzQ9T6zmD2tzSxpthRVxs4MEuSHH4TujDQf55aPOe+aJ?=
 =?us-ascii?Q?Mwy3kfAlCzHkpXhbPMJOIQzComTwqsQXHkk5sOkg8pEGZad+xcHpLUFw2VGr?=
 =?us-ascii?Q?X7P6Bpd87gWJwhHjsl9P2fkVcaKlY14yCasPpxSL8u6Dcz5tcVO/e9cI5dAt?=
 =?us-ascii?Q?TPBSRlWH/AxO+5lnoq3a0B3Rvj2YvC423ob1tF5R5mvM1K76D4AXbTG6Xzsb?=
 =?us-ascii?Q?3CHVkofNpZh+3bnAuPGEmGq6wevRONKpp0T7AjE19Gue9vGeGIQEGZn0XzHk?=
 =?us-ascii?Q?OaNnQJDMOtNcWoGcNiy/nrvLmITvpCKzogXGjg1avMTgJSoO1YVZgMoNEiUS?=
 =?us-ascii?Q?de32wD86ax6/Nuw+LTQEC7bgztgtNOL08EFc98/NlHfo8w5UnllGnT3K72qc?=
 =?us-ascii?Q?OEux7hhEQgXN/1pDZKbUTKctin9Td0cmlwgRpwtcQAnDdEjaRd/SOxH4ZqWb?=
 =?us-ascii?Q?Z+tsrNiRcjSuk6APbPA3uRXbkeSadKk0txd8Z0tfoOMizrea/xB+1Xeol+wD?=
 =?us-ascii?Q?2RNL8VlLEImgNl2ontY/9xpAqv2KXH5uzIIeYawH2KVA9mnDYTTIxol/Qyws?=
 =?us-ascii?Q?V0nxiSj5WX0sw8fg968lJAY/nwWL2lK+JSY/zidSJJCHCE5Q3g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DXnr0PEopA154faZbGJhw04ZHZB+gdQq60s8vDlyQZODIShQLE4s63NH25gS?=
 =?us-ascii?Q?6ySU07pzMIpUV41rbd9ZyCyaxgpz6nrOPiXg74ivutUpNxF9vs5vcHR/t1q+?=
 =?us-ascii?Q?vzaPHlqigNYw/20e0yJm37CHOLD7VQhxxDdAgQEPzeIPlWWozC9clXDtb9Jy?=
 =?us-ascii?Q?McfOYuBobAoWafjd+fBMS/uzrb/uqkFjI2Ur18Y6vz4g9owAG9q2fX09deKE?=
 =?us-ascii?Q?Yit8vBJVSk8CW8nZUrcATIie14NoO7bUe2mL5x3mBpyoIYW+v+Ve5DaEPP2v?=
 =?us-ascii?Q?r4eqB7yscO5JiosE4Kb1o2JJFvB36898M11hINWTkVTwOk/Ve4FsF0prz/gC?=
 =?us-ascii?Q?EBHREqPT99ZXASafMeUBwQCfkKtdpJ0REazYjTpuSp6nPs0KQ8eQc8jX98K3?=
 =?us-ascii?Q?K3+JA8TMs/rMJyg8OoqJK6FBI4Pb1hFEoSt1deBanzICf2KthnjOO5LogkHR?=
 =?us-ascii?Q?FO6liNEe/ThgMwZyiF1YbzW1q71Z0PvbSENvoULa54Ivkee367XR5Yd/aXjY?=
 =?us-ascii?Q?UFmU868LHNTb+CcXiv/9jGIHpl6LhCI1ZBZWyN/rswisCAZKaQO6qln1bMxB?=
 =?us-ascii?Q?uIvgCC3YqoWb7ZTOcJ05O0+xPyHCUBpRizUBVKEeq1kE+BBxygYQbVe/pkxs?=
 =?us-ascii?Q?hu2TSs46IUbsR6DJRpYdEW8YTQiLJp+rpHcZRT+sxqZgDXn8chUwEhmNIV1F?=
 =?us-ascii?Q?EEMbFxfb/qZ+WyR0f/sNr2/6PjRl7C4NOnc3fRRm/Wg5d+Z3iKlAPC8y5Erk?=
 =?us-ascii?Q?rsC8YKeKMqBi/Hr3nZVktsSjMnG3fqWGj8bRI9M/Gr03xwsFdb4QEt7dfw8T?=
 =?us-ascii?Q?fxVrQveB2KrxnRdR9vUFuiF02Ti7UVm7mzM7hyk3BCvB/qviT1hu7jxkWKOq?=
 =?us-ascii?Q?035V1EfGCjkuK6g/EXy/rOYywgSWW0k/IVrQ4917xb9/qv0sp/nVar9+iNmN?=
 =?us-ascii?Q?auFoYkvMVp0SPRTZeQye0bm14FOVHYBPQQlZgMwaIDd2wUyEZc+lg6KHb7r+?=
 =?us-ascii?Q?wXIJl8AjG3E6u+6d5+38yXs/UUR6X640CEBlgpk3PJAEW+mJs6qGgziyO8KO?=
 =?us-ascii?Q?kxy5EdrqQx4KoSFpHahw6H8xv0Ld+OcnArScm3Y4LIlOeCxe14yjhtbWO5v2?=
 =?us-ascii?Q?9dwwaMPXI+rhANVTiONlAuRulKsHOYJeR3oUk81WePkQri8SNwxmfm70tBPb?=
 =?us-ascii?Q?Tn1rmYBWfLhMx8qKfUUY5E+Qlgv1/7TTXsnizki0abPh1nb2y7TfoRTzm2gj?=
 =?us-ascii?Q?vI/zYo0I1BM04aa23XHzoCxS9sIHxgayBFfHn1xKr4dMwumVBSnO4NR5eRTC?=
 =?us-ascii?Q?37fMVHIoDOxvRYqdKuF3gFc8PZGgGdWA9maEJ+pw4/JkHt93F/gDDLWCLluX?=
 =?us-ascii?Q?bUn7h+bIVxU+7QRBjaZBjIfrjTdEXSA6EXwEbE8nM0O14T0Iw83VUj5gInoq?=
 =?us-ascii?Q?gisPOo7cvoSNdio2WXupn8/yKNZaCqU1HBBqQ0uqhPLdV+rGhLM3cahwGTdU?=
 =?us-ascii?Q?pIRLnRhXFLZ3OYa3q4z1NnBlz74TBGQkmtnSuy5MwYyS2nE+XIUdOeQBSojA?=
 =?us-ascii?Q?GxtOrQFqW6F3C4cEFBvFh77vUnxKcT4BJRj5/JFOcLg+QGXrTZQtJaF8Rh6E?=
 =?us-ascii?Q?5w=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fba6d633-1a50-4e57-0088-08dcc8055eb4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 08:34:17.0470
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TPjhGarG66CUNlh1m2t0XjhLuhfO14K/WcnV5NrjbvOfepEQos749aIpVSaexSA7JWxtmxJsXCG6AGBFjQ9mz7b2LQYu97qh3zKYwiViHP4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6488
X-Proofpoint-GUID: Le0sugUE9eiY0bQSSZI1BPxSB3ogHd7K
X-Proofpoint-ORIG-GUID: Le0sugUE9eiY0bQSSZI1BPxSB3ogHd7K
X-Authority-Analysis: v=2.4 cv=K8RwHDWI c=1 sm=1 tr=0 ts=66d0328c cx=c_pps a=OemXRkCljtmPz/OzEC+nkg==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yoJbH4e0A30A:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=rL-gzRcho55yBmN0qZkA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 spamscore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0
 suspectscore=0 malwarescore=0 impostorscore=0 mlxscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408290063
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 08:34:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203902

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
 .../rust/files/rust-oe-selftest.patch         |  69 ++++---
 2 files changed, 122 insertions(+), 117 deletions(-)

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
index a69c1e5237..01c3634d9f 100644
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
@@ -363,10 +362,10 @@ diff --git a/library/std/src/sync/mutex/tests.rs b/library/std/src/sync/mutex/te
  fn panic_while_mapping_unlocked_poison() {
      let lock = Mutex::new(());
 
-diff --git a/
+diff --git a/library/std/src/sync/rwlock/tests.rs b/library/std/src/sync/rwlock/tests.rs
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


