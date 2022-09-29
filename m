Return-Path: <jay.shen.teoh@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2A3FC6FA82
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 08:33:34 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web12.8007.1664440406631181905
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 01:33:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=RyorNvbL;
 spf=pass (domain: intel.com, ip: 192.55.52.115,
 mailfrom: jay.shen.teoh@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664440408; x=1695976408;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=JtjVVl5Us61FESWIXxLrtxm07pyw1ER+GZtTEkyoMzU=;
  b=RyorNvbLmpuskKf1fl8gHOLAGfPEF+m5qm5TtaI3pZy3zGf1inpdEvTZ
   E0frur7yfNUk9yu7xcaDr3i34sb/paEhwsQ8njZmGYXif0SshQr2PUb2j
   +xvsngWnFBV/DWYGVRaLchHsq5DHgCNymtGR7e0jeuSQS9Lc1S4zaZ4kT
   /IvKMWI8PIhLNOVTUb1IO5ybgGZnMaOsJFlO1XycTZ8zk4tbAo5OFzoPG
   JFGEzBtqm+gFg4iHiKQFKYl14T/33bHolVUx8NvTNjtYuWZQ9YHvo420v
   iZXK6YIVPCF4lEJnh3ryPEq/9n2XhILMXK62fkbIXEsLGTKavcGo+hUMb
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="301806919"
X-IronPort-AV: E=Sophos;i="5.93,354,1654585200";
   d="scan'208";a="301806919"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2022 01:33:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="684747914"
X-IronPort-AV: E=Sophos;i="5.93,354,1654585200";
   d="scan'208";a="684747914"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by fmsmga008.fm.intel.com with ESMTP; 29 Sep 2022 01:33:27 -0700
From: jay.shen.teoh@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone][PATCH 2/2] tiff: backport fix for CVE-2022-2953
Date: Thu, 29 Sep 2022 16:33:19 +0800
Message-Id: <20220929083319.2225406-2-jay.shen.teoh@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220929083319.2225406-1-jay.shen.teoh@intel.com>
References: <20220929083319.2225406-1-jay.shen.teoh@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Sep 2022 08:33:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171175

From: Teoh Jay Shen <jay.shen.teoh@intel.com>

Link for the patch : https://gitlab.com/libtiff/libtiff/-/commit/48d6ece8389b01129e7d357f0985c8f938ce3da3

Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
---
 .../libtiff/tiff/CVE-2022-2953.patch          | 86 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.4.0.bb |  1 +
 2 files changed, 87 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2022-2953.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2022-2953.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-2953.patch
