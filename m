Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB56DCA5FA7
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 21:30:11 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7560.1790717402033129259
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2026 14:30:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=TqoD3uRs;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20260929212959757fcf54650002072c-dsisl7@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20260929212959757fcf54650002072c
        for <openembedded-core@lists.openembedded.org>;
        Tue, 29 Sep 2026 23:29:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=tnpsL8sV0uAkZ7CBDX3zBVHukyecNRKwLkITXQmhGz8=;
 b=TqoD3uRswjHEi5OfkBM687iUPKy4GTDxl7FeESGkgFhI3A2tU8wGMRIMXsO85JC2EIIj72
 HLtiZBi73Z6RnodOMzqjWGKH3UHfC5w2/ooivqThymW/eeCK4SwIExRvZ8T2db6fyYRs8oFe
 K0GtrbuGzAneIoK/eZWEJjWtWP/+pMRkHW09SDG96cQSC7vYwazlu4SJ0fVM1BpyvFtRPcQU
 TNB5XCzVIwJVwXLJ8RUSsv5w+1/BPpiKr8bx4qQZr2WHsp5cRHAStabWbjFAggNGcEdnxHsO
 twpfUb6a8o01oTbQqOOpZbI9/5vCE0nv4au2JcEOY54SaZNboDI3XJ8Q==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH] alsa-lib: patch CVE-2026-90781
Date: Tue, 29 Sep 2026 23:29:35 +0200
Message-ID: <20260929212935.2961686-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 21:30:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246900

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1].

[1] https://security-tracker.debian.org/tracker/CVE-2026-90781

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../alsa/alsa-lib/CVE-2026-90781.patch        | 41 +++++++++++++++++++
 .../alsa/alsa-lib_1.2.15.3.bb                 |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-90781.patch

diff --git a/meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-90781.patch b/meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-90781.patch
new file mode 100644
index 0000000000..b2b2ce84cf
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-90781.patch
@@ -0,0 +1,41 @@
+From f84cd4ced7b36fddb8e4ee24404cf7c091d27020 Mon Sep 17 00:00:00 2001
+From: Jaroslav Kysela <perex@perex.cz>
+Date: Sun, 30 Aug 2026 20:20:30 +0200
+Subject: [PATCH] control: ctlparse - another fix for one-byte overrrun in
+ __snd_ctl_ascii_elem_id_parse
+
+Follows 1e27d63ef6d1dcf7d1f1a1e1eca3ea779e7de377 .
+
+Link: https://lore.kernel.org/alsa-devel/CACBQ=P2FhO3M6dkv3cWuKb6Qhs92ouV+FJ3SJZ_PVBSSdJWRAQ@mail.gmail.com/
+Reported-by: Harsh Raj Singhania <raj.harshraut@gmail.com>
+Signed-off-by: Jaroslav Kysela <perex@perex.cz>
+
+CVE: CVE-2026-90781
+Upstream-Status: Backport [https://github.com/alsa-project/alsa-lib/commit/f84cd4ced7b36fddb8e4ee24404cf7c091d27020]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/control/ctlparse.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/control/ctlparse.c b/src/control/ctlparse.c
+index c40de2bd..7132210e 100644
+--- a/src/control/ctlparse.c
++++ b/src/control/ctlparse.c
+@@ -207,7 +207,7 @@ int __snd_ctl_ascii_elem_id_parse(snd_ctl_elem_id_t *dst, const char *str,
+ 			if (*str == '\'' || *str == '\"') {
+ 				c = *str++;
+ 				while (*str && *str != c) {
+-					if (size < (int)sizeof(buf)) {
++					if (size < (int)sizeof(buf) - 1) {
+ 						*ptr++ = *str;
+ 						size++;
+ 					}
+@@ -217,7 +217,7 @@ int __snd_ctl_ascii_elem_id_parse(snd_ctl_elem_id_t *dst, const char *str,
+ 					str++;
+ 			} else {
+ 				while (*str && *str != ',') {
+-					if (size < (int)sizeof(buf)) {
++					if (size < (int)sizeof(buf) - 1) {
+ 						*ptr++ = *str;
+ 						size++;
+ 					}
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb
index 04976f3bf7..3081a522cb 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb
@@ -12,6 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
 SRC_URI += "file://CVE-2026-25068.patch"
 SRC_URI += "file://CVE-2026-56109.patch"
+SRC_URI += "file://CVE-2026-90781.patch"
 SRC_URI[sha256sum] = "7b079d614d582cade7ab8db2364e65271d0877a37df8757ac4ac0c8970be861e"
 
 inherit autotools pkgconfig

