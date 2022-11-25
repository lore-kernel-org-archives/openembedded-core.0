Return-Path: <Zheng.Qiu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C59F8C4332F
	for <webhook@archiver.kernel.org>; Fri, 25 Nov 2022 18:09:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.53357.1669399795316808886
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Nov 2022 10:09:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Tj1ow0Dn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8328c4fba4=zheng.qiu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2API14ep008718
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Nov 2022 10:09:55 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=eNH1D1WjPxC+EsTOvTekzjS57i939whZt1xY9Kdt+Ak=;
 b=Tj1ow0DnisvNq8H1+xPCcUISqGfJlKcyABnkVfNiqdpzFQ23w80+kP03zkPgbBt108B7
 1IjcMSCUfHjLUl3dMTdDqotOMC/qNZziDy4ufnfUZq9ymI9pWpvckeaRF+L8pD2rSPi9
 ea9AA+dcO0GBVy+kjHqFi/iVr0kGe8mbqi4x+DJdTIGw/BRPqZfSBJPFKOJ5CgUtVEIS
 0sTPQBJ6K87+2FOEbuwx9zqGOicbRcbFBFj7TsZ507Ei9QBM7zycNGIy3nBimGtyMsTD
 fMynA+Ci8p4OHjiJWGoWWnmCN3ttKfm4iF2It/nruWX9bKqRRUxPwfXLI64G6dkWIySK Lg== 
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2040.outbound.protection.outlook.com [104.47.73.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kxyhqd05j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Nov 2022 10:09:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fjxhWUUjgfWGLTEQzRN828PmxmahEkohn/HW48YoDU9dT+J4QatC6X4PKQdr45d2vO5AhuWLz97oqZZtLgX9Bjxp8PFIYW8BS9BoGe6X5MLM6F7gw8HJ+WlpZeZN/g8uYdT56plzl47wxS0fWam/SWfnpYx3epwhnU9D0SP7KxVyAGFBaFQ8PUXpmnt3ZUO93vD2uqPgHRWKqG7OAxEqBGQJ1lkietllmX1dCGwZeYdQNNK2HFJ19T4hu7xmGv/hs65Fuo/1Xhr1P4xJeD0tYTE/Z2rsWRwZ+3SKhtJt6pkMM6GEmmLRf3TukEkXwySWlbb63meeoCdHC3EmZdoEBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eNH1D1WjPxC+EsTOvTekzjS57i939whZt1xY9Kdt+Ak=;
 b=Mr9lg+P51XZ2234s22+DOuSDnmOwVhWC5EiAvA5HkJbpPsUPIeu3wlmLi7PxbPR42AGxpIKK+LWnjNNz3FbLu3AShwuFIJqgK7Ehf4ReOLH5C9glVhIdFXUPkwttMjG7xnLE1AWWRiU6Ys0LhqZneYKKsRQmT3IrCxLcQiwTc0XVQRZdVAlAEkbiNaOy9SfCZd7cjXIb08I86ZzNwMsUiEPUmLk9C1YmfzGDxgHGLlDi+Tl4qGEClIzFScRdIMbShgxOvEKK6EwgLPdzQDKS/kyNcDLGoDMuVq6ER5Uy0H2WiytLObJSKe6tDej+MDFWTQ+95dVxmlf3uKsR/99UzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5536.namprd11.prod.outlook.com (2603:10b6:5:39b::15)
 by DS7PR11MB6198.namprd11.prod.outlook.com (2603:10b6:8:9a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.17; Fri, 25 Nov
 2022 18:09:53 +0000
Received: from DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::3fdd:fc11:e12c:46b0]) by DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::3fdd:fc11:e12c:46b0%5]) with mapi id 15.20.5857.020; Fri, 25 Nov 2022
 18:09:53 +0000
