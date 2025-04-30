Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D637CC369D9
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 09:42:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.12956.1746006129073442959
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Apr 2025 02:42:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7215096f67=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U4APVE014234
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 09:42:08 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46b6ug0k5n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 09:42:07 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kn2+BA1O5ek98JkP74AZcxjGK3iw3KRAIKEm+2TSvUSuYU0QWEEg7AxaTJENB5xtYFtSeCdbEyikOLOAonpUNi7NXYBBUoBF0oIdCUdFhXZovgFIaZt6Mwns7Ocj6bj0T7eOst0oLMVZRQ+CkHcITCPNpxeak4QreljW1GC3seX9v2kShgdmn6m5hok7jby41gkaYMcGPhWF34DMP45fXD/BT487JQ2x7h1C2fA2c/rsxe6xqoqaI2czbpxA41Xt6c2W5n/APhJFsGeXCaROCCZom7SwkwS3aRWBFbxgrP/J0vUIKl84meoXAE/c+khIEL+7L1NxzAQaFMUfGlLKAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xEO7VOO9sMKcaj+l30wgqc1r+CyKSumUpRF9U1SE8ss=;
 b=HYy9bfsIiWsMSGh/fSEfpJg/P0TbnEq/yCoQDevLLNR+c6Sz77SEVIRjMbuzRpljAaUB9J+FFQiBfU3lkW0ynGjG/WqDt8AqQL7N7LMHLHhpc25RGEoDBkjc7J+UQmxBB/pg2zqOU5qKBH6e8RtSSKfE45rILbOuk82K52vBNZ671/q/fnuaChcS/dqZTw8v6Izm2brm/k/xgbKI2zbLJCrAONmjJglUwg65sO6F2k9ttAKxMA2/Dww+vKtJzGgfsrpiwW0/d/EpA8BVtj6tLDT6gfrn76Z/eavXI4j3glKSbQkSyWDBcR3EkOoFIianDym0uG44QmfojIy58MaMdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by DS4PPF75D68BA1B.namprd11.prod.outlook.com (2603:10b6:f:fc02::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Wed, 30 Apr
 2025 09:42:06 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%7]) with mapi id 15.20.8699.012; Wed, 30 Apr 2025
 09:42:06 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar][PATCH] webkitgtk: Use WTF_CPU_UNKNOWN when building for riscv64
