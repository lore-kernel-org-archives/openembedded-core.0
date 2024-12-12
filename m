Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F72DE77183
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 14:08:21 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.20315.1734012492360032395
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Dec 2024 06:08:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=UMmq+1Hw;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2163bd70069so6627635ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 06:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1734012492; x=1734617292; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kHD3W5JA1Y6SYFY2i+QC4KvqHxfnm5edSjkDPasITeE=;
        b=UMmq+1HwXDbsnnIfLj1QL079ehWdwIwGIF0YBXkcfCvaIAv7I5p3okmGCDQWQwl9FO
         8ewFqWSlb1m1ZmxUWv6nXJriOlgAmTtBdurnM9LlZWzAXI8iNvWj1mFX81RNTQBWeART
         lbqq4DDd9fnlu0HEO1W6yKaibMsjtWwikvKtlyQmcjo0J+XZ7XjHiU85U4oYHrNOM7nk
         M4xw3X9eaRVOM+ZfinPdtSlusZj4IG3YWpbyWs2R05Q/JRh94RkccveixIhsc1irEjdf
         3MQirrfUsS3BCm2d7k4UqITkAUIRKbhojbX+toKoFOBLAE1Qw8kFwTwDYvLR0/gxNHaG
         4MHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734012492; x=1734617292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kHD3W5JA1Y6SYFY2i+QC4KvqHxfnm5edSjkDPasITeE=;
        b=RyPvRrm/m8LmnGUPekzoD6SFCzkTYM5npdfNqwy2IXBD5i1X22pwpDEPXSx0PdUo87
         rFSDV/SkbogerZX6E/2HbdQwGJ9KlHSo4gcPj3NfWHgncHVy4fmX7GcYWZ8NhWo+Ku+1
         QDLsyzfM+vWBlCHtYHvwPdJQnHucuW4G8LJX0f3fPy4AvFTNEAxPRavxW2dEV6awlHzX
         OT4gA5q4OO2Y+jk1Ez2K48Nc43o+Hs5RjnSqvfPuZrY+wjUhjntjHY9hbMHiYBY+8BK1
         TaIu9/feDZCjq0LZAjniS0Pdam8b0lw0B2sZnSQEpGCJmQRYK0vFGcOzrN5RrBnb/VKq
         nsuA==
X-Gm-Message-State: AOJu0YwRvcDzkfkTKZFc0KwwdWVMGb4VqmJUTj6BvRamzOBeXGXLiH8z
	sPOScE2W009KkKGGD4OpBAX5LzBg6D49IIijDldY+EiGIQbVVl422B8F3aMITkR11mH9NdR2gxJ
	1
X-Gm-Gg: ASbGncupQEbbmtcWwBlJYOpEGZFy1DpzdAUY0MWg4ITIIs8JVHUziQ5n38C6+CR0+H2
	CdtGn6RjIufaUHkdq9Nv4JBeIisdgxMre7whXGpFMEi2VJpQRKM8F8VCll58Jk3LsYqSo9Jp0TM
	9/lrhKC4V+lAe3AkoFbW8aZOp5U0Q9M/lPkXNYDKF/iOCwcuu2voDitRSqBV4EtDwjFSNWenHw5
	hEaMHsqISbQWjki9BMLoO8IS02oX60/r1/ePAyiYgtgVw==
X-Google-Smtp-Source: AGHT+IFxrRqp1GHyd0oT9Om8NPNpTd6MKOAduiUFuuNOpZQllN3Ct473XJd42XA5/a4LNXAiroDZGQ==
X-Received: by 2002:a17:902:e746:b0:215:b01a:627f with SMTP id d9443c01a7336-2177851f6f6mr103917695ad.4.1734012491292;
        Thu, 12 Dec 2024 06:08:11 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21630fee27bsm88847705ad.269.2024.12.12.06.08.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 06:08:10 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 04/12] libsndfile1: backport the fix for CVE-2024-50612
