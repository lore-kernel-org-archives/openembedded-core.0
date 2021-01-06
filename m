Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.48])
 by mx.groups.io with SMTP id smtpd.web11.6340.1609930198488311236
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 06 Jan 2021 02:49:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=BKES2xTx;
 spf=pass (domain: kpit.com, ip: 40.107.139.48, mailfrom: rahul.taya@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GMkVg2zY2QHIlbd5AcSFJv1LdpBmNbfdp5koh8cRAtmZH3V39zd8ovSanJdsXGXND4sC34QghEU6PN0OijDQbmaEJd7L0DDIwUyvSN2isDdfwGXGUu0/TmGF/GZCRMlRGaUFCmi5CJiU262y08yfXSTH8J7KurWjtvHcmX41iDhTOover45xcpvmjfd+H5XOIVdzePn+uBjKalibgK3cE3gBkLMm/y0GEJAB1+3Qd+WouqwiBww8oK4q8cdPHbTsicDBwW7dFb30wfeI8qE3JYmfkY/n0MReMNLqU5UzIroIRaih7Q+e0RIacxLZ09kN5Q9ymEqWRR/kZfKskBCvOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BFeU2Eaqug/mvpq+fLvr9L4s7W2EVuEPIGAklLOp+K8=;
 b=iwrIBpXHI3UDQt9mLIIdWwCzq1D/QqLJ1LAm3p+VnlTBY6zIG/0fIJeOYTosmHm6ji9jo9EAsR7H3Nw7Amm79TikmW1Ia5l27DmgiUSTZN4BwzGaY7znoKtg/TGtDhPMhot01g3G/L6ylM37YpCP1meTnGehff+gTVv7MOYDT8IJilKJ0nj1nLSAnRFlixhp+pGT9+QRqiBWJ5qX6vDEAa+WK9rPqTCarb4cZGOI5l6HY+QMdlGae7DolxdXF/LqtstZpJjbbpFR89/ghbVNRDH7KWmz5FS40Dg+lBN9+c2tbGMn/aWufQYQMBimvJXVB2hbxqvefzqeqOqV+bzQeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BFeU2Eaqug/mvpq+fLvr9L4s7W2EVuEPIGAklLOp+K8=;
 b=BKES2xTxej8fZO1Zw3Axis4PbNNj10MkRJ92fNUr8jultaznTuB1BqW1L75Gabh/sv1Zr1zODuy9aEvTtXHLhOVKBCmQMEgVv8iZ11ywBmz8F02TKa0+3K5/yOx6CsAdOxUd8CJ96Zpk9eUlZptBL2SJEWYyS2qAG8PmF0CF6iE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:58::18)
 by BM1PR01MB2562.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:52::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Wed, 6 Jan
 2021 10:49:55 +0000
Received: from BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::416e:68e1:481b:f7a0]) by BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::416e:68e1:481b:f7a0%7]) with mapi id 15.20.3721.024; Wed, 6 Jan 2021
 10:49:55 +0000
From: "Rahul Taya" <Rahul.Taya@kpit.com>
To: Openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	Aditya.Tayade@kpit.com,
	Rahul Taya <Rahul.Taya@kpit.com>
