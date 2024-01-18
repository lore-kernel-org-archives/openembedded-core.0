Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B0ACC4707B
	for <webhook@archiver.kernel.org>; Thu, 18 Jan 2024 10:59:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.8830.1705575536019503417
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jan 2024 02:58:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=RZxQ5pIq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1747b3eb9b=yash.shinde@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40I6RsM4020591
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 02:58:55 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=K5uu8XkGJ1Dca3GwKf
	G73gD4Oe30/r4Rs98P+9pMUjY=; b=RZxQ5pIqeXGbZooKSV8HQr0ZrP0q0Z925L
	3rDN1XHTwsvbfR8aqewSstrFJUhaSKmb2mUHNJJyKytGapGUI6cq+3BhEoRwdknY
	KPZs4gOoztPZp5VV3lzs4n43ylUNeUA+g4ZcCmBUAH5tDCEdm29miBgrzhIwU72G
	fTb3VQVjjtQl4L7ZNHmNYZO1EUqG8udszOcRrGCuWxk7XZAZALgXy/IrFBhAkIvV
	YtbA4QVTEBDQQgLhVvKmZSR6q7X9tUsHQh+9KXdVE5oZzYif9w/qs8YpVeK1VgFn
	RDhq0buOHmwNcsf3RGAOru2cGbp43QQkEdgeHZR9tcy4gh4wJlXw==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vkpp45ey3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 02:58:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f2iMQDhSA8IABySGGWsGXsvCAiIa740b/jG6nSm8hmLVMl8rxDepwtr0KHdkix6jZQ5dLHtqhDthcTPQ3BooG6dy7Z4sROEcCTl2MHQA9UhSHo3S41zQ/lL7U3ZtdpcSbeHOwo3z6XyKakKAu1jtiEak95mbUJqsPQ8mkmDXEEchdl4xmouFzHTW7WT1ml2yRZGrWfHX/lw6QDckrp0UOvdYtEi5e8QEROKTZb+hTMrPZJt4OsOtMhOesG08Xh1Wxy8aAf+dHzXDb8LpUC0Gwui7MJE04glvibkEJyG6jszyAlo6chI5ieFqpHVmuonoKjSCFbsDcMPzdQA0f8KRyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K5uu8XkGJ1Dca3GwKfG73gD4Oe30/r4Rs98P+9pMUjY=;
 b=jone1/NtaW/gGvn90AW6JCenkvJHNmnoKeBGCVIwDo0B48uPLMcyGAH4ij9InHp9Jw0f24vYxPGd8HFaOfMoi+Qmm8TQMcABvYfdlsufAwLECvEyyoXpgJmjpLWrTXOf31aDno/EtSmPC6mfKHrf4dcNhxJGagzuIlDv+8dLnDTTkWsumibAQXUVPjWOz9ljxZxulm+Kys5PL1FrVKSgNoDjwL8vyQqqrvEgowC4I7NeZQ337S2fgxlXTTTZo2L2myeJc/HU3IEAWlkwbZDmePXr4CXyXFMBGp+wUwsd4QywINtvSkEUwqxMeh1o6OH7efNxsLDf7wSWKbPBPgTufg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by DS0PR11MB6447.namprd11.prod.outlook.com (2603:10b6:8:c4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Thu, 18 Jan
 2024 10:58:51 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107%4]) with mapi id 15.20.7202.024; Thu, 18 Jan 2024
 10:58:50 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kallapa@windriver.com,
        Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Yash.Shinde@windriver.com
Subject: [PATCH] rust: Enable rust oe-selftest
Date: Thu, 18 Jan 2024 02:57:23 -0800
Message-ID: <20240118105723.904877-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7PR17CA0010.namprd17.prod.outlook.com
 (2603:10b6:510:324::10) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|DS0PR11MB6447:EE_
