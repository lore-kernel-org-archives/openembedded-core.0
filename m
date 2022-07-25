Return-Path: <Bhabu.Bindu@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E845C43334
	for <webhook@archiver.kernel.org>; Mon, 25 Jul 2022 08:39:26 +0000 (UTC)
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (IND01-BMX-obe.outbound.protection.outlook.com [40.107.239.50])
 by mx.groups.io with SMTP id smtpd.web08.25901.1658738357636970947
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jul 2022 01:39:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=GM0i4zPt;
 spf=pass (domain: kpit.com, ip: 40.107.239.50,
 mailfrom: bhabu.bindu@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MdUM3OORJ9lSqMotSoOfM2sHd8BIoJDKBT/wTLxiwiVpYGaIjA+Oit+4tEoOGQ8RCkdhbLWkGHIEz843+hWpw/+sGizrtMCyNyNw300IJ3g7IKUdaFFcfSYckTim0ie4vt+25HCxR9JLsQFFlrH2vgDsuh4AOn0zaVOvkMrCsGi2/4nZF8moyuz8t7i9mvN8s6Kg2Hu8XM7E0F3CP08NLZJOFgrQiqvbeJCYVK4iYZi0T1rOMo7pX9hujHkyB3l86IYLPG5Vl+RjPrEpbWVw1WVmGjcaWozSmJztISsXbHsBxhuTM0lDjlGQgX+hrqlwRxrFeQHJtZiS2EZGFyne0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3NhRelq3Ffc3qkMYQgexEGZkdDLx+NmS9FuGdWKNKU8=;
 b=C0M4oHBIbW239FQTzWIs/RyC1MDb6Ty3PzktpnVcKhJlbDobSiaqiIh6PBKRhhVHNqYE4zvavhJTZstc5MsFV67C7J4H9LD5l2RwySWYIUlq6fu+lpmKYwmFgNuWgCGsVELv4Tl0cOPxuiwYoHNilz1W3aVDz+akbZQRLxv6QEKpcBSw3CxTuyRyIDkxaui1bLIf8Jks5c9A7koYxDchigxu2VAUk14RTeGwLwHIiqOTbJBVJtORcxCP7MWKPtFbySTReqWrRxqJgKScU/fsVYRjUkCg7FhpQnLC8fYRJ4rplxYPrioHX6/wdHaIDiH+m444YZgOzn/kYVE4yg6D2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3NhRelq3Ffc3qkMYQgexEGZkdDLx+NmS9FuGdWKNKU8=;
 b=GM0i4zPty+1gUrRE+3FT41MJk2FnvezmVnCz1nd2b67i7bN7CoEfzs7p0XBdaKWutsMOgElOH0UB29/15Cof72bNfC6++oU/dpozExuROZhsSifmvSm2DFwiwrYsV5Ux+Gr9hKWOO44sKpN1zq2m5/1qT4OzjFcGZ7NJuOHg0nw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from PN3PR01MB6885.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:93::14)
 by MA1PR01MB2571.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:42::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Mon, 25 Jul
 2022 08:39:11 +0000
Received: from PN3PR01MB6885.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8ae:4813:c151:f75]) by PN3PR01MB6885.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8ae:4813:c151:f75%5]) with mapi id 15.20.5458.024; Mon, 25 Jul 2022
 08:39:11 +0000
From: Bhabu <bhabu.bindu@kpit.com>
To: openembedded-core@lists.openembedded.org
Cc: ranjitsinh.rathod@kpit.com,
	"Sana.Kazi" <Sana.Kazi@kpit.com>,
	Bhabu Bindu <bhabu.bindu@kpit.com>
