Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F31B2C38A2D
	for <webhook@archiver.kernel.org>; Tue, 25 Oct 2022 15:21:49 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.8278.1666711309219817679
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Oct 2022 08:21:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CDAA7D6E;
	Tue, 25 Oct 2022 08:21:54 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DEDD53F71A;
	Tue, 25 Oct 2022 08:21:47 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] tiff: fix a number of CVEs
Date: Tue, 25 Oct 2022 16:21:45 +0100
Message-Id: <20221025152145.3402222-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Oct 2022 15:21:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172133

Backport fixes from upstream for the following CVEs:
- CVE-2022-3599
- CVE-2022-3597
- CVE-2022-3626
- CVE-2022-3627
- CVE-2022-3570
- CVE-2022-3598

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...-of-TIFFTAG_INKNAMES-and-related-TIF.patch | 266 +++++++
 ...fcrop-S-option-Make-decision-simpler.patch |  36 +
 ...-incompatibility-of-Z-X-Y-z-options-.patch |  59 ++
 ...ines-require-a-larger-buffer-fixes-2.patch | 653 ++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.4.0.bb |   5 +-
 5 files changed, 1018 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/libtiff/files/0001-Revised-ha=
ndling-of-TIFFTAG_INKNAMES-and-related-TIF.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/0001-tiffcrop-S=
-option-Make-decision-simpler.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/0001-tiffcrop-d=
isable-incompatibility-of-Z-X-Y-z-options-.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/0001-tiffcrop-s=
ubroutines-require-a-larger-buffer-fixes-2.patch

diff --git a/meta/recipes-multimedia/libtiff/files/0001-Revised-handling-=
of-TIFFTAG_INKNAMES-and-related-TIF.patch b/meta/recipes-multimedia/libti=
ff/files/0001-Revised-handling-of-TIFFTAG_INKNAMES-and-related-TIF.patch
new file mode 100644
index 00000000000..ce72c861209
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/0001-Revised-handling-of-TIFF=
TAG_INKNAMES-and-related-TIF.patch
@@ -0,0 +1,266 @@
+CVE: CVE-2022-3599
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From f00484b9519df933723deb38fff943dc291a793d Mon Sep 17 00:00:00 2001
+From: Su_Laus <sulau@freenet.de>
+Date: Tue, 30 Aug 2022 16:56:48 +0200
+Subject: [PATCH] Revised handling of TIFFTAG_INKNAMES and related
+ TIFFTAG_NUMBEROFINKS value
+
+In order to solve the buffer overflow issues related to TIFFTAG_INKNAMES=
 and related TIFFTAG_NUMBEROFINKS value, a revised handling of those tags=
 within LibTiff is proposed:
+
+Behaviour for writing:
+    `NumberOfInks`  MUST fit to the number of inks in the `InkNames` str=
ing.
+    `NumberOfInks` is automatically set when `InkNames` is set.
+    If `NumberOfInks` is different to the number of inks within `InkName=
s` string, that will be corrected and a warning is issued.
+    If `NumberOfInks` is not equal to samplesperpixel only a warning wil=
l be issued.
+
+Behaviour for reading:
+    When reading `InkNames` from a TIFF file, the `NumberOfInks` will be=
 set automatically to the number of inks in `InkNames` string.
