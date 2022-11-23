Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E056DC4332F
	for <webhook@archiver.kernel.org>; Wed, 23 Nov 2022 06:27:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.13979.1669184822134042109
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Nov 2022 22:27:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8326424e46=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AN68JY3021997
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Nov 2022 06:27:01 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kxnxj365h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Nov 2022 06:27:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gA2xm6bLpR8Ei8BafDn5zGRmGFZ+5OswZkzcHSZvmXBBPEH0LMlWpqDwxr+2u3L3lIRZZYGwhFN1AJFtdYKiO7/HyOwOT6ia37yCk3SCcxEFQUMnOyLLLaAo/nML0xjkL9Om/Sv0Af78dO8r9qbr2sbkUIfZJ1rvny3I7P54nH0D4+0teYR1jeOlSzmOFdFhuxDkLWrteBAksoCiKKaKjQJa1q+R+TZRvkUQRc449M/Lxd5z7kABe6+zc8EobHoGnuaeFDa4uo2P83M7DL8xyhCeoUF7ockOpXTZiX/U6k7v1UBDTuKounPbLRzJoh2s5XtsHDl/SRWx9yFC4Nrvow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yD1vAMtwKMsyjdf6fXwCQOJH+YF3GnHoIju/pjFaXe4=;
 b=jLKaeAVBIn5xN6VcD2TyZHIqdA4NW83zG/J1VHYIrkWR7i2et5t2F/zod+3qM4xEcrzNgVh3TncrKPrtks8N6URlfHaBvyCI5gTwg+8Tz1gYMJIa4u7Yphq9+Gu2poy2OIrxeNOXxMBbl4FqA5D8tTv/MFGVrcWe+DLGfmGkc+rhAOopBzdUJ/emxSIILFAGY2ZSrjAe1h/J65jWU1/ZGW7opYH2OFjb9rgLIQ3VTEFxwV1vWff8231u/Gvgd45WkIauCyNbtuXjci0CImjqfxSfjd/G1yyfalmBQD5OZv+THyozp67GW41yAslK8d9GiTktv1G4VtX3Sb3ZpI1hcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by PH8PR11MB6754.namprd11.prod.outlook.com (2603:10b6:510:1c9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Wed, 23 Nov
 2022 06:26:57 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16%3]) with mapi id 15.20.5834.015; Wed, 23 Nov 2022
 06:26:57 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-Core][master][langdale][PATCH] grub2: backport patch to fix CVE-2022-2601 CVE-2022-3775
