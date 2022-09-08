Return-Path: <virendra.thakur@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04744C38145
	for <webhook@archiver.kernel.org>; Thu,  8 Sep 2022 05:04:39 +0000 (UTC)
Received: from IND01-MAX-obe.outbound.protection.outlook.com
 (IND01-MAX-obe.outbound.protection.outlook.com [40.107.222.79])
 by mx.groups.io with SMTP id smtpd.web08.1821.1662613476597086017
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 22:04:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=dhTR8dz0;
 spf=pass (domain: kpit.com, ip: 40.107.222.79,
 mailfrom: virendra.thakur@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MpMRsAUKEDbkR+9OrBeQVGrNrCx+28/0MFhP78YKIGJjBIVkxTGFZ+BLoaxGYn55GqaaALa0HE9WikOPEhbvGjQI7ZfpUeQceDhlYluc3U+6Razar1ddZ/gTk1o3inu38B17++Vq7tkCGM8IWW5Rqs5PtgpErM1xmnVWdPFhwt08IxR3i4sroG8blFxd01AzPpLdrcM6wE5SZpkqR1fq+DCotmF/0sHdBMmBI3pmKfZrjX85K3slirJOqA+UWC0xtYhQptNyZ18A6speZGGBbglfAoEPa4Ry0XJWb2zWKToZj9zdhTXaMAe2ZNUpNVKeGv6VnPbNx1lv2Ai+RxjSmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F56Oe4ZQk3MIxiXGySkonLfgoN4qmcqfDeD+cQ2MGOE=;
 b=lGur+uN94Kv/HBi2vzSyw4bsNYD3+2RIVJFP8Y3PVTfsHJ7sg/UPuWly69aeneWOtsmm6C1sD6LJRgfilWMaoHeZaaNpTK66ib6vkqryrMgdJturCo6sAvdzplefkQDA/Er8ix8AGruyVJtsR8GswfhUf/UpAPdkbVABJznWT4BMC+DYJewcghmYl/y7XzcTEL42A/XRvdJim1DDHidSrXWyZH1EqRbf3r1mZS0ZZMAQGqVssx9fF6zQ4x9He5QlDD0eeKW13CRDpOD1u6t5bvyF+N9dGTJdmkSFyKV1bFsStYKcqeHMqzD4wFrrBqV8K9Vltap9HPJ1zuwDDFmO8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F56Oe4ZQk3MIxiXGySkonLfgoN4qmcqfDeD+cQ2MGOE=;
 b=dhTR8dz0mDOScqmwJn4fZjtcWd/13uhHXosx4fpNP3GE/HlLpRh/MeyDpMSl7O3LvYmYpJSC2MHqYyQ3fz+B2EeUfj/N14UteWTSPhFLwt2pfDDiE3HcgSqDT2T1skZ9yHWcAejsWPdZAM+yCmYieM7QuZfq23AITBGRQtzfAHY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:3::12)
 by PN3PR01MB5434.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:6f::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12; Thu, 8 Sep
 2022 05:04:31 +0000
Received: from MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2427:1977:88:b63b]) by MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2427:1977:88:b63b%3]) with mapi id 15.20.5612.014; Thu, 8 Sep 2022
 05:04:31 +0000