Subject: [poky][sumo][PATCH] libjpeg-turbo: add security fix for CVE-2018-14498
Date: Wed,  6 Jan 2021 16:19:43 +0530
Message-Id: <20210106104943.27489-1-Rahul.Taya@kpit.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [122.169.2.142]
X-ClientProxiedBy: BM1PR0101CA0002.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:18::12) To BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:58::18)
Return-Path: Rahul.Taya@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (122.169.2.142) by BM1PR0101CA0002.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:18::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Wed, 6 Jan 2021 10:49:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d2b52cce-43a8-461b-2eb2-08d8b230cddf
X-MS-TrafficTypeDiagnostic: BM1PR01MB2562:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BM1PR01MB256262A5505DD1F4F2A82769F2D00@BM1PR01MB2562.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:466;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	zzf/S4ME8DyN9ijHpg2dgDja9hsE4qR/+zjZ8MDzzoE6XSNHA5cRozf/DMZ4siLXaajiq/YE3XXR/JYPkHJyviIJ3c0CNiKWPR86BRvI0tOpJ5KSCYTGxbNZ1c3FTKTnPMw4Ji5r+r4RPlknSQ68rVIulZ3j04vsi/y+GJgnIL1l8FQgJwnIlAxuBNsBUHNwHJ/sPfCeQXih1JmqGDDC5QGQzk4aPkEGh7NSlP3VvdPCSY50g4cqYYE/SofEDBzc3323C8KAWjYfhvdAZyRnau1ht8nb8bcYeFmXhOP4+WK7oyMOLUqe9flf8kIrrUQHHHxdE7/x5GLjfKZjf5CO57hOoelcTWd47hV1X8Ga3Q5TfBx8zlQ7LFUarLK9b0O0s5J2XAEr5O8U6WKV2bP6kmnHC2q/th5rm8p0v8ulT6Y5j0/Wzws3qu8sn7r3U99WWnnbWuJsCHKQpZMsIc6V7y83e060ZokahrQGMGnprYZ/Ku+anNurSiQPkACmt17kYNc2kP5J5EpXVXDzYNxeTA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(39850400004)(346002)(396003)(376002)(316002)(8676002)(83380400001)(52116002)(2616005)(6506007)(107886003)(66574015)(8936002)(2906002)(1076003)(26005)(5660300002)(36756003)(956004)(66476007)(66556008)(16526019)(186003)(478600001)(4326008)(6486002)(6512007)(15650500001)(66946007)(6666004)(69590400011)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?6EG9YmJgtmp0dnanef/SJgbl52P7EbCupDQeV/hbdGEDsRjAQJKV0oTStaPs?=
 =?us-ascii?Q?mB16LCH1/rr9H2tgFQwY0AdpkP9X/vyR4uh5NaZMlIIQyysdXX1dTyNgUWyT?=
 =?us-ascii?Q?qHxPNWNPJK6nf7i5xcR/pN7QnqOqQm8TXgHHea5mbO+kp3CQPC5w4TdpiQvs?=
 =?us-ascii?Q?IpZ0qOCI+5x5SbBy8qrS08trubTmoCyUj1S4T37PnwiLRplqYoyQKGs09BbU?=
 =?us-ascii?Q?KbpVqq1BCOrXbsokgxtWlwUE/+Md09p9RpVQpUa7tumD1hNUQIo96+Cw3yWM?=
 =?us-ascii?Q?TuTT4Ts2kJ2nrqCMiE7Z5XpIdAfCkphqFNQMN0c2/bHpvY20fRJf9DSEN5M/?=
 =?us-ascii?Q?PnOlyFA+WVyL9UuNbT093wiPE7rdhhbxV5PinEFLlp4k42tdwOJKxJj+/3Ej?=
 =?us-ascii?Q?pET5fJlLfGxOhvS7o80J+ON2iIh+fcoaGvmFpfCZZfWo5CeLn0cIEnyRHZoe?=
 =?us-ascii?Q?NasBseQNINWuyhqYHBNKDb8poIPSeMFbsBEcK7b0c2vklnmmue+63QtD6zCd?=
 =?us-ascii?Q?3iOH3oQ0WcvochwwV3/1iPYdizqmxXh8atgNLVh4u7yctjEvLP3HZPlRXGRV?=
 =?us-ascii?Q?1aMNJ36Gr7FpzQP0qdWKAq6tAvj8HYnUwG+sHhJ3COTogIqHcBYIndjT+cff?=
 =?us-ascii?Q?pLpblImi2QWKaRr42lewRttRFQDfmT1ouFZlENrU7WEj28ViCMrqltRTCN13?=
 =?us-ascii?Q?oIkTmQsBHwZs880A6im5A+oUeDEmto8ArmPI2KJHAUZ5oZqCKHWw36X6GW6t?=
 =?us-ascii?Q?1MkhSGDQxV+T0TRhMhuRdCyNzlHOPOV6o7zq1ZpTB7bilbTgQ00y0IrElOhQ?=
 =?us-ascii?Q?ZMtXURYocmDYKu4GL9HsowS/uBP8Z6OV8RsWaDcJKxA4mTgy7IQAGYIQRh7r?=
 =?us-ascii?Q?3CaqjvlAO5+OVmGGMva9kQZks6zcbE8hxtsnV5cTrExtunkPrAZsAjxAza8E?=
 =?us-ascii?Q?19rxCqwbwf8Mm9EDdbRk2cMs4gACX6PfDcgCeJxrQJZ7zomsltVrmRj7f4NM?=
 =?us-ascii?Q?zlXb?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB3431.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2021 10:49:55.3556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-Network-Message-Id: d2b52cce-43a8-461b-2eb2-08d8b230cddf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6rC0Duz+ROUpU4LhXaFqWJ61Kh79bFDCZ3rd36TRcy0w3jixgKDR4D3Gt8GhFA/Nvx68JjHnt1iOrlf72/ik6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR01MB2562
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

