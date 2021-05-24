Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.57])
 by mx.groups.io with SMTP id smtpd.web11.20151.1621841856853122511
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 May 2021 00:37:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=ZQxPF5XQ;
 spf=pass (domain: kpit.com, ip: 40.107.139.57, mailfrom: akash.hadke@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KnZ6XgTcTB1sV4Gq5a4cylVeBhxKKV7s5mwhHRY1dqp5RuE3P7AosZ/cA4VDv4F3i7xI3ueh4QeKfDgfkxJAYlyA/0d5lNL0mgcir+JN8JjmPcby/0CY6a+rXzCj4CAiECKbO3GQOsjmKvAPabJnCuJHgKHS9PPUK+5pnTIakHBNFd9g/ytx0pbVVOdqyGyl1Dy/KeDWanux3b9cgeA2Os9Hjyc5SzwgdybaH7qHtkRmBsVjD5ojdZXry+IvfRLxhGtGFGfSnnggPW6L+qWgb2SJLZLYG5/9/us0rNSUh9QnthiKEpq9fWQ9T9nSIpYBYmHsqz5DSH9JgYaW6MokCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=unLPrGZVszbPChiQNQidMowBLE2GVagBGLIv+HSKkg0=;
 b=hqdGPXA0fyuKNQnQZjJ8uIOurQQBqcN5mN3NI4vT4AmTmjtkuBw4gO6OSxOJFHkDVtR6KzPaSm2O8sPsBclBbN4Rs61cgHoGh8gKQM8Uf9ponR25JeuNcie/wlOPNMmk3rk7O+vYqajJnbavA8eIthMdLfXYUIitnYO7geq6aHLpesyC/QfuVzzVC4X9tU8Ga5OfTRA0WTBDoc6qewhczxtf0kBpiApW6gX+enRAzku+Rh30vosg1CIwiv2T4LXCKdCg78XZ1WaUttZACV88wmW7OWqvs0DXLy9kNpjQfbPQzzpkXSl/SL4919PMrHLAaIb4i2ABrrAG02UP9Hdt1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=unLPrGZVszbPChiQNQidMowBLE2GVagBGLIv+HSKkg0=;
 b=ZQxPF5XQHcHlx5xD9lKR4yOwjj7Jm53psRVxc4zIGRyf79lnQBiMYZt9KxcTmW9VmzOtk750pQjHUlVF01GOjC9A2stYeXUCiDVTCtxTwEghC4GV8Ynbg3i4R6hNn8rIbTvkdTJsUJbHCQ/IIWfCu624wqAwTcGatwsn3qXWbm0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=kpit.com;
Received: from PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:a::14)
 by PN2PR01MB4588.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27; Mon, 24 May
 2021 07:37:23 +0000
Received: from PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c962:e30e:1f2:44e7]) by PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::c962:e30e:1f2:44e7%7]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 07:37:22 +0000
From: "akash hadke" <akash.hadke@kpit.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: nisha.parrakat@kpit.com,
	harpritkaur.bhandari@kpit.com