Subject: [poky][dunfell][PATCH] libjpeg-turbo: Fix CVE-2021-46822
Date: Mon, 25 Jul 2022 14:08:25 +0530
Message-Id: <20220725083825.21689-1-bhabu.bindu@kpit.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: MA1PR0101CA0061.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:20::23) To PN3PR01MB6885.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:93::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: deef3f95-95ba-4c15-571c-08da6e192507
X-MS-TrafficTypeDiagnostic: MA1PR01MB2571:EE_
Content-Transfer-Encoding: quoted-printable
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WglIH4pGnC/EPkFZx6D7pn8mwMEtLvuwqfvvkdV75sR9Rav8w2wzPnlDp/BkmGzFx7crcAAsJDQs+kgD9gzvSMQbEGHuqH9oUHBwP4qia8WpP31bhsR6szlDbVrTE6brphEYLshwNhEuk4Cn0KgZY5eHiw94iQRKcVEupSX6gDrYjhTtACEAO47s9KkOPosBqJrEeeIQkgZZoqKtiCjMA4DuK/Pp214nTntISPBJZ+GoyhQo1goJAoLTU2K4fYo8rVh5tLYXyyISvfO/RYQVKlMblkoq0VeBDZDZdpuN9c188H40vbdeJ0wVnKqEWlB1BN+Q3EWYCLNkHQaBVFZEi08odawsz7f1A2RpapunU0X/1diKyAPLII9+kLni9sXoBBICDU5HzBwpcT6mO2BYyeqSubZPw9nFQJIxgDC9DfLRem33pNvpM3VdSlcqUx1ms0JZ8/ezu5C/00/Tx52LjgAsNF+d8cwvH9nCysBggn/62Y4FH//CLvzZCjjWMwNY3grMkac4RkSQm4g0ohuZUReeffpZRCT70oqEv6YBlzvAhiQgePuN9JqFpZ96rmHmm85D+eSGdXkZ6NU52fkpIygbjjmmy8+UUxAUFvBxIH2AfN4+3E80nFzwWF78tdPDuvvfwt3fBZgEAieFAORDvGq9n6Xm84eiJEtNaE5Wfi+aqFCVoMs/lBldv0q3IZ3xyUfen1aB2/eA72aTGiVAgPXyEnvmyHeQBFddvsdaNWLkhJdfHi2TTwFy+PJkYD9aL7/bwl8T1qOjzX1Ma5gHzQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PR01MB6885.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(396003)(376002)(136003)(346002)(39860400002)(54906003)(6916009)(966005)(478600001)(6486002)(41300700001)(6666004)(316002)(2906002)(8676002)(66946007)(66476007)(66556008)(4326008)(5660300002)(8936002)(83380400001)(36756003)(186003)(38100700002)(1076003)(107886003)(6506007)(52116002)(2616005)(66574015)(6512007)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?U1uDoW4PR2mCughsENYHKHCGWel3ZaTdPCKuzvAq+BudL1T8yPx1OdlQsPSJ?=
 =?us-ascii?Q?Hp1pSdQ7ha5u+PyO+ER6Ab3fVWeYEzDd4i72OcNrQmdpoiDDjeKLCCzSqsmB?=
 =?us-ascii?Q?1YDV9NjY6Wdixj0oxqLKFzqUb0lRgGWgeXWTJLPuDy5nbgu2Vhi4fWohWICO?=
 =?us-ascii?Q?12Hfuk/OujNgom1oxEnsi1mrbO4gh8qyro+UB7z//gFB3btkwOz2y3wEeeAg?=
 =?us-ascii?Q?QzLbNMQO4nh59UkJ+qhLspLEkS8IckT0JkDw67rJo2B+SfoWKhgGAv3WbY8I?=
 =?us-ascii?Q?QSh7yZ8tjzYjW2DeYV5etfEB9LKMbv9Zmj8+/5rhaehKYrL6Nz5/PNt/Z4a8?=
 =?us-ascii?Q?SStgHvNW6MqhLCmio1v7bC3QnA7ayOOPcPABfMyZnQvH2B7ri7UcdjMfn+cK?=
 =?us-ascii?Q?3k6PFmm/lde/Lt4Obow+hFypVi0OTUV5dm53IcbT+L5XmRuW1/i+p+1bQbZQ?=
 =?us-ascii?Q?SCq2FpH0tsJ8zzIsOztO/zj0iijSwGmRYQ2yo3HozqhRmGS8ueNuYjjCJI+2?=
 =?us-ascii?Q?DNbdvylQQdiBhO0+6yPM+nyb5sOiHB7ZDvYt13X7fRYA14QvREYPp0GrVbZ2?=
 =?us-ascii?Q?28fuLamzf2QqorzSf323Tk9/VCkJttq3J2Z/2T/HWjfC2D4Y5xm9m9B7mvNN?=
 =?us-ascii?Q?mFlLS0PbUJYA+QRik7vr5s+Dx5GLoQEtBrrJYTDctSkk2IG0TBJ5iAdcoKlS?=
 =?us-ascii?Q?eLQOAj9a9/DuoqfYP3kEjlkyMHPn6iWAJk0Oc1bsx1d9aB3UMJZ4xUeocrIm?=
 =?us-ascii?Q?J68RqZxxJODE+qz081O2Boc4A/wdyGkPGI6WOr6N+HOt9LxQmUdz+QBia8sI?=
 =?us-ascii?Q?qzm8t90SccMB6LF9qImkL/D06JKPqPJ7b7EN1kE/wF/v00mbd/V07H1aL/v0?=
 =?us-ascii?Q?ONPbS5QzeOAXf+VuKDEtZbr6LE0vB4G5FzGP7ELsIPtVUbOAS0Id4ge/rppR?=
 =?us-ascii?Q?JLerDAvtqkshvsa3nIAa+mEnw+4IayLRy0BQ9s6A5SJf81Z0iCp98Q0T7dYs?=
 =?us-ascii?Q?yQyagCZJmcmclaCHBXEPEDx8+hCnqOsbOv1+wW7tqyt9Tdgxrj8fFikBav4C?=
 =?us-ascii?Q?Vt8ll9KFd82k9f108vXgfS/mFQfndmFsPQRnPq9O850fiMp54YNoWXv5kuKR?=
 =?us-ascii?Q?H+ssmoqmlqfb+raxzYr4R6NVoi4Q9DZtxgxZ4T+mY8d/UGnIxjij5yw8e+uj?=
 =?us-ascii?Q?AazhHqGemq6GgNmwJbV8GSP2WMNM7yX9y6cR9wjCdMkjp/CosgQETfw0msKZ?=
 =?us-ascii?Q?/9j/IicRyoGEa/Uym6mznfMe8fZsJMNik2ZeVuje2GyxsZJitBzulY5DU+T3?=
 =?us-ascii?Q?TxgUcSd/rXJnqxux0gfMIXm5xEGgHiN8CT4FQGx8ry13DkOphKcS7N1JKfdY?=
 =?us-ascii?Q?L0MhrnnTKj68yucfuY/4RuKQ/JPR9CHPiC9ApkjCyZ5jxjxm2s7S6mPMlJ52?=
 =?us-ascii?Q?U1M4JDoTRIeUcNDEQDI7omO2283nfz/1C4rZYcF1eynjblk7NdWyE9XZTxqQ?=
 =?us-ascii?Q?eTyXlLE/9DGY0galUbjzn91RSIaIg7TBjK8VQG5pb0oaookNcnw0FDwjShHJ?=
 =?us-ascii?Q?k4EgNGX1S04VVHyBbWr/GQIAbI1T2AYZLmVfyRB/CnTBOblwi1r4r9yFeUmo?=
 =?us-ascii?Q?yExU19lw7kiOeIU1IoSHNsIAQiHkw5jrru9nSWJBvVA0?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 deef3f95-95ba-4c15-571c-08da6e192507
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB6885.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2022 08:39:10.7539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Hs390xHBLRR0lGWTGv83UIilvx8B+xUI/gAeDRboo0mo3ZW6D4zHvpOHHzqEux6I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA1PR01MB2571
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Jul 2022 08:39:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168472

