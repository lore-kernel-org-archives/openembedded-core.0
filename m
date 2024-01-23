Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80F88C47E49
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 13:19:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.11784.1706015940423973700
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jan 2024 05:19:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=BTFn8EN/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=175275645d=yash.shinde@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40NCA2Gv001526
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 05:19:00 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=kG9eKt85xSiuUc3k+Iwp8YM0+Edb5fTi2BCm8YcRSdI=; b=
	BTFn8EN/QX0wKTShJE6Ivhh7OdtZwmCDpijwh3ndTFQCoWY/K3OCYoAuK1rKaWQy
	Ji4hK7oFt5BmHDOzGI3A3evAMr1iWV46tb4rMR+XNmONFxCJtxBnuHM8oLd+Ahee
	Zhl+EpvY3vk2EY/PYfandck9QifmYtHPAEZjADGObATr7t2OBf4v4q63qTjeC0bC
	t9PZbngvJ3CLtrFIc3ZeLnEhiRjK5Wnv5t8FoxQsm9d9eWzEM/CtxWPtqpdoi8YE
	biBktOWeWQZ0vkvSXCOowwNDQD034BBbmRwpMU7G6e8OiXM+M32UnfhPncriMHN0
	MTFoUKyi5OK6DoMhnr+F+g==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vrejku1g5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 05:18:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zhq7LBTYfGpixnSpQnSB+yMBh/FJ9qmzQUb+5cQTetKOZjAKyrxklGf7VbfKWAkoLz7e4LFdupgbYTGH19BEUjJ3a1l2H/nn323HP4OraaDkGTQOoihOQ0dwf5xqmumdNmbG/T0J0YOOkd16UtzU1u8Y6byc2Hd+7yCkhIQjXEkD5DLDONPRZC4GTdfSky7J5VqCqTECxB2RxHB0Dk5zjLhTO1it17JsLQhV47lRNOp2WCHaE7KeDAz/9Fm9dzQ77gygM71gqEIXURdEk6h4Ob8xX0djpsI3lgiGgqOMQ2/HepevCKyWMXcX0PndOj8+S5pNGAlC/TTbbyuOdVYJ9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kG9eKt85xSiuUc3k+Iwp8YM0+Edb5fTi2BCm8YcRSdI=;
 b=E3Y/aUE4BBNtlzVsKGjrDFmTIvSZdx1ni2DbbZs7F+zS4wD+a85773N7PYcgRQYf1dJ66SC9bbIqICQb/7vR1ZtxJWaFdzkRjQ7DMOG45HLXsdJK1TypXm6qlpVU0+uDJvuO3TqvKVqLc4I3Joe1kMf95Pmkm3HrYdF4X/Otfk4zv/jzTfjhkDohi5j9W/J+Jh0Gd0NhTbRSBAFNWPuGPi3Az1KwPgXRYWFC1qqYyTAZbPiTBwYSWSEwNpmLWHmnFU2rPQ+pRAFzrR236wRnsbCxa/HHBoGyD5fwk1UiyyGR+DEYaEFeofB89o5SRguDHNwUqUzdrEfsCssvWlAzsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by DM6PR11MB4530.namprd11.prod.outlook.com (2603:10b6:5:2a4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.37; Tue, 23 Jan
 2024 13:18:58 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107%4]) with mapi id 15.20.7202.033; Tue, 23 Jan 2024
 13:18:58 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kallapa@windriver.com,
        Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Yash.Shinde@windriver.com
