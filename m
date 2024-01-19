Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71D64C47DAF
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 13:45:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.22335.1705671911271644646
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jan 2024 05:45:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Uce46g3t;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=174893ae64=yash.shinde@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40JDB7AH020871
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 05:45:11 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=LAPD3HRSW0UiBDXV+6NgLAdJ95RX3ckqzIN/raCfbsM=; b=
	Uce46g3tLcsvNEp6cDAfxB6tJZt3klJ/vrj01diAdQHqNAfkkPooaNTnh/XceIUf
	OrfgByIVUM1kRi9kL2QEMjhqc71mTDaJtIT54yd3G8neOO2/CSaXaFoyk3159UZT
	8JlGeLsi4VXc1DB41ugLyyt9Pt1CVAuEJS3bjx6+pGgCqW5J17fEk78CFjdvAyhN
	xS+x3mr3MVB/IULWW7ZJ/JMrWCdQK8AHdgK+s5f+O+w7LYD706L48ViQHVBSFaht
	8TIQCCZIeiuGwdYKJk+wRWKxBbnshCQJ9hmublEpD/7lfSKtraRNqvKdUJ/7vm9S
	ZKna6XlxjT3fXbmzu5/5pw==
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vkpp46tj4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 05:45:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Brpn7Zo5dGm5BRuAijLmF0lQ9CQ9Evgv2PnzVUTCn/bYi8/CwvhiGLps9dk/qFo0Sw5AxhvyaWczrRAtWSUcPG6l8U2HZes4FPwD2I3tRmPjRjYaV+7VW7/KiUOnGlhM5qyhmEAvV4V0Q0CaT9AlvHDgDZPGnoWLDau2aoUfUnXoLVm67W7Bh8OYd34Qw9QQEb72FGnx2RCSeVGI91Yx7FaiuV2zzyKhAh1EqoigYsTUQwwHQmUnljj0zg5fxKF/SC41al801IX0wa3bUjwibvJ13dhBDZDiS2lMDIa9zeG4DT1ayGIKXCfMeYJ7VerBLT2DXmbokJHXma5SdpDv2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LAPD3HRSW0UiBDXV+6NgLAdJ95RX3ckqzIN/raCfbsM=;
 b=cj3YzjTmnuMNxtfOSAb5zY6eCi7avcUzjMaQCw2KaAE5MWlXAo1XbXq+8pZMZRbEJa3BseFev7oxbfJhjOQy14Tes6mmuoRcRHntTh82OFYnss1cywp+k2ea3UeMh0TwFEdVdgil8L/j13alwJ+3EdFI7beJ1q3YucB7/o4iVXnx836jH3YBKGEjfCqotJ602W5rxhJVSLApB27y7gj81kjBq3UJkMWlxMCTm8vOIARoN0MsFQUoGeV+99V8zogpGZ6KpBE8aIzk2dnmP4fpglNTZCuJpkbfiqFSCyNXv7muBwkBmvCWMIW4l3wIvTAu6EKm3toEn3VtyJ0Smrko0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by SA1PR11MB8279.namprd11.prod.outlook.com (2603:10b6:806:25c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Fri, 19 Jan
 2024 13:45:07 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107%4]) with mapi id 15.20.7202.024; Fri, 19 Jan 2024
 13:45:07 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kallapa@windriver.com,
        Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Yash.Shinde@windriver.com
Subject: [PATCH 5/5] Rust oe-selftest enabled.
Date: Fri, 19 Jan 2024 05:43:52 -0800
Message-ID: <20240119134352.3163178-5-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240119134352.3163178-1-Yash.Shinde@windriver.com>
References: <20240119134352.3163178-1-Yash.Shinde@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CYZPR14CA0008.namprd14.prod.outlook.com
 (2603:10b6:930:8f::26) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|SA1PR11MB8279:EE_