From: "Sana.Kazi" <Sana.Kazi@kpit.com>

Add patch to fix CVE-2021-46822
Link: https://github.com/libjpeg-turbo/libjpeg-turbo/commit/f35fd27ec641c42=
d6b115bfa595e483ec58188d2.patch

Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
---
 .../jpeg/files/CVE-2021-46822.patch           | 133 ++++++++++++++++++
 .../jpeg/libjpeg-turbo_2.0.4.bb               |   1 +
 2 files changed, 134 insertions(+)
 create mode 100644 meta/recipes-graphics/jpeg/files/CVE-2021-46822.patch

diff --git a/meta/recipes-graphics/jpeg/files/CVE-2021-46822.patch b/meta/r=
ecipes-graphics/jpeg/files/CVE-2021-46822.patch
new file mode 100644
index 0000000000..9c0cf98dc7
--- /dev/null
+++ b/meta/recipes-graphics/jpeg/files/CVE-2021-46822.patch
@@ -0,0 +1,133 @@
+From f35fd27ec641c42d6b115bfa595e483ec58188d2 Mon Sep 17 00:00:00 2001
+From: DRC <information@libjpeg-turbo.org>
+Date: Tue, 6 Apr 2021 12:51:03 -0500
+Subject: [PATCH] tjLoadImage: Fix issues w/loading 16-bit PPMs/PGMs
+
+- The PPM reader now throws an error rather than segfaulting (due to a
+  buffer overrun) if an application attempts to load a 16-bit PPM file
+  into a grayscale uncompressed image buffer.  No known applications
+  allowed that (not even the test applications in libjpeg-turbo),
+  because that mode of operation was never expected to work and did not
+  work under any circumstances.  (In fact, it was necessary to modify
+  TJBench in order to reproduce the issue outside of a fuzzing
+  environment.)  This was purely a matter of making the library bow out
+  gracefully rather than crash if an application tries to do something
+  really stupid.
+
+- The PPM reader now throws an error rather than generating incorrect
+  pixels if an application attempts to load a 16-bit PGM file into an
+  RGB uncompressed image buffer.
+
+- The PPM reader now correctly loads 16-bit PPM files into extended
+  RGB uncompressed image buffers.  (Previously it generated incorrect
+  pixels unless the input colorspace was JCS_RGB or JCS_EXT_RGB.)
+
+The only way that users could have potentially encountered these issues
+was through the tjLoadImage() function.  cjpeg and TJBench were
+unaffected.
+
+CVE: CVE-2021-46822
+Upstream-Status: Backport [https://github.com/libjpeg-turbo/libjpeg-turbo/=
commit/f35fd27ec641c42d6b115bfa595e483ec58188d2.patch]
+Comment: Refreshed hunks from ChangeLog.md
+         Refreshed hunks from rdppm.c
+
+Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
+
+---
+ ChangeLog.md | 10 ++++++++++
+ rdppm.c      | 26 ++++++++++++++++++++------
+ 2 files changed, 30 insertions(+), 6 deletions(-)
+
+diff --git a/ChangeLog.md b/ChangeLog.md
+index 968969c6b..12e730a0e 100644
+--- a/ChangeLog.md
++++ b/ChangeLog.md
+@@ -44,6 +44,15 @@
+ that maximum value was less than 255.  libjpeg-turbo 1.5.0 already includ=
ed a
+ similar fix for binary PPM/PGM files with maximum values greater than 255=
.
+
++7. The PPM reader now throws an error, rather than segfaulting (due to a =
buffer
++overrun) or generating incorrect pixels, if an application attempts to us=
e the
++`tjLoadImage()` function to load a 16-bit binary PPM file (a binary PPM f=
ile
++with a maximum value greater than 255) into a grayscale image buffer or t=
o load
++a 16-bit binary PGM file into an RGB image buffer.
++
++8. Fixed an issue in the PPM reader that caused incorrect pixels to be
++generated when using the `tjLoadImage()` function to load a 16-bit binary=
 PPM
