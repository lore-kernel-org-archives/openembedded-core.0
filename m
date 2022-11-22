Return-Path: <Zheng.Qiu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02D77C4332F
	for <webhook@archiver.kernel.org>; Tue, 22 Nov 2022 15:49:21 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.22570.1669132155699831381
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Nov 2022 07:49:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=EE/Gt+ge;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8325ca1ee6=zheng.qiu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AMCREOR004602
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 07:49:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=2eSTIn2bWaeTqRpiynb3GphMzPJJA+f6ZrS8ADxnWEI=;
 b=EE/Gt+gen1AH6brQl8TO5Szu8t492pKmtEMFiOTiiIkhsuWf0eTcIPoUF4mVlhhwEcl/
 KCLJ+GbRY5dq/g+Qhb8WBFgY9W3PKSn2hSapEzoMdRNseFX7ujmp2R/OPvVRWlJx2CMd
 OsCgWD1HPl0xCEpxzTZsrtSosw0LuGDSxmjZjw/Yb3h/FwuQM80S68F5OmQvG2njo1T2
 zCeWcwYXCN6m5R9f7XMFPGOOaUeRtD++EUEbpX5GrjGEJGmZ5zuHIBpyRGPV51A6KWfW
 vwkvioU8pcxUW9K4TmSvR8q1ySjJlyYjjGO0Kx2cDqbkKUv0fO5Upp5RypN3K52SNPtj pg== 
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2047.outbound.protection.outlook.com [104.47.56.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kxyhqadkq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 07:49:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Udjw9yN9xgG8fY0aAxOIj+/p5kp8nMv9BQ+oz4Ly7VsJ4j/vT5OAUkmCgmNpe0pXkGpXVCbQCcVL4FXqKYJhALYmGgUHHwBFbM8yWvb2wgL4hY6ilwPmEH10ZXsNbtaN5TPLWqG1JmtEYDCivATvphKQBMW+9QnpVPrvjd6Gbn/WNAaiAIZmS4Caxzc0bKmE3Ca/O22V8/yUDcim/XkcD4MR2tOL/HWAo0wtiCbdYskzSm4f9UrW7X25E7pd5FXRQtusRVwtDkcMxVyhQnX/K2HUFXggtwYNHgHITRO+pk664D5g1NFC0kbPu65DXmkBvMfFnMH3GZRvZ4UkLoSdEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2eSTIn2bWaeTqRpiynb3GphMzPJJA+f6ZrS8ADxnWEI=;
 b=MiBHf6bOx7r74blLMUDt7AFpC+etAJoBUDhWG/oSti7ncTAOwoO3ejE07rVPTTL6c42rjW4MiLkVbZt6QMFIB9yJqPd9DFnZWYwYzkiP4S+B5l3/60gnCTp8x34evPwvUh11CCuUd6HzdnhlAjC4kvWCa0HbNh9Yb1ARc+KVPJCEHCYoPyPjKyOUsu2EpXR2UC3Ceu3HxeGr67zlHnQ1D3Ke1GFiEBnIrM82AfvLvzmTaMGGwHoj9XZId9DI17aWfrn+Otd3SAirwSmdJTVfYi9TRVZnOtI9YzUbkh18cYebTCyxlSOSapveNBWhpcWvY8gSgX/wIsxdD5B1Hv4ODg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5536.namprd11.prod.outlook.com (2603:10b6:5:39b::15)
 by PH0PR11MB5625.namprd11.prod.outlook.com (2603:10b6:510:ea::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Tue, 22 Nov
 2022 15:49:11 +0000
Received: from DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::3f89:e405:8373:8c98]) by DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::3f89:e405:8373:8c98%9]) with mapi id 15.20.5834.015; Tue, 22 Nov 2022
 15:49:11 +0000
