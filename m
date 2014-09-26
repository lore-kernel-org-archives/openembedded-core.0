Return-Path: <Muzaffar_Mahmood@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 16EDB60167
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Sep 2014 13:30:24 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1XXVbN-0000eN-18 from Muzaffar_Mahmood@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Sep 2014 06:30:25 -0700
Received: from svr-pkl-eng-06.pkl.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 26 Sep 2014 14:29:51 +0100
From: Muzaffar Mahmood <muzaffar_mahmood@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 26 Sep 2014 18:28:54 +0500
Message-ID: <1411738134-61403-1-git-send-email-muzaffar_mahmood@mentor.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [137.202.0.76]
Cc: Anant Agrawal <Anant_Agrawal@mentor.com>
Subject: [meta-oe][PATCH v3] alsa-utils: interrupt streaming via signal
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
X-List-Received-Date: Fri, 26 Sep 2014 13:30:26 -0000
Content-Type: text/plain

aplay/arecord (alsa-utils v1.0.28) cannot interrupt streaming
via CTRL-C. Fixed the issue by reverting buggy patches and
properly handling 'in_aborting' flag in appropriate functions.

Signed-off-by: Anant Agrawal <Anant_Agrawal@mentor.com>
Signed-off-by: Mikhail Durnev <mikhail_durnev@mentor.com>
Signed-off-by: Muzaffar Mahmood <muzaffar_mahmood@mentor.com>
---
 ...lsa-utils-aplay-interrupt-signal-handling.patch |   48 ++++++++++++++++++++
 meta/recipes-multimedia/alsa/alsa-utils_1.0.28.bb  |    1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-utils/alsa-utils-aplay-interrupt-signal-handling.patch

diff --git a/meta/recipes-multimedia/alsa/alsa-utils/alsa-utils-aplay-interrupt-signal-handling.patch b/meta/recipes-multimedia/alsa/alsa-utils/alsa-utils-aplay-interrupt-signal-handling.patch
new file mode 100644
index 0000000..5df004a
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-utils/alsa-utils-aplay-interrupt-signal-handling.patch
@@ -0,0 +1,48 @@
+Upstream-Status: Pending
+
+aplay/arecord (alsa-utils v1.0.28) cannot interrupt streaming
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
+@@ -2096,7 +2104,7 @@
+ 	ssize_t result = count, r;
+ 	size_t size;
+ 
+-	while (count > 0) {
++	while (count > 0 && !in_aborting) {
+ 		size = count;
+ 		if (size > chunk_bytes - buffer_pos)
+ 			size = chunk_bytes - buffer_pos;
diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.0.28.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.0.28.bb
index 2d23482..5f35d76 100644
--- a/meta/recipes-multimedia/alsa/alsa-utils_1.0.28.bb
+++ b/meta/recipes-multimedia/alsa/alsa-utils_1.0.28.bb
@@ -13,6 +13,7 @@ PACKAGECONFIG[xmlto] = "--enable-xmlto, --disable-xmlto, xmlto-native docbook-xm
 
 SRC_URI = "ftp://ftp.alsa-project.org/pub/utils/alsa-utils-${PV}.tar.bz2 \
            file://0001-alsactl-don-t-let-systemd-unit-restore-the-volume-wh.patch \
+           file://alsa-utils-aplay-interrupt-signal-handling.patch \
           "
 
 SRC_URI[md5sum] = "361552d5b1cacd0a1e7ba09e69990211"
-- 
1.7.9.5


