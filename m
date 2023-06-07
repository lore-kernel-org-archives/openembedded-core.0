Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87EFFC83005
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 09:36:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.4344.1686130589869845606
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jun 2023 02:36:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=552229a68e=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3578SAe4013180
	for <openembedded-core@lists.openembedded.org>; Wed, 7 Jun 2023 02:36:29 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2103.outbound.protection.outlook.com [104.47.70.103])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r2av78ghq-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 07 Jun 2023 02:36:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QfXONEziQ2aLehWeYpxMMTAaKOCAT2kjZ2K5M6mG/0ySCsLztEGRhJBCAQbSx610fZexRXWUkKdmdjmcqcnMMtm0lYS1FjP+0+OjJiJS3zL899sRkBijRB57MU/YIEBULmA/24LQp2dN+PQ3PJsftqJkTdALZ1IgfBLUWniZHYhmoHopKGLGDzyCnfOoTEyv0Pq2Y6J5w86VCEjRSGEH1/tGo1hFLvVmoMps/nUImu4adAKmsFYKWI1vTowHFgdIEITw2aMw4sgd9F4ufiMcCfA5JWh073uDoPjeYPMmsh4Drme6ujZbNLuauCn7IGQWm6jSBPvGhsUZTk7C2jMSvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JprMdkzR8KLc0YqA85wsHMfjWv8fsyctDUawvm5MTRA=;
 b=S2P1DU0zJ0VVkOhegZJ07oy64HTmeIJj9qdk4z4iR/oBm7jTryE0VwTzedlAitkT3JtW00BxNosDuMr85IRzvq/8fofLtjn++0+TEqyg02LrrHYOF+/VafBuB++r4qiLF8oMlMwsd7XvfC4AsbKuDYgNzZWrE5TYuZXrvTg7oNvODeRLcRSZGKRuy1U259jDcc7NMuHV4D8N9x5EmdIiIb21kSR7XjFF+86xf1ezPPc1kPKH+8CeXujvT84FEZNPeWtBt/WInxr5ktr4QbXZmiMc4888AnB/s2mrUMbotlE4h3mPyLIMN4UojibGZ8D+kK6rovfoPueRzLNvKt1cTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from PH7PR11MB5820.namprd11.prod.outlook.com (2603:10b6:510:133::17)
 by CY8PR11MB6819.namprd11.prod.outlook.com (2603:10b6:930:61::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 09:36:27 +0000
Received: from PH7PR11MB5820.namprd11.prod.outlook.com
 ([fe80::84b2:b711:8939:b703]) by PH7PR11MB5820.namprd11.prod.outlook.com
 ([fe80::84b2:b711:8939:b703%7]) with mapi id 15.20.6411.027; Wed, 7 Jun 2023
 09:36:27 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore][PATCH 2/2] linux-yocto: move build / debug dependencies to .inc
