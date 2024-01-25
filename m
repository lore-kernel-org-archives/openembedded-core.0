Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 195A9C48285
	for <webhook@archiver.kernel.org>; Thu, 25 Jan 2024 13:17:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.17221.1706188630119988098
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jan 2024 05:17:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=IYK5l3TI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=17541b5c6f=yash.shinde@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40P8auBd028223
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 05:17:10 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=LFOQ/cLy9uy7hVvEX/cCAD0UDF4GWdkiL5Qbr8yi68Y=; b=
	IYK5l3TItaKHqWZRA+JQbMNpPYDLGbmXXkL90X5y1escH5mYIqVt5dsGawXKc15a
	x4S3pBnTWk1wtSe7PBwGxQQ+yMsyLUz9+YHMZOu1gLzTCri/UwHtkh0O1kyS38fL
	0P03z3Nvb7tpBMHDkmDoIcaOjWQ8CquKvAXT8LsutviCIZoswDOkzoMqRMoEtbVH
	XKpqpIm2vAuOZEAiTKjKSHPR8Ij2C7L8HTbrciFqjk0BYpPmSHfvcgjpuUkf9U6G
	Y6DjbaGFAgKlOCu4c4py6oCMyLtLdj4nCRLqOjqmfCfbx0/MWCxyfH83kcU8eIXM
	ej5rZi6YwjBP7xazFmNl7A==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vucv5rgv8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 05:17:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QxF6zRkUVF/oaQyGU5RBYC1neYeOqkWCT9o4pRjzOSG2yYqV7OAHYnsG5c+bxwMF9HVaJIxNyMIKXc0DfnPxQpHXT7qkAtNWiCd5/SR+IPoN6ZI4f9zGGv6QoRHBEYBvlaMAMvWZNgfl6QHGcfhh7buo1ll/fH3zaTFKqtSBYK0vt8FEaYXLMsS6griQo7nCbhn4I9nCG1/y/VcAFKufvxxEbd7QonOLuE2fnb+Nz63QnYF/NmUQto7/t649keOk5lt0A+AYBWiWGnBhAStulscfuTOkckctN0aHNXmqeISk8mkZ0ELaGbOMwBs+sB+i/5inEZJdWXKUHd2YbRMfxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LFOQ/cLy9uy7hVvEX/cCAD0UDF4GWdkiL5Qbr8yi68Y=;
 b=JvIxQYCdArCnaz5FV6eBT8309yLPx6DWwSaxA9aSiYcXbeCRFe1CctQr2EJStD6wkgDL49jMfRCDn5w57qwIYvE1kmF+W+xFTTKfWhYrkTyn+FyHIanYgNe0ujkQLNDS3xn1DZK1352KAbuzgWJMHQkkDIL/wsca1VekQuuEJprTofHzx4F0Boceyd8dZtQR1zfO5OIb7zowtmwe+ntdNqc9/pgr8O9RYJGp47efHeE4LSfvK+tU+F5T6fs/TrjtlGLph667E9jYAtUD79XPQ+PRmCOg4fWq4BWSM9rKC5ApY9XqMnXqIs7tHJZlkldXxr3g8HVpx1LgINIu7vopkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by CH0PR11MB5689.namprd11.prod.outlook.com (2603:10b6:610:ec::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Thu, 25 Jan
 2024 13:17:07 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107%4]) with mapi id 15.20.7228.022; Thu, 25 Jan 2024
 13:17:07 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kallapa@windriver.com,
        Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Yash.Shinde@windriver.com
