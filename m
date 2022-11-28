Return-Path: <Zheng.Qiu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9965CC4332F
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 17:47:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.124870.1669657668506322099
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Nov 2022 09:47:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=cL8HQXCx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=93317ef19f=zheng.qiu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2ASFmKej003788
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 17:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=+AOesm8ItXF99AfsresrTFU00s59XvkzLjxGmDCZ1Ac=;
 b=cL8HQXCxT8qxfyFoCKF4MmxJImlfOh2Iz1W4WotB1ItTGDOpxRLoKjVfb6j+65Y82ROD
 phxM0VWLN4/cacwhwxoY/aIYwc4e7s3nhzGM7SxJsdvHcy01IJtgIrQvP7bp0phHngeO
 vSbq7gtMkYnHzI/3TOl76u5XE4UaWUDUeWFuGzsNbAY47aylZWC2mS70bxLdO0aQMUAe
 Ktjn3JuC2ZLL5ywlsN3TDQZ/fFrVP7yJwi4wVIjxyVFPw64Gja04SCo1wsxiwoxsqJqw
 S3kw/mcwuHnhkbP04rl5NmwCUv9AomEdjHtdU7c3Kg4aB4/aYXbn5eN8YjN3+wW/ezz+ vQ== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2102.outbound.protection.outlook.com [104.47.70.102])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m39sbsppn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 17:47:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BStb06UWIVH/NsdVbILEVxsbXwre87WpazcU+7MEl6cduk1XViMhghn937khjxaC4Nwg69GBrsC7oLm5U/L/dfHHElz+NyuRfXhkEhq5dBcCYq07QK+jHZcSyrchk2NJalsoPCQ2r97R5lR5IgiF5CxyW/z+NPqV4Wa2xFG5CjdT1pOQnzMPoxYiOSjB5XNSjQpojhUX1RB6GFz9lJVXwNXzOE4vsX51tos7byKE57W9WZOcTLr1hGIiBA8uZcCh9xcJ5zulTLNmwlrhi/AuTjcMXcloWXZxD7cDuYqpMuUJsV1hT9GR62nI5Y08VrCzZunXjWaK2/cFIEZpxnBeYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+AOesm8ItXF99AfsresrTFU00s59XvkzLjxGmDCZ1Ac=;
 b=Jnk8mDpe8/Bo8UZu71qXGT/GMDITNM+gCnW0rKg5ZzmiNjG2ivQTU8L+7us++kFRc7VlhYdMElcfo03R/H4WEBpgr4EaPjMTNq2UcH049ng3ly6jvZdIKl9pQ/b3giVZ8OO26MZWcz3yyYJjvPI2XSVpDqXTGnYo7QY2ayfVRIj9hss1iRPURFl52biKlgLymkdo8RCfQmb1hztLZtji9qKRwQeje+xQz/yw2DH9oHbTNecmiO+7lqcnDHlmTSAnOCPtTNeugfRZv0lo8g+CNMfFDhiKCSR/TvpewRyIvV8dtlg3DOYbYzVCHAKHjf2uLco0+gHrEEHWTcq+myWW6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5536.namprd11.prod.outlook.com (2603:10b6:5:39b::15)
 by PH0PR11MB4872.namprd11.prod.outlook.com (2603:10b6:510:32::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Mon, 28 Nov
 2022 17:47:44 +0000
Received: from DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::3fdd:fc11:e12c:46b0]) by DM4PR11MB5536.namprd11.prod.outlook.com
 ([fe80::3fdd:fc11:e12c:46b0%5]) with mapi id 15.20.5857.023; Mon, 28 Nov 2022
 17:47:44 +0000