X-MS-Office365-Filtering-Correlation-Id: a7a4dc09-fa44-4768-52e1-08dc18147395
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pwja3abACdKZXsBseHaq77EdxtiVrmSMq7SlP1e3TZ1sko28HWJWJd8y7+8U9nCzsICyONToh2Vn1u1PCgGH0HEEd87t6qBonE0WXuwNQHQRmSnVkB1O7Uaf3Y9aIoTzJ8xNGaPwFMAEmfR3Z4EWI0PG0Mv5lj4m517i8YS9w7lU/2nXOYKtLZC7qbYihvcYqMa/dFyZNJ8o9hZXogWDwAomJm8EyM8V7MLkdtbn6AnQRll+7jf7tf9tRkOSmwkfKPxLpWNJTVxiocnu8SVrvRNKHIZbVOIyJ8TG7IqPmVbefnD8KLu1BQPc1Ux/Ipj8ZN4kxQ2Q46J8pEohYBvs7bqF3sZQ90+Gvax1j6T2/UBVe4yvGZ8c6FXn3fONlbLrblNocSahjEzOqweguOtUZD73+HDvtNLsGdSbKJqfYsMiutSjfI0sWj3jhvXh5IP/HxJi130vzlCI0l7voIdPe0elWUqu75GpO4vOfCrIPRGnFEk4CO2RkN1/fVhzJO3XggZwXMXQEM0O0SeDMukY7bXecE/V7kO6aUXTg5QDOjixrHK8cjnVQoddvfDLQAoF5ZMhwljPvH0o6p+NEM2SRFuWExMd1o3ii/MCbWzvDL/oVrXzc+S4ipbhwqTI0gFfVw+IZj5RezpmbweEC9PVaw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39850400004)(376002)(346002)(366004)(396003)(230273577357003)(230922051799003)(230173577357003)(64100799003)(451199024)(186009)(1800799012)(26005)(6512007)(6506007)(1076003)(2616005)(83380400001)(107886003)(6666004)(9686003)(52116002)(30864003)(5660300002)(4326008)(6486002)(2906002)(41300700001)(478600001)(66556008)(6916009)(66946007)(66476007)(8676002)(316002)(8936002)(86362001)(36756003)(38100700002)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?V6R8DaDjwP6jeQlkpIcmJbXsE/1TrcjicNae6SUKkfzVBO4AQvtuQqQ6U5VQ?=
 =?us-ascii?Q?lcKlXohROhNO1YIvVrnWm7FVcg3OXIyCy0FkNpaGLVbOvh9E4HwiUnVK0Pxa?=
 =?us-ascii?Q?85cRVbjTbl3A211Y0fboipieihG9HN4zjhA+2i+VeMvTSczXth4dTFdbZk3e?=
 =?us-ascii?Q?nwOmzHiid2B5995NayPqCiadZcRUGnumwbZslBf06I+xA0iYKBjuRWmJAsEl?=
 =?us-ascii?Q?mnPDsFwbnklI/YmDlMISNitNSOC5QZ54GnVdLEDncEH5qYmh3gPf60OIgfE3?=
 =?us-ascii?Q?78mUzRw8x7nSQc05+Vs6njeb/HhX1DzN9qcDVyVs40Z+RvzZoRFo8VR5cNGh?=
 =?us-ascii?Q?H+hAIYACzR0Eh3+Yx50YkW/SLpMKqfll2gxF7dN0KgPpFhUD1e/F9VAZx80N?=
 =?us-ascii?Q?60CK49lW0uzmGOrNVwB+rDwZwDssJB3uefGpbaXP2a2W0bnEZPldgV13V1zj?=
 =?us-ascii?Q?E1V7Y3IGUBk/NhtJVjkDw4TYmW+AZa2T1VydDeIr/yZnN680KpcyACrQ2QUW?=
 =?us-ascii?Q?tvgT/fA/NrxEUombhjYI36XenS1p9cwT4DoI2DmVd46ldVXQmtBejvWf6vHL?=
 =?us-ascii?Q?kDZnMeJyW9Qvu/D3g7JA1NDpAz8VTX7aSqGG0dGuVUi5w9Mitrj6qKhcLnBj?=
 =?us-ascii?Q?KmnIg53nZr5ENRMVP/JGguCeCH2zldaDFsY+UdcldzDKyKPCrEsc6nd95mpL?=
 =?us-ascii?Q?FIPxoGo5eKLenH6FImBTTguCZqLPcuzOC/RPAUix+dEVZeuiyG0+Q7mrJLHf?=
 =?us-ascii?Q?wf9xusqRcAGLwwnc9p+2GL0VBuX4+hMdFJly/lfUTKZbFVnG1tXfK6YgKf3C?=
 =?us-ascii?Q?IRq01c9HQGhhNEELT0biZFhC/JA1lWFeVPUE2tJ52WgJ6v7t6TJVRFzA8aNL?=
 =?us-ascii?Q?g3BlbEn8sOfm5vVGMwRH5nsS9oFENlId9K34/oa3soS/mOgBGLdMo0fEXNHd?=
 =?us-ascii?Q?inYvzW0cmXC33YCd9kpOYvWXiE647/cTcVrUFAhOYG9j6/k/8MUnFMgOIREG?=
 =?us-ascii?Q?IFoMTUPiVJVTY1YJdpgpR8NEBZQ0X7fsn4ftGmK41k7L1+vfEADK3KBZvlIW?=
 =?us-ascii?Q?RinVPve4bCR+QveMIED2WizNJSWkNSq4KlkKLBjQyFG3vbTj6iLv11pvT5ET?=
 =?us-ascii?Q?fNy6BT64qVWFDWFyagESSUXQ9UnhtCwP2vhiQGX0ye/uCYRzNbJZmj9yGwMs?=
 =?us-ascii?Q?5n0LTGg6w1Tex0FxJq7zNWiCwzOk5dyJk9v8z+ap03SOBZIb8ZfMY5j1uAHz?=
 =?us-ascii?Q?pcL8OJLvJ+nIVis7B0HQIDaF0XgO/4iuPMhuL9QL1sObpbXbDGryNQPg4yxT?=
 =?us-ascii?Q?HK1lGivq49SRXZZ2Xu6RngUR7WLt+Xj89tYsPlsEBitBJg9eS6vW6necTZCb?=
 =?us-ascii?Q?HSruASEoROcT65cX7uVTDw8IXP1LhCP+cXwxLhGAttq9lWb78w3FD8SWSla0?=
 =?us-ascii?Q?sU32QIYAijxIsQSFbyslQs/ULp6SpU5u7xD0c7QrY0hekhvE5PHCWaVIuHjO?=
 =?us-ascii?Q?DCKDsNCtXhCWYD3gwDUO0zzBR2tYwZ85scZkSEjlWyYu50aeL56tMBtZf4Ry?=
 =?us-ascii?Q?r+rAgbPuTv7i5f30BeD3aNsbIU9q4z0ydN2z54rtlUg9X5J8a4hFx/MOS+oD?=
 =?us-ascii?Q?3w=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7a4dc09-fa44-4768-52e1-08dc18147395
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2024 10:58:50.3693
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BpZMisLfXBVAsZ/tKL8wk/xkiyVws5iN4uGzcd5leWp34/rfb5FycvI8wItb7zzppcmVxomBBfUr1tl+hdPNRJNDH9rdt+yJW9RL9Nvi5Uo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6447
X-Proofpoint-GUID: _DFIIWwST-aveGQS5ETmICBFJJ6qkzWW
X-Proofpoint-ORIG-GUID: _DFIIWwST-aveGQS5ETmICBFJJ6qkzWW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-18_06,2024-01-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 bulkscore=0
 phishscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401180079
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jan 2024 10:59:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193974