From: Zheng Qiu <zheng.qiu@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: zheng.qiu@windriver.com, randy.macleod@windriver.com
Subject: [master][PATCH v3] tiff: Security fix for CVE-2022-3970
Date: Fri, 25 Nov 2022 13:09:39 -0500
Message-Id: <20221125180939.3662633-1-zheng.qiu@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR01CA0083.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:3::19) To DM4PR11MB5536.namprd11.prod.outlook.com
 (2603:10b6:5:39b::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5536:EE_|DS7PR11MB6198:EE_
X-MS-Office365-Filtering-Correlation-Id: 34bd96f7-e846-444e-a946-08dacf10405a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8c5Ya8EY0FECgwGEd94lijgUppm25ZPYTbWUYuTJPp/unKFshRxM7wDCEP67OXEQ3XejQfweMgiaUJNqoHpmZr2ivyOYEfBshbhAkHZxbThTQ/IDMF6RKth/7swcuiVzcQDab0unzG1saVkRLfwgT5jwpjy7KPgjS7wGtbTBaFAeGAgG4LN26dNm8xc4WwBJHK3g8BtrChzo3iEtcwi23HRH2ngW9e7FeqLwIX7qSgMBejBEeo/526HZ4xU4YAJW6bUeSLrEq/6TcpgCH5ysDIJjEumw0xXSH0IoUX5SjyQEKF1q8XFVAbBSP5Iw+DK+KaOlyyeaT/FeJyHgN9CQkmz+W+CtwQENmtKqL459y7fTYO2eJtoth8Sb84bDZWP6hni+GI2863s8PB1ieQi1N2bEBpJtbVTJVgKUST7Kc8mPFdrZ/IjY1u7xEg44lkJGWRzPHwk7ZxlH2qS80NEmJ43dALiM71F/7mpjOyT8A+3EnI69VWzu3jyGm2OTg0PAEQopxVbVTtqv5NQMcSGT2eTvvDQXTXTRp4SVaiP4MD3VPhhjsxa9Fx1y6/IXID87DUe2nypcaZSyRCenXTi19YkFCd2qKQ80Orj5m0MEBb5/mzFjb0RxmteOaM6gg6nCAxavZaZnMKc3uzoRS+x6L1OTjEyj/KhxkQ8cgJ5vGt6kLcyClqImtaq2XVKVkFKQXiSJ5tAOyFu8vXg0y2i8gAY+oZivCozoP6iMTAXRUHZt6QnW0/bMHnrfIPdHCUAzRWcrATqUidc/az2+wIuJeg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5536.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(136003)(39850400004)(346002)(376002)(451199015)(4326008)(66476007)(8676002)(66556008)(1076003)(83380400001)(186003)(478600001)(66946007)(2616005)(6486002)(966005)(41300700001)(86362001)(8936002)(6512007)(26005)(2906002)(5660300002)(36756003)(15650500001)(316002)(6916009)(6666004)(107886003)(38100700002)(6506007)(38350700002)(52116002)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zwmfacfBHUJjH6is/Oc3hqVNTz8l1qFed/jydhfI6wNgC3wchp7SxU7Cs+r5?=
 =?us-ascii?Q?/sjmiy+PVL0YEV4k3vYFBev2Pih/7Vx7SlpBOJAu3dAkWIyxC9n4mUxPgfjP?=
 =?us-ascii?Q?Etjdd8omG7HbCGSnbGj91FvVtlDFXDl7XAk6ZUmvCMXXAZPeZW0XVHo9mHq6?=
 =?us-ascii?Q?KRqtqCzGCrLWtY3WZL7RvzGIA5wv3dXlzlUkoNymTBZtFFx7n1MRCTXkz/hO?=
 =?us-ascii?Q?VgRxH6g4v8/4/NZT/MadWe15f9XoKP70HRT+DtJc1xFjHw37LPDiDgowDNBa?=
 =?us-ascii?Q?0wjnOAKkOecraIeg+CWBL0XRnIRk/+0ZeszEkfJbL6RL+IO1Hhb3XNnspv6P?=
 =?us-ascii?Q?XoNbf9CKjPw6Gd9+rZSl+2UoXR3JUSN1QyPrL1unY1gzSQ6wXLoRkllDDwlT?=
 =?us-ascii?Q?VLe0pf5I45/1PlRWMA8SasvE32g07s5i6ebqvPxy8PMr35OHlRxrl2xX+HrT?=
 =?us-ascii?Q?kiz3+mKQzsba2fr7VewM2HH7AKUWSPyRrS8osDrmTU4PnAW4GhrzaRjgT+3v?=
 =?us-ascii?Q?/xbRquTpzjtIXQ1u8+KdaL6i+Q8CyF1E0S0NH04HbIPE5dqGYhbCkfS+Jt8q?=
 =?us-ascii?Q?jO+9bwx8dXUf0OXnP3L4dd+swhNxSc763ucVnmF5Xus3qxr2Qo8+PVg1x0us?=
 =?us-ascii?Q?ZKBYoIggIbaWBjGutqYxJXleYw6cS5JAfFdc71GxvXty2hE2KWvfAw3qcPBf?=
 =?us-ascii?Q?nmaromoeocuWQmARdidJmH7k0Vc0/DN4dVl4dW/IlFVlXJuj5xi1RahfXrL/?=
 =?us-ascii?Q?niOZHjLaovUKeibHGpnKA5b+bS3BK8xBOCHiFN1dLgtBVWjalQz9hh6+Z/AI?=
 =?us-ascii?Q?B0GX9X0myCfKUcUSM3M7+T8SoL2mxcKXNI4am6VqwXBTQKDtMQebzNiDaH9O?=
 =?us-ascii?Q?a/lHBLqnCBxbtCubXt7XU4jxhhWd95A3UzM16t1uFTgdnCpzsEt7nLLF/O6Z?=
 =?us-ascii?Q?hZoSq1gUCrxY/SUqx7eB5kG0w3QqEgYag4QBf8YgoudlMwmCZ3yOCAE/QE2j?=
 =?us-ascii?Q?IOETNgQW/eMdGtVh6Ty3t39/887ZVr8nnSLN8p6DT+Am54hsKYBbQW2fNk9a?=
 =?us-ascii?Q?gue3IVckWY6zkhioMIt5c4QQkTrx/Q1gNPCb0nibkFNxrvmEvZTesFkKWHyR?=
 =?us-ascii?Q?KVSYthA4S4FOi378xc7bGEvsR0OqOnDzo6mtYdwuS86+rOg1TDZ4nt1lWLUC?=
 =?us-ascii?Q?5OX1VWKwBqebd+hZY85639H/GWo8JyfJC+Dv4B4nHL5xduZtGEfnSYAc6DN8?=
 =?us-ascii?Q?t7sjiUhGO+1ufbh/LRsiwuKL31wUvbpCuQf2ob8QrHmbGSl+aKAiVPlhrxZn?=
 =?us-ascii?Q?vWZqQNXTPiFaYuB96prbF4I9iAEt9HXsBJaCFp9wpWZnDhkSvgNxUzfSglAJ?=
 =?us-ascii?Q?guiH5x4JdMJ2KKNwWPFWoBzpj8pCJgJUenFLsMwPJJ/AcQ7MJRU2Bm4pRJki?=
 =?us-ascii?Q?/opYtCTW2c8s4IENdxditJwb4o/DVQR0ksJnuj9qMx7ZPk5+QF+wsXYTyVmi?=
 =?us-ascii?Q?LZhSYLSrnVRsE/D68ephvdYB4itKBZ/3ovQ0tVC3SrnegSolwyBY+lNCaEsl?=
 =?us-ascii?Q?jpR5GMMBe+fiCofX28r+AOYUWXS8zJNZOgUUBKAD9GcwizSG9cb1xfVt9+AD?=
 =?us-ascii?Q?KQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34bd96f7-e846-444e-a946-08dacf10405a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5536.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2022 18:09:53.3081
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zp2HzHJqyRbYG8LDfhNqqcUVTQdKHvioBATiJzRWA4XufK84ODFIFadcTLQbKHC6ZbWwPa1HfeNCU6IunaFAjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6198
X-Proofpoint-ORIG-GUID: hDegnlKXSXr6E29N3HlCaFoIovQy96N3
X-Proofpoint-GUID: hDegnlKXSXr6E29N3HlCaFoIovQy96N3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-25_10,2022-11-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=598 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211250141
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Nov 2022 18:09:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173783

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
index 29cb4111d6..970aab5433 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb
@@ -12,6 +12,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://0001-fix-the-FPE-in-tiffcrop-415-427-and-428.patch \
            file://CVE-2022-34526.patch \
            file://CVE-2022-2953.patch \
+           file://CVE-2022-3970.patch \
            file://0001-Revised-handling-of-TIFFTAG_INKNAMES-and-related-TIF.patch \
            file://0001-tiffcrop-S-option-Make-decision-simpler.patch \
            file://0001-tiffcrop-disable-incompatibility-of-Z-X-Y-z-options-.patch \
-- 
2.33.0


