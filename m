Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AA9DC00144
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 03:43:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.866.1659584617109580373
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Aug 2022 20:43:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=U/oLsH5a;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=52158af8f2=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 2742tPas007518
	for <openembedded-core@lists.openembedded.org>; Thu, 4 Aug 2022 03:43:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=mvaFWdZ+8R9MFIDKRO2k6ACXkgZluoDfnrjmUc03YW0=;
 b=U/oLsH5a60ytcUjZZPvKte+Wsc5Wjk6cznQaFfjRdN4foIFbD0s/ZW8pu5JuR/o7/WBy
 FUCeOTf2Av/bOeTH1rPLi3dCoq8dgc5gnloRCcSGo+FCZy/QdSqbbsglsR8a3iw3ZKIG
 GORcibKwGCYuo1FzoGeb64yV2BDLYyrHT5cvcKks4YpQH5KP+VPXGY3/R8pcNIRZjKV+
 5rUwS1BvwTUpkQnVjxbtNxkqpnr5q13Wo6JjEhgUMtY+EdKRbUFgfU6wCueZFfOrT93S
 XOgEG7Lc48WY+ECIPexsA7nQ4AVOb7BYueu3Sc/DSoN9rzd4DgX7RYqsvoRnrfxRAtBV Uw==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3hr40082v1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 03:43:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xuds6TYzLUOb8Y78eHGW1UwStkdhGeRotbUOfoADz5y5OMQf9ApMVNfQ6g48I6CoH4++YiIzhYXVgat2lTBqVE8ikST3W37Uzp5qDYCnbtnv6IilmhkZNBHLmzB3xtCmOC+44aFEYNiuQLo4WXWgl8jpiegcx44P6Zj+b9NH/B8WTfbO1aHZgK8FBSZ3ZnZHq1zkwkC1yaZ3aN8CnE+IMRnVuBX12ne9PQpHE8dXwG20EQOi6LOnYk76dUWxnK4UiE12/q/Y2ZAAQZAhbeBNimsGKpiEGnyOh63JIuvGX3X2q9wM0DEKR+DkNRngL0u5kvi6/gpXRKPr3SnPorIA6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mvaFWdZ+8R9MFIDKRO2k6ACXkgZluoDfnrjmUc03YW0=;
 b=n7NJK8Q71gEggQT10IV+eVq6n1C9uBgsxRaWR1yJfIiz2yKZeiSL8I996OpN1oeMR5xNoDeAPscuUCuuMxvoATjU673wVWiXwvFSXS/Nk7S8oofBtez3OSI1BLXQM2X8YGOi8CCkN/HILkSGFgXGb+DoZ18c7+FncOEBqjxKhpMaJ8792MdtjmtRyr6f7lW2hbSQbs80VeX1BqaE47n+gOy2ruNfgop953CI0bam5uGZanN6g8alTxu7xwY83GLBtxgnfEQ9CO02kLK4eDOuBOFzd/rcZ9/hnUHym9Ppzz8WJu8CTTUFP1GPA56jkdYZrD641cG3NokleXqKiFMxmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SJ0PR11MB6744.namprd11.prod.outlook.com (2603:10b6:a03:47d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Thu, 4 Aug
 2022 03:43:33 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7874:564a:5570:ca99]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::7874:564a:5570:ca99%6]) with mapi id 15.20.5504.014; Thu, 4 Aug 2022
 03:43:33 +0000
From: Chen Qi <Qi.Chen@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] image_types_wic.bbclass: fix cross binutils
 dependency