From: Zheng Qiu <zheng.qiu@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: zheng.qiu@windriver.com, randy.macleod@windriver.com
Subject: [master][PATCH v2] libtiff: Fix CVE-2022-3970
Date: Tue, 22 Nov 2022 10:49:01 -0500
Message-Id: <20221122154901.2290930-1-zheng.qiu@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YT1PR01CA0074.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::13) To DM4PR11MB5536.namprd11.prod.outlook.com
 (2603:10b6:5:39b::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5536:EE_|PH0PR11MB5625:EE_
X-MS-Office365-Filtering-Correlation-Id: e1637bff-84b6-4d5f-450f-08dacca1195e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	16KzBywtUcz3n1ZYzx6yWSuY8VJ2J6uIShYZFXrsejtNNPR/ddwY5kJHyhXo8xUixUVxxgdD8ayQ4F7R7/P3RaoWhhtr9IGnYo37TYqV6Oj1Rou2ieZDihlGqSnFPSFN20/24g2P/M6q0iEcUCY7zGe9w5qrXzS/3x6YGDjiNRHaiWcFdX/BMpper1RPAsu9eSzW+KJnUxYSzBGweDXt0uFY6u51zvprsU07bY/L7tYIKvXnQNcLWDsP63n4Zdhtse9Sdfn3FKQHkmj6y0+SaCeUP95CQ3mNXRHBpff1iMM2UO9Ei1VBl8gykSt8Y54sdBQ1ckklfjEX9aqE4l26SaF8cQNkhJA5lfJU2JrvnsTUxz1JZU/WGuSfDSa7ll/BFQ8alJ3hJcjCMia3t39PykH4Fm1TWcWKciFqMTH5CCxBy1XoSpPyf/R3gdlnTZ4EQY+fZLXma2ptGsw/KF10QWJpT4f+hTJiasRfOWCc6mdlTJUp0G++FdwUTl/vrZwpcitEZ0UK8KXEk/prfq5XV49ULPpZVwiDb2wRJ6HGeLU6GyEmdL/HkMEIP9ekAMsaS8lr77FdbNRGm4iG8Wl4Vn3QtoWJDnZP4r5sxqTL3s3ZTB7z0u3/7nvURVxlIXSbFylkz4yRSWTz/LggMQgvXWbpvKP96ITcVVyyH0bv2IW3en3FNEWkPsSvKMrHXII8v+tEte/SDMdphZKPj7QiH9kIMwUb7Fv5UVQN+zDbUj77SOuCL5UeerIXIlLPK+Sc1xFIM2vdpm+NoZqpCOt/zw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5536.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(136003)(366004)(396003)(39850400004)(451199015)(86362001)(36756003)(186003)(66946007)(38100700002)(52116002)(6916009)(41300700001)(2616005)(1076003)(66476007)(8676002)(44832011)(5660300002)(8936002)(4326008)(6666004)(478600001)(966005)(107886003)(6486002)(26005)(6512007)(316002)(38350700002)(66556008)(2906002)(83380400001)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?26p+W1bDgl3yZLnrMkNv0V8NTpUn1DZTCQcbJmUTF7DDfyQHlBt+Qu3TI0OP?=
 =?us-ascii?Q?fvIMcYK/Ebm76/J9tL4fyYrAKw9kLNI+QYTQVOUoRTbjNh74j529SrxHOAyf?=
 =?us-ascii?Q?JCtLWLMcoRQNMbzlB/YsFFf+4za3ow7lTJvXmTsfLhnlvKvQLAvOxKXQfHlI?=
 =?us-ascii?Q?/JfvMgBklhJDvUV23BigtOSYgml/NuUJjsHY36A4hJaWmrLqtvvmXV6WF2gw?=
 =?us-ascii?Q?qFDvLFkeSoWI34Yyi0bKu2j3fgZeKjKUgUkJtrIT1CmrzBSHKsNJU3FIhKDh?=
 =?us-ascii?Q?If8ctjIThdl8Xw775CERO11q3ft7sXy308l9KNPGV76+nWPwqh+R45hZNVvs?=
 =?us-ascii?Q?BFYYJPJtxUWYPyOaXE3fXkizXk1VC4QzxmszOxdGJce8dsG16k7jvhOJq5SK?=
 =?us-ascii?Q?PG48yHSNHH+T8uNlNP/hd+q2p1TPBV87Wc1IRMZKToICNWEbVyGVW1ezeJzk?=
 =?us-ascii?Q?xZCfufVh7VekS6DCqvhsJG0pxljbABi4rxG2WSL3YzHbyxVJOyQWP3hEJZUA?=
 =?us-ascii?Q?sWAw23oIDoRsmEdxArXzrqO8xg6V168WI53rcgOn/tHCElscc0qY/RoCZkKW?=
 =?us-ascii?Q?wO0xJ6hUZxNSkIV1o1my7hdLsjnJqdpbjDByRfwnfMMWdTQa0/u1UPgVxq82?=
 =?us-ascii?Q?Hy7n1X51bjhhEb7cVFubZC5vJQsB22vwebVyh+v22QEPZQAzklQIrmzvB+Ol?=
 =?us-ascii?Q?oSh+aDvlM/GKHjpRSEWRsIrsnXPibzzGM6FIAn8XtCOkATxI0mRhyuHH61jG?=
 =?us-ascii?Q?cmV+nxYtxUEMmDPhXyAIfOobx+gU8s6UNOruEpl3yj5PAS8i6korC1VqQ4CN?=
 =?us-ascii?Q?2kfFIkPCpaBzZuMSgJWZdsDnSuOlTU8Og3L37+CmD48QLQw8hrOXbRP30led?=
 =?us-ascii?Q?skmdu2Ud8fE9RAwAwZqKUkqQmKw4BMBDZoqA45gcuR1z1L5uStbPOAMrfTmP?=
 =?us-ascii?Q?n+oox5ho4zeUwJ9Om701muhq15NQDloTnr0woSpcm0ajoGp1OZWoW2vXvWsz?=
 =?us-ascii?Q?347OOhBZ+MwrrRUHg39Pipb/dKaci//ovGLSSdFaHTxUeid0sUVZcVyRtsmd?=
 =?us-ascii?Q?1auVg62ff/qgCFOetuv3Eq0zuXdDnUcjqW6TXUofrp1D1F6HtSHiNRMBPHGr?=
 =?us-ascii?Q?8SO6V5pvRzWbJeOrLxGCfOvxKqvIjNPXRb2m+W3XML/jXhx1Rd8HVTaZ0WYO?=
 =?us-ascii?Q?cjbJyKX3qCwd18m4xIlUkZkwk98CJa5X6UccIaSbTsBU6uy8JoBTGVK1ushW?=
 =?us-ascii?Q?2l6TZnc/RAws7ehyEGTzl/v0JYUZ5yH5OQhSMaxCOwCi8Q9pg/H14kl2IID0?=
 =?us-ascii?Q?sa8syoOluT4s9Kc0scUEN2gKOEp+zC8VvZXLqcDb9vRgUN7Th77MuEbXkq35?=
 =?us-ascii?Q?tSqgQyX0iAoOK02pxGdKZ4KpcxTX5Y5Uvy8OKj0SwKxb/7ZKDY9MDbRe9kjg?=
 =?us-ascii?Q?9Tuk4pyOjBj+0EGPzgQzyeEVbBYgaJMRvkAgWMyb3n79vZV5L4b7OofWl63i?=
 =?us-ascii?Q?/QqK1Vby6dlOhNTSB9tQ6dIgEu9dBkGEp9gOMmj4QMd/vyqv2hBZIdr9f2Bl?=
 =?us-ascii?Q?pHTil1aOMWmV7zODbda30tt12OUtYjzaQivI4pB935Vr36n8t/RQkktZmAYn?=
 =?us-ascii?Q?YA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1637bff-84b6-4d5f-450f-08dacca1195e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5536.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 15:49:11.4849
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fRX1Hp6t1TqJJEwdZ5sL/iAa1Y9vKaXiSHviMF/ex2mn49plh7jXtonhS/hlYNrl3hGspp/cQQb63MSbPxgPXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5625
X-Proofpoint-ORIG-GUID: aESZ_awVOJ-xnJTvNq0RV397EoTkykQg
X-Proofpoint-GUID: aESZ_awVOJ-xnJTvNq0RV397EoTkykQg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-22_09,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=645 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211220119
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 15:49:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173689

This patch contains a fix for CVE-2022-3970

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2022-3970
https://security-tracker.debian.org/tracker/CVE-2022-3970

Patch generated from :
https://gitlab.com/libtiff/libtiff/-/commit/227500897dfb07fb7d27f7aa570050e62617e3be

Upstream-Status: Accepted

Signed-off-by: Zheng Qiu <zheng.qiu@windriver.com>
---
 .../libtiff/files/CVE-2022-3970.patch         | 38 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.4.0.bb |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2022-3970.patch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2022-3970.patch b/meta/recipes-multimedia/libtiff/files/CVE-2022-3970.patch
new file mode 100644
index 0000000000..e8f143933a
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2022-3970.patch
@@ -0,0 +1,38 @@
+From 227500897dfb07fb7d27f7aa570050e62617e3be Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Tue, 8 Nov 2022 15:16:58 +0100
+Subject: [PATCH] TIFFReadRGBATileExt(): fix (unsigned) integer overflow on
+ strips/tiles > 2 GB
+
+Fixes https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=53137
+---
+ libtiff/tif_getimage.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/libtiff/tif_getimage.c b/libtiff/tif_getimage.c
+index a4d0c1d6..60b94d8e 100644
+--- a/libtiff/tif_getimage.c
++++ b/libtiff/tif_getimage.c
+@@ -3016,15 +3016,15 @@ TIFFReadRGBATileExt(TIFF* tif, uint32_t col, uint32_t row, uint32_t * raster, in
+         return( ok );
+ 
+     for( i_row = 0; i_row < read_ysize; i_row++ ) {
+-        memmove( raster + (tile_ysize - i_row - 1) * tile_xsize,
+-                 raster + (read_ysize - i_row - 1) * read_xsize,
++        memmove( raster + (size_t)(tile_ysize - i_row - 1) * tile_xsize,
++                 raster + (size_t)(read_ysize - i_row - 1) * read_xsize,
+                  read_xsize * sizeof(uint32_t) );
+-        _TIFFmemset( raster + (tile_ysize - i_row - 1) * tile_xsize+read_xsize,
++        _TIFFmemset( raster + (size_t)(tile_ysize - i_row - 1) * tile_xsize+read_xsize,
+                      0, sizeof(uint32_t) * (tile_xsize - read_xsize) );
+     }
+ 
+     for( i_row = read_ysize; i_row < tile_ysize; i_row++ ) {
+-        _TIFFmemset( raster + (tile_ysize - i_row - 1) * tile_xsize,
++        _TIFFmemset( raster + (size_t)(tile_ysize - i_row - 1) * tile_xsize,
+                      0, sizeof(uint32_t) * tile_xsize );
+     }
+ 
+-- 
+2.33.0
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb
index 29cb4111d6..f92b034c4c 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://0001-fix-the-FPE-in-tiffcrop-415-427-and-428.patch \
            file://CVE-2022-34526.patch \
            file://CVE-2022-2953.patch \
+	   file://CVE-2022-3970.patch \
            file://0001-Revised-handling-of-TIFFTAG_INKNAMES-and-related-TIF.patch \
            file://0001-tiffcrop-S-option-Make-decision-simpler.patch \
            file://0001-tiffcrop-disable-incompatibility-of-Z-X-Y-z-options-.patch \
-- 
2.33.0


