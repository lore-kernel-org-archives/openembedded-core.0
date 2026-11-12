Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4547.1794512429352775362
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2026 11:40:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=InIkPr3a;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20261112194030cc751b7a9b00020790-er_otf@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20261112194030cc751b7a9b00020790
        for <openembedded-core@lists.openembedded.org>;
        Thu, 12 Nov 2026 20:40:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Im2QHxzT5an7KmYrGcir/mMTzOGaudjPC4dym+Tcyjk=;
 b=InIkPr3aTsTgWnS6IVot1bEGZTmOWDAreKavwdjXMa9PIoLCJp2506FSkD6JIo3Qwxtt9l
 soRc0SGEvlXLjGpg6fllhZzhSw9fE4sFbd2GpKMdlkg4FytS/0BCDfSMkdQrj+oeZGQinn8o
 ZfEUfzM/mEUnfmLDZIwvYVWFRO7bUIuk0LTEMT4fY6a0Ip1ksA0ObCxE1wkd1SFcVgeNlAjq
 VFq66HzYif1TQtKmCywFpdSOQcv3DmZedldOwKuksKKbmp8uyFPcrkSgil7QGwYxr/1XNMdm
 Hy+SxYnDjpwnbEyILGjyzKl3HaYQDlc5VZNuxdw/aiXYVnTUbCOjCuAg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [scarthgap][PATCH 1/3] libsndfile1: patch CVE-2024-50613
Date: Thu, 12 Nov 2026 20:38:21 +0100
Message-ID: <20261112193823.982149-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2026 19:40:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250124
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch from [1] which linked this CVE.