From: Yash Shinde <Yash.Shinde@windriver.com>

Enable rust oe-selftest for rust 1.74.1 version and
add target_cfg.patch to handle target configurations
for custom targets.

The testing is done on arm32, arm64, mips64, x86 and  x86_64 targets.

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 meta/lib/oeqa/selftest/cases/rust.py          | 103 ++++++++-----
 .../rust/files/target_cfg.patch               | 144 ++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |   1 +
 3 files changed, 214 insertions(+), 34 deletions(-)
 create mode 100644 meta/recipes-devtools/rust/files/target_cfg.patch

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
index 6dbc517006..216c73e5d1 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -40,7 +40,7 @@ def parse_results(filename):
 class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
     def test_rust(self, *args, **kwargs):
         # Disable Rust Oe-selftest
-        self.skipTest("The Rust Oe-selftest is disabled.")
+        #self.skipTest("The Rust Oe-selftest is disabled.")
 
         # build remote-test-server before image build
         recipe = "rust"
@@ -73,38 +73,71 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
                             'src/librustdoc',
                             'src/rustdoc-json-types',
                             'src/tools/compiletest/src/common.rs',
+                            'src/tools/jsondoclint',
                             'src/tools/lint-docs',
+                            'src/tools/replace-version-placeholder',
                             'src/tools/rust-analyzer',
                             'src/tools/rustdoc-themes',
                             'src/tools/tidy',
                             'tests/assembly/asm/aarch64-outline-atomics.rs',