X-MS-Office365-Filtering-Correlation-Id: e1078db5-edbb-4d15-208a-08dc18f4d920
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	u6hEzglvm1xkPWSb11fiZ2Kdz2bq9Q4aTxjzasP/5adCIC58Ml14nwK5l5jncV6oUo42A3M0iPpHpBVHja3FTXQVvbk0E4GAJPxGqFNYbAeNuBQpqT37Oxix/lqfvoRQ8kIkVI67BC8ruOHubPRj7cPG/HT2j4qQ/mg0EEoCXIOrm+dA3wOTVK7xZIyJMDNIx65d2sXG24jhwbGePy76inYY1kIfPtByr8Co2bVPlJDUPO4FN69bXNuhz5meJyl9rncxQvZ2oKUO0nKEJcsj8Fw+Yl7bY7w7xVUz9R45AKRVak9nuoxORaIGWTbSUpzGRaBiwSbOVFBOSpW4DT3DLNYLFsG/ZtcfjdQljI0Xj3SNS1inL5+9ux9WtHLW3ObXJY9itLEE+BZfRugynb8aXKnG4EY7L3lmymC6LDDPDMnEKyAAoa7ZH+nSWcMyRffWAFaj310A4D2DuDeJvysALVstDxYhhGrCcT12xX3c8WjpnElVm9pwvpWy+/r2FlD6501Yvh5SGdZor2TDm8D8e8STLCfbX/Xt00uKY1/2UZqMObYPLLc7eO6K5+U89hBnH8AOKHbB83tI1LlogCMYlboBC8QAyT8EiO/wYDFwLRUNdUbo/y1iWrrcZPZe6ARNIViV8+9prXMCqZAP2z0eog==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(136003)(366004)(346002)(376002)(396003)(230173577357003)(230273577357003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(38100700002)(66476007)(66946007)(66556008)(6506007)(6486002)(30864003)(316002)(6916009)(83380400001)(1076003)(2906002)(478600001)(26005)(8936002)(4326008)(86362001)(52116002)(6512007)(5660300002)(9686003)(107886003)(8676002)(2616005)(6666004)(41300700001)(36756003)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GNC0gI/vXpibsp1QgfGgnIvsdLLvDY67aIjB0RhOehmdyWeadhWTIMaxSuFN?=
 =?us-ascii?Q?mUbb2F7yxhR4+P1dxQK8ES2miejzRNs7cgZ3QAeEgCohfMrj3w6oYC79HYDy?=
 =?us-ascii?Q?eesOeiB+Sd+YMaIkOQh+ZGhE62srkz7XcMSNlJXGXoDAlmOKEIUiu2gngYJo?=
 =?us-ascii?Q?sADdFn/B9XXrKopxVh4uSwVB3PSdwUS+ApMaG6kx0kQgyLyEyVaplNLS2FRA?=
 =?us-ascii?Q?n7b7oiqGn7HDvClloPxKfWN1WCzSLJ8btzXlFgQtWiLrH/HwbXBilzt/I1oa?=
 =?us-ascii?Q?8Ivz6ThEA9imxkhvZ/GHIUI8O4LZ9C6T61X9mxXb+WkUKnNJn6XYRreTJ57O?=
 =?us-ascii?Q?zyou3ixvIJ6uqdYBgYKXwnmbmHX1jcH3cLRVuYNUjiI2O4EVD0L1B7v0lZzs?=
 =?us-ascii?Q?AtEo9IKm1KatIdBXfEWS3KrB7BGE9/sBtid9foU9ynbtXAgHcZnpjfNWjwER?=
 =?us-ascii?Q?lgTV4fkbBOvy20DmKQDWKP9kHwgHMNa9fKEA4waj4X7J0ixcSrT47GZ0P+OY?=
 =?us-ascii?Q?/UFi+zJf27YtZOXX/MOUnlzzpY4kg/MOnYIwGDEk3daKU0ig2n0KL+2hGr3p?=
 =?us-ascii?Q?oNXx+RMX4k84L0oOWykLvEGiN/uFWTAPgEYhy6SzL84AoY57It945HAT9Yey?=
 =?us-ascii?Q?p5Z/k/sztubNA2Pl2XqrDOBB62xO7dwJUBHTmftRtSdyj5KzP3av+qNCmaTa?=
 =?us-ascii?Q?L20vVAAYxfoEJVs5vZN3au8PyuIlflOdX/e+QtUfwDjo4MqU3bgprQvW4BhC?=
 =?us-ascii?Q?G3WLirZCkKdnBLQcpV94pqJDa9zYNaQT81GzJAhV8HUrQwi/cafqlXhdsjDA?=
 =?us-ascii?Q?AZvkhVA6KSHigfG4D2aLDGVKZRU7dSiuLlCxYAakoN6AIPJgPQ6IXr3Q0e91?=
 =?us-ascii?Q?ChihD48iXAyF7bYlXDYmg/OoFlcbfRgKq4LbN2tT1lw69z1MxbYejiU9zP0P?=
 =?us-ascii?Q?8Fn42L6tvr3EmhTR+6qnXjvi7SlftLg36NHywDuboMS3ByHS3a4teceh2T6Z?=
 =?us-ascii?Q?/z389yM3HrDhix1yRAqx0wQEjMDc1/PFJtLmzomsLIrx6yVEKU+pZs7WMl2e?=
 =?us-ascii?Q?/YIJ8BaTsNoq6J5FHxKUJZlr1CrAzCCWlccQg88ZskbmPrZm+h7CE+zqSBhz?=
 =?us-ascii?Q?8kOGauAQtoDPDeXYc3ZUN3qERjhr4jUOh9d0wKI8ilKnKIvCbytyjVNE3EhK?=
 =?us-ascii?Q?NTi+WUFCTJ56XBHK9ev40WhhetbcemoaprfGV8Ofm7UcdxRozDHkp+/5tZOg?=
 =?us-ascii?Q?elkg2E3sOHPQ3LlAE1RLBJi4mLOIkE8/z3hHILFl9QQfgzIH98VzVNuTE2Y9?=
 =?us-ascii?Q?VlRHhGLEDdc3TWoSocLvXeVU/4j4ywJmZlNBGSWBZ+UQqA5N/FoB1ZdT7t9W?=
 =?us-ascii?Q?BMaMZ4k6gq0V02c+YgrTugmHH+yuop2JHh661OW/SjoxIUO47CmlSUVUzYBj?=
 =?us-ascii?Q?YYyMoERRcnDr6YgQPWYcJyJPEgw8QLZXa3PO64lOw7BS1ruFLtl3BAt9XQIz?=
 =?us-ascii?Q?BpYeDa8FxGQpanl+x87+HBa5Va43HGznjwoXoL8LNa2nWuI7sj1L89MNDRr4?=
 =?us-ascii?Q?/K7klPkDU6p4IkjNMjTkRMjhhc/ZWRD/VeKVEXLtXbEahXLaMKNH04XVdmuf?=
 =?us-ascii?Q?Wg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1078db5-edbb-4d15-208a-08dc18f4d920
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 13:45:07.5488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LY8i1vWqSAwRc1OBuMB3/k3qAWKHonH1Ns+wqVGWSKIGFP9VcIolANpeI7nWR0c+QE+M5EERdzuoKpEe7U7rvRKhEJ01mrS9Y+2haTH3U+4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8279
X-Proofpoint-GUID: ue4KBD97bjOeRqp6bH4e0zllZntR6V8S
X-Proofpoint-ORIG-GUID: ue4KBD97bjOeRqp6bH4e0zllZntR6V8S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-19_08,2024-01-19_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 phishscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401190072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 13:45:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194049

From: Yash Shinde <Yash.Shinde@windriver.com>

Tests which are failing from below modules are added to exclude list
	tests/run-make
	tests/rustdoc
	tests/mir-opt
	tests/ui-fulldeps

* Redundent test cases whose parent dir is also present in  exclud list are removed.

* Newly addded tests are sorted and updated.

* Overall exclude tests count in exclude list is now reduced to 114.

* The testing is done on arm32, arm64, mips64, x86 and  x86_64 targets.

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 meta/lib/oeqa/selftest/cases/rust.py       | 165 +++++----------------
 meta/recipes-devtools/rust/rust-source.inc |   4 +
 2 files changed, 43 insertions(+), 126 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
index 6dbc517006..7d0efb1b01 100644
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
@@ -73,156 +73,90 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
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
                             'tests/run-make',
-                            'tests/run-make/cdylib-fewer-symbols/foo.rs',
-                            'tests/run-make/doctests-keep-binaries/t.rs',
-                            'tests/run-make-fulldeps',
-                            'tests/run-make/issue-22131/foo.rs',
-                            'tests/run-make/issue-36710/Makefile',
-                            'tests/run-make/issue-47551',
-                            'tests/run-make/pgo-branch-weights',
-                            'tests/run-make/pgo-gen',
-                            'tests/run-make/pgo-gen-lto',
-                            'tests/run-make/pgo-indirect-call-promotion',
-                            'tests/run-make/pgo-use',
-                            'tests/run-make/pointer-auth-link-with-c/Makefile',
-                            'tests/run-make/profile',
-                            'tests/run-make/static-pie',
-                            'tests/run-make/sysroot-crates-are-unstable',
-                            'tests/run-make/target-specs',
                             'tests/rustdoc',
-                            'tests/rustdoc/async-move-doctest.rs',
-                            'tests/rustdoc/async-trait.rs',
-                            'tests/rustdoc/auto-traits.rs',
-                            'tests/rustdoc/check-source-code-urls-to-def.rs',
-                            'tests/rustdoc/comment-in-doctest.rs',
-                            'tests/rustdoc/const-generics/const-generics-docs.rs',
-                            'tests/rustdoc/cross-crate-hidden-assoc-trait-items.rs',
-                            'tests/rustdoc/cross-crate-hidden-impl-parameter.rs',
-                            'tests/rustdoc/cross-crate-links.rs',
-                            'tests/rustdoc/cross-crate-primitive-doc.rs',
-                            'tests/rustdoc/doctest-manual-crate-name.rs',
-                            'tests/rustdoc/edition-doctest.rs',
-                            'tests/rustdoc/edition-flag.rs',
-                            'tests/rustdoc/elided-lifetime.rs',
-                            'tests/rustdoc/external-macro-src.rs',
-                            'tests/rustdoc/extern-html-root-url.rs',
-                            'tests/rustdoc/extern-impl-trait.rs',
-                            'tests/rustdoc/hide-unstable-trait.rs',
-                            'tests/rustdoc/inline_cross/add-docs.rs',
-                            'tests/rustdoc/inline_cross/default-trait-method.rs',
-                            'tests/rustdoc/inline_cross/dyn_trait.rs',
-                            'tests/rustdoc/inline_cross/impl_trait.rs',
-                            'tests/rustdoc/inline_cross/issue-24183.rs',
-                            'tests/rustdoc/inline_cross/macros.rs',
-                            'tests/rustdoc/inline_cross/trait-vis.rs',
-                            'tests/rustdoc/inline_cross/use_crate.rs',
-                            'tests/rustdoc/intra-doc-crate/self.rs',
-                            'tests/rustdoc/intra-doc/cross-crate/additional_doc.rs',
-                            'tests/rustdoc/intra-doc/cross-crate/basic.rs',
-                            'tests/rustdoc/intra-doc/cross-crate/crate.rs',
-                            'tests/rustdoc/intra-doc/cross-crate/hidden.rs',
-                            'tests/rustdoc/intra-doc/cross-crate/macro.rs',
-                            'tests/rustdoc/intra-doc/cross-crate/module.rs',
-                            'tests/rustdoc/intra-doc/cross-crate/submodule-inner.rs',
-                            'tests/rustdoc/intra-doc/cross-crate/submodule-outer.rs',
-                            'tests/rustdoc/intra-doc/cross-crate/traits.rs',
-                            'tests/rustdoc/intra-doc/extern-builtin-type-impl.rs',
-                            'tests/rustdoc/intra-doc/extern-crate-only-used-in-link.rs',
-                            'tests/rustdoc/intra-doc/extern-crate.rs',
-                            'tests/rustdoc/intra-doc/extern-inherent-impl.rs',
-                            'tests/rustdoc/intra-doc/extern-reference-link.rs',
-                            'tests/rustdoc/intra-doc/issue-103463.rs',
-                            'tests/rustdoc/intra-doc/issue-104145.rs',
-                            'tests/rustdoc/intra-doc/issue-66159.rs',
-                            'tests/rustdoc/intra-doc/pub-use.rs',
-                            'tests/rustdoc/intra-doc/reexport-additional-docs.rs',
-                            'tests/rustdoc/issue-18199.rs',
-                            'tests/rustdoc/issue-23106.rs',
-                            'tests/rustdoc/issue-23744.rs',
-                            'tests/rustdoc/issue-25944.rs',
-                            'tests/rustdoc/issue-30252.rs',
-                            'tests/rustdoc/issue-38129.rs',
-                            'tests/rustdoc/issue-40936.rs',
-                            'tests/rustdoc/issue-43153.rs',
-                            'tests/rustdoc/issue-46727.rs',
-                            'tests/rustdoc/issue-48377.rs',
-                            'tests/rustdoc/issue-48414.rs',
-                            'tests/rustdoc/issue-53689.rs',
-                            'tests/rustdoc/issue-54478-demo-allocator.rs',
-                            'tests/rustdoc/issue-57180.rs',
-                            'tests/rustdoc/issue-61592.rs',
-                            'tests/rustdoc/issue-73061-cross-crate-opaque-assoc-type.rs',
-                            'tests/rustdoc/issue-75588.rs',
-                            'tests/rustdoc/issue-85454.rs',
-                            'tests/rustdoc/issue-86620.rs',
-                            'tests/rustdoc-json',
                             'tests/rustdoc-js-std',
-                            'tests/rustdoc/macro_pub_in_module.rs',
-                            'tests/rustdoc/masked.rs',
-                            'tests/rustdoc/normalize-assoc-item.rs',
-                            'tests/rustdoc/no-stack-overflow-25295.rs',
-                            'tests/rustdoc/primitive-reexport.rs',
-                            'tests/rustdoc/process-termination.rs',
-                            'tests/rustdoc/pub-extern-crate.rs',
-                            'tests/rustdoc/pub-use-extern-macros.rs',
-                            'tests/rustdoc/reexport-check.rs',
-                            'tests/rustdoc/reexport-dep-foreign-fn.rs',
-                            'tests/rustdoc/reexport-doc.rs',
-                            'tests/rustdoc/reexports-priv.rs',
-                            'tests/rustdoc/reexports.rs',
-                            'tests/rustdoc/rustc,-incoherent-impls.rs',
-                            'tests/rustdoc/test_option_check/bar.rs',
-                            'tests/rustdoc/test_option_check/test.rs',
-                            'tests/rustdoc/trait-alias-mention.rs',
-                            'tests/rustdoc/trait-visibility.rs',
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
@@ -233,31 +167,10 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
                             'tests/ui/debuginfo/debuginfo-emit-llvm-ir-and-split-debuginfo.rs',
                             'tests/ui/drop/dynamic-drop.rs',
                             'tests/ui/empty_global_asm.rs',
-                            'tests/ui-fulldeps/deriving-encodable-decodable-box.rs',
-                            'tests/ui-fulldeps/deriving-encodable-decodable-cell-refcell.rs',
-                            'tests/ui-fulldeps/deriving-global.rs',
-                            'tests/ui-fulldeps/deriving-hygiene.rs',
-                            'tests/ui-fulldeps/dropck_tarena_sound_drop.rs',
-                            'tests/ui-fulldeps/empty-struct-braces-derive.rs',
-                            'tests/ui-fulldeps/internal-lints/bad_opt_access.rs',
-                            'tests/ui-fulldeps/internal-lints/bad_opt_access.stderr',
-                            'tests/ui-fulldeps/internal-lints/default_hash_types.rs',
-                            'tests/ui-fulldeps/internal-lints/diagnostics.rs',
-                            'tests/ui-fulldeps/internal-lints/lint_pass_impl_without_macro.rs',
-                            'tests/ui-fulldeps/internal-lints/qualified_ty_ty_ctxt.rs',
-                            'tests/ui-fulldeps/internal-lints/query_stability.rs',
-                            'tests/ui-fulldeps/internal-lints/rustc_pass_by_value.rs',
-                            'tests/ui-fulldeps/internal-lints/ty_tykind_usage.rs',
-                            'tests/ui-fulldeps/issue-14021.rs',
-                            'tests/ui-fulldeps/lint-group-denied-lint-allowed.rs',
-                            'tests/ui-fulldeps/lint-group-forbid-always-trumps-cli.rs',
-                            'tests/ui-fulldeps/lint-pass-macros.rs',
-                            'tests/ui-fulldeps/regions-mock-tcx.rs',
-                            'tests/ui-fulldeps/rustc_encodable_hygiene.rs',
-                            'tests/ui-fulldeps/session-diagnostic/enforce_slug_naming.rs',
                             'tests/ui/functions-closures/fn-help-with-err.rs',
                             'tests/ui/linkage-attr/issue-10755.rs',
                             'tests/ui/macros/restricted-shadowing-legacy.rs',
+                            'tests/ui/numbers-arithmetic/u128.rs',
                             'tests/ui/process/nofile-limit.rs',
                             'tests/ui/process/process-panic-after-fork.rs',
                             'tests/ui/process/process-sigpipe.rs',
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


