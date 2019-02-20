Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5F45D79BA6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 08:54:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x1K8sEsm026871
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 00:54:49 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.435.0; Wed, 20 Feb 2019 00:54:21 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Feb 2019 16:54:20 +0800
Message-ID: <1550652860-174988-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] libsndfile1: Security fix CVE-2018-19432
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Feb 2019 08:54:59 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../libsndfile/libsndfile1/CVE-2018-19432.patch    | 115 +++++++++++++++++++++
 .../libsndfile/libsndfile1_1.0.28.bb               |   1 +
 2 files changed, 116 insertions(+)
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2018-19432.patch

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2018-19432.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2018-19432.patch
new file mode 100644
index 0000000..8ded2c0
--- /dev/null
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2018-19432.patch
@@ -0,0 +1,115 @@
+From 6f3266277bed16525f0ac2f0f03ff4626f1923e5 Mon Sep 17 00:00:00 2001
+From: Erik de Castro Lopo <erikd@mega-nerd.com>
+Date: Thu, 8 Mar 2018 18:00:21 +1100
+Subject: [PATCH] Fix max channel count bug
+
+The code was allowing files to be written with a channel count of exactly
+`SF_MAX_CHANNELS` but was failing to read some file formats with the same
+channel count.
+
+Upstream-Status: Backport [https://github.com/erikd/libsndfile/
+commit/6f3266277bed16525f0ac2f0f03ff4626f1923e5]
+
+CVE: CVE-2018-19432
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+---
+ src/aiff.c |    6 +++---
+ src/rf64.c |    4 ++--
+ src/w64.c  |    4 ++--
+ src/wav.c  |    4 ++--
+ 4 files changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/src/aiff.c b/src/aiff.c
+index fbd43cb..6386bce 100644
+--- a/src/aiff.c
++++ b/src/aiff.c
+@@ -1,5 +1,5 @@
+ /*
+-** Copyright (C) 1999-2016 Erik de Castro Lopo <erikd@mega-nerd.com>
++** Copyright (C) 1999-2018 Erik de Castro Lopo <erikd@mega-nerd.com>
+ ** Copyright (C) 2005 David Viens <davidv@plogue.com>
+ **
+ ** This program is free software; you can redistribute it and/or modify
+@@ -950,7 +950,7 @@ aiff_read_header (SF_PRIVATE *psf, COMM_
+ 	if (psf->sf.channels < 1)
+ 		return SFE_CHANNEL_COUNT_ZERO ;
+ 
+-	if (psf->sf.channels >= SF_MAX_CHANNELS)
++	if (psf->sf.channels > SF_MAX_CHANNELS)
+ 		return SFE_CHANNEL_COUNT ;
+ 
+ 	if (! (found_chunk & HAVE_FORM))
+@@ -1030,7 +1030,7 @@ aiff_read_comm_chunk (SF_PRIVATE *psf, C
+ 	psf_log_printf (psf, "  Sample Rate : %d\n", samplerate) ;
+ 	psf_log_printf (psf, "  Frames      : %u%s\n", comm_fmt->numSampleFrames, (comm_fmt->numSampleFrames == 0 && psf->filelength > 104) ? " (Should not be 0)" : "") ;
+ 
+-	if (comm_fmt->numChannels < 1 || comm_fmt->numChannels >= SF_MAX_CHANNELS)
++	if (comm_fmt->numChannels < 1 || comm_fmt->numChannels > SF_MAX_CHANNELS)
+ 	{	psf_log_printf (psf, "  Channels    : %d (should be >= 1 and < %d)\n", comm_fmt->numChannels, SF_MAX_CHANNELS) ;
+ 		return SFE_CHANNEL_COUNT_BAD ;
+ 		} ;
+diff --git a/src/rf64.c b/src/rf64.c
+index d57f0f3..876cd45 100644
+--- a/src/rf64.c
++++ b/src/rf64.c
+@@ -1,5 +1,5 @@
+ /*
+-** Copyright (C) 2008-2017 Erik de Castro Lopo <erikd@mega-nerd.com>
++** Copyright (C) 2008-2018 Erik de Castro Lopo <erikd@mega-nerd.com>
+ ** Copyright (C) 2009      Uli Franke <cls@nebadje.org>
+ **
+ ** This program is free software; you can redistribute it and/or modify
+@@ -382,7 +382,7 @@ rf64_read_header (SF_PRIVATE *psf, int *
+ 	if (psf->sf.channels < 1)
+ 		return SFE_CHANNEL_COUNT_ZERO ;
+ 
+-	if (psf->sf.channels >= SF_MAX_CHANNELS)
++	if (psf->sf.channels > SF_MAX_CHANNELS)
+ 		return SFE_CHANNEL_COUNT ;
+ 
+ 	/* WAVs can be little or big endian */
+diff --git a/src/w64.c b/src/w64.c
+index 939b716..a37d2c5 100644
+--- a/src/w64.c
++++ b/src/w64.c
+@@ -1,5 +1,5 @@
+ /*
+-** Copyright (C) 1999-2016 Erik de Castro Lopo <erikd@mega-nerd.com>
++** Copyright (C) 1999-2018 Erik de Castro Lopo <erikd@mega-nerd.com>
+ **
+ ** This program is free software; you can redistribute it and/or modify
+ ** it under the terms of the GNU Lesser General Public License as published by
+@@ -383,7 +383,7 @@ w64_read_header	(SF_PRIVATE *psf, int *b
+ 	if (psf->sf.channels < 1)
+ 		return SFE_CHANNEL_COUNT_ZERO ;
+ 
+-	if (psf->sf.channels >= SF_MAX_CHANNELS)
++	if (psf->sf.channels > SF_MAX_CHANNELS)
+ 		return SFE_CHANNEL_COUNT ;
+ 
+ 	psf->endian = SF_ENDIAN_LITTLE ;		/* All W64 files are little endian. */
+diff --git a/src/wav.c b/src/wav.c
+index 7bd97bc..dc97545 100644
+--- a/src/wav.c
++++ b/src/wav.c
+@@ -1,5 +1,5 @@
+ /*
+-** Copyright (C) 1999-2016 Erik de Castro Lopo <erikd@mega-nerd.com>
++** Copyright (C) 1999-2018 Erik de Castro Lopo <erikd@mega-nerd.com>
+ ** Copyright (C) 2004-2005 David Viens <davidv@plogue.com>
+ **
+ ** This program is free software; you can redistribute it and/or modify
+@@ -627,7 +627,7 @@ wav_read_header	(SF_PRIVATE *psf, int *b
+ 	if (psf->sf.channels < 1)
+ 		return SFE_CHANNEL_COUNT_ZERO ;
+ 
+-	if (psf->sf.channels >= SF_MAX_CHANNELS)
++	if (psf->sf.channels > SF_MAX_CHANNELS)
+ 		return SFE_CHANNEL_COUNT ;
+ 
+ 	if (format != WAVE_FORMAT_PCM && (parsestage & HAVE_fact) == 0)
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
index 13248f5..9700f4a 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
@@ -14,6 +14,7 @@ SRC_URI = "http://www.mega-nerd.com/libsndfile/files/libsndfile-${PV}.tar.gz \
            file://CVE-2017-14634.patch \
            file://CVE-2018-13139.patch \
            file://0001-a-ulaw-fix-multiple-buffer-overflows-432.patch \
+           file://CVE-2018-19432.patch \
           "
 
 SRC_URI[md5sum] = "646b5f98ce89ac60cdb060fcd398247c"
-- 
2.7.4