+                            'tests/codegen/abi-efiapi.rs',
+                            'tests/codegen/abi-efiapi.rs',
                             'tests/codegen/abi-main-signature-32bit-c-int.rs',
                             'tests/codegen/abi-repr-ext.rs',
+                            'tests/codegen/abi-sysv64.rs',
                             'tests/codegen/abi-x86-interrupt.rs',
+                            'tests/codegen/align-byval.rs',
+                            'tests/codegen/align-fn.rs',
+                            'tests/codegen/asm-powerpc-clobbers.rs',
+                            'tests/codegen/async-fn-debug-awaitee-field.rs',
+                            'tests/codegen/binary-search-index-no-bound-check.rs',
                             'tests/codegen/branch-protection.rs',
+                            'tests/codegen/call-metadata.rs',
                             'tests/codegen/catch-unwind.rs',
                             'tests/codegen/cf-protection.rs',
+                            'tests/codegen/debug-column.rs',
+                            'tests/codegen/debug-limited.rs',
+                            'tests/codegen/debuginfo-generic-closure-env-names.rs',
+                            'tests/codegen/drop.rs',
+                            'tests/codegen/dst-vtable-align-nonzero.rs',
+                            'tests/codegen/enable-lto-unit-splitting.rs',
                             'tests/codegen/enum-bounds-check-derived-idx.rs',
+                            'tests/codegen/enum/enum-u128.rs',
+                            'tests/codegen/fn-impl-trait-self.rs',
                             'tests/codegen/force-unwind-tables.rs',
+                            'tests/codegen/inherit_overflow.rs',
+                            'tests/codegen/inherit_overflow.rs',
+                            'tests/codegen/inline-function-args-debug-info.rs',
                             'tests/codegen/intrinsic-no-unnamed-attr.rs',
+                            'tests/codegen/intrinsics/mask.rs',
+                            'tests/codegen/intrinsics/transmute-niched.rs',
                             'tests/codegen/issues/issue-103840.rs',
                             'tests/codegen/issues/issue-47278.rs',
+                            'tests/codegen/issues/issue-73258.rs',
                             'tests/codegen/issues/issue-73827-bounds-check-index-in-subexpr.rs',
+                            'tests/codegen/issues/issue-75546.rs',
+                            'tests/codegen/issues/issue-77812.rs',
+                            'tests/codegen/issues/issue-98156-const-arg-temp-lifetime.rs',
                             'tests/codegen/lifetime_start_end.rs',
+                            'tests/codegen/llvm-ident.rs',
                             'tests/codegen/local-generics-in-exe-internalized.rs',
+                            'tests/codegen/mainsubprogram.rs',
                             'tests/codegen/match-unoptimized.rs',
+                            'tests/codegen/move-operands.rs',
                             'tests/codegen/noalias-rwlockreadguard.rs',
                             'tests/codegen/non-terminate/nonempty-infinite-loop.rs',
                             'tests/codegen/noreturn-uninhabited.rs',
                             'tests/codegen/repr-transparent-aggregates-3.rs',
+                            'tests/codegen/repr/transparent-mips64.rs'
                             'tests/codegen/sse42-implies-crc32.rs',
                             'tests/codegen/thread-local.rs',
                             'tests/codegen/uninit-consts.rs',
+                            'tests/mir-opt/',
                             'tests/pretty/raw-str-nonexpr.rs',
                             'tests/run-make',
+                            'tests/run-make-fulldeps',
                             'tests/run-make/cdylib-fewer-symbols/foo.rs',
                             'tests/run-make/doctests-keep-binaries/t.rs',
-                            'tests/run-make-fulldeps',
                             'tests/run-make/issue-22131/foo.rs',
                             'tests/run-make/issue-36710/Makefile',
                             'tests/run-make/issue-47551',
@@ -119,6 +152,26 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
                             'tests/run-make/sysroot-crates-are-unstable',
                             'tests/run-make/target-specs',
                             'tests/rustdoc',
