Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22082.1793832604131227726
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 14:50:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=Q7hfT4gL;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20261104225001c17939487800020711-yrmxut@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20261104225001c17939487800020711
        for <openembedded-core@lists.openembedded.org>;
        Wed, 04 Nov 2026 23:50:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=ShQp6dAVPYr0l4Hzc71qWVNyFfhfMhrqJzEWW4HyiPA=;
 b=Q7hfT4gLBEB35ASNQR2FStSywwYI5mcjCxIgUstFXXFHnkOlZoTxX5xShpLSERP1Izi9Yf
 30kMgcpcZt/pybQJntlJy3Fxfr4YDsDPu4l2dfgVgopvFgsjnHfr6KF61AiMdwhCBip+w2br
 gladObHLpGKC6xVUiehp8djuRNbkKBd8QBxypOV/cq0AqpaavFSapQZpUpJODkYYdSNWkma3
 aucDDJ2gVKDzdDjvXcMkM+XWDKamgEC84YW2POnl6hC4SVzJuP56PFyo9zLIXEh6aUN++jA0
 o30HtmjV5JRauTbuebxlha0Jj6b+PJ2PHqMgXwrkLJrrVB4rRxe9RtMA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH] alsa-lib: patch CVE-2026-96674 and CVE-2026-96675
Date: Wed,  4 Nov 2026 23:48:40 +0100
Message-ID: <20261104224840.2433581-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 22:50:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249416
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick same patches as done in master commit
fbe75cba76c36924d7569bafc5f2d4f037c429c4

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../alsa/alsa-lib/CVE-2026-96674.patch        | 68 +++++++++++++++++++
 .../alsa/alsa-lib/CVE-2026-96675.patch        | 45 ++++++++++++
 .../alsa/alsa-lib_1.2.15.3.bb                 |  2 +
 3 files changed, 115 insertions(+)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-96674.patch
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-96675.patch

