Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1871C47E49
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 08:10:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.7155.1705997445799241107
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jan 2024 00:10:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=WeEJ434Z;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=175275645d=yash.shinde@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40MC8Njc028902
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 08:10:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=ZtBAGwu9HcBQaA/T5+ExzFuKchDOOisR9OSoyQDd1vI=; b=
	WeEJ434ZNhlo7VXT7IqHndA57NQCORLpEhuiYdxin2CmEx8kIJZ7dW+zl/92SvrJ
	QyVybHKAMAgUa1iwED3Puv7JFqAj7Aykmz+tEUHPfzjd3doXE2y9j4yO0/s6xglP
	w7UiyB4q6UAfltmymKNj1N7LFyhQcoqo9eP8VwRNjz6/7g0dytva1mzSHhHKwUQE
	kFGimRgDFS90p0cGULZ0wyZzeSjHG6dIYDGindVmcGZMP0qF/2TpSaFHV2G0ZWgj
	LMi6U6C0r4SpnRcjBemo6OCiQPohP/Xb7Ff/KF6AT4T3Y6HjrumvxAGughen3gHg
	ZmLUcXSJRSwGZy1Z9Cl2qg==
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vr55734gq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 08:10:44 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=duToqrjzT7A4W0342HTDraaK5evV2vdf6C+omuescCyFieKZsbblM3uC4mGl6lC37s+RfuBD7YkpqF9NjxjQu1RpwDjmA4PuVq9vLpwq8WGi8OP8m26uC9UU6VITXTEYU/q+NH0KsjCsALJOoFMPsTfbeDl7fwz4mQ3MQEtnKqmSVWCJ480TLez2Y/AWpUVF8q6h/s87VMFeUkW40Jb+jW7cOjyI3qg3UrHF+ykD+HS+0Glt15qowXXVKItcK7dVoQjd28ZdveEwIz3VT1MFwjza/fsP6JInLEiDubpSmlZvtMzmIO7Mm7qnBGoGqHo/23Qswlxc0Pb01+6kK2UQDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZtBAGwu9HcBQaA/T5+ExzFuKchDOOisR9OSoyQDd1vI=;
 b=IT/kURCujFknVfMgDNj33JE2/HKKD/my9TO2+h3HtppTWpNuasFf/tg+a8N+OqDgbrL/Of4LgE+4g1oDl+psdlHouipQv2PrOyIPFIVjBOS9aY8HvrVf7sx+TLKFuRjQuezwy5KWda+f4pxY9yS09UDPxN09ZO9CweF4f1eDbAUT6kdGw0YibZXijvYBGcqxTS/QbCsUVpkJn3wwFQDkfiPh2Fa5uzIXvzXy9Dk0frmMCfOCXIp3XVL7xr3jn9DN4mvtkutjXVCilX9Gjm+YVsGj/gF98wvbKXkzefImdvu64f0yluaCoj7l8qBwD0t9qtnI6j51mM6eXVN9ec/mWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by CH3PR11MB8344.namprd11.prod.outlook.com (2603:10b6:610:17f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34; Tue, 23 Jan
 2024 08:10:43 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::e90b:e018:1b70:f107%4]) with mapi id 15.20.7202.033; Tue, 23 Jan 2024
 08:10:43 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Umesh.Kallapa@windriver.com,
        Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com,
        Shivaprasad.Moodalappa@windriver.com, Yash.Shinde@windriver.com
