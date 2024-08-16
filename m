Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBFE7C52D7D
	for <webhook@archiver.kernel.org>; Fri, 16 Aug 2024 12:34:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.146791.1723811683565078012
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Aug 2024 05:34:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=89584bbe91=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47G7mjxX030564
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Aug 2024 05:34:43 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 411vptge8a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Aug 2024 05:34:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nQvGKevE/89fOizCjS1oxmsz/nP/UQBN2Zeop16okToiEW7/oPWDm/hbl/46yyS740yctwE2gXykPDMgoc4yEXUwFPPJL4StClyLaXL/KMp4OjtGrWThEahTU7oxzL1lwcIX7puH37zdRLtvAhDZzlEzhH322DY0F7SsqLQ30jNjUQQY4wBUm71V5dGfrbPNMDUa49rNrsdn0wrpu0tN0xim9IbOl463yRIloWyFjy/X/qSm0yZuwSijpMjCj+/UimFtmegpFSMuks+omoP0lMEXtASYPJU6JXDxw09MUZVtPpFlDiaoI528s2zpqY894EO/cavM2QvMIHnGsWrjkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jqhn5ix+lCCOYyxQ9arB/1rtBP4rQB+prc6DdOX0hcM=;
 b=h9taOQrdhaySgaticXQzKvyusOQk/c6TuPjd7FYdYNlh6ws1i5nwCoBNsTup/aLfla8geizBdJ8TS75DRhWqZfkVkDG+qLG4AdrYA3CbFbJFGG/GW0ukz0ubiLYnKU6drrDuJmRxYSetTjIPDVKkUCxHrivscvN/sgGvs4bntHJJPiVeJHMn3zyNf0h1FDenq7JmN/7XWpiMLND/wnuFiohk8npsm1UwQbt4bsuap9f6UsPEO7VH+Zl85vjNwKYjREimFQ5Q0lICvTIzbL00X4fgMc0B0TwTesjrKRsbmFI6QUyzc74whzCBXnR+j9Z1KwXo40Dkjig4/w96g4IH7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 MN2PR11MB4712.namprd11.prod.outlook.com (2603:10b6:208:264::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Fri, 16 Aug
 2024 12:34:40 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.7875.016; Fri, 16 Aug 2024
 12:34:40 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libsdl2: upgrade 2.30.5 -> 2.30.6
Date: Fri, 16 Aug 2024 20:34:29 +0800
Message-Id: <20240816123429.1568782-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0281.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::14) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|MN2PR11MB4712:EE_
X-MS-Office365-Filtering-Correlation-Id: 924c38ba-8983-4050-ab8a-08dcbdefcbf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?BoGgi9rdEox/7liupnqW3QsEnzFWt3+d1nj2ISRtTSgH5s44z6n0tzdRl1Fj?=
 =?us-ascii?Q?pHAiHTxix5Zzn6c1VgAhKECXJF1WPQY7srJJMOGaSthuanptsAYF0jVKK21g?=
 =?us-ascii?Q?P2KJyLhC8gOb9WEaVaEmmn4sTQKWc7of40J/ZVhVW9H913tmXcVEQg+y+lEe?=
 =?us-ascii?Q?MD5BEo1/LfLYIpCNfZOIY2lwTceAkDc2I+t5DnxasS7hG9nrVefJhQSBb4wj?=
 =?us-ascii?Q?jrOXIuCQkQ5qK5gCBmZq3I2UlXYUpxq/b8hrygw8lfpJ/0JLFEfZB7bMBXAa?=
 =?us-ascii?Q?s6TThnIE/lKMzpqmlltrvOYrQkCC1AJL4Icwp/HDWnYpkUmyy8QdM9QSqxO2?=
 =?us-ascii?Q?i2R8rWLhhxxZRTHrvH9XJSwFz8GP+hVmPNaF3ZMLQ4uPiNlb3Qgfe/qzY2wc?=
 =?us-ascii?Q?j04lVJ0BQvDUCZs0h2eoby1uDY5FsHbwL6nef6dHr5tBdNKcFWmUIqbr1uoq?=
 =?us-ascii?Q?EVgc5YNnCViusqTaC7MCDjAMKNOV7s7a1EtWRnST5V6Y2HETqu0sTWRv7Pyy?=
 =?us-ascii?Q?0HRetSU+5upkrxszQ4gr6VByKraLuH8mmLGPKvR0T42+Z3xSkysybl201h5g?=
 =?us-ascii?Q?7qdiB4zaFF0oojQ2IdR0WKR8ofzZGJhE55kfFmaIprMDb0lMNm7pkVSWRwOF?=
 =?us-ascii?Q?U5k7QgMVodvSRdZy8FLh7TlRO9/k4dz/DtxjkhXhAUHPG56mAUqH7vSFXyCQ?=
 =?us-ascii?Q?yW8trtz3UtbCrki2FDVeXu0doStRmdzRagwheEc98d+3AKt9C0ilgjEkBXbo?=
 =?us-ascii?Q?8nXtJcTHLjWNK5ieIJPfbDSe6ByiTSvel5BoQoJE1UX1210yAEl2AvFtp6kT?=
 =?us-ascii?Q?yWMQ0oVtCxRULt6OELhQwJwO5pyf1j5OQyeLUf+Zw9Sycxuo/AzK16dbrgaE?=
 =?us-ascii?Q?vC8kX377HpKnIQxhS3U6gJ0RKzqArz4fSzeDt42HTP5frXg+G4D3if2Ck1mm?=
 =?us-ascii?Q?87FOmrk3/k2vspxt+hTQ92Yr0J/yYjY19VIjnfDZ4t69HMwXYr2FmPmfCmwy?=
 =?us-ascii?Q?hJ2sVVQexHc0zl2qLMQTY31Mi177U5dFcbbLJYGcVwHBSsxmBVPVwsAiqbd+?=
 =?us-ascii?Q?Hr5+DL/9dk1y2yAJde6dXBKanXGFOCSqK/aevv/mcxre7Cv3eKvKc8av8aH5?=
 =?us-ascii?Q?O5vsfjUmS1KBbh3xPQeEpL4QaW1MIxxU1as5TR5GEEBhBnw5TmrFjIgylzpK?=
 =?us-ascii?Q?sTSfEyW5aWd0aM9ddkyEnKUe6snB12EIQSE5NpoA8e2fJ1rsEIaEB3u6r6cT?=
 =?us-ascii?Q?6az45SmP52ZO6Z40vbIjNdHO/OtQlxmzQXSqnn9ZthZIKH8YMZ8zE74Qzc1N?=
 =?us-ascii?Q?RBNvIa9d7Iu69JXz9vj1i/Op1jKA2pltuXlhUAAuGVlZs8r4doc4LYETKiH5?=
 =?us-ascii?Q?qbUD22E=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?N49oHKd+puRMeM1PAtNHRSWUsrewItwPWJbMTjyQqOxln1qdr2c9t4+iHP6i?=
 =?us-ascii?Q?MdESPYYpuAVpGXet7O764/5PALd6pYZPDEqYb1Brb2wVtPIj0oUXlbnppY1a?=
 =?us-ascii?Q?HevD9GAUbpKHkpIZ1AF1rWfouOit36Ki+xXv/Yy8tqlfvNJvYI2wSALVhlZD?=
 =?us-ascii?Q?ySF2MgpK9JTyRn9QGGJY0Iobpfx3oj6T1f+QHera3wUPHzN5lgtMqRNDWBpI?=
 =?us-ascii?Q?FqEqem+UbH1iUzH3h5x764v02lvxTrPyDYMkxYcH09KuciksF/cEU7sL6MCu?=
 =?us-ascii?Q?uoKxuHGs8AuVmJKCzt/1rbV6GLx4XfLiQMpLJk2XT8ejv0drFCf9q6qgcReL?=
 =?us-ascii?Q?gWMlSb/Ljm8HtZAUmZLN3b2b0gR9cwfO8AYntl3BeDcWCI1DjpOsCBh4n4Je?=
 =?us-ascii?Q?IystDivCVxoJD1OOiEJnrfE7ZTQS11i/gZ6PBhdIVEIj1ji3gCDmyMWPo4Fx?=
 =?us-ascii?Q?2C9oIUEeCa9ULwchR6Jr7173hHf2Xw3HsciUG0eTS+30SkZkqO6h+oHPCAQ2?=
 =?us-ascii?Q?mnLZd0MqAkg7j1dDTSD9B7NUpfbLIQhHYtBF1SKzZ/GluJUnWVGSEm7bWk25?=
 =?us-ascii?Q?Et9wL3fCi5GwZ/6ap+K8RMxiPhdGSavDLH3LK43RDUp0ya14XrA/KO1M+y3I?=
 =?us-ascii?Q?zXBtzFD15g63BMbrFwf+OHjJpM2wXeYmHjJxuMKkI3th19/XEh/dmHkyHMcX?=
 =?us-ascii?Q?JhZRFkN+616LmLQbtiv1DRvmnkOHiTW05pvdnBe/SwtFshfOgDyEmwlSAT0E?=
 =?us-ascii?Q?cb4DSV0velAxKqw4KGDN2kj6K6cpwhexFWXokHc7YII7hyXbLEKuAlO1RGSc?=
 =?us-ascii?Q?oT0HJodWPy1KFByLgYmCr2nsjvfW/vR4CYFReziqrs160rg1mwuPMvCc/+EI?=
 =?us-ascii?Q?w2MHyJ21UOV7eHg6kPT8jneuOQzrCinJsgIROoOnuY8tXa2ENYQV2PY6n4EL?=
 =?us-ascii?Q?9SpGuoSwtl6/8CLPxK2SidlcPMQRvPv128+9nHO6stc4+I/QSTSzI50Y9J+z?=
 =?us-ascii?Q?FOf0nZLVgL5tJqwT1XjYltXn0jaYS6a55AvWVfpY7feI3ap1zTkxjrsczcea?=
 =?us-ascii?Q?02P6m4ksO4zyfYl1l0/cszDRnGrNcI66B84iuOyhlDTq8u4A4JpCXxfX7I0Z?=
 =?us-ascii?Q?/KlVC6Db96F4m67IfSm8g7aI1+PYJmYUuvRiBgt/d0GODyj+s9It8WGWHobb?=
 =?us-ascii?Q?3WbJ1Ypc+PQ7ppgJHa6n0GBEVR+bA63A4VtQ7QVP1txrERNGq3G2ucSE3yZr?=
 =?us-ascii?Q?NNSRJxD8Bgn5VDNGzFFmiGuPnKKo7IX528lNONXagVcIjQMKn2fjZsxu6ypr?=
 =?us-ascii?Q?+Xul2g6ow/6HZObZIQsBkl/hEFwopVxDjsJ28SQjBkEizcHQcz2wuS3pFh0+?=
 =?us-ascii?Q?mG1AE2uz490Gu0o777TaFpVel7oXvZmr/Y16VyOXZZMU0uzg88LOsjp3LXBY?=
 =?us-ascii?Q?s3h/OA0eUUnZyq4zN3HyG5hCPCnBZ8ik/N103r1W08OTotUgF+4Vi2W8HfNZ?=
 =?us-ascii?Q?gR8n0yZaZdYn3zar2bbYock/5urNGUcSMGZ7StJ5+6SbY+PBsD+A53iVVJIh?=
 =?us-ascii?Q?MMgL22CB1XE9MvazFg74bjcpeYpTFo4p9Beajifz?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 924c38ba-8983-4050-ab8a-08dcbdefcbf0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 12:34:39.8685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Y6YvP7NtmyUXWHRkpYaoWgMJfk7RVmqvPU2eNrt6FI/87+hL5xCekp09g2+5OtAgKiyu5Cd8lBm2qXL02Y6zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4712
