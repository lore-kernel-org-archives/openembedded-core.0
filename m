Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7401DC47258
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 13:19:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.11782.1706015938372168528
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jan 2024 05:18:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=YjMMgH8+;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=175275645d=yash.shinde@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40NBrA8d022359
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 05:18:58 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=ZtBAGwu9HcBQaA/T5+ExzFuKchDOOisR9OSoyQDd1vI=; b=
	YjMMgH8+AO/MKVrG7J4dc2+iaA30d6CibsmwSvY0JlpKBVfC7Qod22yMudF1oAss
	W6mtcY5UhF8Aiq3A8Gr2Qypy/9Gca1GTY4cqXEXnPx32Ncuv75oEub0eXnZP9n3q
	2GIan2gzYe+M6aj/sWu0aFLwThiR8zI7DHdgtweBTILR+j+N++JWLVT2C4161PLk
	RBMs7jIpXoT897DvfIvSIw9znIbby3AR5mPC/VTWfwrn/aXGJw/GcA6WrTTVEK3e
	p4MkqmndMOQM28eZqEDIUFh+0JK5qkOGBNZ68hRaaR6GaB8mLMvW3CWghjVoUAIt
	1Ld3R/DpDd/MrEwZC3ZZdQ==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vrejku1g3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 05:18:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bg/HtY8gYpMAJ6i2Ywy54qURyugle/yyfuV9anPt7cjKRFU2EGmPojDhyMykf3tIE3jw2BqlMllkzrTgaHr5+CVfWCwfXQ5gQ1KGaJKwEQ1wF+jeAjmt0K2YvBwmSsH2EfnL/P+oRBmW/niI2S6o8crcZtZRo6pN5FlG702bBU5lDr42HKih8ZMJTxQEbFBSUMt5CGDpfo27b/PDb8OwRQ9+If71CZPFFMoKvFGf90zHXIVk7AvU7BzVUl+Oniygv4ClVajY6hIh8r8LhvMr9sUMW1hB6QONV/XYdykaKtZK3PFDxMI63/Two6OCbz5IArcjaP95QZsR2xoiqj0XOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZtBAGwu9HcBQaA/T5+ExzFuKchDOOisR9OSoyQDd1vI=;
 b=Jeu8LTUMxCsJP7PxGsvUEDgkxRd2XymN9IcxOtsEpqCl1/FcymNVz+HO25oHTMpF71xoVgG5uZPLSI2RTGV45+kj0psKNKTQxA0om3dGklWOWyu0HkPr24WV3uAnYLQboji4iVkJUBa2J5nLIv6yTG7DbawlL2WkXizR2ZREQWRDBFrtQVozfD8LrIWbTk8gV2boluk1V+tTzLoZi9na7FQb4PVcwG3tKkmesw3OU1fD8wYUduCp9xfCEezbG711F0iWo1L3ZIrSpLDC1sT8NLLvA/pBtxok0DOnp4IPpgUttAna1xrhkMi55eQor23WOBcnTF5FghytFuaN9hS3eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by DM6PR11MB4530.namprd11.prod.outlook.com (2603:10b6:5:2a4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.37; Tue, 23 Jan
 2024 13:18:56 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107%4]) with mapi id 15.20.7202.033; Tue, 23 Jan 2024
 13:18:56 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kallapa@windriver.com,
        Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Yash.Shinde@windriver.com