Subject: [PATCH v4 6/7] rust: Remove the test cases whose parent dir is also present in the exclude list
Date: Thu, 25 Jan 2024 05:16:02 -0800
Message-ID: <20240125131603.2769496-6-Yash.Shinde@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: afd8a401-290a-4467-790e-08dc1da7ee4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rPFEAHyUSMsRND3WVNzzW/NXQgQl9Xafcbp9NxfQY/OnZvsFWlXEaY86/r1Lro5+na/phEysq74mXgYcpU7fZzbAUyhnwKdPJQzhKYM9LMfajuI3w4897AK2nZZOxbxbsYLG5zdxFaYKEDhOPlV2jCXkt2lhMGivR092WycT6WeiZ6inyIEWeINLsviBZNH/xoykqprk7+j4Nqjqpi5PryrGJO1NGDbCe8eWHBffZGQtFIIov9d89pqxmp7ta7hFLVwQ5pxySZunYLsz5JPlH4DIrSScuEmyax+l4oY0YasGvyen/ltDU6j/i88Rfgu9hgJ1c9B5jvjW2QcvYqG+OxNcWuk2nIaWWf1jk3+x4uZDw2ue7QleF58gu3gfxwH7HJMYZg9OYFDpV8VteLlcJ1M8QvnqoV/VLcGcksMid/JBHidfSnujba+L2jYD0jIey6NO/bgU+g8233gFWNh7XKEYBjgsaZQhjk5fs/VV8Mr5ydHCqqEmsO/ZK/16Of8Bt05Fah4cbCnPIZMKDw2oyyMQsUbn7OI7e3iKKCrT9f8oQ//x+QKrw//aK9vRRJ36OUwBt9Z5TZcxsEb1Dl2CeNQZ44Xk1cH8wglAEhahcld4wanIp8G3dzhW5uGHwpxTEss3ncv4OlKR3COCCOTE7yz4ss6evJke46gNG4ABtsI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(376002)(346002)(136003)(396003)(366004)(230173577357003)(230273577357003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(8676002)(4326008)(8936002)(5660300002)(86362001)(6486002)(6916009)(66946007)(2906002)(66476007)(66556008)(316002)(38350700005)(36756003)(2616005)(478600001)(52116002)(38100700002)(6512007)(6666004)(6506007)(83380400001)(9686003)(107886003)(41300700001)(26005)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+jVKb5/yFfOdT4JLzl1Gq9lBG5pl8qZ8LLVsB/7dSC/GFy/CIFr/2WRdXYdZ?=
 =?us-ascii?Q?LMWycH4ouI8G6AxfLT9ZsA4t337Z+rzRcS6wO6CCMZLQbrs56wE3Qs8zvfrF?=
 =?us-ascii?Q?VwqrgzgBUAx9HMHzOta8agX6xPLSNt1jL6hEkPCe+F/IrvnkXENFNowkMP8D?=
 =?us-ascii?Q?rZOaJnwg1ZyX4+XHDfiUFxmpGg1O5+wqn2pzdhvV6H0QQMhesNMdjroBhnyb?=
 =?us-ascii?Q?HwL6sykXatjSDe9m4AwtfAPnYRSHMBDL7xGqL8elOyOWBjJB8cPrPjPwOVq+?=
 =?us-ascii?Q?fxIg2u7HJc67cOqn/en7EnGZvuk3dM/5ffXQ7eDwIjTPUtTP/QNxafuDiubO?=
 =?us-ascii?Q?GQicEN4T92UrDtI1v2LaOfc8+Pi3d88gVTPv9UmMvXAa10d9TEGbJoF/5yhz?=
 =?us-ascii?Q?47J0fYGhTIFy6xgETzQHcEMGN08Dvr9dxsTGPePC4CzTaT2PKYnRTmXK+JIw?=
 =?us-ascii?Q?3Ac3LHnTwlUDAZTR+yPtND+HHsSzC7vnzB3blP1EiqGHn68fqXPG7D64mFTr?=
 =?us-ascii?Q?SSKzVWf2Uoq4NhlWXAaD8sNU9ph4q8Zs4V0I8HY5bOBeZlyQrbpJlEflYdoA?=
 =?us-ascii?Q?pAEvStlxZkR5NTpWx3QfjK/X0alYgCivQmSLiqwKeOFwRdnWrOQLCwyYneDV?=
 =?us-ascii?Q?/ajN6Idlu63Uof32xxZZrC+JSGlH4FUIm2ooWu5gmnMdfYqxo2f+ftDpc1Ye?=
 =?us-ascii?Q?fQFvgVfbZhnUB9PT+Yfogk4Xvw/FdAtnuGd2q0DLlk+PJNl6VG1dF/jJBuRL?=
 =?us-ascii?Q?sJa0xPtNREiLguh30BxTAuyYExi9R6bwcL7HCeYksFpL12kjiBc5j9ljegG8?=
 =?us-ascii?Q?ZLcGoLMjBbEHy7P9piTPn7SCjUelCosNsQ7qyWBzJY1xIxkvwBs3xTTHWZPC?=
 =?us-ascii?Q?hRUNpi8NgcIFz13DSYOhyN7qKxnz6pc5ygLbbl2zQ/8VRX3K1xKaDJUMwjA3?=
 =?us-ascii?Q?emU/B2t4ZsjLIFHMe61/TqHA9lcbF+PdJT/X6FGRNLgWnRLa0YCjrzzVN9QZ?=
 =?us-ascii?Q?wV0kdAzixyLgiFiZEhn7oDTa6e0++jGU6exw0jGbWMeCp5gzQ+tesLf7o6KG?=
 =?us-ascii?Q?5dVjamPVPfmOrTiQqrpqCOegsi3NF/TpOBdYpCLrMdnHb4RtO0Vw7C/3S+gQ?=
 =?us-ascii?Q?4MUmz9oe0AipYV7VOyWBnAb+oOVmLaQtzPhMx0Jhg2LoY5z+o5A4QvNMKWxa?=
 =?us-ascii?Q?pa5KFtehImjp4iMeUTfhEI75I3fle+NK85CiaRDgrT3Dd2YP9Sd8v/HM/3J3?=
 =?us-ascii?Q?6eG6QRY960TPsI2q+6pOS/5h2X3jN4mIrcfAjod2CLcJzRkwhSOlBP75fTMw?=
 =?us-ascii?Q?O1YHCT4XkMuR94/LJUZHZxM0P2ZEAD/ydGtCWJRArrnvsdBD0dvoT9WHXjar?=
 =?us-ascii?Q?GWCCP4YqE/LnowuFKLlQ+uWU7Ln20EajNsx/r0H8zDdiqH990+hYOX6BPn3O?=
 =?us-ascii?Q?IzDczkFDLUxf/+Z2hDp2woTHpX506/7QTGHEtuHG+GXnSC6q0R8P7J7tfSga?=
 =?us-ascii?Q?W52B3XTZXQU51asNkRq8gvRH3BIFCBxznEgdLZD1TTwwJoBtR4seAIzfZ2lJ?=
 =?us-ascii?Q?KC3/S97NPAUscFCWIewjJ7gnKIzx9yfsh8+KYPM3H2rGBSvqAbCHm8noCkPm?=
 =?us-ascii?Q?sA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afd8a401-290a-4467-790e-08dc1da7ee4c
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2024 13:17:07.5761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +qX1zzWVj45yzQvkO5fkzBJ16vnDkk3Rys0VYXVomo3s0gJw3wOiCRQ/cKFhuUyci/rpdf6aKv02qXWi8FsgP32isX8LLfPkjL43w+Zgkwk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5689
X-Proofpoint-ORIG-GUID: IgaYSeUXMGSfMZxQvD_4j2Pk3V27FDMr
X-Proofpoint-GUID: IgaYSeUXMGSfMZxQvD_4j2Pk3V27FDMr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_08,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 mlxlogscore=999 clxscore=1015
 suspectscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401250092
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jan 2024 13:17:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194325

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
 meta/lib/oeqa/selftest/cases/rust.py | 120 ---------------------------
 1 file changed, 120 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
index 5f0cc73596..0d7d524471 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -102,108 +102,10 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
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
                             'tests/rustdoc-json',
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
                             'tests/rustdoc-ui/cfg-test.rs',
                             'tests/rustdoc-ui/check-cfg-test.rs',
                             'tests/rustdoc-ui/display-output.rs',
@@ -233,28 +135,6 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
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


