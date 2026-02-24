Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB26CF357B8
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:33:22 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21487.1771943601866072309
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:33:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=XC0tnyLj;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4837907f535so50168725e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771943600; x=1772548400; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XuoiX2DC7+p05Y4RUMSS4+Te5CXtP57UOip/sal+s3g=;
        b=XC0tnyLjiluCm0Q9nhBNdOtH642FDxXelrhJ5O1jLdTiTfwTxsLLxv8KAl9ih5bZr4
         qA128rzhxE44LscMwze4lRvkLbWz/JIzeaq2xQBpCvX8u/NWvRMMshomswd32lh0ZA3M
         w6Alk5n0oG0qhBq1pIa0MHznaf5oHKGiehUec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943600; x=1772548400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XuoiX2DC7+p05Y4RUMSS4+Te5CXtP57UOip/sal+s3g=;
        b=hyB209obv+zJJISmRQ5199a7yuQVn17tZD37EQGoqKciBTnZ0763MZJAkGgyD1hO0u
         tym5SqKwDpEEpQpd8vovzpOU6JgMymX35GGeQGFMS2n7EVYDwHxjonHaf/tCD+OAT6lm
         hyxuD2INkq7TM5IgkcLEW3wxqwdmg8l+8L32WjaLXrkyPLGENg8OQ+gL+M+77f/sWTBN
         6xNdg9ysEYnk9WqmhmPK2Qqq0E2IZM0XbQ5VsIWVJMY9JA74b8ZdqaBID4fZIiaotGoQ
         7MZCUlNfPpImys8neF7fw8R5V7KCuDJ2lOhOKoEEwTxEIrOVoHrslnOKJIB7GglXpARd
         7Zyg==
X-Gm-Message-State: AOJu0YwpOlzY4HSokG2b8jo3x+cwBVTVOoWb9cowN6btLdMkuyXANro5
	HSLCLz8JrdSKcTh7h+QYS8pvvi+NeKnNiB4KrJ+b8jGRtGtii6RZYl000GLsy5c5LRusL6ITxVV
	lUI3/
X-Gm-Gg: AZuq6aL9sdrOH+9kMndDgGVAcbyVL+Q1uqIWs51UHu6fyMVmHkHhEsGBTPHkx8cJeKv
	sRgMkcjSal2wAx3Wg9iqkxZ52qJkmTiocA6Avv1y0TPAjIIZDbhKAVouE/XnXwAXJKs/P1LCgOL
	EOM0EZjmxNN6rNRhJuBEcjCqXdwXRnEgoinSeiH8SZW+S+eRLU4MWf/s/++/L1EgmbdLUmaBvUm
	ELRbMU0bVCv+ORMp1TZtXQrDWZa9dD7UZUvwK4q1wjPP7D4WQNZjJEoJr7srwoF+jNrAUyvvjcu
	JG6KfYwDB5Oz9qfQUEBwgBVF8VinbFZ9I9IfjCffR1cvU63VDBGE6lIo5rKcZ2V6bFeRWpukfgh
	pnnaPUwICSrwC1BkhfCBeeX4D9VCkDqjuP8pELgNZ2N0N8w6jpBZRZUa/sXPStk5K4rZTBU8syQ
	u1ms+Vq7RVg++2vlNA6q5uJKMU5HS8FYgNipeOHTwg6SJ4UCNLQgJz3id3a27BmLI0P4hszM37e
	XnBjPXt65p7n7p3JaZ7pAo5Q10E1eWy3+RQjSj/j5Hn
X-Received: by 2002:a05:600c:314e:b0:482:f12f:f35e with SMTP id 5b1f17b1804b1-483a95c710bmr201955965e9.12.1771943599678;
        Tue, 24 Feb 2026 06:33:19 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483b88f950esm19819895e9.15.2026.02.24.06.33.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:33:19 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 43/44] alsa-lib: patch CVE-2026-25068
Date: Tue, 24 Feb 2026 15:32:11 +0100
Message-ID: <3f04c0186017e4d410498674372517016ffd1bc8.1771943404.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771943404.git.yoann.congal@smile.fr>
References: <cover.1771943404.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:33:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231850

From: Peter Marko <peter.marko@siemens.com>

Pick patch mentioned in NVD report.
It also includes CVE ID in commit message.

Use older SNDERR funtion as new one is not yet available.
This was copied from Debian patch.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
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
 

