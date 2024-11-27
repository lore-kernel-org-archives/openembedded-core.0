Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6692D65553
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 18:50:21 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.78786.1732733418170706886
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Nov 2024 10:50:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=PNQ+btbg;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7ea9739647bso586a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 10:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732733417; x=1733338217; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HqhrjOp6YI9FsW3yhePgrn991nl4TO27eyYERhI/lok=;
        b=PNQ+btbg7DLm4SpUN0bLyWSQz/TcmnuI9Xqp8ZypRpaFL+Uo7/Q7NF5McdXROvcp6J
         M5LWKAcANtlpP8hhSPiFf+tHUk6CDVpyYqIYYYPSAWgEYcNbENFqHqnUx5s+10TxkLyx
         Iro7rMcQ9ZxgXWNMCXxcVe7/kh61FIW8AZfmcAFYo0Xbvu3XYj/F9vrs061n9SUqrEBk
         n4IxzvWznUHZbACbXmBvf1QotXJHZl9QfWZ1FL5bCQB3G8iEonkKi1m/FUB8mrB2ZqG3
         Oujc0I6l7vTzzQy4WrMi3Vf7HLgG15CAlDznFhhMn+jqBnCPdcle2JOiPewvl9PaXNyB
         8Q6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732733417; x=1733338217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HqhrjOp6YI9FsW3yhePgrn991nl4TO27eyYERhI/lok=;
        b=MmWPretS23a62YScdy0JT2iAUEka5qDS68gjUk67gD64H2P5bdpO8+yAB7agTx6udb
         unbsmZ+01vZabfoHZdofY7RikuLoFsDEHWSD+7bCD2AX5/uMizAby0Gt1RS06Zaur/PT
         yqe2UEnTAXvtrZvvZSRLB/N7EDGRbEgMqsMC0SrK3h85pZeupphTIorPLZY4qCam7Q3x
         ilwwlnJiUWUGdk90UoQJgVL+fe/c1dXXev0haDw+mRX9JaSStKpaGQ5sNs8JvGFyfIoE
         uaoqVSUdT9qYIU610SHKZsXE9opK24klCwadDobzel/FWFPNkzdO6iMZw86S1if20W9C
         gBXg==
X-Gm-Message-State: AOJu0Yyv13T6BYEentmKBmgjWYw6sVJl7qISWM0Bkgkv7ry1EaIkgGy1
	pCV7g0D0wfPeKdqS/TScy7KQ1jdwZfS2jMxdEJUn2lTvi1IY0S9f1d2jeW5kdTsm7y/Ws1UlfxR
	H
X-Gm-Gg: ASbGncvZ5der7eUq2hYJPDsUm4sNB7rx+8PikxZWEKw/5B/dArWftLwVRfAbC1kMSRW
	p2mFZTs1RpW62b9xhXux1It3cc+mHaWXewGpLZn4KOmK5HMXwBDjc0qboEJhJTFox9CQ00J5HWy
	+PHp9Tp/aBiJQL7Aa7PWODRDUBb0vkAbq0vuQGAZ7j6x1+4ankcKn7QdzW+WEAaYiiwL6cyRpkC
	KvuOUDipAR61xbZvXOUHXdn3+FXixd7Puc51fQ=
X-Google-Smtp-Source: AGHT+IEPk0S7KgGdLQkOTN01+BkoyK/vRus8xmIAKKPDFiT1Wlh8hEgPCL07CySo/5UiaVCTDZfnfw==
X-Received: by 2002:a05:6a20:12c3:b0:1d9:2694:44df with SMTP id adf61e73a8af0-1e0e0b7fc67mr6107542637.43.1732733417231;
        Wed, 27 Nov 2024 10:50:17 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72522e0375asm3403519b3a.94.2024.11.27.10.50.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 10:50:16 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/14] libsndfile: fix CVE-2024-50612
