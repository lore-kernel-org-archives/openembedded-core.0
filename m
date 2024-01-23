Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07608C47DDC
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 08:10:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.7156.1705997447072611215
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jan 2024 00:10:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=cTJw1kZR;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=175275645d=yash.shinde@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40N3xOWI000989
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 08:10:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=kG9eKt85xSiuUc3k+Iwp8YM0+Edb5fTi2BCm8YcRSdI=; b=
	cTJw1kZRzswQjFA1NOFXDUz+7CoX8kMJjlgocc3UOdP3v+y5Ws1WwrmXr/31G8GF
	Ph77RTlyafue0jV7Sg+NmM1Tvl4Ik1LonjNBVLOEENLlt40rB26rxsAavaCCM8fO
	efb/5acm5a/9tS5lEqS3dOgnRNh7uIDVzoQhqt3nKpx0RQnVHw/axYe2Z7UMQfRe
	19Cb7S1e1PMvdQTRKRYaqN4YNJM4Dg+7OiE+2zjEGr1tlDfPv64qSAUykWHrUpd6
	3Lvsx6MdEs1htobdgBcX8jdVGGUAHybqo/4PRmqQCF+wiaRlxi18ODkfZ2WsqcRc
	25KQyYsh3NUnHYZ4RU3vyQ==
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vr55734gu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 08:10:46 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jTzbIDmAB9qWQeMWdjjsMYvOamBgJlhtEHBVIJ8G2ZpbRHO5DEiQ22NO82ObypFdzTC/+UvoG8gHlynyQ67fwV0O6Odpurj8fhpwlsgwk/N8oy5jBld9ylReF2UskIqnwj/VZELPiclrK+yF8D9VL3bDPkHNpQthx24sWTxrt8FDFJjAeM2/KdEFf1M8aXzDKwluRN2Ps7SyifDM3Gz4Sx81NWand6bZt3wcYfyEN0S3ExbVYk/90DJVbwjIWN+ny+YCK+uDBb2QdJzpmhaFgCMu3kINHBLOpxP+wAw8PE3D8ovqe/Cg4W3ifD2B4Y/eKuhjb6jL6AfCp7lpEKNOKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kG9eKt85xSiuUc3k+Iwp8YM0+Edb5fTi2BCm8YcRSdI=;
 b=XX8qtLp9aFf1A7XAOstA1sU8y92NwSrbfEb0T4ceAg7JAoNwjB87vmZ3iiliaXWt6MZuxBDVxl/S4i+++AqU6bZiJR+6r/UFZNDtMdZJCiIqgPvdOMErHqVcNX1zo3WfnqwHq/k8idZfp0BhtyD0mSW2dWk+LkRu+rP4j60dGkS8yloaJfyNWZivwefWeEaAj1nCm/s/NrSjpDOEjWxnUrRAKBy+lvolQXu7WucOMOR5Wi/kec7uteEZYzJBEuodVg4vZZ2fzPdmG3myHzwcBgehvKPiJoz8ywiZOUlWmErgHfapmxOWdgTbJkL1CTJRMqGoYOO32LpQsqQVRqyLOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by CH3PR11MB8344.namprd11.prod.outlook.com (2603:10b6:610:17f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34; Tue, 23 Jan
 2024 08:10:44 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107%4]) with mapi id 15.20.7202.033; Tue, 23 Jan 2024
 08:10:44 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kallapa@windriver.com,
        Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Yash.Shinde@windriver.com
