Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74DBDC4332F
	for <webhook@archiver.kernel.org>; Sun, 27 Nov 2022 14:20:03 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.92388.1669558794734390972
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Nov 2022 06:19:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8330146791=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AREJsBG018444
	for <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 06:19:54 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m3ey90qm7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 06:19:54 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AREJrtJ018438
	for <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 06:19:53 -0800
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m3ey90qm6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 27 Nov 2022 06:19:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MYMNbRlXnZ7LDD7Ie/Bieb1FvuUAt3x5DFIPWKSeolhEQyMWKt+6Brj+Aq5gK6CrR4FCq9o4X0PBoTNNC0AFBI7cK41zh7GuShOzdgoGpRMAoHSfkMfND3gD0klWJf/nHwOeYyjsHLbffVE/37Nf6eEp0zYR+VvtjBWwRixY1R2Chc6puV176pTGGUHufzu1pWMvFDZmZbmkiA/QQzpjmBEIe/9HdNCIMr9slur7mdwYUr+dFe/h6Ty/M/njwMae/NBcBmXInZ9MYp3Zd1k7rZkoM9cJ2zv4+zg3gHfdDptbqVEUQomZNzhz7WZO8wZn3CQBXwfL874/2aloj1PD5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ojGZi9WwaVebE2hpNLUmi/l7wQbVYtnovVYe5/TKwKs=;
 b=nJhL9Zg7yG/g0afZk3B6GQf2yW7zAL8WoEPNUSdbbO5IOvbF2JjUfkftdAMFYJJ5RBklFfYO6zxEN2LNDwU2vYaDPGg4q2Os/P1QT5iO3dJj3IVU2VWt9PMF0ap3ytpS7q8HPvNduHrhpif5u8yKfLPkDk8mHm9YLBRi5G6DATNClJeuiLWLFAsrlzW44YcrLPoutWyxPZ5btGaiPNnfxG+NA/8My8FCUTFfRw91ERlPN0QygsheJHRbsxvKamzts+INmdS9CcYbIVnaBlDXXuzh1l6FAwcXyIeD9d8gpEs8vosOqGFaB0BXB8ui3qplmJXDyw5e9Vh5tidMKBVs5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by SJ0PR11MB5149.namprd11.prod.outlook.com (2603:10b6:a03:2d1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.22; Sun, 27 Nov
 2022 14:19:48 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16%3]) with mapi id 15.20.5857.021; Sun, 27 Nov 2022
 14:19:48 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: steve@sakoman.com, openembedded-core@lists.openembedded.org
Subject: [OE-Core][kirkstone][PATCH v2] grub2: backport patch to fix CVE-2022-2601 CVE-2022-3775
Date: Sun, 27 Nov 2022 22:29:08 +0800
Message-Id: <20221127142908.22055-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.32.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2PR03CA0009.apcprd03.prod.outlook.com
 (2603:1096:100:55::21) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|SJ0PR11MB5149:EE_