Date: Wed, 23 Nov 2022 14:26:39 +0800
Message-Id: <20221123062639.31767-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0169.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::25) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|PH8PR11MB6754:EE_
X-MS-Office365-Filtering-Correlation-Id: 63dd3b5d-89b4-40b2-9e64-08dacd1bb888
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FRO0ZIdDI/EghNPL8sb6TOdDjZ/DKkfGG5e2w4wAdR00gTqSanSCsEgeMASeV5ftuHZH8u+mQ7U+o070vZHOZP3f5sVm2BnNhnY+lkzt/9m9YjRQdfwps3gkFD0QHA7I/c+OmKrtR4T+iGblKs5xNb/RFksprFRX3PUo4UsXb4ZtGMpQSNH4jOu3GFzu6aqqqPhTlWWg+n8CV7UF8ZZid6Ct/5xOtiV69hJCTZWXR+h/zM4YAF1ginyefDoPHfocUUcHLPdeFMaNakKyefibjclHEdOQEStL1ZiosWGuCxsl8ewvSbUlX0nYP0UchcayRsIJSWDXgAnOKVJzsWPt73L1fvbfsLOMMgn/A3kz/TZFsAhyltM6b5/POeFRFpIB/QFuGLEktPF9ePw1J7lkTaxA+yVN+Y60lS6TaTzhqP/NNOb8XAFU1HO4r/joFRJtCPkXpHexC6jfljVAif/EMTya2SFEvvP2pb7/O38gEOwdKsaSnF9oSfTYiZlqE2t5i42T2L73a7NuwNl+g5dN52jTRviF8UL4wDzsb7J/0Z9rByos2AanN8bDw/gCiyH9oZogC4vfaobh09R/m5H5KRFApoDHZJqu+EFIPPMYJD1YSZnx8BAc/BbgdP01GQOmcCgKA4LogCncRMYP3LOjCSrHZ+pk4t3auvvf7lb1NoF4ifx/A8qq6AbHFy1otFaKt193sLXve6LPdgSWvbxqVJ8X8pBJC8h3C1RQgdWgBMso8jUpopc6sc3sqCLAkvAiCZObxQv/+EHwQXUmU3UEQw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(376002)(366004)(346002)(39850400004)(451199015)(6666004)(41300700001)(478600001)(6486002)(66476007)(30864003)(8676002)(8936002)(186003)(1076003)(26005)(66556008)(66946007)(5660300002)(6506007)(316002)(52116002)(6916009)(44832011)(83380400001)(55236004)(2616005)(2906002)(6512007)(38100700002)(38350700002)(83170400001)(9126006)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?u95m5muCsTNhBiO6l/4/9YGQBov8Du0/5rFrl5yOwdRbZhjg3MfV22ThYT8D?=
 =?us-ascii?Q?CfImUmYrbErbFkMRzhrGIVbTpNZXrM6hnrQkJZ7PzJkvL0qRuoMw+2QFCWky?=
 =?us-ascii?Q?h5g3oYzRTaXztZV0Mc0CbOm68p+XSRBDHh+Y46rRDok72w/8TodPvdjWZsYh?=
 =?us-ascii?Q?qw4cGGzBmYlEmhIW6NZ3BEuMu30WC2GAQHWIMrl6IiLf9Yx2dE/6BET5TIJS?=
 =?us-ascii?Q?nVsHEaWm81xpe/DCBaEGpYm8Wa1fTPxAQtnxdkczw3oO02Y1sAoRvqT3X3kM?=
 =?us-ascii?Q?bnswxPd0ehH1bJYpNuhEs4n88UdDuzUaE4f7VVKMfjKHjtShDfnu8BlTFxDu?=
 =?us-ascii?Q?/qLqQRLfIK3zUKHXr52MmqCpwbxT/OYX1NgISadC+HWDegT5PiWZMmF9L4uD?=
 =?us-ascii?Q?8OU9l1SIE6s2TVLdM43jw59pPLxOVLM+1PhS4WYJSX6cnWKyhNF+DGlrGW3v?=
 =?us-ascii?Q?EoxbPUqX/+VIVNGhD8O3w+JVe9xnoaGzZO5LuzEIldrjBUSAOsbpD1W21L91?=
 =?us-ascii?Q?mr/dOQq8vB06btGowhLca+tupr+nENCN//PurubikTPT6R0kqD2qfcYTtidw?=
 =?us-ascii?Q?wEfCBTtaPYNKtBAErvZ+7absrEsaI4wzWFXmPnzBlNPhPmYWluQ8W9oyb/CU?=
 =?us-ascii?Q?ks8yhU2Mlrc1TG2OFCFHwoH3xXYzclW71YJXVvzYXDjotnAIQLAQvf9DRqGT?=
 =?us-ascii?Q?EI6PEM0RJqXNyn+HGCb8uVLxWmSVhl7nnu1Y4lgOw1iSk2/3JzWTtB9nXXoC?=
 =?us-ascii?Q?2e4oBEA8ZcGVrGaj/6dAx/WrwWY0eM59T2AfSWXCzww5oejYgTe5wN5IrsF0?=
 =?us-ascii?Q?NxSmL4eS/z6FXz7Iz3/xiJtvoMhcOJ8v+sORPK0BHnpePdov8ucUfQPpJEsg?=
 =?us-ascii?Q?YSWLXha8brXxMQOBuk1REhk0gtOZgE/TE82/yXl3UbEJF2/J2nsbJhbgvMVt?=
 =?us-ascii?Q?SthKds28ckMoW2yG4QO+iK8e37TI3blAs5T551Xpnego3PUjTf+8kPLssaF0?=
 =?us-ascii?Q?glYKbnGHEA8ey/boOw+mw9lJEkuQtXQOwQi0wWx04HiaNASGGo1rT9/1GBRN?=
 =?us-ascii?Q?3y5WtT4uxxKb09aEg0cahgF6WJAishCGG+4OuDr6PP7MLODCdyTbmcVQKyar?=
 =?us-ascii?Q?TrwXf3G8CzRoM4AmGrUw1P+atEx74307zFsYlwVJoUx3MV1NQW5O3qkuoqEV?=
 =?us-ascii?Q?tneRSjlozQRR+oc7HUHRS8Fv9lUtrJF8nvZZoSLgP9iVzGkvvl8k35JP8cbg?=
 =?us-ascii?Q?xHTLTGoITU2iealyuOHvU+ODHrntcy1vxfvX+zjyFnHO3Rvdwb1FmnRSyuQS?=
 =?us-ascii?Q?6LUkRdaHDS50K411Kq8NgrxT0dZ/pIw36/0Clw73EzQByZAEa6JBUTM+v246?=
 =?us-ascii?Q?fgTY5Bc1ylhp3POLNtgtQTG4qsPibqh7aWIFwYsy87BobV95MNp6SqEBwL2T?=
 =?us-ascii?Q?GU0dY0BqiOSCtOP+Q0eMDel4kE9dHsZXScMkzHG38Y4poqkfrqC5gw2bCC9R?=
 =?us-ascii?Q?HWxwt7sf0xyqCycl+syKzuT3vaUmUacB7Kmb7pdQZX3tqVfslAuFVEirMJuI?=
 =?us-ascii?Q?EyyQAG7N7JpZUfKwIKv9WJjRRYe+uPq8vMEUSRwrH9vDhk+nSr8iYvMUqtvA?=
 =?us-ascii?Q?EQ=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63dd3b5d-89b4-40b2-9e64-08dacd1bb888
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 06:26:57.1993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xzQq2XFkXl18mWkhMqMqzkx0IyWLjTerBPlOblFY58TW4tycEWqjujlbNBzkFBsTKxEWy+b/CEq1Kk9y+98IOljTIDrz11qAzXPBlQEo/VM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6754
X-Proofpoint-GUID: uMNHWlKYcH_fq1-fh-vtWQrpsW1g2664
X-Proofpoint-ORIG-GUID: uMNHWlKYcH_fq1-fh-vtWQrpsW1g2664
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-23_02,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 malwarescore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211230047
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Nov 2022 06:27:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173709

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
 ...erflow-in-grub_font_get_glyph_intern.patch | 117 ++++++++++++++++++
 .../grub/files/CVE-2022-2601.patch            |  87 +++++++++++++
 .../grub/files/CVE-2022-3775.patch            |  97 +++++++++++++++
 3 files changed, 301 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0001-font-Fix-size-overflow-in-grub_font_get_glyph_intern.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2022-2601.patch
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2022-3775.patch

