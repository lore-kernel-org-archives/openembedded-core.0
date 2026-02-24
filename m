Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D2D6F357D5
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:33:02 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21657.1771943571423573556
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:32:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=MsVSfLHf;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4836f4cbe0bso42485485e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943569; x=1772548369; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jnakIam39fN98ejkf3nRMJu4lFWV15o/CUDBzk6775k=;
        b=MsVSfLHf7SA0NwrHAlVRNxFdhcXLodEKdmxVYaORWdfy3rS25j4wUaImYe/u40iSDY
         pj/3+t3BOwBIZBPs3F9ygk0Yx0p+xtZZ+pZRMFaFWSSEm0qMyUOb6y5J3OstdtAPlvF3
         h8dJvVcnkvSSH41glOjwJoRGsr1tuKyTylpfk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943569; x=1772548369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jnakIam39fN98ejkf3nRMJu4lFWV15o/CUDBzk6775k=;
        b=ODf3X2aOeWfMrmK+vRWtgW397rF1Oaj+tb1mrMNX+MRpvzy2bEkglGa8oztQW2qLhL
         mFTIPFBOlkaMgS25/7zTxJW5oWP+rcclirOgV9dmIIusnAeOJg5EqNFb5FA93YHBHTz9
         gpp4l32SnD+yT2mnfebPAAVGmEReXKfwEPrn9ONShhnL5sNE6hhId29J+9wxmLHrcMIH
         e8gjUi24rjvPftA1W2dS7B6xObzAm0mfuc3QFAFmLuVYSIULxkcjMx+8WQ1J9HWHCOKr
         nogQMV0qgGgkCpsSCFmPx8oMvIcynV6QPz0jwi9lEjxWBLk0UXUg40DKCXPBkpnJ9MHI
         7TGQ==
X-Gm-Message-State: AOJu0YxGtG1VXs3dVSQWh7qJ+DLmqEe6frZxteYJkJZqV3LMQVCVsUPQ
	LroMzolhCw7yTJnR49eOkFt41u5QAFyY0DXmSu7yZi2x6OA0rE+0QMnkJ3prRR3oeYuMYwBDlo/
	ahxA4
X-Gm-Gg: AZuq6aJ4M52cw4vG4SrPOnNYKRNLmiYHCS/Y+EwKTqsO4kE3+JXA56zD6uwKXaX7ZZu
	Wd/PoMAFgjP7/49jUL3uRDO1Y24oP4I39QqsiJBVryGFoM8tImpGCDkpM8ontR3J6Twsx5JfgLy
	1pKoyG6FJj49g7rNKP5lc2wKGTlmq7El09yFP4Qa9pQSS4PvrGmtC0YA7zeKfCMz0fMj2lANIeq
	lcYgWu4HtEVCG05j+Q0hYkU/0MGz2d8pWk4ZMi3bX7w45C5EE2KaPmQKMwM9fzSn4NxXfL52/4U
	CRVgpTiznhtE5k9sHBMMXpN7pIDtTcn7uh1NzDMU2b4Ezr6FAVwqd1UZytadQeL1PdqDnkOgeVD
	xZ0yRpDR0Q1MtQ/p79Fs+8jlVdHYUKoELYZX9JwBuemlaLc8HNizmiLjy1dch8kMew9ia6JtpZw
	PTboxoty1vlFKWa7KfIlH4aL/epjHRzhHyCc66XKRNQAPckxT5lu1hpyxrtzyGdQFg7dkgPFqcz
	fsP8qiKrJr5UsJBiS/UyGkA2zqPmL/sPA==
X-Received: by 2002:a05:600c:4589:b0:45d:d97c:236c with SMTP id 5b1f17b1804b1-483a95deea7mr215564145e9.21.1771943569435;
        Tue, 24 Feb 2026 06:32:49 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483b88f950esm19819895e9.15.2026.02.24.06.32.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:32:49 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 06/44] libsndfile1: patch CVE-2025-56226
Date: Tue, 24 Feb 2026 15:31:34 +0100
Message-ID: <a7b277fa6509d4ceec130be047cb2d3ccf64e552.1771943404.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771943404.git.yoann.congal@smile.fr>
References: <cover.1771943404.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:33:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231811

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
index 2a1b96d5e79..4cf42375739 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb
@@ -11,6 +11,8 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/libsndfile-${PV}.tar.xz \
            file://noopus.patch \
            file://cve-2022-33065.patch \
            file://CVE-2024-50612.patch \
+           file://CVE-2025-56226-01.patch \
+           file://CVE-2025-56226-02.patch \
           "
 GITHUB_BASE_URI = "https://github.com/libsndfile/libsndfile/releases/"
 

