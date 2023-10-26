Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB0E8C25B48
	for <webhook@archiver.kernel.org>; Thu, 26 Oct 2023 06:39:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.64665.1698302346351233349
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Oct 2023 23:39:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8663476a92=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39Q6U2MH008609
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 06:39:05 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2040.outbound.protection.outlook.com [104.47.51.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tv5m5wda2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 06:39:05 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SG9D7yWsGZFlQHtAlo+ZIBSo2DvITvl++CNpAQVc9y2Aqqdw5yqcUL2Uifbq4/D4nhogBNlU0uu3niYdOdtdJGMk2CnjnOeb6SVOiEFzxM9mBjzZnev5y5OJodzUUEHi4iuMzJOcmIayyrO21GoSXnXpm3sLJTeqjxFlUb8WPZwfO+j82cIjbZc5HR9X2ohVWyW59sOKb6ALKClz8mye3gwzE5Evakf6wYq/0vpwwFNdfsA/tfUg/3OCZ/hpIJqCP4JaZ3m/saclR2tmxHi92Ojnx3Z+qUI3fDYpg+OD8l79nx6gZgYOVZpwD64wF6Xonx/Lw/bncbomsTqfujnZew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bs51+3o86p9HHskeYt4bF5AN1JxYvYQZ3yPwh2CFdZ0=;
 b=SF9PjqcPz7c1yMi1LP2dwE7bG17cQArUQxWJ0IDOXzsdcfZ6mM9LPVIS2glQ1djiqB/0XsWHQ6CgtU/eNMHc8makPiCjKoiWSrywfCFDkHEsySzjr23BG5+ospyAXnJplZ2dBlilLkyI3O9DbVGfIHKRCfT3nSD+GbY38ixFkXUFllF/ci2zID9Tmks55n0gkJZkYAW14dJ6wkZltSCe4FGNxNAwJlFLjqiUwM5Dg2ScgHfbaoNxeEn7Sepw+P35TCfw34i5TKsILC86mhzNatqE7JinOr87jBJGJJRrbwzgnv3QSOT4zIvcseUkN4eM/Qn3sjaZVeetEgkEQd/PVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by CO6PR11MB5586.namprd11.prod.outlook.com (2603:10b6:5:35d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.31; Thu, 26 Oct
 2023 06:39:03 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::6162:ed58:51f5:efd]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::6162:ed58:51f5:efd%4]) with mapi id 15.20.6933.019; Thu, 26 Oct 2023
 06:39:03 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] linux-yocto: make sure the pahole-native available before do_kernel_configme
Date: Thu, 26 Oct 2023 14:38:48 +0800
Message-Id: <20231026063848.3972419-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0019.jpnprd01.prod.outlook.com (2603:1096:405::31)
 To MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|CO6PR11MB5586:EE_