Subject: [PATCH v3 5/7] rust: Add new tests in the exclude list for rust oe-selftest
Date: Tue, 23 Jan 2024 00:10:04 -0800
Message-ID: <20240123081006.3310715-5-Yash.Shinde@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: c82827f1-564f-4558-94df-08dc1beacb68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DCn6hbomKCDWSeS+zxKG24HEEyx61tkltRZF1G2TxeXoS9cfhxbD9G5G74PNFMDRQwG1OV7IJmM0dCB94pT3Ip1nPIo6hRAWDoAUrQcl+2soDeYieQB97nPTgYjr5oPo69a0KhJDapeswen4pMwi4xP+NSv94SVZRQZuCa3hCxTa37w6p6mqUW499doB2js7XPmmPPRzY6rN8nYhKkbKxQrXMzbGsCJFleizU3doKVDchE7fkAq+VqkDgaMJyf9wc7jzPdQpJY+zfHLgJPe6B4UQ0/ClPV/g9btVcM5lUxEQwkVz0thj0LTpo90j2O6xTVpprXpaVY26BL7A1/R6x3ylN0gC0pND8w4EJyKj4RLYSo5+rslDAS2RB21u1mn5HvRezCdRIISaIlrQfupTpWp+ohwNfUofWnn5bpgUWgdvrUQyXGIKdqJG37PmhtX4sH4MDA7ImHPvn51kgTdTpUOzdYtNu3qNtLpxYosA1OD//REkrGDJ9nAj2y/ok2S9uvuJJd4d8mWGcCsR/UTXbQNsjleiXtzCKvuVjzNB8SgKbmNaThCviBIFs637XUs1MS7D6BGH+ZnHcAM0qzfB7HDg/dEpYyS4Gx+AcoiTVY1nmcvLWJ9GkCagoxwbEKyN
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6129.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39850400004)(396003)(366004)(136003)(376002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(66476007)(316002)(66946007)(66556008)(6916009)(6486002)(9686003)(52116002)(6512007)(6666004)(6506007)(5660300002)(83380400001)(8676002)(26005)(1076003)(2616005)(8936002)(2906002)(38100700002)(4326008)(478600001)(36756003)(38350700005)(41300700001)(86362001)(107886003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?JI/ulShqCxGyoSTOO4LARR9kkYBczkVwasbnz3FOJrjkCPRQFrbOHbIyIm7J?=
 =?us-ascii?Q?v/+cPX8hLtx5YyD+LHHsqd551HYpe2PALaO1VHPHCsdRAEuSZangf0MsZAFe?=
 =?us-ascii?Q?uc1IrwyVXecyGu668CFW0Xn3rb6U5mUtC+Z2F7SY1IAv0Jvojmk8qT9gw6gv?=
 =?us-ascii?Q?MeBQFEUZZpkZGDSQrzEFkSS7dNXiIXG/Y0LfXbZWe7nWHOMwnifZThMWcXxd?=
 =?us-ascii?Q?oIeic/+0txsg+SMNT3zXa+P9yc2z7r7Xflhik2JnBjhivD0rCUrT4/tPDQqa?=
 =?us-ascii?Q?DaGLWRGCMCQnRNMu9lGvPkTkSuunfW/4D5RFl9IplQxUz1v5+UxfCJOtdCgL?=
 =?us-ascii?Q?uL2FzHwveLRLNDT/3YHZJ/7Yy1PREC7PYJg9gPOFrdue5TYnAPLVudU0eB9Q?=
 =?us-ascii?Q?4WvWAXZzXw+aLAhGbVAFlQKa6u5qLk1i172cXey+JoVtvIrTNSSrnJd9lMRl?=
 =?us-ascii?Q?XaNFG43nJ+XtpWDO1U/wIbQn+gU3KXRsYujBSwmYewpSIjzjwLl6rvo2lAGF?=
 =?us-ascii?Q?qPFCycqxQrfxnsedNwysXA6N15FgzSRNF0o2AYOcBR4saF0YE0AzXqgISwKq?=
 =?us-ascii?Q?yc9AOEvttdHZm0U3bx9rlEnNyXwl2b+L5CXHo4tny8Ja5A6a997UsgwOunHX?=
 =?us-ascii?Q?cEjAEposmfhCcKB9s9++QO1xe/GFuBUpWFHQO6ZOev+G334mVSNY7fdQK98N?=
 =?us-ascii?Q?saD0KLzIztIOYnHc1CFuX47csaa39jbQorXvHA/TX0zoQpKt2ME3Zf622PtK?=
 =?us-ascii?Q?4GDBoMVlvPkNyEhxLVV/Tm5S8WCZvaxpcNNTvz4Cy0d2YcGoNAHaQ6E/w5Yr?=
 =?us-ascii?Q?NsX8Wtu76MPdJCG0ks57G6oFZN3BPt3u7vDwNLugdvJD416iwkSoXCxw7R5i?=
 =?us-ascii?Q?szBJ/zpR5iR1seFoKHP5/AIxL5WqeG3VFRH9LdRD9QsMgCxNnpRO9OeT0/Nj?=
 =?us-ascii?Q?g8vceEIOYHLa3wh4v+0+GDmSkB84B7arLxEgCndgnhOXWEI/XTQ8VCxSCS6P?=
 =?us-ascii?Q?VPbEWxDHC/BhJrK49ZVwiQ144AG6bxd3aEg1aK9QqjiiRiBYZah7gHAAyYnl?=
 =?us-ascii?Q?aXBrz0pkWQWBFgduMsTBI3b5GlchooQJeXgenaIgAZFhX4ry5AlAHd9p8MFg?=
 =?us-ascii?Q?hxcPZSSfkFEwpsJ/VUHMUUEvggCfVa/Dbx87mebLQ1G+PxojaEHQMfgEuDXz?=
 =?us-ascii?Q?Fvw8bXDsx/fM/aMoLVB1IzabMshLdCAvCMcrcx70J9tkH5GGau0/uIlHdFdu?=
 =?us-ascii?Q?T0Oq7aQpH42k1hQSJP9ZHoEk1e4pClyIOt5uPPEN0Owk5Jcj69qxHjyKB590?=
 =?us-ascii?Q?0YUMzIOEJv4NYRnsae/xDW1ThuLTlzvHqNVnVrM2O0RGgGkY9OUCCDPUYmYB?=
 =?us-ascii?Q?Nwws6KApQtotu/g03NQh/TRPU4UUj7KXqXaeb9xEnxzohkgPvKlnN0iih15A?=
 =?us-ascii?Q?EWesCrw1xUTMA8iDjQnaUZ7vWt57zN4W+6fqbnaWjK0pTumCVqowdQnkgkO7?=
 =?us-ascii?Q?PeZK1sQjsk8qiZMxYH2nJQogN2RyzVcmG9Yqghy1oG/fBjLhoMrq3g2t/Nd2?=
 =?us-ascii?Q?t2B6MIKNH+6NDdPL+oa2htjqhPoEg9pDR+6p8XC4bmjjF8k8sYvF7OFJACGO?=
 =?us-ascii?Q?Zw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c82827f1-564f-4558-94df-08dc1beacb68
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 08:10:42.9927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yXNaY9N7ZFV/SzsnZTA4TCDbjr5PeKfP7E0Wjpr8O/ebePMocnyzZbsmRIWl4jaJcyzwrigUPBH0RrEgY+Wjz9DJvVOLZ8tJrs/aBp+tD0w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8344
X-Proofpoint-GUID: _7phZVg5-bCYbNiQRUwBQD42Qiu_HwPi
X-Proofpoint-ORIG-GUID: _7phZVg5-bCYbNiQRUwBQD42Qiu_HwPi
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
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 08:10:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194210

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


