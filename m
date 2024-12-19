Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B695E77184
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 11:57:33 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.127523.1734609443960327474
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Dec 2024 03:57:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=KlMpr5oh;
 spf=pass (domain: mvista.com, ip: 209.85.210.172, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7292a83264eso614366b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 03:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1734609443; x=1735214243; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S4V9baA0RYCkqJqtxo1NeGa6SeKAUGqAgKkJeRMarR0=;
        b=KlMpr5ohW2UXD0h4ZcfTdaBPnAg0qMzhed88x/683QJ5dTKncn34jFbBvtSa4ayEt5
         dZBTfdPQURe0eDjXjqpBiU25FCxdgPf9vYKd+6iqYOuCYIPggYgzxLvDNI5ogJiFS/4m
         AnV77FsFUr+lJnTU8X61cv5/pf0nqKh1ENNEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734609443; x=1735214243;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S4V9baA0RYCkqJqtxo1NeGa6SeKAUGqAgKkJeRMarR0=;
        b=q4sNsnwiJi6xPr6Vq0j2doprNEZXDJkbgJjOZp2yszC/Y1+pOOpUE0yCh/8WZQMyVn
         MDnhDEh2lPnZRhidsAYxQzn15uHWpE/UgaQejoElvnByxoeEXCRB8j+VQH+k0JlP5UnN
         7nCVK3tTvpTWpJ2mIhjkroDbeG7/Y6eJ21XZRNy27FttWmbdJiqiplqGApag2g9hAU5X
         3sVa123N7bL73UIAKLcCILe1xphubNZG4y1Q9tYf0PzzvG8te6t2vERj4a3VoG4/kAWY
         1TuzZ+Nz/4mY6HkuhdSrdl1fZy6padpRLMhl7Wj7YEBUJyYiNmA1FtGYMyQaZxVtTiHY
         LDuw==
X-Gm-Message-State: AOJu0YzY6N9eRM+ulyJ7Hv8vVeBRUgNXpbIrVH+/1bqXEmn+ydaog1QS
	twk+JWipg2C/XAJBzYTTo3o/STDljjP8ohip0dHV4OSeS21nd6/tDAt5nM/EyQwbIAGRGso/k2R
	H3eM=
X-Gm-Gg: ASbGncspZa4k3sDDYiUnYCOrLZG/UfypYUBwmz7erB421ZxFLNKlterjrsUTqMeM2ei
	MESKQY9FhaoZmBBJbS64+wP8jmipA1uIWCSzBUxurfgB0WB7/SzJ0LnUhktGTj6lGJIEUD2dNVB
	U078UVcAQRQbHpmzu8MrMS+WY7e6+5SryqGQJGwQsmNSBjzQ1OCG2ikX6+dsxkQt5xOpnGfvk2b
	Q3eao9/TCUb9G66tB6jb3p29inc//ivd+k2UdeKVKAkUROhb4P4n21wwcyuaSQ5o//Y+vA=
X-Google-Smtp-Source: AGHT+IGircZ/vJJk6eAkh+vcqQoIlIM3Wavlyw7YxpPxwDKKbcclSK593/IuXX0OJaiDpibv1DtwUA==
X-Received: by 2002:a05:6a00:9096:b0:725:e37d:cd35 with SMTP id d2e1a72fcca58-72a8d2c2269mr10381920b3a.18.1734609441937;
        Thu, 19 Dec 2024 03:57:21 -0800 (PST)
Received: from MVIN00020.mvista.com ([2401:4900:882f:7af7:692c:e213:de8e:bf3a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad848020sm1111537b3a.81.2024.12.19.03.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 03:57:21 -0800 (PST)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH] libsndfile1: Backport fix for CVE-2022-33065
Date: Thu, 19 Dec 2024 17:27:04 +0530
Message-Id: <20241219115704.5691-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 11:57:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208907

From: Vijay Anusuri <vanusuri@mvista.com>

Added missing commits for complete CVE fix

Ref: https://github.com/libsndfile/libsndfile/issues/833
     https://ubuntu.com/security/CVE-2022-33065

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 ...022-33065.patch => CVE-2022-33065-1.patch} |   0
 .../libsndfile1/CVE-2022-33065-10.patch       |  39 +++
 .../libsndfile1/CVE-2022-33065-11.patch       |  35 +++
 .../libsndfile1/CVE-2022-33065-12.patch       |  40 +++
 .../libsndfile1/CVE-2022-33065-13.patch       |  58 +++++
 .../libsndfile1/CVE-2022-33065-2.patch        |  58 +++++
 .../libsndfile1/CVE-2022-33065-3.patch        |  34 +++
 .../libsndfile1/CVE-2022-33065-4.patch        |  60 +++++
 .../libsndfile1/CVE-2022-33065-5.patch        |  39 +++
 .../libsndfile1/CVE-2022-33065-6.patch        |  82 +++++++
 .../libsndfile1/CVE-2022-33065-7.patch        |  48 ++++
 .../libsndfile1/CVE-2022-33065-8.patch        | 179 ++++++++++++++
 .../libsndfile1/CVE-2022-33065-9.patch        | 231 ++++++++++++++++++
 .../libsndfile/libsndfile1_1.0.31.bb          |  14 +-
 14 files changed, 916 insertions(+), 1 deletion(-)
 rename meta/recipes-multimedia/libsndfile/libsndfile1/{CVE-2022-33065.patch => CVE-2022-33065-1.patch} (100%)
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065-10.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065-11.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065-12.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065-13.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065-2.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065-3.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065-4.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065-5.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065-6.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065-7.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065-8.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065-9.patch

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065-1.patch
similarity index 100%
rename from meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065.patch
rename to meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065-1.patch
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065-10.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065-10.patch
new file mode 100644
index 0000000000..17867fc308
--- /dev/null
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065-10.patch
@@ -0,0 +1,39 @@
+From cd44bfaf3708e778c8670cb7f707a597c3334376 Mon Sep 17 00:00:00 2001
+From: Alex Stewart <alex.stewart@ni.com>
+Date: Tue, 17 Oct 2023 11:50:53 -0400
+Subject: [PATCH 14/17] nms_adpcm: fix int overflow in sf.frames calc
+
+When calculating sf.frames from the blocks_total PNMS variable, it is
+theoretically possible to overflow the blocks_total int boundaries,
+leading to undefined behavior.
+
+Cast blocks_total to a long-sized sf_count_t before the calculation, to
+provide it with enough numeric space and because that is the final
+typing regardless.
+
+CVE: CVE-2022-33065
+Fixes: https://github.com/libsndfile/libsndfile/issues/833
+
+Signed-off-by: Alex Stewart <alex.stewart@ni.com>
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/libsndfile/tree/debian/patches/CVE-2022-33065/CVE-2022-33065-10.patch?h=ubuntu/jammy-security
+Upstream commit https://github.com/libsndfile/libsndfile/commit/cd44bfaf3708e778c8670cb7f707a597c3334376]
+CVE: CVE-2022-33065
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/nms_adpcm.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/nms_adpcm.c b/src/nms_adpcm.c
+index dca85f0b0..61d171c73 100644
+--- a/src/nms_adpcm.c
++++ b/src/nms_adpcm.c
+@@ -1090,7 +1090,7 @@ nms_adpcm_init (SF_PRIVATE *psf)
+ 	else
+ 		pnms->blocks_total = psf->datalength / (pnms->shortsperblock * sizeof (short)) ;
+ 
+-	psf->sf.frames		= pnms->blocks_total * NMS_SAMPLES_PER_BLOCK ;
++	psf->sf.frames		= (sf_count_t) pnms->blocks_total * NMS_SAMPLES_PER_BLOCK ;
+ 	psf->codec_close	= nms_adpcm_close ;
+ 	psf->seek			= nms_adpcm_seek ;
+ 
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065-11.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065-11.patch
new file mode 100644
index 0000000000..a147a0d593
--- /dev/null
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065-11.patch
@@ -0,0 +1,35 @@
+From 915e154e2deb327612ca413c838365b7c9bfbf16 Mon Sep 17 00:00:00 2001
+From: Alex Stewart <alex.stewart@ni.com>
+Date: Tue, 17 Oct 2023 11:57:23 -0400
+Subject: [PATCH 15/17] pcm: fix int overflow in pcm_init()
+
+Cast the int-sized bytewidth variable to a long-sized sf_count_t type
+prior to calculating the blockwidth, to provide the calculation with
+enough numeric space and sf_count_t is the final typing regardless.
+
+CVE: CVE-2022-33065
+Fixes: https://github.com/libsndfile/libsndfile/issues/833
+
+Signed-off-by: Alex Stewart <alex.stewart@ni.com>
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/libsndfile/tree/debian/patches/CVE-2022-33065/CVE-2022-33065-11.patch?h=ubuntu/jammy-security
+Upstream commit https://github.com/libsndfile/libsndfile/commit/915e154e2deb327612ca413c838365b7c9bfbf16]
+CVE: CVE-2022-33065
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/pcm.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/pcm.c b/src/pcm.c
+index bdf461839..a42e48681 100644
+--- a/src/pcm.c
++++ b/src/pcm.c
+@@ -127,7 +127,7 @@ pcm_init (SF_PRIVATE *psf)
+ 		return SFE_INTERNAL ;
+ 		} ;
+ 
+-	psf->blockwidth = psf->bytewidth * psf->sf.channels ;
++	psf->blockwidth = (sf_count_t) psf->bytewidth * psf->sf.channels ;
+ 
+ 	if ((SF_CODEC (psf->sf.format)) == SF_FORMAT_PCM_S8)
+ 		chars = SF_CHARS_SIGNED ;
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065-12.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065-12.patch
new file mode 100644
index 0000000000..659a6a4c22
--- /dev/null
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065-12.patch
@@ -0,0 +1,40 @@
+From ec149a79d457916479489d71b55e4d63015a08ea Mon Sep 17 00:00:00 2001
+From: Alex Stewart <alex.stewart@ni.com>
+Date: Tue, 17 Oct 2023 12:01:00 -0400
+Subject: [PATCH 16/17] rf64: fix int overflow in rf64_read_header()
+
+When checking for mismatches between the filelength and riff_size, it is
+possible to overflow the temporary riff_size value used in the
+comparison by adding a static offset; which is probably fine, but it is
+offensive to overflow fuzzers.
+
+Since filelength is always a positive value, simply move the offset to
+the other side of the comparison operator as a negative value, avoid the
+possibility of an overflow.
+
+CVE: CVE-2022-33065
+Fixes: https://github.com/libsndfile/libsndfile/issues/833
+
+Signed-off-by: Alex Stewart <alex.stewart@ni.com>
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/libsndfile/tree/debian/patches/CVE-2022-33065/CVE-2022-33065-12.patch?h=ubuntu/jammy-security
+Upstream commit https://github.com/libsndfile/libsndfile/commit/ec149a79d457916479489d71b55e4d63015a08ea]
+CVE: CVE-2022-33065
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/rf64.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/rf64.c b/src/rf64.c
+index 123db445a..c60399fb3 100644
+--- a/src/rf64.c
++++ b/src/rf64.c
+@@ -242,7 +242,7 @@ rf64_read_header (SF_PRIVATE *psf, int *blockalign, int *framesperblock)
+ 							} ;
+ 						} ;
+ 
+-					if (psf->filelength != riff_size + 8)
++					if (psf->filelength - 8 != riff_size)
+ 						psf_log_printf (psf, "  Riff size : %D (should be %D)\n", riff_size, psf->filelength - 8) ;
+ 					else
+ 						psf_log_printf (psf, "  Riff size : %D\n", riff_size) ;
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065-13.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065-13.patch
new file mode 100644
index 0000000000..107b1dcae4
--- /dev/null
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065-13.patch
@@ -0,0 +1,58 @@
+From 9f097e492a07c96e3b250d6ac0044499f64f6cea Mon Sep 17 00:00:00 2001
+From: Alex Stewart <alex.stewart@ni.com>
+Date: Tue, 17 Oct 2023 12:19:12 -0400
+Subject: [PATCH 17/17] ima_adpcm: fix int overflow in ima_reader_init()
+
+When calculating sf.frames, pre-cast samplesperblock to sf_count_t, to
+provide the calculation with enough numeric space to avoid overflows.
+
+Other changes in this commit are syntactic, and only to satisfy the git
+pre-commit syntax checker.
+
+CVE: CVE-2022-33065
+Fixes: https://github.com/libsndfile/libsndfile/issues/833
+
+Signed-off-by: Alex Stewart <alex.stewart@ni.com>
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/libsndfile/tree/debian/patches/CVE-2022-33065/CVE-2022-33065-13.patch?h=ubuntu/jammy-security
+Upstream commit https://github.com/libsndfile/libsndfile/commit/9f097e492a07c96e3b250d6ac0044499f64f6cea]
+CVE: CVE-2022-33065
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/ima_adpcm.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+--- libsndfile-1.0.31.orig/src/ima_adpcm.c
++++ libsndfile-1.0.31/src/ima_adpcm.c
+@@ -182,7 +182,12 @@ ima_reader_init (SF_PRIVATE *psf, int bl
+ 	if (psf->file.mode != SFM_READ)
+ 		return SFE_BAD_MODE_RW ;
+ 
+-	pimasize = sizeof (IMA_ADPCM_PRIVATE) + blockalign * psf->sf.channels + 3 * psf->sf.channels * samplesperblock ;
++	/*
++	**	Allocate enough space for 1 more than a multiple of 8 samples
++	**	to avoid having to branch when pulling apart the nibbles.
++	*/
++	count = ((samplesperblock - 2) | 7) + 2 ;
++	pimasize = sizeof (IMA_ADPCM_PRIVATE) + psf->sf.channels * (blockalign + samplesperblock + sizeof (short) * count) ;
+ 
+ 	if (! (pima = calloc (1, pimasize)))
+ 		return SFE_MALLOC_FAILED ;
+@@ -233,7 +238,7 @@ ima_reader_init (SF_PRIVATE *psf, int bl
+ 		case SF_FORMAT_AIFF :
+ 				psf_log_printf (psf, "still need to check block count\n") ;
+ 				pima->decode_block = aiff_ima_decode_block ;
+-				psf->sf.frames = pima->samplesperblock * pima->blocks / pima->channels ;
++				psf->sf.frames = (sf_count_t) pima->samplesperblock * pima->blocks / pima->channels ;
+ 				break ;
+ 
+ 		default :
+@@ -386,7 +391,7 @@ aiff_ima_encode_block (SF_PRIVATE *psf,
+ static int
+ wavlike_ima_decode_block (SF_PRIVATE *psf, IMA_ADPCM_PRIVATE *pima)
+ {	int		chan, k, predictor, blockindx, indx, indxstart, diff ;
+-	short	step, bytecode, stepindx [2] ;
++	short	step, bytecode, stepindx [2] = { 0 } ;
+ 
+ 	pima->blockcount ++ ;
+ 	pima->samplecount = 0 ;
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065-2.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065-2.patch
new file mode 100644
index 0000000000..93b8856e41
--- /dev/null
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065-2.patch
@@ -0,0 +1,58 @@
+From 56e6c5408f1ee6d476b234c105fb28b4998e811b Mon Sep 17 00:00:00 2001
+From: Alex Stewart <alex.stewart@ni.com>
+Date: Wed, 11 Oct 2023 16:36:02 -0400
+Subject: [PATCH 06/17] au: avoid int overflow while calculating data_end
+
+At several points in au_read_header(), we calculate the functional end
+of the data segment by adding the (int)au_fmt.dataoffset and the
+(int)au_fmt.datasize. This can overflow the implicit int_32 return value
+and cause undefined behavior.
+
+Instead, precalculate the value and assign it to a 64-bit
+(sf_count_t)data_end variable.
+
+CVE: CVE-2022-33065
+Fixes: https://github.com/libsndfile/libsndfile/issues/833
+
+Signed-off-by: Alex Stewart <alex.stewart@ni.com>
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/libsndfile/tree/debian/patches/CVE-2022-33065/CVE-2022-33065-2.patch?h=ubuntu/jammy-security
+Upstream commit https://github.com/libsndfile/libsndfile/commit/56e6c5408f1ee6d476b234c105fb28b4998e811b]
+CVE: CVE-2022-33065
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/au.c | 10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/src/au.c b/src/au.c
+index 62bd691d6..f68f25871 100644
+--- a/src/au.c
++++ b/src/au.c
+@@ -291,6 +291,7 @@ static int
+ au_read_header (SF_PRIVATE *psf)
+ {	AU_FMT	au_fmt ;
+ 	int		marker, dword ;
++	sf_count_t data_end ;
+ 
+ 	memset (&au_fmt, 0, sizeof (au_fmt)) ;
+ 	psf_binheader_readf (psf, "pm", 0, &marker) ;
+@@ -317,14 +318,15 @@ au_read_header (SF_PRIVATE *psf)
+ 		return SFE_AU_EMBED_BAD_LEN ;
+ 		} ;
+ 
++	data_end = (sf_count_t) au_fmt.dataoffset + (sf_count_t) au_fmt.datasize ;
+ 	if (psf->fileoffset > 0)
+-	{	psf->filelength = au_fmt.dataoffset + au_fmt.datasize ;
++	{	psf->filelength = data_end ;
+ 		psf_log_printf (psf, "  Data Size   : %d\n", au_fmt.datasize) ;
+ 		}
+-	else if (au_fmt.datasize == -1 || au_fmt.dataoffset + au_fmt.datasize == psf->filelength)
++	else if (au_fmt.datasize == -1 || data_end == psf->filelength)
+ 		psf_log_printf (psf, "  Data Size   : %d\n", au_fmt.datasize) ;
+-	else if (au_fmt.dataoffset + au_fmt.datasize < psf->filelength)
+-	{	psf->filelength = au_fmt.dataoffset + au_fmt.datasize ;
++	else if (data_end < psf->filelength)
++	{	psf->filelength = data_end ;
+ 		psf_log_printf (psf, "  Data Size   : %d\n", au_fmt.datasize) ;
+ 		}
+ 	else
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065-3.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065-3.patch
new file mode 100644
index 0000000000..80af387081
--- /dev/null
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065-3.patch
@@ -0,0 +1,34 @@
+From 839fa9131820d689b2038c81531b618b2932fbe3 Mon Sep 17 00:00:00 2001
+From: Alex Stewart <alex.stewart@ni.com>
+Date: Wed, 11 Oct 2023 16:46:29 -0400
+Subject: [PATCH 07/17] avr: fix int overflow in avr_read_header()
+
+Pre-cast hdr.frames to sf_count_t, to provide the calculation with
+enough numeric space to avoid an int-overflow.
+
+CVE: CVE-2022-33065
+Fixes: https://github.com/libsndfile/libsndfile/issues/833
+
+Signed-off-by: Alex Stewart <alex.stewart@ni.com>
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/libsndfile/tree/debian/patches/CVE-2022-33065/CVE-2022-33065-3.patch?h=ubuntu/jammy-security
+Upstream commit https://github.com/libsndfile/libsndfile/commit/839fa9131820d689b2038c81531b618b2932fbe3]
+CVE: CVE-2022-33065
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/avr.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/avr.c b/src/avr.c
+index 6c78ff69b..1bc1ffc90 100644
+--- a/src/avr.c
++++ b/src/avr.c
+@@ -162,7 +162,7 @@ avr_read_header (SF_PRIVATE *psf)
+ 	psf->endian = SF_ENDIAN_BIG ;
+ 
+  	psf->dataoffset = AVR_HDR_SIZE ;
+-	psf->datalength = hdr.frames * (hdr.rez / 8) ;
++	psf->datalength = (sf_count_t) hdr.frames * (hdr.rez / 8) ;
+ 
+ 	if (psf->fileoffset > 0)
+ 		psf->filelength = AVR_HDR_SIZE + psf->datalength ;
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065-4.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065-4.patch
new file mode 100644
index 0000000000..2c1e10f66c
--- /dev/null
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065-4.patch
@@ -0,0 +1,60 @@
+From 1116fa173ea8785c9d881936b2174be6a58c0055 Mon Sep 17 00:00:00 2001
+From: Alex Stewart <alex.stewart@ni.com>
+Date: Wed, 11 Oct 2023 16:54:21 -0400
+Subject: [PATCH 08/17] sds: fix int overflow warning in sample calculations
+
+The sds_*byte_read() functions compose their uint_32 sample buffers by
+shifting 7bit samples into a 32bit wide buffer, and adding them
+together. Because the 7bit samples are stored in 32bit ints, code
+fuzzers become concerned that the addition operation can overflow and
+cause undefined behavior.
+
+Instead, bitwise-OR the bytes together - which should accomplish the
+same arithmetic operation, without risking an int-overflow.
+
+CVE: CVE-2022-33065
+Fixes: https://github.com/libsndfile/libsndfile/issues/833
+
+Signed-off-by: Alex Stewart <alex.stewart@ni.com>
+
+Do the same for the 3byte and 4byte read functions.
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/libsndfile/tree/debian/patches/CVE-2022-33065/CVE-2022-33065-4.patch?h=ubuntu/jammy-security
+Upstream commit https://github.com/libsndfile/libsndfile/commit/1116fa173ea8785c9d881936b2174be6a58c0055]
+CVE: CVE-2022-33065
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/sds.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/sds.c b/src/sds.c
+index 6bc761716..2a0f164c3 100644
+--- a/src/sds.c
++++ b/src/sds.c
+@@ -454,7 +454,7 @@ sds_2byte_read (SF_PRIVATE *psf, SDS_PRIVATE *psds)
+ 
+ 	ucptr = psds->read_data + 5 ;
+ 	for (k = 0 ; k < 120 ; k += 2)
+-	{	sample = arith_shift_left (ucptr [k], 25) + arith_shift_left (ucptr [k + 1], 18) ;
++	{	sample = arith_shift_left (ucptr [k], 25) | arith_shift_left (ucptr [k + 1], 18) ;
+ 		psds->read_samples [k / 2] = (int) (sample - 0x80000000) ;
+ 		} ;
+ 
+@@ -498,7 +498,7 @@ sds_3byte_read (SF_PRIVATE *psf, SDS_PRIVATE *psds)
+ 
+ 	ucptr = psds->read_data + 5 ;
+ 	for (k = 0 ; k < 120 ; k += 3)
+-	{	sample = (((uint32_t) ucptr [k]) << 25) + (ucptr [k + 1] << 18) + (ucptr [k + 2] << 11) ;
++	{	sample = (((uint32_t) ucptr [k]) << 25) | (ucptr [k + 1] << 18) | (ucptr [k + 2] << 11) ;
+ 		psds->read_samples [k / 3] = (int) (sample - 0x80000000) ;
+ 		} ;
+ 
+@@ -542,7 +542,7 @@ sds_4byte_read (SF_PRIVATE *psf, SDS_PRIVATE *psds)
+ 
+ 	ucptr = psds->read_data + 5 ;
+ 	for (k = 0 ; k < 120 ; k += 4)
+-	{	sample = (((uint32_t) ucptr [k]) << 25) + (ucptr [k + 1] << 18) + (ucptr [k + 2] << 11) + (ucptr [k + 3] << 4) ;
++	{	sample = (((uint32_t) ucptr [k]) << 25) | (ucptr [k + 1] << 18) | (ucptr [k + 2] << 11) | (ucptr [k + 3] << 4) ;
+ 		psds->read_samples [k / 4] = (int) (sample - 0x80000000) ;
+ 		} ;
+ 
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065-5.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065-5.patch
new file mode 100644
index 0000000000..a96e5fefa4
--- /dev/null
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065-5.patch
@@ -0,0 +1,39 @@
+From 23188c9b1c34f06ca7f17243425d59403e9eb0db Mon Sep 17 00:00:00 2001
+From: Alex Stewart <alex.stewart@ni.com>
+Date: Wed, 11 Oct 2023 17:26:51 -0400
+Subject: [PATCH 09/17] aiff: fix int overflow when counting header elements
+
+aiff_read_basc_chunk() tries to count the AIFF header size by keeping
+track of the bytes returned by psf_binheader_readf(). Though improbable,
+it is technically possible for these added bytes to exceed the int-sized
+`count` accumulator.
+
+Use a 64-bit sf_count_t type for `count`, to ensure that it always has
+enough numeric space.
+
+CVE: CVE-2022-33065
+Fixes: https://github.com/libsndfile/libsndfile/issues/833
+
+Signed-off-by: Alex Stewart <alex.stewart@ni.com>
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/libsndfile/tree/debian/patches/CVE-2022-33065/CVE-2022-33065-5.patch?h=ubuntu/jammy-security
+Upstream commit https://github.com/libsndfile/libsndfile/commit/23188c9b1c34f06ca7f17243425d59403e9eb0db]
+CVE: CVE-2022-33065
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/aiff.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/aiff.c b/src/aiff.c
+index ac3655e9d..6d8f1bc83 100644
+--- a/src/aiff.c
++++ b/src/aiff.c
+@@ -1702,7 +1702,7 @@ static int
+ aiff_read_basc_chunk (SF_PRIVATE * psf, int datasize)
+ {	const char * type_str ;
+ 	basc_CHUNK bc ;
+-	int count ;
++	sf_count_t count ;
+ 
+ 	count = psf_binheader_readf (psf, "E442", &bc.version, &bc.numBeats, &bc.rootNote) ;
+ 	count += psf_binheader_readf (psf, "E222", &bc.scaleType, &bc.sigNumerator, &bc.sigDenominator) ;
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065-6.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065-6.patch
new file mode 100644
index 0000000000..0f89c47d59
--- /dev/null
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065-6.patch
@@ -0,0 +1,82 @@
+From 00bd0320d895ef5f3027c75a9df26546bc18f8b7 Mon Sep 17 00:00:00 2001
+From: Alex Stewart <alex.stewart@ni.com>
+Date: Wed, 11 Oct 2023 17:43:02 -0400
+Subject: [PATCH 10/17] ircam: fix int overflow in ircam_read_header()
+
+When reading the IRCAM header, it is possible for the calculated
+blockwidth to exceed the bounds of a signed int32.
+
+Use a 64bit sf_count_t to store the blockwidth.
+
+CVE: CVE-2022-33065
+Fixes: https://github.com/libsndfile/libsndfile/issues/833
+
+Signed-off-by: Alex Stewart <alex.stewart@ni.com>
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/libsndfile/tree/debian/patches/CVE-2022-33065/CVE-2022-33065-6.patch?h=ubuntu/jammy-security
+Upstream commit https://github.com/libsndfile/libsndfile/commit/00bd0320d895ef5f3027c75a9df26546bc18f8b7]
+CVE: CVE-2022-33065
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/common.h |  2 +-
+ src/ircam.c  | 10 +++++-----
+ 2 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/common.h b/src/common.h
+index cd9ac8b07..01f6ae095 100644
+--- a/src/common.h
++++ b/src/common.h
+@@ -439,7 +439,7 @@ typedef struct sf_private_tag
+ 	sf_count_t		datalength ;	/* Length in bytes of the audio data. */
+ 	sf_count_t		dataend ;		/* Offset to file tailer. */
+ 
+-	int				blockwidth ;	/* Size in bytes of one set of interleaved samples. */
++	sf_count_t		blockwidth ;	/* Size in bytes of one set of interleaved samples. */
+ 	int				bytewidth ;		/* Size in bytes of one sample (one channel). */
+ 
+ 	void			*dither ;
+diff --git a/src/ircam.c b/src/ircam.c
+index 8e7cdba81..3d73ba442 100644
+--- a/src/ircam.c
++++ b/src/ircam.c
+@@ -171,35 +171,35 @@ ircam_read_header	(SF_PRIVATE *psf)
+ 	switch (encoding)
+ 	{	case IRCAM_PCM_16 :
+ 				psf->bytewidth = 2 ;
+-				psf->blockwidth = psf->sf.channels * psf->bytewidth ;
++				psf->blockwidth = (sf_count_t) psf->sf.channels * psf->bytewidth ;
+ 
+ 				psf->sf.format = SF_FORMAT_IRCAM | SF_FORMAT_PCM_16 ;
+ 				break ;
+ 
+ 		case IRCAM_PCM_32 :
+ 				psf->bytewidth = 4 ;
+-				psf->blockwidth = psf->sf.channels * psf->bytewidth ;
++				psf->blockwidth = (sf_count_t) psf->sf.channels * psf->bytewidth ;
+ 
+ 				psf->sf.format = SF_FORMAT_IRCAM | SF_FORMAT_PCM_32 ;
+ 				break ;
+ 
+ 		case IRCAM_FLOAT :
+ 				psf->bytewidth = 4 ;
+-				psf->blockwidth = psf->sf.channels * psf->bytewidth ;
++				psf->blockwidth = (sf_count_t) psf->sf.channels * psf->bytewidth ;
+ 
+ 				psf->sf.format = SF_FORMAT_IRCAM | SF_FORMAT_FLOAT ;
+ 				break ;
+ 
+ 		case IRCAM_ALAW :
+ 				psf->bytewidth = 1 ;
+-				psf->blockwidth = psf->sf.channels * psf->bytewidth ;
++				psf->blockwidth = (sf_count_t) psf->sf.channels * psf->bytewidth ;
+ 
+ 				psf->sf.format = SF_FORMAT_IRCAM | SF_FORMAT_ALAW ;
+ 				break ;
+ 
+ 		case IRCAM_ULAW :
+ 				psf->bytewidth = 1 ;
+-				psf->blockwidth = psf->sf.channels * psf->bytewidth ;
++				psf->blockwidth = (sf_count_t) psf->sf.channels * psf->bytewidth ;
+ 
+ 				psf->sf.format = SF_FORMAT_IRCAM | SF_FORMAT_ULAW ;
+ 				break ;
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065-7.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065-7.patch
new file mode 100644
index 0000000000..a26c14294d
--- /dev/null
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065-7.patch
@@ -0,0 +1,48 @@
+From 590608bbbded2ca0966dc89c5d9b6bf659f4cb71 Mon Sep 17 00:00:00 2001
+From: Alex Stewart <alex.stewart@ni.com>
+Date: Wed, 11 Oct 2023 16:12:22 -0400
+Subject: [PATCH 11/17] mat4/mat5: fix int overflow when calculating blockwidth
+
+Pre-cast the components of the blockwidth calculation to sf_count_t to
+avoid overflowing integers during calculation.
+
+CVE: CVE-2022-33065
+Fixes: https://github.com/libsndfile/libsndfile/issues/833
+
+Signed-off-by: Alex Stewart <alex.stewart@ni.com>
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/libsndfile/tree/debian/patches/CVE-2022-33065/CVE-2022-33065-7.patch?h=ubuntu/jammy-security
+Upstream commit https://github.com/libsndfile/libsndfile/commit/590608bbbded2ca0966dc89c5d9b6bf659f4cb71]
+CVE: CVE-2022-33065
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/mat4.c | 2 +-
+ src/mat5.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/mat4.c b/src/mat4.c
+index 575683ba1..9f046f0c6 100644
+--- a/src/mat4.c
++++ b/src/mat4.c
+@@ -104,7 +104,7 @@ mat4_open	(SF_PRIVATE *psf)
+ 
+ 	psf->container_close = mat4_close ;
+ 
+-	psf->blockwidth = psf->bytewidth * psf->sf.channels ;
++	psf->blockwidth = (sf_count_t) psf->bytewidth * psf->sf.channels ;
+ 
+ 	switch (subformat)
+ 	{	case SF_FORMAT_PCM_16 :
+diff --git a/src/mat5.c b/src/mat5.c
+index da5a6eca0..20f0ea64b 100644
+--- a/src/mat5.c
++++ b/src/mat5.c
+@@ -114,7 +114,7 @@ mat5_open	(SF_PRIVATE *psf)
+ 
+ 	psf->container_close = mat5_close ;
+ 
+-	psf->blockwidth = psf->bytewidth * psf->sf.channels ;
++	psf->blockwidth = (sf_count_t) psf->bytewidth * psf->sf.channels ;
+ 
+ 	switch (subformat)
+ 	{	case SF_FORMAT_PCM_U8 :
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065-8.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065-8.patch
new file mode 100644
index 0000000000..641f73ad55
--- /dev/null
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065-8.patch
@@ -0,0 +1,179 @@
+From 4ec860910a4ee91ed4fdf1c0a49f2dad96d595c9 Mon Sep 17 00:00:00 2001
+From: Alex Stewart <alex.stewart@ni.com>
+Date: Mon, 16 Oct 2023 12:37:47 -0400
+Subject: [PATCH 12/17] common: fix int overflow in psf_binheader_readf()
+
+The psf_binheader_readf() function attempts to count and return the
+number of bytes traversed in the header. During this accumulation, it is
+possible to overflow the int-sized byte_count variable.
+
+Avoid this overflow by checking that the accumulated bytes do not exceed
+INT_MAX and throwing an error if they do. This implies that files with
+multi-gigabyte headers threaten to produce this error, but I imagine
+those files don't really exist - and this error is better than the
+undefined behavior which would have resulted previously.
+
+CVE: CVE-2022-33065
+Fixes: https://github.com/libsndfile/libsndfile/issues/833
+
+Signed-off-by: Alex Stewart <alex.stewart@ni.com>
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/libsndfile/tree/debian/patches/CVE-2022-33065/CVE-2022-33065-8.patch?h=ubuntu/jammy-security
+Upstream commit https://github.com/libsndfile/libsndfile/commit/4ec860910a4ee91ed4fdf1c0a49f2dad96d595c9]
+CVE: CVE-2022-33065
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/common.c | 36 ++++++++++++++++++++++++------------
+ 1 file changed, 24 insertions(+), 12 deletions(-)
+
+--- libsndfile-1.0.31.orig/src/common.c
++++ libsndfile-1.0.31/src/common.c
+@@ -18,6 +18,7 @@
+ 
+ #include <config.h>
+ 
++#include <limits.h>
+ #include <stdarg.h>
+ #include <string.h>
+ #if HAVE_UNISTD_H
+@@ -962,6 +963,7 @@ psf_binheader_readf (SF_PRIVATE *psf, ch
+ 	double			*doubleptr ;
+ 	char			c ;
+ 	int				byte_count = 0, count = 0 ;
++	int				read_bytes = 0 ;
+ 
+ 	if (! format)
+ 		return psf_ftell (psf) ;
+@@ -970,6 +972,7 @@ psf_binheader_readf (SF_PRIVATE *psf, ch
+ 
+ 	while ((c = *format++))
+ 	{
++		read_bytes = 0 ;
+ 		if (psf->header.indx + 16 >= psf->header.len && psf_bump_header_allocation (psf, 16))
+ 			return count ;
+ 
+@@ -986,7 +989,7 @@ psf_binheader_readf (SF_PRIVATE *psf, ch
+ 					intptr = va_arg (argptr, unsigned int*) ;
+ 					*intptr = 0 ;
+ 					ucptr = (unsigned char*) intptr ;
+-					byte_count += header_read (psf, ucptr, sizeof (int)) ;
++					read_bytes = header_read (psf, ucptr, sizeof (int)) ;
+ 					*intptr = GET_MARKER (ucptr) ;
+ 					break ;
+ 
+@@ -994,7 +997,7 @@ psf_binheader_readf (SF_PRIVATE *psf, ch
+ 					intptr = va_arg (argptr, unsigned int*) ;
+ 					*intptr = 0 ;
+ 					ucptr = (unsigned char*) intptr ;
+-					byte_count += header_read (psf, sixteen_bytes, sizeof (sixteen_bytes)) ;
++					read_bytes = header_read (psf, sixteen_bytes, sizeof (sixteen_bytes)) ;
+ 					{	int k ;
+ 						intdata = 0 ;
+ 						for (k = 0 ; k < 16 ; k++)
+@@ -1006,14 +1009,14 @@ psf_binheader_readf (SF_PRIVATE *psf, ch
+ 			case '1' :
+ 					charptr = va_arg (argptr, char*) ;
+ 					*charptr = 0 ;
+-					byte_count += header_read (psf, charptr, sizeof (char)) ;
++					read_bytes = header_read (psf, charptr, sizeof (char)) ;
+ 					break ;
+ 
+ 			case '2' : /* 2 byte value with the current endian-ness */
+ 					shortptr = va_arg (argptr, unsigned short*) ;
+ 					*shortptr = 0 ;
+ 					ucptr = (unsigned char*) shortptr ;
+-					byte_count += header_read (psf, ucptr, sizeof (short)) ;
++					read_bytes = header_read (psf, ucptr, sizeof (short)) ;
+ 					if (psf->rwf_endian == SF_ENDIAN_BIG)
+ 						*shortptr = GET_BE_SHORT (ucptr) ;
+ 					else
+@@ -1023,7 +1026,7 @@ psf_binheader_readf (SF_PRIVATE *psf, ch
+ 			case '3' : /* 3 byte value with the current endian-ness */
+ 					intptr = va_arg (argptr, unsigned int*) ;
+ 					*intptr = 0 ;
+-					byte_count += header_read (psf, sixteen_bytes, 3) ;
++					read_bytes = header_read (psf, sixteen_bytes, 3) ;
+ 					if (psf->rwf_endian == SF_ENDIAN_BIG)
+ 						*intptr = GET_BE_3BYTE (sixteen_bytes) ;
+ 					else
+@@ -1034,7 +1037,7 @@ psf_binheader_readf (SF_PRIVATE *psf, ch
+ 					intptr = va_arg (argptr, unsigned int*) ;
+ 					*intptr = 0 ;
+ 					ucptr = (unsigned char*) intptr ;
+-					byte_count += header_read (psf, ucptr, sizeof (int)) ;
++					read_bytes = header_read (psf, ucptr, sizeof (int)) ;
+ 					if (psf->rwf_endian == SF_ENDIAN_BIG)
+ 						*intptr = psf_get_be32 (ucptr, 0) ;
+ 					else
+@@ -1044,7 +1047,7 @@ psf_binheader_readf (SF_PRIVATE *psf, ch
+ 			case '8' : /* 8 byte value with the current endian-ness */
+ 					countptr = va_arg (argptr, sf_count_t *) ;
+ 					*countptr = 0 ;
+-					byte_count += header_read (psf, sixteen_bytes, 8) ;
++					read_bytes = header_read (psf, sixteen_bytes, 8) ;
+ 					if (psf->rwf_endian == SF_ENDIAN_BIG)
+ 						countdata = psf_get_be64 (sixteen_bytes, 0) ;
+ 					else
+@@ -1055,7 +1058,7 @@ psf_binheader_readf (SF_PRIVATE *psf, ch
+ 			case 'f' : /* Float conversion */
+ 					floatptr = va_arg (argptr, float *) ;
+ 					*floatptr = 0.0 ;
+-					byte_count += header_read (psf, floatptr, sizeof (float)) ;
++					read_bytes = header_read (psf, floatptr, sizeof (float)) ;
+ 					if (psf->rwf_endian == SF_ENDIAN_BIG)
+ 						*floatptr = float32_be_read ((unsigned char*) floatptr) ;
+ 					else
+@@ -1065,7 +1068,7 @@ psf_binheader_readf (SF_PRIVATE *psf, ch
+ 			case 'd' : /* double conversion */
+ 					doubleptr = va_arg (argptr, double *) ;
+ 					*doubleptr = 0.0 ;
+-					byte_count += header_read (psf, doubleptr, sizeof (double)) ;
++					read_bytes = header_read (psf, doubleptr, sizeof (double)) ;
+ 					if (psf->rwf_endian == SF_ENDIAN_BIG)
+ 						*doubleptr = double64_be_read ((unsigned char*) doubleptr) ;
+ 					else
+@@ -1089,7 +1092,7 @@ psf_binheader_readf (SF_PRIVATE *psf, ch
+ 					charptr = va_arg (argptr, char*) ;
+ 					count = va_arg (argptr, size_t) ;
+ 					memset (charptr, 0, count) ;
+-					byte_count += header_read (psf, charptr, count) ;
++					read_bytes = header_read (psf, charptr, count) ;
+ 					break ;
+ 
+ 			case 'G' :
+@@ -1100,7 +1103,7 @@ psf_binheader_readf (SF_PRIVATE *psf, ch
+ 					if (psf->header.indx + count >= psf->header.len && psf_bump_header_allocation (psf, count))
+ 						return 0 ;
+ 
+-					byte_count += header_gets (psf, charptr, count) ;
++					read_bytes = header_gets (psf, charptr, count) ;
+ 					break ;
+ 
+ 			case 'z' :
+@@ -1124,7 +1127,7 @@ psf_binheader_readf (SF_PRIVATE *psf, ch
+ 			case 'j' :	/* Seek to position from current position. */
+ 					count = va_arg (argptr, size_t) ;
+ 					header_seek (psf, count, SEEK_CUR) ;
+-					byte_count += count ;
++					read_bytes = count ;
+ 					break ;
+ 
+ 			default :
+@@ -1132,8 +1135,17 @@ psf_binheader_readf (SF_PRIVATE *psf, ch
+ 				psf->error = SFE_INTERNAL ;
+ 				break ;
+ 			} ;
++
++		if (read_bytes > 0 && byte_count > (INT_MAX - read_bytes))
++		{	psf_log_printf (psf, "Header size exceeds INT_MAX. Aborting.", c) ;
++			psf->error = SFE_INTERNAL ;
++			break ;
++		} else
++		{	byte_count += read_bytes ;
+ 		} ;
+ 
++		} ;	/*end while*/
++
+ 	va_end (argptr) ;
+ 
+ 	return byte_count ;
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065-9.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065-9.patch
new file mode 100644
index 0000000000..88dc80addf
--- /dev/null
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2022-33065-9.patch
@@ -0,0 +1,231 @@
+From 6e162cb767e81cd15f4dc2a2fa253d2e36adfd70 Mon Sep 17 00:00:00 2001
+From: Alex Stewart <alex.stewart@ni.com>
+Date: Thu, 19 Oct 2023 14:07:19 -0400
+Subject: [PATCH 13/17] nms_adpcm: fix int overflow in signal estimate
+
+It is possible (though functionally incorrect) for the signal estimate
+calculation in nms_adpcm_update() to overflow the int value of s_e,
+resulting in undefined behavior.
+
+Since adpcm state signal values are never practically larger than
+16 bits, use smaller numeric sizes throughout the file to avoid the
+overflow.
+
+CVE: CVE-2022-33065
+Fixes: https://github.com/libsndfile/libsndfile/issues/833
+
+Authored-by: Arthur Taylor <art@ified.ca>
+Signed-off-by: Alex Stewart <alex.stewart@ni.com>
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/libsndfile/tree/debian/patches/CVE-2022-33065/CVE-2022-33065-9.patch?h=ubuntu/jammy-security
+Upstream commit https://github.com/libsndfile/libsndfile/commit/6e162cb767e81cd15f4dc2a2fa253d2e36adfd70]
+CVE: CVE-2022-33065
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/nms_adpcm.c | 81 ++++++++++++++++++++++++-------------------------
+ 1 file changed, 40 insertions(+), 41 deletions(-)
+
+--- libsndfile-1.2.0.orig/src/nms_adpcm.c
++++ libsndfile-1.2.0/src/nms_adpcm.c
+@@ -48,36 +48,36 @@
+ /* Variable names from ITU G.726 spec */
+ struct nms_adpcm_state
+ {	/* Log of the step size multiplier. Operated on by codewords. */
+-	int yl ;
++	short yl ;
+ 
+ 	/* Quantizer step size multiplier. Generated from yl. */
+-	int y ;
++	short y ;
+ 
+ 	/* Coefficents of the pole predictor */
+-	int a [2] ;
++	short a [2] ;
+ 
+ 	/* Coefficents of the zero predictor  */
+-	int b [6] ;
++	short b [6] ;
+ 
+ 	/* Previous quantized deltas (multiplied by 2^14) */
+-	int d_q [7] ;
++	short d_q [7] ;
+ 
+ 	/* d_q [x] + s_ez [x], used by the pole-predictor for signs only. */
+-	int p [3] ;
++	short p [3] ;
+ 
+ 	/* Previous reconstructed signal values. */
+-	int s_r [2] ;
++	short s_r [2] ;
+ 
+ 	/* Zero predictor components of the signal estimate. */
+-	int s_ez ;
++	short s_ez ;
+ 
+ 	/* Signal estimate, (including s_ez). */
+-	int s_e ;
++	short s_e ;
+ 
+ 	/* The most recent codeword (enc:generated, dec:inputted) */
+-	int Ik ;
++	char Ik ;
+ 
+-	int parity ;
++	char parity ;
+ 
+ 	/*
+ 	** Offset into code tables for the bitrate.
+@@ -109,7 +109,7 @@ typedef struct
+ } NMS_ADPCM_PRIVATE ;
+ 
+ /* Pre-computed exponential interval used in the antilog approximation. */
+-static unsigned int table_expn [] =
++static unsigned short table_expn [] =
+ {	0x4000, 0x4167, 0x42d5, 0x444c,	0x45cb, 0x4752, 0x48e2, 0x4a7a,
+ 	0x4c1b, 0x4dc7, 0x4f7a, 0x5138,	0x52ff, 0x54d1, 0x56ac, 0x5892,
+ 	0x5a82, 0x5c7e, 0x5e84, 0x6096,	0x62b4, 0x64dd, 0x6712, 0x6954,
+@@ -117,21 +117,21 @@ static unsigned int table_expn [] =
+ } ;
+ 
+ /* Table mapping codewords to scale factor deltas. */
+-static int table_scale_factor_step [] =
++static short table_scale_factor_step [] =
+ {	0x0,	0x0,	0x0,	0x0,	0x4b0,	0x0,	0x0,	0x0,	/* 2-bit */
+ 	-0x3c,	0x0,	0x90,	0x0,	0x2ee,	0x0,	0x898,	0x0,	/* 3-bit */
+ 	-0x30,	0x12,	0x6b,	0xc8,	0x188,	0x2e0,	0x551,	0x1150,	/* 4-bit */
+ } ;
+ 
+ /* Table mapping codewords to quantized delta interval steps. */
+-static unsigned int table_step [] =
++static unsigned short table_step [] =
+ {	0x73F,	0,		0,		0,		0x1829,	0,		0,		0,		/* 2-bit */
+ 	0x3EB,	0,		0xC18,	0,		0x1581,	0,		0x226E,	0,		/* 3-bit */
+ 	0x20C,	0x635,	0xA83,	0xF12,	0x1418,	0x19E3,	0x211A,	0x2BBA,	/* 4-bit */
+ } ;
+ 
+ /* Binary search lookup table for quantizing using table_step. */
+-static int table_step_search [] =
++static short table_step_search [] =
+ {	0,		0x1F6D,	0,		-0x1F6D,	0,		0,			0,			0, /* 2-bit */
+ 	0x1008,	0x1192,	0,		-0x219A,	0x1656,	-0x1656,	0,			0, /* 3-bit */
+ 	0x872,	0x1277,	-0x8E6,	-0x232B,	0xD06,	-0x17D7,	-0x11D3,	0, /* 4-bit */
+@@ -179,23 +179,23 @@ static sf_count_t nms_adpcm_seek (SF_PRI
+ ** Maps [1,20480] to [1,1024] in an exponential relationship. This is
+ ** approximately ret = b^exp where b = e^(ln(1024)/ln(20480)) ~= 1.0003385
+ */
+-static inline int
+-nms_adpcm_antilog (int exp)
+-{	int ret ;
+-
+-	ret = 0x1000 ;
+-	ret += (((exp & 0x3f) * 0x166b) >> 12) ;
+-	ret *= table_expn [(exp & 0x7c0) >> 6] ;
+-	ret >>= (26 - (exp >> 11)) ;
++static inline short
++nms_adpcm_antilog (short exp)
++{	int_fast32_t r ;
++
++	r = 0x1000 ;
++	r += (((int_fast32_t) (exp & 0x3f) * 0x166b) >> 12) ;
++	r *= table_expn [(exp & 0x7c0) >> 6] ;
++	r >>= (26 - (exp >> 11)) ;
+ 
+-	return ret ;
++	return (short) r ;
+ } /* nms_adpcm_antilog */
+ 
+ static void
+ nms_adpcm_update (struct nms_adpcm_state *s)
+ {	/* Variable names from ITU G.726 spec */
+-	int a1ul ;
+-	int fa1 ;
++	short a1ul, fa1 ;
++	int_fast32_t se ;
+ 	int i ;
+ 
+ 	/* Decay and Modify the scale factor in the log domain based on the codeword. */
+@@ -222,7 +222,7 @@ nms_adpcm_update (struct nms_adpcm_state
+ 	else if (fa1 > 256)
+ 		fa1 = 256 ;
+ 
+-	s->a [0] = (0xff * s->a [0]) >> 8 ;
++	s->a [0] = (s->a [0] * 0xff) >> 8 ;
+ 	if (s->p [0] != 0 && s->p [1] != 0 && ((s->p [0] ^ s->p [1]) < 0))
+ 		s->a [0] -= 192 ;
+ 	else
+@@ -230,7 +230,7 @@ nms_adpcm_update (struct nms_adpcm_state
+ 		fa1 = -fa1 ;
+ 		}
+ 
+-	s->a [1] = fa1 + ((0xfe * s->a [1]) >> 8) ;
++	s->a [1] = fa1 + ((s->a [1] * 0xfe) >> 8) ;
+ 	if (s->p [0] != 0 && s->p [2] != 0 && ((s->p [0] ^ s->p [2]) < 0))
+ 		s->a [1] -= 128 ;
+ 	else
+@@ -250,19 +250,18 @@ nms_adpcm_update (struct nms_adpcm_state
+ 			s->a [0] = a1ul ;
+ 		} ;
+ 
+-	/* Compute the zero predictor estimate. Rotate past deltas too. */
+-	s->s_ez = 0 ;
++	/* Compute the zero predictor estimate and rotate past deltas. */
++	se = 0 ;
+ 	for (i = 5 ; i >= 0 ; i--)
+-	{	s->s_ez += s->d_q [i] * s->b [i] ;
++	{	se += (int_fast32_t) s->d_q [i] * s->b [i] ;
+ 		s->d_q [i + 1] = s->d_q [i] ;
+ 		} ;
++	s->s_ez = se >> 14 ;
+ 
+-	/* Compute the signal estimate. */
+-	s->s_e = s->a [0] * s->s_r [0] + s->a [1] * s->s_r [1] + s->s_ez ;
+-
+-	/* Return to scale */
+-	s->s_ez >>= 14 ;
+-	s->s_e >>= 14 ;
++	/* Complete the signal estimate. */
++	se += (int_fast32_t) s->a [0] * s->s_r [0] ;
++	se += (int_fast32_t) s->a [1] * s->s_r [1] ;
++	s->s_e = se >> 14 ;
+ 
+ 	/* Rotate members to prepare for next iteration. */
+ 	s->s_r [1] = s->s_r [0] ;
+@@ -274,7 +273,7 @@ nms_adpcm_update (struct nms_adpcm_state
+ static int16_t
+ nms_adpcm_reconstruct_sample (struct nms_adpcm_state *s, uint8_t I)
+ {	/* Variable names from ITU G.726 spec */
+-	int dqx ;
++	int_fast32_t dqx ;
+ 
+ 	/*
+ 	** The ordering of the 12-bit right-shift is a precision loss. It agrees
+@@ -308,17 +307,17 @@ nms_adpcm_codec_init (struct nms_adpcm_s
+ /*
+ ** nms_adpcm_encode_sample()
+ **
+-** Encode a linear 16-bit pcm sample into a 2,3, or 4 bit NMS-ADPCM codeword
++** Encode a linear 16-bit pcm sample into a 2, 3, or 4 bit NMS-ADPCM codeword
+ ** using and updating the predictor state.
+ */
+ static uint8_t
+ nms_adpcm_encode_sample (struct nms_adpcm_state *s, int16_t sl)
+ {	/* Variable names from ITU G.726 spec */
+-	int d ;
++	int_fast32_t d ;
+ 	uint8_t I ;
+ 
+ 	/* Down scale the sample from 16 => ~14 bits. */
+-	sl = (sl * 0x1fdf) / 0x7fff ;
++	sl = ((int_fast32_t) sl * 0x1fdf) / 0x7fff ;
+ 
+ 	/* Compute estimate, and delta from actual value */
+ 	nms_adpcm_update (s) ;
+@@ -407,7 +406,7 @@ nms_adpcm_encode_sample (struct nms_adpc
+ */
+ static int16_t
+ nms_adpcm_decode_sample (struct nms_adpcm_state *s, uint8_t I)
+-{	int sl ;
++{	int_fast32_t sl ;
+ 
+ 	nms_adpcm_update (s) ;
+ 	sl = nms_adpcm_reconstruct_sample (s, I) ;
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb
index 20240635f7..6a6ccf7567 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb
@@ -11,7 +11,19 @@ LICENSE = "LGPL-2.1-only"
 SRC_URI = "https://github.com/libsndfile/libsndfile/releases/download/${PV}/libsndfile-${PV}.tar.bz2 \
            file://noopus.patch \
            file://0001-flac-Fix-improper-buffer-reusing-732.patch \
-           file://CVE-2022-33065.patch \
+           file://CVE-2022-33065-1.patch \
+           file://CVE-2022-33065-2.patch \
+           file://CVE-2022-33065-3.patch \
+           file://CVE-2022-33065-4.patch \
+           file://CVE-2022-33065-5.patch \
+           file://CVE-2022-33065-6.patch \
+           file://CVE-2022-33065-7.patch \
+           file://CVE-2022-33065-8.patch \
+           file://CVE-2022-33065-9.patch \
+           file://CVE-2022-33065-10.patch \
+           file://CVE-2022-33065-11.patch \
+           file://CVE-2022-33065-12.patch \
+           file://CVE-2022-33065-13.patch \
            file://CVE-2024-50612.patch \
           "
 UPSTREAM_CHECK_URI = "https://github.com/libsndfile/libsndfile/releases/"
-- 
2.25.1