X-MS-Office365-Filtering-Correlation-Id: d70bb733-6d70-466c-c59c-08dad08270f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	soB75uCSn5KYrw9BK01O5cr2m/mznizz54RdY8Hjs6RAS4aapvPQ9HlpoiGMhTgEbDIGsfnDQ64d6MQXttI26TNo/FJywsqdSVC+YjdW3wyuKzbWr/iyO1GNCqKDcQ6Se02Nwk40OW870tgrzD5yoF5rB3BLoA2Ky0S6pr8S/ZX0ETl6sAR6pfSwi0VjumnydtmIW87bMAGsQQlWNPgBRpCnchKmowGdJSXfMEsNy2w2y0AFvOZ3agLol/yGCEq+lLp2pY1p/JdOyCmHn1ZiMlZznmS77FRFLoLlyC+DJC6hUD3q4Si4MMKuxbnpwgJNPTJSqYU8WM733QyWVvaFxle/BHhbLeQ6oASy+KbO8GggmgQLZXkM/BvrXFxwCRTl20F1d9cSwhHwctSbGEywnhW8ix6+ZxyHntqtL1UOCA/93hCZPFfDD1hQPdvNpqBeSbgSZdcJvZSxQwlH9U24QNftHwKKzjFW/Ozy4CKpKILp2t46dUR9dZnr8vY3LM7UpW6NsCAD+DRGNyuqSk7rwYWuaw/YOw4BNq5GDf6xAphUJQtm46KJw2dVFoPesXe10J4jqqXaNROvj8EbJe6GUqLOHtcwtoGfU989cMSRQwDnB/j++HPAfNqPacWj8wM4QtF+2bEVCpoR5Qnfdbb4JyXmWGa6hx0RU4xamZocfguCh9Ls9ORnFzLFlV8wsZwoFMOKUTKnOjYUNZSyx5Dd9oMTcdjPhI4kYvolDzoU8ZYPrYEPumHhyMMDgr5uxAUZXHD170vwgMv5owuyHu17FKgMsffacqMiTlK1nLl3Fa0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(396003)(366004)(39840400004)(451199015)(316002)(6506007)(52116002)(186003)(2616005)(1076003)(83380400001)(6512007)(26005)(478600001)(6486002)(38350700002)(38100700002)(6666004)(83170400001)(2906002)(8676002)(41300700001)(30864003)(5660300002)(8936002)(66946007)(66556008)(66476007)(44832011)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Pb+mTNBkCbzc5KkoYSvT81tBNqI+3kaehzP0XFFbLJ9dj7fCTCryaSWMxOTa?=
 =?us-ascii?Q?yj9kok0vsHzJ/g5wPj0ML41s9kjm/+SG7kA2gnG4iDHjUPK5CT2TJTFs1dqA?=
 =?us-ascii?Q?Wf6BFiPanJXtGM1U+2gT5Sbe4qdWXYaWET0pBhPQX3CMh6ntRzdFeh5SNf+/?=
 =?us-ascii?Q?BxBVqehK1zMuC19CXXSXg59/P08kylhf26tnx7xh9GH75jUPQJZFkVTls8bW?=
 =?us-ascii?Q?BgnA3unjw3Zqn1OgK4tgdKaQkcyshZwvIk5c6kCrSZ3XKGJFR4Y4coSnZ5xZ?=
 =?us-ascii?Q?yCDAFuLzDgGX/9Afa9uqowKD2XL/6Cr6p34nCTyEISRNARLGqlOFSVSchztS?=
 =?us-ascii?Q?KuieTGmTxBX5BimFY1dYXNrU97Gm0QXwvyxjmwrDeyKsFWjfp5i/j/p0o7rR?=
 =?us-ascii?Q?MWdxSXvn6eFh9/7eKs8lcinI8GViH1yp6Ydl/rMRlFxUCkuo7turvOA5Megf?=
 =?us-ascii?Q?kcAUv0X75n6//NrvJMmcjkl08V7KVd0fB9MUu3VjeA8S41jPLKLIFcT7oAD6?=
 =?us-ascii?Q?Mo0p3UXrB4APpQpmsTf1Z0v5Ibak/GddtX75dP6S5xl4KCIhG1GERmXLdbIR?=
 =?us-ascii?Q?/ZAU1Q6nPb0VyUcJpcNKIDGPRh0VFGMWsybBfowden+T2NlDEOzUaZpjNsU5?=
 =?us-ascii?Q?0L7Ad6bqSwDYtjUMMd3wy4PV9dg36PcruPcijuNE3DQAy+txRrxNA+lDX8FA?=
 =?us-ascii?Q?wml0wIzHfkLdXVY/YGHkaYmwX9HQcjp071T5uils4HDcIauYrpVBMyZWZUCz?=
 =?us-ascii?Q?b7dhT6Tjp0nmzS+rNxJg3u32RBMY4an2XKLG/IikHB9/VcVFPomQuwP1COa0?=
 =?us-ascii?Q?+0bPgaOUuZdUSRySEPfQS3VR1rscGfyzTeyQrZoTzHVFsLlS8RPxOqGT03wc?=
 =?us-ascii?Q?8GsupzqVMzdw7sDDtwaLuoF5bxat1p8jkaOkcVMdDOhXraMJjd6IRe9CrxM1?=
 =?us-ascii?Q?Q55gDDIhvwilTgpEfp6yV5jZd5aBGl8M0DWeXUzCIOvJEGNo8eAwLKd9exE6?=
 =?us-ascii?Q?wjFCV7S/IU2pHOKc6w4ZimQJAR4VadbsyJL42ESbXTHjRvbNg90++rtbN40y?=
 =?us-ascii?Q?wE7hwFQIejUXmzl95mIwAgwtoILc3TKBFasWl75pHIs7mt1vyozRoCNyspry?=
 =?us-ascii?Q?8ODJBsafhK2pkaMf4JrPLoAuzLXep2Iu6BYRh3taVmkdbzHMzFf868OWe6OY?=
 =?us-ascii?Q?UFGVlTGX4aCURSULpS5r7TucUE9LRrKfTnZ3oQWlaX+0TaUvYmz1ivJLTf/0?=
 =?us-ascii?Q?+0atWVSsO5oMS7lxFvOyj3hqBZ2onzpeXV0NBrB4qGXPk9f9QyrGHrgrF6it?=
 =?us-ascii?Q?/ztZlB2I2jt3cVRPzKxWggL6Zr95+xJCfsKJnpiYg4R1Dt6U471o5c+PON8e?=
 =?us-ascii?Q?pJI/QplfOlLk3S3hTvoUR/Cs96NKTQGKD5FHrFPQgKmFwGdWONSjFcxofY54?=
 =?us-ascii?Q?5jKU9H8VC0BY49FsrswjwtKBV2L3hkRF2LdqFmyI3LU+EvfYqM5UOsXwz2ZN?=
 =?us-ascii?Q?pyLhSNJAk7wAsRjpV6wiVV6uS/lr6nvnekV6CI9P7Choa2x88VfJoonJ0wzu?=
 =?us-ascii?Q?loCm1QiOl9heGmJLCBFRsel0MMxOfP/OeDNZdKnRDWlLYEIC33kRnD4OlVu/?=
 =?us-ascii?Q?eA=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d70bb733-6d70-466c-c59c-08dad08270f6
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2022 14:19:48.7311
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B4a8hnB+QD96k49mPPmZo3tITgMbOP76F0h+awRfiiNHMLqIG6McrFhLQnT+4Wx4gPW5xRkhjxDwUpiBQIY9PLvVJdDt42hZLQ3FCHorcIQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5149
X-Proofpoint-GUID: EQN3taZW1tHPuj6U-tpFbkbi27r93fRe
X-Proofpoint-ORIG-GUID: ryy3VYIkTfRIZak_4yjCf9JUigBPAI7j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-27_06,2022-11-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211270120
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 14:20:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173877