X-MS-Office365-Filtering-Correlation-Id: 031672b4-4419-4263-1184-08dbd5ee3ec3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PR0QVIYf0XBz+wgJtmsPx4RhPZ13atYIlJP6XDeJNn6ESiDotw2oW1Ok7uZk7q0WEmD25+xkyCoxz6tK6cm/LqAowbUYp6d05+9If3Ow/VozZy+9KuSfNVJYaXeRxycRQPs1agOTP6WbCmZueQEyIu1UCb+bcDyDiUyTVgJGIVk91Zu3PzQaS2aq019we9kFQ0hymksUT1NM2xDVBfpAr4DIL3xxYj8oH73Ik/hU5s068qxywDM+El2svdOeDbWlNU11hwiyR0tpflETSHOOanamMn/30MwPYojfyYECyCev3A7BjDLJ+SiiksYHATN+gGaWMIjev9VMV+hHO62/Nclovhprk+kQzM6yRvh4sYRoM2tIAMz29CZdRQT7UXZm1aYQQrai7XODKGW3MaNIjbqyTft9WS9H1Ip6XjO7t6TRDywA6+KkTPKBg+h2NwDvCS1R7BYOYLxosvXr51Ak1lkdf7vwHgOgQp7/jKE4WWBuTC5gsuNMfEXSNWzkXrgnE83n/uQ++D3pODZD7xOq5/99zXfPvbwRLw/ZsgeJ2qxXcPt/ZqbEze1/SG89vnF39A5IqAODjSf1yJMgCg47Rz1p8ofmdCl2IhCO211U/bc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(376002)(346002)(136003)(396003)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(38350700005)(26005)(38100700002)(83170400001)(41300700001)(2906002)(5660300002)(44832011)(8936002)(8676002)(2616005)(6916009)(478600001)(1076003)(6506007)(316002)(66946007)(66556008)(66476007)(52116002)(6486002)(83380400001)(6512007)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?J020kTxmJMZaQKWa+Mpw+ZlD3sL3nNBXMDGOw8Qdbia812TvBqD9No1Zu8yf?=
 =?us-ascii?Q?HI5nnOLHS4r27YPu8xQ8TbqOyNGbOIi4cTJKDvwLazupZiF3lKN7B8fjKjJB?=
 =?us-ascii?Q?wFMMzhB0IP1XOz6wZTQSDIqF0VpqPt94petPR3/tcHkD4L0IDzLPAci7b9wQ?=
 =?us-ascii?Q?f6g773VQ+v4Q8ceIkbdyJfqNh/iLG7d5Wa+VYat+qW0P0cUW5ScTXw/4G+Ac?=
 =?us-ascii?Q?MyTD8+QNZZPCOWIQQfZ4iaHrO/T/iyTYMV9BW8EjEgX3Jkro8UWWikOTgN1F?=
 =?us-ascii?Q?gEGqXOSHpF0KyKdElE778GGFbcv2N3VhWI+bu55kvomK8/OFPqPA2g+ek2lW?=
 =?us-ascii?Q?kTa+5eoGD80dN+21BhyE/OiqMqSkga6i+Kyz1woAZ+xEK962xnr5TwXZFCPh?=
 =?us-ascii?Q?lj7KkwJpuYY8o4TOoRgm0bESrlAwySalO4JhfIJGMcpDbcmff6Or4/7ExmVA?=
 =?us-ascii?Q?ezZxlUsQwUtkyHkTQ7brl/WuUKiiIdJOuUfwhesmcehGUJAkB5+IxBONZRQN?=
 =?us-ascii?Q?KMzpyocdqIUlcKM5uEm6gjU35babZb0QzZFU7auMuEnXUs8qyifUgWDmELme?=
 =?us-ascii?Q?cvxaLQufZr08HRDB7SDk9sE6LZH26PoNUKkYrrmfIOLGjFihKPGUncHaXC1E?=
 =?us-ascii?Q?9dvMb6xnULSzphYIkiQ6kEqwWlAKrw7ij5V5F1DxTF1YIhwdFR/C9dBo28HO?=
 =?us-ascii?Q?0eMB2nmApannia/VM2jmh9o2hAgDFX3utVbWUy8qHF4rbGfRybSO7LphDBHt?=
 =?us-ascii?Q?fwWc4FFxRX2l7swfSn/Lu99w3+EOqGvrVc7F0PMacFizt140MXK0OQoQjUbV?=
 =?us-ascii?Q?tbsC4CX7lCTrqGVYkLgFR8tdUHr0t2UJBClUwVjdYoaxTmfm8wsmAa3ztLle?=
 =?us-ascii?Q?rIUA1T3v2JuNSbAnEJX+46lgAXGTEOytANRX2n2sYAb+E5rdIOgET9NfipKu?=
 =?us-ascii?Q?VbA0ZzG2ADssILX/ySLv5ycUoT42jSl3yI8hPI/jgKjoeGC6bG1YVUh8coNW?=
 =?us-ascii?Q?dEUT9pJNYgNE3O26GThvdnLoMECCCzHfMa9jW/tjsplU4kMix9Qirq1/yFb3?=
 =?us-ascii?Q?7taD4/aeq16TDfrFjXVZ6bwWGF6UlI3No/SsCa6qmvrDCyHwWCeJG51huAh1?=
 =?us-ascii?Q?goR8eyyHZOkJ9G+nyX5175PUT1qvuOYEsOQ+M2VtuhKeV8Xs0Pbzq38UP2Xc?=
 =?us-ascii?Q?JtKCzLKhnIiSFhTU/rNfyHCIqrgenJ7eZlu04PYgXd8/nJyCuj+X9Pq1ryUm?=
 =?us-ascii?Q?TvCHPX1WnaOJekg//vwt85CLnszRyOp4T/Q51bG69fAyI6WtLuSLWS3bdjB2?=
 =?us-ascii?Q?HSHamJZOtliEVDOPtZ1xJRTgdgFc2qZqyGV6Zc/uilNFNdTYYSti2gBUqUC7?=
 =?us-ascii?Q?JY1+Zy9JBY30olCRuiLZbX0wEkx2KeEMUxERkuKO9kzwHQHvA4DfXDHjloWY?=
 =?us-ascii?Q?/Mo9VzPWL2B/x371WQ0j7UJz3Z/oyhOP2BQ4NmMjOp0PIDWkS+vy/73J4/Q+?=
 =?us-ascii?Q?sQzaao5oKF8Tsp5Wu9geWz8PDT0hM2cYToV3SKn5yKZre1wBC8hKTRu4AKH5?=
 =?us-ascii?Q?xFIm8UJqqNstsQgW/k1fCR1X56PH2ePuOW0K2G23wgaWrWWSpsaazjiHL9fT?=
 =?us-ascii?Q?AQ=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 031672b4-4419-4263-1184-08dbd5ee3ec3
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 06:39:03.7093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4kVRY0ZPvhpIfKgcLhRPXIzEi/qX+0o8pWisEz/go3qPe2+kKrgvZuZYIIp0bMO4TQI4zZ5Tu+SHCwp4du83dIV9XpdtRt1uX9l/JIhcjNQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5586
X-Proofpoint-GUID: g7Qpqn1p0T_BC1mGk-Sz01WESezi_ubQ
X-Proofpoint-ORIG-GUID: g7Qpqn1p0T_BC1mGk-Sz01WESezi_ubQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-26_03,2023-10-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0
 mlxscore=0 priorityscore=1501 mlxlogscore=876 phishscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2310170000 definitions=main-2310260054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Oct 2023 06:39:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189698