+    If `NumberOfInks` is different to the number of inks within `InkName=
s` string, that will be corrected and a warning is issued.
+    If  `NumberOfInks` is not equal to samplesperpixel only a warning wi=
ll be issued.
+
+This allows the safe use of the NumberOfInks value to read out the InkNa=
mes without buffer overflow
+
+This MR will close the following issues:  #149, #150, #152, #168 (to be =
checked), #250, #269, #398 and #456.
+
+It also fixes the old bug at http://bugzilla.maptools.org/show_bug.cgi?i=
d=3D2599, for which the limitation of `NumberOfInks =3D SPP` was introduc=
ed, which is in my opinion not necessary and does not solve the general i=
ssue.
+---
+ libtiff/tif_dir.c      | 119 ++++++++++++++++++++++++-----------------
+ libtiff/tif_dir.h      |   2 +
+ libtiff/tif_dirinfo.c  |   2 +-
+ libtiff/tif_dirwrite.c |   5 ++
+ libtiff/tif_print.c    |   4 ++
+ 5 files changed, 82 insertions(+), 50 deletions(-)
+
+diff --git a/libtiff/tif_dir.c b/libtiff/tif_dir.c
+index 793e8a79..816f7756 100644
+--- a/libtiff/tif_dir.c
++++ b/libtiff/tif_dir.c
+@@ -136,32 +136,30 @@ setExtraSamples(TIFF* tif, va_list ap, uint32_t* v=
)
+ }
+=20
+ /*
+- * Confirm we have "samplesperpixel" ink names separated by \0.  Return=
s=20
++ * Count ink names separated by \0.  Returns
+  * zero if the ink names are not as expected.
+  */
+-static uint32_t
+-checkInkNamesString(TIFF* tif, uint32_t slen, const char* s)
++static uint16_t
++countInkNamesString(TIFF *tif, uint32_t slen, const char *s)
+ {
+-	TIFFDirectory* td =3D &tif->tif_dir;
+-	uint16_t i =3D td->td_samplesperpixel;
++	uint16_t i =3D 0;
++	const char *ep =3D s + slen;
++	const char *cp =3D s;
+=20
+ 	if (slen > 0) {
+-		const char* ep =3D s+slen;
+-		const char* cp =3D s;
+-		for (; i > 0; i--) {
++		do {
+ 			for (; cp < ep && *cp !=3D '\0'; cp++) {}
+ 			if (cp >=3D ep)
+ 				goto bad;
+ 			cp++;				/* skip \0 */
+-		}
+-		return ((uint32_t)(cp - s));
++			i++;
++		} while (cp < ep);
++		return (i);
+ 	}
+ bad:
+ 	TIFFErrorExt(tif->tif_clientdata, "TIFFSetField",
+-	    "%s: Invalid InkNames value; expecting %"PRIu16" names, found %"PR=
Iu16,
+-	    tif->tif_name,
+-	    td->td_samplesperpixel,
+-	    (uint16_t)(td->td_samplesperpixel-i));
++		"%s: Invalid InkNames value; no NUL at given buffer end location %"PR=
Iu32", after %"PRIu16" ink",
++		tif->tif_name, slen, i);
+ 	return (0);
+ }
+=20
+@@ -478,13 +476,61 @@ _TIFFVSetField(TIFF* tif, uint32_t tag, va_list ap=
)
+ 		_TIFFsetFloatArray(&td->td_refblackwhite, va_arg(ap, float*), 6);
+ 		break;
+ 	case TIFFTAG_INKNAMES:
+-		v =3D (uint16_t) va_arg(ap, uint16_vap);
+-		s =3D va_arg(ap, char*);
+-		v =3D checkInkNamesString(tif, v, s);
+-		status =3D v > 0;
+-		if( v > 0 ) {
+-			_TIFFsetNString(&td->td_inknames, s, v);
+-			td->td_inknameslen =3D v;
++		{
++			v =3D (uint16_t) va_arg(ap, uint16_vap);
++			s =3D va_arg(ap, char*);
++			uint16_t ninksinstring;
++			ninksinstring =3D countInkNamesString(tif, v, s);
++			status =3D ninksinstring > 0;
++			if(ninksinstring > 0 ) {
++				_TIFFsetNString(&td->td_inknames, s, v);
++				td->td_inknameslen =3D v;
++				/* Set NumberOfInks to the value ninksinstring */
++				if (TIFFFieldSet(tif, FIELD_NUMBEROFINKS))
++				{
++					if (td->td_numberofinks !=3D ninksinstring) {
++						TIFFErrorExt(tif->tif_clientdata, module,
++							"Warning %s; Tag %s:\n  Value %"PRIu16" of NumberOfInks is diffe=
rent from the number of inks %"PRIu16".\n  -> NumberOfInks value adapted =
to %"PRIu16"",
++							tif->tif_name, fip->field_name, td->td_numberofinks, ninksinstri=
ng, ninksinstring);
++						td->td_numberofinks =3D ninksinstring;
++					}
++				} else {
++					td->td_numberofinks =3D ninksinstring;
++					TIFFSetFieldBit(tif, FIELD_NUMBEROFINKS);
++				}
++				if (TIFFFieldSet(tif, FIELD_SAMPLESPERPIXEL))
++				{
++					if (td->td_numberofinks !=3D td->td_samplesperpixel) {
++						TIFFErrorExt(tif->tif_clientdata, module,
++							"Warning %s; Tag %s:\n  Value %"PRIu16" of NumberOfInks is diffe=
rent from the SamplesPerPixel value %"PRIu16"",
++							tif->tif_name, fip->field_name, td->td_numberofinks, td->td_samp=
lesperpixel);
++					}
++				}
++			}
++		}
++		break;
++	case TIFFTAG_NUMBEROFINKS:
++		v =3D (uint16_t)va_arg(ap, uint16_vap);
++		/* If InkNames already set also NumberOfInks is set accordingly and s=
hould be equal */
++		if (TIFFFieldSet(tif, FIELD_INKNAMES))
++		{
++			if (v !=3D td->td_numberofinks) {
++				TIFFErrorExt(tif->tif_clientdata, module,
++					"Error %s; Tag %s:\n  It is not possible to set the value %"PRIu32=
" for NumberOfInks\n  which is different from the number of inks in the I=
nkNames tag (%"PRIu16")",
++					tif->tif_name, fip->field_name, v, td->td_numberofinks);
++				/* Do not set / overwrite number of inks already set by InkNames ca=
se accordingly. */
++				status =3D 0;
++			}
++		} else {
++			td->td_numberofinks =3D (uint16_t)v;
++			if (TIFFFieldSet(tif, FIELD_SAMPLESPERPIXEL))
++			{
++				if (td->td_numberofinks !=3D td->td_samplesperpixel) {
++					TIFFErrorExt(tif->tif_clientdata, module,
++						"Warning %s; Tag %s:\n  Value %"PRIu32" of NumberOfInks is differ=
ent from the SamplesPerPixel value %"PRIu16"",
++						tif->tif_name, fip->field_name, v, td->td_samplesperpixel);
++				}
++			}
+ 		}
+ 		break;
+ 	case TIFFTAG_PERSAMPLE:
+@@ -986,34 +1032,6 @@ _TIFFVGetField(TIFF* tif, uint32_t tag, va_list ap=
)
+ 	if (fip->field_bit =3D=3D FIELD_CUSTOM) {
+ 		standard_tag =3D 0;
+ 	}
+-=09
+-        if( standard_tag =3D=3D TIFFTAG_NUMBEROFINKS )
+-        {
+-            int i;
+-            for (i =3D 0; i < td->td_customValueCount; i++) {
+-                uint16_t val;
+-                TIFFTagValue *tv =3D td->td_customValues + i;
+-                if (tv->info->field_tag !=3D standard_tag)
+-                    continue;
+-                if( tv->value =3D=3D NULL )
+-                    return 0;
+-                val =3D *(uint16_t *)tv->value;
+-                /* Truncate to SamplesPerPixel, since the */
+-                /* setting code for INKNAMES assume that there are Samp=
lesPerPixel */
+-                /* inknames. */
+-                /* Fixes http://bugzilla.maptools.org/show_bug.cgi?id=3D=
2599 */
+-                if( val > td->td_samplesperpixel )
+-                {
+-                    TIFFWarningExt(tif->tif_clientdata,"_TIFFVGetField"=
,
+-                                   "Truncating NumberOfInks from %u to =
%"PRIu16,
+-                                   val, td->td_samplesperpixel);
+-                    val =3D td->td_samplesperpixel;
+-                }
+-                *va_arg(ap, uint16_t*) =3D val;
+-                return 1;
+-            }
+-            return 0;
+-        }
+=20
+ 	switch (standard_tag) {
+ 		case TIFFTAG_SUBFILETYPE:
+@@ -1195,6 +1213,9 @@ _TIFFVGetField(TIFF* tif, uint32_t tag, va_list ap=
)
+ 		case TIFFTAG_INKNAMES:
+ 			*va_arg(ap, const char**) =3D td->td_inknames;
+ 			break;
++		case TIFFTAG_NUMBEROFINKS:
++			*va_arg(ap, uint16_t *) =3D td->td_numberofinks;
++			break;
+ 		default:
+ 			{
+ 				int i;
+diff --git a/libtiff/tif_dir.h b/libtiff/tif_dir.h
+index 09065648..0c251c9e 100644
+--- a/libtiff/tif_dir.h
++++ b/libtiff/tif_dir.h
+@@ -117,6 +117,7 @@ typedef struct {
+ 	/* CMYK parameters */
+ 	int     td_inknameslen;
+ 	char*   td_inknames;
++	uint16_t td_numberofinks;                 /* number of inks in InkName=
s string */
+=20
+ 	int     td_customValueCount;
+         TIFFTagValue *td_customValues;
+@@ -174,6 +175,7 @@ typedef struct {
+ #define FIELD_TRANSFERFUNCTION         44
+ #define FIELD_INKNAMES                 46
+ #define FIELD_SUBIFD                   49
++#define FIELD_NUMBEROFINKS             50
+ /*      FIELD_CUSTOM (see tiffio.h)    65 */
+ /* end of support for well-known tags; codec-private tags follow */
+ #define FIELD_CODEC                    66  /* base of codec-private tag=
s */
+diff --git a/libtiff/tif_dirinfo.c b/libtiff/tif_dirinfo.c
+index 3371cb5c..3b4bcd33 100644
+--- a/libtiff/tif_dirinfo.c
++++ b/libtiff/tif_dirinfo.c
+@@ -114,7 +114,7 @@ tiffFields[] =3D {
+ 	{ TIFFTAG_SUBIFD, -1, -1, TIFF_IFD8, 0, TIFF_SETGET_C16_IFD8, TIFF_SET=
GET_UNDEFINED, FIELD_SUBIFD, 1, 1, "SubIFD", (TIFFFieldArray*) &tiffField=
Array },
+ 	{ TIFFTAG_INKSET, 1, 1, TIFF_SHORT, 0, TIFF_SETGET_UINT16, TIFF_SETGET=
_UNDEFINED, FIELD_CUSTOM, 0, 0, "InkSet", NULL },
+ 	{ TIFFTAG_INKNAMES, -1, -1, TIFF_ASCII, 0, TIFF_SETGET_C16_ASCII, TIFF=
_SETGET_UNDEFINED, FIELD_INKNAMES, 1, 1, "InkNames", NULL },
+-	{ TIFFTAG_NUMBEROFINKS, 1, 1, TIFF_SHORT, 0, TIFF_SETGET_UINT16, TIFF_=
SETGET_UNDEFINED, FIELD_CUSTOM, 1, 0, "NumberOfInks", NULL },
++	{ TIFFTAG_NUMBEROFINKS, 1, 1, TIFF_SHORT, 0, TIFF_SETGET_UINT16, TIFF_=
SETGET_UNDEFINED, FIELD_NUMBEROFINKS, 1, 0, "NumberOfInks", NULL },
+ 	{ TIFFTAG_DOTRANGE, 2, 2, TIFF_SHORT, 0, TIFF_SETGET_UINT16_PAIR, TIFF=
_SETGET_UNDEFINED, FIELD_CUSTOM, 0, 0, "DotRange", NULL },
+ 	{ TIFFTAG_TARGETPRINTER, -1, -1, TIFF_ASCII, 0, TIFF_SETGET_ASCII, TIF=
F_SETGET_UNDEFINED, FIELD_CUSTOM, 1, 0, "TargetPrinter", NULL },
+ 	{ TIFFTAG_EXTRASAMPLES, -1, -1, TIFF_SHORT, 0, TIFF_SETGET_C16_UINT16,=
 TIFF_SETGET_UNDEFINED, FIELD_EXTRASAMPLES, 0, 1, "ExtraSamples", NULL },
+diff --git a/libtiff/tif_dirwrite.c b/libtiff/tif_dirwrite.c
+index 6c86fdca..062e4610 100644
+--- a/libtiff/tif_dirwrite.c
++++ b/libtiff/tif_dirwrite.c
+@@ -626,6 +626,11 @@ TIFFWriteDirectorySec(TIFF* tif, int isimage, int i=
magedone, uint64_t* pdiroff)
+ 				if (!TIFFWriteDirectoryTagAscii(tif,&ndir,dir,TIFFTAG_INKNAMES,tif-=
>tif_dir.td_inknameslen,tif->tif_dir.td_inknames))
+ 					goto bad;
+ 			}
++			if (TIFFFieldSet(tif, FIELD_NUMBEROFINKS))
++			{
++				if (!TIFFWriteDirectoryTagShort(tif, &ndir, dir, TIFFTAG_NUMBEROFIN=
KS, tif->tif_dir.td_numberofinks))
++					goto bad;
++			}
+ 			if (TIFFFieldSet(tif,FIELD_SUBIFD))
+ 			{
+ 				if (!TIFFWriteDirectoryTagSubifd(tif,&ndir,dir))
+diff --git a/libtiff/tif_print.c b/libtiff/tif_print.c
+index 16ce5780..a91b9e7b 100644
+--- a/libtiff/tif_print.c
++++ b/libtiff/tif_print.c
+@@ -397,6 +397,10 @@ TIFFPrintDirectory(TIFF* tif, FILE* fd, long flags)
+ 		}
+                 fputs("\n", fd);
+ 	}
++	if (TIFFFieldSet(tif, FIELD_NUMBEROFINKS)) {
++		fprintf(fd, "  NumberOfInks: %d\n",
++			td->td_numberofinks);
++	}
+ 	if (TIFFFieldSet(tif,FIELD_THRESHHOLDING)) {
+ 		fprintf(fd, "  Thresholding: ");
+ 		switch (td->td_threshholding) {
+--=20
+2.34.1
+
diff --git a/meta/recipes-multimedia/libtiff/files/0001-tiffcrop-S-option=
-Make-decision-simpler.patch b/meta/recipes-multimedia/libtiff/files/0001=
-tiffcrop-S-option-Make-decision-simpler.patch
new file mode 100644
index 00000000000..02642ecfbcc
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/0001-tiffcrop-S-option-Make-d=
ecision-simpler.patch
@@ -0,0 +1,36 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From bad48e90b410df32172006c7876da449ba62cdba Mon Sep 17 00:00:00 2001
+From: Su_Laus <sulau@freenet.de>
+Date: Sat, 20 Aug 2022 23:35:26 +0200
+Subject: [PATCH] tiffcrop -S option: Make decision simpler.
+
+---
+ tools/tiffcrop.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index c3b758ec..8fd856dc 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -2133,11 +2133,11 @@ void  process_command_opts (int argc, char *argv=
[], char *mp, char *mode, uint32
+     }
+     /*-- Check for not allowed combinations (e.g. -X, -Y and -Z, -z and=
 -S are mutually exclusive) --*/
+     char XY, Z, R, S;
+-    XY =3D ((crop_data->crop_mode & CROP_WIDTH) || (crop_data->crop_mod=
e & CROP_LENGTH));
+-    Z =3D (crop_data->crop_mode & CROP_ZONES);
+-    R =3D (crop_data->crop_mode & CROP_REGIONS);
+-    S =3D (page->mode & PAGE_MODE_ROWSCOLS);
+-    if ((XY && Z) || (XY && R) || (XY && S) || (Z && R) || (Z && S) || =
(R && S)) {
++    XY =3D ((crop_data->crop_mode & CROP_WIDTH) || (crop_data->crop_mod=
e & CROP_LENGTH)) ? 1 : 0;
++    Z =3D (crop_data->crop_mode & CROP_ZONES) ? 1 : 0;
++    R =3D (crop_data->crop_mode & CROP_REGIONS) ? 1 : 0;
++    S =3D (page->mode & PAGE_MODE_ROWSCOLS) ? 1 : 0;
++    if (XY + Z + R + S > 1) {
+         TIFFError("tiffcrop input error", "The crop options(-X|-Y), -Z,=
 -z and -S are mutually exclusive.->Exit");
+         exit(EXIT_FAILURE);
+     }
+--=20
+2.34.1
+
diff --git a/meta/recipes-multimedia/libtiff/files/0001-tiffcrop-disable-=
incompatibility-of-Z-X-Y-z-options-.patch b/meta/recipes-multimedia/libti=
ff/files/0001-tiffcrop-disable-incompatibility-of-Z-X-Y-z-options-.patch
new file mode 100644
index 00000000000..3e33f4adea2
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/0001-tiffcrop-disable-incompa=
tibility-of-Z-X-Y-z-options-.patch
@@ -0,0 +1,59 @@
+CVE: CVE-2022-3597 CVE-2022-3626 CVE-2022-3627
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From 4746f16253b784287bc8a5003990c1c3b9a03a62 Mon Sep 17 00:00:00 2001
+From: Su_Laus <sulau@freenet.de>
+Date: Thu, 25 Aug 2022 16:11:41 +0200
+Subject: [PATCH] tiffcrop: disable incompatibility of -Z, -X, -Y, -z opt=
ions
+ with any PAGE_MODE_x option (fixes #411 and #413)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+tiffcrop does not support =E2=80=93Z, -z, -X and =E2=80=93Y options toge=
ther with any other PAGE_MODE_x options like  -H, -V, -P, -J, -K or =E2=80=
=93S.
+
+Code analysis:
+
+With the options =E2=80=93Z, -z, the crop.selections are set to a value =
> 0. Within main(), this triggers the call of processCropSelections(), wh=
ich copies the sections from the read_buff into seg_buffs[].
+In the following code in main(), the only supported step, where that seg=
_buffs are further handled are within an if-clause with  if (page.mode =3D=
=3D PAGE_MODE_NONE) .
+
+Execution of the else-clause often leads to buffer-overflows.
+
+Therefore, the above option combination is not supported and will be dis=
abled to prevent those buffer-overflows.
+
+The MR solves issues #411 and #413.
+---
+ doc/tools/tiffcrop.rst |  8 ++++++++
+ tools/tiffcrop.c       | 32 +++++++++++++++++++++++++-------
+ 2 files changed, 33 insertions(+), 7 deletions(-)
+
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index 8fd856dc..41a2ea36 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -2138,9 +2143,20 @@ void  process_command_opts (int argc, char *argv[=
], char *mp, char *mode, uint32
+     R =3D (crop_data->crop_mode & CROP_REGIONS) ? 1 : 0;
+     S =3D (page->mode & PAGE_MODE_ROWSCOLS) ? 1 : 0;
+     if (XY + Z + R + S > 1) {
+-        TIFFError("tiffcrop input error", "The crop options(-X|-Y), -Z,=
 -z and -S are mutually exclusive.->Exit");
++        TIFFError("tiffcrop input error", "The crop options(-X|-Y), -Z,=
 -z and -S are mutually exclusive.->exit");
+         exit(EXIT_FAILURE);
+     }
++
++    /* Check for not allowed combination:
++     * Any of the -X, -Y, -Z and -z options together with other PAGE_MO=
DE_x options
++     * such as -H, -V, -P, -J or -K are not supported and may cause buf=
fer overflows.
++.    */
++    if ((XY + Z + R > 0) && page->mode !=3D PAGE_MODE_NONE) {
++        TIFFError("tiffcrop input error",
++            "Any of the crop options -X, -Y, -Z and -z together with ot=
her PAGE_MODE_x options such as - H, -V, -P, -J or -K is not supported an=
d may cause buffer overflows..->exit");
++        exit(EXIT_FAILURE);
++    }
++
+   }  /* end process_command_opts */
+=20
+ /* Start a new output file if one has not been previously opened or
+--=20
+2.34.1
+
diff --git a/meta/recipes-multimedia/libtiff/files/0001-tiffcrop-subrouti=
nes-require-a-larger-buffer-fixes-2.patch b/meta/recipes-multimedia/libti=
ff/files/0001-tiffcrop-subroutines-require-a-larger-buffer-fixes-2.patch
new file mode 100644
index 00000000000..e44b9bc57c6
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/0001-tiffcrop-subroutines-req=
uire-a-larger-buffer-fixes-2.patch
@@ -0,0 +1,653 @@
+CVE: CVE-2022-3570 CVE-2022-3598
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+From afd7086090dafd3949afd172822cbcec4ed17d56 Mon Sep 17 00:00:00 2001
+From: Su Laus <sulau@freenet.de>
+Date: Thu, 13 Oct 2022 14:33:27 +0000
+Subject: [PATCH] tiffcrop subroutines require a larger buffer (fixes #27=
1,
+ #381, #386, #388, #389, #435)
+
+---
+ tools/tiffcrop.c | 209 ++++++++++++++++++++++++++---------------------
+ 1 file changed, 118 insertions(+), 91 deletions(-)
+
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index 41a2ea36..deab5feb 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -212,6 +212,10 @@ static   char tiffcrop_rev_date[] =3D "26-08-2022";
+=20
+ #define TIFF_DIR_MAX  65534
+=20
++/* Some conversion subroutines require image buffers, which are at leas=
t 3 bytes
++ * larger than the necessary size for the image itself. */
++#define NUM_BUFF_OVERSIZE_BYTES   3
++
+ /* Offsets into buffer for margins and fixed width and length segments =
*/
+ struct offset {
+   uint32_t  tmargin;
+@@ -233,7 +237,7 @@ struct offset {
+  */
+=20
+ struct  buffinfo {
+-  uint32_t size;           /* size of this buffer */
++  size_t size;           /* size of this buffer */
+   unsigned char *buffer; /* address of the allocated buffer */
+ };
+=20
+@@ -810,8 +814,8 @@ static int readContigTilesIntoBuffer (TIFF* in, uint=
8_t* buf,
+   uint32_t dst_rowsize, shift_width;
+   uint32_t bytes_per_sample, bytes_per_pixel;
+   uint32_t trailing_bits, prev_trailing_bits;
+-  uint32_t tile_rowsize  =3D TIFFTileRowSize(in);
+-  uint32_t src_offset, dst_offset;
++  tmsize_t tile_rowsize  =3D TIFFTileRowSize(in);
++  tmsize_t src_offset, dst_offset;
+   uint32_t row_offset, col_offset;
+   uint8_t *bufp =3D (uint8_t*) buf;
+   unsigned char *src =3D NULL;
+@@ -861,7 +865,7 @@ static int readContigTilesIntoBuffer (TIFF* in, uint=
8_t* buf,
+       TIFFError("readContigTilesIntoBuffer", "Integer overflow when cal=
culating buffer size.");
+       exit(EXIT_FAILURE);
+   }
+-  tilebuf =3D limitMalloc(tile_buffsize + 3);
++  tilebuf =3D limitMalloc(tile_buffsize + NUM_BUFF_OVERSIZE_BYTES);
+   if (tilebuf =3D=3D 0)
+     return 0;
+   tilebuf[tile_buffsize] =3D 0;
+@@ -1024,7 +1028,7 @@ static int  readSeparateTilesIntoBuffer (TIFF* in,=
 uint8_t *obuf,
+   for (sample =3D 0; (sample < spp) && (sample < MAX_SAMPLES); sample++=
)
+     {
+     srcbuffs[sample] =3D NULL;
+-    tbuff =3D (unsigned char *)limitMalloc(tilesize + 8);
++    tbuff =3D (unsigned char *)limitMalloc(tilesize + NUM_BUFF_OVERSIZE=
_BYTES);
+     if (!tbuff)
+       {
+       TIFFError ("readSeparateTilesIntoBuffer",=20
+@@ -1217,7 +1221,8 @@ writeBufferToSeparateStrips (TIFF* out, uint8_t* b=
uf,
+   }
+   rowstripsize =3D rowsperstrip * bytes_per_sample * (width + 1);=20
+=20
+-  obuf =3D limitMalloc (rowstripsize);
++  /* Add 3 padding bytes for extractContigSamples32bits */
++  obuf =3D limitMalloc (rowstripsize + NUM_BUFF_OVERSIZE_BYTES);
+   if (obuf =3D=3D NULL)
+     return 1;
+  =20
+@@ -1229,7 +1234,7 @@ writeBufferToSeparateStrips (TIFF* out, uint8_t* b=
uf,
+=20
+       stripsize =3D TIFFVStripSize(out, nrows);
+       src =3D buf + (row * rowsize);
+-      memset (obuf, '\0', rowstripsize);
++      memset (obuf, '\0',rowstripsize + NUM_BUFF_OVERSIZE_BYTES);
+       if (extractContigSamplesToBuffer(obuf, src, nrows, width, s, spp,=
 bps, dump))
+         {
+         _TIFFfree(obuf);
+@@ -1237,10 +1242,15 @@ writeBufferToSeparateStrips (TIFF* out, uint8_t*=
 buf,
+ 	}
+       if ((dump->outfile !=3D NULL) && (dump->level =3D=3D 1))
+         {
+-        dump_info(dump->outfile, dump->format,"",=20
++          if (scanlinesize > 0x0ffffffffULL) {
++              dump_info(dump->infile, dump->format, "loadImage",
++                  "Attention: scanlinesize %"PRIu64" is larger than UIN=
T32_MAX.\nFollowing dump might be wrong.",
++                  scanlinesize);
++          }
++          dump_info(dump->outfile, dump->format,"",
+                   "Sample %2d, Strip: %2d, bytes: %4d, Row %4d, bytes: =
%4d, Input offset: %6d",=20
+-                  s + 1, strip + 1, stripsize, row + 1, scanlinesize, s=
rc - buf);
+-        dump_buffer(dump->outfile, dump->format, nrows, scanlinesize, r=
ow, obuf);
++                  s + 1, strip + 1, stripsize, row + 1, (uint32_t)scanl=
inesize, src - buf);
++        dump_buffer(dump->outfile, dump->format, nrows, (uint32_t)scanl=
inesize, row, obuf);
+ 	}
+=20
+       if (TIFFWriteEncodedStrip(out, strip++, obuf, stripsize) < 0)
+@@ -1267,7 +1277,7 @@ static int writeBufferToContigTiles (TIFF* out, ui=
nt8_t* buf, uint32_t imageleng
+   uint32_t tl, tw;
+   uint32_t row, col, nrow, ncol;
+   uint32_t src_rowsize, col_offset;
+-  uint32_t tile_rowsize  =3D TIFFTileRowSize(out);
++  tmsize_t tile_rowsize  =3D TIFFTileRowSize(out);
+   uint8_t* bufp =3D (uint8_t*) buf;
+   tsize_t tile_buffsize =3D 0;
+   tsize_t tilesize =3D TIFFTileSize(out);
+@@ -1310,9 +1320,11 @@ static int writeBufferToContigTiles (TIFF* out, u=
int8_t* buf, uint32_t imageleng
+   }
+   src_rowsize =3D ((imagewidth * spp * bps) + 7U) / 8;
+=20
+-  tilebuf =3D limitMalloc(tile_buffsize);
++  /* Add 3 padding bytes for extractContigSamples32bits */
++  tilebuf =3D limitMalloc(tile_buffsize + NUM_BUFF_OVERSIZE_BYTES);
+   if (tilebuf =3D=3D 0)
+     return 1;
++  memset(tilebuf, 0, tile_buffsize + NUM_BUFF_OVERSIZE_BYTES);
+   for (row =3D 0; row < imagelength; row +=3D tl)
+     {
+     nrow =3D (row + tl > imagelength) ? imagelength - row : tl;
+@@ -1358,7 +1370,8 @@ static int writeBufferToSeparateTiles (TIFF* out, =
uint8_t* buf, uint32_t imagele
+                                        uint32_t imagewidth, tsample_t s=
pp,
+                                        struct dump_opts * dump)
+   {
+-  tdata_t obuf =3D limitMalloc(TIFFTileSize(out));
++  /* Add 3 padding bytes for extractContigSamples32bits */
++  tdata_t obuf =3D limitMalloc(TIFFTileSize(out) + NUM_BUFF_OVERSIZE_BY=
TES);
+   uint32_t tl, tw;
+   uint32_t row, col, nrow, ncol;
+   uint32_t src_rowsize, col_offset;
+@@ -1368,6 +1381,7 @@ static int writeBufferToSeparateTiles (TIFF* out, =
uint8_t* buf, uint32_t imagele
+=20
+   if (obuf =3D=3D NULL)
+     return 1;
++  memset(obuf, 0, TIFFTileSize(out) + NUM_BUFF_OVERSIZE_BYTES);
+=20
+   if( !TIFFGetField(out, TIFFTAG_TILELENGTH, &tl) ||
+       !TIFFGetField(out, TIFFTAG_TILEWIDTH, &tw) ||
+@@ -1793,14 +1807,14 @@ void  process_command_opts (int argc, char *argv=
[], char *mp, char *mode, uint32
+                      =20
+                     *opt_offset =3D '\0';
+                     /* convert option to lowercase */
+-                    end =3D strlen (opt_ptr);
++                    end =3D (unsigned int)strlen (opt_ptr);
+                     for (i =3D 0; i < end; i++)
+                       *(opt_ptr + i) =3D tolower((int) *(opt_ptr + i));
+                     /* Look for dump format specification */
+                     if (strncmp(opt_ptr, "for", 3) =3D=3D 0)
+                       {
+ 		      /* convert value to lowercase */
+-                      end =3D strlen (opt_offset + 1);
++                      end =3D (unsigned int)strlen (opt_offset + 1);
+                       for (i =3D 1; i <=3D end; i++)
+                         *(opt_offset + i) =3D tolower((int) *(opt_offse=
t + i));
+                       /* check dump format value */
+@@ -2273,6 +2287,8 @@ main(int argc, char* argv[])
+   size_t length;
+   char   temp_filename[PATH_MAX + 16]; /* Extra space keeps the compile=
r from complaining */
+=20
++  assert(NUM_BUFF_OVERSIZE_BYTES >=3D 3);
++
+   little_endian =3D *((unsigned char *)&little_endian) & '1';
+=20
+   initImageData(&image);
+@@ -3227,13 +3243,13 @@ extractContigSamples32bits (uint8_t *in, uint8_t=
 *out, uint32_t cols,
+       /* If we have a full buffer's worth, write it out */
+       if (ready_bits >=3D 32)
+         {
+-        bytebuff1 =3D (buff2 >> 56);
++        bytebuff1 =3D (uint8_t)(buff2 >> 56);
+         *dst++ =3D bytebuff1;
+-        bytebuff2 =3D (buff2 >> 48);
++        bytebuff2 =3D (uint8_t)(buff2 >> 48);
+         *dst++ =3D bytebuff2;
+-        bytebuff3 =3D (buff2 >> 40);
++        bytebuff3 =3D (uint8_t)(buff2 >> 40);
+         *dst++ =3D bytebuff3;
+-        bytebuff4 =3D (buff2 >> 32);
++        bytebuff4 =3D (uint8_t)(buff2 >> 32);
+         *dst++ =3D bytebuff4;
+         ready_bits -=3D 32;
+                    =20
+@@ -3642,13 +3658,13 @@ extractContigSamplesShifted32bits (uint8_t *in, =
uint8_t *out, uint32_t cols,
+         }
+       else  /* If we have a full buffer's worth, write it out */
+         {
+-        bytebuff1 =3D (buff2 >> 56);
++        bytebuff1 =3D (uint8_t)(buff2 >> 56);
+         *dst++ =3D bytebuff1;
+-        bytebuff2 =3D (buff2 >> 48);
++        bytebuff2 =3D (uint8_t)(buff2 >> 48);
+         *dst++ =3D bytebuff2;
+-        bytebuff3 =3D (buff2 >> 40);
++        bytebuff3 =3D (uint8_t)(buff2 >> 40);
+         *dst++ =3D bytebuff3;
+-        bytebuff4 =3D (buff2 >> 32);
++        bytebuff4 =3D (uint8_t)(buff2 >> 32);
+         *dst++ =3D bytebuff4;
+         ready_bits -=3D 32;
+                    =20
+@@ -3825,10 +3841,10 @@ extractContigSamplesToTileBuffer(uint8_t *out, u=
int8_t *in, uint32_t rows, uint3
+ static int readContigStripsIntoBuffer (TIFF* in, uint8_t* buf)
+ {
+         uint8_t* bufp =3D buf;
+-        int32_t  bytes_read =3D 0;
++        tmsize_t  bytes_read =3D 0;
+         uint32_t strip, nstrips   =3D TIFFNumberOfStrips(in);
+-        uint32_t stripsize =3D TIFFStripSize(in);
+-        uint32_t rows =3D 0;
++        tmsize_t stripsize =3D TIFFStripSize(in);
++        tmsize_t rows =3D 0;
+         uint32_t rps =3D TIFFGetFieldDefaulted(in, TIFFTAG_ROWSPERSTRIP=
, &rps);
+         tsize_t scanline_size =3D TIFFScanlineSize(in);
+=20
+@@ -3841,11 +3857,11 @@ static int readContigStripsIntoBuffer (TIFF* in,=
 uint8_t* buf)
+                 bytes_read =3D TIFFReadEncodedStrip (in, strip, bufp, -=
1);
+                 rows =3D bytes_read / scanline_size;
+                 if ((strip < (nstrips - 1)) && (bytes_read !=3D (int32_=
t)stripsize))
+-                        TIFFError("", "Strip %"PRIu32": read %"PRId32" =
bytes, strip size %"PRIu32,
++                        TIFFError("", "Strip %"PRIu32": read %"PRId64" =
bytes, strip size %"PRIu64,
+                                   strip + 1, bytes_read, stripsize);
+=20
+                 if (bytes_read < 0 && !ignore) {
+-                        TIFFError("", "Error reading strip %"PRIu32" af=
ter %"PRIu32" rows",
++                        TIFFError("", "Error reading strip %"PRIu32" af=
ter %"PRIu64" rows",
+                                   strip, rows);
+                         return 0;
+                 }
+@@ -4310,13 +4326,13 @@ combineSeparateSamples32bits (uint8_t *in[], uin=
t8_t *out, uint32_t cols,
+ 	/* If we have a full buffer's worth, write it out */
+ 	if (ready_bits >=3D 32)
+ 	  {
+-	  bytebuff1 =3D (buff2 >> 56);
++	  bytebuff1 =3D (uint8_t)(buff2 >> 56);
+ 	  *dst++ =3D bytebuff1;
+-	  bytebuff2 =3D (buff2 >> 48);
++	  bytebuff2 =3D (uint8_t)(buff2 >> 48);
+ 	  *dst++ =3D bytebuff2;
+-	  bytebuff3 =3D (buff2 >> 40);
++	  bytebuff3 =3D (uint8_t)(buff2 >> 40);
+ 	  *dst++ =3D bytebuff3;
+-	  bytebuff4 =3D (buff2 >> 32);
++	  bytebuff4 =3D (uint8_t)(buff2 >> 32);
+ 	  *dst++ =3D bytebuff4;
+ 	  ready_bits -=3D 32;
+                    =20
+@@ -4359,10 +4375,10 @@ combineSeparateSamples32bits (uint8_t *in[], uin=
t8_t *out, uint32_t cols,
+ 	         "Row %3d, Col %3d, Src byte offset %3d  bit offset %2d  Dst o=
ffset %3d",
+ 		 row + 1, col + 1, src_byte, src_bit, dst - out);
+=20
+-      dump_long (dumpfile, format, "Match bits ", matchbits);
++      dump_wide (dumpfile, format, "Match bits ", matchbits);
+       dump_data (dumpfile, format, "Src   bits ", src, 4);
+-      dump_long (dumpfile, format, "Buff1 bits ", buff1);
+-      dump_long (dumpfile, format, "Buff2 bits ", buff2);
++      dump_wide (dumpfile, format, "Buff1 bits ", buff1);
++      dump_wide (dumpfile, format, "Buff2 bits ", buff2);
+       dump_byte (dumpfile, format, "Write bits1", bytebuff1);
+       dump_byte (dumpfile, format, "Write bits2", bytebuff2);
+       dump_info (dumpfile, format, "", "Ready bits:  %2d", ready_bits);=
=20
+@@ -4835,13 +4851,13 @@ combineSeparateTileSamples32bits (uint8_t *in[],=
 uint8_t *out, uint32_t cols,
+ 	/* If we have a full buffer's worth, write it out */
+ 	if (ready_bits >=3D 32)
+ 	  {
+-	  bytebuff1 =3D (buff2 >> 56);
++	  bytebuff1 =3D (uint8_t)(buff2 >> 56);
+ 	  *dst++ =3D bytebuff1;
+-	  bytebuff2 =3D (buff2 >> 48);
++	  bytebuff2 =3D (uint8_t)(buff2 >> 48);
+ 	  *dst++ =3D bytebuff2;
+-	  bytebuff3 =3D (buff2 >> 40);
++	  bytebuff3 =3D (uint8_t)(buff2 >> 40);
+ 	  *dst++ =3D bytebuff3;
+-	  bytebuff4 =3D (buff2 >> 32);
++	  bytebuff4 =3D (uint8_t)(buff2 >> 32);
+ 	  *dst++ =3D bytebuff4;
+ 	  ready_bits -=3D 32;
+                    =20
+@@ -4884,10 +4900,10 @@ combineSeparateTileSamples32bits (uint8_t *in[],=
 uint8_t *out, uint32_t cols,
+ 	         "Row %3d, Col %3d, Src byte offset %3d  bit offset %2d  Dst o=
ffset %3d",
+ 		 row + 1, col + 1, src_byte, src_bit, dst - out);
+=20
+-      dump_long (dumpfile, format, "Match bits ", matchbits);
++      dump_wide (dumpfile, format, "Match bits ", matchbits);
+       dump_data (dumpfile, format, "Src   bits ", src, 4);
+-      dump_long (dumpfile, format, "Buff1 bits ", buff1);
+-      dump_long (dumpfile, format, "Buff2 bits ", buff2);
++      dump_wide (dumpfile, format, "Buff1 bits ", buff1);
++      dump_wide (dumpfile, format, "Buff2 bits ", buff2);
+       dump_byte (dumpfile, format, "Write bits1", bytebuff1);
+       dump_byte (dumpfile, format, "Write bits2", bytebuff2);
+       dump_info (dumpfile, format, "", "Ready bits:  %2d", ready_bits);=
=20
+@@ -4910,7 +4926,7 @@ static int readSeparateStripsIntoBuffer (TIFF *in,=
 uint8_t *obuf, uint32_t lengt
+   {
+   int i, bytes_per_sample, bytes_per_pixel, shift_width, result =3D 1;
+   uint32_t j;
+-  int32_t  bytes_read =3D 0;
++  tmsize_t  bytes_read =3D 0;
+   uint16_t bps =3D 0, planar;
+   uint32_t nstrips;
+   uint32_t strips_per_sample;
+@@ -4976,7 +4992,7 @@ static int readSeparateStripsIntoBuffer (TIFF *in,=
 uint8_t *obuf, uint32_t lengt
+   for (s =3D 0; (s < spp) && (s < MAX_SAMPLES); s++)
+     {
+     srcbuffs[s] =3D NULL;
+-    buff =3D limitMalloc(stripsize + 3);
++    buff =3D limitMalloc(stripsize + NUM_BUFF_OVERSIZE_BYTES);
+     if (!buff)
+       {
+       TIFFError ("readSeparateStripsIntoBuffer",=20
+@@ -4999,7 +5015,7 @@ static int readSeparateStripsIntoBuffer (TIFF *in,=
 uint8_t *obuf, uint32_t lengt
+       buff =3D srcbuffs[s];
+       strip =3D (s * strips_per_sample) + j;=20
+       bytes_read =3D TIFFReadEncodedStrip (in, strip, buff, stripsize);
+-      rows_this_strip =3D bytes_read / src_rowsize;
++      rows_this_strip =3D (uint32_t)(bytes_read / src_rowsize);
+       if (bytes_read < 0 && !ignore)
+         {
+         TIFFError(TIFFFileName(in),
+@@ -6062,13 +6078,14 @@ loadImage(TIFF* in, struct image_data *image, st=
ruct dump_opts *dump, unsigned c
+   uint16_t   input_compression =3D 0, input_photometric =3D 0;
+   uint16_t   subsampling_horiz, subsampling_vert;
+   uint32_t   width =3D 0, length =3D 0;
+-  uint32_t   stsize =3D 0, tlsize =3D 0, buffsize =3D 0, scanlinesize =3D=
 0;
++  tmsize_t   stsize =3D 0, tlsize =3D 0, buffsize =3D 0;
++  tmsize_t   scanlinesize =3D 0;
+   uint32_t   tw =3D 0, tl =3D 0;       /* Tile width and length */
+-  uint32_t   tile_rowsize =3D 0;
++  tmsize_t   tile_rowsize =3D 0;
+   unsigned char *read_buff =3D NULL;
+   unsigned char *new_buff  =3D NULL;
+   int      readunit =3D 0;
+-  static   uint32_t  prev_readsize =3D 0;
++  static   tmsize_t  prev_readsize =3D 0;
+=20
+   TIFFGetFieldDefaulted(in, TIFFTAG_BITSPERSAMPLE, &bps);
+   TIFFGetFieldDefaulted(in, TIFFTAG_SAMPLESPERPIXEL, &spp);
+@@ -6325,6 +6342,8 @@ loadImage(TIFF* in, struct image_data *image, stru=
ct dump_opts *dump, unsigned c
+     /* The buffsize_check and the possible adaptation of buffsize=20
+      * has to account also for padding of each line to a byte boundary.=
=20
+      * This is assumed by mirrorImage() and rotateImage().
++     * Furthermore, functions like extractContigSamplesShifted32bits()
++     * need a buffer, which is at least 3 bytes larger than the actual =
image.
+      * Otherwise buffer-overflow might occur there.
+      */
+     buffsize_check =3D length * (uint32_t)(((width * spp * bps) + 7) / =
8);
+@@ -6376,7 +6395,7 @@ loadImage(TIFF* in, struct image_data *image, stru=
ct dump_opts *dump, unsigned c
+         TIFFError("loadImage", "Unable to allocate/reallocate read buff=
er");
+         return (-1);
+     }
+-    read_buff =3D (unsigned char *)limitMalloc(buffsize+3);
++    read_buff =3D (unsigned char *)limitMalloc(buffsize + NUM_BUFF_OVER=
SIZE_BYTES);
+   }
+   else
+     {
+@@ -6387,11 +6406,11 @@ loadImage(TIFF* in, struct image_data *image, st=
ruct dump_opts *dump, unsigned c
+           TIFFError("loadImage", "Unable to allocate/reallocate read bu=
ffer");
+           return (-1);
+       }
+-      new_buff =3D _TIFFrealloc(read_buff, buffsize+3);
++      new_buff =3D _TIFFrealloc(read_buff, buffsize + NUM_BUFF_OVERSIZE=
_BYTES);
+       if (!new_buff)
+         {
+ 	free (read_buff);
+-        read_buff =3D (unsigned char *)limitMalloc(buffsize+3);
++        read_buff =3D (unsigned char *)limitMalloc(buffsize + NUM_BUFF_=
OVERSIZE_BYTES);
+         }
+       else
+         read_buff =3D new_buff;
+@@ -6464,8 +6483,13 @@ loadImage(TIFF* in, struct image_data *image, str=
uct dump_opts *dump, unsigned c
+     dump_info  (dump->infile, dump->format, "",=20
+                 "Bits per sample %"PRIu16", Samples per pixel %"PRIu16,=
 bps, spp);
+=20
++    if (scanlinesize > 0x0ffffffffULL) {
++        dump_info(dump->infile, dump->format, "loadImage",
++            "Attention: scanlinesize %"PRIu64" is larger than UINT32_MA=
X.\nFollowing dump might be wrong.",
++            scanlinesize);
++    }
+     for (i =3D 0; i < length; i++)
+-      dump_buffer(dump->infile, dump->format, 1, scanlinesize,=20
++      dump_buffer(dump->infile, dump->format, 1, (uint32_t)scanlinesize=
,=20
+                   i, read_buff + (i * scanlinesize));
+     }
+   return (0);
+@@ -7485,13 +7509,13 @@ writeSingleSection(TIFF *in, TIFF *out, struct i=
mage_data *image,
+      if (TIFFGetField(in, TIFFTAG_NUMBEROFINKS, &ninks)) {
+        TIFFSetField(out, TIFFTAG_NUMBEROFINKS, ninks);
+        if (TIFFGetField(in, TIFFTAG_INKNAMES, &inknames)) {
+-	 int inknameslen =3D strlen(inknames) + 1;
++	 int inknameslen =3D (int)strlen(inknames) + 1;
+ 	 const char* cp =3D inknames;
+ 	 while (ninks > 1) {
+ 	   cp =3D strchr(cp, '\0');
+ 	   if (cp) {
+ 	     cp++;
+-	     inknameslen +=3D (strlen(cp) + 1);
++	     inknameslen +=3D ((int)strlen(cp) + 1);
+ 	   }
+ 	   ninks--;
+          }
+@@ -7554,23 +7578,23 @@ createImageSection(uint32_t sectsize, unsigned c=
har **sect_buff_ptr)
+=20
+   if (!sect_buff)
+     {
+-    sect_buff =3D (unsigned char *)limitMalloc(sectsize);
++    sect_buff =3D (unsigned char *)limitMalloc(sectsize + NUM_BUFF_OVER=
SIZE_BYTES);
+     if (!sect_buff)
+     {
+         TIFFError("createImageSection", "Unable to allocate/reallocate =
section buffer");
+         return (-1);
+     }
+-    _TIFFmemset(sect_buff, 0, sectsize);
++    _TIFFmemset(sect_buff, 0, sectsize + NUM_BUFF_OVERSIZE_BYTES);
+     }
+   else
+     {
+     if (prev_sectsize < sectsize)
+       {
+-      new_buff =3D _TIFFrealloc(sect_buff, sectsize);
++      new_buff =3D _TIFFrealloc(sect_buff, sectsize + NUM_BUFF_OVERSIZE=
_BYTES);
+       if (!new_buff)
+         {
+           _TIFFfree (sect_buff);
+-        sect_buff =3D (unsigned char *)limitMalloc(sectsize);
++        sect_buff =3D (unsigned char *)limitMalloc(sectsize + NUM_BUFF_=
OVERSIZE_BYTES);
+         }
+       else
+         sect_buff =3D new_buff;
+@@ -7580,7 +7604,7 @@ createImageSection(uint32_t sectsize, unsigned cha=
r **sect_buff_ptr)
+           TIFFError("createImageSection", "Unable to allocate/reallocat=
e section buffer");
+           return (-1);
+       }
+-      _TIFFmemset(sect_buff, 0, sectsize);
++      _TIFFmemset(sect_buff, 0, sectsize + NUM_BUFF_OVERSIZE_BYTES);
+       }
+     }
+=20
+@@ -7611,17 +7635,17 @@ processCropSelections(struct image_data *image, =
struct crop_mask *crop,
+     cropsize =3D crop->bufftotal;
+     crop_buff =3D seg_buffs[0].buffer;=20
+     if (!crop_buff)
+-      crop_buff =3D (unsigned char *)limitMalloc(cropsize);
++      crop_buff =3D (unsigned char *)limitMalloc(cropsize + NUM_BUFF_OV=
ERSIZE_BYTES);
+     else
+       {
+       prev_cropsize =3D seg_buffs[0].size;
+       if (prev_cropsize < cropsize)
+         {
+-        next_buff =3D _TIFFrealloc(crop_buff, cropsize);
++        next_buff =3D _TIFFrealloc(crop_buff, cropsize + NUM_BUFF_OVERS=
IZE_BYTES);
+         if (! next_buff)
+           {
+           _TIFFfree (crop_buff);
+-          crop_buff =3D (unsigned char *)limitMalloc(cropsize);
++          crop_buff =3D (unsigned char *)limitMalloc(cropsize + NUM_BUF=
F_OVERSIZE_BYTES);
+           }
+         else
+           crop_buff =3D next_buff;
+@@ -7634,7 +7658,7 @@ processCropSelections(struct image_data *image, st=
ruct crop_mask *crop,
+       return (-1);
+       }
+ =20
+-    _TIFFmemset(crop_buff, 0, cropsize);
++    _TIFFmemset(crop_buff, 0, cropsize + NUM_BUFF_OVERSIZE_BYTES);
+     seg_buffs[0].buffer =3D crop_buff;
+     seg_buffs[0].size =3D cropsize;
+=20
+@@ -7714,17 +7738,17 @@ processCropSelections(struct image_data *image, =
struct crop_mask *crop,
+         cropsize =3D crop->bufftotal;
+       crop_buff =3D seg_buffs[i].buffer;=20
+       if (!crop_buff)
+-        crop_buff =3D (unsigned char *)limitMalloc(cropsize);
++        crop_buff =3D (unsigned char *)limitMalloc(cropsize + NUM_BUFF_=
OVERSIZE_BYTES);
+       else
+         {
+         prev_cropsize =3D seg_buffs[0].size;
+         if (prev_cropsize < cropsize)
+           {
+-          next_buff =3D _TIFFrealloc(crop_buff, cropsize);
++          next_buff =3D _TIFFrealloc(crop_buff, cropsize + NUM_BUFF_OVE=
RSIZE_BYTES);
+           if (! next_buff)
+             {
+             _TIFFfree (crop_buff);
+-            crop_buff =3D (unsigned char *)limitMalloc(cropsize);
++            crop_buff =3D (unsigned char *)limitMalloc(cropsize + NUM_B=
UFF_OVERSIZE_BYTES);
+             }
+           else
+             crop_buff =3D next_buff;
+@@ -7737,7 +7761,7 @@ processCropSelections(struct image_data *image, st=
ruct crop_mask *crop,
+         return (-1);
+         }
+ =20
+-      _TIFFmemset(crop_buff, 0, cropsize);
++      _TIFFmemset(crop_buff, 0, cropsize + NUM_BUFF_OVERSIZE_BYTES);
+       seg_buffs[i].buffer =3D crop_buff;
+       seg_buffs[i].size =3D cropsize;
+=20
+@@ -7853,24 +7877,24 @@ createCroppedImage(struct image_data *image, str=
uct crop_mask *crop,
+   crop_buff =3D *crop_buff_ptr;
+   if (!crop_buff)
+     {
+-    crop_buff =3D (unsigned char *)limitMalloc(cropsize);
++    crop_buff =3D (unsigned char *)limitMalloc(cropsize + NUM_BUFF_OVER=
SIZE_BYTES);
+     if (!crop_buff)
+     {
+         TIFFError("createCroppedImage", "Unable to allocate/reallocate =
crop buffer");
+         return (-1);
+     }
+-    _TIFFmemset(crop_buff, 0, cropsize);
++    _TIFFmemset(crop_buff, 0, cropsize + NUM_BUFF_OVERSIZE_BYTES);
+     prev_cropsize =3D cropsize;
+     }
+   else
+     {
+     if (prev_cropsize < cropsize)
+       {
+-      new_buff =3D _TIFFrealloc(crop_buff, cropsize);
++      new_buff =3D _TIFFrealloc(crop_buff, cropsize + NUM_BUFF_OVERSIZE=
_BYTES);
+       if (!new_buff)
+         {
+ 	free (crop_buff);
+-        crop_buff =3D (unsigned char *)limitMalloc(cropsize);
++        crop_buff =3D (unsigned char *)limitMalloc(cropsize + NUM_BUFF_=
OVERSIZE_BYTES);
+         }
+       else
+         crop_buff =3D new_buff;
+@@ -7879,7 +7903,7 @@ createCroppedImage(struct image_data *image, struc=
t crop_mask *crop,
+           TIFFError("createCroppedImage", "Unable to allocate/reallocat=
e crop buffer");
+           return (-1);
+       }
+-      _TIFFmemset(crop_buff, 0, cropsize);
++      _TIFFmemset(crop_buff, 0, cropsize + NUM_BUFF_OVERSIZE_BYTES);
+       }
+     }
+=20
+@@ -8177,13 +8201,13 @@ writeCroppedImage(TIFF *in, TIFF *out, struct im=
age_data *image,
+      if (TIFFGetField(in, TIFFTAG_NUMBEROFINKS, &ninks)) {
+        TIFFSetField(out, TIFFTAG_NUMBEROFINKS, ninks);
+        if (TIFFGetField(in, TIFFTAG_INKNAMES, &inknames)) {
+-	 int inknameslen =3D strlen(inknames) + 1;
++	 int inknameslen =3D (int)strlen(inknames) + 1;
+ 	 const char* cp =3D inknames;
+ 	 while (ninks > 1) {
+ 	   cp =3D strchr(cp, '\0');
+ 	   if (cp) {
+ 	     cp++;
+-	     inknameslen +=3D (strlen(cp) + 1);
++	     inknameslen +=3D ((int)strlen(cp) + 1);
+ 	   }
+ 	   ninks--;
+          }
+@@ -8568,13 +8592,13 @@ rotateContigSamples32bits(uint16_t rotation, uin=
t16_t spp, uint16_t bps, uint32_
+         }
+       else /* If we have a full buffer's worth, write it out */
+         {
+-        bytebuff1 =3D (buff2 >> 56);
++        bytebuff1 =3D (uint8_t)(buff2 >> 56);
+         *dst++ =3D bytebuff1;
+-        bytebuff2 =3D (buff2 >> 48);
++        bytebuff2 =3D (uint8_t)(buff2 >> 48);
+         *dst++ =3D bytebuff2;
+-        bytebuff3 =3D (buff2 >> 40);
++        bytebuff3 =3D (uint8_t)(buff2 >> 40);
+         *dst++ =3D bytebuff3;
+-        bytebuff4 =3D (buff2 >> 32);
++        bytebuff4 =3D (uint8_t)(buff2 >> 32);
+         *dst++ =3D bytebuff4;
+         ready_bits -=3D 32;
+                    =20
+@@ -8643,12 +8667,13 @@ rotateImage(uint16_t rotation, struct image_data=
 *image, uint32_t *img_width,
+               return (-1);
+     }
+=20
+-  if (!(rbuff =3D (unsigned char *)limitMalloc(buffsize)))
++  /* Add 3 padding bytes for extractContigSamplesShifted32bits */
++  if (!(rbuff =3D (unsigned char *)limitMalloc(buffsize + NUM_BUFF_OVER=
SIZE_BYTES)))
+     {
+-    TIFFError("rotateImage", "Unable to allocate rotation buffer of %1u=
 bytes", buffsize);
++    TIFFError("rotateImage", "Unable to allocate rotation buffer of %1u=
 bytes", buffsize + NUM_BUFF_OVERSIZE_BYTES);
+     return (-1);
+     }
+-  _TIFFmemset(rbuff, '\0', buffsize);
++  _TIFFmemset(rbuff, '\0', buffsize + NUM_BUFF_OVERSIZE_BYTES);
+=20
+   ibuff =3D *ibuff_ptr;
+   switch (rotation)
+@@ -9176,13 +9201,13 @@ reverseSamples32bits (uint16_t spp, uint16_t bps=
, uint32_t width,
+         }
+       else /* If we have a full buffer's worth, write it out */
+         {
+-        bytebuff1 =3D (buff2 >> 56);
++        bytebuff1 =3D (uint8_t)(buff2 >> 56);
+         *dst++ =3D bytebuff1;
+-        bytebuff2 =3D (buff2 >> 48);
++        bytebuff2 =3D (uint8_t)(buff2 >> 48);
+         *dst++ =3D bytebuff2;
+-        bytebuff3 =3D (buff2 >> 40);
++        bytebuff3 =3D (uint8_t)(buff2 >> 40);
+         *dst++ =3D bytebuff3;
+-        bytebuff4 =3D (buff2 >> 32);
++        bytebuff4 =3D (uint8_t)(buff2 >> 32);
+         *dst++ =3D bytebuff4;
+         ready_bits -=3D 32;
+                    =20
+@@ -9273,12 +9298,13 @@ mirrorImage(uint16_t spp, uint16_t bps, uint16_t=
 mirror, uint32_t width, uint32_
+     {
+     case MIRROR_BOTH:
+     case MIRROR_VERT:=20
+-             line_buff =3D (unsigned char *)limitMalloc(rowsize);
++             line_buff =3D (unsigned char *)limitMalloc(rowsize + NUM_B=
UFF_OVERSIZE_BYTES);
+              if (line_buff =3D=3D NULL)
+                {
+-	       TIFFError ("mirrorImage", "Unable to allocate mirror line buffe=
r of %1u bytes", rowsize);
++	       TIFFError ("mirrorImage", "Unable to allocate mirror line buffe=
r of %1u bytes", rowsize + NUM_BUFF_OVERSIZE_BYTES);
+                return (-1);
+                }
++             _TIFFmemset(line_buff, '\0', rowsize + NUM_BUFF_OVERSIZE_B=
YTES);
+=20
+              dst =3D ibuff + (rowsize * (length - 1));
+              for (row =3D 0; row < length / 2; row++)
+@@ -9310,11 +9336,12 @@ mirrorImage(uint16_t spp, uint16_t bps, uint16_t=
 mirror, uint32_t width, uint32_
+ 		}
+ 	      else
+                 { /* non 8 bit per sample  data */
+-                if (!(line_buff =3D (unsigned char *)limitMalloc(rowsiz=
e + 1)))
++                if (!(line_buff =3D (unsigned char *)limitMalloc(rowsiz=
e + NUM_BUFF_OVERSIZE_BYTES)))
+                   {
+                   TIFFError("mirrorImage", "Unable to allocate mirror l=
ine buffer");
+                   return (-1);
+                   }
++                _TIFFmemset(line_buff, '\0', rowsize + NUM_BUFF_OVERSIZ=
E_BYTES);
+                 bytes_per_sample =3D (bps + 7) / 8;
+                 bytes_per_pixel  =3D ((bps * spp) + 7) / 8;
+                 if (bytes_per_pixel < (bytes_per_sample + 1))
+@@ -9326,7 +9353,7 @@ mirrorImage(uint16_t spp, uint16_t bps, uint16_t m=
irror, uint32_t width, uint32_
+                   {
+ 		  row_offset =3D row * rowsize;
+                   src =3D ibuff + row_offset;
+-                  _TIFFmemset (line_buff, '\0', rowsize);
++                  _TIFFmemset (line_buff, '\0', rowsize + NUM_BUFF_OVER=
SIZE_BYTES);
+                   switch (shift_width)
+                     {
+                     case 1: if (reverseSamples16bits(spp, bps, width, s=
rc, line_buff))
+--=20
+2.34.1
+
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb b/meta/recipes=
-multimedia/libtiff/tiff_4.4.0.bb
index caf6f60479a..29cb4111d61 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.4.0.bb
@@ -12,6 +12,10 @@ SRC_URI =3D "http://download.osgeo.org/libtiff/tiff-${=
PV}.tar.gz \
            file://0001-fix-the-FPE-in-tiffcrop-415-427-and-428.patch \
            file://CVE-2022-34526.patch \
            file://CVE-2022-2953.patch \
+           file://0001-Revised-handling-of-TIFFTAG_INKNAMES-and-related-=
TIF.patch \
+           file://0001-tiffcrop-S-option-Make-decision-simpler.patch \
+           file://0001-tiffcrop-disable-incompatibility-of-Z-X-Y-z-optio=
ns-.patch \
+           file://0001-tiffcrop-subroutines-require-a-larger-buffer-fixe=
s-2.patch \
            "
=20
 SRC_URI[sha256sum] =3D "917223b37538959aca3b790d2d73aa6e626b688e02dcda27=
2aec24c2f498abed"
@@ -25,7 +29,6 @@ CVE_CHECK_IGNORE +=3D "CVE-2015-7313"
 # These issues only affect libtiff post-4.3.0 but before 4.4.0,
 # caused by 3079627e and fixed by b4e79bfa.
 CVE_CHECK_IGNORE +=3D "CVE-2022-1622 CVE-2022-1623"
-
 # Issue is in jbig which we don't enable
 CVE_CHECK_IGNORE +=3D "CVE-2022-1210"
=20
--=20
2.34.1


