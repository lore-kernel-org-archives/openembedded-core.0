Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15C22EE0213
	for <webhook@archiver.kernel.org>; Wed, 11 Sep 2024 06:46:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.16016.1726037209481960357
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Sep 2024 23:46:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9984e3cae2=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48B5rxQS005204
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 06:46:48 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41gc2145jp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 06:46:48 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fat1uT4gZCnWTzeWTWdAIe+NT+8hBrRoZdtF7Z0q3mHkOCG8OAMwySAiGQTY0V2WJ4XabAuLHPE00DeSSB0nrNKJ4soep7sdKQ9jtRExjNPKv5YiqmWo/kPAWJHebLR3TtEVuvHJ1IbBpwtn/lf63FiuiI7FBrGkJ+6GKexJ9dhc15ijUMJTS7SBih0/3gwIUj+OE0luWfAUwGsjgk69P5KgroLhBeYt3COEKZfUG6wJEBSVSt6CsmLOdBhimbBfNDLxTGW3j1MAOsVvJMVb1jEXMLt/WPf/BrXSRHXpc5oujlLXP7d8yxNZt0lsHN5XqmYN0xJ5H1jLNsIu3CyG8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=431/3yiZAGwXRgomuEnFu0zAMNUw7NRyUG5oYVLPntQ=;
 b=xqNK5zFlIaRG+kT1rwLN+5Vbd8o5g2Mi60nYqceOf4vICg7z5gCsM0yCq8iAOch5lp32GdO18l7Po9fHizk2ST7JLH84tbMUd4Xq0kANOgu41f9l1Tj2r7A4RZp7JuyEjQYpsLPFk8nwIyD9kjug6ZsHOdA+qdzHr3o5OHH3i3v9KEUO6xOx2XsOwFf7fnLHAd8Lwql690hwvfp7sBnanDK75F7MgHlBQ9eVseCZDBvmb58dBueeeEo2ffiMsfFxCgo93WoZ3nRSexrkWG91k8KpKaXbyNTLJLbJtGFbAvSkooPtEbXKicW98GNp/vAzCEdZcxJ/7IZ5FYIgt+dEWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Wed, 11 Sep
 2024 06:46:46 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.7962.016; Wed, 11 Sep 2024
 06:46:46 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com
Subject: [OE-core][PATCH] rust: Rust Oe-Selftest Reduce the testcases in exclude list
Date: Tue, 10 Sep 2024 23:46:30 -0700
Message-ID: <20240911064630.1057025-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DS7PR05CA0095.namprd05.prod.outlook.com
 (2603:10b6:8:56::29) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|DS0PR11MB8182:EE_