Date: Wed, 30 Apr 2025 17:41:53 +0800
Message-Id: <20250430094153.3343037-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0031.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::11) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|DS4PPF75D68BA1B:EE_
X-MS-Office365-Filtering-Correlation-Id: 30ae478c-e814-4df0-390b-08dd87cb44b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?BQDYlbUgG8tqm4iEBo9QXHC20nLii1zSmij545fZjFhE0QxHzC3DjVs12VH0?=
 =?us-ascii?Q?KFHlIZDhOcQzeAbcl+ptxNSsrzG+71dDYpzn9pBHLwlkqIpYLre5HdonmpWk?=
 =?us-ascii?Q?lOh9LKnQJ/k5IAm79JyYd2Q/d2I7IKdXzSsNt3/4MlgOjyoYo6mXFrYL2ysa?=
 =?us-ascii?Q?Asj6DSGfU8U6UAzu9TSbfTHJmwjyBLfzuUqfmFzzP4ElSBEN9a1sCowIO/XS?=
 =?us-ascii?Q?OlMSr2jbfdZqlRQI57sueDeJwbnEWGKrR4cilNDB0lw7XitAde3EHbnu45DB?=
 =?us-ascii?Q?uRdLWaHcaHAdBDeo2Rz3WzFXlz2w1sUJ7eKsbiG9cYMmPIwOFu2TWzLK+2P7?=
 =?us-ascii?Q?2z4KPEBeSc4LQQ4ITRx3a2l4kYRfOS8FXe9WfOJ3co7FOu7mSQzLP1ZaE229?=
 =?us-ascii?Q?X9J932BK9kWtOAtQLKC3iAasK8y0rFDjHQGXqcwKM0fD6vm6Te1yMCgSsMp+?=
 =?us-ascii?Q?A3NC1bUIT2Cn+A0EKqTSdN2txueLcCAnT1S6075eYc0BmCCKnDpdYt7xdBZP?=
 =?us-ascii?Q?wQLM6pjVCaI/2fZkhYEkcWJLEVevsOA3K95FQFUSE0KG8fpYMlww9jn6b4Iv?=
 =?us-ascii?Q?+zSPUPU1oLSE+wsgqnf2w9T8CtmrqgprJKZEJLa4Pb/yp49DibwUrtia/FBY?=
 =?us-ascii?Q?67uwn8k7uhtgvXxY59XX/iCzWqARxiS/H4Jy7AuoUa2i40XzR6BWdTsKh+78?=
 =?us-ascii?Q?qI/aduZyN3I1R0W32BMDREVxO7dLHLgEZa+PZA46s8Zcj/0+pmVVS/CVBcuU?=
 =?us-ascii?Q?/EOwTPVd3ErH3m+7Xytx2d2BgpvyJhgd+0BUoD+JLouKWsbBBAgSfJP3tX4H?=
 =?us-ascii?Q?oJfmtu2i5VlzEopHgkZxol305Gcy+uyaEFcydtcY9245io++TDuwzSC7o5TU?=
 =?us-ascii?Q?n9oJvMuKPxogjwkiimL4GdRAP6znKE/Op5LWINTZpzD1x+jXVh1WwzQ3MokX?=
 =?us-ascii?Q?CmPrLmbDZIJIMDwDfQmqZOv5CK9duADl6ynWdacKxL7bLeKbL0dx6xkpugfR?=
 =?us-ascii?Q?81VBxsCguSKHFYsxZdj9mP+wvZcKgZ2ykHtlgV4WKt6PhsSOpma8qdgLusWb?=
 =?us-ascii?Q?1RRx80saQuFlQiJIfI3JJBPSb+anf6Q9NeQe2zmXac2tpjlCFGVXZ7HhSXjM?=
 =?us-ascii?Q?axqjU1H//m0uQtJyNYDXrbbNxbaA7y7DWySnPbrhUtFOpbVAoK/dvRk3rW9S?=
 =?us-ascii?Q?rwBqtgmZGzfsdHNag7Zv9/GBI1y0r+1nem8uYoWvZnfCqDzxNLKcRqktfJU+?=
 =?us-ascii?Q?t2YkAy9AFxhR23IrNEJWemp/khB8tD86syptMSAwgdaRD+pUSOU9Ilk/49n+?=
 =?us-ascii?Q?6pAlCDt2VWNsxY4+1duAWPcCnzZRWw79YnXC/0rgMXteCB8y3KJRf0PqnVo7?=
 =?us-ascii?Q?Gz9VO2qsthlN1/gReLGwNBmQavhzdU7my8KfKpU96XbcIQic+CUKMYScngOh?=
 =?us-ascii?Q?X7gas9QgUXc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6tTfa0qDf2I6YBc586diCWcjvguLg0rWXGiGB6vHwW7t1RLgCQkvdcEoVuxj?=
 =?us-ascii?Q?8E0O+coOLkdmowueqmTq788MY0cGUjn+TXpP4CSChYjN0uM1cb6mAkQPnuWz?=
 =?us-ascii?Q?KooedXieDJpS3ljbmz77m1XFQVZhm9w9Wo1kSdQ991wylw22rJBTj5eWhl5K?=
 =?us-ascii?Q?GH0Pq5PkL/h23g5iVEA5CkFsbY5DTHcwVsZkbDvxitflrywy8Sdehh+b1i0f?=
 =?us-ascii?Q?otlYamZpO+X1m/DSJZyBHEyaRMZQKAtCOQcTArkrafsfJncI04tiJxORaBed?=
 =?us-ascii?Q?V2kCUf9o2X6VaX4WcEw1MMBAa7+x02FfOQ2KyQwoZAM5K0Gv52tNWtK8vOMM?=
 =?us-ascii?Q?Yla3QWRbQYi7jU0v295rRkeA4CZci5bap+qUhkAyM9lkMsTaO3RpFiRkW8k6?=
 =?us-ascii?Q?/ap4XJQqVSrMvimV191sehRmWTTKpRK1bqslguldO0xftmkDHYzrr8FpXhTY?=
 =?us-ascii?Q?A4aTSHt0N0KudsJg8U2P+Wsd/z364gXHsEES6HBA7lepPdVvubs0SdpctXDW?=
 =?us-ascii?Q?/ZRTEZMOfU3f9tK+4KxsGZXvCUskvRyMi0J1KAQyb8VnHA5eR/PGybDjQSRY?=
 =?us-ascii?Q?KFQLXo61HoIGW9Fn047tiq8wHW37/6mYVuEnBvAN1ffUfFkC2DTipkVHwmIq?=
 =?us-ascii?Q?+ue9abGF0HQldfl4VES61sP0xqZ5OmD4jyDDrHFTk7F0gcUA8MPCTBXwwtIO?=
 =?us-ascii?Q?SGwBc+qkM7Y8nv1O8eWBnlpAV+fbPXvbEtkUTGKoefoul0fcA/0HQftW3SHS?=
 =?us-ascii?Q?vyxcexQrbaJ/1rQOia3hroqOAbX/OfyHSlV2I+gt1tr5UfzBf/9oMhkfP67r?=
 =?us-ascii?Q?L6dm0KgYe2n2o12Xl/1Jv2bsW0c80mFIqEoDSayhlFK4waw1DBsiXNCnK6WI?=
 =?us-ascii?Q?kdWrvTKA6VjZXqwYMe5KGpqyIu7+oUExw1JdLQhkEkFyyfhO4Os/Eba66HsT?=
 =?us-ascii?Q?ZcL8K+In+nhHyug9XoxUtPgFxHUW29YnE2HIB4rtyW2RzpGqHRjEuAAGSHIr?=
 =?us-ascii?Q?kDhg1KSBmZ5BIwjXjBT4N+GZW1CvrHm6kczDDTfvM1nu9MuNvPe9KilrKiaT?=
 =?us-ascii?Q?ROJvKw7/F0NE8yCWqYxtS6bdsTKyM1ePKlOsKDkvhft/oVASbEYsN2yM3r2b?=
 =?us-ascii?Q?RD2DiX+qrxF2YwZyEkgS/JmlgaOzBrAhrpOXaabA1z9bxJQc/In9yIjlA71q?=
 =?us-ascii?Q?YMJUqB3lvH50QUgzwLNCR22ke7EjS9dbk19/bZx9Mcrcb5Sf1U5xyF2De/gi?=
 =?us-ascii?Q?l1UuGZwaW7XoJgZA1sDI0Y0R2arbhWkQphgQDsgl1JuZG3x8UVQ8EzxrPbqp?=
 =?us-ascii?Q?Bo7Qmzh2+7hStyj7Ws6ynDLcLMWqOnN/WFa5TxMD+RPsEw+4Hn7GkMgH8ElB?=
 =?us-ascii?Q?VJ5d1JzgCzyQ4Zk/0fsn2EWevNyt8qeNq//vj6MXLa3eKBpvUHQtBvy2MT0g?=
 =?us-ascii?Q?sDhQCtAHIgx+udkK8wP519PZSvVvoheDsaeESPE9E1aI9/m1pXidCP8zKx2h?=
 =?us-ascii?Q?ZZ131Js9N1nNWG85jDGWLWD4Na89PCuYd+MblyKpUduCVt0hO6O3FAKanh+M?=
 =?us-ascii?Q?XP4kb89aQM5EcsxMymecJ3FYXcSqzI4BkokKWyekfobbBxeLTJ0zO7NwmhX+?=
 =?us-ascii?Q?Ig=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30ae478c-e814-4df0-390b-08dd87cb44b8
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 09:42:06.0283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f23oRTTAyM5n2ZoNNAciju4YruHZDgzpsxq1wXBUWNbA2yKBq6nekFy/kfG/lUx8j+8tKTuMC7WvKIerCrJCu6BxRaTpkobW+CbGWNam0KE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF75D68BA1B
X-Authority-Analysis: v=2.4 cv=Xf6JzJ55 c=1 sm=1 tr=0 ts=6811f070 cx=c_pps a=PdgAl9AEy1hEU2ikvxmBtw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=Q1sTgoEvAAAA:8 a=LXCGm8LIAAAA:8 a=pGLkceISAAAA:8 a=P-IC7800AAAA:8 a=t7CeM3EgAAAA:8 a=V2sgnzSHAAAA:8 a=pxgjHkU5OmMF5BL0B1EA:9 a=FkGh3qDytyf094M0uOEt:22 a=NxI9r9ql2kHpUT0AVVEO:22 a=d3PnA9EDa4IxuAV0gXij:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=Z31ocT7rh6aUJxSkT1EX:22
X-Proofpoint-GUID: 697FnhtHh-oME5c9B-nJkUwWAbqCI3gX
X-Proofpoint-ORIG-GUID: 697FnhtHh-oME5c9B-nJkUwWAbqCI3gX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA2OCBTYWx0ZWRfX69QcoHPMQwXU E8dXT++IPxCD/4vUUoy680qP/LOhOuI4jxPHLWT5NmqsXBB6yrJV73ElFKSIdb0wem+yynv2N6K vctRNAMJ2XGxVJSpT/szAdGLG0cmQNz0NUIt2O0nDsTgQwSPcCmJlCv51f/wuzIiNaq/P4Bxvs9
 eN5P+Oe6s3b/JqRQrSXuK1x6nAh21Sr36kRfG79us1zM6U+YYLvsWBheNs91kZnVo4Fskebtd91 jB133RW4t4QiyOeRTOWI0GBbGfPze3jBZkwv64X9a+9sa0DDwh8rYUxY41JsxEQKDRmOCxLGkZQ XGDag/gqXZ+bs3UfLx1lYh8z2OAnK15C5L5JxQT9Qw8o6je8tFYMIbWLaKikOKyW6oh+B2SQT+R
 avjtSnyTMGcHD+OYXe218AdIrCWb0n2mdi/p1iONl4zMj6sZ2ye4D01aH5xedQvNBPcap6jv
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 adultscore=0 suspectscore=0 spamscore=0 mlxscore=0
 mlxlogscore=802 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2504300068
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 09:42:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215735