Date: Thu, 12 Dec 2024 06:07:50 -0800
Message-Id: <4d76d2f2affb95f25f1882f33305b1489a392f65.1734012352.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1734012352.git.steve@sakoman.com>
References: <cover.1734012352.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 14:08:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208638

From: Ross Burton <ross.burton@arm.com>

Backport the fix from upstream.

(From OE-Core rev: 2fc6b711a6a7252ddf13587927c06333f5a38d71)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsndfile1/CVE-2024-50612.patch          | 409 ++++++++++++++++++
 .../libsndfile/libsndfile1_1.2.2.bb           |   1 +
 2 files changed, 410 insertions(+)
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2024-50612.patch

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2024-50612.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2024-50612.patch
new file mode 100644
index 0000000000..368dd5446b
--- /dev/null
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2024-50612.patch
@@ -0,0 +1,409 @@
+From 4755f5bd7854611d92ad0f1295587b439f9950ba Mon Sep 17 00:00:00 2001
+From: Arthur Taylor <art@ified.ca>
+Date: Fri, 15 Nov 2024 19:46:53 -0800
+Subject: [PATCH] src/ogg: better error checking for vorbis. Fixes #1035
+
+CVE: CVE-2024-50612
+Upstream-Status: Backport [4755f5bd7854611d92ad0f1295587b439f9950ba]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ src/ogg.c        |  12 ++--
+ src/ogg_opus.c   |  17 +++--
+ src/ogg_vorbis.c | 170 ++++++++++++++++++++++++++---------------------
+ 3 files changed, 114 insertions(+), 85 deletions(-)
+
+diff --git a/src/ogg.c b/src/ogg.c
+index 529941af8..e2d679d41 100644
+--- a/src/ogg.c
++++ b/src/ogg.c
+@@ -211,12 +211,16 @@ ogg_read_first_page (SF_PRIVATE *psf, OGG_PRIVATE *odata)
+ 
+ int
+ ogg_write_page (SF_PRIVATE *psf, ogg_page *page)
+-{	int bytes ;
++{	int n ;
+ 
+-	bytes = psf_fwrite (page->header, 1, page->header_len, psf) ;
+-	bytes += psf_fwrite (page->body, 1, page->body_len, psf) ;
++	n = psf_fwrite (page->header, 1, page->header_len, psf) ;
++	if (n == page->header_len)
++		n += psf_fwrite (page->body, 1, page->body_len, psf) ;
+ 
+-	return bytes == page->header_len + page->body_len ;
++	if (n != page->body_len + page->header_len)
++		return -1 ;
++
++	return n ;
+ } /* ogg_write_page */
+ 
+ sf_count_t
+diff --git a/src/ogg_opus.c b/src/ogg_opus.c
+index 511653ecc..e01224b99 100644
+--- a/src/ogg_opus.c
++++ b/src/ogg_opus.c
+@@ -827,15 +827,16 @@ ogg_opus_write_header (SF_PRIVATE *psf, int UNUSED (calc_length))
+ 
+ 	/* The first page MUST only contain the header, so flush it out now */
+ 	ogg_stream_packetin (&odata->ostream, &op) ;
+-	for ( ; (nn = ogg_stream_flush (&odata->ostream, &odata->opage)) ; )
+-	{	if (! (nn = ogg_write_page (psf, &odata->opage)))
++	while (ogg_stream_flush (&odata->ostream, &odata->opage))
++	{	nn = ogg_write_page (psf, &odata->opage) ;
++		if (nn < 0)
+ 		{	psf_log_printf (psf, "Opus : Failed to write header!\n") ;
+ 			if (psf->error)
+ 				return psf->error ;
+ 			return SFE_INTERNAL ;
+ 			} ;
+ 		psf->dataoffset += nn ;
+-		}
++		} ;
+ 
+ 	/*
+ 	** Metadata Tags (manditory)
+@@ -850,15 +851,16 @@ ogg_opus_write_header (SF_PRIVATE *psf, int UNUSED (calc_length))
+ 	vorbiscomment_write_tags (psf, &op, &opustags_ident, opus_get_version_string (), - (OGG_OPUS_COMMENT_PAD)) ;
+ 	op.packetno = 2 ;
+ 	ogg_stream_packetin (&odata->ostream, &op) ;
+-	for ( ; (nn = ogg_stream_flush (&odata->ostream, &odata->opage)) ; )
+-	{	if (! (nn = ogg_write_page (psf, &odata->opage)))
++	while (ogg_stream_flush (&odata->ostream, &odata->opage))
++	{	nn = ogg_write_page (psf, &odata->opage) ;
++		if (nn < 0)
+ 		{	psf_log_printf (psf, "Opus : Failed to write comments!\n") ;
+ 			if (psf->error)
+ 				return psf->error ;
+ 			return SFE_INTERNAL ;
+ 			} ;
+ 		psf->dataoffset += nn ;
+-		}
++		} ;
+ 
+ 	return 0 ;
+ } /* ogg_opus_write_header */
+@@ -1132,7 +1134,8 @@ ogg_opus_write_out (SF_PRIVATE *psf, OGG_PRIVATE *odata, OPUS_PRIVATE *oopus)
+ 		if (nbytes > 0)
+ 		{	oopus->u.encode.last_segments -= ogg_page_segments (&odata->opage) ;
+ 			oopus->pg_pos = oopus->pkt_pos ;
+-			ogg_write_page (psf, &odata->opage) ;
++			if (ogg_write_page (psf, &odata->opage) < 0)
++				return -1 ;
+ 			}
+ 		else
+ 			break ;
+diff --git a/src/ogg_vorbis.c b/src/ogg_vorbis.c
+index add123966..fae252ca0 100644
+--- a/src/ogg_vorbis.c
++++ b/src/ogg_vorbis.c
+@@ -82,28 +82,6 @@
+ /* How many seconds in the future to not bother bisection searching for. */
+ #define VORBIS_SEEK_THRESHOLD 2
+ 
+-typedef int convert_func (SF_PRIVATE *psf, int, void *, int, int, float **) ;
+-
+-static int	vorbis_read_header (SF_PRIVATE *psf) ;
+-static int	vorbis_write_header (SF_PRIVATE *psf, int calc_length) ;
+-static int	vorbis_close (SF_PRIVATE *psf) ;
+-static int	vorbis_command (SF_PRIVATE *psf, int command, void *data, int datasize) ;
+-static int	vorbis_byterate (SF_PRIVATE *psf) ;
+-static int	vorbis_calculate_granulepos (SF_PRIVATE *psf, uint64_t *gp_out) ;
+-static int	vorbis_skip (SF_PRIVATE *psf, uint64_t target_gp) ;
+-static int	vorbis_seek_trysearch (SF_PRIVATE *psf, uint64_t target_gp) ;
+-static sf_count_t	vorbis_seek (SF_PRIVATE *psf, int mode, sf_count_t offset) ;
+-static sf_count_t	vorbis_read_s (SF_PRIVATE *psf, short *ptr, sf_count_t len) ;
+-static sf_count_t	vorbis_read_i (SF_PRIVATE *psf, int *ptr, sf_count_t len) ;
+-static sf_count_t	vorbis_read_f (SF_PRIVATE *psf, float *ptr, sf_count_t len) ;
+-static sf_count_t	vorbis_read_d (SF_PRIVATE *psf, double *ptr, sf_count_t len) ;
+-static sf_count_t	vorbis_write_s (SF_PRIVATE *psf, const short *ptr, sf_count_t len) ;
+-static sf_count_t	vorbis_write_i (SF_PRIVATE *psf, const int *ptr, sf_count_t len) ;
+-static sf_count_t	vorbis_write_f (SF_PRIVATE *psf, const float *ptr, sf_count_t len) ;
+-static sf_count_t	vorbis_write_d (SF_PRIVATE *psf, const double *ptr, sf_count_t len) ;
+-static sf_count_t	vorbis_read_sample (SF_PRIVATE *psf, void *ptr, sf_count_t lens, convert_func *transfn) ;
+-static int	vorbis_rnull (SF_PRIVATE *psf, int samples, void *vptr, int off , int channels, float **pcm) ;
+-
+ typedef struct
+ {	int id ;
+ 	const char *name ;
+@@ -145,6 +123,45 @@ typedef struct
+ 	sf_count_t last_page ;
+ } VORBIS_PRIVATE ;
+ 
++typedef int convert_func (SF_PRIVATE *psf, int, void *, int, int, float **) ;
++
++static int	vorbis_read_header (SF_PRIVATE *psf) ;
++static int	vorbis_write_header (SF_PRIVATE *psf, int calc_length) ;
++static int	vorbis_close (SF_PRIVATE *psf) ;
++static int	vorbis_command (SF_PRIVATE *psf, int command, void *data, int datasize) ;
++static int	vorbis_byterate (SF_PRIVATE *psf) ;
++static int	vorbis_calculate_granulepos (SF_PRIVATE *psf, uint64_t *gp_out) ;
++static int	vorbis_skip (SF_PRIVATE *psf, uint64_t target_gp) ;
++static int	vorbis_seek_trysearch (SF_PRIVATE *psf, uint64_t target_gp) ;
++static sf_count_t	vorbis_seek (SF_PRIVATE *psf, int mode, sf_count_t offset) ;
++static sf_count_t	vorbis_read_s (SF_PRIVATE *psf, short *ptr, sf_count_t len) ;
++static sf_count_t	vorbis_read_i (SF_PRIVATE *psf, int *ptr, sf_count_t len) ;
++static sf_count_t	vorbis_read_f (SF_PRIVATE *psf, float *ptr, sf_count_t len) ;
++static sf_count_t	vorbis_read_d (SF_PRIVATE *psf, double *ptr, sf_count_t len) ;
++static sf_count_t	vorbis_write_s (SF_PRIVATE *psf, const short *ptr, sf_count_t len) ;
++static sf_count_t	vorbis_write_i (SF_PRIVATE *psf, const int *ptr, sf_count_t len) ;
++static sf_count_t	vorbis_write_f (SF_PRIVATE *psf, const float *ptr, sf_count_t len) ;
++static sf_count_t	vorbis_write_d (SF_PRIVATE *psf, const double *ptr, sf_count_t len) ;
++static sf_count_t	vorbis_read_sample (SF_PRIVATE *psf, void *ptr, sf_count_t lens, convert_func *transfn) ;
++static int	vorbis_write_samples (SF_PRIVATE *psf, OGG_PRIVATE *odata, VORBIS_PRIVATE *vdata, int in_frames) ;
++static int	vorbis_rnull (SF_PRIVATE *psf, int samples, void *vptr, int off , int channels, float **pcm) ;
++static void	vorbis_log_error (SF_PRIVATE *psf, int error) ;
++
++
++static void
++vorbis_log_error(SF_PRIVATE *psf, int error) {
++	switch (error)
++	{	case 0: return;
++		case OV_EIMPL:		psf->error = SFE_UNIMPLEMENTED ; break ;
++		case OV_ENOTVORBIS:	psf->error = SFE_MALFORMED_FILE ; break ;
++		case OV_EBADHEADER:	psf->error = SFE_MALFORMED_FILE ; break ;
++		case OV_EVERSION:	psf->error = SFE_UNSUPPORTED_ENCODING ; break ;
++		case OV_EFAULT:
++		case OV_EINVAL:
++		default: psf->error = SFE_INTERNAL ;
++		} ;
++} ;
++
+ static int
+ vorbis_read_header (SF_PRIVATE *psf)
+ {	OGG_PRIVATE *odata = (OGG_PRIVATE *) psf->container_data ;
+@@ -380,7 +397,6 @@ vorbis_write_header (SF_PRIVATE *psf, int UNUSED (calc_length))
+ 	{	ogg_packet header ;
+ 		ogg_packet header_comm ;
+ 		ogg_packet header_code ;
+-		int result ;
+ 
+ 		vorbis_analysis_headerout (&vdata->vdsp, &vdata->vcomment, &header, &header_comm, &header_code) ;
+ 		ogg_stream_packetin (&odata->ostream, &header) ; /* automatically placed in its own page */
+@@ -390,9 +406,9 @@ vorbis_write_header (SF_PRIVATE *psf, int UNUSED (calc_length))
+ 		/* This ensures the actual
+ 		 * audio data will start on a new page, as per spec
+ 		 */
+-		while ((result = ogg_stream_flush (&odata->ostream, &odata->opage)) != 0)
+-		{	ogg_write_page (psf, &odata->opage) ;
+-			} ;
++		while (ogg_stream_flush (&odata->ostream, &odata->opage))
++			if (ogg_write_page (psf, &odata->opage) < 0)
++				return -1 ;
+ 	}
+ 
+ 	return 0 ;
+@@ -402,6 +418,7 @@ static int
+ vorbis_close (SF_PRIVATE *psf)
+ {	OGG_PRIVATE* odata = psf->container_data ;
+ 	VORBIS_PRIVATE *vdata = psf->codec_data ;
++	int ret = 0 ;
+ 
+ 	if (odata == NULL || vdata == NULL)
+ 		return 0 ;
+@@ -412,34 +429,14 @@ vorbis_close (SF_PRIVATE *psf)
+ 	if (psf->file.mode == SFM_WRITE)
+ 	{
+ 		if (psf->write_current <= 0)
+-			vorbis_write_header (psf, 0) ;
+-
+-		vorbis_analysis_wrote (&vdata->vdsp, 0) ;
+-		while (vorbis_analysis_blockout (&vdata->vdsp, &vdata->vblock) == 1)
+-		{
++			ret = vorbis_write_header (psf, 0) ;
+ 
+-		/* analysis, assume we want to use bitrate management */
+-			vorbis_analysis (&vdata->vblock, NULL) ;
+-			vorbis_bitrate_addblock (&vdata->vblock) ;
+-
+-			while (vorbis_bitrate_flushpacket (&vdata->vdsp, &odata->opacket))
+-			{	/* weld the packet into the bitstream */
+-				ogg_stream_packetin (&odata->ostream, &odata->opacket) ;
+-
+-				/* write out pages (if any) */
+-				while (!odata->eos)
+-				{	int result = ogg_stream_pageout (&odata->ostream, &odata->opage) ;
+-					if (result == 0) break ;
+-					ogg_write_page (psf, &odata->opage) ;
+-
+-		/* this could be set above, but for illustrative purposes, I do
+-		   it here (to show that vorbis does know where the stream ends) */
+-
+-					if (ogg_page_eos (&odata->opage)) odata->eos = 1 ;
+-				}
+-			}
+-		}
+-	}
++		if (ret == 0)
++		{	/* A write of zero samples tells Vorbis the stream is done and to
++			   flush. */
++			ret = vorbis_write_samples (psf, odata, vdata, 0) ;
++			} ;
++		} ;
+ 
+ 	/* ogg_page and ogg_packet structs always point to storage in
+ 	   libvorbis.  They are never freed or manipulated directly */
+@@ -449,7 +446,7 @@ vorbis_close (SF_PRIVATE *psf)
+ 	vorbis_comment_clear (&vdata->vcomment) ;
+ 	vorbis_info_clear (&vdata->vinfo) ;
+ 
+-	return 0 ;
++	return ret ;
+ } /* vorbis_close */
+ 
+ int
+@@ -688,33 +685,40 @@ vorbis_read_d (SF_PRIVATE *psf, double *ptr, sf_count_t lens)
+ /*==============================================================================
+ */
+ 
+-static void
++static int
+ vorbis_write_samples (SF_PRIVATE *psf, OGG_PRIVATE *odata, VORBIS_PRIVATE *vdata, int in_frames)
+-{
+-	vorbis_analysis_wrote (&vdata->vdsp, in_frames) ;
++{	int ret ;
++
++	if ((ret = vorbis_analysis_wrote (&vdata->vdsp, in_frames)) != 0)
++		return ret ;
+ 
+ 	/*
+ 	**	Vorbis does some data preanalysis, then divvies up blocks for
+ 	**	more involved (potentially parallel) processing. Get a single
+ 	**	block for encoding now.
+ 	*/
+-	while (vorbis_analysis_blockout (&vdata->vdsp, &vdata->vblock) == 1)
++	while ((ret = vorbis_analysis_blockout (&vdata->vdsp, &vdata->vblock)) == 1)
+ 	{
+ 		/* analysis, assume we want to use bitrate management */
+-		vorbis_analysis (&vdata->vblock, NULL) ;
+-		vorbis_bitrate_addblock (&vdata->vblock) ;
++		if ((ret = vorbis_analysis (&vdata->vblock, NULL)) != 0)
++			return ret ;
++		if ((ret = vorbis_bitrate_addblock (&vdata->vblock)) != 0)
++			return ret ;
+ 
+-		while (vorbis_bitrate_flushpacket (&vdata->vdsp, &odata->opacket))
++		while ((ret = vorbis_bitrate_flushpacket (&vdata->vdsp, &odata->opacket)) == 1)
+ 		{
+ 			/* weld the packet into the bitstream */
+-			ogg_stream_packetin (&odata->ostream, &odata->opacket) ;
++			if ((ret = ogg_stream_packetin (&odata->ostream, &odata->opacket)) != 0)
++				return ret ;
+ 
+ 			/* write out pages (if any) */
+ 			while (!odata->eos)
+-			{	int result = ogg_stream_pageout (&odata->ostream, &odata->opage) ;
+-				if (result == 0)
++			{	ret = ogg_stream_pageout (&odata->ostream, &odata->opage) ;
++				if (ret == 0)
+ 					break ;
+-				ogg_write_page (psf, &odata->opage) ;
++
++				if (ogg_write_page (psf, &odata->opage) < 0)
++					return -1 ;
+ 
+ 				/*	This could be set above, but for illustrative purposes, I do
+ 				**	it here (to show that vorbis does know where the stream ends) */
+@@ -722,16 +726,22 @@ vorbis_write_samples (SF_PRIVATE *psf, OGG_PRIVATE *odata, VORBIS_PRIVATE *vdata
+ 					odata->eos = 1 ;
+ 				} ;
+ 			} ;
++		if (ret != 0)
++			return ret ;
+ 		} ;
++	if (ret != 0)
++		return ret ;
+ 
+ 	vdata->gp += in_frames ;
++
++	return 0 ;
+ } /* vorbis_write_data */
+ 
+ 
+ static sf_count_t
+ vorbis_write_s (SF_PRIVATE *psf, const short *ptr, sf_count_t lens)
+ {
+-	int i, m, j = 0 ;
++	int i, m, j = 0, ret ;
+ 	OGG_PRIVATE *odata = (OGG_PRIVATE *) psf->container_data ;
+ 	VORBIS_PRIVATE *vdata = (VORBIS_PRIVATE *) psf->codec_data ;
+ 	int in_frames = lens / psf->sf.channels ;
+@@ -740,14 +750,17 @@ vorbis_write_s (SF_PRIVATE *psf, const short *ptr, sf_count_t lens)
+ 		for (m = 0 ; m < psf->sf.channels ; m++)
+ 			buffer [m][i] = (float) (ptr [j++]) / 32767.0f ;
+ 
+-	vorbis_write_samples (psf, odata, vdata, in_frames) ;
++	if ((ret = vorbis_write_samples (psf, odata, vdata, in_frames)))
++	{	vorbis_log_error (psf, ret) ;
++		return 0 ;
++		} ;
+ 
+ 	return lens ;
+ } /* vorbis_write_s */
+ 
+ static sf_count_t
+ vorbis_write_i (SF_PRIVATE *psf, const int *ptr, sf_count_t lens)
+-{	int i, m, j = 0 ;
++{	int i, m, j = 0, ret ;
+ 	OGG_PRIVATE *odata = (OGG_PRIVATE *) psf->container_data ;
+ 	VORBIS_PRIVATE *vdata = (VORBIS_PRIVATE *) psf->codec_data ;
+ 	int in_frames = lens / psf->sf.channels ;
+@@ -756,14 +769,17 @@ vorbis_write_i (SF_PRIVATE *psf, const int *ptr, sf_count_t lens)
+ 		for (m = 0 ; m < psf->sf.channels ; m++)
+ 			buffer [m][i] = (float) (ptr [j++]) / 2147483647.0f ;
+ 
+-	vorbis_write_samples (psf, odata, vdata, in_frames) ;
++	if ((ret = vorbis_write_samples (psf, odata, vdata, in_frames)))
++	{	vorbis_log_error (psf, ret) ;
++		return 0 ;
++		} ;
+ 
+ 	return lens ;
+ } /* vorbis_write_i */
+ 
+ static sf_count_t
+ vorbis_write_f (SF_PRIVATE *psf, const float *ptr, sf_count_t lens)
+-{	int i, m, j = 0 ;
++{	int i, m, j = 0, ret ;
+ 	OGG_PRIVATE *odata = (OGG_PRIVATE *) psf->container_data ;
+ 	VORBIS_PRIVATE *vdata = (VORBIS_PRIVATE *) psf->codec_data ;
+ 	int in_frames = lens / psf->sf.channels ;
+@@ -772,14 +788,17 @@ vorbis_write_f (SF_PRIVATE *psf, const float *ptr, sf_count_t lens)
+ 		for (m = 0 ; m < psf->sf.channels ; m++)
+ 			buffer [m][i] = ptr [j++] ;
+ 
+-	vorbis_write_samples (psf, odata, vdata, in_frames) ;
++	if ((ret = vorbis_write_samples (psf, odata, vdata, in_frames)) != 0)
++	{	vorbis_log_error (psf, ret) ;
++		return 0 ;
++		} ;
+ 
+ 	return lens ;
+ } /* vorbis_write_f */
+ 
+ static sf_count_t
+ vorbis_write_d (SF_PRIVATE *psf, const double *ptr, sf_count_t lens)
+-{	int i, m, j = 0 ;
++{	int i, m, j = 0, ret ;
+ 	OGG_PRIVATE *odata = (OGG_PRIVATE *) psf->container_data ;
+ 	VORBIS_PRIVATE *vdata = (VORBIS_PRIVATE *) psf->codec_data ;
+ 	int in_frames = lens / psf->sf.channels ;
+@@ -788,7 +807,10 @@ vorbis_write_d (SF_PRIVATE *psf, const double *ptr, sf_count_t lens)
+ 		for (m = 0 ; m < psf->sf.channels ; m++)
+ 			buffer [m][i] = (float) ptr [j++] ;
+ 
+-	vorbis_write_samples (psf, odata, vdata, in_frames) ;
++	if ((ret = vorbis_write_samples (psf, odata, vdata, in_frames)) != 0)
++	{	vorbis_log_error (psf, ret) ;
++		return 0 ;
++		} ;
+ 
+ 	return lens ;
+ } /* vorbis_write_d */
+@@ -884,7 +906,7 @@ vorbis_seek_trysearch (SF_PRIVATE *psf, uint64_t target_gp)
+ 		return 0 ;
+ 
+ 	/*	Search for a position a half large-block before our target. As Vorbis is
+-	**	lapped, every sample position come from two blocks, the "left" half of
++	**	lapped, every sample position comes from two blocks, the "left" half of
+ 	**	one block and the "right" half of the previous block.  The granule
+ 	**	position of an Ogg page of a Vorbis stream is the sample offset of the
+ 	**	last finished sample in the stream that can be decoded from a page.  A
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb
index a9ee7c3575..2a1b96d5e7 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb
@@ -10,6 +10,7 @@ LICENSE = "LGPL-2.1-only"
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/libsndfile-${PV}.tar.xz \
            file://noopus.patch \
            file://cve-2022-33065.patch \
+           file://CVE-2024-50612.patch \
           "
 GITHUB_BASE_URI = "https://github.com/libsndfile/libsndfile/releases/"
 
-- 
2.34.1