From: Rahul Taya <Rahul.Taya@kpit.com>

This patch fixes OOB read caused by malformed 8-bit BMP

Signed-off-by: Rahul.Taya <Rahul.Taya@kpit.com>
---
 .../jpeg/files/CVE-2018-14498.patch           | 145 ++++++++++++++++++
 .../jpeg/libjpeg-turbo_1.5.3.bb               |   4 +-
 2 files changed, 148 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/jpeg/files/CVE-2018-14498.patch

diff --git a/meta/recipes-graphics/jpeg/files/CVE-2018-14498.patch b/meta/r=
ecipes-graphics/jpeg/files/CVE-2018-14498.patch
new file mode 100644
index 0000000000..8e77be6960
--- /dev/null
+++ b/meta/recipes-graphics/jpeg/files/CVE-2018-14498.patch
@@ -0,0 +1,145 @@
+From 9c78a04df4e44ef6487eee99c4258397f4fdca55 Mon Sep 17 00:00:00 2001
+From: DRC <information@libjpeg-turbo.org>
+Date: Fri, 20 Jul 2018 17:21:36 -0500
+Subject: [PATCH] cjpeg: Fix OOB read caused by malformed 8-bit BMP
+
+... in which one or more of the color indices is out of range for the
+number of palette entries.
+
+Fix partly borrowed from jpeg-9c.  This commit also adopts Guido's
+JERR_PPM_OUTOFRANGE enum value in lieu of our project-specific
+JERR_PPM_TOOLARGE enum value.
+
+Fixes #258
+CVE: CVE-2018-14498
+Upstream-Status: Backport [https://github.com/libjpeg-turbo/libjpeg-turbo/=
commit/9c78a04df4e44ef6487eee99c4258397f4fdca55]
+
+diff --git a/cderror.h b/cderror.h
+index 63de498..e57a8c8 100644
+--- a/cderror.h
++++ b/cderror.h
+@@ -2,7 +2,7 @@
+  * cderror.h
+  *
+  * Copyright (C) 1994-1997, Thomas G. Lane.
+- * Modified 2009 by Guido Vollbeding.
++ * Modified 2009-2017 by Guido Vollbeding.
+  * This file is part of the Independent JPEG Group's software.
+  * For conditions of distribution and use, see the accompanying README.ij=
g
+  * file.
+@@ -49,6 +49,7 @@ JMESSAGE(JERR_BMP_COLORSPACE, "BMP output must be graysc=
ale or RGB")
+ JMESSAGE(JERR_BMP_COMPRESSED, "Sorry, compressed BMPs not yet supported")
+ JMESSAGE(JERR_BMP_EMPTY, "Empty BMP image")
+ JMESSAGE(JERR_BMP_NOT, "Not a BMP file - does not start with BM")
++JMESSAGE(JERR_BMP_OUTOFRANGE, "Numeric value out of range in BMP file")
+ JMESSAGE(JTRC_BMP, "%ux%u 24-bit BMP image")
+ JMESSAGE(JTRC_BMP_MAPPED, "%ux%u 8-bit colormapped BMP image")
+ JMESSAGE(JTRC_BMP_OS2, "%ux%u 24-bit OS2 BMP image")
+@@ -75,8 +76,8 @@ JMESSAGE(JWRN_GIF_NOMOREDATA, "Ran out of GIF bits")
+ #ifdef PPM_SUPPORTED
+ JMESSAGE(JERR_PPM_COLORSPACE, "PPM output must be grayscale or RGB")
+ JMESSAGE(JERR_PPM_NONNUMERIC, "Nonnumeric data in PPM file")
+-JMESSAGE(JERR_PPM_TOOLARGE, "Integer value too large in PPM file")
+ JMESSAGE(JERR_PPM_NOT, "Not a PPM/PGM file")
++JMESSAGE(JERR_PPM_OUTOFRANGE, "Numeric value out of range in PPM file")
+ JMESSAGE(JTRC_PGM, "%ux%u PGM image")
+ JMESSAGE(JTRC_PGM_TEXT, "%ux%u text PGM image")
+ JMESSAGE(JTRC_PPM, "%ux%u PPM image")
+diff --git a/rdbmp.c b/rdbmp.c
+index eaa7086..5e6dbc3 100644
+--- a/rdbmp.c
++++ b/rdbmp.c
+@@ -3,7 +3,7 @@
+  *
+  * This file was part of the Independent JPEG Group's software:
+  * Copyright (C) 1994-1996, Thomas G. Lane.
+- * Modified 2009-2010 by Guido Vollbeding.
++ * Modified 2009-2017 by Guido Vollbeding.
+  * libjpeg-turbo Modifications:
+  * Modified 2011 by Siarhei Siamashka.
+  * Copyright (C) 2015, D. R. Commander.
+@@ -66,6 +66,7 @@ typedef struct _bmp_source_struct {
+   JDIMENSION row_width;         /* Physical width of scanlines in file */
+
+   int bits_per_pixel;           /* remembers 8- or 24-bit format */
++  int cmap_length;              /* colormap length */
+ } bmp_source_struct;
+
+
+@@ -126,6 +127,7 @@ get_8bit_row (j_compress_ptr cinfo, cjpeg_source_ptr s=
info)
+ {
+   bmp_source_ptr source =3D (bmp_source_ptr) sinfo;
+   register JSAMPARRAY colormap =3D source->colormap;
++  int cmaplen =3D source->cmap_length;
+   JSAMPARRAY image_ptr;
+   register int t;
+   register JSAMPROW inptr, outptr;
+@@ -142,6 +144,8 @@ get_8bit_row (j_compress_ptr cinfo, cjpeg_source_ptr s=
info)
+   outptr =3D source->pub.buffer[0];
+   for (col =3D cinfo->image_width; col > 0; col--) {
+     t =3D GETJSAMPLE(*inptr++);
++      if (t >=3D cmaplen)
++        ERREXIT(cinfo, JERR_BMP_OUTOFRANGE);
+     *outptr++ =3D colormap[0][t]; /* can omit GETJSAMPLE() safely */
+     *outptr++ =3D colormap[1][t];
+     *outptr++ =3D colormap[2][t];
+@@ -401,6 +405,7 @@ start_input_bmp (j_compress_ptr cinfo, cjpeg_source_pt=
r sinfo)
+     source->colormap =3D (*cinfo->mem->alloc_sarray)
+       ((j_common_ptr) cinfo, JPOOL_IMAGE,
+        (JDIMENSION) biClrUsed, (JDIMENSION) 3);
++    source->cmap_length =3D (int)biClrUsed;
+     /* and read it from the file */
+     read_colormap(source, (int) biClrUsed, mapentrysize);
+     /* account for size of colormap */
+diff --git a/rdppm.c b/rdppm.c
+index 33ff749..c0c0962 100644
+--- a/rdppm.c
++++ b/rdppm.c
+@@ -69,7 +69,7 @@ typedef struct {
+   JSAMPROW pixrow;              /* compressor input buffer */
+   size_t buffer_width;          /* width of I/O buffer */
+   JSAMPLE *rescale;             /* =3D> maxval-remapping array, or NULL *=
/
+-  int maxval;
++  unsigned int maxval;
+ } ppm_source_struct;
+
+ typedef ppm_source_struct *ppm_source_ptr;
+@@ -119,7 +119,7 @@ read_pbm_integer (j_compress_ptr cinfo, FILE *infile, =
unsigned int maxval)
+   }
+
+   if (val > maxval)
+-    ERREXIT(cinfo, JERR_PPM_TOOLARGE);
++    ERREXIT(cinfo, JERR_PPM_OUTOFRANGE);
+
+   return val;
+ }
+@@ -255,7 +255,7 @@ get_word_gray_row (j_compress_ptr cinfo, cjpeg_source_=
ptr sinfo)
+     temp  =3D UCH(*bufferptr++) << 8;
+     temp |=3D UCH(*bufferptr++);
+     if (temp > maxval)
+-      ERREXIT(cinfo, JERR_PPM_TOOLARGE);
++      ERREXIT(cinfo, JERR_PPM_OUTOFRANGE);
+     *ptr++ =3D rescale[temp];
+   }
+   return 1;
+@@ -282,17 +282,17 @@ get_word_rgb_row (j_compress_ptr cinfo, cjpeg_source=
_ptr sinfo)
+     temp  =3D UCH(*bufferptr++) << 8;
+     temp |=3D UCH(*bufferptr++);
+     if (temp > maxval)
+-      ERREXIT(cinfo, JERR_PPM_TOOLARGE);
++      ERREXIT(cinfo, JERR_PPM_OUTOFRANGE);
+     *ptr++ =3D rescale[temp];
+     temp  =3D UCH(*bufferptr++) << 8;
+     temp |=3D UCH(*bufferptr++);
+     if (temp > maxval)
+-      ERREXIT(cinfo, JERR_PPM_TOOLARGE);
++      ERREXIT(cinfo, JERR_PPM_OUTOFRANGE);
+     *ptr++ =3D rescale[temp];
+     temp  =3D UCH(*bufferptr++) << 8;
+     temp |=3D UCH(*bufferptr++);
+     if (temp > maxval)
+-      ERREXIT(cinfo, JERR_PPM_TOOLARGE);
++      ERREXIT(cinfo, JERR_PPM_OUTOFRANGE);
+     *ptr++ =3D rescale[temp];
+   }
+   return 1;
diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.3.bb b/meta/recip=
es-graphics/jpeg/libjpeg-turbo_1.5.3.bb
index 50a5ae0850..53dbcb68f7 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.3.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_1.5.3.bb
@@ -10,7 +10,9 @@ LIC_FILES_CHKSUM =3D "file://cdjpeg.h;endline=3D13;md5=3D=
8184bcc7c4ac7b9edc6a7bc00f231
 DEPENDS_append_x86-64_class-target =3D " nasm-native"
 DEPENDS_append_x86_class-target    =3D " nasm-native"

-SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
+SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
+           file://CVE-2018-14498.patch \
+"

 SRC_URI[md5sum] =3D "7c82f0f6a3130ec06b8a4d0b321cbca3"
 SRC_URI[sha256sum] =3D "b24890e2bb46e12e72a79f7e965f409f4e16466d00e1dd15d9=
3d73ee6b592523"
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
