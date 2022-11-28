Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C45BC4321E
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 19:02:02 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.127343.1669662119561327438
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Nov 2022 11:02:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ItBjCYdA;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id o30so9230742wms.2
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 11:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pMqUKwPnf6D+0mboxXeM9vhBbhlVGwdGHBAHoYyQQe0=;
        b=ItBjCYdAro0y0pLnM4mMZy0TV6YA0M1h+3CDXq2t69MM9GovZdTwShp/2Jt7YO0PMW
         EUd9v2zo67d21LGeBbHzl7I8ysPl/G9Z/g+xHc+ElcFZXJTZ6zz0fi135JFWVpbOx+X2
         lw1ieExnfHO2KnT6AUGMgUJjpj+GUJh5LlSONKV8JmQGySmJ7xTLnFlestJhKapikT9q
         /IEHBqbhj3ezgUnXklew4csuq0Wc9xzPKtPNeoeCyGVcMFXYJJM8wupRmPO5LIJNmbi0
         b8J6ZqJ4ItJTFD0HRuy7jctfK99tRLsj1DvUXDRfm4vwdenKUCAJJDxv8dgBRbOon208
         tpsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pMqUKwPnf6D+0mboxXeM9vhBbhlVGwdGHBAHoYyQQe0=;
        b=f4ovYBHIcIfG5kJvGJQDkQXqiOPJhz6SCtbn+/kDgIJsA9t0ZGGViEUXlobKbrc9c2
         YtOO/qEYTFC3s+nPTSY6kTK5O+R9W0Re2140FsUUfyrNSJ7hFCL/Sm5J8PJ1DJgBeZ1f
         dgkPgRAWaIRFQAZVQuEodOHkOpME1M2Uq3oTJR3nSPUsXDDXNXsQGdxSmdo+vYvdQUQn
         bzgwdlxx6+Uc6U+wVyGY89J9Hyl5Qq9GOxjFdLywqXxee0ne4gOsdxli6D62LS7ZfmvP
         h9/No1HZg3sYYnoqGDeyHo3PMSyhgqZ+uj5F2yPKAWhHU4aZ2bnpQ9/6oKxvf5rDx5ig
         L8Vw==
X-Gm-Message-State: ANoB5pmefEvzjuvFETpfR3tU3J42RPKvC1n8XNIQSQrDCW8sYpkl/Dja
	vcg3eecgNt76nznl677SSXt0G7hRnuo=
X-Google-Smtp-Source: AA0mqf7WRfHwgfi55/toE94MPDWk3s2U0f/Deoz8qP2XCo6CYq8dNntIt1mn7ahFduvUDho/+L8uzQ==
X-Received: by 2002:a05:600c:4148:b0:3cf:5657:3791 with SMTP id h8-20020a05600c414800b003cf56573791mr27900158wmm.34.1669662117681;
        Mon, 28 Nov 2022 11:01:57 -0800 (PST)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id z14-20020a7bc7ce000000b003cf78aafdd7sm15483606wmk.39.2022.11.28.11.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 11:01:57 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Ross Burton <ross.burton@arm.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH][kirkstone 2/3] tiff: fix a number of CVEs
Date: Mon, 28 Nov 2022 20:01:52 +0100
Message-Id: <20221128190153.2155592-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221128190153.2155592-1-Martin.Jansa@gmail.com>
References: <20221128190153.2155592-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 19:02:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173940

From: Ross Burton <ross.burton@arm.com>

Backport fixes from upstream for the following CVEs:
- CVE-2022-3599
- CVE-2022-3597
- CVE-2022-3626
- CVE-2022-3627
- CVE-2022-3570
- CVE-2022-3598

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...-of-TIFFTAG_INKNAMES-and-related-TIF.patch | 266 ++++++++
 ...fcrop-S-option-Make-decision-simpler.patch |  36 +
 ...-incompatibility-of-Z-X-Y-z-options-.patch |  59 ++
 ...ines-require-a-larger-buffer-fixes-2.patch | 640 ++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |   5 +-
 5 files changed, 1005 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/0001-Revised-handling-of-TIFFTAG_INKNAMES-and-related-TIF.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/0001-tiffcrop-S-option-Make-decision-simpler.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/0001-tiffcrop-disable-incompatibility-of-Z-X-Y-z-options-.patch
 create mode 100644 meta/recipes-multimedia/libtiff/tiff/0001-tiffcrop-subroutines-require-a-larger-buffer-fixes-2.patch

