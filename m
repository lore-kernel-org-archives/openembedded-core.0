Return-Path: <liwei.song@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5256C4332F
	for <webhook@archiver.kernel.org>; Mon, 26 Dec 2022 07:16:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.131801.1672039000236678941
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Dec 2022 23:16:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ACkVU3HI;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9359baba56=liwei.song@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BQ6lvXX009126
	for <openembedded-core@lists.openembedded.org>; Sun, 25 Dec 2022 23:16:39 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=TWS/Wt4QwaMKIcbxoxp8h2nwRwvW2KuW1ZxHihbRl+U=;
 b=ACkVU3HIBiWW16wxcF98R12Hxi5ERHyD7NnzRcJ/kRjW6KtQr79HWQFxPZHmaJj9vcmT
 cqxSuJf550mN7Jdgci0PCFhca6JTzcGlG6c9ffJOlMMQEN3t4srR3ANwXYipJ8QjOsQU
 e4jHrEoMMlOfWdb9ctR2qUPf9qIh0jq5bw3Zoz6/yqXNTA2UZpeGMlM9LLhEFYZCDuhR
 lNS44ro6pTEVmSgztG7QT7hm0KLXiBHgtc4BrlrqkBIZgmi36nCYFHTpWgM4z/M7hiZ1
 mopTq/gaUXrs4Shoeil85fai3iXqTthOpBjKvlOveyME+TeEt2Tm5aEIYpJJmiF5S/O9 1A== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2169.outbound.protection.outlook.com [104.47.59.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mp1trgu64-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 25 Dec 2022 23:16:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C5zbP57puvyFRVzwanPMPtVSEY909oijzioXx29Oc/DndiCEDDZDdU42kvf+4C4RJppV0adt/eMkAofC5YV6buIHoZQ4Q7wnmNku6zSbvbcNEuf027v2rUGOMzv+4pzEnJo5sIShBL808b2ruE/aiFx4YC7IbV+TwsbwSGbnpUaKJj4NrTSPn7YcEvuVQ7ECWPAID0jrYqe5y5Y0EK3dIptXHZH0bVRfOFg2epLdDUyy2qjyn9xtVeunzGENfb/VfUcl6OyS2LxtlG4Jjscv0zyDW+7xqSPW08NLndl0ZM8zlsy8fkqUFtUZZbK/6pfAxOtCaB6twC90qGDkY3pMFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TWS/Wt4QwaMKIcbxoxp8h2nwRwvW2KuW1ZxHihbRl+U=;
 b=fewb3bo291JRoAO+KRsLIVwz3Y7AEprHSXE64hj4Y3xhKOWQp667Klga9jz/daZn/ZDlEibJqpzAdVbc5DXSiy2e1EbovYiWLRfVEd/+F1CmK6dsiu8EwXSoQY2TpDQLKNNcyBkvgawYfxmp4x4vpyjCNmdCDC97Mj2NvKYq8c3a1AfDWYznRMQvh1buLlHyBEVkr4THpMVBSa9wUKCECqT88QT/m7uey+7dwweQk+x08u2xyBtXhD7/M+QGVKaDTbd4uUDFY1nBlH6GJjA+MPArkWuU4UculbuEWqh7hXxMPWWEkwOv4HOFZnJncZDEE+/5AQvcFHuyTBwGVSVleQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB5348.namprd11.prod.outlook.com (2603:10b6:610:bb::16)
 by PH8PR11MB8064.namprd11.prod.outlook.com (2603:10b6:510:253::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.14; Mon, 26 Dec
 2022 07:16:37 +0000
Received: from CH0PR11MB5348.namprd11.prod.outlook.com
 ([fe80::6d23:75af:8df4:216f]) by CH0PR11MB5348.namprd11.prod.outlook.com
 ([fe80::6d23:75af:8df4:216f%5]) with mapi id 15.20.5944.016; Mon, 26 Dec 2022
 07:16:36 +0000
From: Liwei Song <liwei.song@windriver.com>
To: oe-core <openembedded-core@lists.openembedded.org>
Cc: liwei.song@windriver.com
Subject: [OE-core][master][PATCH 1/1] grub2: backport patch to fix CVE-2022-2601 CVE-2022-3775
Date: Mon, 26 Dec 2022 15:16:19 +0800
Message-Id: <20221226071619.3426-1-liwei.song@windriver.com>
X-Mailer: git-send-email 2.36.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0050.apcprd02.prod.outlook.com
 (2603:1096:4:196::11) To CH0PR11MB5348.namprd11.prod.outlook.com
 (2603:10b6:610:bb::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5348:EE_|PH8PR11MB8064:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ea8603d-9880-4ae4-3fa0-08dae7112011
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9EG0MgTXUm4QeZNUOlKpQ3XbCHh5DustrXbZmf7YgCDS4RJqy1cOxyxlzq1SvaxbawD+f8ujU/K5+GTAOcJSyr+M+PTG0GmOM6UZYwTI8c0U1zGmXNRz3sHx7kYIVo2QKTKDDHgFtYF1fSEXxHhNCo1XDMo7KfCrd4pUoHjA7RSD9ZDs6NFAsUphyphWkIaBvAlKs6o7/huf02d9uOPNaOfbnO/CA7jml2z/Vt3U2OHdFDFpx2s/ZBVNQzXUSoke1xOP7zuGoZqfhzhRvdAEN8enXsd2wu7RMRP7cCymd8UWUziVvjjb4HT0e12uu8GDrRvDljxzsF3qF7+wzF07PQ0VNkB+pJoWD24XQHtkDsUcthYavbPDpYaY8xBVHWPb5c3PgIqnzBhAAxk1VazxMYTax9IpoMmInvjzNqC/L22OtICWKgRmcRLtrVVDvT0vO7Yi0eqX+pcQ7mMbSLs/ic1H6lSm5d9akE0HuB8m5RuZLkOOIhw2yzkcuWM4ktq77+dgdiKR3eXQcxORfEhr36yU7aSCPA2EuETaQ74Q40XMUWGFdEd+JGteDBDu9QCmYQd8D5kJYRG8YXPghe/OexBbjY9eLPv48PXBQDiioFDzu6dQPnSPANcA6FI6XpTpAcw6OnbAaiNobBRtwnMkhqxzgY5UcBeCJ0lHUZ3804quEueVqBjCFoNp0lWb5ti8VApd6B8wzxuw7DbXZ95qvu9a5unXub9KP+fG0allx3geCz19NQOLlQ8qil/mgiwWZruQaRLSCBW03EeDmNDDOZvS/IIsJAcUsuQxsUW5chk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5348.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39850400004)(396003)(376002)(136003)(346002)(451199015)(8936002)(86362001)(83380400001)(5660300002)(30864003)(6916009)(6666004)(107886003)(44832011)(316002)(41300700001)(2906002)(6512007)(38100700002)(478600001)(6506007)(38350700002)(26005)(186003)(2616005)(52116002)(1076003)(66476007)(66946007)(66556008)(6486002)(36756003)(8676002)(4326008)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kadytsIdNQ+yxLBMv53JDUQNX3ZHGASUobdlnN2Y/JgmdUisjlkHAleJGJNl?=
 =?us-ascii?Q?aFXYkBYslmttDmIau3aQVlzgcV0fJygF89H7Mvm6bMojSoMHvfIWkrBLrKCu?=
 =?us-ascii?Q?h+H8/nlvS1MdKUNb76FV7d60Spf7weelu/Pwd9oy7+qY8TrTuqtVZbxGbdv2?=
 =?us-ascii?Q?tkkadz0qg3oaf6yjyIhiu2EW92sUWq8hjzrERxvWKAtz2Z/hU6vhhE78X31/?=
 =?us-ascii?Q?Z8vGLYBlKv3RK2DpNGI2SW3jY/vhsyHPQQADj/pQ9dXvddeQ/sEXIDZ5Uw0y?=
 =?us-ascii?Q?G/VjJtVm0jlWIycvtwEeUz6C74eD57w0k+pAAC+ZCu6ZqMEnDLMvQoS/ZYUu?=
 =?us-ascii?Q?k8oJx5eDy0CjEKVolHPg31FQ1fA0GulEhBZAsEVM81P4ACCi9Up1HBgdx0Bx?=
 =?us-ascii?Q?0QL4PjhEQP4LoGuFB8erORbWFhFLLeBqu249lqfdqtUpDvazkNlRNuldL4ba?=
 =?us-ascii?Q?bDWGFciKf9Wg9vERHXhK3vwftUNrej19WZvvhPkw5MMUZ5rNCiY3tq3v46BN?=
 =?us-ascii?Q?yDA1wh5vCVjS2vNIqDXb9DfRERel2cWRnVrrfLIhV2dAZxUk00wxcOJ4qMgH?=
 =?us-ascii?Q?ku1OpaVpEnGFmu5gAczMq14V3ZNyHXBS0QQmiMDmBbLJQepslW0m3+vIbBrh?=
 =?us-ascii?Q?gSUirhqa3egpRxqlw/uwgxEhjKNCN9Gh+L++inUjF/0+CuPcSqpK6Z9efLjT?=
 =?us-ascii?Q?ME46HmRSpUIEOaIkE33ztO10j+fBFkNsM3q7i5T8DgQfg/J0aPcVEE0yaPgq?=
 =?us-ascii?Q?OeNqbvsvFOAfS16Ou5J05Td9Rtyx3rP65qRiYAdhN6283I1eOXzabaHaVJH5?=
 =?us-ascii?Q?JwqlZc/RAXLb2KDZyJSGmZDaoBZp+1Mk8yAN7JziFnMs0CTd8gntsovCp0M7?=
 =?us-ascii?Q?4HxBLZ3ryhJDhHDyvEQraeNsCLtsO1vZBYJNvL4PWqF9LYaDaw7YIzK2brgo?=
 =?us-ascii?Q?XF/5LXjPKKT++Rhe6yADp/2HWKA2rqiC2sixa+AUrOza+IUI10QXgxRJES6w?=
 =?us-ascii?Q?4m75GPfPqe/FHaQThavixZTwijtOZ07ZfCHtek/uu+qeNDiuAVim1CGdgF7W?=
 =?us-ascii?Q?T7yBQlh6hzDe7NSpy7ZTYdpptZil2V1q0OGwy7qFFApfCI5fLId1d3oKsKyL?=
 =?us-ascii?Q?n06F+uViqQC0LCarY3W/h9DF56FT4qnT2VmJM4fBlUv9WGpDuxx1gSC6X2Rs?=
 =?us-ascii?Q?MBS9QU7ycfF5irTCS9mK331P/ylHhA7wvdt88z3+3Rfzb/yLKIxRxkx5KOrA?=
 =?us-ascii?Q?deVPkKbu29VQ8Ov6/f3llLLovt1vOQqzLR8sJ7mr9A4yjLmgbc0glU9w4RnF?=
 =?us-ascii?Q?gpO0f09kgmy5OrF7LnsjUpGqYYao7lCz2EqN2inwdGyRceqo7oorHuMDmD0u?=
 =?us-ascii?Q?vcdmEGH4wLecco+o/0okJCrEiEpsjTXplBkdsp/fkYs2tZ1SesUkKIeT6GsQ?=
 =?us-ascii?Q?Q4vwx2aXqZDNq7evq39UFNBXzvBSxmJUGjZEW/+JVKVx2RUfNCo8V+c54slj?=
 =?us-ascii?Q?bUxMYII9X2htSD0hXmjYB7OkS2pi6drLtAHa13Q1QPzvZuQOt/r+Zh44UkZw?=
 =?us-ascii?Q?qJfiFjph0CDrgmpTWxvJaSAgABq664ljgzWGeavNHiTOgpITPqiVwHINWPz5?=
 =?us-ascii?Q?wA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ea8603d-9880-4ae4-3fa0-08dae7112011
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2022 07:16:36.6852
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zfh8aLTuumZeNUOgLYqTVsIL2KQEUa9DKJREqSDdNNmaYRbfkfVlJX8qN+YT5Io+L+u8PZkp4z4QABq50H6lnOjkISIf3ShFrYEfcAnIxxM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8064
X-Proofpoint-GUID: rv0ImCcPpRMQcelEyCGNC5QNCAsKgiov
X-Proofpoint-ORIG-GUID: rv0ImCcPpRMQcelEyCGNC5QNCAsKgiov
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-26_04,2022-12-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 spamscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1011
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212260063
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Dec 2022 07:16:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175011

From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>

Backport patch from upstream to solve CVE-2022-2601 CVE-2022-3775 dependency:
font: Fix size overflow in grub_font_get_glyph_internal()
(https://git.savannah.gnu.org/cgit/grub.git/commit/?id=9c76ec09ae08155df27cd237eaea150b4f02f532)

Backport patch from upstream to fix following CVEs:
CVE-2022-2601: font: Fix several integer overflows in grub_font_construct_glyph()
(https://git.savannah.gnu.org/cgit/grub.git/commit/?id=768e1ef2fc159f6e14e7246e4be09363708ac39e)
CVE-2022-3775: font: Fix an integer underflow in blit_comb()
(https://git.savannah.gnu.org/cgit/grub.git/commit/?id=992c06191babc1e109caf40d6a07ec6fdef427af)

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Liwei Song <liwei.song@windriver.com>
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
index 000000000000..efa00a3c6caf
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
index 000000000000..727c509694ce
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
index 000000000000..853efd0486b6
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
index e819cb97754b..bf7aba6b1cd7 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -37,6 +37,9 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://loader-efi-chainloader-Simplify-the-loader-state.patch \
            file://commands-boot-Add-API-to-pass-context-to-loader.patch \
            file://CVE-2022-28736-loader-efi-chainloader-Use-grub_loader_set_ex.patch\
+           file://0001-font-Fix-size-overflow-in-grub_font_get_glyph_intern.patch \
+           file://CVE-2022-2601.patch \
+           file://CVE-2022-3775.patch \
 "
 
 SRC_URI[sha256sum] = "23b64b4c741569f9426ed2e3d0e6780796fca081bee4c99f62aa3f53ae803f5f"
-- 
2.36.1


