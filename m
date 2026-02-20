Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B62FBC5B569
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 20:54:30 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7156.1771620868620129806
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 12:54:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=hyP4tszQ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-2026022020542675a21fb584000207bc-dtwmls@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 2026022020542675a21fb584000207bc
        for <openembedded-core@lists.openembedded.org>;
        Fri, 20 Feb 2026 21:54:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=9ahYviKvy2OiElp6rjV6sU5MsxY+n2NoXs2JlCFA9Oo=;
 b=hyP4tszQM3Sh58wjE1d0OuuZBX0IENO6Bh02GNNu9z4BEEcwAT+ndIAyF5CW9sQ1+m4nHk
 1CAHmnkWjggIvU8KB7W+AAfjO5Uxe7BH/i95N7s9JhlpnQZYCysib9sZywdhfWfUfpzSU8R0
 mzwjGgSRGPhvbtQJcrl0/+TLNB/MyKXRSPLUi3JPgnuF/ngZPYB6RTymXyiAMe6BTkbOW3K/
 yKkyhrQnhzbqJpTA7wT0rg4Ip4DcR3MmzHnTFJMPE32hvRG/9D4FEZjqz5G4HD5tgzFOr+yz
 TOJjoLB07Awp+B4Uz2pDzwgZ+MxJcPs0UGa+cjxxiZL5b2vdgQSMhT0Q==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] alsa-lib: patch CVE-2026-25068
Date: Fri, 20 Feb 2026 21:54:23 +0100
Message-Id: <20260220205423.822133-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 20:54:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231550

From: Peter Marko <peter.marko@siemens.com>

Pick patch mentioned in NVD report.
It also includes CVE ID in commit message.

Use older SNDERR funtion as new one is not yet available.
This was copied from Debian patch.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../alsa/alsa-lib/CVE-2026-25068.patch        | 34 +++++++++++++++++++
 .../alsa/alsa-lib_1.2.11.bb                   |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-25068.patch

diff --git a/meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-25068.patch b/meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-25068.patch
new file mode 100644
index 00000000000..5ecefc5aae0
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
+@@ -1247,6 +1247,11 @@ int tplg_decode_control_mixer1(snd_tplg_t *tplg,
+ 	if (mc->num_channels > 0) {
+ 		map = tplg_calloc(heap, sizeof(*map));
+ 		map->num_channels = mc->num_channels;
++		if (map->num_channels > SND_TPLG_MAX_CHAN ||
++		    map->num_channels > SND_SOC_TPLG_MAX_CHAN) {
++			SNDERR("mixer: unexpected channel count %d", map->num_channels);
++			return -EINVAL;
++		}
+ 		for (i = 0; i < map->num_channels; i++) {
+ 			map->channel[i].reg = mc->channel[i].reg;
+ 			map->channel[i].shift = mc->channel[i].shift;
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.11.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.11.bb
index c212b17aa3e..e86239ff871 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.11.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.11.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2 \
            file://0001-topology-correct-version-script-path.patch \
+           file://CVE-2026-25068.patch \
            "
 SRC_URI[sha256sum] = "9f3f2f69b995f9ad37359072fbc69a3a88bfba081fc83e9be30e14662795bb4d"
 

