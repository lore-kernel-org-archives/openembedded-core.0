Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78082C77B75
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 18:36:34 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.29803.1684262190979700237
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 May 2023 11:36:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=cIysmyOv;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 788A320004;
	Tue, 16 May 2023 18:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684262189;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rwk+nXpTXjybRQRpHI5qQbwKwozGc3kW5n64u4bkVOI=;
	b=cIysmyOvLy7wETqZMjkJgZwIOUqKWLWtnHr9uMyMXy1/6QWBd78+vxfb2PI7ZafZqGg8Hu
	6GqiJbURpppBmsl1COYfdI0SHutD6osyFnd3kVDSkczZCwZMVMAaHZkp1U6THtn3VCCyJx
	C7sSOvZsDpcYBkKEXuOb1fYrCy7sUSVS6NXJHQ5a3m/SBJtsm38mykKB6i529ds9kCWtDk
	UdlL1DGur/Ha6p9J+AbztJYE3sWdgnivvrPPfs7p0mf4xyR7WLai+aI3ApBiRd9SfSThwM
	GScZJkNJpapYpFXUD3Y06Mn7p+ydgp5mF7RRD2ZuJO7jUg4ZipCNe689oPANQw==
From: michael.opdenacker@bootlin.com
To: openembedded-core@lists.openembedded.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Subject: [PATCH 3/3] alsa-utils: upgrade 1.2.8 -> 1.2.9
Date: Tue, 16 May 2023 20:30:09 +0200
Message-Id: <20230516183009.1874105-4-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230516183009.1874105-1-michael.opdenacker@bootlin.com>
References: <20230516183009.1874105-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 May 2023 18:36:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181412

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 ...ompilation-when-building-in-a-subdir.patch |  35 +++
 ...lay-axfer-Replace-off64_t-with-off_t.patch | 272 ------------------
 ...lsa-utils_1.2.8.bb => alsa-utils_1.2.9.bb} |   6 +-
 3 files changed, 38 insertions(+), 275 deletions(-)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-utils/0001-alsactl-fix-compilation-when-building-in-a-subdir.patch
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-utils/0001-aplay-axfer-Replace-off64_t-with-off_t.patch
 rename meta/recipes-multimedia/alsa/{alsa-utils_1.2.8.bb => alsa-utils_1.2.9.bb} (96%)