From: Zheng Qiu <zheng.qiu@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: zheng.qiu@windriver.com, randy.macleod@windriver.com
Subject: [kirkstone][PATCH] tiff: Security fix for CVE-2022-3970
Date: Mon, 28 Nov 2022 12:47:28 -0500
Message-Id: <20221128174728.3804331-1-zheng.qiu@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBP288CA0010.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:6a::29) To DM4PR11MB5536.namprd11.prod.outlook.com
 (2603:10b6:5:39b::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5536:EE_|PH0PR11MB4872:EE_
X-MS-Office365-Filtering-Correlation-Id: 30a717d0-a3d7-4fe8-8f4c-08dad168a678
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Q+U7EM2ENE43DkYyrUZX4NFhJzw7YSzDKBFL2/WGj2F3nmK3vpQlFLtmZO9B70jRpkq90jNF3xFE01oItVKWfYr0fOsECZMNBxu4C2pbKML1uMq3e02viB+IQ/ccNWE8c9ETOyxOauBwUrO6275+HPylryhl/rF2OvZ1w7MAYDZirqt1OUmcZXO0WeJ6q2gcbL2cnobilPuqobJ+22tr1gYfiiuBOdXZ/LTjWiZX+q4H1+WZSOTgmwYjS/hTLBPS0YwB5hXhuoHTIIELs7Y5P9lXuF4VFAVDf6PSSz4PYzP97gKjZ0HRMal48y8USV/62kYeM0ZciHP3BdJQ40bp9kcm7V8/FJZkaf/RoPOToF1kjd8Kl0Rcu+wI/N/zZF9UAn8k56rB4tfFsCeAHKWs18C7d8H87wusvRAZNzy0aQIamNQ/dUH02JaoGqKJ5hjEzkr4rAsyVU1aMV5cvCRBPf7QTj7b0D4Rrtf8kSoo0tgQRVbcvLWZLwr8HCx12b6G23XLxITSdUzG1WXTcMnx/Z9Xq/dMxVaYhVdAfCV1sgsDYTEC70L1OdXWKRdHCuK+fdXXSPUHvDhIZBbv7NUDF4ufjc6kcZNEwTyUEIzNk06zCjH8mDocXqFONhCZI5ekKDbdnr31y/hq/G+E49Vf6ZIkeGEL7npKZz7qU11JNU09ejmF78QFW2+GFzoAgPj/LziZvVIMyyqb1TaVsLSXkXnxMPO0obO7vivdKFAuaxwFCwRPQ7yySoO4AlpX9qHzhAMSsFtn71JHPk45LOy7hA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5536.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39850400004)(396003)(376002)(136003)(366004)(451199015)(36756003)(86362001)(316002)(6916009)(478600001)(2906002)(6486002)(966005)(15650500001)(44832011)(66946007)(66476007)(8676002)(66556008)(41300700001)(8936002)(5660300002)(4326008)(83380400001)(38350700002)(38100700002)(6506007)(52116002)(6512007)(26005)(107886003)(6666004)(2616005)(186003)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rDj4J0S+rC9ybzPrPXdCAWpqQlwPhh10NBss0TqYEFpSvJxjF/9kw4LmynbG?=
 =?us-ascii?Q?spZ7cE/bRLieQtG4E7/rRAoWFOI7wJBA4+pQP5SN0elpZHZF0d5ANCNI5cId?=
 =?us-ascii?Q?ZBTYjE8zdW7QS7UGjLbKBUf69GWPi/kfmnLxbYtMFs59SaRMok5p/zSViOGO?=
 =?us-ascii?Q?NEaMXuASYRQk7yFdzQHBj4r2LAtsOzQ/S90cm/eib5vC56D5daS+KmIiRnSo?=
 =?us-ascii?Q?NtE5DWo16EMk+zAHGu/oaKuWvA1+b0B3b/Voik5IBjcJ6xMW55LIIqG3PWJ8?=
 =?us-ascii?Q?TaWC4PW7ubWOJecnbjnSr6F9X5yV4KNYo7jszbO/ukaMalJzVkvFC+nUv/iC?=
 =?us-ascii?Q?hrEabi+NuUmaZPnQFlUeml0XHqjVxEE+1/paRebW44O92bOi4ecW5GgeziYi?=
 =?us-ascii?Q?JUgXyDwm+WmXfeK1rgnBcOb3CSXHrNQV/sqZUnTurtqLROsqgD+1UqH6DQpr?=
 =?us-ascii?Q?Uh5FxnED+FUV/mn9kKnFnrN0PYGhnpGtSUa2i8mZnCPqP7yPkfijymSJlnFO?=
 =?us-ascii?Q?eAdobl0Q210y+6b45YV+JbZknU0KQ8NH+wuR6V6QIIrgUiQeSXU1otNYjTjR?=
 =?us-ascii?Q?Axa2XzudQIsfcVyppC0rQRxjnI933fiGYgyd2iy1wurEXwSnTOLRcJQRt1C+?=
 =?us-ascii?Q?avpyaeIes/HFIq6qTGH2E7Piru85Abela4N8aLJfJ4IIuRz5UILBq76rQyFX?=
 =?us-ascii?Q?CqL6gFOgzQXvFE4jj2Xj94lrCr+f42LMvfnac4ZpG18q6vLNSHWXUp3YCTWC?=
 =?us-ascii?Q?e/X6TZLBC7E1b8vQZayHveHXUlMuXfaoqcj3lIPBhOwA8qXn23GZu0lk/ItO?=
 =?us-ascii?Q?1U7kMmfSad/x8oe628cwu6/oe4i5BW+Hq2WITA9CV0kX0+FPrGXZkAXosZOu?=
 =?us-ascii?Q?RsxQxVQx3SnmPkdRfo1pcUXCSBi3lGE51ZDF8HvCiuRMGdtvVMYW2xv8rP7+?=
 =?us-ascii?Q?VEuDD7l1M9VQwcN3qi+7RP+cTpjX+8IQ+XP7LdnpW6GfjaB0UxVU/9mMjwT9?=
 =?us-ascii?Q?qZUelciVBm9vBrPSTz6bT5qVVIxUL4/LMQLzruIXPUkzR+PiOQIVjhzluUjY?=
 =?us-ascii?Q?z8R78NqcMJUGddELXLjpwKQbDgLFHXNpodGGoVt49YepBVjdKptIFPoCmxIk?=
 =?us-ascii?Q?9qNOiMceEh5zWZDUU5geOFE4PbcFYchYxI54IY60fvYewtEZ/Eap4cWFJWg1?=
 =?us-ascii?Q?LDmY24/a2FcglrQgER9qtm0978TaVT4fR5V4t1VehOzGkgqELypIjHtL/aAd?=
 =?us-ascii?Q?6VaVgbeCo+bzb41vB+L58zbrB9gVBXIA9FYk4mAXLvMhkwk2uvlaAriNL39c?=
 =?us-ascii?Q?EKtS9d0YHG0UkYQa+qwqm3Wp2a6zTs++OZr7SwYP3cLUyBJmlvnpMkYhX7qU?=
 =?us-ascii?Q?uL8jYh9Gv1s3KF8d/R4uReSLCH0McDHQy+ARckeP8DMW/ltN4Oi7ZE7iHwe8?=
 =?us-ascii?Q?lkRntCsNcoGPRpeG8UX7CB7rqbX9YUTaVOmU5l5qCHZDaschVqxNlmW4FRKn?=
 =?us-ascii?Q?iHa4IxjOzPhu7tOlXG+QLt3oqsAI+iNG8gO4GN+EyLsimRei+Yzx3Hl/e5jG?=
 =?us-ascii?Q?4uROnA0YZTqFdfF9cWGMmiIi0Sl+f2uGtRoLHSPhwNpIEnEUDYXu7kOs35uI?=
 =?us-ascii?Q?Zw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30a717d0-a3d7-4fe8-8f4c-08dad168a678
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5536.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2022 17:47:44.0758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hv9AQidm0+jtXxVS2X+aUCQp3ZyjzwSaJwtstmEs5yFAkooqwoPAvElCw5Z3ZnSjw5l5g3Akxmw8Npj9JfiHAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4872
X-Proofpoint-GUID: VtcyjHxkWU-eDwW2NQIjbjMJUTwLHkmg
X-Proofpoint-ORIG-GUID: VtcyjHxkWU-eDwW2NQIjbjMJUTwLHkmg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-28_15,2022-11-28_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 malwarescore=0 spamscore=0 suspectscore=0 mlxlogscore=287 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211280130
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 17:47:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173935

This patch contains a fix for CVE-2022-3970

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2022-3970
https://security-tracker.debian.org/tracker/CVE-2022-3970

Patch generated from :
https://gitlab.com/libtiff/libtiff/-/commit/227500897dfb07fb7d27f7aa570050e62617e3be

Upstream-Status: Accepted

Signed-off-by: Zheng Qiu <zheng.qiu@windriver.com>
---
 .../libtiff/tiff/CVE-2022-3970.patch          | 38 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2022-3970.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2022-3970.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-3970.patch
new file mode 100644
index 0000000000..e8f143933a
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-3970.patch
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
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index 29a2c38d8e..7df4369755 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -24,6 +24,7 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2022-34526.patch \
            file://CVE-2022-2869.patch \
            file://CVE-2022-2867.patch \
+           file://CVE-2022-3970.patch \
            file://b258ed69a485a9cfb299d9f060eb2a46c54e5903.patch \
            file://0001-tiffcrop-Fix-issue-330-and-some-more-from-320-to-349.patch \
            file://CVE-2022-2953.patch \
-- 
2.33.0


