Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 022EAC47258
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 08:10:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.7174.1705997455228963660
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jan 2024 00:10:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=nwTOiJ+Q;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=175275645d=yash.shinde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40MNTRTn020076
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 08:10:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=pQyqUSMsIMhxDugH+k0QEqViK7ygyBwDIMglY9w96R0=; b=
	nwTOiJ+QbeQIRlX8OBmHoPmkSIlmnGV7sM+vgohz9LugrBiEP76RSiSmCDQNqOP/
	0YW0k4mncDWTTCOcqw3FKj6doEd1e+CSI0/+rPMGC4Dpb+GbLpvFdQ+XI749Y0gl
	x6ObHKDuUrt96yG3KD+nsBq8q07wpf3gc+SDRJi2uJyjVLxu+AHXO3Er1Bk5UXwP
	33UtVceCKpMhCdM2G5deUP02V2QX10d8VwXnpmOVWyuBL6xgwVo0j6cI7RjpIu0d
	xEBeS/rsIhsYUNCOA43PmPHMcziSPvDScnWR4NOb0I3n2ylmqbrGbYOX+i7InhyM
	rHjKB0Rao8aG6+8jCrT+dA==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vr3cyk5u2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 08:10:54 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qx3b61CS7o1ZOtf1U00DgHpRcRRmKHdZZV79d+g4JrWrQ5oUUzlyNi0U4oy7PF/oAyPP9vvpnNYbDQTnD1yqBmCz3R7+OTnZo/tT9l9oshIRRXJNzZUbA2XY7ALCAVghEtNAPOcyvKmiWVsi4FWdhX7g/cmsQ4dZ6BjP/2+vhLrIS0ejuE//yHH0BRrWFPxSiJz0NCTuCuQHj49RGCHZJNQGHZRQDKQxIdxdqbXynFn9UNmU7qo1cWPQYqRxDSGMYe0UP0Fb0vq/OxXDaOF5z7HnzVMCnzMiNF1n86zuub90HZlf0s706lM5JxCvm9pEffd8Y9wIRjGiVa5sOIcy5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pQyqUSMsIMhxDugH+k0QEqViK7ygyBwDIMglY9w96R0=;
 b=dxRY4TUCWG3dFiSm1RyuyVG1PjFP8mgQvXNSHj7jCXQVpzhTKtDNX49K6NPaRMMZtFCBrFk37W7sqDz+kwwz2Sw2W9KmNenWK/OZL94RDR+EmM7MiuoalAnwxg08GEeVytyKjZyAeMald8f+OXOHGf8ipGWruAykFlpWBfEDuuhnRJw82/cevhfgBgO2IGrUwyCCRquNkBsH1YCPSGWWpWc2PnQQXpaRavN2EdXTvEXcA7dSVuR9dC218CISIwnL8B5GLFv6nnBmYP3qVeq3xocCz/yazsOB9GNsKWX+w1fxBI85lh0cw3tlRsfWWJsnSCdsPE47n4DxJx/TF7Q4vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by CH3PR11MB8344.namprd11.prod.outlook.com (2603:10b6:610:17f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34; Tue, 23 Jan
 2024 08:10:52 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107%4]) with mapi id 15.20.7202.033; Tue, 23 Jan 2024
 08:10:52 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kallapa@windriver.com,
        Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Yash.Shinde@windriver.com
