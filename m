Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F492C4708E
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 17:56:05 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.25707.1671645358659667465
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Dec 2022 09:55:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dWnfZqbO;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id u5so16475332pjy.5
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 09:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BOlTQzFLLFbxUNekXg3mIfwt8CVmeOp5dNxUp3b0vgo=;
        b=dWnfZqbOAd2yLyn+o1HdGwS+lka2LRmMSi0orFW9vOMpxqS/7jLTa4M6zzSieqpoeZ
         gOOU1rddqGCSQJ37IGFlHAqtEaTneQQm21Iy6NcSJPN43OPtcbdueyRSfrWYszEzbize
         eINM7hB1OefsWGel6ntvAnXhmMDluVXo8qYVN5Vp91XeZIYt3vjrTsaPXLP629Exb3Qy
         LfvD7UJPRha6p1rdv96kRhcpitEpWMjDP15pl00CHa8XfdrmuFwkgwdyTj7dqJVAL+EO
         5scbfIwiLNxAt67T/Cf9gwCDAoL3sEsw/bGoPAM+fFVlpJNb4fmtE5rJAdQOSXJGJ2kr
         7reA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BOlTQzFLLFbxUNekXg3mIfwt8CVmeOp5dNxUp3b0vgo=;
        b=dFCSiEXdhkW7MQTonqpuW63aZV3jYK5NEisX8EH7oP0m6phJwXiXfL1lM07euCN7bG
         3wsoKzi1zRJgZI6d3mBfrY0zdC3js2AV3skhDPi7LGHLoL93PS/4Wff/mNrRVz5q0CCN
         hDOFdEKLAZxnyROgq6AJiSLcpxXly7BuThAuVhFw5wl2VmcUzYhcmJ55dPrzgn0X/DcY
         3UR7JGbe8YMvwbOYB7F3XfUBV/SbPosWi/Ixc+1XHt+bdH+W+vWJAlcImZh8XMTUXX6O
         mYbIMtGI1nRHbhHA2qjZCtDlrAl0gjWhO6AKij2emqgsnF89a03YXS4+k+9+MaLM81ax
         6XHw==
X-Gm-Message-State: AFqh2kqQoCRpQdQ8a8LduBrAIZDLV3kK6VgBGB4R5GPumE5T5zj1ehmI
	jHqpYp80hWctScdx2UC0V0NqrVbNdbY=
X-Google-Smtp-Source: AMrXdXsoATr97WdhUdfxkZxVD7L3eW2Ot2JcyDkN1QGw4B900mBfpbWzY4Cc1M0gTBu/3BDlJWisig==
X-Received: by 2002:a17:90b:b03:b0:219:b79d:c2f4 with SMTP id bf3-20020a17090b0b0300b00219b79dc2f4mr2924514pjb.18.1671645357720;
        Wed, 21 Dec 2022 09:55:57 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::41f2])
        by smtp.gmail.com with ESMTPSA id x11-20020a17090a294b00b00225a127b2a2sm1548943pjf.5.2022.12.21.09.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Dec 2022 09:55:57 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 5/9] alsa-utils: Replace off64_t with off_t
Date: Wed, 21 Dec 2022 09:55:47 -0800
Message-Id: <20221221175551.1940464-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221221175551.1940464-1-raj.khem@gmail.com>
References: <20221221175551.1940464-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 17:56:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174930

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...lay-axfer-Replace-off64_t-with-off_t.patch | 272 ++++++++++++++++++
 .../alsa/alsa-utils_1.2.8.bb                  |   4 +-
 2 files changed, 275 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-utils/0001-aplay-axfer-Replace-off64_t-with-off_t.patch