Subject: [PATCH v3 5/7] rust: Add new tests in the exclude list for rust oe-selftest
Date: Tue, 23 Jan 2024 05:16:31 -0800
Message-ID: <20240123131633.641012-5-Yash.Shinde@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: c94df12a-d619-4e14-1caf-08dc1c15da47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KjwXIcEKlccyIEDCdgJy9hWByBu6XIWpSn7jjzNMZhHfIDNKq8koVSAYjngYDk3WeGNLN2y0+aaDe/dyQDer7h9Z2kX7rqHJWDtrP4sMavHrytGm23EXKmCZtMF1Xv1WLfD43YAC8FfwqyGRrHb+9q+r57jPmatgx1CCpcObvmcahL5zF/rMhtdz5NdPljE+mzBIJFJZXedh89hHEH7UjKv1Epzt2hAu6hV7K3UV+oYeEpmJtYeh2y+uT3RHRBY7Oz7hIJcBZ4alYhR7EKq3o/f2dohZ96V4o3uyY+LpShKJ27A/QXEynldVqK3udY9turi9ASB/Y2eomDLDXpGLCKH8e531rNlRMl/2JZHJWJjp7j5AC4tvk+pTyypyPUdoxzIy0gcyC0eS4bYFF0/gdEIzK9XaRiT4tew2mBSOvnNveEjrlQyOMSxvWiWLMNeUeOOBTj181pOdlRPcpQZ3oXNFSYmQjlqY/mkuKlweSgkNkeeslS36S51DFcg/SmV0VfAG9gAWR7bCMWxFePI3i+NaVkU2qtK3RwgDZ5IwLArCjZyMP6iqRKV7A6Z7wqjgWR8SHwIsePnXsYXYsYM+YCF3Oe9EaGV39XvfX6ymOKM6qmRV8mJbg1G0Y68RYc+G
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(39850400004)(366004)(396003)(136003)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(2906002)(6512007)(9686003)(26005)(86362001)(2616005)(4326008)(8936002)(478600001)(8676002)(41300700001)(38350700005)(107886003)(36756003)(38100700002)(83380400001)(66556008)(66946007)(66476007)(1076003)(316002)(6916009)(5660300002)(52116002)(6666004)(6486002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yjpFpJIh92A7tmEqpiS5jeKFQIhGZtODI8bOV4N5tiUu3kqJXqwfvHtmV6s3?=
 =?us-ascii?Q?TgEgxu6EnZ6nHXqE8z5VAsAe17RgxHrktT0l4zDOwN2c5OqW4tbObjHAWKSU?=
 =?us-ascii?Q?SaXVNkdUqtEr7SjoTYGET612USFG3wZKfzcgZxU6R75HwFdlmG9l/dvi1rE7?=
 =?us-ascii?Q?sFOF1dppXKJDITsB2wJvVLwsA6OxtZls1sB/raIBAr8sHWN9rJYZKHVNB1Lx?=
 =?us-ascii?Q?+uFVpsPqYi92xyAjmSa8lhwCriZ94uA8yaqVgpHspw9FJPUz6HwS6LAVLl0d?=
 =?us-ascii?Q?/qKOTG52gqY8Ti158RCLEzl+/df1SE2TSPiWIyFrLXsuqYdq4KR+ApKuYH/B?=
 =?us-ascii?Q?3nBoqEys2WTWK7evIcyo7bMr6SlQKKWPJA4ZYsiwyH219MhNx7TEYbJV7bB/?=
 =?us-ascii?Q?WtZOSkFp38VLPhVvHXONo4/CISB9/ENevd/+utbhzZToRDFM60tdtJaMcYVu?=
 =?us-ascii?Q?1rMNBxEXnzVwjLWXMCMvuA+4ZsdPKIu/6aOIS5iBGXopWFt/IpblrNLbfGIm?=
 =?us-ascii?Q?QSlYWy700b1rtpc78cfAu+IjG/AsXQ1DjTnBTpLsBgaRhlQODuUI687y4g1/?=
 =?us-ascii?Q?sT3SoBw2KychzjDwnK+bhKuoTi2O45XNBZlXcdtWW4a+SpuCFVfWDdtsYRDd?=
 =?us-ascii?Q?q137ktYr7i3/GZpijGtDUh3NROPMva5m4ZO3En/G52b7fdpqyie+2XJw0PPM?=
 =?us-ascii?Q?nF6LMY+xXSl4+9h1DR7rRGKpL8f98NcO4FMu39k+iBfnHz3Dyg/wYXYND0ZA?=
 =?us-ascii?Q?XTXnQXH+2oscmIhdZan+xVKyGenm9TPEJKrHPejP3b34+Elf+cR6RMfbV1AL?=
 =?us-ascii?Q?n/6vM+iP9dgPb/4GJoaqoqr75qjbT5Oxhu/xeVUxAGhUpP6izc0F2u46Z44a?=
 =?us-ascii?Q?E3Xe0JzoxPxRICmS7DkrEfZEEtMnh86mdUK4/pzcbZ3olLCz34bXxXrD+Q/t?=
 =?us-ascii?Q?BZaC5Q4SXnFRob0nFwODTHBS2CkFOQeVlrPqsMwlLP5anynll4E4OCfQk2pl?=
 =?us-ascii?Q?3pUcP4I36sQnDcf51BoICDuF7ivGo0NANnqSlAB3qLC4DQ/zFDUJWlfQF0kf?=
 =?us-ascii?Q?6xjQYQi5M+ph+NTKm6eHuGDvmrnAg+KhHBrjIiA2K/N1YbV0CbrgunG/bt46?=
 =?us-ascii?Q?Talqvr1Geqm8Gy/SWzVq6cgUobYyy31PPxw6F5/TNuM9X4Vb7JwcxI8u/wM/?=
 =?us-ascii?Q?preVkAi+n8IRlFL/23by56IgrWj1yrjlQSOlGY7RqzhDSDaYxrVsgln/gthB?=
 =?us-ascii?Q?a5AeyG5+gaZDsSyuV9OU+T2wKTTdTg1zdB7km89lNhbg6qcOhVmTCMiU2UYZ?=
 =?us-ascii?Q?IAQ0Bf076xcYvtzsTZFiXN0X0DtllD3AzCiessr233DwlEGsUh9E789zcPVT?=
 =?us-ascii?Q?nAXE6ZSY7a986SSzc4U3GPTrzrvh4FdyYA6hketT1E/8KfRB5ZJf34oINQyM?=
 =?us-ascii?Q?oJflvp2+oR1mUpLkN/mHoVEkymIPsqqTCv6nh5XS1VDQBBQpr7/nJqxSXEyJ?=
 =?us-ascii?Q?VD+ma9hFh3VzLrcaKWcBEW9QNmmhCfJNyM2VarF4GLr+GL7waFHlIjTADQxH?=
 =?us-ascii?Q?U62HaWauq+BYYgIxeFbl57x4zmEGFeEWY8bGQvuz6UdCQdGPSg4gWtpyGjA+?=
 =?us-ascii?Q?kA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c94df12a-d619-4e14-1caf-08dc1c15da47
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 13:18:56.4260
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jXrzNLEBR8Wm1pNztSR3MisnKPR3yJQZ0XQYd908oGHSXXVbg1nxLPt3HyOwUryDF0Maegm1SoJOsY8hv+IhKgdKDM75jWiYpZ/PThfUY9o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4530
X-Proofpoint-ORIG-GUID: qHxirwVjv3ey-YdwdhzVDyG8C38_SQjA
X-Proofpoint-GUID: qHxirwVjv3ey-YdwdhzVDyG8C38_SQjA
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194232

From: Yash Shinde <Yash.Shinde@windriver.com>

    Add newly failing tests cases in the exclude list for
    rust oe-selftest.

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 meta/lib/oeqa/selftest/cases/rust.py | 37 +++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
index 6dbc517006..7ad6cd6be7 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -262,7 +262,42 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
                             'tests/ui/process/process-panic-after-fork.rs',
                             'tests/ui/process/process-sigpipe.rs',
                             'tests/ui/simd/target-feature-mixup.rs',
-                            'tests/ui/structs-enums/multiple-reprs.rs'
+                            'tests/ui/structs-enums/multiple-reprs.rs',
+                            'tests/mir-opt/',
+                            'tests/codegen/abi-sysv64.rs',
+                            'tests/codegen/call-metadata.rs',
+                            'tests/codegen/async-fn-debug-awaitee-field.rs',
+                            'tests/codegen/issues/issue-77812.rs',
+                            'tests/codegen/debug-column.rs',
+                            'tests/codegen/inline-function-args-debug-info.rs',
+                            'tests/codegen/binary-search-index-no-bound-check.rs',
+                            'tests/codegen/fn-impl-trait-self.rs',
+                            'tests/codegen/enum/enum-u128.rs',
+                            'tests/codegen/abi-efiapi.rs',
+                            'tests/codegen/issues/issue-73258.rs',
+                            'tests/codegen/llvm-ident.rs',
+                            'tests/codegen/drop.rs',
+                            'tests/codegen/intrinsics/transmute-niched.rs',
+                            'tests/codegen/issues/issue-75546.rs',
+                            'tests/codegen/debuginfo-generic-closure-env-names.rs',
+                            'tests/codegen/inherit_overflow.rs',
+                            'tests/codegen/asm-powerpc-clobbers.rs',
+                            'tests/codegen/align-byval.rs',
+                            'tests/codegen/inherit_overflow.rs',
+                            'tests/codegen/dst-vtable-align-nonzero.rs',
+                            'tests/codegen/move-operands.rs',
+                            'tests/codegen/align-fn.rs',
+                            'tests/codegen/abi-efiapi.rs',
+                            'tests/codegen/issues/issue-98156-const-arg-temp-lifetime.rs',
+                            'tests/codegen/debug-limited.rs',
+                            'tests/codegen/mainsubprogram.rs',
+                            'tests/codegen/enable-lto-unit-splitting.rs',
+                            'tests/codegen/intrinsics/mask.rs',
+                            'tests/ui-fulldeps/',
+                            'src/tools/replace-version-placeholder',
+                            'src/tools/jsondoclint',
+                            'tests/ui/numbers-arithmetic/u128.rs',
+                            'tests/codegen/repr/transparent-mips64.rs'
                         ]
 
         exclude_fail_tests = " ".join([" --exclude " + item for item in exclude_list])
-- 
2.43.0