Subject: [PATCH v3 7/7] rust: Enable rust oe-selftest.
Date: Tue, 23 Jan 2024 00:10:06 -0800
Message-ID: <20240123081006.3310715-7-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240123081006.3310715-1-Yash.Shinde@windriver.com>
References: <20240123081006.3310715-1-Yash.Shinde@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::20) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|CH3PR11MB8344:EE_
X-MS-Office365-Filtering-Correlation-Id: f7e418c7-7cf6-48e6-0de8-08dc1bead0cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XrUsdmwRuTToYSAYwdE0adag1krQ4RpYsjx2TjMwwbXd+II77yoHQUHY9y7rDaQ+sgnqjyqd5vgVOD5wzXlZpJj0doAYuqzgQG/65QIlkjHS9VrQY6B+oonW4smRUf387DrZ47NYpoN7vylwTAbgO2wyvMEa+zsUaYGYyYInBZ3F6cMRbtnICif0irHIYOx916C3tXNY4Gat68Lzz3XZ+dioqXptimc75mqD9wgtm/K84LCRiJlMHxscrEYxcmaqWwuDzDnjERN6XSHWvALtJXJ23FhhOxawYm7/Q3v88rC801ghm9GQGJJY4aCaXjxi7Bg+uO88OH9fDgN/z0awnmUW4NP6Pnrjsc6XGcDZskYUlE0WociAZDCVGKavKSQ9QZcuVh7tnQWctuAhFQbtRJtls1l65eC3nkIxDOoO12xf/+mI6XCHy2M3hAjeoevxPzJxeNqxzLSVEmcmBQuJjOhFsRCip63dT+ecZyMC2hvAf2xy69K+dWgVG0nMTy0tREryKTP1vz3ZREomDlPGb/tRLHnGAYe+8jNgaPwuoYwiCnvM1KxZQ+kUqmt3XzQmQzlr+HjhNVpN0qKo6IxFJShbYJyun5K7lmtPZAvjaDI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39850400004)(396003)(366004)(136003)(376002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(66476007)(316002)(66946007)(66556008)(6916009)(6486002)(9686003)(52116002)(966005)(6512007)(6666004)(6506007)(5660300002)(83380400001)(8676002)(26005)(1076003)(2616005)(8936002)(2906002)(38100700002)(4326008)(478600001)(36756003)(38350700005)(41300700001)(86362001)(107886003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4qNGXInHQwDjMvzfEmESEKY08pccjBRBjfOhWiWjFbCf3UVGkhLZDkkhlkCn?=
 =?us-ascii?Q?5iraT7u8s6512whDgRGYjk5hJDIY0oCjNyJnmxkabgZX8TeTytjlonjNkekD?=
 =?us-ascii?Q?KUjnrB8GQZ3Bt0QcDGvuN1nwLZ9z29j1N+CkPqxEAwQfGwn48WvROJMB1ODR?=
 =?us-ascii?Q?ZTL0+OaKlHBT1csdN5gItT76gG6gweMulTX1KYScEIDOTA7mh+Emb5JrokgI?=
 =?us-ascii?Q?8Hab14l3Mu2UQ5Q0RBmfFuJX3aEQut4sPruOFidaSzNLTnOuSOVhkR3/Z2ho?=
 =?us-ascii?Q?zM760H6MN7IKrQBZnsqz5YyUKq1QklmCrgYT34isMUjFK48v3s0Q59lgJ3Rl?=
 =?us-ascii?Q?oIUM/gjPLHzy4GmeQCqYOzNsx3FXV9yGEEmr0sd1SB0v320U6bMEKlDoRWa1?=
 =?us-ascii?Q?jg/j00YIEgiycjf7SB0YjkWgS4Ah0G7wSpSZQGsC90/mlrAOYONz8tLGEPTu?=
 =?us-ascii?Q?Y0m93ogth82uuA6/VIRebipH5fP8FTIfhaj2RahNbjkh9hBKSgqXg+gdBgKf?=
 =?us-ascii?Q?nzXh1v/SlVYzZGDru+7/MvdyX5ipu2//hUMkO8bVellckh/2D+GCteNtsMt0?=
 =?us-ascii?Q?qtiE8FiT0m1G9nHt2Ov38rYeFRJg/LO3y/ZCVJyW91pu5LzzUTk3HoJb2DZ7?=
 =?us-ascii?Q?qid/EqHItKcBRhLf2Uir+wvjMWrAaVKWHnu6yK7G7qBVXuEvjdamWBP4Ul/2?=
 =?us-ascii?Q?K00VLNZrJuz6ftN0EhUNHcP/Agpn01yrfhG0SwIVd8pKaHhf1DFICA1IIKir?=
 =?us-ascii?Q?81Ckmq5RDffn8t9qdL5GqrrU5qH10p5IiZgb9Yvw8i0wJouIHD0/IQOeTxl4?=
 =?us-ascii?Q?73yNHY0hDEJOS+KnVz2594AzFH1LNJ/Q/YDLAoZGgY6Iojizo64/MENiEmn5?=
 =?us-ascii?Q?MVt0TS4KEpQOZBON6p3RBXdykptt+rqk2M8nBwiLWUX3h8+wwobSwFr2R5AA?=
 =?us-ascii?Q?dEyrhdblMGf8Z4sUZlDJEBLADKbZeQDd0ZgddDypC9tJfZu3uegWzigcQIQW?=
 =?us-ascii?Q?jaFUhaz2HO3NS16NLTeykQ1UI8QUSXiWiyywSpxCrm4VFbb3MgGsQ+4aJuL2?=
 =?us-ascii?Q?ecYo6Iy3QfBZ7kRkqX7brq6zaLSNRgGBoSWh0qRyvtdrmurPAB5OaEJ2ba45?=
 =?us-ascii?Q?tQW8PE2FX8eMjhO+7HsurxdVJoagykbe3AuUODeUTYwq5PRocslFnoBurycV?=
 =?us-ascii?Q?UWS4olLKfAXpro2/Q+y+I1ovXflvmpyd4/0RnA2ZtH6kTepn5VwNhYtGnqYI?=
 =?us-ascii?Q?BmqYzVkSOMbBoo0dzS1mbUjnl1oZW+AQlKdkUwJduUAtpkelkDgJoQF0iYm8?=
 =?us-ascii?Q?XR/aE/y7CF3ghuxQNNHg1YGzxffrdSE+JnqyWvorn5ZZxes7a6P+cIXMPfpf?=
 =?us-ascii?Q?y/8br+F3nPzLxdWXS3c5IwXu0YFLgHq+lHthCnVvbt838nrKcQww0sz1N82d?=
 =?us-ascii?Q?zCLf1IdQ/3qy9B+6g2loHpC3XdNn686JMHa++l+Lfl6cKNxkDlkWzp5wEy5m?=
 =?us-ascii?Q?+SRs7AkHx66DlzWCw5UajU63rU1W8QANESiPjMIxKxcHROrPCz2bJ6vcZoSj?=
 =?us-ascii?Q?+stYMG3vDi6BDemDoLQQk00Mys3DfNdWC90GVTIIV7bDmPbtceq+ch7Nig9S?=
 =?us-ascii?Q?IA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7e418c7-7cf6-48e6-0de8-08dc1bead0cf
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 08:10:52.0487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pxslCs3SVo4/O7lqCreT3B5B6XN3J+CYsDsy2D9DasP93NkWnh0oyvE9M2cEn3kn/6xC4cziIX+s7fQv+cbf2u9ejXas0nMy1hrE5qalF24=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8344
X-Proofpoint-GUID: 2zyob05DLpIGq4_TMqwX8PivyIqQeXhS
X-Proofpoint-ORIG-GUID: 2zyob05DLpIGq4_TMqwX8PivyIqQeXhS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-23_02,2024-01-23_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 spamscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=999 priorityscore=1501 mlxscore=0 clxscore=1015 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401230058
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 08:10:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194212

From: Yash Shinde <Yash.Shinde@windriver.com>

* Enable rust oe-selftest and sort the overall added test cases.

* Include the dependent patches for rust oe-selftest in
  meta/recipes-devtools/rust/rust-source.inc

* Disable rust oe-selftest for mips32 target (Rust upstream has classified it into tier 3 target,
  for which the Rust project does not build or test automatically) as it is unstable with rust tests.
  https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-3

* The testing is done on arm32, arm64, mips64, x86 and  x86_64 targets.

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 meta/lib/oeqa/selftest/cases/rust.py       | 88 ++++++++++++----------
 meta/recipes-devtools/rust/rust-source.inc |  4 +
 2 files changed, 51 insertions(+), 41 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
index 0ec2e422f9..cf35fdbb29 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -40,7 +40,12 @@ def parse_results(filename):
 class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
     def test_rust(self, *args, **kwargs):
         # Disable Rust Oe-selftest
-        self.skipTest("The Rust Oe-selftest is disabled.")
+        #self.skipTest("The Rust Oe-selftest is disabled.")
+
+        # Skip mips32 target since it is unable with rust tests
+        machine = get_bb_var('MACHINE')
+        if machine == "qemumips":
+            self.skipTest("The mips32 target is skipped for Rust Oe-selftest.")
 
         # build remote-test-server before image build
         recipe = "rust"
@@ -73,56 +78,91 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
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
+                            'tests/codegen/repr/transparent-mips64.rs',
                             'tests/codegen/sse42-implies-crc32.rs',
                             'tests/codegen/thread-local.rs',
                             'tests/codegen/uninit-consts.rs',
+                            'tests/mir-opt/',
                             'tests/pretty/raw-str-nonexpr.rs',
-                            'tests/run-make',
                             'tests/run-make-fulldeps',
+                            'tests/run-make',
                             'tests/rustdoc',
+                            'tests/rustdoc-js-std',
+                            'tests/rustdoc-json',
                             'tests/rustdoc-ui/cfg-test.rs',
                             'tests/rustdoc-ui/check-cfg-test.rs',
                             'tests/rustdoc-ui/display-output.rs',
                             'tests/rustdoc-ui/doc-comment-multi-line-attr.rs',
                             'tests/rustdoc-ui/doc-comment-multi-line-cfg-attr.rs',
                             'tests/rustdoc-ui/doc-test-doctest-feature.rs',
+                            'tests/rustdoc-ui/doc-test-rustdoc-feature.rs',
                             'tests/rustdoc-ui/doctest-multiline-crate-attribute.rs',
                             'tests/rustdoc-ui/doctest-output.rs',
-                            'tests/rustdoc-ui/doc-test-rustdoc-feature.rs',
                             'tests/rustdoc-ui/failed-doctest-compile-fail.rs',
                             'tests/rustdoc-ui/issue-80992.rs',
                             'tests/rustdoc-ui/issue-91134.rs',
+                            'tests/rustdoc-ui/no-run-flag.rs',
                             'tests/rustdoc-ui/nocapture-fail.rs',
                             'tests/rustdoc-ui/nocapture.rs',
-                            'tests/rustdoc-ui/no-run-flag.rs',
                             'tests/rustdoc-ui/run-directory.rs',
                             'tests/rustdoc-ui/test-no_std.rs',
                             'tests/rustdoc-ui/test-type.rs',
-                            'tests/rustdoc/unit-return.rs',
+                            'tests/ui-fulldeps/',
                             'tests/ui/abi/stack-probes-lto.rs',
                             'tests/ui/abi/stack-probes.rs',
                             'tests/ui/array-slice-vec/subslice-patterns-const-eval-match.rs',
@@ -136,46 +176,12 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
                             'tests/ui/functions-closures/fn-help-with-err.rs',
                             'tests/ui/linkage-attr/issue-10755.rs',
                             'tests/ui/macros/restricted-shadowing-legacy.rs',
+                            'tests/ui/numbers-arithmetic/u128.rs',
                             'tests/ui/process/nofile-limit.rs',
                             'tests/ui/process/process-panic-after-fork.rs',
                             'tests/ui/process/process-sigpipe.rs',
                             'tests/ui/simd/target-feature-mixup.rs',
-                            'tests/ui/structs-enums/multiple-reprs.rs',
-                            'tests/mir-opt/',
-                            'tests/codegen/abi-sysv64.rs',
-                            'tests/codegen/call-metadata.rs',
-                            'tests/codegen/async-fn-debug-awaitee-field.rs',
-                            'tests/codegen/issues/issue-77812.rs',
-                            'tests/codegen/debug-column.rs',
-                            'tests/codegen/inline-function-args-debug-info.rs',
-                            'tests/codegen/binary-search-index-no-bound-check.rs',
-                            'tests/codegen/fn-impl-trait-self.rs',
-                            'tests/codegen/enum/enum-u128.rs',
-                            'tests/codegen/abi-efiapi.rs',
-                            'tests/codegen/issues/issue-73258.rs',
-                            'tests/codegen/llvm-ident.rs',
-                            'tests/codegen/drop.rs',
-                            'tests/codegen/intrinsics/transmute-niched.rs',
-                            'tests/codegen/issues/issue-75546.rs',
-                            'tests/codegen/debuginfo-generic-closure-env-names.rs',
-                            'tests/codegen/inherit_overflow.rs',
-                            'tests/codegen/asm-powerpc-clobbers.rs',
-                            'tests/codegen/align-byval.rs',
-                            'tests/codegen/inherit_overflow.rs',
-                            'tests/codegen/dst-vtable-align-nonzero.rs',
-                            'tests/codegen/move-operands.rs',
-                            'tests/codegen/align-fn.rs',
-                            'tests/codegen/abi-efiapi.rs',
-                            'tests/codegen/issues/issue-98156-const-arg-temp-lifetime.rs',
-                            'tests/codegen/debug-limited.rs',
-                            'tests/codegen/mainsubprogram.rs',
-                            'tests/codegen/enable-lto-unit-splitting.rs',
-                            'tests/codegen/intrinsics/mask.rs',
-                            'tests/ui-fulldeps/',
-                            'src/tools/replace-version-placeholder',
-                            'src/tools/jsondoclint',
-                            'tests/ui/numbers-arithmetic/u128.rs',
-                            'tests/codegen/repr/transparent-mips64.rs'
+                            'tests/ui/structs-enums/multiple-reprs.rs'
                         ]
 
         exclude_fail_tests = " ".join([" --exclude " + item for item in exclude_list])
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index 83a0dbc15f..e02829e6b3 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -10,6 +10,10 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0004-musl-Define-O_LARGEFILE-for-riscv32.patch;patchdir=${RUSTSRC} \
             file://0005-musl-Define-SOCK_SEQPACKET-in-common-place.patch;patchdir=${RUSTSRC} \
             file://0001-Revert-Map-source-absolute-paths-to-OUT_DIR-as-relat.patch;patchdir=${RUSTSRC} \
+            file://cargo-path.patch;patchdir=${RUSTSRC} \
+            file://custom-target-cfg.patch;patchdir=${RUSTSRC} \
+            file://rustc-bootstrap.patch;patchdir=${RUSTSRC} \
+            file://target-build-value.patch;patchdir=${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] = "b98c09d968529212fb29eec7d6d3e9bdaa869810679b7fb86a1ca69469d75f5e"
 
-- 
2.43.0