X-Authority-Analysis: v=2.4 cv=Y9qqsQeN c=1 sm=1 tr=0 ts=66bf4762 cx=c_pps a=gHjWyi4SN+6fNgZLRl0D7Q==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=yoJbH4e0A30A:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=rApI4zH3AAAA:8 a=mQCZUE1d7TsSR8hhLpIA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=nY6XeQbCzfSyNvKqsd4y:22
X-Proofpoint-ORIG-GUID: bXEoM3q5BXd5rysDjTYCvP4viE2qMAQC
X-Proofpoint-GUID: bXEoM3q5BXd5rysDjTYCvP4viE2qMAQC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-16_03,2024-08-16_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 mlxscore=0 malwarescore=0 impostorscore=0 phishscore=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 mlxlogscore=810
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408160091
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Aug 2024 12:34:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203462

ChangeLog:
* Improved detection of Nintendo Switch Pro controller report mode
* Fixed a rare crash when a controller is disconnected
* Fixed creating a framebuffer with KMSDRM on some systems

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../libsdl2/{libsdl2_2.30.5.bb => libsdl2_2.30.6.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libsdl2/{libsdl2_2.30.5.bb => libsdl2_2.30.6.bb} (97%)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.30.5.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.30.6.bb
similarity index 97%
rename from meta/recipes-graphics/libsdl2/libsdl2_2.30.5.bb
rename to meta/recipes-graphics/libsdl2/libsdl2_2.30.6.bb
index 302c52ee9c..9d1f79f662 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.30.5.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.30.6.bb
@@ -25,7 +25,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz"
 
 S = "${WORKDIR}/SDL2-${PV}"
 
-SRC_URI[sha256sum] = "f374f3fa29c37dfcc20822d4a7d7dc57e58924d1a5f2ad511bfab4c8193de63b"
+SRC_URI[sha256sum] = "c6ef64ca18a19d13df6eb22df9aff19fb0db65610a74cc81dae33a82235cacd4"
 
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
 
-- 
2.25.1