[1] https://github.com/libsndfile/libsndfile/pull/1198

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libsndfile1/CVE-2024-50613.patch          | 348 ++++++++++++++++++
 .../libsndfile/libsndfile1_1.2.2.bb           |   1 +
 2 files changed, 349 insertions(+)
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2024-50613.patch

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2024-50613.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2024-50613.patch
new file mode 100644
index 00000000000..9b7302b2316
--- /dev/null
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/CVE-2024-50613.patch
@@ -0,0 +1,348 @@
+From ecbccc2f23de6cefd2d97842fc0333bb742a0625 Mon Sep 17 00:00:00 2001
+From: Capsize Security <contact@capsize.online>
+Date: Mon, 26 Oct 2026 17:28:12 -0600
+Subject: [PATCH] mpeg: sanitize float/double input to LAME ieee entry points
+
+Crafted files can deliver NaNs, infinities, or huge finite values through sf_writef_float / sf_writef_double into the MP3 encoder. Passing those straight to LAME trips assertions inside LAME (psymodel.c: calc_energy: `el >= 0') and aborts the host application.
+
+Clamp encoder input to the [-1, 1] range LAME's ieee_float / ieee_double entry points document ("data must be scaled to +/- 1 full scale", lame/lame.h); non-finite samples become silence. All four float/double x mono/stereo paths funnel through the sanitizing normalize_float / normalize_double helpers, including the non-normalized paths via a 1/0x8000 pre-scale (the stereo path already did this). The mono non-normalized path previously used lame_encode_buffer_float; routing it through the scaled ieee_float entry instead changes its gain by ~0.003% (1 part in 32768).
+
+Note: clamping to +/-1 intentionally changes output for valid slightly-over-full-scale input (e.g. a constant 2.0), which LAME's ieee entries never accepted in-contract; in-range audio passes through unchanged.
+
+CVE-2024-50613 Issue: https://github.com/libsndfile/libsndfile/issues/1034
+
+Signed-off-by: Capsize Security <contact@capsize.online>
+
+CVE: CVE-2024-50613
+Upstream-Status: Backport [https://github.com/libsndfile/libsndfile/commit/ecbccc2f23de6cefd2d97842fc0333bb742a0625]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/mpeg_l3_encode.c |  91 ++++++++++++++++++-------
+ tests/mpeg_test.c    | 158 +++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 226 insertions(+), 23 deletions(-)
+
+diff --git a/src/mpeg_l3_encode.c b/src/mpeg_l3_encode.c
+index aba22394..c712e6e7 100644
+--- a/src/mpeg_l3_encode.c
++++ b/src/mpeg_l3_encode.c
+@@ -596,22 +596,77 @@ mpeg_l3_encode_write_int_stereo (SF_PRIVATE *psf, const int *ptr, sf_count_t len
+ }
+ 
+ 
++/* LAME's ieee_float / ieee_double entry points require input samples in the
++** range [-1.0, +1.0] ("data must be scaled to +/- 1 full scale", lame/lame.h).
++** Crafted input files can deliver NaNs, infinities, or huge finite values
++** through the public sf_writef_float / sf_writef_double API ; passing those
++** straight to LAME trips assertions inside LAME (psymodel.c : calc_energy :
++** `el >= 0') and aborts the host application (CVE-2024-50613,
++** https://github.com/libsndfile/libsndfile/issues/1034). Clamp here so the
++** encoder only ever sees in-contract input. Samples already in range pass
++** through unchanged.
++*/
++
++static inline float
++sanitize_float_sample (float x)
++{	if (!isfinite (x))
++		return 0.0f ;
++	if (x > 1.0f)
++		return 1.0f ;
++	if (x < -1.0f)
++		return -1.0f ;
++	return x ;
++} /* sanitize_float_sample */
++
++static inline double
++sanitize_double_sample (double x)
++{	if (!isfinite (x))
++		return 0.0 ;
++	if (x > 1.0)
++		return 1.0 ;
++	if (x < -1.0)
++		return -1.0 ;
++	return x ;
++} /* sanitize_double_sample */
++
++static inline void
++normalize_float (float *dest, const float *src, sf_count_t count, float norm_fact)
++{	while (--count >= 0)
++		dest [count] = sanitize_float_sample (src [count] * norm_fact) ;
++} /* normalize_float */
++
++static inline void
++normalize_double (double *dest, const double *src, sf_count_t count, double norm_fact)
++{	while (--count >= 0)
++		dest [count] = sanitize_double_sample (src [count] * norm_fact) ;
++} /* normalize_double */
++
++
+ static sf_count_t
+ mpeg_l3_encode_write_float_mono (SF_PRIVATE *psf, const float *ptr, sf_count_t len)
+-{	MPEG_L3_ENC_PRIVATE *pmpeg = (MPEG_L3_ENC_PRIVATE*) psf->codec_data ;
++{	BUF_UNION ubuf ;
++	MPEG_L3_ENC_PRIVATE *pmpeg = (MPEG_L3_ENC_PRIVATE*) psf->codec_data ;
+ 	sf_count_t total = 0 ;
+ 	int nbytes, writecount, writen ;
+ 
+ 	if ((psf->error = mpeg_l3_encoder_construct (psf)))
+ 		return 0 ;
+ 
++	const sf_count_t max_samples = SF_MIN (ARRAY_LEN (ubuf.fbuf), pmpeg->frame_samples) ;
+ 	while (len)
+-	{	writecount = SF_MIN (len, (sf_count_t) pmpeg->frame_samples) ;
++	{	writecount = SF_MIN (len, max_samples) ;
+ 
+ 		if (psf->norm_float)
+-			nbytes = lame_encode_buffer_ieee_float (pmpeg->lamef, ptr + total, NULL, writecount, pmpeg->block, pmpeg->block_len) ;
++		{	normalize_float (ubuf.fbuf, ptr + total, writecount, 1.0f) ;
++			nbytes = lame_encode_buffer_ieee_float (pmpeg->lamef, ubuf.fbuf, NULL, writecount, pmpeg->block, pmpeg->block_len) ;
++			}
+ 		else
+-			nbytes = lame_encode_buffer_float (pmpeg->lamef, ptr + total, NULL, writecount, pmpeg->block, pmpeg->block_len) ;
++		{	/* Lame lacks a non-normalized mono float write, so scale to
++			** ieee full scale here, mirroring the stereo path below.
++			*/
++			normalize_float (ubuf.fbuf, ptr + total, writecount, 1.0 / (float) 0x8000) ;
++			nbytes = lame_encode_buffer_ieee_float (pmpeg->lamef, ubuf.fbuf, NULL, writecount, pmpeg->block, pmpeg->block_len) ;
++			}
+ 		if (nbytes < 0)
+ 		{	psf_log_printf (psf, "lame_encode_buffer returned %d\n", nbytes) ;
+ 			break ;
+@@ -632,14 +687,6 @@ mpeg_l3_encode_write_float_mono (SF_PRIVATE *psf, const float *ptr, sf_count_t l
+ }
+ 
+ 
+-static inline void
+-normalize_float (float *dest, const float *src, sf_count_t count, float norm_fact)
+-{	while (--count >= 0)
+-	{	dest [count] = src [count] * norm_fact ;
+-		} ;
+-}
+-
+-
+ static sf_count_t
+ mpeg_l3_encode_write_float_stereo (SF_PRIVATE *psf, const float *ptr, sf_count_t len)
+ {	BUF_UNION ubuf ;
+@@ -655,7 +702,9 @@ mpeg_l3_encode_write_float_stereo (SF_PRIVATE *psf, const float *ptr, sf_count_t
+ 	{	writecount = SF_MIN (len, max_samples) ;
+ 
+ 		if (psf->norm_float)
+-			nbytes = lame_encode_buffer_interleaved_ieee_float (pmpeg->lamef, ptr + total, writecount / 2, pmpeg->block, pmpeg->block_len) ;
++		{	normalize_float (ubuf.fbuf, ptr + total, writecount, 1.0f) ;
++			nbytes = lame_encode_buffer_interleaved_ieee_float (pmpeg->lamef, ubuf.fbuf, writecount / 2, pmpeg->block, pmpeg->block_len) ;
++			}
+ 		else
+ 		{	/* Lame lacks a non-normalized interleaved float write. Bummer. */
+ 			normalize_float (ubuf.fbuf, ptr + total, writecount, 1.0 / (float) 0x8000) ;
+@@ -682,14 +731,6 @@ mpeg_l3_encode_write_float_stereo (SF_PRIVATE *psf, const float *ptr, sf_count_t
+ }
+ 
+ 
+-static inline void
+-normalize_double (double *dest, const double *src, sf_count_t count, double norm_fact)
+-{	while (--count >= 0)
+-	{	dest [count] = src [count] * norm_fact ;
+-		} ;
+-}
+-
+-
+ static sf_count_t
+ mpeg_l3_encode_write_double_mono (SF_PRIVATE *psf, const double *ptr, sf_count_t len)
+ {	BUF_UNION ubuf ;
+@@ -705,7 +746,9 @@ mpeg_l3_encode_write_double_mono (SF_PRIVATE *psf, const double *ptr, sf_count_t
+ 	{	writecount = SF_MIN (len, max_samples) ;
+ 
+ 		if (psf->norm_double)
+-			nbytes = lame_encode_buffer_ieee_double (pmpeg->lamef, ptr + total, NULL, writecount, pmpeg->block, pmpeg->block_len) ;
++		{	normalize_double (ubuf.dbuf, ptr + total, writecount, 1.0) ;
++			nbytes = lame_encode_buffer_ieee_double (pmpeg->lamef, ubuf.dbuf, NULL, writecount, pmpeg->block, pmpeg->block_len) ;
++			}
+ 		else
+ 		{	/* Lame lacks non-normalized double writing */
+ 			normalize_double (ubuf.dbuf, ptr + total, writecount, 1.0 / (double) 0x8000) ;
+@@ -747,7 +790,9 @@ mpeg_l3_encode_write_double_stereo (SF_PRIVATE *psf, const double *ptr, sf_count
+ 	{	writecount = SF_MIN (len, max_samples) ;
+ 
+ 		if (psf->norm_double)
+-			nbytes = lame_encode_buffer_interleaved_ieee_double (pmpeg->lamef, ptr + total, writecount / 2, pmpeg->block, pmpeg->block_len) ;
++		{	normalize_double (ubuf.dbuf, ptr + total, writecount, 1.0) ;
++			nbytes = lame_encode_buffer_interleaved_ieee_double (pmpeg->lamef, ubuf.dbuf, writecount / 2, pmpeg->block, pmpeg->block_len) ;
++			}
+ 		else
+ 		{	/* Lame lacks interleaved non-normalized double writing */
+ 			normalize_double (ubuf.dbuf, ptr + total, writecount, 1.0 / (double) 0x8000) ;
+diff --git a/tests/mpeg_test.c b/tests/mpeg_test.c
+index fe7f53d1..87adf2ac 100644
+--- a/tests/mpeg_test.c
++++ b/tests/mpeg_test.c
+@@ -258,6 +258,162 @@ mpeg_double_test (void)
+ 	unlink (filename) ;
+ } /* mpeg_double_test */
+ 
++/* Hostile input (CVE-2024-50613) : NaNs, infinities and huge finite values
++** must be sanitized before reaching LAME, not abort it. One helper covers
++** mono and stereo (channels == 2 exercises the interleaved_ieee paths),
++** with float normalization on or off.
++*/
++static void
++mpeg_hostile_float_case (int channels, int normalize)
++{	char filename [64] ;
++	SNDFILE * file ;
++	SF_INFO sfinfo ;
++	unsigned k ;
++	size_t samples = ARRAY_LEN (data_out.f) ;
++
++	snprintf (filename, sizeof (filename), "mpeg_hostile_float_%dch_%s.mp3",
++		channels, normalize ? "norm" : "nonorm") ;
++
++	print_test_name ("mpeg_hostile_float_test", filename) ;
++
++	if (channels == 1)
++	{	gen_windowed_sine_float (data_out.f, samples, normalize ? 0.95 : 1.0 * 0x7F00) ;
++		}
++	else
++	{	/* Interleave two mirrored channels. data_in.f is scratch here ;
++		** it is overwritten by the read-back below.
++		*/
++		gen_windowed_sine_float (data_in.f, samples / 2, normalize ? 0.95 : 1.0 * 0x7F00) ;
++		for (k = 0 ; k < samples / 2 ; k++)
++		{	data_out.f [2 * k] = data_in.f [k] ;
++			data_out.f [2 * k + 1] = data_in.f [samples / 2 - k - 1] ;
++			} ;
++		} ;
++
++	data_out.f [0] = NAN ;
++	data_out.f [1] = INFINITY ;
++	data_out.f [2] = -INFINITY ;
++	data_out.f [3] = 1.0e30f ;
++	data_out.f [4] = -1.0e30f ;
++
++	memset (&sfinfo, 0, sizeof (sfinfo)) ;
++
++	/* Set up output file type. */
++	sfinfo.format = SF_FORMAT_MPEG | SF_FORMAT_MPEG_LAYER_III ;
++	sfinfo.channels = channels ;
++	sfinfo.samplerate = SAMPLE_RATE ;
++
++	/* Write the output file. */
++	file = test_open_file_or_die (filename, SFM_WRITE, &sfinfo, SF_FALSE, __LINE__) ;
++	if (! normalize)
++		sf_command (file, SFC_SET_NORM_FLOAT, NULL, SF_FALSE) ;
++	test_write_float_or_die (file, 0, data_out.f, samples, __LINE__) ;
++	sf_close (file) ;
++
++	/* Read the file in again. */
++	memset (&sfinfo, 0, sizeof (sfinfo)) ;
++
++	file = test_open_file_or_die (filename, SFM_READ, &sfinfo, SF_FALSE, __LINE__) ;
++	test_read_float_or_die (file, 0, data_in.f, samples, __LINE__) ;
++	sf_close (file) ;
++
++	/* The decoded output must be finite and within a sane range. MP3 is
++	** lossy so decoded peaks may overshoot the encoder's +/-1 clamp
++	** slightly ; a generous bound catches scale errors without
++	** false-failing on codec noise. Explicit checks (no assert.h
++	** dependency) match the surrounding test style.
++	*/
++	for (k = 0 ; k < samples ; k++)
++		if (! isfinite (data_in.f [k]) || fabsf (data_in.f [k]) > 4.0f)
++		{	printf ("\n\nLine %d : bad decoded sample at index %u : %f.\n\n", __LINE__, k, data_in.f [k]) ;
++			exit (1) ;
++			} ;
++
++	puts ("ok") ;
++
++	unlink (filename) ;
++} /* mpeg_hostile_float_case */
++
++static void
++mpeg_hostile_float_test (void)
++{	mpeg_hostile_float_case (1, SF_TRUE) ;
++	mpeg_hostile_float_case (1, SF_FALSE) ;
++	mpeg_hostile_float_case (2, SF_TRUE) ;
++	mpeg_hostile_float_case (2, SF_FALSE) ;
++} /* mpeg_hostile_float_test */
++
++/* Double-precision version of the helper above. */
++static void
++mpeg_hostile_double_case (int channels, int normalize)
++{	char filename [64] ;
++	SNDFILE * file ;
++	SF_INFO sfinfo ;
++	unsigned k ;
++	size_t samples = ARRAY_LEN (data_out.d) ;
++
++	snprintf (filename, sizeof (filename), "mpeg_hostile_double_%dch_%s.mp3",
++		channels, normalize ? "norm" : "nonorm") ;
++
++	print_test_name ("mpeg_hostile_double_test", filename) ;
++
++	if (channels == 1)
++	{	gen_windowed_sine_double (data_out.d, samples, normalize ? 0.95 : 1.0 * 0x7F00) ;
++		}
++	else
++	{	gen_windowed_sine_double (data_in.d, samples / 2, normalize ? 0.95 : 1.0 * 0x7F00) ;
++		for (k = 0 ; k < samples / 2 ; k++)
++		{	data_out.d [2 * k] = data_in.d [k] ;
++			data_out.d [2 * k + 1] = data_in.d [samples / 2 - k - 1] ;
++			} ;
++		} ;
++
++	data_out.d [0] = NAN ;
++	data_out.d [1] = INFINITY ;
++	data_out.d [2] = -INFINITY ;
++	data_out.d [3] = 1.0e300 ;
++	data_out.d [4] = -1.0e300 ;
++
++	memset (&sfinfo, 0, sizeof (sfinfo)) ;
++
++	/* Set up output file type. */
++	sfinfo.format = SF_FORMAT_MPEG | SF_FORMAT_MPEG_LAYER_III ;
++	sfinfo.channels = channels ;
++	sfinfo.samplerate = SAMPLE_RATE ;
++
++	/* Write the output file. */
++	file = test_open_file_or_die (filename, SFM_WRITE, &sfinfo, SF_FALSE, __LINE__) ;
++	if (! normalize)
++		sf_command (file, SFC_SET_NORM_DOUBLE, NULL, SF_FALSE) ;
++	test_write_double_or_die (file, 0, data_out.d, samples, __LINE__) ;
++	sf_close (file) ;
++
++	/* Read the file in again. */
++	memset (&sfinfo, 0, sizeof (sfinfo)) ;
++
++	file = test_open_file_or_die (filename, SFM_READ, &sfinfo, SF_FALSE, __LINE__) ;
++	test_read_double_or_die (file, 0, data_in.d, samples, __LINE__) ;
++	sf_close (file) ;
++
++	/* Finite and sane, as above. */
++	for (k = 0 ; k < samples ; k++)
++		if (! isfinite (data_in.d [k]) || fabs (data_in.d [k]) > 4.0)
++		{	printf ("\n\nLine %d : bad decoded sample at index %u : %f.\n\n", __LINE__, k, data_in.d [k]) ;
++			exit (1) ;
++			} ;
++
++	puts ("ok") ;
++
++	unlink (filename) ;
++} /* mpeg_hostile_double_case */
++
++static void
++mpeg_hostile_double_test (void)
++{	mpeg_hostile_double_case (1, SF_TRUE) ;
++	mpeg_hostile_double_case (1, SF_FALSE) ;
++	mpeg_hostile_double_case (2, SF_TRUE) ;
++	mpeg_hostile_double_case (2, SF_FALSE) ;
++} /* mpeg_hostile_double_test */
++
+ 
+ static void
+ mpeg_stereo_seek_test (const char * filename, int format)
+@@ -338,6 +494,8 @@ main (void)
+ 		mpeg_int_test () ;
+ 		mpeg_float_test () ;
+ 		mpeg_double_test () ;
++		mpeg_hostile_float_test () ;
++		mpeg_hostile_double_test () ;
+ 
+ 		mpeg_stereo_seek_test ("mpeg_seek.mp3", SF_FORMAT_MPEG | SF_FORMAT_MPEG_LAYER_III) ;
+ 		}
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb
index 5d2a2c256b0..b22f5b1e503 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb
@@ -14,6 +14,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/libsndfile-${PV}.tar.xz \
            file://CVE-2025-56226-01.patch \
            file://CVE-2025-56226-02.patch \
            file://CVE-2026-37555.patch \
+           file://CVE-2024-50613.patch \
           "
 GITHUB_BASE_URI = "https://github.com/libsndfile/libsndfile/releases/"
 
