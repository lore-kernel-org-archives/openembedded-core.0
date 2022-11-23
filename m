Return-Path: <xiangyu.chen@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B78BCC4332F
	for <webhook@archiver.kernel.org>; Wed, 23 Nov 2022 06:09:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.13771.1669183734392551513
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Nov 2022 22:08:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8326424e46=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AN63AHP023186
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Nov 2022 06:08:53 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kxp48k5mt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 23 Nov 2022 06:08:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BEYlcUf1+vT7NWaa+LPK5Tu1Xsi/hsJCijwmOejOdO9lH2DxrEGv4aCBpJ0m88fFtsquXZ0rI9667cA56uMojGiXOkZCqo1UB8GxVXzyXdJDUFwJzAvIeyoFmWJgLN41Jv2xQqt5CBaTt8LMKfK0uOQUsgGcJR6cKKCHpeheegK91VKpcEfLAEP/UItldxcGtb9ON/CyYl34NtJxPT1i1WkVLqrHY/ePzOev0Gju4bziHD7VbhtafjSibbvHsVHCkk8eyTIsAfALdQ3DO0KRs5wKJOA8Eh44fCa6yJorgs2ESeoXHBk3NT5d6fS+eygJ/zMcpNNGuHMFBongEhEPOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JQF582Fgr9fP7ktndbTzUBsFTOFnZCDhtJSmoCkEZPA=;
 b=eUWYopQ7P0hIQyeAxu2mwFDHiak3ozkvYYPfiB99qHDLjf7U+svLMNIvkFaWCB7vj4bsb9xnujd0BjEbQpatwx614T96entN0+dgFrUSgxKrZbLg332/yocAvE33H/tQBmQzcDqGt98IHIzwlelK4XvJDKpFnxwKeIdo6GDOlmRX4gLIAofNyvP8pTf36halxMWfTY/n9tPcYvTsckAzDRCzilVqFt8r3QXdlIEXWyzXhI75Btg/DtOXJiIUf3vEGtHCUxXuBTH7T5bSYZabaqfGmuAGkuc+C3rGfWMoZqjbN7C+cuyOtg+h3L/bIXoMgam6lwDFT4kJSFMLoi7cxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from MW4PR11MB5824.namprd11.prod.outlook.com (2603:10b6:303:187::19)
 by SJ1PR11MB6130.namprd11.prod.outlook.com (2603:10b6:a03:45f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Wed, 23 Nov
 2022 06:08:51 +0000
Received: from MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16]) by MW4PR11MB5824.namprd11.prod.outlook.com
 ([fe80::d252:a0d:467e:ad16%3]) with mapi id 15.20.5834.015; Wed, 23 Nov 2022
 06:08:51 +0000