From: Xiangyu Chen <xiangyu.chen@windriver.com>

When using debug-btf.scc in a clean workspace, the CONFIG_MODULE_ALLOW_BTF_MISMATCH cannot
apply to kernel until clean the kernel code(bitbake linux-yocto -c cleanall) and rebuild.

After tracking the code, some options depend on CONFIG_PAHOLE_VERSION, it was generated by
scripts/pahole-version.sh in kernel, but during do_kernel_configme step, the pahole-native
is not available in sysroot-native, so need to wait pahole-native install to sysroot-native
before do_kernel_configme.

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
index 0cc303c009..0132fcffb3 100644
--- a/meta/recipes-kernel/linux/linux-yocto.inc
+++ b/meta/recipes-kernel/linux/linux-yocto.inc
@@ -65,7 +65,10 @@ KERNEL_DEBUG ?= ""
 DEPENDS += '${@bb.utils.contains_any("ARCH", [ "x86", "arm64", "powerpc" ], "elfutils-native", "", d)}'
 DEPENDS += "openssl-native util-linux-native"
 DEPENDS += "gmp-native libmpc-native"
-DEPENDS += '${@bb.utils.contains("KERNEL_DEBUG", "True", "pahole-native", "", d)}'
+
+# Some options depend on CONFIG_PAHOLE_VERSION, so need to make pahole-native available before do_kernel_configme
+do_kernel_configme[depends] += '${@bb.utils.contains("KERNEL_DEBUG", "True", "pahole-native:do_populate_sysroot", "", d)}'
+
 EXTRA_OEMAKE += '${@bb.utils.contains("KERNEL_DEBUG", "True", "", "PAHOLE=false", d)}'
 
 do_devshell:prepend() {
-- 
2.34.1


