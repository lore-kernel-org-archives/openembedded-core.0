Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C373FEF48EE
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 08:10:30 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.67362.1770970225866795080
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Feb 2026 00:10:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Tl1sP+h3;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4377174e1ebso434098f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 00:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770970224; x=1771575024; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LSWZ5XOBGJwC1rXBaFrfTsKrwzj8R6F6izOXdMS2uS0=;
        b=Tl1sP+h3YxctS343/4MzJmO5ZZVPVbK5NfTQQEuhu7jo7ISt+ZmRgPd0obxc5fvvTR
         TbE1JGV30vlcn31a28rgmL+9yDU9SbmLCwzme2o4tm42gv/A3jAYufeXHYXgTfui79rn
         YHBNzJf4I7WgQxALwClspMpRwumCKrzWbYsk0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770970224; x=1771575024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LSWZ5XOBGJwC1rXBaFrfTsKrwzj8R6F6izOXdMS2uS0=;
        b=YAN/0VCCzURJJ4gnwsRHgcWdK5VEqy0X8PQF2gLde8KGFgdrwl9zvnSLOp7YJ4jReL
         f6yS9IhlYG4pfhAxCNgg4LYJ1gSqDGQwM29EaNKOPA86LhzQSSBpHhu0UeSS+BGElYdV
         70sYmUeVBF3KoJOJ+TpOaNrpdfJOQyYP9oRH4qCW7Fui8Zd03n9JREM6Qa3jg7PrE4Cg
         rcxaZk1Paf1XB67x3bbZESNf2LcFjB8rCTTZfcNm1oFQKDLoGlLRTehb1lnQCZucyFQa
         6yY6FrxI807YWRL1VFwj2CU0k9jxOAZnv7VbW1vU9CUOFaIqpL0X4+MfJ4PYMrDNWq8c
         q/UQ==
X-Gm-Message-State: AOJu0Yxgw99hRV1Urc3xCyh0FXpeJnrJFRcFEkw3vxIVUi4TsnafTgQB
	/7SbsK5wdlgVa0v3h7f0PgPsXr+OXTFPayMvJuJuBl0MBYRXl88uoBpz+x24RTY6aWj0sJgJAgE
	3XiNv
X-Gm-Gg: AZuq6aIVHZkoTLCXUe3kodVSxdmVqOjymAGyEAWTIaGu8F0XMd4GtXQeWnAHk/W89A1
	sb3CMhnqn4GmPTR7ZjaitUxQbQtaK/PicjNrqnCRYxs4oPQYH367ZBrcSEu7aXvpro8ogpn9MGm
	TBHEJDCUyNYaKGGDNHqXipydqLpAqcgKQAfm+sftc71NptKSzJX7p5Y7S9f0PnUeC7KLZ4kX8np
	biSMcqoovIwZ9XBomJ5vjYRTjwkm6x2urUhrOGyCD3XnKP0pNfvtcgh3tVz+bixz1CvHPH1R7Zk
	wPjDXtu8BFyb9QpTbfSIcM3wO4aWDwT1D6gL2AgGLUKTQ7JlMfLAsHQG3bWxivoZ6CFFTUIWUtb
	BpwzmXvniP/Q/D451J2ZRk9tIp+/qcGOhBghmFrudhXcr1A8yM7s6h3DTap+fwwDGpyJ7+BSMQe
	DVYkIt+S00XO/zGhNNGzrcjhKm6kCxODKyOjiNTMFOLruEhRfeVKOKr/lHXHb9hrs7xwmMcsYZI
	seIMm+3xdehpOUdM9/6Nel10BE=
X-Received: by 2002:a5d:5d06:0:b0:437:6f0c:2ed with SMTP id ffacd0b85a97d-4379790f0a9mr1765418f8f.34.1770970223850;
        Fri, 13 Feb 2026 00:10:23 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00d6f202ec534aee64.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:d6f2:2ec:534a:ee64])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-437969fd36dsm3590815f8f.0.2026.02.13.00.10.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 00:10:23 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 08/19] libsndfile1: patch CVE-2025-56226
Date: Fri, 13 Feb 2026 09:08:26 +0100
Message-ID: <dd0a8c4a72797c4d710c87f875ba5a265c958db5.1770968514.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770968514.git.yoann.congal@smile.fr>
References: <cover.1770968514.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 08:10:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231091

From: Peter Marko <peter.marko@siemens.com>

Pick patches from both PRs linked in issue mentioned in NVD report.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 327546cc0f0bdffcbb4be690ee0b9b469db64842)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libsndfile1/CVE-2025-56226-01.patch       | 36 ++++++++++++++++
 .../libsndfile1/CVE-2025-56226-02.patch       | 43 +++++++++++++++++++
 .../libsndfile/libsndfile1_1.2.2.bb           |  2 +
 3 files changed, 81 insertions(+)
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2025-56226-01.patch
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2025-56226-02.patch

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2025-56226-01.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2025-56226-01.patch
new file mode 100644
index 00000000000..e6e2bc12dd9
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
index 00000000000..077200be6b1
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
index 0ec40dda7aa..c1fb5223067 100644
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
 