diff --git a/meta/recipes-multimedia/alsa/alsa-utils/0001-alsactl-fix-compilation-when-building-in-a-subdir.patch b/meta/recipes-multimedia/alsa/alsa-utils/0001-alsactl-fix-compilation-when-building-in-a-subdir.patch
new file mode 100644
index 0000000000..3b3fe5345a
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-utils/0001-alsactl-fix-compilation-when-building-in-a-subdir.patch
@@ -0,0 +1,35 @@
+From 44636a7c5862538def0d2fac074772cc39a22a15 Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Tue, 16 May 2023 02:27:59 +1000
+Subject: [PATCH] alsactl: fix compilation when building in a subdir
+
+Fixes: 613372d
+Fixes: cff2d1c
+
+Compile errors when building in a subdir:
+alsactl/alsactl.c:33:10: fatal error: os_compat.h: No such file or directory
+   33 | #include "os_compat.h"
+      |          ^~~~~~~~~~~~~
+alsactl/lock.c:34:10: fatal error: os_compat.h: No such file or directory
+   34 | #include "os_compat.h"
+      |          ^~~~~~~~~~~~~
+
+Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
+Upstream-Status: Submitted [https://github.com/alsa-project/alsa-utils/pull/213]
+---
+ alsactl/Makefile.am | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/alsactl/Makefile.am b/alsactl/Makefile.am
+index 80dba69d..fb32c4f3 100644
+--- a/alsactl/Makefile.am
++++ b/alsactl/Makefile.am
+@@ -9,6 +9,8 @@ EXTRA_DIST=alsactl.1 alsactl_init.xml
+ 
+ AM_CFLAGS = -D_GNU_SOURCE
+ 
++AM_CPPFLAGS = -I$(top_srcdir)/include
++
+ alsactl_SOURCES=alsactl.c state.c lock.c utils.c init_parse.c init_ucm.c \
+ 		daemon.c monitor.c clean.c info.c
+ 
diff --git a/meta/recipes-multimedia/alsa/alsa-utils/0001-aplay-axfer-Replace-off64_t-with-off_t.patch b/meta/recipes-multimedia/alsa/alsa-utils/0001-aplay-axfer-Replace-off64_t-with-off_t.patch
deleted file mode 100644
index 356c5964ae..0000000000
--- a/meta/recipes-multimedia/alsa/alsa-utils/0001-aplay-axfer-Replace-off64_t-with-off_t.patch
+++ /dev/null
@@ -1,272 +0,0 @@
-From 03553ccc6284a437576349b5a3c2ed0d7d4265e1 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 15 Dec 2022 14:04:10 -0800
-Subject: [PATCH] aplay,axfer: Replace off64_t with off_t
-
-Also replace lseek64 with lseek.
-
-_FILE_OFFSET_BITS=64 is passed to needed platforms since configure uses
-AC_SYS_LARGEFILE macro. Therefore off_t is already 64-bit and lseek is
-same as lseek64.
-
-Additionally this fixes buils with latest musl where these lfs64
-functions are moved out from _GNU_SOURCE and under _LARGEFILE64_SOURCE
-macro alone. This makes the builds fail on 32-bit platforms even though
-default off_t on musl is 64-bit always.
-
-Upstream-Status: Submitted [https://github.com/alsa-project/alsa-utils/pull/183]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- aplay/aplay.c               | 44 ++++++++++++++++++-------------------
- axfer/container-voc.c       |  2 +-
- axfer/container.c           |  6 ++---
- axfer/container.h           |  2 +-
- axfer/test/container-test.c |  4 ++--
- axfer/test/mapper-test.c    |  2 +-
- 6 files changed, 30 insertions(+), 30 deletions(-)
-
-diff --git a/aplay/aplay.c b/aplay/aplay.c
-index 6ce7191..bd93be3 100644
---- a/aplay/aplay.c
-+++ b/aplay/aplay.c
-@@ -141,7 +141,7 @@ static long term_c_lflag = -1;
- static int dump_hw_params = 0;
- 
- static int fd = -1;
--static off64_t pbrec_count = LLONG_MAX, fdcount;
-+static off_t pbrec_count = LLONG_MAX, fdcount;
- static int vocmajor, vocminor;
- 
- static char *pidfile_name = NULL;
-@@ -2356,7 +2356,7 @@ static void voc_play(int fd, int ofs, char *name)
- 	u_char *data, *buf;
- 	char was_extended = 0, output = 0;
- 	u_short *sp, repeat = 0;
--	off64_t filepos = 0;
-+	off_t filepos = 0;
- 
- #define COUNT(x)	nextblock -= x; in_buffer -= x; data += x
- #define COUNT1(x)	in_buffer -= x; data += x
-@@ -2490,7 +2490,7 @@ static void voc_play(int fd, int ofs, char *name)
- 				d_printf("Repeat loop %d times\n", repeat);
- #endif
- 				if (filepos >= 0) {	/* if < 0, one seek fails, why test another */
--					if ((filepos = lseek64(fd, 0, 1)) < 0) {
-+					if ((filepos = lseek(fd, 0, 1)) < 0) {
- 						error(_("can't play loops; %s isn't seekable\n"), name);
- 						repeat = 0;
- 					} else {
-@@ -2512,7 +2512,7 @@ static void voc_play(int fd, int ofs, char *name)
- 					else
- 						d_printf("Neverending loop\n");
- #endif
--					lseek64(fd, filepos, 0);
-+					lseek(fd, filepos, 0);
- 					in_buffer = 0;	/* clear the buffer */
- 					goto Fill_the_buffer;
- 				}
-@@ -2578,9 +2578,9 @@ static void init_raw_data(void)
- }
- 
- /* calculate the data count to read from/to dsp */
--static off64_t calc_count(void)
-+static off_t calc_count(void)
- {
--	off64_t count;
-+	off_t count;
- 
- 	if (timelimit == 0)
- 		if (sampleslimit == 0)
-@@ -2589,7 +2589,7 @@ static off64_t calc_count(void)
- 			count = snd_pcm_format_size(hwparams.format, sampleslimit * hwparams.channels);
- 	else {
- 		count = snd_pcm_format_size(hwparams.format, hwparams.rate * hwparams.channels);
--		count *= (off64_t)timelimit;
-+		count *= (off_t)timelimit;
- 	}
- 	return count < pbrec_count ? count : pbrec_count;
- }
-@@ -2750,7 +2750,7 @@ static void begin_au(int fd, size_t cnt)
- /* closing .VOC */
- static void end_voc(int fd)
- {
--	off64_t length_seek;
-+	off_t length_seek;
- 	VocBlockType bt;
- 	size_t cnt;
- 	char dummy = 0;		/* Write a Terminator */
-@@ -2770,15 +2770,15 @@ static void end_voc(int fd)
- 	bt.datalen = (u_char) (cnt & 0xFF);
- 	bt.datalen_m = (u_char) ((cnt & 0xFF00) >> 8);
- 	bt.datalen_h = (u_char) ((cnt & 0xFF0000) >> 16);
--	if (lseek64(fd, length_seek, SEEK_SET) == length_seek)
-+	if (lseek(fd, length_seek, SEEK_SET) == length_seek)
- 		xwrite(fd, &bt, sizeof(VocBlockType));
- }
- 
- static void end_wave(int fd)
- {				/* only close output */
- 	WaveChunkHeader cd;
--	off64_t length_seek;
--	off64_t filelen;
-+	off_t length_seek;
-+	off_t filelen;
- 	u_int rifflen;
- 	
- 	length_seek = sizeof(WaveHeader) +
-@@ -2788,20 +2788,20 @@ static void end_wave(int fd)
- 	cd.length = fdcount > 0x7fffffff ? LE_INT(0x7fffffff) : LE_INT(fdcount);
- 	filelen = fdcount + 2*sizeof(WaveChunkHeader) + sizeof(WaveFmtBody) + 4;
- 	rifflen = filelen > 0x7fffffff ? LE_INT(0x7fffffff) : LE_INT(filelen);
--	if (lseek64(fd, 4, SEEK_SET) == 4)
-+	if (lseek(fd, 4, SEEK_SET) == 4)
- 		xwrite(fd, &rifflen, 4);
--	if (lseek64(fd, length_seek, SEEK_SET) == length_seek)
-+	if (lseek(fd, length_seek, SEEK_SET) == length_seek)
- 		xwrite(fd, &cd, sizeof(WaveChunkHeader));
- }
- 
- static void end_au(int fd)
- {				/* only close output */
- 	AuHeader ah;
--	off64_t length_seek;
-+	off_t length_seek;
- 	
- 	length_seek = (char *)&ah.data_size - (char *)&ah;
- 	ah.data_size = fdcount > 0xffffffff ? 0xffffffff : BE_INT(fdcount);
--	if (lseek64(fd, length_seek, SEEK_SET) == length_seek)
-+	if (lseek(fd, length_seek, SEEK_SET) == length_seek)
- 		xwrite(fd, &ah.data_size, sizeof(ah.data_size));
- }
- 
-@@ -2828,11 +2828,11 @@ static void header(int rtype, char *name)
- 
- /* playing raw data */
- 
--static void playback_go(int fd, size_t loaded, off64_t count, int rtype, char *name)
-+static void playback_go(int fd, size_t loaded, off_t count, int rtype, char *name)
- {
- 	int l, r;
--	off64_t written = 0;
--	off64_t c;
-+	off_t written = 0;
-+	off_t c;
- 
- 	header(rtype, name);
- 	set_params();
-@@ -3202,7 +3202,7 @@ static void capture(char *orig_name)
- 	int filecount=0;	/* number of files written */
- 	char *name = orig_name;	/* current filename */
- 	char namebuf[PATH_MAX+2];
--	off64_t count, rest;		/* number of bytes to capture */
-+	off_t count, rest;		/* number of bytes to capture */
- 	struct stat statbuf;
- 
- 	/* get number of bytes to capture */
-@@ -3273,7 +3273,7 @@ static void capture(char *orig_name)
- 		/* capture */
- 		fdcount = 0;
- 		while (rest > 0 && recycle_capture_file == 0 && !in_aborting) {
--			size_t c = (rest <= (off64_t)chunk_bytes) ?
-+			size_t c = (rest <= (off_t)chunk_bytes) ?
- 				(size_t)rest : chunk_bytes;
- 			size_t f = c * 8 / bits_per_frame;
- 			size_t read = pcm_read(audiobuf, f);
-@@ -3314,7 +3314,7 @@ static void capture(char *orig_name)
- 	} while ((file_type == FORMAT_RAW && !timelimit && !sampleslimit) || count > 0);
- }
- 
--static void playbackv_go(int* fds, unsigned int channels, size_t loaded, off64_t count, int rtype, char **names)
-+static void playbackv_go(int* fds, unsigned int channels, size_t loaded, off_t count, int rtype, char **names)
- {
- 	int r;
- 	size_t vsize;
-@@ -3368,7 +3368,7 @@ static void playbackv_go(int* fds, unsigned int channels, size_t loaded, off64_t
- 	}
- }
- 
--static void capturev_go(int* fds, unsigned int channels, off64_t count, int rtype, char **names)
-+static void capturev_go(int* fds, unsigned int channels, off_t count, int rtype, char **names)
- {
- 	size_t c;
- 	ssize_t r;
-diff --git a/axfer/container-voc.c b/axfer/container-voc.c
-index ec0cfff..5941003 100644
---- a/axfer/container-voc.c
-+++ b/axfer/container-voc.c
-@@ -775,7 +775,7 @@ static int write_block_terminator(struct container_context *cntr)
- static int write_data_size(struct container_context *cntr, uint64_t byte_count)
- {
- 	struct builder_state *state = cntr->private_data;
--	off64_t offset;
-+	off_t offset;
- 	uint8_t size_field[3];
- 	int err;
- 
-diff --git a/axfer/container.c b/axfer/container.c
-index 8c88d5c..379b72f 100644
---- a/axfer/container.c
-+++ b/axfer/container.c
-@@ -113,11 +113,11 @@ enum container_format container_format_from_path(const char *path)
- 	return CONTAINER_FORMAT_RAW;
- }
- 
--int container_seek_offset(struct container_context *cntr, off64_t offset)
-+int container_seek_offset(struct container_context *cntr, off_t offset)
- {
--	off64_t pos;
-+	off_t pos;
- 
--	pos = lseek64(cntr->fd, offset, SEEK_SET);
-+	pos = lseek(cntr->fd, offset, SEEK_SET);
- 	if (pos < 0)
- 		return -errno;
- 	if (pos != offset)
-diff --git a/axfer/container.h b/axfer/container.h
-index 71017a6..f6ce689 100644
---- a/axfer/container.h
-+++ b/axfer/container.h
-@@ -107,7 +107,7 @@ int container_recursive_read(struct container_context *cntr, void *buf,
- 			     unsigned int byte_count);
- int container_recursive_write(struct container_context *cntr, void *buf,
- 			      unsigned int byte_count);
--int container_seek_offset(struct container_context *cntr, off64_t offset);
-+int container_seek_offset(struct container_context *cntr, off_t offset);
- 
- extern const struct container_parser container_parser_riff_wave;
- extern const struct container_builder container_builder_riff_wave;
-diff --git a/axfer/test/container-test.c b/axfer/test/container-test.c
-index e5b62dd..45b6c6a 100644
---- a/axfer/test/container-test.c
-+++ b/axfer/test/container-test.c
-@@ -153,7 +153,7 @@ static int callback(struct test_generator *gen, snd_pcm_access_t access,
- 
- 	for (i = 0; i < ARRAY_SIZE(entries); ++i) {
- 		int fd;
--		off64_t pos;
-+		off_t pos;
- 
- 		frames_per_second = entries[i];
- 
-@@ -172,7 +172,7 @@ static int callback(struct test_generator *gen, snd_pcm_access_t access,
- 			     frames_per_second, frame_buffer, frame_count,
- 			     trial->verbose);
- 
--		pos = lseek64(fd, 0, SEEK_SET);
-+		pos = lseek(fd, 0, SEEK_SET);
- 		if (pos < 0) {
- 			err = -errno;
- 			break;
-diff --git a/axfer/test/mapper-test.c b/axfer/test/mapper-test.c
-index 477871d..6a389e9 100644
---- a/axfer/test/mapper-test.c
-+++ b/axfer/test/mapper-test.c
-@@ -257,7 +257,7 @@ static int test_mapper(struct mapper_trial *trial, snd_pcm_access_t access,
- 		goto end;
- 
- 	for (i = 0; i < cntr_count; ++i) {
--		off64_t pos = lseek64(cntr_fds[i], 0, SEEK_SET);
-+		off_t pos = lseek(cntr_fds[i], 0, SEEK_SET);
- 		if (pos != 0) {
- 			err = -EIO;
- 			goto end;
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.2.8.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.2.9.bb
similarity index 96%
rename from meta/recipes-multimedia/alsa/alsa-utils_1.2.8.bb
rename to meta/recipes-multimedia/alsa/alsa-utils_1.2.9.bb
index 46d39b0de8..2f344015a9 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.2.8.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.2.9.bb
@@ -25,9 +25,9 @@ PACKAGECONFIG[manpages] = "--enable-xmlto, --disable-xmlto, xmlto-native docbook
 
 # alsa-utils specified in SRC_URI due to alsa-utils-scripts recipe
 SRC_URI = "https://www.alsa-project.org/files/pub/utils/alsa-utils-${PV}.tar.bz2 \
-           file://0001-aplay-axfer-Replace-off64_t-with-off_t.patch \
-           "
-SRC_URI[sha256sum] = "e140fa604c351f36bd72167c8860c69d81b964ae6ab53992d6434dde38e9333c"
+           file://0001-alsactl-fix-compilation-when-building-in-a-subdir.patch \
+          "
+SRC_URI[sha256sum] = "e7623d4525595f92e11ce25ee9a97f2040a14c6e4dcd027aa96e06cbce7817bd"
 
 # On build machines with python-docutils (not python3-docutils !!) installed
 # rst2man (not rst2man.py) is detected and compile fails with
-- 
2.34.1