From: Virendra Thakur <virendra.thakur@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: Virendra Thakur <virendrak@kpit.com>
Subject: [OE-Core][dunfell][PATCH] tiff: Fix for CVE-2022-2867/8/9
Date: Thu,  8 Sep 2022 10:34:09 +0530
Message-Id: <20220908050409.17606-1-virendra.thakur@kpit.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: BMXP287CA0009.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::15) To MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:3::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAXPR01MB4327:EE_|PN3PR01MB5434:EE_
X-MS-Office365-Filtering-Correlation-Id: c488292c-b24b-4d33-e614-08da91579d2e
Content-Transfer-Encoding: quoted-printable
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ao9xB5shkt4sbTSbYVWdpFF5mTjqVBl3RbdJUWQNNBpNCrsWqE6VuMjw9ML57CXl1CzXL6yn3VdHkw5LZzQPX+aRj4V8aTx6Tj80X5/FCMynJ80+Qju0jNE8SsMDDOz8QcMSNj78FrgUwnC4nzU7tXCtGdBWln2tN4F4IS9hEkJi06fJU5JERPBp1MlrY7tJiaYE7CfX03URVC9qEvOhtz27N3l6xuKxSncoRnXDLoxBiwW0W5F5esT6xhKTPY6jNB2AFUsCW6zA5w9Hr01cSKnCI4P6x/KKfrWmRplCTAWGABlOL1BvXFPhH9KnA4QaHb89ITD6uB2iHK+eBgnpCIaSdUGPBCKgCio+aNMhNiKxUw/OKOo2i9sqrrW5k2+zKHQY7mHlcQ6BP8tr3PkKnp7QijifVgUF+yrjf4V5Uy8FskczCA/bdBSceLHCdlDSzSYyDgF7WxhosH2wuBIjQkKIfhBZTW8e6LKb5rlqbGwjOxVEJmAE6pQFa+rUwGMfvVtRVRtSR6i7yISJb72efD/E5VSotn2MOyhxufPYCgY8PlZ6lkOf6wAytfkaDlvfuA/pUlYd9Ns22yvpyCs8DqknSyCHLhtIjtUabqT2iOYR3MmsdX3lZ/nYqTYcP8+k6aKpuvWKOK+PuUYeWsGcFMXMQHblMG3ITsOt/dX3GVeDDzyPNczbJQIMuaPGd4BGs10XrXy5zbJkTGzb7Ey+T4YdsBvjLLHgHwjGI94c0lUyUe5j9oYWGGm7fRUU21oDrQEpnhCTi0gw5UV/2pPMS6qVd8UjPiGgD1qHlfYtXFQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(376002)(396003)(366004)(136003)(26005)(6512007)(52116002)(478600001)(6506007)(41300700001)(6666004)(107886003)(86362001)(6486002)(38350700002)(38100700002)(186003)(1076003)(2616005)(83380400001)(66574015)(8936002)(44832011)(36756003)(66946007)(5660300002)(316002)(66476007)(66556008)(8676002)(4326008)(2906002)(6916009)(84970400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0f1onunwpmUro6CnvGzKTclHbdWUCVMKtPeHCbILIUfP7lOcL2BwWaW4Q+5R?=
 =?us-ascii?Q?1GD6u0N+cWYfq1GmyYudvyRmHYkU6056pR3CRGtTy2knbWfQ9eHXPaZgvVAy?=
 =?us-ascii?Q?qNBUq+Dsz9YAPvaaN3IoHo9M9Ke+VGn1s4UYGjWtQtDSmcflZ6ZOSLG2GXov?=
 =?us-ascii?Q?DmX9thF0NBMvDzouppb5qBBjgw8geSC48qxTEnJUUJLSL3UXWpRi2JlOQG49?=
 =?us-ascii?Q?NXJoelQeAWIDhluIR02nS44tDNE5A2LSMrmOjFOmpvXCEXJEh2eFNEJDdh4A?=
 =?us-ascii?Q?rEdcdyLA1ob+kfUy3mhWZyW8mytWWOH9/+UaPLChNFBPrVQYQbNIJGhlUk04?=
 =?us-ascii?Q?FVZuPSG36gViNjnD2HLJvZqobXTPJFT/Yq2xER/NmsNkxdNu7lPXVqpAEOFI?=
 =?us-ascii?Q?Vy9GMo7ukLAp0sRev5dIrZHadLIQ7Z7UWbKGK5JzKzgLAzF2DMYEMpytputI?=
 =?us-ascii?Q?knSb9su8OES8QQ+m8h75HW9Xnhx+zMwYLXqo5EskFKToMgS2mHe9gB3mi27x?=
 =?us-ascii?Q?YEKhixHBD/d2lYhKW3wQ/0V4dEX6XVYoOh9aOpGba1Az5ENjCMFPhfZWiBQ1?=
 =?us-ascii?Q?O2VynzrLOVw9cXe4ObtIDZjG4ZlBAUnRreHkGoyO4pENiWtR9vL8jC5I1gC7?=
 =?us-ascii?Q?yfsJHiuER51rvNzcLHlncNtz6Zr0d+f7zr7eK+58UQj023uOpYzAVWfTRgRf?=
 =?us-ascii?Q?o8709UIptbqgQwG9zp6VbGrfkoW4vAv5s2y+3XELgdCVhGiFLg+Kq8yWKMcf?=
 =?us-ascii?Q?oNSjxm4FV5Om740qpzdokaqSoolnPs0nXS6aI9onWP7KyNBT50w2OgzKkA3u?=
 =?us-ascii?Q?jADunnBFglqfW3n53rBjJl5Atu1aCxiDVtg/kVS0MNERIJHveWlUANvRJu9F?=
 =?us-ascii?Q?Stya3y2OcyMaGD/9E+zUmS00QKSnYU055auzawsV4cXqUGYBK86pfkArSXSl?=
 =?us-ascii?Q?01J6h6FwBIpNW49BtOjWJiRjw3uQUobd2Lsbfe+0Xu4dmZ1LykrNOHA+n35R?=
 =?us-ascii?Q?yr71r9c9nSeYxPgrsuPTCNgUCTplHN1N8Q9urEeMGl8VPnSwPqJCOG7/f5fB?=
 =?us-ascii?Q?fvgxMbfYBvxIWFv9nljHu5HL/7KMJ+UBjx86aB74HUy1nihrCV+YrttxxS0v?=
 =?us-ascii?Q?P2ITbKJ8/RjHa8e4ePwnnOqkGBn0F1/yh64D6yZmC0FaqPx5mtndPYT59BOT?=
 =?us-ascii?Q?fp84yewe8N4BXtrh+7vqNpeqkJ81epofqOyeaeAr7Cqs9lcwoPFAa+sSaq1N?=
 =?us-ascii?Q?uNX2zLa0fjlyKM1aMGzKJ0YXVSCj92JQtEjIK88jtK4i65lVWzVbYSMu4SGu?=
 =?us-ascii?Q?qq93va66xbVCb+l2WF3BDenYXTyJpcTx6dPpyd6BGPcsNxLFmKa33IcgxT4m?=
 =?us-ascii?Q?l8lmoc2fjEmOEQxXsOZOoTcA8v/cVtA93FEBODtq3s4Kyp9lqtxRdGtwtg7j?=
 =?us-ascii?Q?iSgQ9NoTqWrPHMchsMHECJA6ljuUYo73uSfAg5LT69Ls7b7K5bjXXtf8oQ7d?=
 =?us-ascii?Q?JtdMb6X+p79vxkZ+tZJprU9Jto3EkpcR3W9F7AixjZ2VZLKWW2UcY2n9E0sX?=
 =?us-ascii?Q?ZXBeZ+UkLxWfetQFjmbQkcJ94YLSySzP8Y9NyhoA?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c488292c-b24b-4d33-e614-08da91579d2e
X-MS-Exchange-CrossTenant-AuthSource: MAXPR01MB4327.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 05:04:31.3812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 DV5fyArzlPOLlid6dt5BH6S7sUsMM5uvWswxrZIlK5EtZVyds8S3FxNsKLdgS9uschD/AO4Ug+Y+EJx3rNmN0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB5434
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Sep 2022 05:04:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170448

From: Virendra Thakur <virendrak@kpit.com>

Add Patch to fix CVE-2022-2867, CVE-2022-2868
CVE-2022-2869

Signed-off-by: Virendra Thakur <virendrak@kpit.com>
---
 ...022-2867-CVE-2022-2868-CVE-2022-2869.patch | 159 ++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.1.0.bb |   1 +
 2 files changed, 160 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2022-2867-CVE=
-2022-2868-CVE-2022-2869.patch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2022-2867-CVE-2022-2=
868-CVE-2022-2869.patch b/meta/recipes-multimedia/libtiff/files/CVE-2022-28=
67-CVE-2022-2868-CVE-2022-2869.patch
new file mode 100644
index 0000000000..131ff94119
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2022-2867-CVE-2022-2868-CVE=
-2022-2869.patch
@@ -0,0 +1,159 @@
+From 07d79fcac2ead271b60e32aeb80f7b4f3be9ac8c Mon Sep 17 00:00:00 2001
+From: Su Laus <sulau@freenet.de>
+Date: Wed, 9 Feb 2022 21:31:29 +0000
+Subject: [PATCH] tiffcrop.c: Fix issue #352 heap-buffer-overflow by correc=
ting
+ uint32_t underflow.
+
+CVE: CVE-2022-2867 CVE-2022-2868 CVE-2022-2869
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/07d=
79fcac2ead271b60e32aeb80f7b4f3be9ac8c]
+Signed-off-by: Virendra Thakur <virendrak@kpit.com>
+---
+Index: tiff-4.1.0/tools/tiffcrop.c
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- tiff-4.1.0.orig/tools/tiffcrop.c
++++ tiff-4.1.0/tools/tiffcrop.c
+@@ -5153,29 +5153,45 @@ computeInputPixelOffsets(struct crop_mas
+       y1 =3D _TIFFClampDoubleToUInt32(crop->corners[i].Y1);
+       y2 =3D _TIFFClampDoubleToUInt32(crop->corners[i].Y2);
+       }
+-      if (x1 < 1)
+-        crop->regionlist[i].x1 =3D 0;
+-      else
+-        crop->regionlist[i].x1 =3D (uint32) (x1 - 1);
++      /* a) Region needs to be within image sizes 0.. width-1; 0..length-=
1
++       * b) Corners are expected to be submitted as top-left to bottom-ri=
ght.
++       *    Therefore, check that and reorder input.
++       * (be aware x,y are already casted to (uint32_t) and avoid (0 - 1)=
 )
++       */
++      uint32_t aux;
++      if (x1 > x2) {
++        aux =3D x1;
++        x1 =3D x2;
++        x2 =3D aux;
++      }
++      if (y1 > y2) {
++        aux =3D y1;
++        y1 =3D y2;
++        y2 =3D aux;
++      }
++      if (x1 > image->width - 1)
++        crop->regionlist[i].x1 =3D image->width - 1;
++      else if (x1 > 0)
++        crop->regionlist[i].x1 =3D (uint32_t)(x1 - 1);
+
+       if (x2 > image->width - 1)
+         crop->regionlist[i].x2 =3D image->width - 1;
+-      else
+-        crop->regionlist[i].x2 =3D (uint32) (x2 - 1);
+-      zwidth  =3D crop->regionlist[i].x2 - crop->regionlist[i].x1 + 1;
+-
+-      if (y1 < 1)
+-        crop->regionlist[i].y1 =3D 0;
+-      else
+-        crop->regionlist[i].y1 =3D (uint32) (y1 - 1);
++      else if (x2 > 0)
++        crop->regionlist[i].x2 =3D (uint32_t)(x2 - 1);
++
++      zwidth =3D crop->regionlist[i].x2 - crop->regionlist[i].x1 + 1;
++
++      if (y1 > image->length - 1)
++        crop->regionlist[i].y1 =3D image->length - 1;
++      else if (y1 > 0)
++        crop->regionlist[i].y1 =3D (uint32_t)(y1 - 1);
+
+       if (y2 > image->length - 1)
+         crop->regionlist[i].y2 =3D image->length - 1;
+-      else
+-        crop->regionlist[i].y2 =3D (uint32) (y2 - 1);
+-
+-      zlength =3D crop->regionlist[i].y2 - crop->regionlist[i].y1 + 1;
++      else if (y2 > 0)
++        crop->regionlist[i].y2 =3D (uint32_t)(y2 - 1);
+
++      zlength =3D crop->regionlist[i].y2 - crop->regionlist[i].y1 + 1;
+       if (zwidth > max_width)
+         max_width =3D zwidth;
+       if (zlength > max_length)
+@@ -5205,7 +5221,7 @@ computeInputPixelOffsets(struct crop_mas
+       }
+       }
+     return (0);
+-    }
++    }  /* crop_mode =3D=3D CROP_REGIONS */
+
+   /* Convert crop margins into offsets into image
+    * Margins are expressed as pixel rows and columns, not bytes
+@@ -5241,7 +5257,7 @@ computeInputPixelOffsets(struct crop_mas
+       bmargin =3D (uint32) 0;
+       return (-1);
+       }
+-    }
++    }  /* crop_mode =3D=3D CROP_MARGINS */
+   else
+     { /* no margins requested */
+     tmargin =3D (uint32) 0;
+@@ -5332,24 +5348,23 @@ computeInputPixelOffsets(struct crop_mas
+   off->endx   =3D endx;
+   off->endy   =3D endy;
+
+-  crop_width  =3D endx - startx + 1;
+-  crop_length =3D endy - starty + 1;
+-
+-  if (crop_width <=3D 0)
++  if (endx + 1 <=3D startx)
+     {
+     TIFFError("computeInputPixelOffsets",
+                "Invalid left/right margins and /or image crop width reque=
sted");
+     return (-1);
+     }
++  crop_width  =3D endx - startx + 1;
+   if (crop_width > image->width)
+     crop_width =3D image->width;
+
+-  if (crop_length <=3D 0)
++  if (endy + 1 <=3D starty)
+     {
+     TIFFError("computeInputPixelOffsets",
+               "Invalid top/bottom margins and /or image crop length reque=
sted");
+     return (-1);
+     }
++  crop_length =3D endy - starty + 1;
+   if (crop_length > image->length)
+     crop_length =3D image->length;
+
+@@ -5449,10 +5464,17 @@ getCropOffsets(struct image_data *image,
+   else
+     crop->selections =3D crop->zones;
+
+-  for (i =3D 0; i < crop->zones; i++)
++  /* Initialize regions iterator i */
++  i =3D 0;
++  for (int j =3D 0; j < crop->zones; j++)
+     {
+-    seg =3D crop->zonelist[i].position;
+-    total =3D crop->zonelist[i].total;
++    seg =3D crop->zonelist[j].position;
++    total =3D crop->zonelist[j].total;
++
++    /* check for not allowed zone cases like 0:0; 4:3; etc. and skip that=
 input */
++    if (seg =3D=3D 0 || total =3D=3D 0 || seg > total) {
++        continue;
++    }
+
+     switch (crop->edge_ref)
+       {
+@@ -5581,8 +5603,11 @@ getCropOffsets(struct image_data *image,
+                     i + 1, (uint32)zwidth, (uint32)zlength,
+                   crop->regionlist[i].x1, crop->regionlist[i].x2,
+                     crop->regionlist[i].y1, crop->regionlist[i].y2);
++  /* increment regions iterator */
++  i++;
+     }
+-
++    /* set number of generated regions out of given zones */
++    crop->selections =3D i;
+   return (0);
+   } /* end getCropOffsets */
+
+--
+GitLab
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb b/meta/recipes-m=
ultimedia/libtiff/tiff_4.1.0.bb
index c061d2aaac..93a35230d6 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
@@ -26,6 +26,7 @@ SRC_URI =3D "http://download.osgeo.org/libtiff/tiff-${PV}=
.tar.gz \
            file://CVE-2022-0924.patch \
            file://CVE-2022-2056-CVE-2022-2057-CVE-2022-2058.patch \
            file://CVE-2022-34526.patch \
+           file://CVE-2022-2867-CVE-2022-2868-CVE-2022-2869.patch \
           "
 SRC_URI[md5sum] =3D "2165e7aba557463acc0664e71a3ed424"
 SRC_URI[sha256sum] =3D "5d29f32517dadb6dbcd1255ea5bbc93a2b54b94fbf83653b4d=
65c7d6775b8634"
--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