+                            'tests/rustdoc-js-std',
+                            'tests/rustdoc-json',
+                            'tests/rustdoc-ui/cfg-test.rs',
+                            'tests/rustdoc-ui/check-cfg-test.rs',
+                            'tests/rustdoc-ui/display-output.rs',
+                            'tests/rustdoc-ui/doc-comment-multi-line-attr.rs',
+                            'tests/rustdoc-ui/doc-comment-multi-line-cfg-attr.rs',
+                            'tests/rustdoc-ui/doc-test-doctest-feature.rs',
+                            'tests/rustdoc-ui/doc-test-rustdoc-feature.rs',
+                            'tests/rustdoc-ui/doctest-multiline-crate-attribute.rs',
+                            'tests/rustdoc-ui/doctest-output.rs',
+                            'tests/rustdoc-ui/failed-doctest-compile-fail.rs',
+                            'tests/rustdoc-ui/issue-80992.rs',
+                            'tests/rustdoc-ui/issue-91134.rs',
+                            'tests/rustdoc-ui/no-run-flag.rs',
+                            'tests/rustdoc-ui/nocapture-fail.rs',
+                            'tests/rustdoc-ui/nocapture.rs',
+                            'tests/rustdoc-ui/run-directory.rs',
+                            'tests/rustdoc-ui/test-no_std.rs',
+                            'tests/rustdoc-ui/test-type.rs',
                             'tests/rustdoc/async-move-doctest.rs',
                             'tests/rustdoc/async-trait.rs',
                             'tests/rustdoc/auto-traits.rs',
@@ -133,9 +186,9 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
                             'tests/rustdoc/edition-doctest.rs',
                             'tests/rustdoc/edition-flag.rs',
                             'tests/rustdoc/elided-lifetime.rs',
-                            'tests/rustdoc/external-macro-src.rs',
                             'tests/rustdoc/extern-html-root-url.rs',
                             'tests/rustdoc/extern-impl-trait.rs',
+                            'tests/rustdoc/external-macro-src.rs',
                             'tests/rustdoc/hide-unstable-trait.rs',
                             'tests/rustdoc/inline_cross/add-docs.rs',
                             'tests/rustdoc/inline_cross/default-trait-method.rs',
@@ -184,12 +237,10 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
                             'tests/rustdoc/issue-75588.rs',
                             'tests/rustdoc/issue-85454.rs',
                             'tests/rustdoc/issue-86620.rs',
-                            'tests/rustdoc-json',
-                            'tests/rustdoc-js-std',
                             'tests/rustdoc/macro_pub_in_module.rs',
                             'tests/rustdoc/masked.rs',
-                            'tests/rustdoc/normalize-assoc-item.rs',
                             'tests/rustdoc/no-stack-overflow-25295.rs',
+                            'tests/rustdoc/normalize-assoc-item.rs',
                             'tests/rustdoc/primitive-reexport.rs',
                             'tests/rustdoc/process-termination.rs',
                             'tests/rustdoc/pub-extern-crate.rs',
@@ -204,35 +255,8 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
                             'tests/rustdoc/test_option_check/test.rs',
                             'tests/rustdoc/trait-alias-mention.rs',
                             'tests/rustdoc/trait-visibility.rs',
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
                             'tests/rustdoc/unit-return.rs',
-                            'tests/ui/abi/stack-probes-lto.rs',
-                            'tests/ui/abi/stack-probes.rs',
-                            'tests/ui/array-slice-vec/subslice-patterns-const-eval-match.rs',
-                            'tests/ui/asm/x86_64/sym.rs',
-                            'tests/ui/associated-type-bounds/fn-apit.rs',
-                            'tests/ui/associated-type-bounds/fn-dyn-apit.rs',
-                            'tests/ui/associated-type-bounds/fn-wrap-apit.rs',
-                            'tests/ui/debuginfo/debuginfo-emit-llvm-ir-and-split-debuginfo.rs',
-                            'tests/ui/drop/dynamic-drop.rs',
-                            'tests/ui/empty_global_asm.rs',
+                            'tests/ui-fulldeps/',
                             'tests/ui-fulldeps/deriving-encodable-decodable-box.rs',
                             'tests/ui-fulldeps/deriving-encodable-decodable-cell-refcell.rs',
                             'tests/ui-fulldeps/deriving-global.rs',
@@ -255,9 +279,20 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
                             'tests/ui-fulldeps/regions-mock-tcx.rs',
                             'tests/ui-fulldeps/rustc_encodable_hygiene.rs',
                             'tests/ui-fulldeps/session-diagnostic/enforce_slug_naming.rs',
