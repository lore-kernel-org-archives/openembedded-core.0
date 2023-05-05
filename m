Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00BF9C77B7F
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 15:20:15 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.30226.1683300007309237388
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 08:20:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=pN93TrK6;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-64389a44895so1652535b3a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 08:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683300006; x=1685892006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gP+mebE0hxtmdpleNTmfv0Xebb2/VIP5qla2pMXZijY=;
        b=pN93TrK6SYvuiWQYK0nDeYhSQVo8GHjKSwwJtTULVZZ56nCuk4jy7xnItIwqcNdc6m
         J9zOtEmsBL6D2QryyulInfhYg8mkys51eeTnbEBN1A+yxXQGXKdwpWn2rEDHCntGRwrT
         jSn+h/E9wKxxIppVzK2p46LDi7QIRfQXvHiXqHueYeDEBkAWdZGtuUFV6oHLSbcJuaaY
         ucctO4+xdSX83QPmWzxm1IlerBBskHuw089Zag2ScQeRNn1QffLtowpNc8pExaVeKfJ/
         qU0vlS40oXRChXmL7NHUcqJBRb07rTlY8Dz//ZYHsnZbeso/0FIN755scmguQUGAlP6n
         snVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683300006; x=1685892006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gP+mebE0hxtmdpleNTmfv0Xebb2/VIP5qla2pMXZijY=;
        b=g0NqMzzxAfFyPI3OlJPmkBlrYmzy63EPmzYIiU6n1lokaxp+cOwZXffrSf0yeH124X
         w300hLfnQ1IbklFmwN1TyaUD/+YFhoHUthUmYNFOTDeCdLI8J66dCxYrxn8Cn25Xc1dN
         lkcPoN8/9RoxUeiBKlUvcVDY/Y41DkMlD/IIwQ0Ijf8+MOyKa8xQdV1sxhjGlNljHUIg
         TZ7UcfZiwYQikjBOOBjGRXBdLMao9syZ83zN7PAW3DDTAqvzxfvQe9AeGKAJhnjbtbcC
         bETtx0FpyFn9fTnFxV16ZoOpWCuP3Nd8M5WNax/ToKEclBM2zA+FjbXiGAslbxySFgWT
         Q+QA==
X-Gm-Message-State: AC+VfDw4pdeS073GQI2ZJEbT9RFa6QgDrm5cNcadQ7bNnJDbfHFBuHtc
	JFLI3FJx9AV0XAFRuU1lJfUQttEe3TkXi0jVZbU=
X-Google-Smtp-Source: ACHHUZ4zakKfqrMKA7KyLuI3EA6FsWalVOqgmUV+7IqqDWX1cClXUu1+v1eEkgUOPdgh/cXfSI+QeA==
X-Received: by 2002:a05:6a00:23c3:b0:643:64fb:3b6a with SMTP id g3-20020a056a0023c300b0064364fb3b6amr2823819pfc.13.1683300006143;
        Fri, 05 May 2023 08:20:06 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c11-20020aa78c0b000000b00643864d03dfsm1831591pfd.171.2023.05.05.08.20.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 08:20:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 02/35] tiff: Add fix for CVE-2022-4645
Date: Fri,  5 May 2023 05:19:13 -1000
Message-Id: <2fb604272f6b0c94c5616323ed973918c22b8389.1683299764.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683299764.git.steve@sakoman.com>
References: <cover.1683299764.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 15:20:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180922

From: Pawan Badganchi <Pawan.Badganchi@kpit.com>

Below patch fixes the CVE-2022-4645 as well.

0001-Revised-handling-of-TIFFTAG_INKNAMES-and-related-TIF.patch

Link: https://nvd.nist.gov/vuln/detail/CVE-2022-4645

Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit 312393edf0aa5b2c515c08245d1c289ba79bad55)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...-of-TIFFTAG_INKNAMES-and-related-TIF.patch | 267 ++++++++++++++++++
 1 file changed, 267 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/0001-Revised-handling-of-TIFFTAG_INKNAMES-and-related-TIF.patch