Date: Wed, 27 Nov 2024 10:49:57 -0800
Message-Id: <5462005cf3feef383e4212529a8c7af827bdf0d1.1732733274.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1732733274.git.steve@sakoman.com>
References: <cover.1732733274.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 18:50:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207946

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://github.com/libsndfile/libsndfile/commit/4755f5bd7854611d92ad0f1295587b439f9950ba

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libsndfile1/CVE-2024-50612.patch          | 402 ++++++++++++++++++
 .../libsndfile/libsndfile1_1.0.31.bb          |   1 +
 2 files changed, 403 insertions(+)
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2024-50612.patch

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2024-50612.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2024-50612.patch
new file mode 100644
index 0000000000..9e4b5f8ce0
--- /dev/null
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2024-50612.patch
@@ -0,0 +1,402 @@
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
+ src/ogg_vorbis.c | 167 +++++++++++++++++++++++++++--------------------
+ 3 files changed, 114 insertions(+), 82 deletions(-)
+
+diff --git a/src/ogg.c b/src/ogg.c
+index 7a4a167..c6e76e3 100644
+--- a/src/ogg.c
++++ b/src/ogg.c
+@@ -209,12 +209,16 @@ ogg_read_first_page (SF_PRIVATE *psf, OGG_PRIVATE *odata)
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
+index d937ada..5ad53ac 100644
+--- a/src/ogg_opus.c
++++ b/src/ogg_opus.c
+@@ -815,15 +815,16 @@ ogg_opus_write_header (SF_PRIVATE *psf, int UNUSED (calc_length))
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
+@@ -838,15 +839,16 @@ ogg_opus_write_header (SF_PRIVATE *psf, int UNUSED (calc_length))
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
+@@ -1124,7 +1126,8 @@ ogg_opus_write_out (SF_PRIVATE *psf, OGG_PRIVATE *odata, OPUS_PRIVATE *oopus)
+ 			*/
+ 			oopus->u.encode.last_segments -= odata->opage.header [26] ;
+ 			oopus->pg_pos = oopus->pkt_pos ;
+-			ogg_write_page (psf, &odata->opage) ;
++			if (ogg_write_page (psf, &odata->opage) < 0)
++				return -1 ;
+ 			}
+ 		else
+ 			break ;
+diff --git a/src/ogg_vorbis.c b/src/ogg_vorbis.c
+index 5f53651..fa5709f 100644
+--- a/src/ogg_vorbis.c
++++ b/src/ogg_vorbis.c
+@@ -78,26 +78,6 @@
+ 
+ #include "ogg.h"
+ 
+-typedef int convert_func (SF_PRIVATE *psf, int, void *, int, int, float **) ;
+-
+-static int	vorbis_read_header (SF_PRIVATE *psf) ;
+-static int	vorbis_write_header (SF_PRIVATE *psf, int calc_length) ;
+-static int	vorbis_close (SF_PRIVATE *psf) ;
+-static int	vorbis_command (SF_PRIVATE *psf, int command, void *data, int datasize) ;
+-static int	vorbis_byterate (SF_PRIVATE *psf) ;
+-static sf_count_t	vorbis_calculate_page_duration (SF_PRIVATE *psf) ;
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
+@@ -143,6 +123,46 @@ typedef struct
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
++static sf_count_t	vorbis_calculate_page_duration (SF_PRIVATE *psf) ;
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
+@@ -386,7 +406,6 @@ vorbis_write_header (SF_PRIVATE *psf, int UNUSED (calc_length))
+ 	{	ogg_packet header ;
+ 		ogg_packet header_comm ;
+ 		ogg_packet header_code ;
+-		int result ;
+ 
+ 		vorbis_analysis_headerout (&vdata->vdsp, &vdata->vcomment, &header, &header_comm, &header_code) ;
+ 		ogg_stream_packetin (&odata->ostream, &header) ; /* automatically placed in its own page */
+@@ -396,9 +415,9 @@ vorbis_write_header (SF_PRIVATE *psf, int UNUSED (calc_length))
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
+@@ -408,6 +427,7 @@ static int
+ vorbis_close (SF_PRIVATE *psf)
+ {	OGG_PRIVATE* odata = psf->container_data ;
+ 	VORBIS_PRIVATE *vdata = psf->codec_data ;
++	int ret = 0 ;
+ 
+ 	if (odata == NULL || vdata == NULL)
+ 		return 0 ;
+@@ -418,34 +438,14 @@ vorbis_close (SF_PRIVATE *psf)
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
+@@ -455,7 +455,7 @@ vorbis_close (SF_PRIVATE *psf)
+ 	vorbis_comment_clear (&vdata->vcomment) ;
+ 	vorbis_info_clear (&vdata->vinfo) ;
+ 
+-	return 0 ;
++	return ret ;
+ } /* vorbis_close */
+ 
+ int
+@@ -686,33 +686,40 @@ vorbis_read_d (SF_PRIVATE *psf, double *ptr, sf_count_t lens)
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
+@@ -720,16 +727,22 @@ vorbis_write_samples (SF_PRIVATE *psf, OGG_PRIVATE *odata, VORBIS_PRIVATE *vdata
+ 					odata->eos = 1 ;
+ 				} ;
+ 			} ;
++		if (ret != 0)
++			return ret ;
+ 		} ;
++	if (ret != 0)
++		return ret ;
+ 
+ 	vdata->loc += in_frames ;
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
+@@ -738,14 +751,17 @@ vorbis_write_s (SF_PRIVATE *psf, const short *ptr, sf_count_t lens)
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
+@@ -754,14 +770,17 @@ vorbis_write_i (SF_PRIVATE *psf, const int *ptr, sf_count_t lens)
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
+@@ -770,14 +789,17 @@ vorbis_write_f (SF_PRIVATE *psf, const float *ptr, sf_count_t lens)
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
+@@ -786,7 +808,10 @@ vorbis_write_d (SF_PRIVATE *psf, const double *ptr, sf_count_t lens)
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
+-- 
+2.25.1
+
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb
index 0c654fd853..20240635f7 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.31.bb
@@ -12,6 +12,7 @@ SRC_URI = "https://github.com/libsndfile/libsndfile/releases/download/${PV}/libs
            file://noopus.patch \
            file://0001-flac-Fix-improper-buffer-reusing-732.patch \
            file://CVE-2022-33065.patch \
+           file://CVE-2024-50612.patch \
           "
 UPSTREAM_CHECK_URI = "https://github.com/libsndfile/libsndfile/releases/"
 
-- 
2.34.1