+                            'tests/ui/abi/stack-probes-lto.rs',
+                            'tests/ui/abi/stack-probes.rs',
+                            'tests/ui/array-slice-vec/subslice-patterns-const-eval-match.rs',
+                            'tests/ui/asm/x86_64/sym.rs',
+                            'tests/ui/associated-type-bounds/fn-apit.rs',
+                            'tests/ui/associated-type-bounds/fn-dyn-apit.rs',
+                            'tests/ui/associated-type-bounds/fn-wrap-apit.rs',
+                            'tests/ui/debuginfo/debuginfo-emit-llvm-ir-and-split-debuginfo.rs',
+                            'tests/ui/drop/dynamic-drop.rs',
+                            'tests/ui/empty_global_asm.rs',
                             'tests/ui/functions-closures/fn-help-with-err.rs',
                             'tests/ui/linkage-attr/issue-10755.rs',
                             'tests/ui/macros/restricted-shadowing-legacy.rs',
+                            'tests/ui/numbers-arithmetic/u128.rs',
                             'tests/ui/process/nofile-limit.rs',
                             'tests/ui/process/process-panic-after-fork.rs',
                             'tests/ui/process/process-sigpipe.rs',
diff --git a/meta/recipes-devtools/rust/files/target_cfg.patch b/meta/recipes-devtools/rust/files/target_cfg.patch
new file mode 100644
index 0000000000..b6a80e004f
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/target_cfg.patch
@@ -0,0 +1,144 @@
+rust: Fix various failures for Rust Oe-selftest
+
+* Ensure cargo executable is fetched
+
+* Fix the incorrect target on stage1 ui-fulldeps tests
+
+* Enable RUSTC_BOOTSTRAP on panic=abort mir-opt test
+
+* Detect user-specified custom targets in compiletest
+
+Upstream-Status: Backport [https://github.com/rust-lang/rust/pull/119619/commits]
+
+Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
+---
+diff --git a/src/bootstrap/bootstrap.py b/src/bootstrap/bootstrap.py
+--- a/src/bootstrap/bootstrap.py
++++ b/src/bootstrap/bootstrap.py
+@@ -954,9 +954,11 @@
+         if deny_warnings:
+             env["RUSTFLAGS"] += " -Dwarnings"
+
+-        env["PATH"] = os.path.join(self.bin_root(), "bin") + \
+-            os.pathsep + env["PATH"]
+-        if not os.path.isfile(self.cargo()):
++        cargo_bin_path = os.path.join(self.bin_root(), "bin", "cargo")
++        if not os.path.isfile(cargo_bin_path):
++            cargo_bin_path = os.getenv("RUST_TARGET_PATH") + "rust-snapshot/bin/cargo"
++            env["PATH"] = os.path.dirname(cargo_bin_path) + os.pathsep + env["PATH"]
++        else:
+             raise Exception("no cargo executable found at `{}`".format(
+                 self.cargo()))
+         args = [self.cargo(), "build", "--manifest-path",
+diff --git a/src/bootstrap/test.rs b/src/bootstrap/test.rs
+--- a/src/bootstrap/test.rs
++++ b/src/bootstrap/test.rs
+@@ -1489,8 +1489,12 @@
+         // NOTE: Only stage 1 is special cased because we need the rustc_private artifacts to match the
+         // running compiler in stage 2 when plugins run.
+         let stage_id = if suite == "ui-fulldeps" && compiler.stage == 1 {
+-            compiler = builder.compiler(compiler.stage - 1, target);
+-            format!("stage{}-{}", compiler.stage + 1, target)
++            // At stage 0 (stage - 1) we are using the beta compiler. Using `self.target` can lead finding
++            // an incorrect compiler path on cross-targets, as the stage 0 beta compiler is always equal
++            // to `build.build` in the configuration.
++            let build = builder.build.build;
++            compiler = builder.compiler(compiler.stage - 1, build);
++            format!("stage{}-{}", compiler.stage + 1, build)
+         } else {
+             format!("stage{}-{}", compiler.stage, target)
+         };
+diff --git a/src/bootstrap/synthetic_targets.rs b/ src/bootstrap/synthetic_targets.rs
+index d2c65b740da..45baf56f46b 100644
+--- a/src/bootstrap/synthetic_targets.rs
++++ b/src/bootstrap/synthetic_targets.rs
+@@ -59,6 +59,7 @@ fn create_synthetic_target(
+     let mut cmd = Command::new(builder.rustc(compiler));
+     cmd.arg("--target").arg(base.rustc_target_arg());
+     cmd.args(["-Zunstable-options", "--print", "target-spec-json"]);
++    cmd.env("RUSTC_BOOTSTRAP", "1");
+     cmd.stdout(Stdio::piped());
+
+     let output = cmd.spawn().unwrap().wait_with_output().unwrap();
+diff --git a/src/tools/compiletest/src/common.rs b/src/tools/compiletest/src/common.rs
+index e85f6319936..c45c0b3c652 100644
+--- a/src/tools/compiletest/src/common.rs
++++ b/src/tools/compiletest/src/common.rs
+@@ -479,6 +479,7 @@ fn new(config: &Config) -> TargetCfgs {
+         let mut targets: HashMap<String, TargetCfg> = serde_json::from_str(&rustc_output(
+             config,
+             &["--print=all-target-specs-json", "-Zunstable-options"],
++            Default::default(),
+         ))
+         .unwrap();
+
+@@ -491,16 +492,33 @@ fn new(config: &Config) -> TargetCfgs {
+         let mut all_families = HashSet::new();
+         let mut all_pointer_widths = HashSet::new();
+
+-        // Handle custom target specs, which are not included in `--print=all-target-specs-json`.
+-        if config.target.ends_with(".json") {
+-            targets.insert(
+-                config.target.clone(),
+-                serde_json::from_str(&rustc_output(
+-                    config,
+-                    &["--print=target-spec-json", "-Zunstable-options", "--target", &config.target],
+-                ))
+-                .unwrap(),
+-            );
++        // If current target is not included in the `--print=all-target-specs-json` output,
++        // we check whether it is a custom target from the user or a synthetic target from bootstrap.
++        if !targets.contains_key(&config.target) {
++            let mut envs: HashMap<String, String> = HashMap::new();
++
++            if let Ok(t) = std::env::var("RUST_TARGET_PATH") {
++                envs.insert("RUST_TARGET_PATH".into(), t);
++            }
++
++            // This returns false only when the target is neither a synthetic target
++            // nor a custom target from the user, indicating it is most likely invalid.
++            if config.target.ends_with(".json") || !envs.is_empty() {
++                targets.insert(
++                    config.target.clone(),
++                    serde_json::from_str(&rustc_output(
++                        config,
++                        &[
++                            "--print=target-spec-json",
++                            "-Zunstable-options",
++                            "--target",
++                            &config.target,
++                        ],
++                        envs,
++                    ))
++                    .unwrap(),
++                );
++            }
+         }
+
+         for (target, cfg) in targets.iter() {
+@@ -545,7 +563,9 @@ fn get_current_target_config(
+         // code below extracts them from `--print=cfg`: make sure to only override fields that can
+         // actually be changed with `-C` flags.
+         for config in
+-            rustc_output(config, &["--print=cfg", "--target", &config.target]).trim().lines()
++            rustc_output(config, &["--print=cfg", "--target", &config.target], Default::default())
++                .trim()
++                .lines()
+         {
+             let (name, value) = config
+                 .split_once("=\"")
+@@ -624,11 +644,12 @@ pub enum Endian {
+     Big,
+ }
+
+-fn rustc_output(config: &Config, args: &[&str]) -> String {
++fn rustc_output(config: &Config, args: &[&str], envs: HashMap<String, String>) -> String {
+     let mut command = Command::new(&config.rustc_path);
+     add_dylib_path(&mut command, iter::once(&config.compile_lib_path));
+     command.args(&config.target_rustcflags).args(args);
+     command.env("RUSTC_BOOTSTRAP", "1");
++    command.envs(envs);
+
+     let output = match command.output() {
+         Ok(output) => output,
+
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index 83a0dbc15f..d9a370ac2f 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -10,6 +10,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0004-musl-Define-O_LARGEFILE-for-riscv32.patch;patchdir=${RUSTSRC} \
             file://0005-musl-Define-SOCK_SEQPACKET-in-common-place.patch;patchdir=${RUSTSRC} \
             file://0001-Revert-Map-source-absolute-paths-to-OUT_DIR-as-relat.patch;patchdir=${RUSTSRC} \
+            file://target_cfg.patch;patchdir=${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] = "b98c09d968529212fb29eec7d6d3e9bdaa869810679b7fb86a1ca69469d75f5e"
 
-- 
2.43.0