X-MS-Office365-Filtering-Correlation-Id: b4e58c12-5fa0-4383-7b6d-08dcd22d80ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?H0P8483HtX26RJBRwN+P/x2olD373Mv1rrYvTXImXYRgIzKS9FOs6Ul8+PPa?=
 =?us-ascii?Q?gzWcFve2oXJpMpj3PEtPExKEf9qoyexhfHH3eAykCz37EO26eupKP+UjaYI0?=
 =?us-ascii?Q?4Hc1eRb7Dl69Vy2M9RFPFcME7B4NVSHtd98cGJiOhjyHM51L3+3iF6IwkBv5?=
 =?us-ascii?Q?OZthidL4B4gN4UsG5lEOUebv+lXwRKPSz+pZjdsCFxO1SbA0hpQLWCSlj5yT?=
 =?us-ascii?Q?I0rS/hCsmIA2iqLualYKKTnb8Ch7c508KMuWoLGBGl5rS+h572S5FPBN7amm?=
 =?us-ascii?Q?1cyrne9cehXX8LdsS8ap0ftsdLy93dhHqBEMs99f2mUoffoAwOo9Bvkm3NpY?=
 =?us-ascii?Q?4Q+e83T3zkExGViinp2JkL3FT6Q1iuLMArhFO0WLc0U/r6dCzZE8b/bXZYXY?=
 =?us-ascii?Q?QqolXIThaApZ4SSGNLi3cJNsf8cA+DZGX8xUUOdGcM/bdkfwkGTMqQuDaBhS?=
 =?us-ascii?Q?A8GhVaW8vf91NmW/TZTVHTGC6rm1NPb4wlm0E8j1o0PU97Ko8mpz/AKgTXU3?=
 =?us-ascii?Q?nF02KziIG9EqiRpKtF2hJlB+N3OV4DmXpg1KbuvlDO7xZBVn96rM9JaLHo5i?=
 =?us-ascii?Q?frzKaNY2fDPo5N5S0u8CRmp+3aHitMTQ5ZfHwZthHFjyWw/plu6ftOykq96f?=
 =?us-ascii?Q?AIB4CC0DthCcEwH2tUKhA3dE0QyvI87aZPUDFuWRHJyAAgbL4sfnaMqrHN1N?=
 =?us-ascii?Q?X7dOsiWaHkaXfbO4zU9Tk6u/CSw3J7hN4QeScl670hBAMIZ6DJjCZFZOj0yP?=
 =?us-ascii?Q?8sn1EgHJRJfQ5RtXUEPLfS3P/y/f1H4jFAZ4De4HMSO/3lqxx7dBfk+0Fw4h?=
 =?us-ascii?Q?KMTRUrotYjMT9yZ0q4HdATb99eoxuhu2oPljA1rotZlmS3ks+BGeiROF0W/l?=
 =?us-ascii?Q?QsEVeK8bRdXcWl60kkGxwAskIn+QXyT6hEYwjqfvpTZpvRHeEnIhxBWIzCpT?=
 =?us-ascii?Q?aTBmV82vwKC4HhXFE6SrVh3LOqfs6EhVdEjCPZa6vH6BrAq1Ejjr+BmNUcVj?=
 =?us-ascii?Q?stn/EKhKg+VoPRdQbYeYQDhLbj+HFxQW3LVFYVaZXSSlpfCnHrQ4mm9ujUtd?=
 =?us-ascii?Q?OsFn3TFw4FfnLjQMQxm8hYnnozI5QuJT1hQKEEI8N8BczBktPBVps4J3lKQF?=
 =?us-ascii?Q?6zTy8yTQBeZwBVTYBR5J+2338Y9tKPep+iz3/Li7YPG+CXvz2Yzwawa7YxaD?=
 =?us-ascii?Q?rSXUfUqQlpxtbYlqeimyQ8MK8rj718GJrD+Zc9LdD6zo8eyM5ojPLeVfhdQE?=
 =?us-ascii?Q?NfDHMCfm7++C1DXWKaQdpvGzHTkZ51rZdfATSlG/CqMDsfXhQ35ZVL0ljAHd?=
 =?us-ascii?Q?jEdxFIAZjWO9rJgbI9/UOgk9Pm3/06kX5UCjqlItSvh/fkW3QRjJlVSqjWtV?=
 =?us-ascii?Q?BnmZ9/faTjdJeCx+/hpZaLkRGbyUqmuk1M8afn4kGVQMy5Hh6A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?B/cgTA0avrydQZJWbD/KWdIIh602XK8YqilpM4Lbhf/ixQ0M44rT6/w/ojDy?=
 =?us-ascii?Q?xUXVYfVSsxvJwI7UKwkxgu093W6pvyHxq0ntk6j7e1O8yvWRNVY16lfkmepb?=
 =?us-ascii?Q?do5O7WlPcRMR2jFeUJBJ3sWRyu+i/SLGihynvksO3YYZclWluVO2kqULFWVE?=
 =?us-ascii?Q?W/Hv41O23Gu9JIJMIO+L4zYdjbeFMFZ7xfzJU7ViDnR6G5B8/dtwJTcCGgkr?=
 =?us-ascii?Q?a9s8Znvbhpxa0SodnhvYLjhR0RHxRAtUX2WEnRVxkBiuFzQCFztZ6/jeMYCQ?=
 =?us-ascii?Q?u2Ex9qF67o0FpddJ2yyqCVnMffeXFoYaCCtLUaqXyczF3PPkOOYr3iE6TB+n?=
 =?us-ascii?Q?/+2HwKpn/oxvkwt66z494EqSHguBNvwVsTMEMPU6bvlGGC347Mdh7yQKzZwQ?=
 =?us-ascii?Q?7fVOQ9KizX2CtkKdLOpxX5dkf6RgTiyIXSOvyjUeF3iKKeU0mra/sxEuCA5K?=
 =?us-ascii?Q?zJaxwyfDqh4vv/ikBTe2TM2Oe0e+HlTcERhE7SLTqOPDOB9tz1xG1tl+j8S7?=
 =?us-ascii?Q?eAXW4lKyncYzhaqwkgtUQ+OyMRZXj5jUz/pDgV9FBRNmqUFgfzGEwIGGFKRF?=
 =?us-ascii?Q?ymCBWm4GWZhjA30XLLM7PobUg66l+OeV5obaAwOGf1moOzOiNCliBjlXIC1/?=
 =?us-ascii?Q?G89DvD76OvbLJNdr9NcO+234ikRpHDWivCJJs+TGQJICHns6Z9tg35PIg7dn?=
 =?us-ascii?Q?+78Fwz/gecwt8o4RouSJyrKLUqdbYCRFMbhgwV2NtLdKQI8/d/NIjwyY7Zrz?=
 =?us-ascii?Q?DZXGPWXxQjMXftbB0jU9AvWImizZw4jy14+D5iVfjNhZErj6nnEFfelws9Lc?=
 =?us-ascii?Q?Jv8Wodwf+xqX7VxdyGGip1E+TTbKHEDUl39uk9RgoaYgR+ODFymZj3eaAy+K?=
 =?us-ascii?Q?5nd5eai7QvAXdLM6QZXNoCuFjTPX6XHa7AeqtbRGi9ZO2ClZxGFkJxAXa8B3?=
 =?us-ascii?Q?fCmi2bvODTeBp/jXqVJPXSa8bs7yJZiKfMF2eS4E4idUnThc+rgKSgbH5lQX?=
 =?us-ascii?Q?VbdYDiq19WdzvLhZva7cxbvN3RVdgu9BST3516ITr/eUhtPzv/mmG0fWvdKb?=
 =?us-ascii?Q?9hypyLCqzczxfcfOeypMvSaYXbDRK7sqwFNdquHmRTIzt6UtH/4IoBE6hkoh?=
 =?us-ascii?Q?BdRXiz+mscivAtgo26BoNtlObNS/KgN2daRjOA+uuWhh4TDEYdsS4TEfMYvL?=
 =?us-ascii?Q?nai++VeUyn29FZbuFBNPzKz6dN+w/4tMscU2GCbiP2FRDk0WTu+DM1WS3oin?=
 =?us-ascii?Q?zcXA5EYhX7G+F1dngZtWSYf58b2rQpFmfc+3FQqeQbXh8y0LFz+jiKKjaJzP?=
 =?us-ascii?Q?r2c548uM5gjdQq0SVcnhIdt2/WaLWVnnSjccoOk7V/MfTQ2bsiqXY/LDemnp?=
 =?us-ascii?Q?yxOnNG5N3xN8/mPBomGwiW0eS9GbM0Yp2eFaXKbWE5nlS1Duk3rti5Y1apsN?=
 =?us-ascii?Q?HsJjxYRpiIynbF0Swa1mlJvlpHeZn42zSv/JTuxTIbB7ZWHXXaHSl3vH8A8C?=
 =?us-ascii?Q?CdRWTTzqnR6LwljUoDwWSkrIkK/3/UKCZkkN9f0/gJpe05sU4uVOIL2VoYR/?=
 =?us-ascii?Q?C3tr43IQ7+N6sBMfYlJKGAX1PLbanoY6IQrm5Zyz2ocXmbT46wFw40lZvRBY?=
 =?us-ascii?Q?un+UnNJkHD7s7K4TkNk0yvs=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4e58c12-5fa0-4383-7b6d-08dcd22d80ec
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 06:46:45.9637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tlPmmO12a5OytnzWWr/ykqREpv2pUgjpXMIg7kCRECqgrZsAL/iY4PAQK9qGuEJJGax3NkArMM0drIKVC5obakfYJpOta+DVv2zOf7Xsn2iZEm/JNIr4vW+9rlYTUCgH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8182
X-Proofpoint-ORIG-GUID: oyr5uNzTWvWryVlPxlbRCMz83lL_NVwl
X-Authority-Analysis: v=2.4 cv=PvDBbBM3 c=1 sm=1 tr=0 ts=66e13cd8 cx=c_pps a=28bFCgguF5sZfysLuYgbMw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=E-Wxvt7OoGr14lEoW9UA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: oyr5uNzTWvWryVlPxlbRCMz83lL_NVwl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-10_12,2024-09-09_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 clxscore=1011
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409110050
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Sep 2024 06:46:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204373

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