From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-Core][kirkstone][PATCH] grub2: backport patch to fix CVE-2022-2601 CVE-2022-3775
Date: Wed, 23 Nov 2022 14:08:34 +0800
Message-Id: <20221123060834.30727-1-xiangyu.chen@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0148.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:35::19) To MW4PR11MB5824.namprd11.prod.outlook.com
 (2603:10b6:303:187::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB5824:EE_|SJ1PR11MB6130:EE_
X-MS-Office365-Filtering-Correlation-Id: a48fd2fc-ccd6-4359-2061-08dacd193109
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5enS4SpmUy7UxQs+1Nl0kRZDETBt0S05AolygKo/zeFnlNcXS/icXkF/pMLQ280B+nbGMheOddtv5eUeP+EQr4fgYe8r2rjewvdS+w4t+bdLRHbPIp7Xp4R65IeKmtq1ICl22kFhwY42X+Gg/LfbNt8+1ZxA6T6cyHgYsfvnlYIJeWXTXjiryyMrTvd5pOlBzSstWIJqnv2c8ZX9jATZyeJOLcg+7QzJil4syt3fJuZjkK3cQOqTovexH98T06mTwYJtpEQ7CVbuHyzq/lPYD0ZOlv1CGrHM7ynLaJkh7pgffkPZG3ZVgB1rO1wcdWwzPq4sWuwOlmuYWAyAlCedPJ0jMvEtxsXIOoWJHyXg43t/OeFzcBozj6BFet5/NLU6oxwpmGJqCE3g345eJqX9OsRwwk8O5rKLkXO1jWHuhBYIftgWg1okhGNVCeH76rOnrq8V853wYn6Rwu1XYHCCCLFdJwhCv5VDXqJyMcUy9YG4ppz7aq6IJlAXjV71yBj8TqtGGzpI7FO2emxT1BHtZpYUhzMLAmzo+TYsZr2dmuGXCnxEMVtZI/mI7siX+ZG3Sw4tVbck7O2dFMg4/LG3HT9MBwlIIwcGI6nymkSY/GHENr2O7knp6WiWXD3IfZ/ka4qPh++qgNqHz4R1fPpBRBHZV4afV3TtlXOLQTdPMAkOmH7qOAxRrhZ/pkkXaAxKPlVhHCm+QYIu8MxYOtzTsA126V5LJgq0tFMTtwt++XOy6jzZi/XecA8b6XoWxxPSOac4O/78a1+2q+QBMyS/oQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5824.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(366004)(396003)(376002)(136003)(346002)(451199015)(30864003)(38100700002)(83380400001)(6916009)(83170400001)(2906002)(38350700002)(8676002)(8936002)(41300700001)(44832011)(66476007)(55236004)(52116002)(5660300002)(6506007)(6666004)(6512007)(66946007)(186003)(1076003)(26005)(316002)(66556008)(478600001)(6486002)(2616005)(9126006)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?i5/4f1NTGznhqK3dKaPII1sAnD2gvD7dxw486saODl4bw92Kv04eV73Qv6+z?=
 =?us-ascii?Q?cR8uTuFlHdAucL28dGxZ6BPO0E2cJw+GWQe92OhrId8EsRKrS87aul+ztp1b?=
 =?us-ascii?Q?2YdpoI+cGrRTpgtHXo/dph46Hxx+TT9lP970ZoTxEPC6N4PkVOk534B5yQN2?=
 =?us-ascii?Q?0g+Y2kAZpRIc2gBwaNaXrl2jg8PoBGR8jkZuc2b3f1WXcisfotpkFr/L6yE8?=
 =?us-ascii?Q?3Hqz4yE3jgyJj0RWSEQmQDjY+tdQ9QLhGaofhUMXW544tV05CKgLD0uPnmnR?=
 =?us-ascii?Q?crexGd6P+kDOru+dz7hzMXdKM7cwT/tmlA7b5sC2q/RBGq2Avpg5Cp5NVBwd?=
 =?us-ascii?Q?0B1SqPAoZzguLhUlz/xfz5bt4kH5fd9oRqf+s04ZX36Z6cXmYgajKoFoa1Jv?=
 =?us-ascii?Q?byGW/XFrc8yjQu55KvoUb+pODs2rbBHYRb36KPQvfDEnNe/M/MgP9z7u7ZYp?=
 =?us-ascii?Q?bfW+VL/CpG8/A+djT/ngOjS99K5rUubTOiBo5piD1UGjA+ZhlQg4a5nJ6X4/?=
 =?us-ascii?Q?Z/rCV3L+lkPPw/Rl5jqHDm56mhzR4C/ihf7eXTS0smRDR9+xPlOHwRdkSHaB?=
 =?us-ascii?Q?MM97XOjSRj8YzrMoh4RqY0hjKMbY7FVig86Ovfp92oAKeg2rq4WWZsayUHdf?=
 =?us-ascii?Q?L1AqGa/TapH1pbsW0HlYMkirbvuW/0PR/6T+7rhwmyXRJxOVImrcb8tjrAcy?=
 =?us-ascii?Q?QomL19Le2nFxFjm07NmRitH1bIT54Tb3okec7xv6pf4TECgQDGNme+Ve2dd2?=
 =?us-ascii?Q?nVmfNEaYod0n8QbBI2kmcbH3Gh4pHkxgBysIIO9LLJUQOs2qL8mMrvG0MQ41?=
 =?us-ascii?Q?zpXDdYe0g7PGF4m2uAhjIBpNYTjXDVysTislyc5iFCHk+lFmDWA+wd0XI0pe?=
 =?us-ascii?Q?fmOCh51/gsINCpaHEvbiDa7B4QrXmBHcE0Upfl8z3otASYqMH9fy1fzf6BdA?=
 =?us-ascii?Q?49cJUjqifK4sU66RLfRVGZB1tdmtQ/XjSwd7cWsq67MiROJnPavNbaZDSuSW?=
 =?us-ascii?Q?8Y52Y7DyinXG20JWBTllbLAVw4rAbzjMUjsMWvU/+5ZRH8KluU+utdyG2dMb?=
 =?us-ascii?Q?ld0j9J+UdZNKbKbgS5cDY1wbTF95BChqYmuVFuEcNaagKO8bB1oNpoa2yT78?=
 =?us-ascii?Q?rEg7tq2wa2JkLzEGK7mQhjfYS5qoBsh8VRFdGUr5lgr60+GZDDe1ZKmOKxr0?=
 =?us-ascii?Q?gFqQVPTQW3kxHC2puodJFWRZT/QLSgIG11UznfMCykUtcAO5yDDTvAVtHcIq?=
 =?us-ascii?Q?6DddqqGmOnWfqyxmHaO1RWDzOIBgbToY77AWrsoV0MUR6lwckg5+NRMwmgZn?=
 =?us-ascii?Q?1FfvvQ3jlbVkjFwu8yU1MoYHJyTZpYK741ddLjCpBUAGdyVN0HRb886pUF2S?=
 =?us-ascii?Q?xd4bU5OBGL8ALzYWYerCRTyqUeFmw75bnhWdnEoHJQTEL4UgleF/rKXfqjE8?=
 =?us-ascii?Q?e+7bhR9LCtJuhpummbWjRQScJMTAdbyOjYyqYZNiP7EdI1CDr6g23Z8Xp7jL?=
 =?us-ascii?Q?5DuUvD9G700YBhC3D1EjyffxEtY4zRa2WDc6CBTZK+CQgHYoHiSS9PbGiFGg?=
 =?us-ascii?Q?tgKXtAgqZ4dTu86gl8bnm44CL6/O96vaj2ZHeR7wGLAETlnPuPfeBGzL24PR?=
 =?us-ascii?Q?7A=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a48fd2fc-ccd6-4359-2061-08dacd193109
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2022 06:08:51.0966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ZOdy5Ddea15qt2wVuSz/Tv8OYFn68haCA76mjJYmEkpyFomU0XTplUdSGemq9Jm7bH9fPAnsS4n8BRqFm4J3N+91QOE5r9JqgXYciAunik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6130
X-Proofpoint-GUID: AaoptlsqFYuN9qVV3nqcV99u-MsOASL-
X-Proofpoint-ORIG-GUID: AaoptlsqFYuN9qVV3nqcV99u-MsOASL-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-23_02,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 mlxscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211230045
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Nov 2022 06:09:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173708

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
 meta/recipes-bsp/grub/grub2.inc               |   3 +
 4 files changed, 304 insertions(+)
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
2.34.1