diff --git a/meta/recipes-multimedia/libtiff/files/0001-Revised-handling-of-TIFFTAG_INKNAMES-and-related-TIF.patch b/meta/recipes-multimedia/libtiff/files/0001-Revised-handling-of-TIFFTAG_INKNAMES-and-related-TIF.patch
new file mode 100644
index 0000000000..17b37be041
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/files/0001-Revised-handling-of-TIFFTAG_INKNAMES-and-related-TIF.patch
@@ -0,0 +1,267 @@
+From f00484b9519df933723deb38fff943dc291a793d Mon Sep 17 00:00:00 2001
+From: Su_Laus <sulau@freenet.de>
+Date: Tue, 30 Aug 2022 16:56:48 +0200
+Subject: [PATCH] Revised handling of TIFFTAG_INKNAMES and related
+ TIFFTAG_NUMBEROFINKS value
+
+In order to solve the buffer overflow issues related to TIFFTAG_INKNAMES and related TIFFTAG_NUMBEROFINKS value, a revised handling of those tags within LibTiff is proposed:
+
+Behaviour for writing:
+    `NumberOfInks`  MUST fit to the number of inks in the `InkNames` string.
+    `NumberOfInks` is automatically set when `InkNames` is set.
+    If `NumberOfInks` is different to the number of inks within `InkNames` string, that will be corrected and a warning is issued.
+    If `NumberOfInks` is not equal to samplesperpixel only a warning will be issued.
+
+Behaviour for reading:
+    When reading `InkNames` from a TIFF file, the `NumberOfInks` will be set automatically to the number of inks in `InkNames` string.
+    If `NumberOfInks` is different to the number of inks within `InkNames` string, that will be corrected and a warning is issued.
+    If  `NumberOfInks` is not equal to samplesperpixel only a warning will be issued.
+
+This allows the safe use of the NumberOfInks value to read out the InkNames without buffer overflow
+
+This MR will close the following issues:  #149, #150, #152, #168 (to be checked), #250, #269, #398 and #456.
+
+It also fixes the old bug at http://bugzilla.maptools.org/show_bug.cgi?id=2599, for which the limitation of `NumberOfInks = SPP` was introduced, which is in my opinion not necessary and does not solve the general issue.
+
+CVE: CVE-2022-3599 CVE-2022-4645
+Upstream-Status: Backport [https://gitlab.com/libtiff/libtiff/-/commit/e813112545942107551433d61afd16ac094ff246.patch]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
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
+@@ -136,32 +136,30 @@ setExtraSamples(TIFF* tif, va_list ap, uint32_t* v)
+ }
+ 
+ /*
+- * Confirm we have "samplesperpixel" ink names separated by \0.  Returns 
++ * Count ink names separated by \0.  Returns
+  * zero if the ink names are not as expected.
+  */
+-static uint32_t
+-checkInkNamesString(TIFF* tif, uint32_t slen, const char* s)
++static uint16_t
++countInkNamesString(TIFF *tif, uint32_t slen, const char *s)
+ {
+-	TIFFDirectory* td = &tif->tif_dir;
+-	uint16_t i = td->td_samplesperpixel;
++	uint16_t i = 0;
++	const char *ep = s + slen;
++	const char *cp = s;
+ 
+ 	if (slen > 0) {
+-		const char* ep = s+slen;
+-		const char* cp = s;
+-		for (; i > 0; i--) {
++		do {
+ 			for (; cp < ep && *cp != '\0'; cp++) {}
+ 			if (cp >= ep)
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
+-	    "%s: Invalid InkNames value; expecting %"PRIu16" names, found %"PRIu16,
+-	    tif->tif_name,
+-	    td->td_samplesperpixel,
+-	    (uint16_t)(td->td_samplesperpixel-i));
++		"%s: Invalid InkNames value; no NUL at given buffer end location %"PRIu32", after %"PRIu16" ink",
++		tif->tif_name, slen, i);
+ 	return (0);
+ }
+ 
+@@ -478,13 +476,61 @@ _TIFFVSetField(TIFF* tif, uint32_t tag, va_list ap)
+ 		_TIFFsetFloatArray(&td->td_refblackwhite, va_arg(ap, float*), 6);
+ 		break;
+ 	case TIFFTAG_INKNAMES:
+-		v = (uint16_t) va_arg(ap, uint16_vap);
+-		s = va_arg(ap, char*);
+-		v = checkInkNamesString(tif, v, s);
+-		status = v > 0;
+-		if( v > 0 ) {
+-			_TIFFsetNString(&td->td_inknames, s, v);
+-			td->td_inknameslen = v;
++		{
++			v = (uint16_t) va_arg(ap, uint16_vap);
++			s = va_arg(ap, char*);
++			uint16_t ninksinstring;
++			ninksinstring = countInkNamesString(tif, v, s);
++			status = ninksinstring > 0;
++			if(ninksinstring > 0 ) {
++				_TIFFsetNString(&td->td_inknames, s, v);
++				td->td_inknameslen = v;
++				/* Set NumberOfInks to the value ninksinstring */
++				if (TIFFFieldSet(tif, FIELD_NUMBEROFINKS))
++				{
++					if (td->td_numberofinks != ninksinstring) {
++						TIFFErrorExt(tif->tif_clientdata, module,
++							"Warning %s; Tag %s:\n  Value %"PRIu16" of NumberOfInks is different from the number of inks %"PRIu16".\n  -> NumberOfInks value adapted to %"PRIu16"",
++							tif->tif_name, fip->field_name, td->td_numberofinks, ninksinstring, ninksinstring);
++						td->td_numberofinks = ninksinstring;
++					}
++				} else {
++					td->td_numberofinks = ninksinstring;
++					TIFFSetFieldBit(tif, FIELD_NUMBEROFINKS);
++				}
++				if (TIFFFieldSet(tif, FIELD_SAMPLESPERPIXEL))
++				{
++					if (td->td_numberofinks != td->td_samplesperpixel) {
++						TIFFErrorExt(tif->tif_clientdata, module,
++							"Warning %s; Tag %s:\n  Value %"PRIu16" of NumberOfInks is different from the SamplesPerPixel value %"PRIu16"",
++							tif->tif_name, fip->field_name, td->td_numberofinks, td->td_samplesperpixel);
++					}
++				}
++			}
++		}
++		break;
++	case TIFFTAG_NUMBEROFINKS:
++		v = (uint16_t)va_arg(ap, uint16_vap);
++		/* If InkNames already set also NumberOfInks is set accordingly and should be equal */
++		if (TIFFFieldSet(tif, FIELD_INKNAMES))
++		{
++			if (v != td->td_numberofinks) {
++				TIFFErrorExt(tif->tif_clientdata, module,
++					"Error %s; Tag %s:\n  It is not possible to set the value %"PRIu32" for NumberOfInks\n  which is different from the number of inks in the InkNames tag (%"PRIu16")",
++					tif->tif_name, fip->field_name, v, td->td_numberofinks);
++				/* Do not set / overwrite number of inks already set by InkNames case accordingly. */
++				status = 0;
++			}
++		} else {
++			td->td_numberofinks = (uint16_t)v;
++			if (TIFFFieldSet(tif, FIELD_SAMPLESPERPIXEL))
++			{
++				if (td->td_numberofinks != td->td_samplesperpixel) {
++					TIFFErrorExt(tif->tif_clientdata, module,
++						"Warning %s; Tag %s:\n  Value %"PRIu32" of NumberOfInks is different from the SamplesPerPixel value %"PRIu16"",
++						tif->tif_name, fip->field_name, v, td->td_samplesperpixel);
++				}
++			}
+ 		}
+ 		break;
+ 	case TIFFTAG_PERSAMPLE:
+@@ -986,34 +1032,6 @@ _TIFFVGetField(TIFF* tif, uint32_t tag, va_list ap)
+ 	if (fip->field_bit == FIELD_CUSTOM) {
+ 		standard_tag = 0;
+ 	}
+-	
+-        if( standard_tag == TIFFTAG_NUMBEROFINKS )
+-        {
+-            int i;
+-            for (i = 0; i < td->td_customValueCount; i++) {
+-                uint16_t val;
+-                TIFFTagValue *tv = td->td_customValues + i;
+-                if (tv->info->field_tag != standard_tag)
+-                    continue;
+-                if( tv->value == NULL )
+-                    return 0;
+-                val = *(uint16_t *)tv->value;
+-                /* Truncate to SamplesPerPixel, since the */
+-                /* setting code for INKNAMES assume that there are SamplesPerPixel */
+-                /* inknames. */
+-                /* Fixes http://bugzilla.maptools.org/show_bug.cgi?id=2599 */
+-                if( val > td->td_samplesperpixel )
+-                {
+-                    TIFFWarningExt(tif->tif_clientdata,"_TIFFVGetField",
+-                                   "Truncating NumberOfInks from %u to %"PRIu16,
+-                                   val, td->td_samplesperpixel);
+-                    val = td->td_samplesperpixel;
+-                }
+-                *va_arg(ap, uint16_t*) = val;
+-                return 1;
+-            }
+-            return 0;
+-        }
+ 
+ 	switch (standard_tag) {
+ 		case TIFFTAG_SUBFILETYPE:
+@@ -1195,6 +1213,9 @@ _TIFFVGetField(TIFF* tif, uint32_t tag, va_list ap)
+ 		case TIFFTAG_INKNAMES:
+ 			*va_arg(ap, const char**) = td->td_inknames;
+ 			break;
++		case TIFFTAG_NUMBEROFINKS:
++			*va_arg(ap, uint16_t *) = td->td_numberofinks;
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
++	uint16_t td_numberofinks;                 /* number of inks in InkNames string */
+ 
+ 	int     td_customValueCount;
+         TIFFTagValue *td_customValues;
+@@ -174,6 +175,7 @@ typedef struct {
+ #define FIELD_TRANSFERFUNCTION         44
+ #define FIELD_INKNAMES                 46
+ #define FIELD_SUBIFD                   49
++#define FIELD_NUMBEROFINKS             50
+ /*      FIELD_CUSTOM (see tiffio.h)    65 */
+ /* end of support for well-known tags; codec-private tags follow */
+ #define FIELD_CODEC                    66  /* base of codec-private tags */
+diff --git a/libtiff/tif_dirinfo.c b/libtiff/tif_dirinfo.c
+index 3371cb5c..3b4bcd33 100644
+--- a/libtiff/tif_dirinfo.c
++++ b/libtiff/tif_dirinfo.c
+@@ -114,7 +114,7 @@ tiffFields[] = {
+ 	{ TIFFTAG_SUBIFD, -1, -1, TIFF_IFD8, 0, TIFF_SETGET_C16_IFD8, TIFF_SETGET_UNDEFINED, FIELD_SUBIFD, 1, 1, "SubIFD", (TIFFFieldArray*) &tiffFieldArray },
+ 	{ TIFFTAG_INKSET, 1, 1, TIFF_SHORT, 0, TIFF_SETGET_UINT16, TIFF_SETGET_UNDEFINED, FIELD_CUSTOM, 0, 0, "InkSet", NULL },
+ 	{ TIFFTAG_INKNAMES, -1, -1, TIFF_ASCII, 0, TIFF_SETGET_C16_ASCII, TIFF_SETGET_UNDEFINED, FIELD_INKNAMES, 1, 1, "InkNames", NULL },
+-	{ TIFFTAG_NUMBEROFINKS, 1, 1, TIFF_SHORT, 0, TIFF_SETGET_UINT16, TIFF_SETGET_UNDEFINED, FIELD_CUSTOM, 1, 0, "NumberOfInks", NULL },
++	{ TIFFTAG_NUMBEROFINKS, 1, 1, TIFF_SHORT, 0, TIFF_SETGET_UINT16, TIFF_SETGET_UNDEFINED, FIELD_NUMBEROFINKS, 1, 0, "NumberOfInks", NULL },
+ 	{ TIFFTAG_DOTRANGE, 2, 2, TIFF_SHORT, 0, TIFF_SETGET_UINT16_PAIR, TIFF_SETGET_UNDEFINED, FIELD_CUSTOM, 0, 0, "DotRange", NULL },
+ 	{ TIFFTAG_TARGETPRINTER, -1, -1, TIFF_ASCII, 0, TIFF_SETGET_ASCII, TIFF_SETGET_UNDEFINED, FIELD_CUSTOM, 1, 0, "TargetPrinter", NULL },
+ 	{ TIFFTAG_EXTRASAMPLES, -1, -1, TIFF_SHORT, 0, TIFF_SETGET_C16_UINT16, TIFF_SETGET_UNDEFINED, FIELD_EXTRASAMPLES, 0, 1, "ExtraSamples", NULL },
+diff --git a/libtiff/tif_dirwrite.c b/libtiff/tif_dirwrite.c
+index 6c86fdca..062e4610 100644
+--- a/libtiff/tif_dirwrite.c
++++ b/libtiff/tif_dirwrite.c
+@@ -626,6 +626,11 @@ TIFFWriteDirectorySec(TIFF* tif, int isimage, int imagedone, uint64_t* pdiroff)
+ 				if (!TIFFWriteDirectoryTagAscii(tif,&ndir,dir,TIFFTAG_INKNAMES,tif->tif_dir.td_inknameslen,tif->tif_dir.td_inknames))
+ 					goto bad;
+ 			}
++			if (TIFFFieldSet(tif, FIELD_NUMBEROFINKS))
++			{
++				if (!TIFFWriteDirectoryTagShort(tif, &ndir, dir, TIFFTAG_NUMBEROFINKS, tif->tif_dir.td_numberofinks))
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
+-- 
+2.34.1
+
-- 
2.34.1


