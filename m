Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F19E8D49211
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 11:34:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.38789.1731929675934820705
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 03:34:36 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3DDB61682
	for <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 03:35:05 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E99DD3F6A8
	for <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 03:34:34 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libsndfile1: backport the fix for CVE-2024-50612
Date: Mon, 18 Nov 2024 11:34:31 +0000
Message-Id: <20241118113431.2980178-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 11:34:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207215

Backport the fix from upstream.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../libsndfile1/CVE-2024-50612.patch          | 409 ++++++++++++++++++
 .../libsndfile/libsndfile1_1.2.2.bb           |   1 +
 2 files changed, 410 insertions(+)
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-20=
24-50612.patch

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2024-5061=
2.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2024-50612.p=
atch
new file mode 100644
index 00000000000..368dd5446b2
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
+@@ -211,12 +211,16 @@ ogg_read_first_page (SF_PRIVATE *psf, OGG_PRIVATE =
*odata)
+=20
+ int
+ ogg_write_page (SF_PRIVATE *psf, ogg_page *page)
+-{	int bytes ;
++{	int n ;
+=20
+-	bytes =3D psf_fwrite (page->header, 1, page->header_len, psf) ;
+-	bytes +=3D psf_fwrite (page->body, 1, page->body_len, psf) ;
++	n =3D psf_fwrite (page->header, 1, page->header_len, psf) ;
++	if (n =3D=3D page->header_len)
++		n +=3D psf_fwrite (page->body, 1, page->body_len, psf) ;
+=20
+-	return bytes =3D=3D page->header_len + page->body_len ;
++	if (n !=3D page->body_len + page->header_len)
++		return -1 ;
++
++	return n ;
+ } /* ogg_write_page */
+=20
+ sf_count_t
+diff --git a/src/ogg_opus.c b/src/ogg_opus.c
+index 511653ecc..e01224b99 100644
+--- a/src/ogg_opus.c
++++ b/src/ogg_opus.c
+@@ -827,15 +827,16 @@ ogg_opus_write_header (SF_PRIVATE *psf, int UNUSED=
 (calc_length))
+=20
+ 	/* The first page MUST only contain the header, so flush it out now */
+ 	ogg_stream_packetin (&odata->ostream, &op) ;
+-	for ( ; (nn =3D ogg_stream_flush (&odata->ostream, &odata->opage)) ; )
+-	{	if (! (nn =3D ogg_write_page (psf, &odata->opage)))
++	while (ogg_stream_flush (&odata->ostream, &odata->opage))
++	{	nn =3D ogg_write_page (psf, &odata->opage) ;
++		if (nn < 0)
+ 		{	psf_log_printf (psf, "Opus : Failed to write header!\n") ;
+ 			if (psf->error)
+ 				return psf->error ;
+ 			return SFE_INTERNAL ;
+ 			} ;
+ 		psf->dataoffset +=3D nn ;
+-		}
++		} ;
+=20
+ 	/*
+ 	** Metadata Tags (manditory)
+@@ -850,15 +851,16 @@ ogg_opus_write_header (SF_PRIVATE *psf, int UNUSED=
 (calc_length))
+ 	vorbiscomment_write_tags (psf, &op, &opustags_ident, opus_get_version_=
string (), - (OGG_OPUS_COMMENT_PAD)) ;
+ 	op.packetno =3D 2 ;
+ 	ogg_stream_packetin (&odata->ostream, &op) ;
+-	for ( ; (nn =3D ogg_stream_flush (&odata->ostream, &odata->opage)) ; )
+-	{	if (! (nn =3D ogg_write_page (psf, &odata->opage)))
++	while (ogg_stream_flush (&odata->ostream, &odata->opage))
++	{	nn =3D ogg_write_page (psf, &odata->opage) ;
++		if (nn < 0)
+ 		{	psf_log_printf (psf, "Opus : Failed to write comments!\n") ;
+ 			if (psf->error)
+ 				return psf->error ;
+ 			return SFE_INTERNAL ;
+ 			} ;
+ 		psf->dataoffset +=3D nn ;
+-		}
++		} ;
+=20
+ 	return 0 ;
+ } /* ogg_opus_write_header */
+@@ -1132,7 +1134,8 @@ ogg_opus_write_out (SF_PRIVATE *psf, OGG_PRIVATE *=
odata, OPUS_PRIVATE *oopus)
+ 		if (nbytes > 0)
+ 		{	oopus->u.encode.last_segments -=3D ogg_page_segments (&odata->opage=
) ;
+ 			oopus->pg_pos =3D oopus->pkt_pos ;
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
+ /* How many seconds in the future to not bother bisection searching for=
. */
+ #define VORBIS_SEEK_THRESHOLD 2
+=20
+-typedef int convert_func (SF_PRIVATE *psf, int, void *, int, int, float=
 **) ;
+-
+-static int	vorbis_read_header (SF_PRIVATE *psf) ;
+-static int	vorbis_write_header (SF_PRIVATE *psf, int calc_length) ;
+-static int	vorbis_close (SF_PRIVATE *psf) ;
+-static int	vorbis_command (SF_PRIVATE *psf, int command, void *data, in=
t datasize) ;
+-static int	vorbis_byterate (SF_PRIVATE *psf) ;
+-static int	vorbis_calculate_granulepos (SF_PRIVATE *psf, uint64_t *gp_o=
ut) ;
+-static int	vorbis_skip (SF_PRIVATE *psf, uint64_t target_gp) ;
+-static int	vorbis_seek_trysearch (SF_PRIVATE *psf, uint64_t target_gp) =
;
+-static sf_count_t	vorbis_seek (SF_PRIVATE *psf, int mode, sf_count_t of=
fset) ;
+-static sf_count_t	vorbis_read_s (SF_PRIVATE *psf, short *ptr, sf_count_=
t len) ;
+-static sf_count_t	vorbis_read_i (SF_PRIVATE *psf, int *ptr, sf_count_t =
len) ;
+-static sf_count_t	vorbis_read_f (SF_PRIVATE *psf, float *ptr, sf_count_=
t len) ;
+-static sf_count_t	vorbis_read_d (SF_PRIVATE *psf, double *ptr, sf_count=
_t len) ;
+-static sf_count_t	vorbis_write_s (SF_PRIVATE *psf, const short *ptr, sf=
_count_t len) ;
+-static sf_count_t	vorbis_write_i (SF_PRIVATE *psf, const int *ptr, sf_c=
ount_t len) ;
+-static sf_count_t	vorbis_write_f (SF_PRIVATE *psf, const float *ptr, sf=
_count_t len) ;
+-static sf_count_t	vorbis_write_d (SF_PRIVATE *psf, const double *ptr, s=
f_count_t len) ;
+-static sf_count_t	vorbis_read_sample (SF_PRIVATE *psf, void *ptr, sf_co=
unt_t lens, convert_func *transfn) ;
+-static int	vorbis_rnull (SF_PRIVATE *psf, int samples, void *vptr, int =
off , int channels, float **pcm) ;
+-
+ typedef struct
+ {	int id ;
+ 	const char *name ;
+@@ -145,6 +123,45 @@ typedef struct
+ 	sf_count_t last_page ;
+ } VORBIS_PRIVATE ;
+=20
++typedef int convert_func (SF_PRIVATE *psf, int, void *, int, int, float=
 **) ;
++
++static int	vorbis_read_header (SF_PRIVATE *psf) ;
++static int	vorbis_write_header (SF_PRIVATE *psf, int calc_length) ;
++static int	vorbis_close (SF_PRIVATE *psf) ;
++static int	vorbis_command (SF_PRIVATE *psf, int command, void *data, in=
t datasize) ;
++static int	vorbis_byterate (SF_PRIVATE *psf) ;
++static int	vorbis_calculate_granulepos (SF_PRIVATE *psf, uint64_t *gp_o=
ut) ;
++static int	vorbis_skip (SF_PRIVATE *psf, uint64_t target_gp) ;
++static int	vorbis_seek_trysearch (SF_PRIVATE *psf, uint64_t target_gp) =
;
++static sf_count_t	vorbis_seek (SF_PRIVATE *psf, int mode, sf_count_t of=
fset) ;
++static sf_count_t	vorbis_read_s (SF_PRIVATE *psf, short *ptr, sf_count_=
t len) ;
++static sf_count_t	vorbis_read_i (SF_PRIVATE *psf, int *ptr, sf_count_t =
len) ;
++static sf_count_t	vorbis_read_f (SF_PRIVATE *psf, float *ptr, sf_count_=
t len) ;
++static sf_count_t	vorbis_read_d (SF_PRIVATE *psf, double *ptr, sf_count=
_t len) ;
++static sf_count_t	vorbis_write_s (SF_PRIVATE *psf, const short *ptr, sf=
_count_t len) ;
++static sf_count_t	vorbis_write_i (SF_PRIVATE *psf, const int *ptr, sf_c=
ount_t len) ;
++static sf_count_t	vorbis_write_f (SF_PRIVATE *psf, const float *ptr, sf=
_count_t len) ;
++static sf_count_t	vorbis_write_d (SF_PRIVATE *psf, const double *ptr, s=
f_count_t len) ;
++static sf_count_t	vorbis_read_sample (SF_PRIVATE *psf, void *ptr, sf_co=
unt_t lens, convert_func *transfn) ;
++static int	vorbis_write_samples (SF_PRIVATE *psf, OGG_PRIVATE *odata, V=
ORBIS_PRIVATE *vdata, int in_frames) ;
++static int	vorbis_rnull (SF_PRIVATE *psf, int samples, void *vptr, int =
off , int channels, float **pcm) ;
++static void	vorbis_log_error (SF_PRIVATE *psf, int error) ;
++
++
++static void
++vorbis_log_error(SF_PRIVATE *psf, int error) {
++	switch (error)
++	{	case 0: return;
++		case OV_EIMPL:		psf->error =3D SFE_UNIMPLEMENTED ; break ;
++		case OV_ENOTVORBIS:	psf->error =3D SFE_MALFORMED_FILE ; break ;
++		case OV_EBADHEADER:	psf->error =3D SFE_MALFORMED_FILE ; break ;
++		case OV_EVERSION:	psf->error =3D SFE_UNSUPPORTED_ENCODING ; break ;
++		case OV_EFAULT:
++		case OV_EINVAL:
++		default: psf->error =3D SFE_INTERNAL ;
++		} ;
++} ;
++
+ static int
+ vorbis_read_header (SF_PRIVATE *psf)
+ {	OGG_PRIVATE *odata =3D (OGG_PRIVATE *) psf->container_data ;
+@@ -380,7 +397,6 @@ vorbis_write_header (SF_PRIVATE *psf, int UNUSED (ca=
lc_length))
+ 	{	ogg_packet header ;
+ 		ogg_packet header_comm ;
+ 		ogg_packet header_code ;
+-		int result ;
+=20
+ 		vorbis_analysis_headerout (&vdata->vdsp, &vdata->vcomment, &header, &=
header_comm, &header_code) ;
+ 		ogg_stream_packetin (&odata->ostream, &header) ; /* automatically pla=
ced in its own page */
+@@ -390,9 +406,9 @@ vorbis_write_header (SF_PRIVATE *psf, int UNUSED (ca=
lc_length))
+ 		/* This ensures the actual
+ 		 * audio data will start on a new page, as per spec
+ 		 */
+-		while ((result =3D ogg_stream_flush (&odata->ostream, &odata->opage))=
 !=3D 0)
+-		{	ogg_write_page (psf, &odata->opage) ;
+-			} ;
++		while (ogg_stream_flush (&odata->ostream, &odata->opage))
++			if (ogg_write_page (psf, &odata->opage) < 0)
++				return -1 ;
+ 	}
+=20
+ 	return 0 ;
+@@ -402,6 +418,7 @@ static int
+ vorbis_close (SF_PRIVATE *psf)
+ {	OGG_PRIVATE* odata =3D psf->container_data ;
+ 	VORBIS_PRIVATE *vdata =3D psf->codec_data ;
++	int ret =3D 0 ;
+=20
+ 	if (odata =3D=3D NULL || vdata =3D=3D NULL)
+ 		return 0 ;
+@@ -412,34 +429,14 @@ vorbis_close (SF_PRIVATE *psf)
+ 	if (psf->file.mode =3D=3D SFM_WRITE)
+ 	{
+ 		if (psf->write_current <=3D 0)
+-			vorbis_write_header (psf, 0) ;
+-
+-		vorbis_analysis_wrote (&vdata->vdsp, 0) ;
+-		while (vorbis_analysis_blockout (&vdata->vdsp, &vdata->vblock) =3D=3D=
 1)
+-		{
++			ret =3D vorbis_write_header (psf, 0) ;
+=20
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
+-				{	int result =3D ogg_stream_pageout (&odata->ostream, &odata->opage=
) ;
+-					if (result =3D=3D 0) break ;
+-					ogg_write_page (psf, &odata->opage) ;
+-
+-		/* this could be set above, but for illustrative purposes, I do
+-		   it here (to show that vorbis does know where the stream ends) */
+-
+-					if (ogg_page_eos (&odata->opage)) odata->eos =3D 1 ;
+-				}
+-			}
+-		}
+-	}
++		if (ret =3D=3D 0)
++		{	/* A write of zero samples tells Vorbis the stream is done and to
++			   flush. */
++			ret =3D vorbis_write_samples (psf, odata, vdata, 0) ;
++			} ;
++		} ;
+=20
+ 	/* ogg_page and ogg_packet structs always point to storage in
+ 	   libvorbis.  They are never freed or manipulated directly */
+@@ -449,7 +446,7 @@ vorbis_close (SF_PRIVATE *psf)
+ 	vorbis_comment_clear (&vdata->vcomment) ;
+ 	vorbis_info_clear (&vdata->vinfo) ;
+=20
+-	return 0 ;
++	return ret ;
+ } /* vorbis_close */
+=20
+ int
+@@ -688,33 +685,40 @@ vorbis_read_d (SF_PRIVATE *psf, double *ptr, sf_co=
unt_t lens)
+ /*=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
+ */
+=20
+-static void
++static int
+ vorbis_write_samples (SF_PRIVATE *psf, OGG_PRIVATE *odata, VORBIS_PRIVA=
TE *vdata, int in_frames)
+-{
+-	vorbis_analysis_wrote (&vdata->vdsp, in_frames) ;
++{	int ret ;
++
++	if ((ret =3D vorbis_analysis_wrote (&vdata->vdsp, in_frames)) !=3D 0)
++		return ret ;
+=20
+ 	/*
+ 	**	Vorbis does some data preanalysis, then divvies up blocks for
+ 	**	more involved (potentially parallel) processing. Get a single
+ 	**	block for encoding now.
+ 	*/
+-	while (vorbis_analysis_blockout (&vdata->vdsp, &vdata->vblock) =3D=3D =
1)
++	while ((ret =3D vorbis_analysis_blockout (&vdata->vdsp, &vdata->vblock=
)) =3D=3D 1)
+ 	{
+ 		/* analysis, assume we want to use bitrate management */
+-		vorbis_analysis (&vdata->vblock, NULL) ;
+-		vorbis_bitrate_addblock (&vdata->vblock) ;
++		if ((ret =3D vorbis_analysis (&vdata->vblock, NULL)) !=3D 0)
++			return ret ;
++		if ((ret =3D vorbis_bitrate_addblock (&vdata->vblock)) !=3D 0)
++			return ret ;
+=20
+-		while (vorbis_bitrate_flushpacket (&vdata->vdsp, &odata->opacket))
++		while ((ret =3D vorbis_bitrate_flushpacket (&vdata->vdsp, &odata->opa=
cket)) =3D=3D 1)
+ 		{
+ 			/* weld the packet into the bitstream */
+-			ogg_stream_packetin (&odata->ostream, &odata->opacket) ;
++			if ((ret =3D ogg_stream_packetin (&odata->ostream, &odata->opacket))=
 !=3D 0)
++				return ret ;
+=20
+ 			/* write out pages (if any) */
+ 			while (!odata->eos)
+-			{	int result =3D ogg_stream_pageout (&odata->ostream, &odata->opage)=
 ;
+-				if (result =3D=3D 0)
++			{	ret =3D ogg_stream_pageout (&odata->ostream, &odata->opage) ;
++				if (ret =3D=3D 0)
+ 					break ;
+-				ogg_write_page (psf, &odata->opage) ;
++
++				if (ogg_write_page (psf, &odata->opage) < 0)
++					return -1 ;
+=20
+ 				/*	This could be set above, but for illustrative purposes, I do
+ 				**	it here (to show that vorbis does know where the stream ends) */
+@@ -722,16 +726,22 @@ vorbis_write_samples (SF_PRIVATE *psf, OGG_PRIVATE=
 *odata, VORBIS_PRIVATE *vdata
+ 					odata->eos =3D 1 ;
+ 				} ;
+ 			} ;
++		if (ret !=3D 0)
++			return ret ;
+ 		} ;
++	if (ret !=3D 0)
++		return ret ;
+=20
+ 	vdata->gp +=3D in_frames ;
++
++	return 0 ;
+ } /* vorbis_write_data */
+=20
+=20
+ static sf_count_t
+ vorbis_write_s (SF_PRIVATE *psf, const short *ptr, sf_count_t lens)
+ {
+-	int i, m, j =3D 0 ;
++	int i, m, j =3D 0, ret ;
+ 	OGG_PRIVATE *odata =3D (OGG_PRIVATE *) psf->container_data ;
+ 	VORBIS_PRIVATE *vdata =3D (VORBIS_PRIVATE *) psf->codec_data ;
+ 	int in_frames =3D lens / psf->sf.channels ;
+@@ -740,14 +750,17 @@ vorbis_write_s (SF_PRIVATE *psf, const short *ptr,=
 sf_count_t lens)
+ 		for (m =3D 0 ; m < psf->sf.channels ; m++)
+ 			buffer [m][i] =3D (float) (ptr [j++]) / 32767.0f ;
+=20
+-	vorbis_write_samples (psf, odata, vdata, in_frames) ;
++	if ((ret =3D vorbis_write_samples (psf, odata, vdata, in_frames)))
++	{	vorbis_log_error (psf, ret) ;
++		return 0 ;
++		} ;
+=20
+ 	return lens ;
+ } /* vorbis_write_s */
+=20
+ static sf_count_t
+ vorbis_write_i (SF_PRIVATE *psf, const int *ptr, sf_count_t lens)
+-{	int i, m, j =3D 0 ;
++{	int i, m, j =3D 0, ret ;
+ 	OGG_PRIVATE *odata =3D (OGG_PRIVATE *) psf->container_data ;
+ 	VORBIS_PRIVATE *vdata =3D (VORBIS_PRIVATE *) psf->codec_data ;
+ 	int in_frames =3D lens / psf->sf.channels ;
+@@ -756,14 +769,17 @@ vorbis_write_i (SF_PRIVATE *psf, const int *ptr, s=
f_count_t lens)
+ 		for (m =3D 0 ; m < psf->sf.channels ; m++)
+ 			buffer [m][i] =3D (float) (ptr [j++]) / 2147483647.0f ;
+=20
+-	vorbis_write_samples (psf, odata, vdata, in_frames) ;
++	if ((ret =3D vorbis_write_samples (psf, odata, vdata, in_frames)))
++	{	vorbis_log_error (psf, ret) ;
++		return 0 ;
++		} ;
+=20
+ 	return lens ;
+ } /* vorbis_write_i */
+=20
+ static sf_count_t
+ vorbis_write_f (SF_PRIVATE *psf, const float *ptr, sf_count_t lens)
+-{	int i, m, j =3D 0 ;
++{	int i, m, j =3D 0, ret ;
+ 	OGG_PRIVATE *odata =3D (OGG_PRIVATE *) psf->container_data ;
+ 	VORBIS_PRIVATE *vdata =3D (VORBIS_PRIVATE *) psf->codec_data ;
+ 	int in_frames =3D lens / psf->sf.channels ;
+@@ -772,14 +788,17 @@ vorbis_write_f (SF_PRIVATE *psf, const float *ptr,=
 sf_count_t lens)
+ 		for (m =3D 0 ; m < psf->sf.channels ; m++)
+ 			buffer [m][i] =3D ptr [j++] ;
+=20
+-	vorbis_write_samples (psf, odata, vdata, in_frames) ;
++	if ((ret =3D vorbis_write_samples (psf, odata, vdata, in_frames)) !=3D=
 0)
++	{	vorbis_log_error (psf, ret) ;
++		return 0 ;
++		} ;
+=20
+ 	return lens ;
+ } /* vorbis_write_f */
+=20
+ static sf_count_t
+ vorbis_write_d (SF_PRIVATE *psf, const double *ptr, sf_count_t lens)
+-{	int i, m, j =3D 0 ;
++{	int i, m, j =3D 0, ret ;
+ 	OGG_PRIVATE *odata =3D (OGG_PRIVATE *) psf->container_data ;
+ 	VORBIS_PRIVATE *vdata =3D (VORBIS_PRIVATE *) psf->codec_data ;
+ 	int in_frames =3D lens / psf->sf.channels ;
+@@ -788,7 +807,10 @@ vorbis_write_d (SF_PRIVATE *psf, const double *ptr,=
 sf_count_t lens)
+ 		for (m =3D 0 ; m < psf->sf.channels ; m++)
+ 			buffer [m][i] =3D (float) ptr [j++] ;
+=20
+-	vorbis_write_samples (psf, odata, vdata, in_frames) ;
++	if ((ret =3D vorbis_write_samples (psf, odata, vdata, in_frames)) !=3D=
 0)
++	{	vorbis_log_error (psf, ret) ;
++		return 0 ;
++		} ;
+=20
+ 	return lens ;
+ } /* vorbis_write_d */
+@@ -884,7 +906,7 @@ vorbis_seek_trysearch (SF_PRIVATE *psf, uint64_t tar=
get_gp)
+ 		return 0 ;
+=20
+ 	/*	Search for a position a half large-block before our target. As Vorb=
is is
+-	**	lapped, every sample position come from two blocks, the "left" half=
 of
++	**	lapped, every sample position comes from two blocks, the "left" hal=
f of
+ 	**	one block and the "right" half of the previous block.  The granule
+ 	**	position of an Ogg page of a Vorbis stream is the sample offset of =
the
+ 	**	last finished sample in the stream that can be decoded from a page.=
  A
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb b/me=
ta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb
index a9ee7c35756..2a1b96d5e79 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb
@@ -10,6 +10,7 @@ LICENSE =3D "LGPL-2.1-only"
 SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/libsndfile-${PV}.tar.xz \
            file://noopus.patch \
            file://cve-2022-33065.patch \
+           file://CVE-2024-50612.patch \
           "
 GITHUB_BASE_URI =3D "https://github.com/libsndfile/libsndfile/releases/"
=20
--=20
2.34.1