++file into an extended RGB image buffer.
+
+ 2.0.3
+ =3D=3D=3D=3D=3D
+diff --git a/rdppm.c b/rdppm.c
+index c4c937e8a..6ac8fdbf7 100644
+--- a/rdppm.c
++++ b/rdppm.c
+@@ -5,7 +5,7 @@
+  * Copyright (C) 1991-1997, Thomas G. Lane.
+  * Modified 2009 by Bill Allombert, Guido Vollbeding.
+  * libjpeg-turbo Modifications:
+- * Copyright (C) 2015-2017, 2020, D. R. Commander.
++ * Copyright (C) 2015-2017, 2020-2021, D. R. Commander.
+  * For conditions of distribution and use, see the accompanying README.ij=
g
+  * file.
+  *
+@@ -516,6 +516,11 @@ get_word_rgb_row(j_compress_ptr cinfo, cjpeg_source_p=
tr sinfo)
+   register JSAMPLE *rescale =3D source->rescale;
+   JDIMENSION col;
+   unsigned int maxval =3D source->maxval;
++  register int rindex =3D rgb_red[cinfo->in_color_space];
++  register int gindex =3D rgb_green[cinfo->in_color_space];
++  register int bindex =3D rgb_blue[cinfo->in_color_space];
++  register int aindex =3D alpha_index[cinfo->in_color_space];
++  register int ps =3D rgb_pixelsize[cinfo->in_color_space];
+
+   if (!ReadOK(source->pub.input_file, source->iobuffer, source->buffer_wi=
dth))
+     ERREXIT(cinfo, JERR_INPUT_EOF);
+@@ -527,17 +532,20 @@ get_word_rgb_row(j_compress_ptr cinfo, cjpeg_source_=
ptr sinfo)
+     temp |=3D UCH(*bufferptr++);
+     if (temp > maxval)
+       ERREXIT(cinfo, JERR_PPM_OUTOFRANGE);
+-    *ptr++ =3D rescale[temp];
++    ptr[rindex] =3D rescale[temp];
+     temp  =3D UCH(*bufferptr++) << 8;
+     temp |=3D UCH(*bufferptr++);
+     if (temp > maxval)
+       ERREXIT(cinfo, JERR_PPM_OUTOFRANGE);
+-    *ptr++ =3D rescale[temp];
++    ptr[gindex] =3D rescale[temp];
+     temp  =3D UCH(*bufferptr++) << 8;
+     temp |=3D UCH(*bufferptr++);
+     if (temp > maxval)
+       ERREXIT(cinfo, JERR_PPM_OUTOFRANGE);
+-    *ptr++ =3D rescale[temp];
++    ptr[bindex] =3D rescale[temp];
++    if (aindex >=3D 0)
++      ptr[aindex] =3D 0xFF;
++    ptr +=3D ps;
+   }
+   return 1;
+ }
+@@ -624,7 +632,10 @@ start_input_ppm(j_compress_ptr cinfo, cjpeg_source_pt=
r sinfo)
+       cinfo->in_color_space =3D JCS_GRAYSCALE;
+     TRACEMS2(cinfo, 1, JTRC_PGM, w, h);
+     if (maxval > 255) {
+-      source->pub.get_pixel_rows =3D get_word_gray_row;
++      if (cinfo->in_color_space =3D=3D JCS_GRAYSCALE)
++        source->pub.get_pixel_rows =3D get_word_gray_row;
++      else
++        ERREXIT(cinfo, JERR_BAD_IN_COLORSPACE);
+     } else if (maxval =3D=3D MAXJSAMPLE && sizeof(JSAMPLE) =3D=3D sizeof(=
U_CHAR) &&
+                cinfo->in_color_space =3D=3D JCS_GRAYSCALE) {
+       source->pub.get_pixel_rows =3D get_raw_row;
+@@ -657,7 +657,10 @@
+       cinfo->in_color_space =3D JCS_EXT_RGB;
+     TRACEMS2(cinfo, 1, JTRC_PPM, w, h);
+     if (maxval > 255) {
+-      source->pub.get_pixel_rows =3D get_word_rgb_row;
++      if (IsExtRGB(cinfo->in_color_space))
++              source->pub.get_pixel_rows =3D get_word_rgb_row;
++              else
++              ERREXIT(cinfo, JERR_BAD_IN_COLORSPACE);
+     } else if (maxval =3D=3D MAXJSAMPLE && sizeof(JSAMPLE) =3D=3D sizeof(=
U_CHAR) &&
+                (cinfo->in_color_space =3D=3D JCS_EXT_RGB
+ #if RGB_RED =3D=3D 0 && RGB_GREEN =3D=3D 1 && RGB_BLUE =3D=3D 2 && RGB_PI=
XELSIZE =3D=3D 3
diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.4.bb b/meta/recip=
es-graphics/jpeg/libjpeg-turbo_2.0.4.bb
index 3005a8a789..6575582b0c 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.4.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.4.bb
@@ -13,6 +13,7 @@ DEPENDS_append_x86_class-target    =3D " nasm-native"
 SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
            file://0001-libjpeg-turbo-fix-package_qa-error.patch \
            file://CVE-2020-13790.patch \
+           file://CVE-2021-46822.patch \
            "

 SRC_URI[md5sum] =3D "d01d9e0c28c27bc0de9f4e2e8ff49855"
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