Date: Wed,  3 Aug 2022 20:43:20 -0700
Message-Id: <20220804034320.120323-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.37.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0033.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::46) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ef33b62-ce8f-429e-4bcb-08da75cb8108
X-MS-TrafficTypeDiagnostic: SJ0PR11MB6744:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	JABvVECil+m7NXMPbFQbFI9itgZUup199dToy57iAwlYHTi+anA20PaOULxcTSZwEo7+d6IJfcU2MuAn3CBv44hcBUa1dn2D0YvZHu9i1YRL8cdXduc3mddl2KYLaw+zuH51hDZv99OjBA41noLAu8oA10UbbshaABcIhMCSkPieZpJipyofwLyCfnZn9xmW8IO8U5B/KwPc1JE+E+NG+pWliedwHIZaWYPkcSnvgIeUjXObzugK4Fuk+s2jrk59+4azYH+ygYAzzRuGGGeT8t1q0yKQZxx18wMXx+jV8x6PpF0XANhSxW5ERA3ZSVDVRZ/pv032R+OzJOnjOLHOMtAABbJpXW7hWppsdAUAA+tsr8YVRW4wkSvNQlX87y/OTbwzRQ76g1mjj5J0IvIdfhZSfE7bsLfTNyl1Z7SpkQCe81ByKfcb7ts51NM3hLdl3hd7cV7eSuHanZd91OP4Kz6vEm9gBWD6gqrHj2uf5gPCobgF42MEbfwEXsz4u/3h306a3Cqn4vN6BRzSIAFKasUagyRgUabnoPLz9TDAIOJW4EJjepulDi27aHe27AeF63aHXSAC4dcAV3vqeMsHbxXqfp99jlxDdq1pxWeNYpSJNrXXhHPeD+l3kWf0BdBT1UOg4H4FQUyBzS2O0Pyt8jcI9/T+oF9utFoK3GLbTtCI6dW3Bp6ijVQyIei5HEL6/Va5k4be/Ka4/+rTQvjpKaRoTNTKuuYKTkfQDVmabUvjQbPVlpK4tiVc7B0TtR6WE5Vk+x51EtxP48aAX6TAGuETSBGih1M1rUJ6ugQW0GY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(346002)(136003)(396003)(376002)(366004)(5660300002)(66556008)(8936002)(66946007)(66476007)(8676002)(2906002)(38100700002)(38350700002)(1076003)(36756003)(83380400001)(6486002)(478600001)(6916009)(316002)(186003)(2616005)(6506007)(6666004)(52116002)(86362001)(41300700001)(6512007)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2PuD+l6tJwqKUEm6p/9JRHqO8ctkgZbmZCIJKYckiWlAbzLWSf3Q0Vw/2Gmu?=
 =?us-ascii?Q?0Sdr+iUgVJrkupf7SP0LCG7sWNIBBN7DtyN6nEyuWD7zmY9Cg2lMhoHu/xnE?=
 =?us-ascii?Q?WSUdu6DU24/jstjA4UzzksFhmz4bDszIyvCmfmcHLJG1/sHEB4ftPD2Cx2Ac?=
 =?us-ascii?Q?E+uV2l1i+qevqJNNRajftThaj3NCK09N09RjAKEvWPLmKKGENXKslV+JEprG?=
 =?us-ascii?Q?wPzFtFT/WlPXyKfm9deuLh4Lu4ISsZ26rgmhKR03W7lSTjvmFwdLM1hV5H+f?=
 =?us-ascii?Q?GfkhSKzzHtqCv9aASrQN3hZ0w2bu3dQcHvc5Bv04zdYDwxzIMfUF+lLeq+Px?=
 =?us-ascii?Q?ah3bG3TX8Ia2WV5pX/DsXZ6Z26PPK/DxRWbZhXxNUcHjS9rdKvqdoAP9I4pV?=
 =?us-ascii?Q?kZZhMXtjN4ecWzXPznLzgTTHLT7soKZYhazqGf8VNuf6My3kTwkN4tFig9oj?=
 =?us-ascii?Q?wXyKQkqO9R9oakRYWiYyumOSdp1LfBJlfEYeLQDzEm1Jr/nRQjz3bvtn182u?=
 =?us-ascii?Q?XV0yFYz1IWuKHUHpI7uV0b9ZeXrZ6rn6i82mcvHXx/7173zwiq30sLr3MKHN?=
 =?us-ascii?Q?8h65nkiChSdGXX6SPCCiSBU+WMvLsBxjpnFZgTYnTj8NNJIjIH1RDRFDDHqY?=
 =?us-ascii?Q?8uUsG4gy5af/ZFoHGvxq12YlffE+L7KfAJ9cm4QBmK+60FpRXSPhdW/s8IG4?=
 =?us-ascii?Q?2ngaP05c/7SzxQmsInhBESejdgZ/r6TggFCSVg3ConZ3IkkV27AxX8mHFAtw?=
 =?us-ascii?Q?PEhnBA6d2Q1wEySHqVII5CN7tzXsokWu0wJHbl14vyu0F0hPbHfXiPuG5DV/?=
 =?us-ascii?Q?/t7FudXVTbe8CsWRHk31rgiJYFCf7KecNFvA7tEZZvs1C+xXwhMF7uXbX524?=
 =?us-ascii?Q?lFBlUvZX0rzb/ZMRQALDiVSWo0bfUhD8Ey++rJVI42wfx3rsQ4qc1GzFDfRN?=
 =?us-ascii?Q?h1x3HQtny/iovTv7uOQw6cJoZ4DY5KYrEgyokr9YgrLe3qtDQmv3VIXkXXrq?=
 =?us-ascii?Q?Zn7O9ZEPsFIrwzmPnHCJeek7dXDiDcdM4zsSfN4M6zrwcsp6RRmHYw/9KjfE?=
 =?us-ascii?Q?RCu7WXZjpLS7KbXEMZNjke8M419/7Yxl6NQqAUL+Nv4IobrhGG4eW1je8Hby?=
 =?us-ascii?Q?s4tBoOh7tedRo4p8eJjQMrPMZRQHrubNZ51mu9vD8a+Mfktn5U8fqXTvLpTe?=
 =?us-ascii?Q?dgZQypfhNls8S/eU93VMv7n/9jRr1yJ4kJr+RGv30G/00fRGkAIWwVUSFE7a?=
 =?us-ascii?Q?JCstzIMRz/6UzyI5duA3K1RKzp/HhTksSqbrrDsSgq6RK3i4ZzTnyrCTjiFK?=
 =?us-ascii?Q?EfT3Fnva5NrdCCcjGJvvOb8rWYowYvV0CVY8ZGtf3+e/Y/GJVOPIAOvaZe9P?=
 =?us-ascii?Q?bzxSUKfvvRMvGkIwAo6NmEbE50NG6q9BCTLIFHzexEVjBTdS/dEElykUj7TM?=
 =?us-ascii?Q?yZM/zL/MUbtw+g5kNZ7/N0hgh+rr5SXBPUlRjwWjuNbg6Hpoq5LJahhpJsMf?=
 =?us-ascii?Q?Vz+aQ7H3EM9PBkmlTys26yE7l7yBi3gCspnTLLWlCr27/2BN3oxpHx/LrZoE?=
 =?us-ascii?Q?/CPeqGyOFpGdYCcDeWBsMnZG6Zs11vSR9SWq1esaYe9n0ck9EQWNYQXRPas8?=
 =?us-ascii?Q?lQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7ef33b62-ce8f-429e-4bcb-08da75cb8108
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 03:43:33.1680
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 8mZVx8gKcsZhH2nmTTpnUSyHJHVBuz7m8crSPGRNTL9Ph8uQZSaJMnk00WpQIfEU3GHlXoyif8VzzThJTQIzUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6744
X-Proofpoint-GUID: Hj6q6DCaDr2KdBmTSySQ2Zn6xrx-tmAa
X-Proofpoint-ORIG-GUID: Hj6q6DCaDr2KdBmTSySQ2Zn6xrx-tmAa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-03_07,2022-08-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 mlxscore=0 bulkscore=0 adultscore=0 mlxlogscore=537
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 spamscore=0
 malwarescore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2206140000 definitions=main-2208040016
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Aug 2022 03:43:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168834

