Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 602F6E8B36A
	for <webhook@archiver.kernel.org>; Tue,  3 Feb 2026 21:47:41 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5380.1770155258849040854
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Feb 2026 13:47:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=OPcg5rtN;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20260203214737ff591fbdb800020794-aeupg4@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20260203214737ff591fbdb800020794
        for <openembedded-core@lists.openembedded.org>;
        Tue, 03 Feb 2026 22:47:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=X3TdJ3wdvsYaJ5R9SFvp3S7dTmDWK0NY0YjqprfcUSo=;
 b=OPcg5rtNFubsPo3rbWbUToxVjXpbXSsvzg5XyLKdAiikDWgT84Uj7bIDXJyL5qSuQRx1sZ
 X7NcqBN9A9sq2JGWxyCyLWWaKyZf4eA5U3PtdG97RdyeO7FrrrRYeCfDyENHyKaClDaHOuIE
 eNjw7iaQwO9OC+/gNpqpzHB0Y4vsvexQWabZTuaXJR3LvV7KM6YBugeDa9iXCMMHZadFpWud
 I5wbMnr/V2sckCPkMRztsimp9gl/mVgTeRbBN8NxRARYqpCEGM0grJzVedW6IX8VbmU6oiCV
 xc/oZ+pBsbTOxIiUlLvB3Wig9tiEz6Wrqyf17H1i3VPLc4wSYsHED3rg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][whinlatter][PATCH] libsndfile1: patch CVE-2025-56226
Date: Tue,  3 Feb 2026 22:47:33 +0100
Message-Id: <20260203214733.1918555-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Feb 2026 21:47:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230472

From: Peter Marko <peter.marko@siemens.com>

Pick patches from both PRs linked in issue mentioned in NVD report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libsndfile1/CVE-2025-56226-01.patch       | 36 ++++++++++++++++
 .../libsndfile1/CVE-2025-56226-02.patch       | 43 +++++++++++++++++++
 .../libsndfile/libsndfile1_1.2.2.bb           |  2 +
 3 files changed, 81 insertions(+)
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2025-56226-01.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2025-56226-02.patch

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2025-56226-01.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2025-56226-01.patch
new file mode 100644
index 0000000000..e6e2bc12dd
--- /dev/null
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2025-56226-01.patch
@@ -0,0 +1,36 @@
+From d9a35ea0d5c64c19dd635ae578e0028df8f66d6a Mon Sep 17 00:00:00 2001
+From: Sisyphus-wang <43361974+Sisyphus-wang@users.noreply.github.com>
+Date: Fri, 11 Jul 2025 15:14:48 +0800
+Subject: [PATCH] Update mpeg_l3_encode.c
+
+fix memoryLeak bug
+
+CVE: CVE-2025-56226
+Upstream-Status: Backport [https://github.com/libsndfile/libsndfile/commit/d9a35ea0d5c64c19dd635ae578e0028df8f66d6a]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/mpeg_l3_encode.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/mpeg_l3_encode.c b/src/mpeg_l3_encode.c
+index 97324f79..04b1d501 100644
+--- a/src/mpeg_l3_encode.c
++++ b/src/mpeg_l3_encode.c
+@@ -87,7 +87,8 @@ mpeg_l3_encoder_init (SF_PRIVATE *psf, int info_tag)
+ 	if (! (pmpeg->lamef = lame_init ()))
+ 		return SFE_MALLOC_FAILED ;
+ 
+-	pmpeg->compression = -1.0 ; /* Unset */
++	psf->codec_close	= mpeg_l3_encoder_close ; /* Set psf->codec_close early*/
++ 	pmpeg->compression = -1.0 ; /* Unset */
+ 
+ 	lame_set_in_samplerate (pmpeg->lamef, psf->sf.samplerate) ;
+ 	lame_set_num_channels (pmpeg->lamef, psf->sf.channels) ;
+@@ -115,7 +116,6 @@ mpeg_l3_encoder_init (SF_PRIVATE *psf, int info_tag)
+ 		}
+ 
+ 	psf->sf.seekable	= 0 ;
+-	psf->codec_close	= mpeg_l3_encoder_close ;
+ 	psf->byterate		= mpeg_l3_encoder_byterate ;
+ 	psf->datalength		= 0 ;
+ 
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2025-56226-02.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2025-56226-02.patch
new file mode 100644
index 0000000000..077200be6b
--- /dev/null
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2025-56226-02.patch
@@ -0,0 +1,43 @@
+From 68f6c16fe1407eff4cdde158566694c3ed666c2f Mon Sep 17 00:00:00 2001
+From: Sisyphus-wang <43361974+Sisyphus-wang@users.noreply.github.com>
+Date: Fri, 11 Jul 2025 15:26:24 +0800
+Subject: [PATCH] Update sndfile-convert.c
+
+fix memoryLeak in sndfile-conver.c
+
+CVE: CVE-2025-56226
+Upstream-Status: Backport [https://github.com/libsndfile/libsndfile/commit/68f6c16fe1407eff4cdde158566694c3ed666c2f]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ programs/sndfile-convert.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/programs/sndfile-convert.c b/programs/sndfile-convert.c
+index 95f59d3c..a9f0cfac 100644
+--- a/programs/sndfile-convert.c
++++ b/programs/sndfile-convert.c
+@@ -301,6 +301,7 @@ main (int argc, char * argv [])
+ 
+ 	if ((sfinfo.format = sfe_file_type_of_ext (outfilename, sfinfo.format)) == 0)
+ 	{	printf ("Error : Not able to determine output file type for %s.\n", outfilename) ;
++	 	sf_close (infile) ;
+ 		return 1 ;
+ 		} ;
+ 
+@@ -344,6 +345,7 @@ main (int argc, char * argv [])
+ 	/* Open the output file. */
+ 	if ((outfile = sf_open (outfilename, SFM_WRITE, &sfinfo)) == NULL)
+ 	{	printf ("Not able to open output file %s : %s\n", outfilename, sf_strerror (NULL)) ;
++	 	sf_close (infile) ;
+ 		return 1 ;
+ 		} ;
+ 
+@@ -360,6 +362,8 @@ main (int argc, char * argv [])
+ 			|| (infileminor == SF_FORMAT_MPEG_LAYER_III) || (outfileminor == SF_FORMAT_MPEG_LAYER_III))
+ 	{	if (sfe_copy_data_fp (outfile, infile, sfinfo.channels, normalize) != 0)
+ 		{	printf ("Error : Not able to decode input file %s.\n", infilename) ;
++		 	sf_close (infile) ;
++		 	sf_close (outfile) ;
+ 			return 1 ;
+ 			} ;
+ 		}
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb
index 0ec40dda7a..c1fb522306 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb
@@ -12,6 +12,8 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/libsndfile-${PV}.tar.xz \
            file://cve-2022-33065.patch \
            file://CVE-2024-50612.patch \
            file://0001-Include-stdbool.h-instead-of-redefining-bool-true-an.patch \
+           file://CVE-2025-56226-01.patch \
+           file://CVE-2025-56226-02.patch \
           "
 GITHUB_BASE_URI = "https://github.com/libsndfile/libsndfile/releases/"
 

