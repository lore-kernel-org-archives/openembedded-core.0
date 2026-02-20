Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3370C5B567
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 20:53:30 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7215.1771620806729186341
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 12:53:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=AzCnodtt;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-2026022020532376fbbb97e600020729-ttn_jv@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 2026022020532376fbbb97e600020729
        for <openembedded-core@lists.openembedded.org>;
        Fri, 20 Feb 2026 21:53:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=8YWpNY7P6/txuLiWIJSQaE37uqqGxH1LCEjlMzCCi1g=;
 b=AzCnodttVBFiyEJ4lFOdpUtbtCP3t+xOw9QjXusHDKDoH2dEluYAz0/D8iyoyePrvRoKbx
 +4kalHDcI+ToGOFkCEywTelUUSkRDYE1ZdKTwJDnOHduV6E66xOTe/mn7I9CM3IWRkolIUjV
 R3Ye0GrgUjCmRK91xlRjH/BcA/J+uwmEF/GkNdrWcdXstnPanpiWm6OgNA/D8mYaqaC1V/Oo
 2IC7962FuHIux9NWukEkRfv+6Kz3TTOGwlxI32ut8IvqVydowEmthkVSEK8wDR5V/qwmehO0
 lgFREY6Uqq3bHBmTEKyOibcS8HUNhpea2CUImL6K83zsME71nMubZ8Dg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] alsa-lib: patch CVE-2026-25068
Date: Fri, 20 Feb 2026 21:53:15 +0100
Message-Id: <20260220205315.822080-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 20:53:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231548

From: Peter Marko <peter.marko@siemens.com>

Pick patch mentioned in NVD report.
It also includes CVE ID in commit message.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../alsa/alsa-lib/CVE-2026-25068.patch        | 34 +++++++++++++++++++
 .../alsa/alsa-lib_1.2.15.3.bb                 |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-25068.patch

diff --git a/meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-25068.patch b/meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-25068.patch
new file mode 100644
index 0000000000..9bb24c24e2
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-25068.patch
@@ -0,0 +1,34 @@
+From 5f7fe33002d2d98d84f72e381ec2cccc0d5d3d40 Mon Sep 17 00:00:00 2001
+From: Jaroslav Kysela <perex@perex.cz>
+Date: Thu, 29 Jan 2026 16:51:09 +0100
+Subject: [PATCH] topology: decoder - add boundary check for channel mixer
+ count
+
+Malicious binary topology file may cause heap corruption.
+
+CVE: CVE-2026-25068
+
+Signed-off-by: Jaroslav Kysela <perex@perex.cz>
+
+Upstream-Status: Backport [https://github.com/alsa-project/alsa-lib/commit/5f7fe33002d2d98d84f72e381ec2cccc0d5d3d40]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/topology/ctl.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/topology/ctl.c b/src/topology/ctl.c
+index a0c24518..322c461c 100644
+--- a/src/topology/ctl.c
++++ b/src/topology/ctl.c
+@@ -1250,6 +1250,11 @@ int tplg_decode_control_mixer1(snd_tplg_t *tplg,
+ 	if (mc->num_channels > 0) {
+ 		map = tplg_calloc(heap, sizeof(*map));
+ 		map->num_channels = mc->num_channels;
++		if (map->num_channels > SND_TPLG_MAX_CHAN ||
++		    map->num_channels > SND_SOC_TPLG_MAX_CHAN) {
++			snd_error(TOPOLOGY, "mixer: unexpected channel count %d", map->num_channels);
++			return -EINVAL;
++		}
+ 		for (i = 0; i < map->num_channels; i++) {
+ 			map->channel[i].reg = mc->channel[i].reg;
+ 			map->channel[i].shift = mc->channel[i].shift;
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb
index fec4b2c1a9..1ebb356925 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
                     "
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
+SRC_URI += "file://CVE-2026-25068.patch"
 SRC_URI[sha256sum] = "7b079d614d582cade7ab8db2364e65271d0877a37df8757ac4ac0c8970be861e"
 
 inherit autotools pkgconfig