diff --git a/meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-96674.patch b/meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-96674.patch
new file mode 100644
index 0000000000..49d00d3845
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-96674.patch
@@ -0,0 +1,68 @@
+From f8253a68baf9a5f57cdff1cd178920d13e5beb2b Mon Sep 17 00:00:00 2001
+From: Harsh Raj Singhania <raj.harshraut@gmail.com>
+Date: Thu, 1 Oct 2026 00:28:15 +0530
+Subject: [PATCH] topology: fix uint32_t overflow in control decoder size
+ checks
+
+size2 = x->size + x->priv.size was computed in 32-bit arithmetic and could
+wrap on a 64-bit host, bypassing the subsequent bounds check. Pre-check
+for overflow then cast to size_t. Affects tplg_decode_control_mixer,
+tplg_decode_control_enum, and tplg_decode_control_bytes.
+
+Closes: https://github.com/alsa-project/alsa-lib/pull/527
+Signed-off-by: Harsh Raj Singhania <raj.harshraut@gmail.com>
+Signed-off-by: Takashi Iwai <tiwai@suse.de>
+
+CVE: CVE-2026-96674
+Upstream-Status: Backport [https://github.com/alsa-project/alsa-lib/commit/f8253a68baf9a5f57cdff1cd178920d13e5beb2b]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/topology/ctl.c | 21 ++++++++++++++++++---
+ 1 file changed, 18 insertions(+), 3 deletions(-)
+
+diff --git a/src/topology/ctl.c b/src/topology/ctl.c
+index 322c461c..93a09f1e 100644
+--- a/src/topology/ctl.c
++++ b/src/topology/ctl.c
+@@ -1315,7 +1315,12 @@ next:
+ 	}
+ 	INIT_LIST_HEAD(&heap);
+ 	mc = bin;
+-	size2 = mc->size + mc->priv.size;
++	if (mc->priv.size > size || mc->size > size - mc->priv.size) {
++		snd_error(TOPOLOGY, "mixer: element sizes overflow (%d, priv %d)",
++				    mc->size, mc->priv.size);
++		return -EINVAL;
++	}
++	size2 = (size_t)mc->size + (size_t)mc->priv.size;
+ 	if (size2 > size) {
+ 		snd_error(TOPOLOGY, "mixer: wrong element size (%d, priv %d)",
+ 				    mc->size, mc->priv.size);
+@@ -1419,7 +1424,12 @@ next:
+ 	}
+ 	INIT_LIST_HEAD(&heap);
+ 	ec = bin;
+-	size2 = ec->size + ec->priv.size;
++	if (ec->priv.size > size || ec->size > size - ec->priv.size) {
++		snd_error(TOPOLOGY, "enum: element sizes overflow (%d, priv %d)",
++				    ec->size, ec->priv.size);
++		return -EINVAL;
++	}
++	size2 = (size_t)ec->size + (size_t)ec->priv.size;
+ 	if (size2 > size) {
+ 		snd_error(TOPOLOGY, "enum: wrong element size (%d, priv %d)",
+ 				    ec->size, ec->priv.size);
+@@ -1510,7 +1520,12 @@ next:
+ 		return -EINVAL;
+ 	}
+ 	bc = bin;
+-	size2 = bc->size + bc->priv.size;
++	if (bc->priv.size > size || bc->size > size - bc->priv.size) {
++		snd_error(TOPOLOGY, "bytes: element sizes overflow (%d, priv %d)",
++				    bc->size, bc->priv.size);
++		return -EINVAL;
++	}
++	size2 = (size_t)bc->size + (size_t)bc->priv.size;
+ 	if (size2 > size) {
+ 		snd_error(TOPOLOGY, "bytes: wrong element size (%d, priv %d)",
+ 				    bc->size, bc->priv.size);
diff --git a/meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-96675.patch b/meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-96675.patch
new file mode 100644
index 0000000000..bd8c35a1c3
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-96675.patch
@@ -0,0 +1,45 @@
+From 81c4a89eb445f8e991ca80ab55b5649530c0aacd Mon Sep 17 00:00:00 2001
+From: Harsh Raj Singhania <raj.harshraut@gmail.com>
+Date: Thu, 1 Oct 2026 00:28:53 +0530
+Subject: [PATCH] pcm: replace multi plugin binding asserts with -EINVAL checks
+
+Sparse binding maps leave sidxs[i] == -1 for gap indices. The previous
+assert() calls caused SIGABRT in debug builds and OOB reads under NDEBUG.
+Return -EINVAL with explicit bounds and sign checks instead.
+
+[ fixed coding style -- tiwai ]
+
+Closes: https://github.com/alsa-project/alsa-lib/pull/527
+Signed-off-by: Harsh Raj Singhania <raj.harshraut@gmail.com>
+Signed-off-by: Takashi Iwai <tiwai@suse.de>
+
+CVE: CVE-2026-96675
+Upstream-Status: Backport [https://github.com/alsa-project/alsa-lib/commit/81c4a89eb445f8e991ca80ab55b5649530c0aacd]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/pcm/pcm_multi.c | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/src/pcm/pcm_multi.c b/src/pcm/pcm_multi.c
+index 121c4c20..c7c67e73 100644
+--- a/src/pcm/pcm_multi.c
++++ b/src/pcm/pcm_multi.c
+@@ -1121,8 +1121,16 @@ int snd_pcm_multi_open(snd_pcm_t **pcmp, const char *name,
+ 	}
+ 	for (i = 0; i < channels_count; ++i) {
+ 		snd_pcm_multi_channel_t *bind = &multi->channels[i];
+-		assert(sidxs[i] < (int)slaves_count);
+-		assert(schannels[i] < schannels_count[sidxs[i]]);
++		if (sidxs[i] < 0 || sidxs[i] >= (int)slaves_count) {
++			SNDERR("multi: ch %d invalid slave idx %d",
++			       i, sidxs[i]);
++			return -EINVAL;
++		}
++		if (schannels[i] >= schannels_count[sidxs[i]]) {
++			SNDERR("multi: ch %d channel %d out of range",
++			       i, schannels[i]);
++			return -EINVAL;
++		}
+ 		bind->slave_idx = sidxs[i];
+ 		bind->slave_channel = schannels[i];
+ 		if (sidxs[i] < 0)
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb
index 3081a522cb..288777b83f 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb
@@ -13,6 +13,8 @@ SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
 SRC_URI += "file://CVE-2026-25068.patch"
 SRC_URI += "file://CVE-2026-56109.patch"
 SRC_URI += "file://CVE-2026-90781.patch"
+SRC_URI += "file://CVE-2026-96674.patch"
+SRC_URI += "file://CVE-2026-96675.patch"
 SRC_URI[sha256sum] = "7b079d614d582cade7ab8db2364e65271d0877a37df8757ac4ac0c8970be861e"
 
 inherit autotools pkgconfig
