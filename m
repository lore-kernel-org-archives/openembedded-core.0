Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9867E6ADF9
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 05:29:37 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.65537.1732685372638667024
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Nov 2024 21:29:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=ASqldqFe;
 spf=pass (domain: mvista.com, ip: 209.85.214.173, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21271dc4084so57857255ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Nov 2024 21:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1732685372; x=1733290172; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ke+QHpSYgHG52olMth5uEDPeKBWnUK931EtBnWlAJw8=;
        b=ASqldqFe1jyPF2odOzgQ5ChFHF4akYYRktm1Xn6qAIPs+LPU0g+fo9HwO2dbusxS+3
         lp83abLuo42vpj4YYdabc/sEUYMfEc8247rYm4rzfUWGt0Psq8QcC1JTc0pBuKrAHQqm
         SoNDYstRt4CeDJmSivliaalQQJvKNnw0J+vHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732685372; x=1733290172;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ke+QHpSYgHG52olMth5uEDPeKBWnUK931EtBnWlAJw8=;
        b=c5gM5Zh35ZsdsVvTCLssXr9ErxtDG8mfhOfbzM/fFJr4qlhsm08RgVzwiUcgX6NK+0
         MxpUTxStFJQN5md2iIhWFPSNJOoSQxsqftYPc8uaRhrsbsS6B/JnBNJE727BJkik/GE3
         nAIGx/5cjtiN0EnPp8zSoMav3DjkDBFzH31DlC5yrAzG+wiipiySMFTXlqpwqWIGBpq3
         pPq80fG0VYBohuL5aCiQZXJ9vlW9uJ5xcr7f3uPEQA0wQ0fRGXb15QuIU1+R0FXH+Gfp
         R9nPZEcfsgjaCZcTkFCkbalvMJF03DltUSWK5w8SMzwl92hKxg8g49bQPkFcxp/sXOQq
         NTNw==
X-Gm-Message-State: AOJu0YyuzZ8bSYBeV9c/nRmrQT01r07aew5z0v/S62sp2RAkr8PTIH9r
	k4omIkn7QpgcV/p87JZQ3d2KnAxNfokXYbwk37ybDVHVbe1WT9DMErKBFjA6QTztlEs5FEq2l3W
	L
X-Gm-Gg: ASbGncsPFEazcwoZiAcHcSiJFyDy7hAGp9cP/AGnflsnTzteutN0tSaqv5zF5A/5b/j
	14gc0eVx5lA/vxHeL0DjN4RGHzV5zKR5NpKg9HGwVHAge5HQr6o86OehorCw5Ix/jm8dxVMbR+o
	w/JwZJsYMqzFED4xqt6Lwg0/P7ZlmXFpTr2UQkycytcz922gMnT+w+WPL8xLghevI/Q92zrb+Mz
	MXadI/lm3+iYzt99nxVrsWynVameGAB/llDEKWSsDw+n1B0JMdSGCV+W1AW6zqQkKE=
X-Google-Smtp-Source: AGHT+IEiL3rnNhSqNzM/DHXQCM7iWYFDQ0oRL+V05Fg3F6HtwxAiBa71OQCVCRGjvre03g+rlst/NQ==
X-Received: by 2002:a17:902:ea12:b0:211:6b21:5a87 with SMTP id d9443c01a7336-21501f6411dmr22316525ad.56.1732685371720;
        Tue, 26 Nov 2024 21:29:31 -0800 (PST)
Received: from MVIN00016.mvista.com ([2409:40c1:103f:6bce:d322:816c:7372:a687])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dc23a35sm94416875ad.250.2024.11.26.21.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 21:29:31 -0800 (PST)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH] libsndfile: fix CVE-2024-50612
Date: Wed, 27 Nov 2024 10:59:21 +0530
Message-Id: <20241127052921.25800-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 05:29:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207913

Upstream-Status: Backport from https://github.com/libsndfile/libsndfile/commit/4755f5bd7854611d92ad0f1295587b439f9950ba

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../libsndfile1/CVE-2024-50612.patch          | 412 ++++++++++++++++++
 .../libsndfile/libsndfile1_1.2.2.bb           |   1 +
 2 files changed, 413 insertions(+)
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2024-50612.patch

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2024-50612.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2024-50612.patch
new file mode 100644
index 0000000000..d96f2915c4
--- /dev/null
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2024-50612.patch
@@ -0,0 +1,412 @@
+From 4755f5bd7854611d92ad0f1295587b439f9950ba Mon Sep 17 00:00:00 2001
+From: Arthur Taylor <art@ified.ca>
+Date: Fri, 15 Nov 2024 19:46:53 -0800
+Subject: [PATCH] src/ogg: better error checking for vorbis. Fixes #1035
+
+Upstream-Status: Backport [https://github.com/libsndfile/libsndfile/commit/4755f5bd7854611d92ad0f1295587b439f9950ba]
+CVE: CVE-2024-50612
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/ogg.c        |  12 ++--
+ src/ogg_opus.c   |  17 +++--
+ src/ogg_vorbis.c | 170 ++++++++++++++++++++++++++---------------------
+ 3 files changed, 114 insertions(+), 85 deletions(-)
+
+diff --git a/src/ogg.c b/src/ogg.c
+index 8cd4379..534c8f7 100644
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
+index 596bb69..8e3800a 100644
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
+index f9428ed..2cdbed3 100644
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
+-- 
+2.25.1
+
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
2.25.1


