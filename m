Return-Path: <kexin.hao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76F99C4332F
	for <webhook@archiver.kernel.org>; Sun, 16 Jan 2022 14:52:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.33834.1642344749819455485
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jan 2022 06:52:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=IBC2GrBO;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=80157207cb=kexin.hao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 20GEhVXl030928
	for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jan 2022 06:52:29 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=wf3TwhgSDErCPb1WwGHvN3LgVQkxdIW9yiEnbAwCO/8=;
 b=IBC2GrBOLJ4PIOHCCWhGS72KciiysbsqdNx2Zz5OprlhOQi4tezRUHJetXN06ndpcG2a
 TK/3BlQNZk/P0ORlnpTGUERlAU7IGeTZYV0p+fweOSA2RX+WuxHeqvlILVMJ/9fo3wry
 mO60YpBlKUc+tiX6WKuaM7l9US3guLBUhTpB85OAv2TsTQzc1FOfDXEmrqd20WLXepwZ
 bZLim44bxjrnp1vTXPC3bliHyq+HxA16sFPh1XKOMMvBUb54/dOrsX9n9EDYf0yRWnU/
 iNiaDFg7d/9KllSorIIPVpyv+yRXkUisLZNfBdOXuvt7Ey5TuMrYi1p+Rg+lgWmsWeCZ zw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dkxnp8j3p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jan 2022 06:52:29 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 20GEqSqe018694
	for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jan 2022 06:52:28 -0800
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2040.outbound.protection.outlook.com [104.47.57.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3dkxnp8j3m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 16 Jan 2022 06:52:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K5azW6Nkm5++s6Ir3kDMLBnyiPjz0qWZ1hEjUwlplhPBPh3HbwBWMFBBF9cJclBAbIgqcjAyyi1dlfae/AHRPE6ofRmc5AjBI5jiqb7iz4P7GbnPpfcF/SgAQglfvdPMk6DNPkZ8ons2JpBeDHTO8zXSZPjPWKbgaO498oaVuuwvmE+5urCLTCtIN0YbaYL6YNfIzzN/i3JYQikfYM6S9RRh+5mtAwmNg4s7bDyOEfEGnXTAPToLqE7PhytppGLp2Ob589XxDdQsRkY86QpMf968vaThW0uOOK4fMbp0jB8LRBPTExWDLLcu+bEId74NyqNImdZbpwr5s3b8AEWf8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wf3TwhgSDErCPb1WwGHvN3LgVQkxdIW9yiEnbAwCO/8=;
 b=JNlHBagraV8dNgS9Uv37v0hUYadnS/muVPDjrNmnTbKEJ8GHjK7Lv5n9RfiLt5qUobp7hB0cVbqHOZBoK2DLrCRH+KHWNCHJT34t2Liy80IAaTpPUMVqbGIVFcxgg3sG4JTe36kwA7TTp+gwo1og2y2l8ldHhf/d1KsUG/IrY6WePvT6kxccrJOm1PK32TgyG00aZ/NvEG3FE9owPzA3efmlDmViD/USbZVSlEC1ZCnO8vbxpUCyEZ5t0SyNOYWVlqQM40rOvMa0SuzWKBifuL7k74wycS0ZHW1zCgliW49xPDMIu0W6eufne3oNoHxrOn+Y04TtEdItPeVrtnmeEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA1PR11MB5899.namprd11.prod.outlook.com (2603:10b6:806:22a::18)
 by DM8PR11MB5654.namprd11.prod.outlook.com (2603:10b6:8:33::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Sun, 16 Jan
 2022 14:52:26 +0000
Received: from SA1PR11MB5899.namprd11.prod.outlook.com
 ([fe80::ec6a:319f:6956:24ce]) by SA1PR11MB5899.namprd11.prod.outlook.com
 ([fe80::ec6a:319f:6956:24ce%8]) with mapi id 15.20.4888.009; Sun, 16 Jan 2022
 14:52:26 +0000
From: Kevin Hao <kexin.hao@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Anuj Mittal <anuj.mittal@intel.com>, Randy.MacLeod@windriver.com
Subject: [hardknott v2 2/3] tune-cortexa72: Enable the crc extension by
 default for cortexa72
Date: Sun, 16 Jan 2022 22:49:08 +0800
Message-Id: <20220116144909.1924922-3-kexin.hao@windriver.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220116144909.1924922-1-kexin.hao@windriver.com>
References: <20220116144909.1924922-1-kexin.hao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR04CA0062.apcprd04.prod.outlook.com
 (2603:1096:202:14::30) To SA1PR11MB5899.namprd11.prod.outlook.com
 (2603:10b6:806:22a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2433e1dc-2a55-4a0a-4554-08d9d8ffcfb1
X-MS-TrafficTypeDiagnostic: DM8PR11MB5654:EE_
X-Microsoft-Antispam-PRVS: 
	<DM8PR11MB56546759433D5A2881C89E29E2569@DM8PR11MB5654.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hQtL7hT3ZaBm6bwjAzY0VMMgq4PrQ6Glhdx8R4bWcRWiCl4UGXsng4A8T3bK3zK5bIA4SfBN54Pm4Tp/XzEZYsI1ZuC1xv8IvGJxOjdkaNzsXMfgj5yU9USWUMGiMln19BCjL9d4XeHs2TWUb8lQthfSIJDp6KwxE4CghBhILzddwbAISMvMEZwSVCywWMmkIxvjssHSM8qgncBxe8ug1CP3a2R+1sqVHAF1NLp4trPCTcqljwaXHTMSuY9QS5er4F7MAIHwrBhnw5aQnltd9rw9ctVUOezg5Cm4Y5DM/Pob1th9Miq9KRVS+ESr4LQjUXRMLp650WqKZFxUKpNIhXksC+uyPXfac7c2EtcuX1K3BOBQXhD9QPPdYAcyQx2RPnzgJJxOx4geIz0XxPLMMI3uHhA9Kftjzo2zlcaGpkQNHiK1J/ApsSYBDD8bjPXwHB72CumS/ayBDGxo71QmT4F3V5fl9AjEZ3Ae4J9niXeI0rM2EddRcOMYxjtFTLTf6D9IclU66TSYUwvbRkRo4YwEjkFZ0K1eKrnp7P0WAQnoKtcGQt/+lKRpgSm/urusOrMzt9fJShSVkOmaEUmDeVV6/CPN9Tj7Ad7NQAt2YcjwIQ0tOWzQQL/rxFr4Ph14fIR0xYK5rnFKDEXnrN/m9otszqlLfzFuU3wd7Sa+X8jrFsdcy4v49dAEVmPEX7IFm/LA7TqE/38H7u9K7p/YWQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB5899.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(52116002)(5660300002)(6486002)(8936002)(2906002)(186003)(6666004)(86362001)(1076003)(6506007)(508600001)(36756003)(38100700002)(38350700002)(66476007)(2616005)(316002)(66946007)(107886003)(66556008)(4326008)(6916009)(83380400001)(26005)(6512007)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0A1/FbIETxfAUjdvSuA2odrOLS7OLkTNDG24IurOvUyiYXLE+ngq84h+bUaJ?=
 =?us-ascii?Q?UFOL4rzVdQxBf4TjFK/Ge35eZr082qGiAG1tQ28mX+w4GIWyjpqy+wv5pDG2?=
 =?us-ascii?Q?Lx50ERPJ8AUnjAbnV99r7Vnr4juQqiulhsZW1FyCZPtAEH3ed9dcNYpMLOhL?=
 =?us-ascii?Q?llNMUaNL8Iew7fnvNcNhIZN5Wv3O5efHP5HSCChQeJqgtc2cZQNpGmFxipaS?=
 =?us-ascii?Q?FuA83R1xcT9RvAAfP8swjavGFU+eNYK1Gmz+YQvPPkBgVgDkNqxcYoV4k8pd?=
 =?us-ascii?Q?XcXb4b9OGfH5k1nyCuGZBZvCQyxYBtAlHgpfqjfudfkWbA7PlqUmaPqKeIUV?=
 =?us-ascii?Q?StI5hBivRDQQqNn1V0iU2/ZD9hvAnNYCtbAw+dn7pZZwLGMUNrn7udi4XB0f?=
 =?us-ascii?Q?O7Brou7ZrpoZfooKZYJHo5LK/QijFY0OdlEt2qIc0wZx5Uiu+ZJlmvxjil7s?=
 =?us-ascii?Q?OXbaa1Oq+kTJcp6ee9pb/fYkN8GyaZ3iwWvr0cLUqQ8T4chHs9aE4+Q+/KWz?=
 =?us-ascii?Q?q71FTa69q8teKyqCqpgDxMI5rcL3aLIXp84nHPP6HWx38sYAqWhapGd1USGi?=
 =?us-ascii?Q?ogsFXadXcqPJvH/mX9Z3nOnzmU7+FbSOpXuAu+ldoDc8ixNhsfyhrrFwksp8?=
 =?us-ascii?Q?67HjJ/sIQ0dx0VyFAqVaSXmiNESY5kpxQfWEQNSvQhLhbEha23x0uUyo8qk1?=
 =?us-ascii?Q?HpJgwbXgY8xy0urFYlTv3MW/TOrTIKWbq9n7HBcY7yuTnXse/fYxix/Vj/BH?=
 =?us-ascii?Q?FRawZDc5QmFpHZ3YWUJK+Viuelp/+CVyilNFHOekxupH0uin53CpTKbjUY1I?=
 =?us-ascii?Q?ZE27zTcJfQXoqniJlSZsQP4QgOBsCCo+tTyV8Mkx6eAJ1jcB7Z5oXIqy74Q1?=
 =?us-ascii?Q?rncyzES5BUjekoAbL5UvB5Sb6Rxp141nESh/KtpjwtJGiLpPdschWZMdCA5i?=
 =?us-ascii?Q?7Ss+Fc9Mn3dDPFL/nppZxTp5419vf1pDXZBV0QKMOL5YhreSCVoqIVdWK2CV?=
 =?us-ascii?Q?jMifhCQQ0AY9M6/jYSMxrat/fkkHxQVIbHkIRqNycTNRMmxJfPwvwzzC7FF5?=
 =?us-ascii?Q?itcY48Dn2Vg9jaAlSDV1ocnREL/aWRthXTcF8tpEyxPkHEQ7E9CDE7U3kKMZ?=
 =?us-ascii?Q?50CRhQJPAyt/sHIXhzKcuX8Ybi1cSzEGjSj7yPITRKkInodu8p//UrsnDCJ0?=
 =?us-ascii?Q?wJlqcQtb7388iicQlsiewXZ1xjXkPnsQr5x3upa98ZqPnp95hOASYn9tcr1M?=
 =?us-ascii?Q?DcfZHneli72RGGOkMwupvxKqb2VSNgocaAlhcDN3r4r0O7bXtXeeRVoAuM0j?=
 =?us-ascii?Q?/6pbhXFW2Ma+lk8KT5h7xNq57SZqw8876nb4HtvQaaCqqt63UyoaJ6Ta3vPg?=
 =?us-ascii?Q?QlwBBErXe0J3dDlgrCG8kOG9DounyZfvLKsseLZgufXWC0RVxkwaXxYhzktI?=
 =?us-ascii?Q?4h/rrNJjczUpvDq3wX5OTibvJ0EuGadHI9k3ZU3W9IR9rUD0qyjnJ9VxFbB/?=
 =?us-ascii?Q?GwntzrmNnDtMVOLHXNW2n9D4ORydhGXul4xL1u3LqYFB3960qNjlr5dfGML/?=
 =?us-ascii?Q?1TQb/Lb/aL1DDVdM9qCBRKb+48ikIbwaXZIefWkOA4c+ovkfCMlcBQN+N561?=
 =?us-ascii?Q?skmZDoD1t9dPrTZFAyv6TE4=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2433e1dc-2a55-4a0a-4554-08d9d8ffcfb1
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB5899.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2022 14:52:26.3636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 8bzYaWjjXH2079kCY+eIgMIsEs6o0yVvZ77W0iCMPXiTqAC15Lcbo84OY5aoRgOpJS5xh5TRUEX1oyXPlD5LUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5654
X-Proofpoint-GUID: HLBTKGuq85PXncy06EfON-L9cB-h-pzc
X-Proofpoint-ORIG-GUID: zieP5cndy6aZn1cu7LLD20I6zc0RYrAl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-16_06,2022-01-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 mlxlogscore=698
 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201160097
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Jan 2022 14:52:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160610

The crc extension is optional for the ARMv8.0 but is mandatory for the
cortexa72, so there is no reason not to enable it for the cortexa72
tune. With this change, the cortexa72-crc seems redundant. But we
had better to keep it to be compatible with the BSP which already used
that tune.

(From OE-Core rev: ca50267ab568d2f688844cb7c6cd867ed34168db)

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
[Kevin: Convert to the old style override syntax]
Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
---
v2: No change.

 meta/conf/machine/include/tune-cortexa72.inc | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/conf/machine/include/tune-cortexa72.inc b/meta/conf/machine/include/tune-cortexa72.inc
index 7608a20c43f4..30480efd8328 100644
--- a/meta/conf/machine/include/tune-cortexa72.inc
+++ b/meta/conf/machine/include/tune-cortexa72.inc
@@ -10,12 +10,12 @@ AVAILTUNES += "cortexa72 cortexa72-crc cortexa72-crc-crypto"
 ARMPKGARCH_tune-cortexa72             = "cortexa72"
 ARMPKGARCH_tune-cortexa72-crc         = "cortexa72"
 ARMPKGARCH_tune-cortexa72-crc-crypto  = "cortexa72"
-TUNE_FEATURES_tune-cortexa72          = "${TUNE_FEATURES_tune-armv8a} cortexa72"
-TUNE_FEATURES_tune-cortexa72-crc      = "${TUNE_FEATURES_tune-cortexa72} crc"
-TUNE_FEATURES_tune-cortexa72-crc-crypto   = "${TUNE_FEATURES_tune-cortexa72} crc crypto"
-PACKAGE_EXTRA_ARCHS_tune-cortexa72        = "${PACKAGE_EXTRA_ARCHS_tune-armv8} cortexa72"
-PACKAGE_EXTRA_ARCHS_tune-cortexa72-crc    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa72 cortexa72-crc"
-PACKAGE_EXTRA_ARCHS_tune-cortexa72-crc-crypto    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa72 cortexa72-crc cortexa72-crc-crypto"
+TUNE_FEATURES_tune-cortexa72          = "${TUNE_FEATURES_tune-armv8a-crc} cortexa72"
+TUNE_FEATURES_tune-cortexa72-crc      = "${TUNE_FEATURES_tune-cortexa72}"
+TUNE_FEATURES_tune-cortexa72-crc-crypto   = "${TUNE_FEATURES_tune-cortexa72} crypto"
+PACKAGE_EXTRA_ARCHS_tune-cortexa72        = "${PACKAGE_EXTRA_ARCHS_tune-armv8-crc} cortexa72"
+PACKAGE_EXTRA_ARCHS_tune-cortexa72-crc    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa72"
+PACKAGE_EXTRA_ARCHS_tune-cortexa72-crc-crypto    = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa72 cortexa72-crc-crypto"
 BASE_LIB_tune-cortexa72            = "lib64"
 BASE_LIB_tune-cortexa72-crc        = "lib64"
 BASE_LIB_tune-cortexa72-crc-crypto = "lib64"
-- 
2.31.1


