Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F635C48286
	for <webhook@archiver.kernel.org>; Thu, 25 Jan 2024 13:17:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.17220.1706188629001604003
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jan 2024 05:17:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=gbl7zDL/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=17541b5c6f=yash.shinde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40P9HLqI004362
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 13:17:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=Ltk4VJq14wjU13lefkbjn33CMsLv/Xu76dbpbd2Ckrw=; b=
	gbl7zDL/+YrEtmMHu/KuAq+udiftkK1p7TJXzyPfFtQ5W+WYpl7MvALm8gN+YxaQ
	/x/rhTwM8So5xpBA90T6wdRYZK7yLO182/JgpOeo64L2IrJM1cV3k9zw57LRAGZy
	r09zf4ErPti267ElX4+kn81IlCeSGR5kYWtgw0KCJy2mGbzISJ+x0YjWyAMc6fFr
	YaxqtKgOz9k+DOk0g46jxKSIh6Yhc4pmWfNmGe23ie0Sv9aJOgssAsGJCEh1G7Rm
	f9bxu9dqKFfTHBTG1cspBc/n5tezbXzUDKdUX7DsGkUKLyE05b2GX5xKZbI8aHih
	vth0Np37Ho39fXNyZAybKA==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vucv20hmn-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 13:17:07 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QY1/QNxBmkI0qEf8+Pd6KA1qVR5dfEybvOOpWFlHhyu/mmKOcKOWOb1kKk1DdVfRUEsKpucprmiHmHdLqAuflyAgOkHiOXeN8OCBi7kcK8Qruqgr1fTDTytljynYGdpDwKmFbVWkI/tLeTrrYmE5c/fU/UxonJSpIetBrSOqG9Gq3th/edW95KF47/q+hrAW6RtPpabHFKY5UU0y5Y4R+wdAOOyt84+8sO0amXa9gFVPqvhXWQ+3/HEqkvgvqmn8jkHDAMYMDKq5f4pfRXm9QZJ1i1CVAA2yIfY33NQAGYbtHtAPPHT16fZf5oTakbmReG8CsmrXkY4Hpzg0vBbffg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ltk4VJq14wjU13lefkbjn33CMsLv/Xu76dbpbd2Ckrw=;
 b=d/zhom9h+cWTHOqTBpoSn4TgnFruHq8vE7PLheRikjQaUC+uSfQkGhZ9h6xIbAHotWtdUgvp4YSO1LBXKA7vzusrNvCuZN9ifBoEbE7j7AnSpw8RjH3G2NQ5wAUVa0OziPYhVQLoyvE+EXyZlodFHQNYxgo7gZtNdF1BsEITy9Wo0vfmMa73uXKZzsUvaIZUtTdS39u12xEfC66HPrGauj0TO7xeQFNO9vuVAv7Wo2XjI7Cl5hMegUkQ4l1p5zBDEe3BiHnKXjuxruEbxjyNtqQR5gXRXNBy37/TZXbJg3ZPoBK8auW8fXkzTQ/mj2ExjfPLiLYcVtgvCrb3OOWf9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by CH0PR11MB5689.namprd11.prod.outlook.com (2603:10b6:610:ec::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Thu, 25 Jan
 2024 13:17:06 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107%4]) with mapi id 15.20.7228.022; Thu, 25 Jan 2024
 13:17:06 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kallapa@windriver.com,
        Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Yash.Shinde@windriver.com
Subject: [PATCH v4 5/7] rust: Add new tests in the exclude list for rust oe-selftest
Date: Thu, 25 Jan 2024 05:16:01 -0800
Message-ID: <20240125131603.2769496-5-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240125131603.2769496-1-Yash.Shinde@windriver.com>
References: <20240125131603.2769496-1-Yash.Shinde@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0048.namprd07.prod.outlook.com
 (2603:10b6:a03:60::25) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|CH0PR11MB5689:EE_
