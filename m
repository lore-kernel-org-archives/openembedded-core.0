Return-Path: <tanuk@iki.fi>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
	[66.111.4.26])
	by mail.openembedded.org (Postfix) with ESMTP id 95C3D760A5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 11:20:44 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id DFC6E207E6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 07:20:44 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute1.internal (MEProxy); Wed, 17 Aug 2016 07:20:44 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:in-reply-to:in-reply-to
	:message-id:references:references:subject:to:x-sasl-enc
	:x-sasl-enc; s=smtpout; bh=ZviHMEcV5hpRNwpib82UWxRCCpI=; b=P86Md
	vIfR73LlMxf3Kw3YuK9DJV2SYpNR1x1P9YwfaWNuqZtyk42/QqCgetQAWn+ZmsrO
	yUcxGOz3HnCv5af3F94SLOh6DuA2On+mXQ5zuRuGtIgNM9g49sEKjDyDSaTSB/jH
	8Xh0HFGqARIa5wwRiIJA3vwGa275HtUV0BqNG0=
X-Sasl-enc: 5IdmgAnnDAP+hKnkL+DusQrACZPNeBQ5a4l2Se27t+sX 1471432844
Received: from laptop.tanuk.dy.fi (a88-113-211-72.elisa-laajakaista.fi
	[88.113.211.72])
	by mail.messagingengine.com (Postfix) with ESMTPA id 3FD70F285F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 07:20:44 -0400 (EDT)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Aug 2016 14:20:29 +0300
Message-Id: <65095d84fa5400628b5305c54a48e1b9eda7d051.1471432659.git.tanuk@iki.fi>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1471432658.git.tanuk@iki.fi>
References: <cover.1471432658.git.tanuk@iki.fi>
In-Reply-To: <cover.1471432658.git.tanuk@iki.fi>
References: <cover.1471432658.git.tanuk@iki.fi>
Subject: [PATCH 1/2] alsa-lib: 1.1.1 -> 1.1.2
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
X-List-Received-Date: Wed, 17 Aug 2016 11:20:44 -0000

Changelog:
http://www.alsa-project.org/main/index.php/Changes_v1.1.1_v1.1.2

Removed upstreamed patch:
0001-pcm_plugin-fix-appl-pointer-not-correct-when-mmap_co.patch