diff --git a/meta/recipes-multimedia/libtiff/tiff/0001-Revised-handling-of-TIFFTAG_INKNAMES-and-related-TIF.patch b/meta/recipes-multimedia/libtiff/tiff/0001-Revised-handling-of-TIFFTAG_INKNAMES-and-related-TIF.patch
new file mode 100644
index 0000000000..37859c9192
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/0001-Revised-handling-of-TIFFTAG_INKNAMES-and-related-TIF.patch
@@ -0,0 +1,266 @@
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
+CVE: CVE-2022-3599
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
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
diff --git a/meta/recipes-multimedia/libtiff/tiff/0001-tiffcrop-S-option-Make-decision-simpler.patch b/meta/recipes-multimedia/libtiff/tiff/0001-tiffcrop-S-option-Make-decision-simpler.patch
new file mode 100644
index 0000000000..79b4ff3f6e
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/0001-tiffcrop-S-option-Make-decision-simpler.patch
@@ -0,0 +1,36 @@
+From bad48e90b410df32172006c7876da449ba62cdba Mon Sep 17 00:00:00 2001
+From: Su_Laus <sulau@freenet.de>
+Date: Sat, 20 Aug 2022 23:35:26 +0200
+Subject: [PATCH] tiffcrop -S option: Make decision simpler.
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+---
+ tools/tiffcrop.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index c3b758ec..8fd856dc 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -2133,11 +2133,11 @@ void  process_command_opts (int argc, char *argv[], char *mp, char *mode, uint32
+     }
+     /*-- Check for not allowed combinations (e.g. -X, -Y and -Z, -z and -S are mutually exclusive) --*/
+     char XY, Z, R, S;
+-    XY = ((crop_data->crop_mode & CROP_WIDTH) || (crop_data->crop_mode & CROP_LENGTH));
+-    Z = (crop_data->crop_mode & CROP_ZONES);
+-    R = (crop_data->crop_mode & CROP_REGIONS);
+-    S = (page->mode & PAGE_MODE_ROWSCOLS);
+-    if ((XY && Z) || (XY && R) || (XY && S) || (Z && R) || (Z && S) || (R && S)) {
++    XY = ((crop_data->crop_mode & CROP_WIDTH) || (crop_data->crop_mode & CROP_LENGTH)) ? 1 : 0;
++    Z = (crop_data->crop_mode & CROP_ZONES) ? 1 : 0;
++    R = (crop_data->crop_mode & CROP_REGIONS) ? 1 : 0;
++    S = (page->mode & PAGE_MODE_ROWSCOLS) ? 1 : 0;
++    if (XY + Z + R + S > 1) {
+         TIFFError("tiffcrop input error", "The crop options(-X|-Y), -Z, -z and -S are mutually exclusive.->Exit");
+         exit(EXIT_FAILURE);
+     }
+-- 
+2.34.1
+
diff --git a/meta/recipes-multimedia/libtiff/tiff/0001-tiffcrop-disable-incompatibility-of-Z-X-Y-z-options-.patch b/meta/recipes-multimedia/libtiff/tiff/0001-tiffcrop-disable-incompatibility-of-Z-X-Y-z-options-.patch
new file mode 100644
index 0000000000..6a62787648
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/0001-tiffcrop-disable-incompatibility-of-Z-X-Y-z-options-.patch
@@ -0,0 +1,59 @@
+From 4746f16253b784287bc8a5003990c1c3b9a03a62 Mon Sep 17 00:00:00 2001
+From: Su_Laus <sulau@freenet.de>
+Date: Thu, 25 Aug 2022 16:11:41 +0200
+Subject: [PATCH] tiffcrop: disable incompatibility of -Z, -X, -Y, -z options
+ with any PAGE_MODE_x option (fixes #411 and #413)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+tiffcrop does not support –Z, -z, -X and –Y options together with any other PAGE_MODE_x options like  -H, -V, -P, -J, -K or –S.
+
+Code analysis:
+
+With the options –Z, -z, the crop.selections are set to a value > 0. Within main(), this triggers the call of processCropSelections(), which copies the sections from the read_buff into seg_buffs[].
+In the following code in main(), the only supported step, where that seg_buffs are further handled are within an if-clause with  if (page.mode == PAGE_MODE_NONE) .
+
+Execution of the else-clause often leads to buffer-overflows.
+
+Therefore, the above option combination is not supported and will be disabled to prevent those buffer-overflows.
+
+The MR solves issues #411 and #413.
+
+CVE: CVE-2022-3597 CVE-2022-3626 CVE-2022-3627
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ doc/tools/tiffcrop.rst |  8 ++++++++
+ tools/tiffcrop.c       | 32 +++++++++++++++++++++++++-------
+ 2 files changed, 33 insertions(+), 7 deletions(-)
+
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index 8fd856dc..41a2ea36 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -2138,9 +2143,20 @@ void  process_command_opts (int argc, char *argv[], char *mp, char *mode, uint32
+     R = (crop_data->crop_mode & CROP_REGIONS) ? 1 : 0;
+     S = (page->mode & PAGE_MODE_ROWSCOLS) ? 1 : 0;
+     if (XY + Z + R + S > 1) {
+-        TIFFError("tiffcrop input error", "The crop options(-X|-Y), -Z, -z and -S are mutually exclusive.->Exit");
++        TIFFError("tiffcrop input error", "The crop options(-X|-Y), -Z, -z and -S are mutually exclusive.->exit");
+         exit(EXIT_FAILURE);
+     }
++
++    /* Check for not allowed combination:
++     * Any of the -X, -Y, -Z and -z options together with other PAGE_MODE_x options
++     * such as -H, -V, -P, -J or -K are not supported and may cause buffer overflows.
++.    */
++    if ((XY + Z + R > 0) && page->mode != PAGE_MODE_NONE) {
++        TIFFError("tiffcrop input error",
++            "Any of the crop options -X, -Y, -Z and -z together with other PAGE_MODE_x options such as - H, -V, -P, -J or -K is not supported and may cause buffer overflows..->exit");
++        exit(EXIT_FAILURE);
++    }
++
+   }  /* end process_command_opts */
+ 
+ /* Start a new output file if one has not been previously opened or
+-- 
+2.34.1
+
diff --git a/meta/recipes-multimedia/libtiff/tiff/0001-tiffcrop-subroutines-require-a-larger-buffer-fixes-2.patch b/meta/recipes-multimedia/libtiff/tiff/0001-tiffcrop-subroutines-require-a-larger-buffer-fixes-2.patch
new file mode 100644
index 0000000000..e10e37ccc9
--- /dev/null
+++ b/meta/recipes-multimedia/libtiff/tiff/0001-tiffcrop-subroutines-require-a-larger-buffer-fixes-2.patch
@@ -0,0 +1,640 @@
+From 1e000b3484808f1ee7a68bd276220d1cd82dec73 Mon Sep 17 00:00:00 2001
+From: Su Laus <sulau@freenet.de>
+Date: Thu, 13 Oct 2022 14:33:27 +0000
+Subject: [PATCH] tiffcrop subroutines require a larger buffer (fixes #271,
+ #381, #386, #388, #389, #435)
+
+CVE: CVE-2022-3570 CVE-2022-3598
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ tools/tiffcrop.c | 203 ++++++++++++++++++++++++++---------------------
+ 1 file changed, 114 insertions(+), 89 deletions(-)
+
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
+index f96c7d60..adf0f849 100644
+--- a/tools/tiffcrop.c
++++ b/tools/tiffcrop.c
+@@ -210,6 +210,10 @@ static   char tiffcrop_rev_date[] = "02-09-2022";
+ 
+ #define TIFF_DIR_MAX  65534
+ 
++/* Some conversion subroutines require image buffers, which are at least 3 bytes
++ * larger than the necessary size for the image itself. */
++#define NUM_BUFF_OVERSIZE_BYTES   3
++
+ /* Offsets into buffer for margins and fixed width and length segments */
+ struct offset {
+   uint32_t  tmargin;
+@@ -231,7 +235,7 @@ struct offset {
+  */
+ 
+ struct  buffinfo {
+-  uint32_t size;           /* size of this buffer */
++  size_t size;           /* size of this buffer */
+   unsigned char *buffer; /* address of the allocated buffer */
+ };
+ 
+@@ -805,8 +809,8 @@ static int readContigTilesIntoBuffer (TIFF* in, uint8_t* buf,
+   uint32_t dst_rowsize, shift_width;
+   uint32_t bytes_per_sample, bytes_per_pixel;
+   uint32_t trailing_bits, prev_trailing_bits;
+-  uint32_t tile_rowsize  = TIFFTileRowSize(in);
+-  uint32_t src_offset, dst_offset;
++  tmsize_t tile_rowsize  = TIFFTileRowSize(in);
++  tmsize_t src_offset, dst_offset;
+   uint32_t row_offset, col_offset;
+   uint8_t *bufp = (uint8_t*) buf;
+   unsigned char *src = NULL;
+@@ -856,7 +860,7 @@ static int readContigTilesIntoBuffer (TIFF* in, uint8_t* buf,
+       TIFFError("readContigTilesIntoBuffer", "Integer overflow when calculating buffer size.");
+       exit(EXIT_FAILURE);
+   }
+-  tilebuf = limitMalloc(tile_buffsize + 3);
++  tilebuf = limitMalloc(tile_buffsize + NUM_BUFF_OVERSIZE_BYTES);
+   if (tilebuf == 0)
+     return 0;
+   tilebuf[tile_buffsize] = 0;
+@@ -1019,7 +1023,7 @@ static int  readSeparateTilesIntoBuffer (TIFF* in, uint8_t *obuf,
+   for (sample = 0; (sample < spp) && (sample < MAX_SAMPLES); sample++)
+     {
+     srcbuffs[sample] = NULL;
+-    tbuff = (unsigned char *)limitMalloc(tilesize + 8);
++    tbuff = (unsigned char *)limitMalloc(tilesize + NUM_BUFF_OVERSIZE_BYTES);
+     if (!tbuff)
+       {
+       TIFFError ("readSeparateTilesIntoBuffer", 
+@@ -1213,7 +1217,8 @@ writeBufferToSeparateStrips (TIFF* out, uint8_t* buf,
+   }
+   rowstripsize = rowsperstrip * bytes_per_sample * (width + 1); 
+ 
+-  obuf = limitMalloc (rowstripsize);
++  /* Add 3 padding bytes for extractContigSamples32bits */
++  obuf = limitMalloc (rowstripsize + NUM_BUFF_OVERSIZE_BYTES);
+   if (obuf == NULL)
+     return 1;
+   
+@@ -1226,7 +1231,7 @@ writeBufferToSeparateStrips (TIFF* out, uint8_t* buf,
+       stripsize = TIFFVStripSize(out, nrows);
+       src = buf + (row * rowsize);
+       total_bytes += stripsize;
+-      memset (obuf, '\0', rowstripsize);
++      memset (obuf, '\0',rowstripsize + NUM_BUFF_OVERSIZE_BYTES);
+       if (extractContigSamplesToBuffer(obuf, src, nrows, width, s, spp, bps, dump))
+         {
+         _TIFFfree(obuf);
+@@ -1234,10 +1239,15 @@ writeBufferToSeparateStrips (TIFF* out, uint8_t* buf,
+ 	}
+       if ((dump->outfile != NULL) && (dump->level == 1))
+         {
+-        dump_info(dump->outfile, dump->format,"", 
++          if (scanlinesize > 0x0ffffffffULL) {
++              dump_info(dump->infile, dump->format, "loadImage",
++                  "Attention: scanlinesize %"PRIu64" is larger than UINT32_MAX.\nFollowing dump might be wrong.",
++                  scanlinesize);
++          }
++          dump_info(dump->outfile, dump->format,"",
+                   "Sample %2d, Strip: %2d, bytes: %4d, Row %4d, bytes: %4d, Input offset: %6d", 
+-                  s + 1, strip + 1, stripsize, row + 1, scanlinesize, src - buf);
+-        dump_buffer(dump->outfile, dump->format, nrows, scanlinesize, row, obuf);
++                  s + 1, strip + 1, stripsize, row + 1, (uint32_t)scanlinesize, src - buf);
++        dump_buffer(dump->outfile, dump->format, nrows, (uint32_t)scanlinesize, row, obuf);
+ 	}
+ 
+       if (TIFFWriteEncodedStrip(out, strip++, obuf, stripsize) < 0)
+@@ -1264,7 +1274,7 @@ static int writeBufferToContigTiles (TIFF* out, uint8_t* buf, uint32_t imageleng
+   uint32_t tl, tw;
+   uint32_t row, col, nrow, ncol;
+   uint32_t src_rowsize, col_offset;
+-  uint32_t tile_rowsize  = TIFFTileRowSize(out);
++  tmsize_t tile_rowsize  = TIFFTileRowSize(out);
+   uint8_t* bufp = (uint8_t*) buf;
+   tsize_t tile_buffsize = 0;
+   tsize_t tilesize = TIFFTileSize(out);
+@@ -1307,9 +1317,11 @@ static int writeBufferToContigTiles (TIFF* out, uint8_t* buf, uint32_t imageleng
+   }
+   src_rowsize = ((imagewidth * spp * bps) + 7U) / 8;
+ 
+-  tilebuf = limitMalloc(tile_buffsize);
++  /* Add 3 padding bytes for extractContigSamples32bits */
++  tilebuf = limitMalloc(tile_buffsize + NUM_BUFF_OVERSIZE_BYTES);
+   if (tilebuf == 0)
+     return 1;
++  memset(tilebuf, 0, tile_buffsize + NUM_BUFF_OVERSIZE_BYTES);
+   for (row = 0; row < imagelength; row += tl)
+     {
+     nrow = (row + tl > imagelength) ? imagelength - row : tl;
+@@ -1355,7 +1367,8 @@ static int writeBufferToSeparateTiles (TIFF* out, uint8_t* buf, uint32_t imagele
+                                        uint32_t imagewidth, tsample_t spp,
+                                        struct dump_opts * dump)
+   {
+-  tdata_t obuf = limitMalloc(TIFFTileSize(out));
++  /* Add 3 padding bytes for extractContigSamples32bits */
++  tdata_t obuf = limitMalloc(TIFFTileSize(out) + NUM_BUFF_OVERSIZE_BYTES);
+   uint32_t tl, tw;
+   uint32_t row, col, nrow, ncol;
+   uint32_t src_rowsize, col_offset;
+@@ -1365,6 +1378,7 @@ static int writeBufferToSeparateTiles (TIFF* out, uint8_t* buf, uint32_t imagele
+ 
+   if (obuf == NULL)
+     return 1;
++  memset(obuf, 0, TIFFTileSize(out) + NUM_BUFF_OVERSIZE_BYTES);
+ 
+   if( !TIFFGetField(out, TIFFTAG_TILELENGTH, &tl) ||
+       !TIFFGetField(out, TIFFTAG_TILEWIDTH, &tw) ||
+@@ -1790,14 +1804,14 @@ void  process_command_opts (int argc, char *argv[], char *mp, char *mode, uint32
+                       
+                     *opt_offset = '\0';
+                     /* convert option to lowercase */
+-                    end = strlen (opt_ptr);
++                    end = (unsigned int)strlen (opt_ptr);
+                     for (i = 0; i < end; i++)
+                       *(opt_ptr + i) = tolower((int) *(opt_ptr + i));
+                     /* Look for dump format specification */
+                     if (strncmp(opt_ptr, "for", 3) == 0)
+                       {
+ 		      /* convert value to lowercase */
+-                      end = strlen (opt_offset + 1);
++                      end = (unsigned int)strlen (opt_offset + 1);
+                       for (i = 1; i <= end; i++)
+                         *(opt_offset + i) = tolower((int) *(opt_offset + i));
+                       /* check dump format value */
+@@ -2270,6 +2284,8 @@ main(int argc, char* argv[])
+   size_t length;
+   char   temp_filename[PATH_MAX + 16]; /* Extra space keeps the compiler from complaining */
+ 
++  assert(NUM_BUFF_OVERSIZE_BYTES >= 3);
++
+   little_endian = *((unsigned char *)&little_endian) & '1';
+ 
+   initImageData(&image);
+@@ -3222,13 +3238,13 @@ extractContigSamples32bits (uint8_t *in, uint8_t *out, uint32_t cols,
+       /* If we have a full buffer's worth, write it out */
+       if (ready_bits >= 32)
+         {
+-        bytebuff1 = (buff2 >> 56);
++        bytebuff1 = (uint8_t)(buff2 >> 56);
+         *dst++ = bytebuff1;
+-        bytebuff2 = (buff2 >> 48);
++        bytebuff2 = (uint8_t)(buff2 >> 48);
+         *dst++ = bytebuff2;
+-        bytebuff3 = (buff2 >> 40);
++        bytebuff3 = (uint8_t)(buff2 >> 40);
+         *dst++ = bytebuff3;
+-        bytebuff4 = (buff2 >> 32);
++        bytebuff4 = (uint8_t)(buff2 >> 32);
+         *dst++ = bytebuff4;
+         ready_bits -= 32;
+                     
+@@ -3637,13 +3653,13 @@ extractContigSamplesShifted32bits (uint8_t *in, uint8_t *out, uint32_t cols,
+         }
+       else  /* If we have a full buffer's worth, write it out */
+         {
+-        bytebuff1 = (buff2 >> 56);
++        bytebuff1 = (uint8_t)(buff2 >> 56);
+         *dst++ = bytebuff1;
+-        bytebuff2 = (buff2 >> 48);
++        bytebuff2 = (uint8_t)(buff2 >> 48);
+         *dst++ = bytebuff2;
+-        bytebuff3 = (buff2 >> 40);
++        bytebuff3 = (uint8_t)(buff2 >> 40);
+         *dst++ = bytebuff3;
+-        bytebuff4 = (buff2 >> 32);
++        bytebuff4 = (uint8_t)(buff2 >> 32);
+         *dst++ = bytebuff4;
+         ready_bits -= 32;
+                     
+@@ -3820,10 +3836,10 @@ extractContigSamplesToTileBuffer(uint8_t *out, uint8_t *in, uint32_t rows, uint3
+ static int readContigStripsIntoBuffer (TIFF* in, uint8_t* buf)
+ {
+         uint8_t* bufp = buf;
+-        int32_t  bytes_read = 0;
++        tmsize_t  bytes_read = 0;
+         uint32_t strip, nstrips   = TIFFNumberOfStrips(in);
+-        uint32_t stripsize = TIFFStripSize(in);
+-        uint32_t rows = 0;
++        tmsize_t stripsize = TIFFStripSize(in);
++        tmsize_t rows = 0;
+         uint32_t rps = TIFFGetFieldDefaulted(in, TIFFTAG_ROWSPERSTRIP, &rps);
+         tsize_t scanline_size = TIFFScanlineSize(in);
+ 
+@@ -3836,11 +3852,11 @@ static int readContigStripsIntoBuffer (TIFF* in, uint8_t* buf)
+                 bytes_read = TIFFReadEncodedStrip (in, strip, bufp, -1);
+                 rows = bytes_read / scanline_size;
+                 if ((strip < (nstrips - 1)) && (bytes_read != (int32_t)stripsize))
+-                        TIFFError("", "Strip %"PRIu32": read %"PRId32" bytes, strip size %"PRIu32,
++                        TIFFError("", "Strip %"PRIu32": read %"PRId64" bytes, strip size %"PRIu64,
+                                   strip + 1, bytes_read, stripsize);
+ 
+                 if (bytes_read < 0 && !ignore) {
+-                        TIFFError("", "Error reading strip %"PRIu32" after %"PRIu32" rows",
++                        TIFFError("", "Error reading strip %"PRIu32" after %"PRIu64" rows",
+                                   strip, rows);
+                         return 0;
+                 }
+@@ -4305,13 +4321,13 @@ combineSeparateSamples32bits (uint8_t *in[], uint8_t *out, uint32_t cols,
+ 	/* If we have a full buffer's worth, write it out */
+ 	if (ready_bits >= 32)
+ 	  {
+-	  bytebuff1 = (buff2 >> 56);
++	  bytebuff1 = (uint8_t)(buff2 >> 56);
+ 	  *dst++ = bytebuff1;
+-	  bytebuff2 = (buff2 >> 48);
++	  bytebuff2 = (uint8_t)(buff2 >> 48);
+ 	  *dst++ = bytebuff2;
+-	  bytebuff3 = (buff2 >> 40);
++	  bytebuff3 = (uint8_t)(buff2 >> 40);
+ 	  *dst++ = bytebuff3;
+-	  bytebuff4 = (buff2 >> 32);
++	  bytebuff4 = (uint8_t)(buff2 >> 32);
+ 	  *dst++ = bytebuff4;
+ 	  ready_bits -= 32;
+                     
+@@ -4354,10 +4370,10 @@ combineSeparateSamples32bits (uint8_t *in[], uint8_t *out, uint32_t cols,
+ 	         "Row %3d, Col %3d, Src byte offset %3d  bit offset %2d  Dst offset %3d",
+ 		 row + 1, col + 1, src_byte, src_bit, dst - out);
+ 
+-      dump_long (dumpfile, format, "Match bits ", matchbits);
++      dump_wide (dumpfile, format, "Match bits ", matchbits);
+       dump_data (dumpfile, format, "Src   bits ", src, 4);
+-      dump_long (dumpfile, format, "Buff1 bits ", buff1);
+-      dump_long (dumpfile, format, "Buff2 bits ", buff2);
++      dump_wide (dumpfile, format, "Buff1 bits ", buff1);
++      dump_wide (dumpfile, format, "Buff2 bits ", buff2);
+       dump_byte (dumpfile, format, "Write bits1", bytebuff1);
+       dump_byte (dumpfile, format, "Write bits2", bytebuff2);
+       dump_info (dumpfile, format, "", "Ready bits:  %2d", ready_bits); 
+@@ -4830,13 +4846,13 @@ combineSeparateTileSamples32bits (uint8_t *in[], uint8_t *out, uint32_t cols,
+ 	/* If we have a full buffer's worth, write it out */
+ 	if (ready_bits >= 32)
+ 	  {
+-	  bytebuff1 = (buff2 >> 56);
++	  bytebuff1 = (uint8_t)(buff2 >> 56);
+ 	  *dst++ = bytebuff1;
+-	  bytebuff2 = (buff2 >> 48);
++	  bytebuff2 = (uint8_t)(buff2 >> 48);
+ 	  *dst++ = bytebuff2;
+-	  bytebuff3 = (buff2 >> 40);
++	  bytebuff3 = (uint8_t)(buff2 >> 40);
+ 	  *dst++ = bytebuff3;
+-	  bytebuff4 = (buff2 >> 32);
++	  bytebuff4 = (uint8_t)(buff2 >> 32);
+ 	  *dst++ = bytebuff4;
+ 	  ready_bits -= 32;
+                     
+@@ -4879,10 +4895,10 @@ combineSeparateTileSamples32bits (uint8_t *in[], uint8_t *out, uint32_t cols,
+ 	         "Row %3d, Col %3d, Src byte offset %3d  bit offset %2d  Dst offset %3d",
+ 		 row + 1, col + 1, src_byte, src_bit, dst - out);
+ 
+-      dump_long (dumpfile, format, "Match bits ", matchbits);
++      dump_wide (dumpfile, format, "Match bits ", matchbits);
+       dump_data (dumpfile, format, "Src   bits ", src, 4);
+-      dump_long (dumpfile, format, "Buff1 bits ", buff1);
+-      dump_long (dumpfile, format, "Buff2 bits ", buff2);
++      dump_wide (dumpfile, format, "Buff1 bits ", buff1);
++      dump_wide (dumpfile, format, "Buff2 bits ", buff2);
+       dump_byte (dumpfile, format, "Write bits1", bytebuff1);
+       dump_byte (dumpfile, format, "Write bits2", bytebuff2);
+       dump_info (dumpfile, format, "", "Ready bits:  %2d", ready_bits); 
+@@ -4905,7 +4921,7 @@ static int readSeparateStripsIntoBuffer (TIFF *in, uint8_t *obuf, uint32_t lengt
+   {
+   int i, bytes_per_sample, bytes_per_pixel, shift_width, result = 1;
+   uint32_t j;
+-  int32_t  bytes_read = 0;
++  tmsize_t  bytes_read = 0;
+   uint16_t bps = 0, planar;
+   uint32_t nstrips;
+   uint32_t strips_per_sample;
+@@ -4971,7 +4987,7 @@ static int readSeparateStripsIntoBuffer (TIFF *in, uint8_t *obuf, uint32_t lengt
+   for (s = 0; (s < spp) && (s < MAX_SAMPLES); s++)
+     {
+     srcbuffs[s] = NULL;
+-    buff = limitMalloc(stripsize + 3);
++    buff = limitMalloc(stripsize + NUM_BUFF_OVERSIZE_BYTES);
+     if (!buff)
+       {
+       TIFFError ("readSeparateStripsIntoBuffer", 
+@@ -4994,7 +5010,7 @@ static int readSeparateStripsIntoBuffer (TIFF *in, uint8_t *obuf, uint32_t lengt
+       buff = srcbuffs[s];
+       strip = (s * strips_per_sample) + j; 
+       bytes_read = TIFFReadEncodedStrip (in, strip, buff, stripsize);
+-      rows_this_strip = bytes_read / src_rowsize;
++      rows_this_strip = (uint32_t)(bytes_read / src_rowsize);
+       if (bytes_read < 0 && !ignore)
+         {
+         TIFFError(TIFFFileName(in),
+@@ -6047,13 +6063,14 @@ loadImage(TIFF* in, struct image_data *image, struct dump_opts *dump, unsigned c
+   uint16_t   input_compression = 0, input_photometric = 0;
+   uint16_t   subsampling_horiz, subsampling_vert;
+   uint32_t   width = 0, length = 0;
+-  uint32_t   stsize = 0, tlsize = 0, buffsize = 0, scanlinesize = 0;
++  tmsize_t   stsize = 0, tlsize = 0, buffsize = 0;
++  tmsize_t   scanlinesize = 0;
+   uint32_t   tw = 0, tl = 0;       /* Tile width and length */
+-  uint32_t   tile_rowsize = 0;
++  tmsize_t   tile_rowsize = 0;
+   unsigned char *read_buff = NULL;
+   unsigned char *new_buff  = NULL;
+   int      readunit = 0;
+-  static   uint32_t  prev_readsize = 0;
++  static   tmsize_t  prev_readsize = 0;
+ 
+   TIFFGetFieldDefaulted(in, TIFFTAG_BITSPERSAMPLE, &bps);
+   TIFFGetFieldDefaulted(in, TIFFTAG_SAMPLESPERPIXEL, &spp);
+@@ -6355,7 +6372,7 @@ loadImage(TIFF* in, struct image_data *image, struct dump_opts *dump, unsigned c
+         TIFFError("loadImage", "Unable to allocate/reallocate read buffer");
+         return (-1);
+     }
+-    read_buff = (unsigned char *)limitMalloc(buffsize+3);
++    read_buff = (unsigned char *)limitMalloc(buffsize + NUM_BUFF_OVERSIZE_BYTES);
+   }
+   else
+     {
+@@ -6366,11 +6383,11 @@ loadImage(TIFF* in, struct image_data *image, struct dump_opts *dump, unsigned c
+           TIFFError("loadImage", "Unable to allocate/reallocate read buffer");
+           return (-1);
+       }
+-      new_buff = _TIFFrealloc(read_buff, buffsize+3);
++      new_buff = _TIFFrealloc(read_buff, buffsize + NUM_BUFF_OVERSIZE_BYTES);
+       if (!new_buff)
+         {
+ 	free (read_buff);
+-        read_buff = (unsigned char *)limitMalloc(buffsize+3);
++        read_buff = (unsigned char *)limitMalloc(buffsize + NUM_BUFF_OVERSIZE_BYTES);
+         }
+       else
+         read_buff = new_buff;
+@@ -6443,8 +6460,13 @@ loadImage(TIFF* in, struct image_data *image, struct dump_opts *dump, unsigned c
+     dump_info  (dump->infile, dump->format, "", 
+                 "Bits per sample %"PRIu16", Samples per pixel %"PRIu16, bps, spp);
+ 
++    if (scanlinesize > 0x0ffffffffULL) {
++        dump_info(dump->infile, dump->format, "loadImage",
++            "Attention: scanlinesize %"PRIu64" is larger than UINT32_MAX.\nFollowing dump might be wrong.",
++            scanlinesize);
++    }
+     for (i = 0; i < length; i++)
+-      dump_buffer(dump->infile, dump->format, 1, scanlinesize, 
++      dump_buffer(dump->infile, dump->format, 1, (uint32_t)scanlinesize, 
+                   i, read_buff + (i * scanlinesize));
+     }
+   return (0);
+@@ -7464,13 +7486,13 @@ writeSingleSection(TIFF *in, TIFF *out, struct image_data *image,
+      if (TIFFGetField(in, TIFFTAG_NUMBEROFINKS, &ninks)) {
+        TIFFSetField(out, TIFFTAG_NUMBEROFINKS, ninks);
+        if (TIFFGetField(in, TIFFTAG_INKNAMES, &inknames)) {
+-	 int inknameslen = strlen(inknames) + 1;
++	 int inknameslen = (int)strlen(inknames) + 1;
+ 	 const char* cp = inknames;
+ 	 while (ninks > 1) {
+ 	   cp = strchr(cp, '\0');
+ 	   if (cp) {
+ 	     cp++;
+-	     inknameslen += (strlen(cp) + 1);
++	     inknameslen += ((int)strlen(cp) + 1);
+ 	   }
+ 	   ninks--;
+          }
+@@ -7533,23 +7555,23 @@ createImageSection(uint32_t sectsize, unsigned char **sect_buff_ptr)
+ 
+   if (!sect_buff)
+     {
+-    sect_buff = (unsigned char *)limitMalloc(sectsize);
++    sect_buff = (unsigned char *)limitMalloc(sectsize + NUM_BUFF_OVERSIZE_BYTES);
+     if (!sect_buff)
+     {
+         TIFFError("createImageSection", "Unable to allocate/reallocate section buffer");
+         return (-1);
+     }
+-    _TIFFmemset(sect_buff, 0, sectsize);
++    _TIFFmemset(sect_buff, 0, sectsize + NUM_BUFF_OVERSIZE_BYTES);
+     }
+   else
+     {
+     if (prev_sectsize < sectsize)
+       {
+-      new_buff = _TIFFrealloc(sect_buff, sectsize);
++      new_buff = _TIFFrealloc(sect_buff, sectsize + NUM_BUFF_OVERSIZE_BYTES);
+       if (!new_buff)
+         {
+           _TIFFfree (sect_buff);
+-        sect_buff = (unsigned char *)limitMalloc(sectsize);
++        sect_buff = (unsigned char *)limitMalloc(sectsize + NUM_BUFF_OVERSIZE_BYTES);
+         }
+       else
+         sect_buff = new_buff;
+@@ -7559,7 +7581,7 @@ createImageSection(uint32_t sectsize, unsigned char **sect_buff_ptr)
+           TIFFError("createImageSection", "Unable to allocate/reallocate section buffer");
+           return (-1);
+       }
+-      _TIFFmemset(sect_buff, 0, sectsize);
++      _TIFFmemset(sect_buff, 0, sectsize + NUM_BUFF_OVERSIZE_BYTES);
+       }
+     }
+ 
+@@ -7590,17 +7612,17 @@ processCropSelections(struct image_data *image, struct crop_mask *crop,
+     cropsize = crop->bufftotal;
+     crop_buff = seg_buffs[0].buffer; 
+     if (!crop_buff)
+-      crop_buff = (unsigned char *)limitMalloc(cropsize);
++      crop_buff = (unsigned char *)limitMalloc(cropsize + NUM_BUFF_OVERSIZE_BYTES);
+     else
+       {
+       prev_cropsize = seg_buffs[0].size;
+       if (prev_cropsize < cropsize)
+         {
+-        next_buff = _TIFFrealloc(crop_buff, cropsize);
++        next_buff = _TIFFrealloc(crop_buff, cropsize + NUM_BUFF_OVERSIZE_BYTES);
+         if (! next_buff)
+           {
+           _TIFFfree (crop_buff);
+-          crop_buff = (unsigned char *)limitMalloc(cropsize);
++          crop_buff = (unsigned char *)limitMalloc(cropsize + NUM_BUFF_OVERSIZE_BYTES);
+           }
+         else
+           crop_buff = next_buff;
+@@ -7613,7 +7635,7 @@ processCropSelections(struct image_data *image, struct crop_mask *crop,
+       return (-1);
+       }
+  
+-    _TIFFmemset(crop_buff, 0, cropsize);
++    _TIFFmemset(crop_buff, 0, cropsize + NUM_BUFF_OVERSIZE_BYTES);
+     seg_buffs[0].buffer = crop_buff;
+     seg_buffs[0].size = cropsize;
+ 
+@@ -7693,17 +7715,17 @@ processCropSelections(struct image_data *image, struct crop_mask *crop,
+         cropsize = crop->bufftotal;
+       crop_buff = seg_buffs[i].buffer; 
+       if (!crop_buff)
+-        crop_buff = (unsigned char *)limitMalloc(cropsize);
++        crop_buff = (unsigned char *)limitMalloc(cropsize + NUM_BUFF_OVERSIZE_BYTES);
+       else
+         {
+         prev_cropsize = seg_buffs[0].size;
+         if (prev_cropsize < cropsize)
+           {
+-          next_buff = _TIFFrealloc(crop_buff, cropsize);
++          next_buff = _TIFFrealloc(crop_buff, cropsize + NUM_BUFF_OVERSIZE_BYTES);
+           if (! next_buff)
+             {
+             _TIFFfree (crop_buff);
+-            crop_buff = (unsigned char *)limitMalloc(cropsize);
++            crop_buff = (unsigned char *)limitMalloc(cropsize + NUM_BUFF_OVERSIZE_BYTES);
+             }
+           else
+             crop_buff = next_buff;
+@@ -7716,7 +7738,7 @@ processCropSelections(struct image_data *image, struct crop_mask *crop,
+         return (-1);
+         }
+  
+-      _TIFFmemset(crop_buff, 0, cropsize);
++      _TIFFmemset(crop_buff, 0, cropsize + NUM_BUFF_OVERSIZE_BYTES);
+       seg_buffs[i].buffer = crop_buff;
+       seg_buffs[i].size = cropsize;
+ 
+@@ -7832,24 +7854,24 @@ createCroppedImage(struct image_data *image, struct crop_mask *crop,
+   crop_buff = *crop_buff_ptr;
+   if (!crop_buff)
+     {
+-    crop_buff = (unsigned char *)limitMalloc(cropsize);
++    crop_buff = (unsigned char *)limitMalloc(cropsize + NUM_BUFF_OVERSIZE_BYTES);
+     if (!crop_buff)
+     {
+         TIFFError("createCroppedImage", "Unable to allocate/reallocate crop buffer");
+         return (-1);
+     }
+-    _TIFFmemset(crop_buff, 0, cropsize);
++    _TIFFmemset(crop_buff, 0, cropsize + NUM_BUFF_OVERSIZE_BYTES);
+     prev_cropsize = cropsize;
+     }
+   else
+     {
+     if (prev_cropsize < cropsize)
+       {
+-      new_buff = _TIFFrealloc(crop_buff, cropsize);
++      new_buff = _TIFFrealloc(crop_buff, cropsize + NUM_BUFF_OVERSIZE_BYTES);
+       if (!new_buff)
+         {
+ 	free (crop_buff);
+-        crop_buff = (unsigned char *)limitMalloc(cropsize);
++        crop_buff = (unsigned char *)limitMalloc(cropsize + NUM_BUFF_OVERSIZE_BYTES);
+         }
+       else
+         crop_buff = new_buff;
+@@ -7858,7 +7880,7 @@ createCroppedImage(struct image_data *image, struct crop_mask *crop,
+           TIFFError("createCroppedImage", "Unable to allocate/reallocate crop buffer");
+           return (-1);
+       }
+-      _TIFFmemset(crop_buff, 0, cropsize);
++      _TIFFmemset(crop_buff, 0, cropsize + NUM_BUFF_OVERSIZE_BYTES);
+       }
+     }
+ 
+@@ -8156,13 +8178,13 @@ writeCroppedImage(TIFF *in, TIFF *out, struct image_data *image,
+      if (TIFFGetField(in, TIFFTAG_NUMBEROFINKS, &ninks)) {
+        TIFFSetField(out, TIFFTAG_NUMBEROFINKS, ninks);
+        if (TIFFGetField(in, TIFFTAG_INKNAMES, &inknames)) {
+-	 int inknameslen = strlen(inknames) + 1;
++	 int inknameslen = (int)strlen(inknames) + 1;
+ 	 const char* cp = inknames;
+ 	 while (ninks > 1) {
+ 	   cp = strchr(cp, '\0');
+ 	   if (cp) {
+ 	     cp++;
+-	     inknameslen += (strlen(cp) + 1);
++	     inknameslen += ((int)strlen(cp) + 1);
+ 	   }
+ 	   ninks--;
+          }
+@@ -8547,13 +8569,13 @@ rotateContigSamples32bits(uint16_t rotation, uint16_t spp, uint16_t bps, uint32_
+         }
+       else /* If we have a full buffer's worth, write it out */
+         {
+-        bytebuff1 = (buff2 >> 56);
++        bytebuff1 = (uint8_t)(buff2 >> 56);
+         *dst++ = bytebuff1;
+-        bytebuff2 = (buff2 >> 48);
++        bytebuff2 = (uint8_t)(buff2 >> 48);
+         *dst++ = bytebuff2;
+-        bytebuff3 = (buff2 >> 40);
++        bytebuff3 = (uint8_t)(buff2 >> 40);
+         *dst++ = bytebuff3;
+-        bytebuff4 = (buff2 >> 32);
++        bytebuff4 = (uint8_t)(buff2 >> 32);
+         *dst++ = bytebuff4;
+         ready_bits -= 32;
+                     
+@@ -8622,12 +8644,13 @@ rotateImage(uint16_t rotation, struct image_data *image, uint32_t *img_width,
+               return (-1);
+     }
+ 
+-  if (!(rbuff = (unsigned char *)limitMalloc(buffsize)))
++  /* Add 3 padding bytes for extractContigSamplesShifted32bits */
++  if (!(rbuff = (unsigned char *)limitMalloc(buffsize + NUM_BUFF_OVERSIZE_BYTES)))
+     {
+-    TIFFError("rotateImage", "Unable to allocate rotation buffer of %1u bytes", buffsize);
++    TIFFError("rotateImage", "Unable to allocate rotation buffer of %1u bytes", buffsize + NUM_BUFF_OVERSIZE_BYTES);
+     return (-1);
+     }
+-  _TIFFmemset(rbuff, '\0', buffsize);
++  _TIFFmemset(rbuff, '\0', buffsize + NUM_BUFF_OVERSIZE_BYTES);
+ 
+   ibuff = *ibuff_ptr;
+   switch (rotation)
+@@ -9155,13 +9178,13 @@ reverseSamples32bits (uint16_t spp, uint16_t bps, uint32_t width,
+         }
+       else /* If we have a full buffer's worth, write it out */
+         {
+-        bytebuff1 = (buff2 >> 56);
++        bytebuff1 = (uint8_t)(buff2 >> 56);
+         *dst++ = bytebuff1;
+-        bytebuff2 = (buff2 >> 48);
++        bytebuff2 = (uint8_t)(buff2 >> 48);
+         *dst++ = bytebuff2;
+-        bytebuff3 = (buff2 >> 40);
++        bytebuff3 = (uint8_t)(buff2 >> 40);
+         *dst++ = bytebuff3;
+-        bytebuff4 = (buff2 >> 32);
++        bytebuff4 = (uint8_t)(buff2 >> 32);
+         *dst++ = bytebuff4;
+         ready_bits -= 32;
+                     
+@@ -9252,12 +9275,13 @@ mirrorImage(uint16_t spp, uint16_t bps, uint16_t mirror, uint32_t width, uint32_
+     {
+     case MIRROR_BOTH:
+     case MIRROR_VERT: 
+-             line_buff = (unsigned char *)limitMalloc(rowsize);
++             line_buff = (unsigned char *)limitMalloc(rowsize + NUM_BUFF_OVERSIZE_BYTES);
+              if (line_buff == NULL)
+                {
+-	       TIFFError ("mirrorImage", "Unable to allocate mirror line buffer of %1u bytes", rowsize);
++	       TIFFError ("mirrorImage", "Unable to allocate mirror line buffer of %1u bytes", rowsize + NUM_BUFF_OVERSIZE_BYTES);
+                return (-1);
+                }
++             _TIFFmemset(line_buff, '\0', rowsize + NUM_BUFF_OVERSIZE_BYTES);
+ 
+              dst = ibuff + (rowsize * (length - 1));
+              for (row = 0; row < length / 2; row++)
+@@ -9289,11 +9313,12 @@ mirrorImage(uint16_t spp, uint16_t bps, uint16_t mirror, uint32_t width, uint32_
+ 		}
+ 	      else
+                 { /* non 8 bit per sample  data */
+-                if (!(line_buff = (unsigned char *)limitMalloc(rowsize + 1)))
++                if (!(line_buff = (unsigned char *)limitMalloc(rowsize + NUM_BUFF_OVERSIZE_BYTES)))
+                   {
+                   TIFFError("mirrorImage", "Unable to allocate mirror line buffer");
+                   return (-1);
+                   }
++                _TIFFmemset(line_buff, '\0', rowsize + NUM_BUFF_OVERSIZE_BYTES);
+                 bytes_per_sample = (bps + 7) / 8;
+                 bytes_per_pixel  = ((bps * spp) + 7) / 8;
+                 if (bytes_per_pixel < (bytes_per_sample + 1))
+@@ -9305,7 +9330,7 @@ mirrorImage(uint16_t spp, uint16_t bps, uint16_t mirror, uint32_t width, uint32_
+                   {
+ 		  row_offset = row * rowsize;
+                   src = ibuff + row_offset;
+-                  _TIFFmemset (line_buff, '\0', rowsize);
++                  _TIFFmemset (line_buff, '\0', rowsize + NUM_BUFF_OVERSIZE_BYTES);
+                   switch (shift_width)
+                     {
+                     case 1: if (reverseSamples16bits(spp, bps, width, src, line_buff))
diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index 29a2c38d8e..af9bdcfbde 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -27,6 +27,10 @@ SRC_URI = "http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
            file://b258ed69a485a9cfb299d9f060eb2a46c54e5903.patch \
            file://0001-tiffcrop-Fix-issue-330-and-some-more-from-320-to-349.patch \
            file://CVE-2022-2953.patch \
+           file://0001-Revised-handling-of-TIFFTAG_INKNAMES-and-related-TIF.patch \
+           file://0001-tiffcrop-S-option-Make-decision-simpler.patch \
+           file://0001-tiffcrop-disable-incompatibility-of-Z-X-Y-z-options-.patch \
+           file://0001-tiffcrop-subroutines-require-a-larger-buffer-fixes-2.patch \
            "
 
 SRC_URI[sha256sum] = "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8"
@@ -40,7 +44,6 @@ CVE_CHECK_IGNORE += "CVE-2015-7313"
 # These issues only affect libtiff post-4.3.0 but before 4.4.0,
 # caused by 3079627e and fixed by b4e79bfa.
 CVE_CHECK_IGNORE += "CVE-2022-1622 CVE-2022-1623"
-
 # Issue is in jbig which we don't enable
 CVE_CHECK_IGNORE += "CVE-2022-1210"
 
-- 
2.38.1