Subject: [PATCH v3 6/7] rust: Remove the test cases whose parent dir is also present in the exclude list
Date: Tue, 23 Jan 2024 05:16:32 -0800
Message-ID: <20240123131633.641012-6-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240123131633.641012-1-Yash.Shinde@windriver.com>
References: <20240123131633.641012-1-Yash.Shinde@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0145.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::30) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|DM6PR11MB4530:EE_
X-MS-Office365-Filtering-Correlation-Id: fe4e9715-860f-4590-a66a-08dc1c15db45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lZrG/r/0KG7pbWkeIblEMo3bSFJuo7eCmIMjXMwp+SU+HrkE/u6d9p2+3mXn+/gMVyE9heHgTZlvb0bZu2w5dEtxOWDzivYJTakGe4npX4ErmJr0IDEpKsXtY7ivPl4sY0lU+iPNUmgUDArSSGJQWjkcW2mt+XDMO8eYHkxFodAayFOoNW+GXbUF+A6gdxtMPHOUNXZH41ai9X9cvm8AhMVh5Nf3HQ1UcEjvmLE6cuuk1321v03VIN0WLlygH9jVu0od1bT6dSRjbb75KpH5ZeTWhuI1zjcgTRpMCHsq6ptF/8VnBsKx7mXdK8Vhxcb37n5HEloBZ1k/lSZ+Ohou5q8as22Or4hbQphBh1oAB55MZqSIvjzmyG01Pw05xa6iVSr51hqvsEZOMWgSV8DextUMG3X4OvBq1PxGQYoME0BhiRqAa+2UeVixvYrSFNgLTosw9BjolMLWG2cAT4lnznDh/5aC6hvitiTVmBpApCpLBBtJCPFAgDrvr2BO64mdq7sYZO6WfrV5K8OnDnlrmnMX6EcGgkKFrr56r4fFyf7A2CLx4Fp5oUg3DxQhvYmODFWm9Y4J+BxXQAAKcCB67LQxoLjBzaONvNzaDyCO/KUpRXK6VeR4/UpkO436JX5g+/ek3oU/d0T1O/AdBqTYyd3v0Ly908B3USaecGt7znU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(39850400004)(366004)(396003)(136003)(230173577357003)(230273577357003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(2906002)(6512007)(9686003)(26005)(86362001)(2616005)(4326008)(8936002)(478600001)(8676002)(41300700001)(38350700005)(107886003)(36756003)(38100700002)(83380400001)(66556008)(66946007)(66476007)(1076003)(316002)(6916009)(5660300002)(52116002)(6666004)(6486002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uSgMQnYjhY9xvzj4iqW7I9n/eLmct7P7rtb/WVUUfc4jIJXaBNe1FlLLSvGU?=
 =?us-ascii?Q?r708jTYCLPdHX1mAgtZEEPT0Jn6+jOTUvIsiihmKu1xINM4n76qPsnNj3dgb?=
 =?us-ascii?Q?+OSfh/M/yZ9DJFU7hPxaAAhVA1wJiN9J17Iamgvp/ZIYUvyfrgs4NDE+3ZC0?=
 =?us-ascii?Q?z63zB7Luoy9Pt15pGViiXVwxtmecbJhUFokv8cGARs4ZVncTgxqOzRYg74v8?=
 =?us-ascii?Q?xUoSs2jXEg3PctX4quW+nArvr6PSH55Mh/HubEX6QVYlJja2r1sI4H8jp3QT?=
 =?us-ascii?Q?pXeCDv40v9gG1cloD+A31rl9lg6zTtHoNP7YUPpRUZoZXFEaGlrPJ5pOMsfQ?=
 =?us-ascii?Q?v5RpBnxMXvwQkPiblX8BXv8dhH3Ph14BKITnDOGIxqzV8Drz5O9FC3aZ8CI6?=
 =?us-ascii?Q?vQlYc2PrrkLsFeno5Bm1cNmkcBO5Dpz/CwYHXK88XVBXbOG6S3dWIr7CVtKA?=
 =?us-ascii?Q?dbL6c6uEsXvBQrF3jqVgU/fUvBkFnZrBe7owD9YbN/49Qmz1gtfgo0xiopIT?=
 =?us-ascii?Q?t5VIXzN3PYWST+CrOKiwJOzw6VWY/kXvKNaJsHnTepuIQLcZm7lq1ZhNI83r?=
 =?us-ascii?Q?Sx06fK//AgVnas5L+LW+GcG3IiWgsdS0DzGasoPK/8fbp2NECjC8nGgzxbsT?=
 =?us-ascii?Q?rrHef6LlcxNsp1nh8SR5w6lOd2+rl/DeELcRKrfiQCzOuT7XRqIoCpK9VTIN?=
 =?us-ascii?Q?WpRO1QZe+XtqjUCXFqODxRCs7blFeMO6hdyjxNUKjo8lh9QdU01IfjzZ6Xfm?=
 =?us-ascii?Q?UNHArUP/DgR0JfeUH/t94OqG/gNrIS8sDUnsffwWhOiUrJmG+Mgr+Vir4iuV?=
 =?us-ascii?Q?AMZK4I+NB5p6a20Gn3QzauVa9wtEtyiS4cC+goP1Iz2nfB1If3Q6BRfmQdjV?=
 =?us-ascii?Q?IzsLlrDnoZt0qB1TjQ23nm5ybjxvV9Nmzfw35Kmc91MWIjlZwgTzChISDkxy?=
 =?us-ascii?Q?QiVZRvDaxcO5qELX0Al6q3GCnuthFfuOyrGUlYnLSfpXqjX9ba1+DXnBWP4M?=
 =?us-ascii?Q?xxlQt+m6QNa4blz5N4TCOeWscbNWgEtzEfDGTHa4AbtvOkG3918BD9khZPZO?=
 =?us-ascii?Q?dUhpLpPrHpdSLmnIpM81JzWmGsx/eKiplE+QAiKhAap8JKMlK4Kw73GwZJvt?=
 =?us-ascii?Q?8QbTxW2udGo4ZWLMLRCIWEnfYEcpVWhjXGzpOqmWAP30qnCTfL7RV+eomwdY?=
 =?us-ascii?Q?hEpKgDA5bhry/mx1h3O3PVXHIbRhnBLnXE62cEK089ohfggpjGcncxRTI/eX?=
 =?us-ascii?Q?rb08bFPdcTHEsjYeSk7RZclCyrJmqDNHaSnz+BJpJCYf5nPiZq2YVPctuQXh?=
 =?us-ascii?Q?ZN3fIApa3VCxr0E1bOe5VZsJPgqxhsI9uvcnX2AFWvvITW8RizdL+CufN/B6?=
 =?us-ascii?Q?sZn3p1UO3C6e02fnf0AKVR5PpQY3YuAEp7PDmX341IDvLPYuOc4XPbFZNU7i?=
 =?us-ascii?Q?ktbBIooppkfboDDDduGcxwhhVt5yLwfLVTI+4Xao7+kTq19l37uXfO5hsptt?=
 =?us-ascii?Q?gWpniAJIIKujHj84Y74y+La1+zRmS1lF3vDQXfedDPJ7q8Yh3Pn93FqOlaFx?=
 =?us-ascii?Q?jjCtsrMfhLLT0ZgvOBZSxM0jnPT4+uoNP5fpqE3haX4Dt8VYgsrieSTGBPhN?=
 =?us-ascii?Q?oQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe4e9715-860f-4590-a66a-08dc1c15db45
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 13:18:57.9556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6zLuyT3lmyY0hBL0LpwCtHYAYdzE7nwRhH2KpfGKkPraRxzlT/v9zqnBaH0pKEhbqdSztxf2ueTyGJuo+v9ijqGL1tK8EnC28Hag6axF6ms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4530
X-Proofpoint-ORIG-GUID: YzcqfeF0T6GiX-Oy1Jb43AtEwARavxcp
X-Proofpoint-GUID: YzcqfeF0T6GiX-Oy1Jb43AtEwARavxcp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-23_06,2024-01-23_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 adultscore=0
 impostorscore=0 spamscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401230096
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 13:19:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194233

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