Date: Wed,  7 Jun 2023 17:36:06 +0800
Message-Id: <20230607093606.2459428-2-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230607093606.2459428-1-xiangyu.chen@eng.windriver.com>
References: <20230607093606.2459428-1-xiangyu.chen@eng.windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0066.jpnprd01.prod.outlook.com
 (2603:1096:405:2::30) To PH7PR11MB5820.namprd11.prod.outlook.com
 (2603:10b6:510:133::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB5820:EE_|CY8PR11MB6819:EE_
X-MS-Office365-Filtering-Correlation-Id: e06de14b-8162-4ed0-5579-08db673aaa77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	btqYUl8Pp0/AqXkBwz/ib3nqWEZEHK2/4NzdZ6Bj6kpRxSJkZRnYD2CVBUgLfyqWyOD+7uJ7P0uiFbMW0luHbFs51IiFDBWjwMdGRRp/9ghJ5518LoeNzGnN3tmILSJe3RJS5jHn/9b//Cbl8WFsjjOM0JrK+mK20RCHhyL8CSy6NWciD70XEgWtNn1RBDgGPt9IswwyTuRJkjO+e9QFK3WXTivfyRI+jRDh1wmu8ymizlUbay9/Xd2dQUtMKnYOcGeKBVmvZBiZqPeujX9Lt8Bi6muKpGVNmCSsdldeccbX9IXipYvTZCSzypm+xWYfAsE6JM52EU/zgTMQHsI18p8j4xnuRNyvHdhygsxZzXe/zoJl+TFhXbriphMi9+n8ABSP+dseNqG6iOrk0geUPpirpAgibo8Av6qxawukIuHK3GHmLmUYvlIANp45JRhvy77bQx/P9LhH9FoY3gLrhUfDAfbOwsd0ew8MFM42AWXxzjJpw2UWQ1IOYaItV4aCnQs4d8jp7jRW+b1zkY4tDh6J07VptKsCwriT20p4gHUnPEgBB+4N5++cGg7JeXrYo2k6o42/8brzvDaZnvnWMiPhpdSNDjqZajcpAx2XJAo5dAtWgVc+yG7YK0Xg7oB8b3VEOVnsoYp4FBIsfl6oBA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB5820.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(376002)(396003)(136003)(39850400004)(451199021)(83380400001)(2906002)(2616005)(38350700002)(83170400001)(38100700002)(41300700001)(6486002)(316002)(6666004)(52116002)(5660300002)(8936002)(8676002)(478600001)(66556008)(66946007)(66476007)(6916009)(6506007)(6512007)(26005)(1076003)(186003)(44832011)(142923001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?81UA8atJsoNmnqpqULpfVwI3XMf7ioitPegBDc4AxaO4L2TVuWRIcAgEftLy?=
 =?us-ascii?Q?NN8pKqyux9hqxmCAb1NYitBQRYIoJcBi4GYSVamxf7E2UTZ9iKDNKyX7a0Pl?=
 =?us-ascii?Q?a/og0SWF/8IrsbuwlGutruMF3MDb3Ib+wMmNYD8WEbuxvC0v2MfyupHRzHcn?=
 =?us-ascii?Q?/82wgxq0qCHIYgpPC73/xyf92pAJQh+8hjCX9rPnLjZ9hGDZDr2o/pRPg8wE?=
 =?us-ascii?Q?sT2PPzZzmLfEQrHYttgo9DNJmOdA6zjwcObtgYS7mBoXJePxZA8lOFPUwPM3?=
 =?us-ascii?Q?NmZS5BeD3Rrvjml5bX8u6FcwGlNzFTmAQvX3toVdpI33U6WD3STNQBsxKFdi?=
 =?us-ascii?Q?tVcF+vLqYgTgOb0h348iZcfoJHh16zOmv6qxTEHwIopNvwnVdrYtgOmQFFAf?=
 =?us-ascii?Q?MJmcUv1wRHo8b77TLvi3M2CcEcOgxcMZMJpbedVL89FNwQfefAu5QpyNXIng?=
 =?us-ascii?Q?27jowulZMqOgSaeSzLIXNt0cO+0i0ng38+dnLkWIXxyJv2HgAqbQdd7YfZb3?=
 =?us-ascii?Q?hMVL0V0nx/dPoXXfbzoq7iKXeqDEvnC2X7CChdwGDLkB1UCAnZLN3ahyLRWz?=
 =?us-ascii?Q?Y8SHj55glL0ym7fY9KZtuJliZLSjFUkxtR9HO3O2Df2f6mVRqdGkKYwHxTnz?=
 =?us-ascii?Q?baLIOZW/OLEW+POr8Wd3q+8bOw7FYNJbnb/9PoJlfhSDD2/Fdsg8Ih9Ap72B?=
 =?us-ascii?Q?ijIzBv7Z4YY4pCw1C2rbdFQzfHBC/ujB80ICk/XuHrIclul9SFScb6QmSuj6?=
 =?us-ascii?Q?Y6q330bvL6BFFwoX/7Ix7Yo+i5Fhw7wBWglUr5LOGXbsTs4IIo57eVybZMto?=
 =?us-ascii?Q?sQs3E8fNM1sjm6Yo/cO9qrvgFo3LBdixwUcca4SHCRgWoOkXNx2G0cNSVpEF?=
 =?us-ascii?Q?hFgHSrINxC+LvFkeSzB8On0UuwZXhzW/2+pQPnNw1XY14Sw98tcUuSRU0Glk?=
 =?us-ascii?Q?jN/4cSuZsyLabWSZCaDHEb8qy8mOtNCVRMZztMYcS73hU+Gfekjgcw19x+YA?=
 =?us-ascii?Q?8dR5oeKUNtrTIPGsLcCbJehGARXwkCn30VEmv9dsPXTShUsEmEli5eFnzcRG?=
 =?us-ascii?Q?lEEUTN72Rz/8IM63XMekxj0J8rhkP+Ja3ON3b6Y3QrMvn3O0oIs53IJUIn8m?=
 =?us-ascii?Q?V96UjGUaXWOrhsK9gwUI8ca9aTaAm9F8egSM8n/xVOcZDzLEWc6LrIUVefHT?=
 =?us-ascii?Q?36QlYjjLRssRMg7k/MWDPDihz+fahxrtxfRAOinJi7xaAgbAez6h6n/19Zcs?=
 =?us-ascii?Q?3LhW8z43CbjQKqdMjZJIF8w6Xt1m19E/DPRMI0yB1u4PcSmykcEebB0ct2PO?=
 =?us-ascii?Q?cP65jFoNECS9RtiYpEX1IwLTh+ASDUQnacRCaQRfr9+YORAv0Ua6Wc9h1ssy?=
 =?us-ascii?Q?u/509V2WDiS5OdByQklfg1yrUDe9OB4DutjZQxv5t5ssu9Y8onre6X8drYRQ?=
 =?us-ascii?Q?8Iq+XyGScLSTYcMt4xnI7Ur8l3P0hQ5/hCaR2m3+loxS3wsOpdGyWd9kKhju?=
 =?us-ascii?Q?a+XvVWtViCoSkDpIYhH07Ct43stlmNxtDFSvum6oxj4avJT6mQTM8hQwNydO?=
 =?us-ascii?Q?futpk5wzSsJIkiAP9CIyOWiKm/ml8GX9l09d0EH0N5VC3WbXIIQyKg5aKTGH?=
 =?us-ascii?Q?CA=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e06de14b-8162-4ed0-5579-08db673aaa77
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB5820.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 09:36:27.0902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EG09PpjO2RpCcteS+c77507wuMR7KEk2hs55JTMWBTFqAS7oN0zpOm1slJUeKpGH0+V7Lj0NV7B7KYzUTypJOxrtFaMd5pEF3zj0xP62sWM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6819
X-Proofpoint-ORIG-GUID: wz5wuxQgZjygBpw9DFU1YBa9YehQXhkQ
X-Proofpoint-GUID: wz5wuxQgZjygBpw9DFU1YBa9YehQXhkQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-07_06,2023-06-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306070077
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jun 2023 09:36:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182468

From: Bruce Ashfield <bruce.ashfield@gmail.com>

When the architecture and debug specific build and runtime dependencies
were introduced, they were only applicable to "newer" kernel versions
and were enabled in the version specific recipes.

These are now common dependencies, so we can avoid the duplication and
move them to a common location.

We also change the adhoc nature of the existing elfutils definition,
as it is now detected by the kernel build and we no longer need the
work around to the native sysroot.

Finally, we change the undocumented KERNEL_DEBUG_OPTIONS to KERNEL_DEBUG
and use it to conditionally enable features that need extended support
(and support sometimes out of oe-core).

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7ddeb149e7a78bedeb945898fec5e8f13b7c5711)
Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto.inc    | 10 ++++++++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb |  4 ----
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 934591ff1c..04a8105e17 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -59,8 +59,14 @@ do_install:append(){
 # enable kernel-sample for oeqa/runtime/cases's ksample.py test
 KERNEL_FEATURES:append:qemuall=" features/kernel-sample/kernel-sample.scc"
 
-KERNEL_DEBUG_OPTIONS ?= "stack"
-KERNEL_EXTRA_ARGS:append:x86-64 = " ${@bb.utils.contains('KERNEL_DEBUG_OPTIONS', 'stack', 'HOST_LIBELF_LIBS="-L${RECIPE_SYSROOT_NATIVE}/usr/lib/pkgconfig/../../../usr/lib/ -lelf"', '', d)}"
+KERNEL_DEBUG ?= ""
+# These used to be version specific, but are now common dependencies.  New
+# tools / dependencies will continue to be added in version specific recipes.
+DEPENDS += '${@bb.utils.contains_any("ARCH", [ "x86", "arm64" ], "elfutils-native", "", d)}'
+DEPENDS += "openssl-native util-linux-native"
+DEPENDS += "gmp-native libmpc-native"
+DEPENDS += '${@bb.utils.contains("KERNEL_DEBUG", "True", "pahole-native", "", d)}'
+EXTRA_OEMAKE += '${@bb.utils.contains("KERNEL_DEBUG", "True", "", "PAHOLE=false", d)}'
 
 do_devshell:prepend() {
     # setup native pkg-config variables (kconfig scripts call pkg-config directly, cannot generically be overriden to pkg-config-native)
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index 36f7ed8791..6640000d83 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -45,10 +45,6 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 LINUX_VERSION ?= "6.1.25"
 
-DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
-DEPENDS += "openssl-native util-linux-native"
-DEPENDS += "gmp-native libmpc-native"
-
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
 KMETA = "kernel-meta"
-- 
2.34.1