X-MS-Office365-Filtering-Correlation-Id: 254c7c74-d813-4973-d3da-08dc1da7ed7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	02Vifqc+zsmw4mj9eE6eyOCrzDl9vD3o1DdTy55AlQfZIHLGLjCzJX7a3IXPcCQksGRjks21mEjLdFEP+I7BeX6BZUJWvzUJpwTGpzpHyp5pBFx4LUleknTeW3/D7ZLsxNUlWUmFTq0b9xRffdx05OJtKIazZ2mgg5ghxNjvNjo42FESD7uQZrLtd1fkS2S2fwN2FiQEd2RnvAP4ftGoKb/UfAn++m001XFGNvWQLKbgLEo1LWG4ofjVeUKir5XndOY2wCcRbPJjGJv1Y1/44QZ2lquZhglZbER6ZL6O9b1pxWq+51A53qEYhCAp6tyrZiC2Ckxquwd6Gv++yhrtJnbI1l3nK3RnZh8oshcRbAdOq3G9K85d55n0DpGLyF8havUyQk/7DH+rOYi6JPy4D+3ckFDl8vIPvp1691JFHT7QJjlxcHhj4QxCZHLF0gOpRHRiNDaXG8ZmAZgjw3Ke1g4at+uBWCxNHwPyPjsf9J/+QAWPQzjobV+yQHGvr3AoJYWgbFe24oLEy8CgMg8GlAXtX3LUpTi49BeK0GxDBhrYiYbtLOra4QUmEMkjT77aniA17ubmAs/NE0bttGfAwOXetnVdm7RZOaiGClEeqEB1790r1KEMQgTOV6IgY2qm
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(376002)(346002)(136003)(396003)(366004)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(8676002)(4326008)(8936002)(5660300002)(86362001)(6486002)(6916009)(66946007)(2906002)(66476007)(66556008)(316002)(38350700005)(36756003)(2616005)(478600001)(52116002)(38100700002)(6512007)(6666004)(6506007)(83380400001)(9686003)(107886003)(41300700001)(26005)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WLavJzY4BhhinJTTnKmO30vKPGtADyBZ+ofjk1MLpv6G9esggUW7PB+dYMbz?=
 =?us-ascii?Q?N8haFStkxqzDbEVHkMsN+mgod0IsT33ljGiLKMx7GAqwLAI8CQyF5FrR5yCA?=
 =?us-ascii?Q?9tioOLtekzny2dyVhn8xBoBOLo+9C7re/j58+O8N0TWLS9kEYGdOtFsdZIBV?=
 =?us-ascii?Q?nNSXj+wRn06+tN1T86sZQGc0/0CXJYmYI5QPpNK8ktPzVrSzkwkIkHmj2kjd?=
 =?us-ascii?Q?1wRoYU8Sf6byvnXeDiY22RAR2TlnVJ42uINclenp9P20rNBEX51sGDfvLa8Z?=
 =?us-ascii?Q?aWXZRhbeGa2xHSes5TjkyMn9jim2VAvVrI87X0Sgh7XZHem1r2Un4FHcq/4K?=
 =?us-ascii?Q?RcGWxGUMWORNzOzsvsfyy2VfVxODBSbQraTYfnCkjLrFbnA3qdpYyEZiotZ2?=
 =?us-ascii?Q?O9PWps7Y34b9chGteh88QCEFm6ENeD/KbdrB72iwsXKgJnyPzR/lLlZVm0L3?=
 =?us-ascii?Q?1S3wLiSWIlmg1YQn+HB42mu5rLkcDskNMZGnAZfF0V9azZSli2/gqvRxNrrj?=
 =?us-ascii?Q?DRa63rt/Xz3qVk070MHi8Z6ZId+OWHq0RT2OfyKUtpyN1cNmSVvd0RB8+UWq?=
 =?us-ascii?Q?h+h4uZEXOgrVWZYb1KfoJPJDsnl11oXynatO848kBIJEBl1b/rDI/ipW4Ee+?=
 =?us-ascii?Q?MABbeoxfegfPAwqLXUQwkUuwH/zudUE5LKCFYUjx89N7S1H3RRZ3ODfBW9B4?=
 =?us-ascii?Q?fdLRBrprOnTwvzg9gc9hHwHlsHcs18CA0hHDRJJ3ZUAOjvT1StAnNnuCjldY?=
 =?us-ascii?Q?x8tTgfBKVXI8m+cg6qDslgXmw61VPqmqvsgqOjtJlAcgrXZWBSJGG0Ys6ceA?=
 =?us-ascii?Q?ob+D2GYdeOafFMK5OEEEAhTP/cuVTLLTlGYEEAUgjJap1fyT8i5uuj4Z7Zj5?=
 =?us-ascii?Q?wk1mYxJOjHKgpR7EnuzE4aqwaFgOyTvXdwAlPd4zIB6EnP6YMvWNTAxRE3GT?=
 =?us-ascii?Q?LYAcM27aIAi2o1Lf2bkeEpbbyMAHWHGaYIYVoXxkZoRy96k3ykGWtxeO11FW?=
 =?us-ascii?Q?7R0yaa1ObsC8gf1LCfAHd3RezhHlYmA9WsAgOYIF4V+4HeEIOysvMBsPU6tD?=
 =?us-ascii?Q?yCgg9qpulPEexr8y5xxAXU6d6ZMIX1tdWhZ+BOSpgafyM9K5D8QTd2qNueok?=
 =?us-ascii?Q?xmFXzS/bTuyoIioHTykK5nzkkz5dILcy65j3Yciyzl0v2WHCf+vNOS5ktaVU?=
 =?us-ascii?Q?9HRUbS11k1C7u8ASj7yng4/MRA3/qRYw9Psn/vrqR2P298HrwEs2mKIKdLi6?=
 =?us-ascii?Q?zRHDaE1FO9jWl16WJDpS3Z3mU9gLyENCRH1RMnVnZkXsb5V0LO4ZeGVDdFQs?=
 =?us-ascii?Q?g0yUA9fc/wQV5G9gvWLLt1gbF7NPOzBZPLv1V2dBfRHIP+fQ4D3H0u78ckIf?=
 =?us-ascii?Q?g5HGglZMSeULreRT62NpaFBAZH//ATJs2E6xAqYc4UMLp3c2s10yX+tfp5xp?=
 =?us-ascii?Q?fKa58+E5fxRMNMhwymZXfL3npGbWIH5Wo8ECiHe82X1+2mjXx7DPWiPtxZtV?=
 =?us-ascii?Q?APszEVAJWngfQjM6Bh+/IOxm+JwWK4oZiPnXbNpVIsNu26pzpnXQHJ4Ep724?=
 =?us-ascii?Q?81pz6NqZ4mBBmE3iFwKgeJP/vgfDzjlY5kXnw9zBxw50+qu4PW3UnMMf+NrO?=
 =?us-ascii?Q?Ww=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 254c7c74-d813-4973-d3da-08dc1da7ed7c
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2024 13:17:06.1872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +5Qqib71pNZihjvyneeBKeU5vqLyXjlNQqnRCOsC5fMpslQYXYrbda/BsEn23amCBfi/H27d7LwFGmG/Vpi/1G/rAgMABEhrRdpyZts/6L0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5689
X-Proofpoint-GUID: pxSXHhYundnrxpO48LXtokrE_I4NR9RL
X-Proofpoint-ORIG-GUID: pxSXHhYundnrxpO48LXtokrE_I4NR9RL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_08,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 bulkscore=0 adultscore=0 mlxscore=0 malwarescore=0 phishscore=0
 impostorscore=0 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401250092
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 13:17:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194324