Backport patch from upstream to solve CVE-2022-2601 CVE-2022-3775 dependency:
font: Fix size overflow in grub_font_get_glyph_internal()
(https://git.savannah.gnu.org/cgit/grub.git/commit/?id=9c76ec09ae08155df27cd237eaea150b4f02f532)

Backport patch from upstream to fix following CVEs:
CVE-2022-2601: font: Fix several integer overflows in grub_font_construct_glyph()
(https://git.savannah.gnu.org/cgit/grub.git/commit/?id=768e1ef2fc159f6e14e7246e4be09363708ac39e)
CVE-2022-3775: font: Fix an integer underflow in blit_comb()
(https://git.savannah.gnu.org/cgit/grub.git/commit/?id=992c06191babc1e109caf40d6a07ec6fdef427af)

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
---
Changes in v2:
  fix patch fuzz with devtool, tested on my local setup.

---
 ...erflow-in-grub_font_get_glyph_intern.patch | 115 ++++++++++++++++++
 .../grub/files/CVE-2022-2601.patch            |  85 +++++++++++++
 .../grub/files/CVE-2022-3775.patch            |  95 +++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |   3 +
 4 files changed, 298 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0001-font-Fix-size-overflow-in-grub_font_get_glyph_intern.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2022-2601.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2022-3775.patch

diff --git a/meta/recipes-bsp/grub/files/0001-font-Fix-size-overflow-in-grub_font_get_glyph_intern.patch b/meta/recipes-bsp/grub/files/0001-font-Fix-size-overflow-in-grub_font_get_glyph_intern.patch
new file mode 100644
index 0000000000..efa00a3c6c
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0001-font-Fix-size-overflow-in-grub_font_get_glyph_intern.patch
@@ -0,0 +1,115 @@
+From 1f511ae054fe42dce7aedfbfe0f234fa1e0a7a3e Mon Sep 17 00:00:00 2001
+From: Zhang Boyang <zhangboyang.id@gmail.com>
+Date: Fri, 5 Aug 2022 00:51:20 +0800
+Subject: [PATCH] font: Fix size overflow in grub_font_get_glyph_internal()
+
+The length of memory allocation and file read may overflow. This patch
+fixes the problem by using safemath macros.
+
+There is a lot of code repetition like "(x * y + 7) / 8". It is unsafe
+if overflow happens. This patch introduces grub_video_bitmap_calc_1bpp_bufsz().
+It is safe replacement for such code. It has safemath-like prototype.
+
+This patch also introduces grub_cast(value, pointer), it casts value to
+typeof(*pointer) then store the value to *pointer. It returns true when
+overflow occurs or false if there is no overflow. The semantics of arguments
+and return value are designed to be consistent with other safemath macros.
+
+Signed-off-by: Zhang Boyang <zhangboyang.id@gmail.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport from
+[https://git.savannah.gnu.org/cgit/grub.git/commit/?id=9c76ec09ae08155df27cd237eaea150b4f02f532]
+
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+
+---
+ grub-core/font/font.c   | 17 +++++++++++++----
+ include/grub/bitmap.h   | 18 ++++++++++++++++++
+ include/grub/safemath.h |  2 ++
+ 3 files changed, 33 insertions(+), 4 deletions(-)
+
+diff --git a/grub-core/font/font.c b/grub-core/font/font.c
+index d09bb38..876b5b6 100644
+--- a/grub-core/font/font.c
++++ b/grub-core/font/font.c
+@@ -739,7 +739,8 @@ grub_font_get_glyph_internal (grub_font_t font, grub_uint32_t code)
+       grub_int16_t xoff;
+       grub_int16_t yoff;
+       grub_int16_t dwidth;
+-      int len;
++      grub_ssize_t len;
++      grub_size_t sz;
+ 
+       if (index_entry->glyph)
+ 	/* Return cached glyph.  */
+@@ -766,9 +767,17 @@ grub_font_get_glyph_internal (grub_font_t font, grub_uint32_t code)
+ 	  return 0;
+ 	}
+ 
+-      len = (width * height + 7) / 8;
+-      glyph = grub_malloc (sizeof (struct grub_font_glyph) + len);
+-      if (!glyph)
++      /* Calculate real struct size of current glyph. */
++      if (grub_video_bitmap_calc_1bpp_bufsz (width, height, &len) ||
++	  grub_add (sizeof (struct grub_font_glyph), len, &sz))
++	{
++	  remove_font (font);
++	  return 0;
++	}
++
++      /* Allocate and initialize the glyph struct. */
++      glyph = grub_malloc (sz);
++      if (glyph == NULL)
+ 	{
+ 	  remove_font (font);
+ 	  return 0;
+diff --git a/include/grub/bitmap.h b/include/grub/bitmap.h
+index 5728f8c..0d9603f 100644
+--- a/include/grub/bitmap.h
++++ b/include/grub/bitmap.h
+@@ -23,6 +23,7 @@
+ #include <grub/symbol.h>
+ #include <grub/types.h>
+ #include <grub/video.h>
++#include <grub/safemath.h>
+ 
+ struct grub_video_bitmap
+ {
+@@ -79,6 +80,23 @@ grub_video_bitmap_get_height (struct grub_video_bitmap *bitmap)
+   return bitmap->mode_info.height;
+ }
+ 
++/*
++ * Calculate and store the size of data buffer of 1bit bitmap in result.
++ * Equivalent to "*result = (width * height + 7) / 8" if no overflow occurs.
++ * Return true when overflow occurs or false if there is no overflow.
++ * This function is intentionally implemented as a macro instead of
++ * an inline function. Although a bit awkward, it preserves data types for
++ * safemath macros and reduces macro side effects as much as possible.
++ *
++ * XXX: Will report false overflow if width * height > UINT64_MAX.
++ */
++#define grub_video_bitmap_calc_1bpp_bufsz(width, height, result) \
++({ \
++  grub_uint64_t _bitmap_pixels; \
++  grub_mul ((width), (height), &_bitmap_pixels) ? 1 : \
++    grub_cast (_bitmap_pixels / GRUB_CHAR_BIT + !!(_bitmap_pixels % GRUB_CHAR_BIT), (result)); \
++})
++
+ void EXPORT_FUNC (grub_video_bitmap_get_mode_info) (struct grub_video_bitmap *bitmap,
+ 						    struct grub_video_mode_info *mode_info);
+ 
+diff --git a/include/grub/safemath.h b/include/grub/safemath.h
+index c17b89b..bb0f826 100644
+--- a/include/grub/safemath.h
++++ b/include/grub/safemath.h
+@@ -30,6 +30,8 @@
+ #define grub_sub(a, b, res)	__builtin_sub_overflow(a, b, res)
+ #define grub_mul(a, b, res)	__builtin_mul_overflow(a, b, res)
+ 
++#define grub_cast(a, res)	grub_add ((a), 0, (res))
++
+ #else
+ #error gcc 5.1 or newer or clang 3.8 or newer is required
+ #endif
diff --git a/meta/recipes-bsp/grub/files/CVE-2022-2601.patch b/meta/recipes-bsp/grub/files/CVE-2022-2601.patch
new file mode 100644
index 0000000000..727c509694
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2022-2601.patch
@@ -0,0 +1,85 @@
+From e8060722acf0bcca037982d7fb29472363ccdfd4 Mon Sep 17 00:00:00 2001
+From: Zhang Boyang <zhangboyang.id@gmail.com>
+Date: Fri, 5 Aug 2022 01:58:27 +0800
+Subject: [PATCH] font: Fix several integer overflows in
+ grub_font_construct_glyph()
+
+This patch fixes several integer overflows in grub_font_construct_glyph().
+Glyphs of invalid size, zero or leading to an overflow, are rejected.
+The inconsistency between "glyph" and "max_glyph_size" when grub_malloc()
+returns NULL is fixed too.
+
+Fixes: CVE-2022-2601
+
+Reported-by: Zhang Boyang <zhangboyang.id@gmail.com>
+Signed-off-by: Zhang Boyang <zhangboyang.id@gmail.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport from
+[https://git.savannah.gnu.org/cgit/grub.git/commit/?id=768e1ef2fc159f6e14e7246e4be09363708ac39e]
+CVE: CVE-2022-2601
+
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+
+---
+ grub-core/font/font.c | 29 +++++++++++++++++------------
+ 1 file changed, 17 insertions(+), 12 deletions(-)
+
+diff --git a/grub-core/font/font.c b/grub-core/font/font.c
+index 876b5b6..0ff5525 100644
+--- a/grub-core/font/font.c
++++ b/grub-core/font/font.c
+@@ -1515,6 +1515,7 @@ grub_font_construct_glyph (grub_font_t hinted_font,
+   struct grub_video_signed_rect bounds;
+   static struct grub_font_glyph *glyph = 0;
+   static grub_size_t max_glyph_size = 0;
++  grub_size_t cur_glyph_size;
+ 
+   ensure_comb_space (glyph_id);
+ 
+@@ -1531,29 +1532,33 @@ grub_font_construct_glyph (grub_font_t hinted_font,
+   if (!glyph_id->ncomb && !glyph_id->attributes)
+     return main_glyph;
+ 
+-  if (max_glyph_size < sizeof (*glyph) + (bounds.width * bounds.height + GRUB_CHAR_BIT - 1) / GRUB_CHAR_BIT)
++  if (grub_video_bitmap_calc_1bpp_bufsz (bounds.width, bounds.height, &cur_glyph_size) ||
++      grub_add (sizeof (*glyph), cur_glyph_size, &cur_glyph_size))
++    return main_glyph;
++
++  if (max_glyph_size < cur_glyph_size)
+     {
+       grub_free (glyph);
+-      max_glyph_size = (sizeof (*glyph) + (bounds.width * bounds.height + GRUB_CHAR_BIT - 1) / GRUB_CHAR_BIT) * 2;
+-      if (max_glyph_size < 8)
+-	max_glyph_size = 8;
+-      glyph = grub_malloc (max_glyph_size);
++      if (grub_mul (cur_glyph_size, 2, &max_glyph_size))
++	max_glyph_size = 0;
++      glyph = max_glyph_size > 0 ? grub_malloc (max_glyph_size) : NULL;
+     }
+   if (!glyph)
+     {
++      max_glyph_size = 0;
+       grub_errno = GRUB_ERR_NONE;
+       return main_glyph;
+     }
+ 
+-  grub_memset (glyph, 0, sizeof (*glyph)
+-	       + (bounds.width * bounds.height
+-		  + GRUB_CHAR_BIT - 1) / GRUB_CHAR_BIT);
++  grub_memset (glyph, 0, cur_glyph_size);
+ 
+   glyph->font = main_glyph->font;
+-  glyph->width = bounds.width;
+-  glyph->height = bounds.height;
+-  glyph->offset_x = bounds.x;
+-  glyph->offset_y = bounds.y;
++  if (bounds.width == 0 || bounds.height == 0 ||
++      grub_cast (bounds.width, &glyph->width) ||
++      grub_cast (bounds.height, &glyph->height) ||
++      grub_cast (bounds.x, &glyph->offset_x) ||
++      grub_cast (bounds.y, &glyph->offset_y))
++    return main_glyph;
+ 
+   if (glyph_id->attributes & GRUB_UNICODE_GLYPH_ATTRIBUTE_MIRROR)
+     grub_font_blit_glyph_mirror (glyph, main_glyph,
diff --git a/meta/recipes-bsp/grub/files/CVE-2022-3775.patch b/meta/recipes-bsp/grub/files/CVE-2022-3775.patch
new file mode 100644
index 0000000000..853efd0486
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2022-3775.patch
@@ -0,0 +1,95 @@
+From fdbe7209152ad6f09a1166f64f162017f2145ba3 Mon Sep 17 00:00:00 2001
+From: Zhang Boyang <zhangboyang.id@gmail.com>
+Date: Mon, 24 Oct 2022 08:05:35 +0800
+Subject: [PATCH] font: Fix an integer underflow in blit_comb()
+
+The expression (ctx.bounds.height - combining_glyphs[i]->height) / 2 may
+evaluate to a very big invalid value even if both ctx.bounds.height and
+combining_glyphs[i]->height are small integers. For example, if
+ctx.bounds.height is 10 and combining_glyphs[i]->height is 12, this
+expression evaluates to 2147483647 (expected -1). This is because
+coordinates are allowed to be negative but ctx.bounds.height is an
+unsigned int. So, the subtraction operates on unsigned ints and
+underflows to a very big value. The division makes things even worse.
+The quotient is still an invalid value even if converted back to int.
+
+This patch fixes the problem by casting ctx.bounds.height to int. As
+a result the subtraction will operate on int and grub_uint16_t which
+will be promoted to an int. So, the underflow will no longer happen. Other
+uses of ctx.bounds.height (and ctx.bounds.width) are also casted to int,
+to ensure coordinates are always calculated on signed integers.
+
+Fixes: CVE-2022-3775
+
+Reported-by: Daniel Axtens <dja@axtens.net>
+Signed-off-by: Zhang Boyang <zhangboyang.id@gmail.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+Upstream-Status: Backport from
+[https://git.savannah.gnu.org/cgit/grub.git/commit/?id=992c06191babc1e109caf40d6a07ec6fdef427af]
+CVE: CVE-2022-3775
+
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+
+---
+ grub-core/font/font.c | 16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/grub-core/font/font.c b/grub-core/font/font.c
+index 0ff5525..7b1cbde 100644
+--- a/grub-core/font/font.c
++++ b/grub-core/font/font.c
+@@ -1206,12 +1206,12 @@ blit_comb (const struct grub_unicode_glyph *glyph_id,
+   ctx.bounds.height = main_glyph->height;
+ 
+   above_rightx = main_glyph->offset_x + main_glyph->width;
+-  above_righty = ctx.bounds.y + ctx.bounds.height;
++  above_righty = ctx.bounds.y + (int) ctx.bounds.height;
+ 
+   above_leftx = main_glyph->offset_x;
+-  above_lefty = ctx.bounds.y + ctx.bounds.height;
++  above_lefty = ctx.bounds.y + (int) ctx.bounds.height;
+ 
+-  below_rightx = ctx.bounds.x + ctx.bounds.width;
++  below_rightx = ctx.bounds.x + (int) ctx.bounds.width;
+   below_righty = ctx.bounds.y;
+ 
+   comb = grub_unicode_get_comb (glyph_id);
+@@ -1224,7 +1224,7 @@ blit_comb (const struct grub_unicode_glyph *glyph_id,
+ 
+       if (!combining_glyphs[i])
+ 	continue;
+-      targetx = (ctx.bounds.width - combining_glyphs[i]->width) / 2 + ctx.bounds.x;
++      targetx = ((int) ctx.bounds.width - combining_glyphs[i]->width) / 2 + ctx.bounds.x;
+       /* CGJ is to avoid diacritics reordering. */
+       if (comb[i].code
+ 	  == GRUB_UNICODE_COMBINING_GRAPHEME_JOINER)
+@@ -1234,8 +1234,8 @@ blit_comb (const struct grub_unicode_glyph *glyph_id,
+ 	case GRUB_UNICODE_COMB_OVERLAY:
+ 	  do_blit (combining_glyphs[i],
+ 		   targetx,
+-		   (ctx.bounds.height - combining_glyphs[i]->height) / 2
+-		   - (ctx.bounds.height + ctx.bounds.y), &ctx);
++		   ((int) ctx.bounds.height - combining_glyphs[i]->height) / 2
++		   - ((int) ctx.bounds.height + ctx.bounds.y), &ctx);
+ 	  if (min_devwidth < combining_glyphs[i]->width)
+ 	    min_devwidth = combining_glyphs[i]->width;
+ 	  break;
+@@ -1308,7 +1308,7 @@ blit_comb (const struct grub_unicode_glyph *glyph_id,
+ 	  /* Fallthrough.  */
+ 	case GRUB_UNICODE_STACK_ATTACHED_ABOVE:
+ 	  do_blit (combining_glyphs[i], targetx,
+-		   -(ctx.bounds.height + ctx.bounds.y + space
++		   -((int) ctx.bounds.height + ctx.bounds.y + space
+ 		     + combining_glyphs[i]->height), &ctx);
+ 	  if (min_devwidth < combining_glyphs[i]->width)
+ 	    min_devwidth = combining_glyphs[i]->width;
+@@ -1316,7 +1316,7 @@ blit_comb (const struct grub_unicode_glyph *glyph_id,
+ 
+ 	case GRUB_UNICODE_COMB_HEBREW_DAGESH:
+ 	  do_blit (combining_glyphs[i], targetx,
+-		   -(ctx.bounds.height / 2 + ctx.bounds.y
++		   -((int) ctx.bounds.height / 2 + ctx.bounds.y
+ 		     + combining_glyphs[i]->height / 2), &ctx);
+ 	  if (min_devwidth < combining_glyphs[i]->width)
+ 	    min_devwidth = combining_glyphs[i]->width;
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 47ea561002..270efd30ef 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -32,6 +32,9 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://CVE-2022-28734-net-http-Fix-OOB-write-for-split-http-headers.patch \
            file://CVE-2022-28734-net-http-Error-out-on-headers-with-LF-without-CR.patch \
            file://CVE-2022-28735-kern-efi-sb-Reject-non-kernel-files-in-the-shim_lock.patch \
+           file://0001-font-Fix-size-overflow-in-grub_font_get_glyph_intern.patch \
+           file://CVE-2022-2601.patch \
+           file://CVE-2022-3775.patch \
 "
 
 SRC_URI[sha256sum] = "23b64b4c741569f9426ed2e3d0e6780796fca081bee4c99f62aa3f53ae803f5f"
-- 
2.32.0


