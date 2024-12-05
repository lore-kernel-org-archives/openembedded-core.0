Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7070FE77171
	for <webhook@archiver.kernel.org>; Thu,  5 Dec 2024 23:42:36 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web11.25878.1733442153789210434
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Dec 2024 15:42:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=iw70/8wK;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-2024120523423056996ccb7df02a2cff-aoplpi@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 2024120523423056996ccb7df02a2cff
        for <openembedded-core@lists.openembedded.org>;
        Fri, 06 Dec 2024 00:42:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=RHxvuA/autjDWUElxCTbpGwY1FNovRhxWW0L3qOztCU=;
 b=iw70/8wKAzY2KR0uRi/58kmZ+zNlQBBqE2PauvMbuLOFGQXinrsEKeApxgYvUq3tM6OO3H
 YDOywlLYA43Q/GJ0HkiP1qIAc3RccYYpu+MucF+jIXxv3yVUCJf1tIy32yT0sa32Ga+4BV1p
 HAaxofea/arDGRyRFQ3KDNSxNFsLOZ3WvSJ3Vq0VzLjOpASle8uvgiseek51sDYVY/yZVZiq
 BjGNT8i92o++7rNVQyGfM28/+hPe7cB0+6l6rfAI3JUSgGUpHeICMAx44QYLIJofMumkaYHO
 eV8keYkDLftIabqg5dsJVeKnLbsRNf9JADGYbI6iFMJ7nEpzL6jkUm7A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com,
	Ross Burton <ross.burton@arm.com>
Subject: [OE-core][styhead][PATCH 5/7] libsndfile1: backport the fix for CVE-2024-50612
Date: Fri,  6 Dec 2024 00:41:42 +0100
Message-Id: <20241205234144.7933-6-peter.marko@siemens.com>
In-Reply-To: <20241205234144.7933-1-peter.marko@siemens.com>
References: <20241205234144.7933-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Dec 2024 23:42:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208400

From: Ross Burton <ross.burton@arm.com>

Backport the fix from upstream.

(From OE-Core rev: 2fc6b711a6a7252ddf13587927c06333f5a38d71)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
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
2.30.2