new file mode 100644
index 0000000000..2122b46566
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2022-2953.patch
@@ -0,0 +1,86 @@
+CVE: CVE-2022-2953
+Upstream-Status: Backport
+Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
+
+From 8fe3735942ea1d90d8cef843b55b3efe8ab6feaf Mon Sep 17 00:00:00 2001
+From: Su_Laus <sulau@freenet.de>
+Date: Mon, 15 Aug 2022 22:11:03 +0200
+Subject: [PATCH] =?UTF-8?q?According=20to=20Richard=20Nolde=20https://gitl?=
+ =?UTF-8?q?ab.com/libtiff/libtiff/-/issues/401#note=5F877637400=20the=20ti?=
+ =?UTF-8?q?ffcrop=20option=20=E2=80=9E-S=E2=80=9C=20is=20also=20mutually?=
+ =?UTF-8?q?=20exclusive=20to=20the=20other=20crop=20options=20(-X|-Y),=20-?=
+ =?UTF-8?q?Z=20and=20-z.?=
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This is now checked and ends tiffcrop if those arguments are not mutually exclusive.
+
+This MR will fix the following tiffcrop issues: #349, #414, #422, #423, #424
+---
+ tools/tiffcrop.c | 31 ++++++++++++++++---------------
+ 1 file changed, 16 insertions(+), 15 deletions(-)
+
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index 90286a5e..c3b758ec 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -173,12 +173,12 @@ static   char tiffcrop_rev_date[] = "02-09-2022";
+ #define ROTATECW_270 32
+ #define ROTATE_ANY (ROTATECW_90 | ROTATECW_180 | ROTATECW_270)
+ 
+-#define CROP_NONE     0
+-#define CROP_MARGINS  1
+-#define CROP_WIDTH    2
+-#define CROP_LENGTH   4
+-#define CROP_ZONES    8
+-#define CROP_REGIONS 16
++#define CROP_NONE     0     /* "-S" -> Page_MODE_ROWSCOLS and page->rows/->cols != 0 */
++#define CROP_MARGINS  1     /* "-m" */
++#define CROP_WIDTH    2     /* "-X" */
++#define CROP_LENGTH   4     /* "-Y" */
++#define CROP_ZONES    8     /* "-Z" */
++#define CROP_REGIONS 16     /* "-z" */
+ #define CROP_ROTATE  32
+ #define CROP_MIRROR  64
+ #define CROP_INVERT 128
+@@ -316,7 +316,7 @@ struct crop_mask {
+ #define PAGE_MODE_RESOLUTION   1
+ #define PAGE_MODE_PAPERSIZE    2
+ #define PAGE_MODE_MARGINS      4
+-#define PAGE_MODE_ROWSCOLS     8
++#define PAGE_MODE_ROWSCOLS     8    /* for -S option */
+ 
+ #define INVERT_DATA_ONLY      10
+ #define INVERT_DATA_AND_TAG   11
+@@ -781,7 +781,7 @@ static const char usage_info[] =
+ "             The four debug/dump options are independent, though it makes little sense to\n"
+ "             specify a dump file without specifying a detail level.\n"
+ "\n"
+-"Note:        The (-X|-Y), -Z and -z options are mutually exclusive.\n"
++"Note:        The (-X|-Y), -Z, -z and -S options are mutually exclusive.\n"
+ "             In no case should the options be applied to a given selection successively.\n"
+ "\n"
+ ;
+@@ -2131,13 +2131,14 @@ void  process_command_opts (int argc, char *argv[], char *mp, char *mode, uint32
+ 		/*NOTREACHED*/
+       }
+     }
+-    /*-- Check for not allowed combinations (e.g. -X, -Y and -Z and -z are mutually exclusive) --*/
+-    char XY, Z, R;
++    /*-- Check for not allowed combinations (e.g. -X, -Y and -Z, -z and -S are mutually exclusive) --*/
++    char XY, Z, R, S;
+     XY = ((crop_data->crop_mode & CROP_WIDTH) || (crop_data->crop_mode & CROP_LENGTH));
+     Z = (crop_data->crop_mode & CROP_ZONES);
+     R = (crop_data->crop_mode & CROP_REGIONS);
+-    if ((XY && Z) || (XY && R) || (Z && R)) {
+-        TIFFError("tiffcrop input error", "The crop options(-X|-Y), -Z and -z are mutually exclusive.->Exit");
++    S = (page->mode & PAGE_MODE_ROWSCOLS);
++    if ((XY && Z) || (XY && R) || (XY && S) || (Z && R) || (Z && S) || (R && S)) {
++        TIFFError("tiffcrop input error", "The crop options(-X|-Y), -Z, -z and -S are mutually exclusive.->Exit");
+         exit(EXIT_FAILURE);
+     }
+   }  /* end process_command_opts */
+-- 
+2.34.1
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb
index e30df0b3e9..caf6f60479 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb
@@ -11,6 +11,7 @@ CVE_PRODUCT = "libtiff"
 SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://0001-fix-the-FPE-in-tiffcrop-415-427-and-428.patch \
            file://CVE-2022-34526.patch \
+           file://CVE-2022-2953.patch \
            "
 
 SRC_URI[sha256sum] = "917223b37538959aca3b790d2d73aa6e626b688e02dcda272aec24c2f498abed"
-- 
2.37.3