Subject: [PATCH v3 6/7] rust: Remove the test cases whose parent dir is also present in the exclude list
Date: Tue, 23 Jan 2024 00:10:05 -0800
Message-ID: <20240123081006.3310715-6-Yash.Shinde@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8234bc56-07fc-4b78-18c1-08dc1beacc33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cA+iQEiTavhXqFZnpj3oj2DAblVdxp6JV6SpX71zEQS3WUysuNhzgdndRoWLJvrks80va84IicI43vVLizRacykBRhlF7gTWvE247c7WoTxqak6gV/Tdz90kfNgv6loriL0JA+weh3R0oqvd1asjztjGUs/cYCgXiplsHsPNBt1vRdmx6Qzh9J0EnfsfFLemPw9Cvidr2uH0jgoG03evXYdMCe73tOleYIWSHByJ9LSv68XgLcxQYc3F8yd7SzdOstf7ZPJqx1WVEISTv8GiB/jvM2ia6vO0hDECoAgfeVp9+ErLT88/sveDlM/yEi921L237mt6I9GRtMrwMV2w6BJCKcAf10C5kh3kxeEBnwmpEMx6u4XKx+X5IptO+7vj/RKBcWws84LRt2pSQyehPRBLDKFv/ZCy5Sw6mo0QCY/UbWDuuhVNTzentxeD94vZJxoqO8e0L+THv9O99QYrdWT6JZ+MEOCLCiB/1MH0qTMdUDBou66s8ZJM1Xj/TcJ2GMZWJl8hHJbyjtbdW1BSOqvAcwW40KmSdgsbOWa2gQfdcqsuISQMbHASNOdvMT37oeUNpSEUKJm6t8TCTkJqqAeblkXFap35mCuC5FWpI3tkDU423qoAz9V8Hpa7SNxFN7jZXdcFBKkGjUyTm+ki2aiVpeYzzLIhUVME7R+GP2k=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39850400004)(396003)(366004)(136003)(376002)(230273577357003)(230922051799003)(230173577357003)(64100799003)(451199024)(1800799012)(186009)(66476007)(316002)(66946007)(66556008)(6916009)(6486002)(9686003)(52116002)(6512007)(6666004)(6506007)(5660300002)(83380400001)(8676002)(26005)(1076003)(2616005)(8936002)(2906002)(38100700002)(4326008)(478600001)(36756003)(38350700005)(41300700001)(86362001)(107886003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TCTgzTyCJL2uv2Ygfr9ght3ZFtXWOJWN3Sauc8GyrWiVZyjHgWFq0S1FZMTH?=
 =?us-ascii?Q?4sUP+DefExRge2hpTrXXDUG+BSWR+JnxE6xEPJ/DldQVV9qwOet4XnFYmBV5?=
 =?us-ascii?Q?rp7J5OvCrWDLId8t+7YNR3YlXgmFy1dz2dznwFqSfI5PiaV7AXeY3ppmfZGt?=
 =?us-ascii?Q?HNUhi/iF2lQRPdgtsvKCjWsyTGvK/y+PtQ6FZhAYUnjoln15Xk8oRYPjy3LE?=
 =?us-ascii?Q?nWRAif88rroSxihfiVxAHe1G2JuAdFIM5ZKwxUb8wZqOWyc8UYl8/YXiKYEQ?=
 =?us-ascii?Q?btpyIJkg7wVw3ANIhOKESI5gy1SfYVjt1AHN5/KhS+Wz2oBIWJqnR65SDzRN?=
 =?us-ascii?Q?flHO5IzHMKum1sDi6cku2HX7IO8xmFuRIM+CP6npNS1EJZTNAkaa82knqR8y?=
 =?us-ascii?Q?kBIuFhNq2DeCYkSoBOLzfrmZzXBsi9G66Xw98LYWdwqbEtq++iw/SfRjjW8+?=
 =?us-ascii?Q?Ww5H8LgwHm1uaXIR0EulPg6QltEYy5QpjoWGCzPU9hEwNfhhwwGTLl+JMHN/?=
 =?us-ascii?Q?witT+umOLyyAgsjhED3zSoQg/feDbaS7+X2ghZdoYNaSPkyIy+c15OsMWKDm?=
 =?us-ascii?Q?PZb9hjnLNxTQpoiLgJaKQzFh0ZBxdzC3Ch8Za7hnKvJ4BFjgOD3aneNbW40o?=
 =?us-ascii?Q?EqbSsp51H3WDNZ9hBVQt82mDBPhW4pnAC6lbh7dHIfQRYz6q/4Ho45W9kQJO?=
 =?us-ascii?Q?jnmq0UJbNa2iv03uVCeUNPCtEcVNyObkMaLHfb0A+V9oi//wvq+D+/g3wJ9r?=
 =?us-ascii?Q?p+1q+juGkLtmwNkW+WxYofTZSPuv5neQ1HRYK0jp3fQlP6S5hRo1X2wFnc8S?=
 =?us-ascii?Q?JxIT1UR52gDgB0mb18+y0oy7Nb0hCRra9V7mf2g9JVPN9auxXq2VEE94VJz0?=
 =?us-ascii?Q?g4qOz/JQtS+PhCGp5/1hy7FOXxVuPjw4YSse/hdlqfWkZxGUl1Py4QY7aOQI?=
 =?us-ascii?Q?dSTbKAASkEDm/iZpLgFR0R3ERWSEjU8Q1iccw5GPH+GN/yatCjY3sJS6evpw?=
 =?us-ascii?Q?LQkF099x5yhh6pg3o/qWEK8PXwUrVdI9DdnFadFCyp5VSQRnukCHa3Da3UIS?=
 =?us-ascii?Q?g5nluK8/13Mz+nfWDPVtGo78QVxFA7Vqn+uTs7hmnSKok+MlyagKZNBMHPPs?=
 =?us-ascii?Q?w22DfNZT81RBeSfra49/TrGPZrX23s6xU1RzamTkz4hC75RXE8Fw5OyONq+a?=
 =?us-ascii?Q?CxuiZPbK901qrz2uKzQolB8riT1emRT3bIkcu+A+YV9EO0sHcjBBcRPkwa66?=
 =?us-ascii?Q?hEDZNkw0GTeN6lnKA6MtoijTOalhHY9ExqyNudnavSqdEZr0iYbnw6nWBgZe?=
 =?us-ascii?Q?x5GmJAnVoX5OGHSHnVal6lDCYO+8sFL0KY5oPUX2Epyipq2TmJz0Le97XLz7?=
 =?us-ascii?Q?wDWMKcvFWiiuTqE+dUo1Tu5Z3vkOvK2YkfQd03mGOypTmtFE7DkleN/7sa7u?=
 =?us-ascii?Q?RVbbuECQ4hIYsQb80cFsrDDktkQ4CXR27OcXKSpgI0Dzzii8rpHp7tIBS/ZM?=
 =?us-ascii?Q?cGPNTq7SyRw5kontYyd82/vF6QesfpFujyEpkx6Z2+X9iIxg0zPe7Yph/++S?=
 =?us-ascii?Q?4K3KAeOZYhixvsuff5L351Vw1QCwi7fMkD3Wm8L7MunJkMEGYtoANV1ns/L7?=
 =?us-ascii?Q?rQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8234bc56-07fc-4b78-18c1-08dc1beacc33
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 08:10:44.3058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fKLmJ1qICLtHFRopHUdoiAJufZAxNm9NoIoMaJeGqCgvanpQ/vTiIou4EZXkvBiFdbPdZ7EqFEHBfYSA9g+zXnzyVFM7jB3lxxbBlMcShCE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8344
X-Proofpoint-GUID: IwwYFPGWtj3YvbDQ9vndIfZ0ST3lQ9I3
X-Proofpoint-ORIG-GUID: IwwYFPGWtj3YvbDQ9vndIfZ0ST3lQ9I3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-23_02,2024-01-23_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401230058
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 08:10:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194211

From: Yash Shinde <Yash.Shinde@windriver.com>

To avoid overlap and redundancy of rust tests, remove the test cases whose
parent dir is already excluded.

Tests which are failing from below dirs are removed as these dirs are
already present in exclude list
            tests/run-make
            tests/rustdoc
            tests/mir-opt
            tests/ui-fulldeps

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 meta/lib/oeqa/selftest/cases/rust.py | 122 ---------------------------
 1 file changed, 122 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
index 7ad6cd6be7..0ec2e422f9 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -102,108 +102,8 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
                             'tests/codegen/uninit-consts.rs',
                             'tests/pretty/raw-str-nonexpr.rs',
                             'tests/run-make',
-                            'tests/run-make/cdylib-fewer-symbols/foo.rs',
-                            'tests/run-make/doctests-keep-binaries/t.rs',
                             'tests/run-make-fulldeps',
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
-                            'tests/rustdoc-js-std',
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
                             'tests/rustdoc-ui/cfg-test.rs',
                             'tests/rustdoc-ui/check-cfg-test.rs',
                             'tests/rustdoc-ui/display-output.rs',
@@ -233,28 +133,6 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
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
-- 
2.43.0