From: Khem Raj <raj.khem@gmail.com>

This helps fix the build regression seen with 2.48+

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>

(master rev: e06114af90b78abb3ba2e75c59fc4c60db8b6a9a)

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../webkit/webkitgtk/fix-ftbfs-riscv64.patch  | 38 +++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.48.0.bb  |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-riscv64.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-riscv64.patch b/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-riscv64.patch
new file mode 100644
index 0000000000..e436896098
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/fix-ftbfs-riscv64.patch
@@ -0,0 +1,38 @@
+From: Alberto Garcia <berto@igalia.com>
+Description: Use WTF_CPU_UNKNOWN when building for riscv64
+ WebKitGTK doesn't build on riscv64 even with the JIT disabled.
+ Treating the CPU as unknown is perhaps a bit severe, but it allows us
+ to get the build done until someone steps up to maintain this
+ properly.
+Bug: https://bugs.webkit.org/show_bug.cgi?id=271371
+
+Upstream-Status: Submitted [https://bugs.webkit.org/show_bug.cgi?id=271371#c1]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/Source/WTF/wtf/PlatformCPU.h
++++ b/Source/WTF/wtf/PlatformCPU.h
+@@ -286,14 +286,6 @@
+ 
+ #endif /* ARM */
+ 
+-/* CPU(RISCV64) - RISC-V 64-bit */
+-#if    defined(__riscv) \
+-    && defined(__riscv_xlen) \
+-    && (__riscv_xlen == 64)
+-#define WTF_CPU_RISCV64 1
+-#define WTF_CPU_KNOWN 1
+-#endif
+-
+ #if !CPU(KNOWN)
+ #define WTF_CPU_UNKNOWN 1
+ #endif
+--- a/Source/cmake/WebKitCommon.cmake
++++ b/Source/cmake/WebKitCommon.cmake
+@@ -125,8 +125,6 @@ if (NOT HAS_RUN_WEBKIT_COMMON)
+         set(WTF_CPU_PPC64 1)
+     elseif (LOWERCASE_CMAKE_SYSTEM_PROCESSOR MATCHES "ppc64le")
+         set(WTF_CPU_PPC64LE 1)
+-    elseif (LOWERCASE_CMAKE_SYSTEM_PROCESSOR MATCHES "^riscv64")
+-        set(WTF_CPU_RISCV64 1)
+     elseif (LOWERCASE_CMAKE_SYSTEM_PROCESSOR MATCHES "^loongarch64")
+         set(WTF_CPU_LOONGARCH64 1)
+     else ()
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.48.0.bb b/meta/recipes-sato/webkit/webkitgtk_2.48.0.bb
index 6eb80da1de..58b78b5f28 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.48.0.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.48.0.bb
@@ -19,6 +19,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://0001-EnumTraits.h-error-no-matching-function-for-call-to-.patch \
            file://0001-Cherry-pick-292304-main-7ffc29624258-.-https-bugs.we.patch \
            file://0001-Fix-build-errors-on-RISCV-https-bugs.webkit.org-show.patch \
+           file://fix-ftbfs-riscv64.patch \
            "
 SRC_URI[sha256sum] = "94904a55cf12d44a4e36ceadafff02d46da73d76be9b4769f34cbfdf0eebf88e"
 
-- 
2.34.1