We had previously excluded certain test cases due to failures in earlier versions.
However, with the latest version of Rust, many of these test cases are passing.
As a result, we have removed them from the exclude list and added them back into the test suite for execution.

The rust-1.79 has been successfully tested with the current test inclusions.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/lib/oeqa/selftest/cases/rust.py | 132 ---------------------------
 1 file changed, 132 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
index 09487e3e23..cbe6366f75 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -66,23 +66,7 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
         # bless: First runs rustfmt to format the codebase,
         # then runs tidy checks.
         exclude_list =  [
-                            'compiler/rustc',
-                            'compiler/rustc_errors/src/markdown/tests/term.rs',
-                            'compiler/rustc_expand',
-                            'compiler/rustc_interface/src/tests.rs',
-                            'compiler/rustc_span',
-                            'library/panic_abort',
-                            'library/panic_unwind',
-                            'library/std/src/io/buffered/tests.rs',
-                            'library/std/src/io/stdio/tests.rs',
-                            'library/std/src/sync/mpsc/sync_tests.rs',
-                            'library/std/src/sync/mpsc/tests.rs',
-                            'library/std/src/sync/mutex/tests.rs',
-                            'library/std/src/sync/rwlock/tests.rs',
-                            'library/std/src/thread/tests.rs',
-                            'library/test/src/stats/tests.rs',
                             'src/bootstrap',
-                            'src/bootstrap/builder/tests.rs',
                             'src/doc/rustc',
                             'src/doc/rustdoc',
                             'src/doc/unstable-book',
@@ -96,140 +80,24 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
                             'src/tools/rustdoc-themes',
                             'src/tools/rust-installer',
                             'src/tools/suggest-tests',
-                            'src/tools/tidy',
                             'src/tools/tidy/src/',
                             'tests/assembly/asm/aarch64-outline-atomics.rs',
-                            'tests/codegen/abi-efiapi.rs',
                             'tests/codegen/abi-main-signature-32bit-c-int.rs',
-                            'tests/codegen/abi-repr-ext.rs',
-                            'tests/codegen/abi-sysv64.rs',
-                            'tests/codegen/abi-x86-interrupt.rs',
-                            'tests/codegen/adjustments.rs',
-                            'tests/codegen/align-byval.rs',
-                            'tests/codegen/align-fn.rs',
-                            'tests/codegen/ascii-char.rs',
-                            'tests/codegen/asm-powerpc-clobbers.rs',
-                            'tests/codegen/async-fn-debug-awaitee-field.rs',
-                            'tests/codegen/binary-search-index-no-bound-check.rs',
-                            'tests/codegen/bool-cmp.rs',
-                            'tests/codegen/branch-protection.rs',
-                            'tests/codegen/call-metadata.rs',
-                            'tests/codegen/catch-unwind.rs',
-                            'tests/codegen/cf-protection.rs',
-                            'tests/codegen/coercions.rs',
-                            'tests/codegen/cold-call-declare-and-call.rs',
-                            'tests/codegen/common_prim_int_ptr.rs',
-                            'tests/codegen/const_scalar_pair.rs',
-                            'tests/codegen/consts.rs',
-                            'tests/codegen/debug-accessibility/public-enum.rs',
-                            'tests/codegen/debug-accessibility/tuple-fields.rs',
-                            'tests/codegen/debug-alignment.rs',
-                            'tests/codegen/debug-column.rs',
-                            'tests/codegen/debuginfo-generic-closure-env-names.rs',
-                            'tests/codegen/debuginfo-inline-callsite-location.rs',
-                            'tests/codegen/debug-limited.rs',
-                            'tests/codegen/default-requires-uwtable.rs',
-                            'tests/codegen/drop.rs',
-                            'tests/codegen/dst-vtable-align-nonzero.rs',
-                            'tests/codegen/enable-lto-unit-splitting.rs',
-                            'tests/codegen/enum-bounds-check-derived-idx.rs',
-                            'tests/codegen/enum/enum-bounds-check.rs',
-                            'tests/codegen/enum/enum-debug-tagged.rs',
-                            'tests/codegen/enum/enum-u128.rs',
-                            'tests/codegen/export-no-mangle.rs',
-                            'tests/codegen/fastcall-inreg.rs',
-                            'tests/codegen/float_math.rs',
-                            'tests/codegen/fn-impl-trait-self.rs',
-                            'tests/codegen/force-unwind-tables.rs',
-                            'tests/codegen/frame-pointer.rs',
                             'tests/codegen/i128-x86-align.rs',
-                            'tests/codegen/inherit_overflow.rs',
-                            'tests/codegen/inline-function-args-debug-info.rs',
-                            'tests/codegen/intrinsic-no-unnamed-attr.rs',
-                            'tests/codegen/intrinsics/mask.rs',
-                            'tests/codegen/intrinsics/transmute-niched.rs',
-                            'tests/codegen/issues',
-                            'tests/codegen/issues/issue-103840.rs',
                             'tests/codegen/issues/issue-122805.rs',
-                            'tests/codegen/issues/issue-47278.rs',
-                            'tests/codegen/issues/issue-73258.rs',
-                            'tests/codegen/issues/issue-73827-bounds-check-index-in-subexpr.rs',
-                            'tests/codegen/issues/issue-75546.rs',
-                            'tests/codegen/issues/issue-77812.rs',
-                            'tests/codegen/issues/issue-98156-const-arg-temp-lifetime.rs',
-                            'tests/codegen/lifetime_start_end.rs',
-                            'tests/codegen/llvm-ident.rs',
-                            'tests/codegen/local-generics-in-exe-internalized.rs',
-                            'tests/codegen/macos/x86_64-macosx-deployment-target.rs',
-                            'tests/codegen/mainsubprogram.rs',
-                            'tests/codegen/match-unoptimized.rs',
-                            'tests/codegen/meta-filecheck/check-prefix.rs',
-                            'tests/codegen/meta-filecheck/filecheck-flags.rs',
-                            'tests/codegen/move-operands.rs',
-                            'tests/codegen/noalias-rwlockreadguard.rs',
-                            'tests/codegen/non-terminate/infinite-loop-1.rs',
-                            'tests/codegen/non-terminate/nonempty-infinite-loop.rs',
-                            'tests/codegen/noreturn-uninhabited.rs',
-                            'tests/codegen/repr-transparent-aggregates-3.rs',
-                            'tests/codegen/repr/transparent-mips64.rs',
-                            'tests/codegen/riscv-abi/call-llvm-intrinsics.rs',
-                            'tests/codegen/riscv-abi/riscv64-lp64d-abi.rs',
-                            'tests/codegen/riscv-abi/riscv64-lp64f-lp64d-abi.rs',
-                            'tests/codegen/sse42-implies-crc32.rs',
                             'tests/codegen/thread-local.rs',
-                            'tests/codegen/uninit-consts.rs',
                             'tests/mir-opt/',
-                            'tests/pretty/raw-str-nonexpr.rs',
                             'tests/run-make',
                             'tests/run-make-fulldeps',
-                            'tests/run-pass-valgrind',
                             'tests/rustdoc',
                             'tests/rustdoc-json',
                             'tests/rustdoc-js-std',
-                            'tests/rustdoc-ui/cfg-test.rs',
-                            'tests/rustdoc-ui/check-cfg-test.rs',
-                            'tests/rustdoc-ui/display-output.rs',
-                            'tests/rustdoc-ui/doc-comment-multi-line-attr.rs',
-                            'tests/rustdoc-ui/doc-comment-multi-line-cfg-attr.rs',
-                            'tests/rustdoc-ui/doc-test-doctest-feature.rs',
-                            'tests/rustdoc-ui/doctest-multiline-crate-attribute.rs',
-                            'tests/rustdoc-ui/doctest-output.rs',
-                            'tests/rustdoc-ui/doc-test-rustdoc-feature.rs',
-                            'tests/rustdoc-ui/failed-doctest-compile-fail.rs',
-                            'tests/rustdoc-ui/issue-80992.rs',
-                            'tests/rustdoc-ui/issue-91134.rs',
-                            'tests/rustdoc-ui/nocapture-fail.rs',
-                            'tests/rustdoc-ui/nocapture.rs',
-                            'tests/rustdoc-ui/no-run-flag.rs',
-                            'tests/rustdoc-ui/run-directory.rs',
-                            'tests/rustdoc-ui/test-no_std.rs',
-                            'tests/rustdoc-ui/test-type.rs',
-                            'tests/rustdoc/unit-return.rs',
-                            'tests/ui/abi/extern',
                             'tests/ui/abi/stack-probes-lto.rs',
                             'tests/ui/abi/stack-probes.rs',
-                            'tests/ui/allocator',
-                            'tests/ui/array-slice-vec',
-                            'tests/ui/array-slice-vec/subslice-patterns-const-eval-match.rs',
-                            'tests/ui/asm/x86_64/sym.rs',
-                            'tests/ui/associated-consts',
-                            'tests/ui/associated-type-bounds/fn-apit.rs',
-                            'tests/ui/associated-type-bounds/fn-dyn-apit.rs',
-                            'tests/ui/associated-type-bounds/fn-wrap-apit.rs',
-                            'tests/ui/associated-types',
                             'tests/ui/codegen/mismatched-data-layouts.rs',
                             'tests/ui/debuginfo/debuginfo-emit-llvm-ir-and-split-debuginfo.rs',
-                            'tests/ui/drop/dynamic-drop.rs',
-                            'tests/ui/empty_global_asm.rs',
                             'tests/ui-fulldeps/',
-                            'tests/ui/functions-closures/fn-help-with-err.rs',
-                            'tests/ui/linkage-attr/issue-10755.rs',
-                            'tests/ui/macros/restricted-shadowing-legacy.rs',
-                            'tests/ui/numbers-arithmetic/u128.rs',
                             'tests/ui/process/nofile-limit.rs',
-                            'tests/ui/process/process-panic-after-fork.rs',
-                            'tests/ui/process/process-sigpipe.rs',
-                            'tests/ui/simd/target-feature-mixup.rs',
                             'tests/ui/structs-enums/multiple-reprs.rs',
                             'tidyselftest'
                         ]
-- 
2.43.0