From: Yash Shinde <Yash.Shinde@windriver.com>

Add newly failing tests cases in the exclude list for
rust oe-selftest.

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 meta/lib/oeqa/selftest/cases/rust.py | 38 +++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
index 6dbc517006..5f0cc73596 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -262,7 +262,43 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
                             'tests/ui/process/process-panic-after-fork.rs',
                             'tests/ui/process/process-sigpipe.rs',
                             'tests/ui/simd/target-feature-mixup.rs',
-                            'tests/ui/structs-enums/multiple-reprs.rs'
+                            'tests/ui/structs-enums/multiple-reprs.rs',
+                            'src/tools/jsondoclint',
+                            'src/tools/replace-version-placeholder',
+                            'tests/codegen/abi-efiapi.rs',
+                            'tests/codegen/abi-sysv64.rs',
+                            'tests/codegen/align-byval.rs',
+                            'tests/codegen/align-fn.rs',
+                            'tests/codegen/asm-powerpc-clobbers.rs',
+                            'tests/codegen/async-fn-debug-awaitee-field.rs',
+                            'tests/codegen/binary-search-index-no-bound-check.rs',
+                            'tests/codegen/call-metadata.rs',
+                            'tests/codegen/debug-column.rs',
+                            'tests/codegen/debug-limited.rs',
+                            'tests/codegen/debuginfo-generic-closure-env-names.rs',
+                            'tests/codegen/drop.rs',
+                            'tests/codegen/dst-vtable-align-nonzero.rs',
+                            'tests/codegen/enable-lto-unit-splitting.rs',
+                            'tests/codegen/enum/enum-u128.rs',
+                            'tests/codegen/fn-impl-trait-self.rs',
+                            'tests/codegen/inherit_overflow.rs',
+                            'tests/codegen/inline-function-args-debug-info.rs',
+                            'tests/codegen/intrinsics/mask.rs',
+                            'tests/codegen/intrinsics/transmute-niched.rs',
+                            'tests/codegen/issues/issue-73258.rs',
+                            'tests/codegen/issues/issue-75546.rs',
+                            'tests/codegen/issues/issue-77812.rs',
+                            'tests/codegen/issues/issue-98156-const-arg-temp-lifetime.rs',
+                            'tests/codegen/llvm-ident.rs',
+                            'tests/codegen/mainsubprogram.rs',
+                            'tests/codegen/move-operands.rs',
+                            'tests/codegen/repr/transparent-mips64.rs',
+                            'tests/mir-opt/',
+                            'tests/rustdoc-json',
+                            'tests/rustdoc-ui/doc-test-rustdoc-feature.rs',
+                            'tests/rustdoc-ui/no-run-flag.rs',
+                            'tests/ui-fulldeps/',
+                            'tests/ui/numbers-arithmetic/u128.rs'
                         ]
 
         exclude_fail_tests = " ".join([" --exclude " + item for item in exclude_list])
-- 
2.43.0