diff --git a/meta/recipes-bsp/grub/files/0001-font-Fix-size-overflow-in-grub_font_get_glyph_intern.patch b/meta/recipes-bsp/grub/files/0001-font-Fix-size-overflow-in-grub_font_get_glyph_intern.patch
new file mode 100644
index 0000000000..db0fff94d2
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0001-font-Fix-size-overflow-in-grub_font_get_glyph_intern.patch
@@ -0,0 +1,117 @@
+From 9c76ec09ae08155df27cd237eaea150b4f02f532 Mon Sep 17 00:00:00 2001
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
+---
+ grub-core/font/font.c   | 17 +++++++++++++----
+ include/grub/bitmap.h   | 18 ++++++++++++++++++
+ include/grub/safemath.h |  2 ++
+ 3 files changed, 33 insertions(+), 4 deletions(-)
+
+diff --git a/grub-core/font/font.c b/grub-core/font/font.c
+index 756ca0abf..e781521a7 100644
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
+@@ -768,9 +769,17 @@ grub_font_get_glyph_internal (grub_font_t font, grub_uint32_t code)
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
+index 149d37bfe..431048936 100644
+--- a/include/grub/bitmap.h
++++ b/include/grub/bitmap.h
+@@ -23,6 +23,7 @@
+ #include <grub/symbol.h>
+ #include <grub/types.h>
+ #include <grub/video.h>
++#include <grub/safemath.h>
+ 
+ #define IMAGE_HW_MAX_PX		16384
+ 
+@@ -81,6 +82,23 @@ grub_video_bitmap_get_height (struct grub_video_bitmap *bitmap)
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
+index 51290d355..fbd9b5925 100644
+--- a/include/grub/safemath.h
++++ b/include/grub/safemath.h
+@@ -30,6 +30,8 @@
+ #define grub_sub(a, b, res)	__builtin_sub_overflow(a, b, res)
+ #define grub_mul(a, b, res)	__builtin_mul_overflow(a, b, res)
+ 
++#define grub_cast(a, res)	grub_add ((a), 0, (res))
++
+ #else
+ #error gcc 5.1 or newer or clang 8.0 or newer is required
+ #endif
+-- 
+2.34.1
+
diff --git a/meta/recipes-bsp/grub/files/CVE-2022-2601.patch b/meta/recipes-bsp/grub/files/CVE-2022-2601.patch
new file mode 100644
index 0000000000..7c140f7153
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2022-2601.patch
@@ -0,0 +1,87 @@
+From 768e1ef2fc159f6e14e7246e4be09363708ac39e Mon Sep 17 00:00:00 2001
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
+---
+ grub-core/font/font.c | 29 +++++++++++++++++------------
+ 1 file changed, 17 insertions(+), 12 deletions(-)
+
+diff --git a/grub-core/font/font.c b/grub-core/font/font.c
+index e781521a7..e6548892f 100644
+--- a/grub-core/font/font.c
++++ b/grub-core/font/font.c
+@@ -1517,6 +1517,7 @@ grub_font_construct_glyph (grub_font_t hinted_font,
+   struct grub_video_signed_rect bounds;
+   static struct grub_font_glyph *glyph = 0;
+   static grub_size_t max_glyph_size = 0;
++  grub_size_t cur_glyph_size;
+ 
+   ensure_comb_space (glyph_id);
+ 
+@@ -1533,29 +1534,33 @@ grub_font_construct_glyph (grub_font_t hinted_font,
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
+-- 
+2.34.1
+
diff --git a/meta/recipes-bsp/grub/files/CVE-2022-3775.patch b/meta/recipes-bsp/grub/files/CVE-2022-3775.patch
new file mode 100644
index 0000000000..7b5512daaf
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2022-3775.patch
@@ -0,0 +1,97 @@
+From 992c06191babc1e109caf40d6a07ec6fdef427af Mon Sep 17 00:00:00 2001
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
+---
+ grub-core/font/font.c | 16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/grub-core/font/font.c b/grub-core/font/font.c
+index abd412a5e..3d3d803e8 100644
+--- a/grub-core/font/font.c
++++ b/grub-core/font/font.c
+@@ -1203,12 +1203,12 @@ blit_comb (const struct grub_unicode_glyph *glyph_id,
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
+@@ -1221,7 +1221,7 @@ blit_comb (const struct grub_unicode_glyph *glyph_id,
+ 
+       if (!combining_glyphs[i])
+ 	continue;
+-      targetx = (ctx.bounds.width - combining_glyphs[i]->width) / 2 + ctx.bounds.x;
++      targetx = ((int) ctx.bounds.width - combining_glyphs[i]->width) / 2 + ctx.bounds.x;
+       /* CGJ is to avoid diacritics reordering. */
+       if (comb[i].code
+ 	  == GRUB_UNICODE_COMBINING_GRAPHEME_JOINER)
+@@ -1231,8 +1231,8 @@ blit_comb (const struct grub_unicode_glyph *glyph_id,
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
+@@ -1305,7 +1305,7 @@ blit_comb (const struct grub_unicode_glyph *glyph_id,
+ 	  /* Fallthrough.  */
+ 	case GRUB_UNICODE_STACK_ATTACHED_ABOVE:
+ 	  do_blit (combining_glyphs[i], targetx,
+-		   -(ctx.bounds.height + ctx.bounds.y + space
++		   -((int) ctx.bounds.height + ctx.bounds.y + space
+ 		     + combining_glyphs[i]->height), &ctx);
+ 	  if (min_devwidth < combining_glyphs[i]->width)
+ 	    min_devwidth = combining_glyphs[i]->width;
+@@ -1313,7 +1313,7 @@ blit_comb (const struct grub_unicode_glyph *glyph_id,
+ 
+ 	case GRUB_UNICODE_COMB_HEBREW_DAGESH:
+ 	  do_blit (combining_glyphs[i], targetx,
+-		   -(ctx.bounds.height / 2 + ctx.bounds.y
++		   -((int) ctx.bounds.height / 2 + ctx.bounds.y
+ 		     + combining_glyphs[i]->height / 2), &ctx);
+ 	  if (min_devwidth < combining_glyphs[i]->width)
+ 	    min_devwidth = combining_glyphs[i]->width;
+-- 
+2.34.1
+
-- 
2.34.1


