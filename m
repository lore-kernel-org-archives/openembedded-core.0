Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1294ECAAD5
	for <webhook@archiver.kernel.org>; Mon,  5 Sep 2022 11:28:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.23496.1662377296859377413
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Sep 2022 04:28:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 383A3ED1;
	Mon,  5 Sep 2022 04:28:22 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 825E53F7B4;
	Mon,  5 Sep 2022 04:28:15 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] tiff: backport fix for CVE-2022-2953
Date: Mon,  5 Sep 2022 12:28:13 +0100
Message-Id: <20220905112813.3019868-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Sep 2022 11:28:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170311

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../libtiff/files/CVE-2022-2953.patch         | 86 +++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.4.0.bb |  1 +
 2 files changed, 87 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2022-2953.p=
atch

diff --git a/meta/recipes-multimedia/libtiff/files/CVE-2022-2953.patch b/=
meta/recipes-multimedia/libtiff/files/CVE-2022-2953.patch
new file mode 100644
index 00000000000..98020ff92f0
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/CVE-2022-2953.patch
@@ -0,0 +1,86 @@
+CVE: CVE-2022-2053
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 8fe3735942ea1d90d8cef843b55b3efe8ab6feaf Mon Sep 17 00:00:00 2001
+From: Su_Laus <sulau@freenet.de>
+Date: Mon, 15 Aug 2022 22:11:03 +0200
+Subject: [PATCH] =3D?UTF-8?q?According=3D20to=3D20Richard=3D20Nolde=3D20=
https://gitl?=3D
+ =3D?UTF-8?q?ab.com/libtiff/libtiff/-/issues/401#note=3D5F877637400=3D20=
the=3D20ti?=3D
+ =3D?UTF-8?q?ffcrop=3D20option=3D20=3DE2=3D80=3D9E-S=3DE2=3D80=3D9C=3D20=
is=3D20also=3D20mutually?=3D
+ =3D?UTF-8?q?=3D20exclusive=3D20to=3D20the=3D20other=3D20crop=3D20option=
s=3D20(-X|-Y),=3D20-?=3D
+ =3D?UTF-8?q?Z=3D20and=3D20-z.?=3D
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+This is now checked and ends tiffcrop if those arguments are not mutuall=
y exclusive.
+
+This MR will fix the following tiffcrop issues: #349, #414, #422, #423, =
#424
+---
+ tools/tiffcrop.c | 31 ++++++++++++++++---------------
+ 1 file changed, 16 insertions(+), 15 deletions(-)
+
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index 90286a5e..c3b758ec 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -173,12 +173,12 @@ static   char tiffcrop_rev_date[] =3D "02-09-2022"=
;
+ #define ROTATECW_270 32
+ #define ROTATE_ANY (ROTATECW_90 | ROTATECW_180 | ROTATECW_270)
+=20
+-#define CROP_NONE     0
+-#define CROP_MARGINS  1
+-#define CROP_WIDTH    2
+-#define CROP_LENGTH   4
+-#define CROP_ZONES    8
+-#define CROP_REGIONS 16
++#define CROP_NONE     0     /* "-S" -> Page_MODE_ROWSCOLS and page->row=
s/->cols !=3D 0 */
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
+=20
+ #define INVERT_DATA_ONLY      10
+ #define INVERT_DATA_AND_TAG   11
+@@ -781,7 +781,7 @@ static const char usage_info[] =3D
+ "             The four debug/dump options are independent, though it ma=
kes little sense to\n"
+ "             specify a dump file without specifying a detail level.\n"
+ "\n"
+-"Note:        The (-X|-Y), -Z and -z options are mutually exclusive.\n"
++"Note:        The (-X|-Y), -Z, -z and -S options are mutually exclusive=
.\n"
+ "             In no case should the options be applied to a given selec=
tion successively.\n"
+ "\n"
+ ;
+@@ -2131,13 +2131,14 @@ void  process_command_opts (int argc, char *argv=
[], char *mp, char *mode, uint32
+ 		/*NOTREACHED*/
+       }
+     }
+-    /*-- Check for not allowed combinations (e.g. -X, -Y and -Z and -z =
are mutually exclusive) --*/
+-    char XY, Z, R;
++    /*-- Check for not allowed combinations (e.g. -X, -Y and -Z, -z and=
 -S are mutually exclusive) --*/
++    char XY, Z, R, S;
+     XY =3D ((crop_data->crop_mode & CROP_WIDTH) || (crop_data->crop_mod=
e & CROP_LENGTH));
+     Z =3D (crop_data->crop_mode & CROP_ZONES);
+     R =3D (crop_data->crop_mode & CROP_REGIONS);
+-    if ((XY && Z) || (XY && R) || (Z && R)) {
+-        TIFFError("tiffcrop input error", "The crop options(-X|-Y), -Z =
and -z are mutually exclusive.->Exit");
++    S =3D (page->mode & PAGE_MODE_ROWSCOLS);
++    if ((XY && Z) || (XY && R) || (XY && S) || (Z && R) || (Z && S) || =
(R && S)) {
++        TIFFError("tiffcrop input error", "The crop options(-X|-Y), -Z,=
 -z and -S are mutually exclusive.->Exit");
+         exit(EXIT_FAILURE);
+     }
+   }  /* end process_command_opts */
+--=20
+2.34.1
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb b/meta/recipes=
-multimedia/libtiff/tiff_4.4.0.bb
index e30df0b3e9e..caf6f60479a 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb
@@ -11,6 +11,7 @@ CVE_PRODUCT =3D "libtiff"
 SRC_URI =3D "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://0001-fix-the-FPE-in-tiffcrop-415-427-and-428.patch \
            file://CVE-2022-34526.patch \
+           file://CVE-2022-2953.patch \
            "
=20
 SRC_URI[sha256sum] =3D "917223b37538959aca3b790d2d73aa6e626b688e02dcda27=
2aec24c2f498abed"
--=20
2.34.1