Subject: [poky][dunfell][PATCH] tiff: Add fix for CVE-2020-35521 and CVE-2020-35522
Date: Mon, 24 May 2021 13:06:57 +0530
Message-Id: <1621841817-21203-1-git-send-email-akash.hadke@kpit.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [103.110.167.10]
X-ClientProxiedBy: PN2PR01CA0062.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::7) To PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:a::14)
Return-Path: akash.hadke@kpit.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from L-12026.iballbatonwifi.com (103.110.167.10) by PN2PR01CA0062.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:23::7) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4150.26 via Frontend Transport; Mon, 24 May 2021 07:37:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f460d7b-0683-4945-0b1c-08d91e86c49b
X-MS-TrafficTypeDiagnostic: PN2PR01MB4588:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<PN2PR01MB4588BBC00DFA519C956AC6128E269@PN2PR01MB4588.INDPRD01.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:190;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+x0xosZGpnVoR7HUPRyxi+D9xAhj3CxB97A1K5BRuPRLQ9HS/C3EmICJUAgXe1Jtk8PSrJRF6XZlio04nv7imfOEkXHRd2YRUIygVzKM5ug8Qx/xbB70izAc7yGEo+sz/uGb4yaOjgciKedEVYfqkYksG9I6srjcYuVDXdZoJ85/OSpUHg5ya+CMXOFbng/AwjubhgXiLFitDQazcVbbgU8ct/A2K6K0XdSimGHDPrSV4C0Ard01198ozVzXKPdVW0Tq4wyehBHmaiq52h2TchdKMafaX77L9ZRn0WOH2UDQcw2Gqfg+8AzAg5jh7L60doQnqI5hMs1E8Xpwq+/HUqmwuEXXAzPx/B5cJEh+NdSJM1FCzx4ZyGfs6FTyTYc5zY2BvS61HCpA/7Coop7cdgYYBN/7PQClxWqddi9CtPrQxL0XyCs/MQQnmkI0KDOIXaVYXYkLLBSbczIBJdGvfUEbARKkDyIW+rVPjfbzGVW42JS2DxyjxSiXZ9fR829IuW8zNoCOsN2HQN+8iWntM7z5ly+f9O6oJTMjmYUlOieEoRd4Zh4I53/v90ubgwMETrFudBjrI8aJjwUGyPXEfUCXTNPagStooz1nuwmFNDSmGo4KoTSGg4OCYzExV8j3w7+RGh6g9dvLgveTMIwweUiwM/SG/y+Iuk+ovrpNPxQDD7+xf1C6/5TpaolCDiFxK6tFTIyY0L08SxNtDW4MSFpvOt0aoBDWi8gI4NLcNwI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(39850400004)(396003)(136003)(6506007)(8676002)(83380400001)(6666004)(107886003)(2616005)(6512007)(4326008)(478600001)(8936002)(30864003)(316002)(26005)(186003)(16526019)(52116002)(66946007)(956004)(36756003)(86362001)(19627235002)(966005)(6486002)(66476007)(38100700002)(66556008)(2906002)(5660300002)(38350700002)(15866825006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	5RxN5CQL5KY9NE1ZvALhe+08rOUTlkw5sSO5dsIjPjn6CfBNHQxAWEP+6uIdZsvsfXZE6u1A38lk7MwO3dBVTYdZ1agimZmrLv4uXoyAJHVfaxk7ZoI6S+3Neq+rVR6ncspaZDwImP/bky4ZlscbDMnqAQ5ab1vBLyyjr8Nq95SeFFmswj/EZynZwa06IGwSgL6vqjvKTUsoPv9E9NGTtDd/cN5aflSBZk3p92UXV1ckVtMBLuxNFAN/XtYSs78SqnyGH/bViYG+ZQo7t4GYqAFn6SEhjHIpYozDw6/FBnTb4858tYZjkqyQRggd3UAeggTyYpEmU5/Yw0cd4T88BkzDyyDDC/O5HJAMAdEzR3FFqTkNz4jZgvgeUvWAS8qh3hPOwJdtDt3xwRN08Oc8pPPHJccl2+Hm8rFV9MprlfFqMC7Xymz6bTCiSFOmVZSoqB6QxcVLwUoYshRytWvg05doQTZw+iw6aUZbH2p9zFVagiHkFngDUljOTc0BHMTA5cfqom7zr4el0aBgHyOPjQV+6nkImK99l0gYVdiC4KiASPOWpO0J9CEcXN8le0207JevylQS99H9sVeYZtNzPOnV5Ygvl+hMJrKSEmDJ2Emw++c+cQQKYgZnwMZIDjQnigBmE+ieImXug3IhfKkjcevhpRHpIjUH5Yox4e0aUs5sRWNNqk5WnnoARRPFgUy9Cjli9mXDPGLjfF+nKmyJA4ZT5T3Wch506YOUsJtygCU=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f460d7b-0683-4945-0b1c-08d91e86c49b
X-MS-Exchange-CrossTenant-AuthSource: PN2PR01MB4619.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 07:37:22.6709
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t61MDD6vvL0+X3DQ6E/p+zV6cCzoMhj8XZQ/z0Iz2dfQaaVun/1w02yIeU+M0eFOKl5qelGvz+hkCVISFpTgng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB4588
Content-Type: text/plain

Added fix for CVE-2020-35521 and CVE-2020-35522
Link: https://gitlab.com/libtiff/libtiff/-/commit/b5a935d96b21cda0f434230cdf8ca958cd8b4eef.patch

Added below support patches for CVE-2020-35521 and CVE-2020-35522

1. 001_support_patch_for_CVE-2020-35521_and_CVE-2020-35522.patch
Link: https://gitlab.com/libtiff/libtiff/-/commit/02875964eba5c4a2ea98c41562835428214adfe7.patch

2. 002_support_patch_for_CVE-2020-35521_and_CVE-2020-35522.patch
Link: https://gitlab.com/libtiff/libtiff/-/commit/ca70b5e702b9f503333344b2d46691de9feae84e.patch

Signed-off-by: akash hadke <akash.hadke@kpit.com>
---
 ...tch_for_CVE-2020-35521_and_CVE-2020-35522.patch | 148 +++++++++++++++++++++
 ...tch_for_CVE-2020-35521_and_CVE-2020-35522.patch |  27 ++++
 .../files/CVE-2020-35521_and_CVE-2020-35522.patch  | 119 +++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.1.0.bb      |   3 +
 4 files changed, 297 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/001_support_patch_for_CVE-2020-35521_and_CVE-2020-35522.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/002_support_patch_for_CVE-2020-35521_and_CVE-2020-35522.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2020-35521_and_CVE-2020-35522.patch

diff --git a/meta/recipes-multimedia/libtiff/files/001_support_patch_for_CVE-2020-35521_and_CVE-2020-35522.patch b/meta/recipes-multimedia/libtiff/files/001_support_patch_for_CVE-2020-35521_and_CVE-2020-35522.patch
new file mode 100644
index 0000000..9b4724a
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/001_support_patch_for_CVE-2020-35521_and_CVE-2020-35522.patch
@@ -0,0 +1,148 @@
+From 02875964eba5c4a2ea98c41562835428214adfe7 Mon Sep 17 00:00:00 2001
+From: Thomas Bernard <miniupnp@free.fr>
+Date: Sat, 7 Mar 2020 13:21:56 +0100
+Subject: [PATCH] tiff2rgba: output usage to stdout when using -h
+
+also uses std C EXIT_FAILURE / EXIT_SUCCESS
+see #17
+
+Signed-off-by: akash hadke <akash.hadke@kpit.com>
+---
+ tools/tiff2rgba.c | 39 ++++++++++++++++++++++++---------------
+ 1 file changed, 24 insertions(+), 15 deletions(-)
+---
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/02875964eba5c4a2ea98c41562835428214adfe7.patch]
+---
+diff --git a/tools/tiff2rgba.c b/tools/tiff2rgba.c
+index 2eb6f6c4..ef643653 100644
+--- a/tools/tiff2rgba.c
++++ b/tools/tiff2rgba.c
+@@ -39,6 +39,13 @@
+ #include "tiffiop.h"
+ #include "tiffio.h"
+ 
++#ifndef EXIT_SUCCESS
++#define EXIT_SUCCESS 0
++#endif
++#ifndef EXIT_FAILURE
++#define EXIT_FAILURE 1
++#endif
++
+ #define	streq(a,b)	(strcmp(a,b) == 0)
+ #define	CopyField(tag, v) \
+     if (TIFFGetField(in, tag, &v)) TIFFSetField(out, tag, v)
+@@ -68,7 +75,7 @@ main(int argc, char* argv[])
+ 	extern char *optarg;
+ #endif
+ 
+-	while ((c = getopt(argc, argv, "c:r:t:bn8")) != -1)
++	while ((c = getopt(argc, argv, "c:r:t:bn8h")) != -1)
+ 		switch (c) {
+ 			case 'b':
+ 				process_by_block = 1;
+@@ -86,7 +93,7 @@ main(int argc, char* argv[])
+ 				else if (streq(optarg, "zip"))
+ 					compression = COMPRESSION_DEFLATE;
+ 				else
+-					usage(-1);
++					usage(EXIT_FAILURE);
+ 				break;
+ 
+ 			case 'r':
+@@ -105,17 +112,20 @@ main(int argc, char* argv[])
+ 				bigtiff_output = 1;
+ 				break;
+ 
++			case 'h':
++				usage(EXIT_SUCCESS);
++				/*NOTREACHED*/
+ 			case '?':
+-				usage(0);
++				usage(EXIT_FAILURE);
+ 				/*NOTREACHED*/
+ 		}
+ 
+ 	if (argc - optind < 2)
+-		usage(-1);
++		usage(EXIT_FAILURE);
+ 
+ 	out = TIFFOpen(argv[argc-1], bigtiff_output?"w8":"w");
+ 	if (out == NULL)
+-		return (-2);
++		return (EXIT_FAILURE);
+ 
+ 	for (; optind < argc-1; optind++) {
+ 		in = TIFFOpen(argv[optind], "r");
+@@ -132,7 +142,7 @@ main(int argc, char* argv[])
+ 		}
+ 	}
+ 	(void) TIFFClose(out);
+-	return (0);
++	return (EXIT_SUCCESS);
+ }
+ 
+ static int
+@@ -166,7 +176,7 @@ cvt_by_tile( TIFF *in, TIFF *out )
+     if (tile_width != (rastersize / tile_height) / sizeof( uint32))
+     {
+ 	TIFFError(TIFFFileName(in), "Integer overflow when calculating raster buffer");
+-	exit(-1);
++	exit(EXIT_FAILURE);
+     }
+     raster = (uint32*)_TIFFmalloc(rastersize);
+     if (raster == 0) {
+@@ -182,7 +192,7 @@ cvt_by_tile( TIFF *in, TIFF *out )
+     if (tile_width != wrk_linesize / sizeof (uint32))
+     {
+         TIFFError(TIFFFileName(in), "Integer overflow when calculating wrk_line buffer");
+-	exit(-1);
++	exit(EXIT_FAILURE);
+     }
+     wrk_line = (uint32*)_TIFFmalloc(wrk_linesize);
+     if (!wrk_line) {
+@@ -279,7 +289,7 @@ cvt_by_strip( TIFF *in, TIFF *out )
+     if (width != (rastersize / rowsperstrip) / sizeof( uint32))
+     {
+ 	TIFFError(TIFFFileName(in), "Integer overflow when calculating raster buffer");
+-	exit(-1);
++	exit(EXIT_FAILURE);
+     }
+     raster = (uint32*)_TIFFmalloc(rastersize);
+     if (raster == 0) {
+@@ -295,7 +305,7 @@ cvt_by_strip( TIFF *in, TIFF *out )
+     if (width != wrk_linesize / sizeof (uint32))
+     {
+         TIFFError(TIFFFileName(in), "Integer overflow when calculating wrk_line buffer");
+-	exit(-1);
++	exit(EXIT_FAILURE);
+     }
+     wrk_line = (uint32*)_TIFFmalloc(wrk_linesize);
+     if (!wrk_line) {
+@@ -528,7 +538,7 @@ tiffcvt(TIFF* in, TIFF* out)
+             return( cvt_whole_image( in, out ) );
+ }
+ 
+-static char* stuff[] = {
++const static char* stuff[] = {
+     "usage: tiff2rgba [-c comp] [-r rows] [-b] [-n] [-8] input... output",
+     "where comp is one of the following compression algorithms:",
+     " jpeg\t\tJPEG encoding",
+@@ -547,13 +557,12 @@ static char* stuff[] = {
+ static void
+ usage(int code)
+ {
+-	char buf[BUFSIZ];
+ 	int i;
++	FILE * out = (code == EXIT_SUCCESS) ? stdout : stderr;
+ 
+-	setbuf(stderr, buf);
+-        fprintf(stderr, "%s\n\n", TIFFGetVersion());
++        fprintf(out, "%s\n\n", TIFFGetVersion());
+ 	for (i = 0; stuff[i] != NULL; i++)
+-		fprintf(stderr, "%s\n", stuff[i]);
++		fprintf(out, "%s\n", stuff[i]);
+ 	exit(code);
+ }
+ 
+-- 
+GitLab
diff --git a/meta/recipes-multimedia/libtiff/files/002_support_patch_for_CVE-2020-35521_and_CVE-2020-35522.patch b/meta/recipes-multimedia/libtiff/files/002_support_patch_for_CVE-2020-35521_and_CVE-2020-35522.patch
new file mode 100644
index 0000000..b6e1842
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/002_support_patch_for_CVE-2020-35521_and_CVE-2020-35522.patch
@@ -0,0 +1,27 @@
+From ca70b5e702b9f503333344b2d46691de9feae84e Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Sat, 3 Oct 2020 18:16:27 +0200
+Subject: [PATCH] tiff2rgba.c: fix -Wold-style-declaration warning
+
+Signed-off-by: akash hadke <akash.hadke@kpit.com>
+---
+ tools/tiff2rgba.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+---
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/ca70b5e702b9f503333344b2d46691de9feae84e.patch]
+---
+diff --git a/tools/tiff2rgba.c b/tools/tiff2rgba.c
+index ef643653..fbc383aa 100644
+--- a/tools/tiff2rgba.c
++++ b/tools/tiff2rgba.c
+@@ -538,7 +538,7 @@ tiffcvt(TIFF* in, TIFF* out)
+             return( cvt_whole_image( in, out ) );
+ }
+ 
+-const static char* stuff[] = {
++static const char* stuff[] = {
+     "usage: tiff2rgba [-c comp] [-r rows] [-b] [-n] [-8] input... output",
+     "where comp is one of the following compression algorithms:",
+     " jpeg\t\tJPEG encoding",
+-- 
+GitLab
diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2020-35521_and_CVE-2020-35522.patch b/meta/recipes-multimedia/libtiff/files/CVE-2020-35521_and_CVE-2020-35522.patch
new file mode 100644
index 0000000..129721f
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2020-35521_and_CVE-2020-35522.patch
@@ -0,0 +1,119 @@
+From 98a254f5b92cea22f5436555ff7fceb12afee84d Mon Sep 17 00:00:00 2001
+From: Thomas Bernard <miniupnp@free.fr>
+Date: Sun, 15 Nov 2020 17:02:51 +0100
+Subject: [PATCH 1/2] enforce (configurable) memory limit in tiff2rgba
+
+fixes #207
+fixes #209
+
+Signed-off-by: akash hadke <akash.hadke@kpit.com>
+---
+ tools/tiff2rgba.c | 25 +++++++++++++++++++++++--
+ 1 file changed, 23 insertions(+), 2 deletions(-)
+---
+CVE: CVE-2020-35521
+CVE: CVE-2020-35522
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/b5a935d96b21cda0f434230cdf8ca958cd8b4eef.patch]
+---
+diff --git a/tools/tiff2rgba.c b/tools/tiff2rgba.c
+index fbc383aa..764395f6 100644
+--- a/tools/tiff2rgba.c
++++ b/tools/tiff2rgba.c
+@@ -60,6 +60,10 @@ uint32 rowsperstrip = (uint32) -1;
+ int process_by_block = 0; /* default is whole image at once */
+ int no_alpha = 0;
+ int bigtiff_output = 0;
++#define DEFAULT_MAX_MALLOC (256 * 1024 * 1024)
++/* malloc size limit (in bytes)
++ * disabled when set to 0 */
++static tmsize_t maxMalloc = DEFAULT_MAX_MALLOC;
+ 
+ 
+ static int tiffcvt(TIFF* in, TIFF* out);
+@@ -75,8 +79,11 @@ main(int argc, char* argv[])
+ 	extern char *optarg;
+ #endif
+ 
+-	while ((c = getopt(argc, argv, "c:r:t:bn8h")) != -1)
++	while ((c = getopt(argc, argv, "c:r:t:bn8hM:")) != -1)
+ 		switch (c) {
++			case 'M':
++				maxMalloc = (tmsize_t)strtoul(optarg, NULL, 0) << 20;
++				break;
+ 			case 'b':
+ 				process_by_block = 1;
+ 				break;
+@@ -405,6 +412,12 @@ cvt_whole_image( TIFF *in, TIFF *out )
+ 		  (unsigned long)width, (unsigned long)height);
+         return 0;
+     }
++    if (maxMalloc != 0 && (tmsize_t)pixel_count * (tmsize_t)sizeof(uint32) > maxMalloc) {
++	TIFFError(TIFFFileName(in),
++		  "Raster size " TIFF_UINT64_FORMAT " over memory limit (" TIFF_UINT64_FORMAT "), try -b option.",
++		  (uint64)pixel_count * sizeof(uint32), (uint64)maxMalloc);
++        return 0;
++    }
+ 
+     rowsperstrip = TIFFDefaultStripSize(out, rowsperstrip);
+     TIFFSetField(out, TIFFTAG_ROWSPERSTRIP, rowsperstrip);
+@@ -530,6 +543,13 @@ tiffcvt(TIFF* in, TIFF* out)
+ 	TIFFSetField(out, TIFFTAG_SOFTWARE, TIFFGetVersion());
+ 	CopyField(TIFFTAG_DOCUMENTNAME, stringv);
+ 
++	if (maxMalloc != 0 && TIFFStripSize(in) > maxMalloc)
++	{
++		TIFFError(TIFFFileName(in),
++			  "Strip Size " TIFF_UINT64_FORMAT " over memory limit (" TIFF_UINT64_FORMAT ")",
++			  (uint64)TIFFStripSize(in), (uint64)maxMalloc);
++		return 0;
++	}
+         if( process_by_block && TIFFIsTiled( in ) )
+             return( cvt_by_tile( in, out ) );
+         else if( process_by_block )
+@@ -539,7 +559,7 @@ tiffcvt(TIFF* in, TIFF* out)
+ }
+ 
+ static const char* stuff[] = {
+-    "usage: tiff2rgba [-c comp] [-r rows] [-b] [-n] [-8] input... output",
++    "usage: tiff2rgba [-c comp] [-r rows] [-b] [-n] [-8] [-M size] input... output",
+     "where comp is one of the following compression algorithms:",
+     " jpeg\t\tJPEG encoding",
+     " zip\t\tZip/Deflate encoding",
+@@ -551,6 +571,7 @@ static const char* stuff[] = {
+     " -b (progress by block rather than as a whole image)",
+     " -n don't emit alpha component.",
+     " -8 write BigTIFF file instead of ClassicTIFF",
++    " -M set the memory allocation limit in MiB. 0 to disable limit",
+     NULL
+ };
+ 
+-- 
+GitLab
+
+
+From e9e504193ef1f87e9cb5e986586b0cbe3254e421 Mon Sep 17 00:00:00 2001
+From: Thomas Bernard <miniupnp@free.fr>
+Date: Sun, 15 Nov 2020 17:08:42 +0100
+Subject: [PATCH 2/2] tiff2rgba.1: -M option
+
+---
+ man/tiff2rgba.1 | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/man/tiff2rgba.1 b/man/tiff2rgba.1
+index d9c9baae..fe9ebb2c 100644
+--- a/man/tiff2rgba.1
++++ b/man/tiff2rgba.1
+@@ -87,6 +87,10 @@ Drop the alpha component from the output file, producing a pure RGB file.
+ Currently this does not work if the
+ .B \-b
+ flag is also in effect.
++.TP
++.BI \-M " size"
++Set maximum memory allocation size (in MiB). The default is 256MiB.
++Set to 0 to disable the limit.
+ .SH "SEE ALSO"
+ .BR tiff2bw (1),
+ .BR TIFFReadRGBAImage (3t),
+-- 
+GitLab
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
index cfea18e..43f2101 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.1.0.bb
@@ -12,6 +12,9 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://CVE-2020-35523.patch  \
            file://CVE-2020-35524-1.patch \
            file://CVE-2020-35524-2.patch \
+           file://001_support_patch_for_CVE-2020-35521_and_CVE-2020-35522.patch \
+           file://002_support_patch_for_CVE-2020-35521_and_CVE-2020-35522.patch \
+           file://CVE-2020-35521_and_CVE-2020-35522.patch \
           "
 SRC_URI[md5sum] = "2165e7aba557463acc0664e71a3ed424"
 SRC_URI[sha256sum] = "5d29f32517dadb6dbcd1255ea5bbc93a2b54b94fbf83653b4d65c7d6775b8634"
-- 
2.7.4