Rebased avoid-including-sys-poll.h-directly.patch

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---
 ...fix-appl-pointer-not-correct-when-mmap_co.patch | 137 ---------------------
 .../avoid-including-sys-poll.h-directly.patch      |  20 +--
 .../alsa/{alsa-lib_1.1.1.bb => alsa-lib_1.1.2.bb}  |   5 +-
 3 files changed, 12 insertions(+), 150 deletions(-)
 delete mode 100755 meta/recipes-multimedia/alsa/alsa-lib/0001-pcm_plugin-fix-appl-pointer-not-correct-when-mmap_co.patch
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.1.1.bb => alsa-lib_1.1.2.bb} (88%)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib/0001-pcm_plugin-fix-appl-pointer-not-correct-when-mmap_co.patch b/meta/recipes-multimedia/alsa/alsa-lib/0001-pcm_plugin-fix-appl-pointer-not-correct-when-mmap_co.patch
deleted file mode 100755
index bb2f82b..0000000
--- a/meta/recipes-multimedia/alsa/alsa-lib/0001-pcm_plugin-fix-appl-pointer-not-correct-when-mmap_co.patch
+++ /dev/null
@@ -1,137 +0,0 @@
-From 7c424edd116e76eee6218a1e9a6ff6c4daaf2a4d Mon Sep 17 00:00:00 2001
-From: Shengjiu Wang <shengjiu.wang@freescale.com>
-Date: Wed, 6 Apr 2016 19:02:12 +0800
-Subject: [PATCH] pcm_plugin: fix appl pointer not correct when mmap_commit()
- return error
-
-When snd_pcm_mmap_commit() return error, the appl pointer is also updated.
-which cause the avail_update()'s result wrong.
-This patch move the snd_pcm_mmap_appl_forward() to the place when
-snd_pcm_mmap_commit() is successfully returned.
-
-Upstream-Status: Accepted [expected in 1.1.2]
-
-Signed-off-by: Shengjiu Wang <shengjiu.wang@freescale.com>
-Signed-off-by: Takashi Iwai <tiwai@suse.de>
----
- src/pcm/pcm_plugin.c | 48 ++++++++++++++++++++++++++++++++----------------
- 1 file changed, 32 insertions(+), 16 deletions(-)
-
-diff --git a/src/pcm/pcm_plugin.c b/src/pcm/pcm_plugin.c
-index d007e8c..940491d 100644
---- a/src/pcm/pcm_plugin.c
-+++ b/src/pcm/pcm_plugin.c
-@@ -279,18 +279,22 @@ static snd_pcm_sframes_t snd_pcm_plugin_write_areas(snd_pcm_t *pcm,
- 			return -EPIPE;
- 		}
- 		snd_atomic_write_begin(&plugin->watom);
--		snd_pcm_mmap_appl_forward(pcm, frames);
- 		result = snd_pcm_mmap_commit(slave, slave_offset, slave_frames);
- 		if (result > 0 && (snd_pcm_uframes_t)result != slave_frames) {
- 			snd_pcm_sframes_t res;
- 			res = plugin->undo_write(pcm, slave_areas, slave_offset + result, slave_frames, slave_frames - result);
--			if (res < 0)
-+			if (res < 0) {
-+				snd_atomic_write_end(&plugin->watom);
- 				return xfer > 0 ? (snd_pcm_sframes_t)xfer : res;
-+			}
- 			frames -= res;
- 		}
--		snd_atomic_write_end(&plugin->watom);
--		if (result <= 0)
-+		if (result <= 0) {
-+			snd_atomic_write_end(&plugin->watom);
- 			return xfer > 0 ? (snd_pcm_sframes_t)xfer : result;
-+		}
-+		snd_pcm_mmap_appl_forward(pcm, frames);
-+		snd_atomic_write_end(&plugin->watom);
- 		offset += frames;
- 		xfer += frames;
- 		size -= frames;
-@@ -325,19 +329,23 @@ static snd_pcm_sframes_t snd_pcm_plugin_read_areas(snd_pcm_t *pcm,
- 			return -EPIPE;
- 		}
- 		snd_atomic_write_begin(&plugin->watom);
--		snd_pcm_mmap_appl_forward(pcm, frames);
- 		result = snd_pcm_mmap_commit(slave, slave_offset, slave_frames);
- 		if (result > 0 && (snd_pcm_uframes_t)result != slave_frames) {
- 			snd_pcm_sframes_t res;
- 			
- 			res = plugin->undo_read(slave, areas, offset, frames, slave_frames - result);
--			if (res < 0)
-+			if (res < 0) {
-+				snd_atomic_write_end(&plugin->watom);
- 				return xfer > 0 ? (snd_pcm_sframes_t)xfer : res;
-+			}
- 			frames -= res;
- 		}
--		snd_atomic_write_end(&plugin->watom);
--		if (result <= 0)
-+		if (result <= 0) {
-+			snd_atomic_write_end(&plugin->watom);
- 			return xfer > 0 ? (snd_pcm_sframes_t)xfer : result;
-+		}
-+		snd_pcm_mmap_appl_forward(pcm, frames);
-+		snd_atomic_write_end(&plugin->watom);
- 		offset += frames;
- 		xfer += frames;
- 		size -= frames;
-@@ -423,19 +431,23 @@ snd_pcm_plugin_mmap_commit(snd_pcm_t *pcm,
- 		frames = plugin->write(pcm, areas, appl_offset, frames,
- 				       slave_areas, slave_offset, &slave_frames);
- 		snd_atomic_write_begin(&plugin->watom);
--		snd_pcm_mmap_appl_forward(pcm, frames);
- 		result = snd_pcm_mmap_commit(slave, slave_offset, slave_frames);
--		snd_atomic_write_end(&plugin->watom);
- 		if (result > 0 && (snd_pcm_uframes_t)result != slave_frames) {
- 			snd_pcm_sframes_t res;
- 			
- 			res = plugin->undo_write(pcm, slave_areas, slave_offset + result, slave_frames, slave_frames - result);
--			if (res < 0)
-+			if (res < 0) {
-+				snd_atomic_write_end(&plugin->watom);
- 				return xfer > 0 ? xfer : res;
-+			}
- 			frames -= res;
- 		}
--		if (result <= 0)
-+		if (result <= 0) {
-+			snd_atomic_write_end(&plugin->watom);
- 			return xfer > 0 ? xfer : result;
-+		}
-+		snd_pcm_mmap_appl_forward(pcm, frames);
-+		snd_atomic_write_end(&plugin->watom);
- 		if (frames == cont)
- 			appl_offset = 0;
- 		else
-@@ -490,19 +502,23 @@ static snd_pcm_sframes_t snd_pcm_plugin_avail_update(snd_pcm_t *pcm)
- 			frames = (plugin->read)(pcm, areas, hw_offset, frames,
- 					      slave_areas, slave_offset, &slave_frames);
- 			snd_atomic_write_begin(&plugin->watom);
--			snd_pcm_mmap_hw_forward(pcm, frames);
- 			result = snd_pcm_mmap_commit(slave, slave_offset, slave_frames);
--			snd_atomic_write_end(&plugin->watom);
- 			if (result > 0 && (snd_pcm_uframes_t)result != slave_frames) {
- 				snd_pcm_sframes_t res;
- 				
- 				res = plugin->undo_read(slave, areas, hw_offset, frames, slave_frames - result);
--				if (res < 0)
-+				if (res < 0) {
-+					snd_atomic_write_end(&plugin->watom);
- 					return xfer > 0 ? (snd_pcm_sframes_t)xfer : res;
-+				}
- 				frames -= res;
- 			}
--			if (result <= 0)
-+			if (result <= 0) {
-+				snd_atomic_write_end(&plugin->watom);
- 				return xfer > 0 ? (snd_pcm_sframes_t)xfer : result;
-+			}
-+			snd_pcm_mmap_hw_forward(pcm, frames);
-+			snd_atomic_write_end(&plugin->watom);
- 			if (frames == cont)
- 				hw_offset = 0;
- 			else
--- 
-1.9.1
-
diff --git a/meta/recipes-multimedia/alsa/alsa-lib/avoid-including-sys-poll.h-directly.patch b/meta/recipes-multimedia/alsa/alsa-lib/avoid-including-sys-poll.h-directly.patch
index b8b1cb6..3d44585 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib/avoid-including-sys-poll.h-directly.patch
+++ b/meta/recipes-multimedia/alsa/alsa-lib/avoid-including-sys-poll.h-directly.patch
@@ -1,4 +1,4 @@
-From 7dcf46969e85c881c901df4b49309e9091cad16a Mon Sep 17 00:00:00 2001
+From c2c13cf0c469862cd39b2a69862002331ab7c8cb Mon Sep 17 00:00:00 2001
 From: Andre McCurdy <armccurdy@gmail.com>
 Date: Tue, 9 Feb 2016 14:01:18 -0800
 Subject: [PATCH] avoid including <sys/poll.h> directly
@@ -24,7 +24,7 @@ Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
  12 files changed, 12 insertions(+), 12 deletions(-)
 
 diff --git a/aserver/aserver.c b/aserver/aserver.c
-index 1579da7..ef64248 100644
+index ac20706..46f731a 100644
 --- a/aserver/aserver.c
 +++ b/aserver/aserver.c
 @@ -20,7 +20,7 @@
@@ -62,7 +62,7 @@ index 3c2766e..a546194 100644
  #include <stdarg.h>
  #include <endian.h>
 diff --git a/include/local.h b/include/local.h
-index b429f5d..e05898f 100644
+index 317f2e3..6a43a47 100644
 --- a/include/local.h
 +++ b/include/local.h
 @@ -47,7 +47,7 @@
@@ -75,18 +75,18 @@ index b429f5d..e05898f 100644
  #include <errno.h>
  #if defined(__linux__)
 diff --git a/src/control/control.c b/src/control/control.c
-index 4a28cf6..071c5db 100644
+index 6c00b8e..fd0c303 100644
 --- a/src/control/control.c
 +++ b/src/control/control.c
-@@ -48,7 +48,7 @@ and IEC958 structure.
+@@ -90,7 +90,7 @@ I/O operations.
  #include <string.h>
  #include <fcntl.h>
  #include <signal.h>
 -#include <sys/poll.h>
 +#include <poll.h>
+ #include <stdbool.h>
  #include "control_local.h"
  
- /**
 diff --git a/src/control/control_shm.c b/src/control/control_shm.c
 index bd07d4a..9a2e268 100644
 --- a/src/control/control_shm.c
@@ -101,7 +101,7 @@ index bd07d4a..9a2e268 100644
  #include <sys/uio.h>
  #include <sys/mman.h>
 diff --git a/src/pcm/pcm_direct.c b/src/pcm/pcm_direct.c
-index fd3877c..52ac093 100644
+index c3925cc..18f1dd5 100644
 --- a/src/pcm/pcm_direct.c
 +++ b/src/pcm/pcm_direct.c
 @@ -30,7 +30,7 @@
@@ -114,7 +114,7 @@ index fd3877c..52ac093 100644
  #include <sys/sem.h>
  #include <sys/wait.h>
 diff --git a/src/pcm/pcm_mmap.c b/src/pcm/pcm_mmap.c
-index 5c4fbe1..2cfa7db 100644
+index 1948289..4cf220a 100644
 --- a/src/pcm/pcm_mmap.c
 +++ b/src/pcm/pcm_mmap.c
 @@ -22,7 +22,7 @@
@@ -153,7 +153,7 @@ index a815ac6..4ee958c 100644
  #include <sys/mman.h>
  #include <netinet/in.h>
 diff --git a/src/seq/seq.c b/src/seq/seq.c
-index 620ca3f..681cef1 100644
+index 9279830..d2027cb 100644
 --- a/src/seq/seq.c
 +++ b/src/seq/seq.c
 @@ -777,7 +777,7 @@ void event_filter(snd_seq_t *seq, snd_seq_event_t *ev)
@@ -179,5 +179,5 @@ index 9843aa8..eaa71f0 100644
  #include <sys/shm.h>
  #include "list.h"
 -- 
-1.9.1
+2.8.1
 
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.1.1.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.1.2.bb
similarity index 88%
rename from meta/recipes-multimedia/alsa/alsa-lib_1.1.1.bb
rename to meta/recipes-multimedia/alsa/alsa-lib_1.1.2.bb
index 4fb7cca..ff47576 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.1.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.1.2.bb
@@ -17,10 +17,9 @@ ARM_INSTRUCTION_SET = "arm"
 SRC_URI = "ftp://ftp.alsa-project.org/pub/lib/${BP}.tar.bz2 \
            file://Check-if-wordexp-function-is-supported.patch \
            file://avoid-including-sys-poll.h-directly.patch \
-           file://0001-pcm_plugin-fix-appl-pointer-not-correct-when-mmap_co.patch \
 "
-SRC_URI[md5sum] = "881060d2c568f7f49db82c58df2f9ddc"
-SRC_URI[sha256sum] = "8ac76c3144ed2ed49da7622ab65ac5415205913ccbedde877972383cbc234269"
+SRC_URI[md5sum] = "1946e6438b8262a7b8fdadacd0e06ba7"
+SRC_URI[sha256sum] = "d38dacd9892b06b8bff04923c380b38fb2e379ee5538935ff37e45b395d861d6"
 
 inherit autotools pkgconfig
 
-- 
2.8.1


