Return-Path: <Ruiqiang.Hao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F79AC54EE9
	for <webhook@archiver.kernel.org>; Wed, 21 Sep 2022 03:22:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.2388.1663730553537218346
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 20:22:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=edPWu9yx;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=6263947b0a=ruiqiang.hao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28L3DIbS029505
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Sep 2022 03:22:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=jCu0Jt+5heKRYEAVXWEsp7/eg0iALR29FQ/Fcq06uQ4=;
 b=edPWu9yxY+Cc0mrfV2frknzAlDfwHmPpkOVGGvvvklM/skiPiicSYwgmXpWvpTB/JsvI
 jdDFjb3jlxMRv8Li/tcrYk8BN/sXuNPENinK424OYYtadHXnasl5GS9cXqX1KAh9+209
 SV8zxdCEGCpGKuvNxs1ZBaQPdlpPVSGdcIaX6SahjutuFXQ3tI37e0lMH0uKRrbwxvi7
 278IhTZCIhj/USmzNsDZgznL7K3vp7+GTJ/mCPlz/4hVgDCigch8/LgkhFlIoUiGF4n9
 mt3hPwEtsLn9R2WsLXurGmOM0nsiNvyP+WSs/tDgYoRKn0s8CWFmPAGol+hdu1V0jZy2 NA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jn3f1b6kd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Sep 2022 03:22:32 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28L3IXqV009185
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Sep 2022 03:22:31 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jn3f1b6ka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 03:22:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KY+Q9FPSuEsDaAPOnsM6NNMs+sySTAozLz+Qf5gULybIgBiTxuAZWCGHh9w4FpESkmB09DJY5rq2pKPd4C+4v6faA7emWkUqCBItqWE67Y/0SrWoL0Xq7sFBwOCYhncOmjVKTJ0pWute50K3eo9HoFrl/fKQ0l87JPasf+NH7n474aZPUNs3f2T85peyU+5LWWHoKDgDVqgN0NL7gQdYgQKBWE9HtnKOPUVBmWeArKaEqPDKTo9IL2SD8m5+5Ad66GuixLxDHM8b1yKZlB70UfoV1Tls068nRQOfBvr+WZdi2d/CUeU8cU0BgXkPjoo95qIfNau2t5lnoDzveXlaEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jCu0Jt+5heKRYEAVXWEsp7/eg0iALR29FQ/Fcq06uQ4=;
 b=i7dYrBlxE4FUVOOBAyTFcJxDzBPQFcucwJeB3zPXZrvV8AF721rHi/RPlsDjRdEJf3CmSxxgidqZLnBVs8S4UbpEuogf4Qxn5SUx9XqKRWSlTvnqmq36xOT0gKvuM6It5RStY/q505hAmSPrqKym4Ws/jOg+O2MZll552dv8vAZjtUl3dKa9Jj0nvnBf2+Ye2n2DpnsxsW2YFani/WLn+IgtVwcj0zKt1b5i0G3E2CqLz48mH1X+auK+aYszfu8OkvSiDfO4FgtwoE4OQGCcsQDiNuDawFr2o3BgyMRsNMQs4J4xfiiAsWDQqyKXhMA1oM4p1PZg9d6P/xOaqR3d0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB4166.namprd11.prod.outlook.com (2603:10b6:a03:191::25)
 by SJ0PR11MB6576.namprd11.prod.outlook.com (2603:10b6:a03:478::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.16; Wed, 21 Sep
 2022 03:22:29 +0000
Received: from BY5PR11MB4166.namprd11.prod.outlook.com
 ([fe80::f8ee:14f7:43:40df]) by BY5PR11MB4166.namprd11.prod.outlook.com
 ([fe80::f8ee:14f7:43:40df%6]) with mapi id 15.20.5654.016; Wed, 21 Sep 2022
 03:22:29 +0000
From: Ruiqiang Hao <ruiqiang.hao@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com
Subject: [kirkstone][PATCH 1/2] gcc: add arm-v9 support
Date: Wed, 21 Sep 2022 11:21:09 +0800
Message-Id: <20220921032110.985001-1-ruiqiang.hao@windriver.com>
X-Mailer: git-send-email 2.32.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0236.apcprd06.prod.outlook.com
 (2603:1096:4:ac::20) To BY5PR11MB4166.namprd11.prod.outlook.com
 (2603:10b6:a03:191::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4166:EE_|SJ0PR11MB6576:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ec989c6-62a8-4dab-8481-08da9b80836a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UtPGrvEdWrkFOweWAdERmufSsu33/RNNcD3cC2VELTk/+czpBNV0Q6rVULf/b9/t3WOVKjUxGZbteWDFCnQ857nWrxaF1chqVfFxz6K9lM4QQuGNmilvwcwdNd4CqTGGRtbCzza6XwuYoeknVcoldRJvpm2BhO72vX1P4cbAnj2gGidCpVDaYb6bvD3wGKbIC3YfgbifeOKy8aFxMloXIHCjE1PFXJX3iyIknz/+NjN161lajYUGD6egxkDtY5KVpD03SA5Sps5SXxirMa3B2tbjCSpGrzT5e20/skmnRNKYk8J/KP1sFB9sOPzQJSHsuf+PeuP+14OTFtt/Zg2vAwKyEiKiuTIf/a6Ln3kbc7GC+KSMtW0Dau7EUmMiGhAG5N7QU0lRhi9HA2jabHZxg58E43HujrzrC9t1CeKJdXnp625Jy/kEAgrQmyhwCD3C+um/4XbcteV8xsuZuRNgY4uvJJKy9+8qMsZ0Nx42+4EvRFwtusDgG704v+aYno+OgaBHPj8xzbNDOV74uLiMg6nQHldwgIDj5yjJrFh/ETr7nccP7XhjvvMg7LnrG96FNpU+lSVTC0uXOOjIv9oMEWWgcLJ8GCT5C0kNe2J9emZsQJASzyBhYsyDAtn7HMPODmUVBYAt2zVjiOXsc10tr/Hof/8+q4qg9Pqb2646Lg3bFndVXKlf5C49TeOTLz8PHV1PGRXZBx0p30YvNqGZSDKWRsUwhVjf8cwQRLoo4Me8p6sH/ZkPUMSyiiCjlVAdQ+3iPmgO4qoFOTK5L4PXFIXfZJH2dqbsnD1BHD82JLo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4166.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(376002)(396003)(366004)(136003)(346002)(451199015)(316002)(19627235002)(6916009)(86362001)(2906002)(52116002)(6506007)(186003)(1076003)(2616005)(84970400001)(6512007)(36756003)(26005)(8936002)(44832011)(5660300002)(83380400001)(4326008)(8676002)(66556008)(66946007)(66476007)(6666004)(30864003)(41300700001)(38350700002)(38100700002)(478600001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zZbhVNsPSvupozKRxsN648hX7IVIk5PMGwhVHVscHkwqcUmz2GWiULMS7QZ0?=
 =?us-ascii?Q?SwlYKuEd8pB3rIQSrJm8aMG4GK/S/kc+05T9DqYS5XsoIMWgn8zQ/v8LVegs?=
 =?us-ascii?Q?12I6YD/NDXYnGb0tHyRPN9dPcJolxNSKfsHGd9bUPFgxyINp+AGXwr5A3SXa?=
 =?us-ascii?Q?sHQaah5xryFe1nBNxMJu5PdZSdnBth8c2K4gZADfnee6AS2CDef4+ObtJ9qR?=
 =?us-ascii?Q?wW6h03jyRl4aRPckG/87cBAnhN/x7+ZBFNOaMIdI8rf3bV64qMsPEAznx8mB?=
 =?us-ascii?Q?1HO6qyDaFgRpnFozhdRcZUyTpnmGWWY8WtpZWJ4mGlbyXuwH2de7m8m6m/Np?=
 =?us-ascii?Q?AxhPAaybDvPhHdUcmzIgQsTC02MXPVxBA0JZI4MCMuxDZUBmDTCXicFLcU2U?=
 =?us-ascii?Q?ch5vjmUk3eKamSefsSv2hg/FD6fYE9w2jbAVEl93p4Kdd+m4IvcBvKqyg9q5?=
 =?us-ascii?Q?ay4KZ47LNThZbRPS/x8fNdqk8di+7ogX5mHLGJZoYrx+r5r37pHzBHXRnmnA?=
 =?us-ascii?Q?Q25V1czZRq0JpLrbtAHlfJdHddPkr1G/NYT1s4MqOMYmejLODCXUbAW2Nvco?=
 =?us-ascii?Q?waowbj1E+EcaIaOi+XY0Hz84pSPriIzvf9RVj5YVRBfTsFcbLPfZcFXGlG/y?=
 =?us-ascii?Q?0jKQjjRtZPC+0oi3NVWembVZfqx5l+K9nzrlQ4bnA7iQN97Ta+FqyUycsjHD?=
 =?us-ascii?Q?I4Kpvwk/Ogq5ohIR0f8jXmG8AMbsIwJlJO0KTGE0eRSlU8IZ4hZICQ9yZb9R?=
 =?us-ascii?Q?EvvgJRsoG4HkBkUUXqJPuuK4eB1eFClbGIAuACIzdZgJOAZRCjtbUFRQ3Tfc?=
 =?us-ascii?Q?sNI98ZBEglKDFSXMR+J/zyUt5ClSHAcaY2d5s0lMTvBirywu26s4fGnmeILp?=
 =?us-ascii?Q?wrGC3w570YZMl1+GzdTPrKPcYJURrSBkoHlTFmAfxTuNTq3NI5IOeWE68BEy?=
 =?us-ascii?Q?IKsQ/DjajLzyh6ufFs/EKOcrrPm3rUzJ875A+RxS8jxUGQEIfpD1hzTM1fSL?=
 =?us-ascii?Q?zqeeMm6WMS1jypAhMZ1yJbJtBbcpzaiYWdBX92dt/PYC0HRhWEFhtOA5Acex?=
 =?us-ascii?Q?dnZPjFBJUSG+iRhcr36Gbgv4Ddt4rzfVz3fkJdjYrSt58Psh8kFwyT3bx2l7?=
 =?us-ascii?Q?Aqu9/VOexKRRdXjcYkbHQ+1N8Xy6R2EFjQTD/BHaTJPOFB+Us9YzXCYZRzqq?=
 =?us-ascii?Q?1X0hX0qbxf/zUKarfeh9QjRvJyDO8c7VvuFfzb6Lm8YU28wwCPOhPu27U//M?=
 =?us-ascii?Q?enWw8xzbpv5+Khce3ihJkM5fkgmLIvw5VUxDJaJ4zDGfZMapQe8WGwf4fL3Q?=
 =?us-ascii?Q?8wItOhJ56I72rVBzWbgMPzPyLtHVUPvLjmImepCgStFAN/46YDLtBx7YOUc3?=
 =?us-ascii?Q?i8NsApgZZODHtQOfWP8yIR+m7mhBACT+8Bs/iRd6aM5ZPe2mnHrkcVFiFtCi?=
 =?us-ascii?Q?c0JrBbgYlyxl+sdlKS5kGa5GsbQdsdmnoi51Gu3FwCuT4DijNbjlxpSDgvEJ?=
 =?us-ascii?Q?2a4fxBjDdxtjLryoCbInxGtrivnSwY1E14ev3DAEdL8XIM6AViTSSJCyIlMB?=
 =?us-ascii?Q?/TQ03CYL7AfRzr90xRLXgrFeZwpDPvgcQWUvun6ekvyV9QNbsi60ZoMUEafK?=
 =?us-ascii?Q?vg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2ec989c6-62a8-4dab-8481-08da9b80836a
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4166.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2022 03:22:29.2698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 a9baBwu2O0f1NI+BN+wtAWWRSj4EqepO1tLFwszRGMrQfx2m2GvCINbK5m8j+cBjIy6jKBbDg2asrRFZWTMy0MLJmxaNsji5QW38YuIgFZw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6576
X-Proofpoint-ORIG-GUID: KYf3NtBbEUxLGmxgNmjm4a3npNhls2pq
X-Proofpoint-GUID: pVS_06TYyDw_wgc3g1O2jxla8aZafcQL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-21_02,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209210020
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Sep 2022 03:22:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170928

From: Ruiqiang Hao <Ruiqiang.Hao@windriver.com>

Backport some patches from GCC 12 to support arm-v9.

Signed-off-by: Ruiqiang Hao <Ruiqiang.Hao@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-11.3.inc        |   5 +
 ...rch64-Update-Neoverse-N2-core-defini.patch |  42 +++
 .../0002-aarch64-add-armv9-a-to-march.patch   |  89 ++++++
 ...le-FP16-feature-by-default-for-Armv9.patch |  38 +++
 ...rm-add-armv9-a-architecture-to-march.patch | 294 ++++++++++++++++++
 5 files changed, 468 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0001-aarch64-Update-Neoverse-N2-core-defini.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0002-aarch64-add-armv9-a-to-march.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0003-aarch64-Enable-FP16-feature-by-default-for-Armv9.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0004-arm-add-armv9-a-architecture-to-march.patch

diff --git a/meta/recipes-devtools/gcc/gcc-11.3.inc b/meta/recipes-devtools/gcc/gcc-11.3.inc
index acbb43a25f..0f1799d383 100644
--- a/meta/recipes-devtools/gcc/gcc-11.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-11.3.inc
@@ -65,7 +65,12 @@ SRC_URI = "\
            file://0003-CVE-2021-42574.patch \
            file://0004-CVE-2021-42574.patch \
            file://0001-CVE-2021-46195.patch \
+	   file://0001-aarch64-Update-Neoverse-N2-core-defini.patch \
+	   file://0002-aarch64-add-armv9-a-to-march.patch \
+	   file://0003-aarch64-Enable-FP16-feature-by-default-for-Armv9.patch \
+	   file://0004-arm-add-armv9-a-architecture-to-march.patch \
 "
+
 SRC_URI[sha256sum] = "b47cf2818691f5b1e21df2bb38c795fac2cfbd640ede2d0a5e1c89e338a3ac39"
 
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
diff --git a/meta/recipes-devtools/gcc/gcc/0001-aarch64-Update-Neoverse-N2-core-defini.patch b/meta/recipes-devtools/gcc/gcc/0001-aarch64-Update-Neoverse-N2-core-defini.patch
new file mode 100644
index 0000000000..8429242348
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0001-aarch64-Update-Neoverse-N2-core-defini.patch
@@ -0,0 +1,42 @@
+From 9f37d31324f89d0b7b2abac988a976d121ae29c6 Mon Sep 17 00:00:00 2001
+From: Andre Vieira <andre.simoesdiasvieira@arm.com>
+Date: Thu, 8 Sep 2022 06:02:18 +0000
+Subject: [PATCH 1/4] aarch64: Update Neoverse N2 core definition
+
+commit 9f37d31324f89d0b7b2abac988a976d121ae29c6 from upstream.
+
+gcc/ChangeLog:
+
+        * config/aarch64/aarch64-cores.def: Update Neoverse N2 core entry.
+
+Upstream-Status: Backport
+Signed-off-by: Ruiqiang Hao <Ruiqiang.Hao@windriver.com>
+---
+ gcc/config/aarch64/aarch64-cores.def | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/gcc/config/aarch64/aarch64-cores.def b/gcc/config/aarch64/aarch64-cores.def
+index 4643e0e27..3478e567a 100644
+--- a/gcc/config/aarch64/aarch64-cores.def
++++ b/gcc/config/aarch64/aarch64-cores.def
+@@ -145,9 +145,6 @@ AARCH64_CORE("neoverse-512tvb", neoverse512tvb, cortexa57, 8_4A,  AARCH64_FL_FOR
+ /* Qualcomm ('Q') cores. */
+ AARCH64_CORE("saphira",     saphira,    saphira,    8_4A,  AARCH64_FL_FOR_ARCH8_4 | AARCH64_FL_CRYPTO | AARCH64_FL_RCPC, saphira,   0x51, 0xC01, -1)
+ 
+-/* Armv8.5-A Architecture Processors.  */
+-AARCH64_CORE("neoverse-n2", neoversen2, cortexa57, 8_5A, AARCH64_FL_FOR_ARCH8_5 | AARCH64_FL_I8MM | AARCH64_FL_BF16 | AARCH64_FL_F16 | AARCH64_FL_SVE | AARCH64_FL_SVE2 | AARCH64_FL_SVE2_BITPERM | AARCH64_FL_RNG | AARCH64_FL_MEMTAG, neoversen2, 0x41, 0xd49, -1)
+-
+ /* ARMv8-A big.LITTLE implementations.  */
+ 
+ AARCH64_CORE("cortex-a57.cortex-a53",  cortexa57cortexa53, cortexa53, 8A,  AARCH64_FL_FOR_ARCH8 | AARCH64_FL_CRC, cortexa57, 0x41, AARCH64_BIG_LITTLE (0xd07, 0xd03), -1)
+@@ -163,4 +160,7 @@ AARCH64_CORE("cortex-a76.cortex-a55",  cortexa76cortexa55, cortexa53, 8_2A,  AAR
+ /* Armv8-R Architecture Processors.  */
+ AARCH64_CORE("cortex-r82", cortexr82, cortexa53, 8R, AARCH64_FL_FOR_ARCH8_R, cortexa53, 0x41, 0xd15, -1)
+ 
++/* Armv9-A Architecture Processors. */
++AARCH64_CORE("neoverse-n2", neoversen2, cortexa57, 9A, AARCH64_FL_FOR_ARCH9 | AARCH64_FL_I8MM | AARCH64_FL_BF16 | AARCH64_FL_SVE2_BITPERM | AARCH64_FL_RNG | AARCH64_FL_MEMTAG | AARCH64_FL_PROFILE, neoversen2, 0x41, 0xd49, -1)
++
+ #undef AARCH64_CORE
+-- 
+2.32.0
+
diff --git a/meta/recipes-devtools/gcc/gcc/0002-aarch64-add-armv9-a-to-march.patch b/meta/recipes-devtools/gcc/gcc/0002-aarch64-add-armv9-a-to-march.patch
new file mode 100644
index 0000000000..2b1c17f53e
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0002-aarch64-add-armv9-a-to-march.patch
@@ -0,0 +1,89 @@
+From d3cf45d15b2fabc767b2d10a0c6bb9fb845e4f99 Mon Sep 17 00:00:00 2001
+From: Przemyslaw Wirkus <przemyslaw.wirkus@arm.com>
+Date: Fri, 1 Oct 2021 10:06:45 +0100
+Subject: [PATCH 2/4] aarch64: add armv9-a to -march
+
+commit f0688d42c9b74a6999548ff2e79ae440b049b87f from upstream
+
+gcc/ChangeLog:
+
+	* config/aarch64/aarch64-arches.def (AARCH64_ARCH): Added
+	armv9-a.
+	* config/aarch64/aarch64.h (AARCH64_FL_V9): New.
+	(AARCH64_FL_FOR_ARCH9): New flags for Armv9-A.
+	(AARCH64_ISA_V9): New ISA flag.
+	* doc/invoke.texi: Update docs.
+
+Upstream-Status: Backport
+Signed-off-by: Ruiqiang Hao <Ruiqiang.Hao@windriver.com>
+---
+ gcc/config/aarch64/aarch64-arches.def | 1 +
+ gcc/config/aarch64/aarch64.h          | 5 +++++
+ gcc/doc/invoke.texi                   | 3 +++
+ 3 files changed, 9 insertions(+)
+
+diff --git a/gcc/config/aarch64/aarch64-arches.def b/gcc/config/aarch64/aarch64-arches.def
+index b7497277b..c47ca622c 100644
+--- a/gcc/config/aarch64/aarch64-arches.def
++++ b/gcc/config/aarch64/aarch64-arches.def
+@@ -38,5 +38,6 @@ AARCH64_ARCH("armv8.4-a",     generic,	     8_4A,	8,  AARCH64_FL_FOR_ARCH8_4)
+ AARCH64_ARCH("armv8.5-a",     generic,	     8_5A,	8,  AARCH64_FL_FOR_ARCH8_5)
+ AARCH64_ARCH("armv8.6-a",     generic,	     8_6A,	8,  AARCH64_FL_FOR_ARCH8_6)
+ AARCH64_ARCH("armv8-r",       generic,	     8R  ,	8,  AARCH64_FL_FOR_ARCH8_R)
++AARCH64_ARCH("armv9-a",       generic,	     9A  ,	9,  AARCH64_FL_FOR_ARCH9)
+ 
+ #undef AARCH64_ARCH
+diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64.h
+index bfffbcd6a..b914bfb5c 100644
+--- a/gcc/config/aarch64/aarch64.h
++++ b/gcc/config/aarch64/aarch64.h
+@@ -230,6 +230,8 @@ extern unsigned aarch64_architecture_version;
+ 
+ /* Pointer Authentication (PAUTH) extension.  */
+ #define AARCH64_FL_PAUTH      (1ULL << 40)
++/* Armv9.0-A.  */
++#define AARCH64_FL_V9         (1ULL << 41)  /* Armv9.0-A Architecture.  */
+ 
+ /* Has FP and SIMD.  */
+ #define AARCH64_FL_FPSIMD     (AARCH64_FL_FP | AARCH64_FL_SIMD)
+@@ -257,6 +259,8 @@ extern unsigned aarch64_architecture_version;
+    | AARCH64_FL_I8MM | AARCH64_FL_BF16)
+ #define AARCH64_FL_FOR_ARCH8_R     \
+   (AARCH64_FL_FOR_ARCH8_4 | AARCH64_FL_V8_R)
++#define AARCH64_FL_FOR_ARCH9       \
++  (AARCH64_FL_FOR_ARCH8_5 | AARCH64_FL_SVE | AARCH64_FL_SVE2 | AARCH64_FL_V9)
+ 
+ /* Macros to test ISA flags.  */
+ 
+@@ -295,6 +299,7 @@ extern unsigned aarch64_architecture_version;
+ #define AARCH64_ISA_SB		   (aarch64_isa_flags & AARCH64_FL_SB)
+ #define AARCH64_ISA_V8_R	   (aarch64_isa_flags & AARCH64_FL_V8_R)
+ #define AARCH64_ISA_PAUTH	   (aarch64_isa_flags & AARCH64_FL_PAUTH)
++#define AARCH64_ISA_V9		   (aarch64_isa_flags & AARCH64_FL_V9)
+ 
+ /* Crypto is an optional extension to AdvSIMD.  */
+ #define TARGET_CRYPTO (TARGET_SIMD && AARCH64_ISA_CRYPTO)
+diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
+index c47cfd472..7184a62d0 100644
+--- a/gcc/doc/invoke.texi
++++ b/gcc/doc/invoke.texi
+@@ -18270,6 +18270,8 @@ and the features that they enable by default:
+ @item @samp{armv8.4-a} @tab Armv8.4-A @tab @samp{armv8.3-a}, @samp{+flagm}, @samp{+fp16fml}, @samp{+dotprod}
+ @item @samp{armv8.5-a} @tab Armv8.5-A @tab @samp{armv8.4-a}, @samp{+sb}, @samp{+ssbs}, @samp{+predres}
+ @item @samp{armv8.6-a} @tab Armv8.6-A @tab @samp{armv8.5-a}, @samp{+bf16}, @samp{+i8mm}
++@item @samp{armv8.7-a} @tab Armv8.7-A @tab @samp{armv8.6-a}, @samp{+ls64}
++@item @samp{armv9-a} @tab Armv9-A @tab @samp{armv8.5-a}, @samp{+sve}, @samp{+sve2}
+ @item @samp{armv8-r} @tab Armv8-R @tab @samp{armv8-r}
+ @end multitable
+ 
+@@ -19692,6 +19694,7 @@ Permissible names are:
+ @samp{armv8.4-a},
+ @samp{armv8.5-a},
+ @samp{armv8.6-a},
++@samp{armv9-a},
+ @samp{armv7-r},
+ @samp{armv8-r},
+ @samp{armv6-m}, @samp{armv6s-m},
+-- 
+2.32.0
+
diff --git a/meta/recipes-devtools/gcc/gcc/0003-aarch64-Enable-FP16-feature-by-default-for-Armv9.patch b/meta/recipes-devtools/gcc/gcc/0003-aarch64-Enable-FP16-feature-by-default-for-Armv9.patch
new file mode 100644
index 0000000000..2e85384b43
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0003-aarch64-Enable-FP16-feature-by-default-for-Armv9.patch
@@ -0,0 +1,38 @@
+From 49bfa1927813ae898dfa4e0d2bbde033c353e3dc Mon Sep 17 00:00:00 2001
+From: Andre Vieira <andre.simoesdiasvieira@arm.com>
+Date: Tue, 22 Mar 2022 11:44:06 +0000
+Subject: [PATCH 3/4] aarch64: Enable FP16 feature by default for Armv9
+
+commit 0bae246acc758d4b11dd575b05207fd69169109b from upstream
+
+This patch adds the feature bit for FP16 to the feature set for Armv9 since
+Armv9 requires SVE to be implemented and SVE requires FP16 to be implemented.
+
+2022-03-22  Andre Vieira  <andre.simoesdiasvieira@arm.com>
+
+	* config/aarch64/aarch64.h (AARCH64_FL_FOR_ARCH9): Add FP16 feature
+	bit.
+
+Upstream-Status: Backport
+Signed-off-by: Ruiqiang Hao <Ruiqiang.Hao@windriver.com>
+---
+ gcc/config/aarch64/aarch64.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/gcc/config/aarch64/aarch64.h b/gcc/config/aarch64/aarch64.h
+index b914bfb5c..55b60d540 100644
+--- a/gcc/config/aarch64/aarch64.h
++++ b/gcc/config/aarch64/aarch64.h
+@@ -260,7 +260,8 @@ extern unsigned aarch64_architecture_version;
+ #define AARCH64_FL_FOR_ARCH8_R     \
+   (AARCH64_FL_FOR_ARCH8_4 | AARCH64_FL_V8_R)
+ #define AARCH64_FL_FOR_ARCH9       \
+-  (AARCH64_FL_FOR_ARCH8_5 | AARCH64_FL_SVE | AARCH64_FL_SVE2 | AARCH64_FL_V9)
++  (AARCH64_FL_FOR_ARCH8_5 | AARCH64_FL_SVE | AARCH64_FL_SVE2 | AARCH64_FL_V9 \
++   | AARCH64_FL_F16)
+ 
+ /* Macros to test ISA flags.  */
+ 
+-- 
+2.32.0
+
diff --git a/meta/recipes-devtools/gcc/gcc/0004-arm-add-armv9-a-architecture-to-march.patch b/meta/recipes-devtools/gcc/gcc/0004-arm-add-armv9-a-architecture-to-march.patch
new file mode 100644
index 0000000000..c38d1b9119
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0004-arm-add-armv9-a-architecture-to-march.patch
@@ -0,0 +1,294 @@
+From e66a37acae62236611f951e706e9a2bfbd753f39 Mon Sep 17 00:00:00 2001
+From: Przemyslaw Wirkus <przemyslaw.wirkus@arm.com>
+Date: Tue, 9 Nov 2021 09:40:05 +0000
+Subject: [PATCH 4/4] arm: add armv9-a architecture to -march
+
+commit 32ba7860ccaddd5219e6dae94a3d0653e124c9dd from upstream
+
+In this patch:
+	+ Add `armv9-a` to -march.
+	+ Update multilib with armv9-a and armv9-a+simd.
+
+gcc/ChangeLog:
+
+	* config/arm/arm-cpus.in (armv9): New define.
+	(ARMv9a): New group.
+	(armv9-a): New arch definition.
+	* config/arm/arm-tables.opt: Regenerate.
+	* config/arm/arm.h (BASE_ARCH_9A): New arch enum value.
+	* config/arm/t-aprofile: Added armv9-a and armv9+simd.
+	* config/arm/t-arm-elf: Added arm9-a, v9_fps and all_v9_archs
+	to MULTILIB_MATCHES.
+	* config/arm/t-multilib: Added v9_a_nosimd_variants and
+	v9_a_simd_variants to MULTILIB_MATCHES.
+	* doc/invoke.texi: Update docs.
+
+gcc/testsuite/ChangeLog:
+
+	* gcc.target/arm/multilib.exp: Update test with armv9-a entries.
+	* lib/target-supports.exp (v9a): Add new armflag.
+	(__ARM_ARCH_9A__): Add new armdef.
+
+Upstream-Status: Backport
+Signed-off-by: Ruiqiang Hao <Ruiqiang.Hao@windriver.com>
+---
+ gcc/config/arm/arm-cpus.in                | 19 +++++++++++++++++
+ gcc/config/arm/arm-tables.opt             |  7 +++++--
+ gcc/config/arm/arm.h                      |  3 ++-
+ gcc/config/arm/t-aprofile                 | 25 +++++++++++++++++++----
+ gcc/config/arm/t-arm-elf                  |  9 ++++++++
+ gcc/config/arm/t-multilib                 | 12 +++++++++++
+ gcc/doc/invoke.texi                       |  1 +
+ gcc/testsuite/gcc.target/arm/multilib.exp |  8 ++++++++
+ gcc/testsuite/lib/target-supports.exp     |  3 ++-
+ 9 files changed, 79 insertions(+), 8 deletions(-)
+
+diff --git a/gcc/config/arm/arm-cpus.in b/gcc/config/arm/arm-cpus.in
+index bcc9ebe9f..58d83829c 100644
+--- a/gcc/config/arm/arm-cpus.in
++++ b/gcc/config/arm/arm-cpus.in
+@@ -132,6 +132,9 @@ define feature cmse
+ # Architecture rel 8.1-M.
+ define feature armv8_1m_main
+ 
++# Architecture rel 9.0.
++define feature armv9
++
+ # Floating point and Neon extensions.
+ # VFPv1 is not supported in GCC.
+ 
+@@ -293,6 +296,7 @@ define fgroup ARMv8m_base ARMv6m armv8 cmse tdiv
+ define fgroup ARMv8m_main ARMv7m armv8 cmse
+ define fgroup ARMv8r      ARMv8a
+ define fgroup ARMv8_1m_main ARMv8m_main armv8_1m_main
++define fgroup ARMv9a      ARMv8_5a armv9
+ 
+ # Useful combinations.
+ define fgroup VFPv2	vfpv2
+@@ -751,6 +755,21 @@ begin arch armv8.1-m.main
+  option cdecp7 add cdecp7
+ end arch armv8.1-m.main
+ 
++begin arch armv9-a
++ tune for cortex-a53
++ tune flags CO_PROC
++ base 9A
++ profile A
++ isa ARMv9a
++ option simd add FP_ARMv8 DOTPROD
++ option fp16 add fp16 fp16fml FP_ARMv8 DOTPROD
++ option crypto add FP_ARMv8 CRYPTO DOTPROD
++ option nocrypto remove ALL_CRYPTO
++ option nofp remove ALL_FP
++ option i8mm add i8mm FP_ARMv8 DOTPROD
++ option bf16 add bf16 FP_ARMv8 DOTPROD
++end arch armv9-a
++
+ begin arch iwmmxt
+  tune for iwmmxt
+  tune flags LDSCHED STRONG XSCALE
+diff --git a/gcc/config/arm/arm-tables.opt b/gcc/config/arm/arm-tables.opt
+index 5692d4fb7..ae3dd9414 100644
+--- a/gcc/config/arm/arm-tables.opt
++++ b/gcc/config/arm/arm-tables.opt
+@@ -380,10 +380,13 @@ EnumValue
+ Enum(arm_arch) String(armv8.1-m.main) Value(30)
+ 
+ EnumValue
+-Enum(arm_arch) String(iwmmxt) Value(31)
++Enum(arm_arch) String(armv9-a) Value(31)
+ 
+ EnumValue
+-Enum(arm_arch) String(iwmmxt2) Value(32)
++Enum(arm_arch) String(iwmmxt) Value(32)
++
++EnumValue
++Enum(arm_arch) String(iwmmxt2) Value(33)
+ 
+ Enum
+ Name(arm_fpu) Type(enum fpu_type)
+diff --git a/gcc/config/arm/arm.h b/gcc/config/arm/arm.h
+index 47c13a9e5..088c7725c 100644
+--- a/gcc/config/arm/arm.h
++++ b/gcc/config/arm/arm.h
+@@ -456,7 +456,8 @@ enum base_architecture
+   BASE_ARCH_8A = 8,
+   BASE_ARCH_8M_BASE = 8,
+   BASE_ARCH_8M_MAIN = 8,
+-  BASE_ARCH_8R = 8
++  BASE_ARCH_8R = 8,
++  BASE_ARCH_9A = 9
+ };
+ 
+ /* The major revision number of the ARM Architecture implemented by the target.  */
+diff --git a/gcc/config/arm/t-aprofile b/gcc/config/arm/t-aprofile
+index 8574ac3e2..68e2251c7 100644
+--- a/gcc/config/arm/t-aprofile
++++ b/gcc/config/arm/t-aprofile
+@@ -26,8 +26,8 @@
+ 
+ # Arch and FPU variants to build libraries with
+ 
+-MULTI_ARCH_OPTS_A       = march=armv7-a/march=armv7-a+fp/march=armv7-a+simd/march=armv7ve+simd/march=armv8-a/march=armv8-a+simd
+-MULTI_ARCH_DIRS_A       = v7-a v7-a+fp v7-a+simd v7ve+simd v8-a v8-a+simd
++MULTI_ARCH_OPTS_A       = march=armv7-a/march=armv7-a+fp/march=armv7-a+simd/march=armv7ve+simd/march=armv8-a/march=armv8-a+simd/march=armv9-a/march=armv9-a+simd
++MULTI_ARCH_DIRS_A       = v7-a v7-a+fp v7-a+simd v7ve+simd v8-a v8-a+simd v9-a v9-a+simd
+ 
+ # ARMv7-A - build nofp, fp-d16 and SIMD variants
+ 
+@@ -46,6 +46,11 @@ MULTILIB_REQUIRED	+= mthumb/march=armv8-a/mfloat-abi=soft
+ MULTILIB_REQUIRED	+= mthumb/march=armv8-a+simd/mfloat-abi=hard
+ MULTILIB_REQUIRED	+= mthumb/march=armv8-a+simd/mfloat-abi=softfp
+ 
++# Armv9-A - build nofp and SIMD variants.
++MULTILIB_REQUIRED	+= mthumb/march=armv9-a/mfloat-abi=soft
++MULTILIB_REQUIRED	+= mthumb/march=armv9-a+simd/mfloat-abi=hard
++MULTILIB_REQUIRED	+= mthumb/march=armv9-a+simd/mfloat-abi=softfp
++
+ # Matches
+ 
+ # Arch Matches
+@@ -129,17 +134,29 @@ MULTILIB_MATCHES	+= march?armv8-a=march?armv8.6-a
+ MULTILIB_MATCHES	+= $(foreach ARCH, $(v8_6_a_simd_variants), \
+ 			     march?armv8-a+simd=march?armv8.6-a$(ARCH))
+ 
++# Armv9 without SIMD: map down to base architecture
++MULTILIB_MATCHES	+= $(foreach ARCH, $(v9_a_nosimd_variants), \
++			     march?armv9-a=march?armv9-a$(ARCH))
++
++# Armv9 with SIMD: map down to base arch + simd
++MULTILIB_MATCHES	+= march?armv9-a+simd=march?armv9-a+crc+simd \
++			   $(foreach ARCH, $(filter-out +simd, $(v9_a_simd_variants)), \
++			     march?armv9-a+simd=march?armv9-a$(ARCH) \
++			     march?armv9-a+simd=march?armv9-a+crc$(ARCH))
++
+ # Use Thumb libraries for everything.
+ 
+ MULTILIB_REUSE		+= mthumb/march.armv7-a/mfloat-abi.soft=marm/march.armv7-a/mfloat-abi.soft
+ 
+ MULTILIB_REUSE		+= mthumb/march.armv8-a/mfloat-abi.soft=marm/march.armv8-a/mfloat-abi.soft
+ 
++MULTILIB_REUSE		+= mthumb/march.armv9-a/mfloat-abi.soft=marm/march.armv9-a/mfloat-abi.soft
++
+ MULTILIB_REUSE		+= $(foreach ABI, hard softfp, \
+-			     $(foreach ARCH, armv7-a+fp armv7-a+simd armv7ve+simd armv8-a+simd, \
++			     $(foreach ARCH, armv7-a+fp armv7-a+simd armv7ve+simd armv8-a+simd armv9-a+simd, \
+ 			       mthumb/march.$(ARCH)/mfloat-abi.$(ABI)=marm/march.$(ARCH)/mfloat-abi.$(ABI)))
+ 
+ # Softfp but no FP, use the soft-float libraries.
+ MULTILIB_REUSE		+= $(foreach MODE, arm thumb, \
+-			     $(foreach ARCH, armv7-a armv8-a, \
++			     $(foreach ARCH, armv7-a armv8-a armv9-a, \
+ 			       mthumb/march.$(ARCH)/mfloat-abi.soft=m$(MODE)/march.$(ARCH)/mfloat-abi.softfp))
+diff --git a/gcc/config/arm/t-arm-elf b/gcc/config/arm/t-arm-elf
+index d68def308..b3a900e8c 100644
+--- a/gcc/config/arm/t-arm-elf
++++ b/gcc/config/arm/t-arm-elf
+@@ -38,6 +38,8 @@ v7ve_fps	:= vfpv3-d16 vfpv3 vfpv3-d16-fp16 vfpv3-fp16 vfpv4 neon \
+ # it seems to work ok.
+ v8_fps		:= simd fp16 crypto fp16+crypto dotprod fp16fml
+ 
++v9_fps		:= simd fp16 crypto fp16+crypto dotprod fp16fml
++
+ # We don't do anything special with these.  Pre-v4t probably doesn't work.
+ all_early_nofp	:= armv4 armv4t armv5t
+ 
+@@ -49,6 +51,8 @@ all_v7_a_r	:= armv7-a armv7ve armv7-r
+ all_v8_archs	:= armv8-a armv8-a+crc armv8.1-a armv8.2-a armv8.3-a armv8.4-a \
+ 		   armv8.5-a armv8.6-a
+ 
++all_v9_archs	:= armv9-a
++
+ # No floating point variants, require thumb1 softfp
+ all_nofp_t	:= armv6-m armv6s-m armv8-m.base
+ 
+@@ -110,6 +114,11 @@ MULTILIB_MATCHES     += $(foreach ARCH, $(all_v8_archs), \
+ 			  $(foreach FPARCH, $(v8_fps), \
+ 			    march?armv7+fp=march?$(ARCH)+$(FPARCH)))
+ 
++MULTILIB_MATCHES     += $(foreach ARCH, $(all_v9_archs), \
++			  march?armv7+fp=march?$(ARCH) \
++			  $(foreach FPARCH, $(v9_fps), \
++			    march?armv7+fp=march?$(ARCH)+$(FPARCH)))
++
+ MULTILIB_MATCHES     += $(foreach ARCH, armv7e-m armv8-m.mainline, \
+ 			  march?armv7+fp=march?$(ARCH)+fp.dp)
+ 
+diff --git a/gcc/config/arm/t-multilib b/gcc/config/arm/t-multilib
+index ddc5033bf..d789b86ee 100644
+--- a/gcc/config/arm/t-multilib
++++ b/gcc/config/arm/t-multilib
+@@ -78,6 +78,8 @@ v8_4_a_simd_variants	:= $(call all_feat_combs, simd fp16 crypto i8mm bf16)
+ v8_5_a_simd_variants	:= $(call all_feat_combs, simd fp16 crypto i8mm bf16)
+ v8_6_a_simd_variants	:= $(call all_feat_combs, simd fp16 crypto i8mm bf16)
+ v8_r_nosimd_variants	:= +crc
++v9_a_nosimd_variants	:= +crc
++v9_a_simd_variants	:= $(call all_feat_combs, simd fp16 crypto i8mm bf16)
+ 
+ ifneq (,$(HAS_APROFILE))
+ include $(srcdir)/config/arm/t-aprofile
+@@ -202,6 +204,16 @@ MULTILIB_MATCHES	+= march?armv7=march?armv8.6-a
+ MULTILIB_MATCHES	+= $(foreach ARCH, $(v8_6_a_simd_variants), \
+ 			     march?armv7+fp=march?armv8.6-a$(ARCH))
+ 
++# Armv9
++MULTILIB_MATCHES	+= march?armv7=march?armv9-a
++MULTILIB_MATCHES	+= $(foreach ARCH, $(v9_a_nosimd_variants), \
++			     march?armv7=march?armv9-a$(ARCH))
++
++# Armv9 with SIMD
++MULTILIB_MATCHES	+= march?armv7+fp=march?armv9-a+crc+simd \
++			   $(foreach ARCH, $(v9_a_simd_variants), \
++			     march?armv7+fp=march?armv9-a$(ARCH) \
++			     march?armv7+fp=march?armv9-a+crc$(ARCH))
+ endif		# Not APROFILE.
+ 
+ # Use Thumb libraries for everything.
+diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
+index 7184a62d0..9a712c0d6 100644
+--- a/gcc/doc/invoke.texi
++++ b/gcc/doc/invoke.texi
+@@ -19701,6 +19701,7 @@ Permissible names are:
+ @samp{armv7-m}, @samp{armv7e-m},
+ @samp{armv8-m.base}, @samp{armv8-m.main},
+ @samp{armv8.1-m.main},
++@samp{armv9-a},
+ @samp{iwmmxt} and @samp{iwmmxt2}.
+ 
+ Additionally, the following architectures, which lack support for the
+diff --git a/gcc/testsuite/gcc.target/arm/multilib.exp b/gcc/testsuite/gcc.target/arm/multilib.exp
+index 4b30025db..e3f06c316 100644
+--- a/gcc/testsuite/gcc.target/arm/multilib.exp
++++ b/gcc/testsuite/gcc.target/arm/multilib.exp
+@@ -135,6 +135,14 @@ if {[multilib_config "aprofile"] } {
+ 	{-march=armv8.6-a+simd+fp16 -mfloat-abi=softfp} "thumb/v8-a+simd/softfp"
+ 	{-march=armv8.6-a+simd+fp16+nofp -mfloat-abi=softfp} "thumb/v8-a/nofp"
+ 	{-march=armv8.6-a+simd+nofp+fp16 -mfloat-abi=softfp} "thumb/v8-a+simd/softfp"
++	{-march=armv9-a+crypto -mfloat-abi=soft} "thumb/v9-a/nofp"
++	{-march=armv9-a+simd+crypto -mfloat-abi=softfp} "thumb/v9-a+simd/softfp"
++	{-march=armv9-a+simd+crypto+nofp -mfloat-abi=softfp} "thumb/v9-a/nofp"
++	{-march=armv9-a+simd+nofp+crypto -mfloat-abi=softfp} "thumb/v9-a+simd/softfp"
++	{-march=armv9-a+fp16 -mfloat-abi=soft} "thumb/v9-a/nofp"
++	{-march=armv9-a+simd+fp16 -mfloat-abi=softfp} "thumb/v9-a+simd/softfp"
++	{-march=armv9-a+simd+fp16+nofp -mfloat-abi=softfp} "thumb/v9-a/nofp"
++	{-march=armv9-a+simd+nofp+fp16 -mfloat-abi=softfp} "thumb/v9-a+simd/softfp"
+ 	{-mcpu=cortex-a53+crypto -mfloat-abi=hard} "thumb/v8-a+simd/hard"
+ 	{-mcpu=cortex-a53+nofp -mfloat-abi=softfp} "thumb/v8-a/nofp"
+ 	{-march=armv8-a+crc -mfloat-abi=hard -mfpu=vfp} "thumb/v8-a+simd/hard"
+diff --git a/gcc/testsuite/lib/target-supports.exp b/gcc/testsuite/lib/target-supports.exp
+index 857e57218..52e043917 100644
+--- a/gcc/testsuite/lib/target-supports.exp
++++ b/gcc/testsuite/lib/target-supports.exp
+@@ -4820,7 +4820,8 @@ foreach { armfunc armflag armdefs } {
+ 	v8m_base "-march=armv8-m.base -mthumb -mfloat-abi=soft"
+ 		__ARM_ARCH_8M_BASE__
+ 	v8m_main "-march=armv8-m.main -mthumb" __ARM_ARCH_8M_MAIN__
+-	v8_1m_main "-march=armv8.1-m.main -mthumb" __ARM_ARCH_8M_MAIN__ } {
++	v8_1m_main "-march=armv8.1-m.main -mthumb" __ARM_ARCH_8M_MAIN__
++	v9a "-march=armv9-a" __ARM_ARCH_9A__ } {
+     eval [string map [list FUNC $armfunc FLAG $armflag DEFS $armdefs ] {
+ 	proc check_effective_target_arm_arch_FUNC_ok { } {
+ 	    return [check_no_compiler_messages arm_arch_FUNC_ok assembly {
+-- 
+2.34.1
+
-- 
2.32.0


