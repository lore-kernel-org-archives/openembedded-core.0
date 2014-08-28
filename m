Return-Path: <Muzaffar_Mahmood@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id BC47565D34
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 14:43:44 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1XN0vR-0001My-KS from Muzaffar_Mahmood@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Aug 2014 07:43:46 -0700
Received: from svr-pkl-eng-06.pkl.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server (TLS) id 14.2.247.3; Thu, 28 Aug 2014 15:43:44 +0100
From: Muzaffar Mahmood <muzaffar_mahmood@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Aug 2014 19:43:07 +0500
Message-ID: <1409236987-31568-1-git-send-email-muzaffar_mahmood@mentor.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [137.202.0.76]
Cc: Anant Agrawal <Anant_Agrawal@mentor.com>
Subject: [PATCH] alsa-utils: interrupt streaming via signal
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
X-List-Received-Date: Thu, 28 Aug 2014 14:43:50 -0000
Content-Type: text/plain

From: Mikhail Durnev <mikhail_durnev@mentor.com>

aplay/arecord (alsa-utils v1.0.27.2) cannot interrupt streaming
via CTRL-C. Fixed the issue by reverting buggy patches and
properly handling 'in_aborting' flag in appropriate functions.

Signed-off-by: Anant Agrawal <Anant_Agrawal@mentor.com>
Signed-off-by: Mikhail Durnev <mikhail_durnev@mentor.com>
Signed-off-by: Muzaffar Mahmood <muzaffar_mahmood@mentor.com>
---
 ...lsa-utils-aplay-interrupt-signal-handling.patch |   84 ++++++++++++++++++++
 .../recipes-multimedia/alsa/alsa-utils_1.0.27.2.bb |    1 +
 2 files changed, 85 insertions(+)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-utils/alsa-utils-aplay-interrupt-signal-handling.patch

diff --git a/meta/recipes-multimedia/alsa/alsa-utils/alsa-utils-aplay-interrupt-signal-handling.patch b/meta/recipes-multimedia/alsa/alsa-utils/alsa-utils-aplay-interrupt-signal-handling.patch
new file mode 100644
index 0000000..a6092fd
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-utils/alsa-utils-aplay-interrupt-signal-handling.patch
@@ -0,0 +1,84 @@
+Upstream-Status: Pending
+
+aplay/arecord (alsa-utils v1.0.27.2) cannot interrupt streaming
+via CTRL-C. Fixed the issue by reverting buggy patches and
+properly handling 'in_aborting' flag in appropriate functions.
+
+Signed-off-by: Anant Agrawal <Anant_Agrawal@mentor.com>
+Signed-off-by: Mikhail Durnev <mikhail_durnev@mentor.com>
+
+--- a/aplay/aplay.c	2014-05-19 16:25:14.000000000 +0530
++++ b/aplay/aplay.c	2014-05-20 15:17:14.364823007 +0530
+@@ -392,14 +392,22 @@
+ 		putchar('\n');
+ 	if (!quiet_mode)
+ 		fprintf(stderr, _("Aborted by signal %s...\n"), strsignal(sig));
+-	if (handle)
++	if (stream == SND_PCM_STREAM_CAPTURE) {
++		if (fmt_rec_table[file_type].end) {
++			fmt_rec_table[file_type].end(fd);
++			fd = -1;
++		}
++		stream = -1;
++	}
++	if (fd > 1) {
++		close(fd);
++		fd = -1;
++	}
++	if (handle && sig != SIGABRT) {
+ 		snd_pcm_abort(handle);
+-	if (sig == SIGABRT) {
+-		/* do not call snd_pcm_close() and abort immediately */
+ 		handle = NULL;
+-		prg_exit(EXIT_FAILURE);
+ 	}
+-	signal(sig, signal_handler);
++	prg_exit(EXIT_FAILURE);
+ }
+ 
+ /* call on SIGUSR1 signal. */
+@@ -1921,7 +1929,7 @@
+ 		count = chunk_size;
+ 	}
+ 	data = remap_data(data, count);
+-	while (count > 0) {
++	while (count > 0 && !in_aborting) {
+ 		if (test_position)
+ 			do_test_position();
+ 		check_stdin();
+@@ -1964,7 +1972,7 @@
+ 		count = chunk_size;
+ 	}
+ 	data = remap_datav(data, count);
+-	while (count > 0) {
++	while (count > 0 && !in_aborting) {
+ 		unsigned int channel;
+ 		void *bufs[channels];
+ 		size_t offset = result;
+@@ -2013,7 +2021,7 @@
+ 		count = chunk_size;
+ 	}
+ 
+-	while (count > 0) {
++	while (count > 0 && !in_aborting) {
+ 		if (test_position)
+ 			do_test_position();
+ 		check_stdin();
+@@ -2052,7 +2060,7 @@
+ 		count = chunk_size;
+ 	}
+ 
+-	while (count > 0) {
++	while (count > 0 && !in_aborting) {
+ 		unsigned int channel;
+ 		void *bufs[channels];
+ 		size_t offset = result;
+@@ -2096,7 +2104,7 @@
+ 	ssize_t result = count, r;
+ 	size_t size;
+ 
+-	while (count > 0) {
++	while (count > 0 && !in_aborting) {
+ 		size = count;
+ 		if (size > chunk_bytes - buffer_pos)
+ 			size = chunk_bytes - buffer_pos;
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.0.27.2.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.0.27.2.bb
index 047fcfe..b139b68 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.0.27.2.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.0.27.2.bb
@@ -13,6 +13,7 @@ PACKAGECONFIG[xmlto] = "--enable-xmlto, --disable-xmlto, xmlto-native docbook-xm
 
 SRC_URI = "ftp://ftp.alsa-project.org/pub/utils/alsa-utils-${PV}.tar.bz2 \
            file://0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch \
+           file://alsa-utils-aplay-interrupt-signal-handling.patch \
           "
 
 SRC_URI[md5sum] = "b65e9a04181bd7c9db7667a4566f8dc3"
-- 
1.7.9.5