diff --git a/meta/recipes-multimedia/alsa/alsa-utils/0001-aplay-axfer-Replace-off64_t-with-off_t.patch b/meta/recipes-multimedia/alsa/alsa-utils/0001-aplay-axfer-Replace-off64_t-with-off_t.patch
new file mode 100644
index 0000000000..356c5964ae
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-utils/0001-aplay-axfer-Replace-off64_t-with-off_t.patch
@@ -0,0 +1,272 @@
+From 03553ccc6284a437576349b5a3c2ed0d7d4265e1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 15 Dec 2022 14:04:10 -0800
+Subject: [PATCH] aplay,axfer: Replace off64_t with off_t
+
+Also replace lseek64 with lseek.
+
+_FILE_OFFSET_BITS=64 is passed to needed platforms since configure uses
+AC_SYS_LARGEFILE macro. Therefore off_t is already 64-bit and lseek is
+same as lseek64.
+
+Additionally this fixes buils with latest musl where these lfs64
+functions are moved out from _GNU_SOURCE and under _LARGEFILE64_SOURCE
+macro alone. This makes the builds fail on 32-bit platforms even though
+default off_t on musl is 64-bit always.
+
+Upstream-Status: Submitted [https://github.com/alsa-project/alsa-utils/pull/183]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ aplay/aplay.c               | 44 ++++++++++++++++++-------------------
+ axfer/container-voc.c       |  2 +-
+ axfer/container.c           |  6 ++---
+ axfer/container.h           |  2 +-
+ axfer/test/container-test.c |  4 ++--
+ axfer/test/mapper-test.c    |  2 +-
+ 6 files changed, 30 insertions(+), 30 deletions(-)
+
+diff --git a/aplay/aplay.c b/aplay/aplay.c
+index 6ce7191..bd93be3 100644
+--- a/aplay/aplay.c
++++ b/aplay/aplay.c
+@@ -141,7 +141,7 @@ static long term_c_lflag = -1;
+ static int dump_hw_params = 0;
+ 
+ static int fd = -1;
+-static off64_t pbrec_count = LLONG_MAX, fdcount;
++static off_t pbrec_count = LLONG_MAX, fdcount;
+ static int vocmajor, vocminor;
+ 
+ static char *pidfile_name = NULL;
+@@ -2356,7 +2356,7 @@ static void voc_play(int fd, int ofs, char *name)
+ 	u_char *data, *buf;
+ 	char was_extended = 0, output = 0;
+ 	u_short *sp, repeat = 0;
+-	off64_t filepos = 0;
++	off_t filepos = 0;
+ 
+ #define COUNT(x)	nextblock -= x; in_buffer -= x; data += x
+ #define COUNT1(x)	in_buffer -= x; data += x
+@@ -2490,7 +2490,7 @@ static void voc_play(int fd, int ofs, char *name)
+ 				d_printf("Repeat loop %d times\n", repeat);
+ #endif
+ 				if (filepos >= 0) {	/* if < 0, one seek fails, why test another */
+-					if ((filepos = lseek64(fd, 0, 1)) < 0) {
++					if ((filepos = lseek(fd, 0, 1)) < 0) {
+ 						error(_("can't play loops; %s isn't seekable\n"), name);
+ 						repeat = 0;
+ 					} else {
+@@ -2512,7 +2512,7 @@ static void voc_play(int fd, int ofs, char *name)
+ 					else
+ 						d_printf("Neverending loop\n");
+ #endif
+-					lseek64(fd, filepos, 0);
++					lseek(fd, filepos, 0);
+ 					in_buffer = 0;	/* clear the buffer */
+ 					goto Fill_the_buffer;
+ 				}
+@@ -2578,9 +2578,9 @@ static void init_raw_data(void)
+ }
+ 
+ /* calculate the data count to read from/to dsp */
+-static off64_t calc_count(void)
++static off_t calc_count(void)
+ {
+-	off64_t count;
++	off_t count;
+ 
+ 	if (timelimit == 0)
+ 		if (sampleslimit == 0)
+@@ -2589,7 +2589,7 @@ static off64_t calc_count(void)
+ 			count = snd_pcm_format_size(hwparams.format, sampleslimit * hwparams.channels);
+ 	else {
+ 		count = snd_pcm_format_size(hwparams.format, hwparams.rate * hwparams.channels);
+-		count *= (off64_t)timelimit;
++		count *= (off_t)timelimit;
+ 	}
+ 	return count < pbrec_count ? count : pbrec_count;
+ }
+@@ -2750,7 +2750,7 @@ static void begin_au(int fd, size_t cnt)
+ /* closing .VOC */
+ static void end_voc(int fd)
+ {
+-	off64_t length_seek;
++	off_t length_seek;
+ 	VocBlockType bt;
+ 	size_t cnt;
+ 	char dummy = 0;		/* Write a Terminator */
+@@ -2770,15 +2770,15 @@ static void end_voc(int fd)
+ 	bt.datalen = (u_char) (cnt & 0xFF);
+ 	bt.datalen_m = (u_char) ((cnt & 0xFF00) >> 8);
+ 	bt.datalen_h = (u_char) ((cnt & 0xFF0000) >> 16);
+-	if (lseek64(fd, length_seek, SEEK_SET) == length_seek)
++	if (lseek(fd, length_seek, SEEK_SET) == length_seek)
+ 		xwrite(fd, &bt, sizeof(VocBlockType));
+ }
+ 
+ static void end_wave(int fd)
+ {				/* only close output */
+ 	WaveChunkHeader cd;
+-	off64_t length_seek;
+-	off64_t filelen;
++	off_t length_seek;
++	off_t filelen;
+ 	u_int rifflen;
+ 	
+ 	length_seek = sizeof(WaveHeader) +
+@@ -2788,20 +2788,20 @@ static void end_wave(int fd)
+ 	cd.length = fdcount > 0x7fffffff ? LE_INT(0x7fffffff) : LE_INT(fdcount);
+ 	filelen = fdcount + 2*sizeof(WaveChunkHeader) + sizeof(WaveFmtBody) + 4;
+ 	rifflen = filelen > 0x7fffffff ? LE_INT(0x7fffffff) : LE_INT(filelen);
+-	if (lseek64(fd, 4, SEEK_SET) == 4)
++	if (lseek(fd, 4, SEEK_SET) == 4)
+ 		xwrite(fd, &rifflen, 4);
+-	if (lseek64(fd, length_seek, SEEK_SET) == length_seek)
++	if (lseek(fd, length_seek, SEEK_SET) == length_seek)
+ 		xwrite(fd, &cd, sizeof(WaveChunkHeader));
+ }
+ 
+ static void end_au(int fd)
+ {				/* only close output */
+ 	AuHeader ah;
+-	off64_t length_seek;
++	off_t length_seek;
+ 	
+ 	length_seek = (char *)&ah.data_size - (char *)&ah;
+ 	ah.data_size = fdcount > 0xffffffff ? 0xffffffff : BE_INT(fdcount);
+-	if (lseek64(fd, length_seek, SEEK_SET) == length_seek)
++	if (lseek(fd, length_seek, SEEK_SET) == length_seek)
+ 		xwrite(fd, &ah.data_size, sizeof(ah.data_size));
+ }
+ 
+@@ -2828,11 +2828,11 @@ static void header(int rtype, char *name)
+ 
+ /* playing raw data */
+ 
+-static void playback_go(int fd, size_t loaded, off64_t count, int rtype, char *name)
++static void playback_go(int fd, size_t loaded, off_t count, int rtype, char *name)
+ {
+ 	int l, r;
+-	off64_t written = 0;
+-	off64_t c;
++	off_t written = 0;
++	off_t c;
+ 
+ 	header(rtype, name);
+ 	set_params();
+@@ -3202,7 +3202,7 @@ static void capture(char *orig_name)
+ 	int filecount=0;	/* number of files written */
+ 	char *name = orig_name;	/* current filename */
+ 	char namebuf[PATH_MAX+2];
+-	off64_t count, rest;		/* number of bytes to capture */
++	off_t count, rest;		/* number of bytes to capture */
+ 	struct stat statbuf;
+ 
+ 	/* get number of bytes to capture */
+@@ -3273,7 +3273,7 @@ static void capture(char *orig_name)
+ 		/* capture */
+ 		fdcount = 0;
+ 		while (rest > 0 && recycle_capture_file == 0 && !in_aborting) {
+-			size_t c = (rest <= (off64_t)chunk_bytes) ?
++			size_t c = (rest <= (off_t)chunk_bytes) ?
+ 				(size_t)rest : chunk_bytes;
+ 			size_t f = c * 8 / bits_per_frame;
+ 			size_t read = pcm_read(audiobuf, f);
+@@ -3314,7 +3314,7 @@ static void capture(char *orig_name)
+ 	} while ((file_type == FORMAT_RAW && !timelimit && !sampleslimit) || count > 0);
+ }
+ 
+-static void playbackv_go(int* fds, unsigned int channels, size_t loaded, off64_t count, int rtype, char **names)
++static void playbackv_go(int* fds, unsigned int channels, size_t loaded, off_t count, int rtype, char **names)
+ {
+ 	int r;
+ 	size_t vsize;
+@@ -3368,7 +3368,7 @@ static void playbackv_go(int* fds, unsigned int channels, size_t loaded, off64_t
+ 	}
+ }
+ 
+-static void capturev_go(int* fds, unsigned int channels, off64_t count, int rtype, char **names)
++static void capturev_go(int* fds, unsigned int channels, off_t count, int rtype, char **names)
+ {
+ 	size_t c;
+ 	ssize_t r;
+diff --git a/axfer/container-voc.c b/axfer/container-voc.c
+index ec0cfff..5941003 100644
+--- a/axfer/container-voc.c
++++ b/axfer/container-voc.c
+@@ -775,7 +775,7 @@ static int write_block_terminator(struct container_context *cntr)
+ static int write_data_size(struct container_context *cntr, uint64_t byte_count)
+ {
+ 	struct builder_state *state = cntr->private_data;
+-	off64_t offset;
++	off_t offset;
+ 	uint8_t size_field[3];
+ 	int err;
+ 
+diff --git a/axfer/container.c b/axfer/container.c
+index 8c88d5c..379b72f 100644
+--- a/axfer/container.c
++++ b/axfer/container.c
+@@ -113,11 +113,11 @@ enum container_format container_format_from_path(const char *path)
+ 	return CONTAINER_FORMAT_RAW;
+ }
+ 
+-int container_seek_offset(struct container_context *cntr, off64_t offset)
++int container_seek_offset(struct container_context *cntr, off_t offset)
+ {
+-	off64_t pos;
++	off_t pos;
+ 
+-	pos = lseek64(cntr->fd, offset, SEEK_SET);
++	pos = lseek(cntr->fd, offset, SEEK_SET);
+ 	if (pos < 0)
+ 		return -errno;
+ 	if (pos != offset)
+diff --git a/axfer/container.h b/axfer/container.h
+index 71017a6..f6ce689 100644
+--- a/axfer/container.h
++++ b/axfer/container.h
+@@ -107,7 +107,7 @@ int container_recursive_read(struct container_context *cntr, void *buf,
+ 			     unsigned int byte_count);
+ int container_recursive_write(struct container_context *cntr, void *buf,
+ 			      unsigned int byte_count);
+-int container_seek_offset(struct container_context *cntr, off64_t offset);
++int container_seek_offset(struct container_context *cntr, off_t offset);
+ 
+ extern const struct container_parser container_parser_riff_wave;
+ extern const struct container_builder container_builder_riff_wave;
+diff --git a/axfer/test/container-test.c b/axfer/test/container-test.c
+index e5b62dd..45b6c6a 100644
+--- a/axfer/test/container-test.c
++++ b/axfer/test/container-test.c
+@@ -153,7 +153,7 @@ static int callback(struct test_generator *gen, snd_pcm_access_t access,
+ 
+ 	for (i = 0; i < ARRAY_SIZE(entries); ++i) {
+ 		int fd;
+-		off64_t pos;
++		off_t pos;
+ 
+ 		frames_per_second = entries[i];
+ 
+@@ -172,7 +172,7 @@ static int callback(struct test_generator *gen, snd_pcm_access_t access,
+ 			     frames_per_second, frame_buffer, frame_count,
+ 			     trial->verbose);
+ 
+-		pos = lseek64(fd, 0, SEEK_SET);
++		pos = lseek(fd, 0, SEEK_SET);
+ 		if (pos < 0) {
+ 			err = -errno;
+ 			break;
+diff --git a/axfer/test/mapper-test.c b/axfer/test/mapper-test.c
+index 477871d..6a389e9 100644
+--- a/axfer/test/mapper-test.c
++++ b/axfer/test/mapper-test.c
+@@ -257,7 +257,7 @@ static int test_mapper(struct mapper_trial *trial, snd_pcm_access_t access,
+ 		goto end;
+ 
+ 	for (i = 0; i < cntr_count; ++i) {
+-		off64_t pos = lseek64(cntr_fds[i], 0, SEEK_SET);
++		off_t pos = lseek(cntr_fds[i], 0, SEEK_SET);
+ 		if (pos != 0) {
+ 			err = -EIO;
+ 			goto end;
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.2.8.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.2.8.bb
index b355deacc8..46d39b0de8 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.2.8.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.2.8.bb
@@ -24,7 +24,9 @@ PACKAGECONFIG[udev] = "--with-udev-rules-dir=`pkg-config --variable=udevdir udev
 PACKAGECONFIG[manpages] = "--enable-xmlto, --disable-xmlto, xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
 
 # alsa-utils specified in SRC_URI due to alsa-utils-scripts recipe
-SRC_URI = "https://www.alsa-project.org/files/pub/utils/alsa-utils-${PV}.tar.bz2"
+SRC_URI = "https://www.alsa-project.org/files/pub/utils/alsa-utils-${PV}.tar.bz2 \
+           file://0001-aplay-axfer-Replace-off64_t-with-off_t.patch \
+           "
 SRC_URI[sha256sum] = "e140fa604c351f36bd72167c8860c69d81b964ae6ab53992d6434dde38e9333c"
 
 # On build machines with python-docutils (not python3-docutils !!) installed
-- 
2.39.0