Enable multilib and wic at the same time and we'll meet the
following error.

  ERROR: Nothing PROVIDES 'virtual/i686-wrsmllib32-linux-binutils'

Adjust the dependency to take multilib into consideration.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/image_types_wic.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
index 940dc5f577..8497916d48 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -85,7 +85,7 @@ do_image_wic[deptask] += "do_image_complete"
 WKS_FILE_DEPENDS_DEFAULT = '${@bb.utils.contains_any("BUILD_ARCH", [ 'x86_64', 'i686' ], "syslinux-native", "",d)}'
 WKS_FILE_DEPENDS_DEFAULT += "bmap-tools-native cdrtools-native btrfs-tools-native squashfs-tools-native e2fsprogs-native erofs-utils-native"
 # Unified kernel images need objcopy
-WKS_FILE_DEPENDS_DEFAULT += "virtual/${TARGET_PREFIX}binutils"
+WKS_FILE_DEPENDS_DEFAULT += "virtual/${MLPREFIX}${TARGET_PREFIX}binutils"
 WKS_FILE_DEPENDS_BOOTLOADERS = ""
 WKS_FILE_DEPENDS_BOOTLOADERS:x86 = "syslinux grub-efi systemd-boot os-release"
 WKS_FILE_DEPENDS_BOOTLOADERS:x86-64 = "syslinux grub-efi systemd-boot os-release"
-- 
2.37.0


