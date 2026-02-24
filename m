Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4F7AF3C995
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:41:13 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21678.1771944073301990042
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:41:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=CbQKzOTz;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4376c0bffc1so4230164f8f.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771944071; x=1772548871; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D3Tylk3PpUHtgLTgkY+1S3R0NruZMObVYPIbk++MQ1Q=;
        b=CbQKzOTzTo7yjJmtuYO8OQOK/kQWZbxCVF4HqEbCU9oZjTrmzZwszQpvg8cW9OWPCO
         CX40G3nSLwjJEN5RL1ijydrE3I95DXkRxe7rWLRCNA+iO3klAotSIqR5vvAT9H/jVEpD
         Kq3oFNyi6X4gJ7rfsVVo/+0PJMMonaD8zHWQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771944071; x=1772548871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D3Tylk3PpUHtgLTgkY+1S3R0NruZMObVYPIbk++MQ1Q=;
        b=A+3rjpcqQ7NBriZPrZpIfXVRqmVHowNDWjPMktw1dTquFkRRBujFEwJGG2hgraW2PG
         kEIQTjlUSnVZa5xy7KZgT1weqnWDPI725+y73PGKX7IVtHyBgivyU4xedlFY0ISgfa0g
         eRBKlBTMgl9w/0IXP72XO2wfx1nNjbbupXXVK7uw0hP37VEbuXyngEBQH78ZuvToHmIN
         4MlODgoCfWjFx7lBTAr8KoJLU1yq0hY8BqFXwE9s7ZG/r4Frmi26+rIpPDQZd5JXgBMo
         mr2yz30RKW55gqmOqXNVO88VubrMtNQNAhLnPpJrLKoSiFQ3qlui8rVxjGAWJvJambnH
         BZgg==
X-Gm-Message-State: AOJu0Yz+qxV3SdYZ6PNAxFiRkCvtJ36+oZVgW7lXiB6M7EnNlqsISAOr
	CwMS7Jn7aOzSXC6y0aCbhVtOXWCPnlj4AhL2Rp3l9WzoiU9IJtJLJUdXt837BiRRWzpQTwg5H2C
	iFQT/
X-Gm-Gg: ATEYQzx1wl2C4xb7ox78bG7NgeLqrNAFby05eUAaR2+xKPf79vttxAGN2BMF2HNOtcs
	pJsZ+pL4AXEHXBSlptgl9E7c6Z1pQ2nsiA1zWfTnaqB2Qy2NR6uRINpU8lT3nxkJx+zxq0q3hhD
	5K1ObpHxiEvExQmpn+YS622ARdFG0TPnCE4iFIw1znSDbzOKqGQjYsBWOQHPVdjuIUYbR0Qi7Sm
	IKDt/2VUDyoujTP6civVav3jrJ5O2G2bV0jcF0xUDG49DzcsfzMYGjO2rygyXqfALFptpaENzXA
	iGSL/TtJAhZuyG/e0dNtXTYEcNNKjhXX2ozifyBDoI7vU3knR/Lc0pQ5fh894XBw/OzKmfsy6tF
	2IU7EjHgPZSwb2TAVqkqv0tv/Z7oxL8d9XBc3ldVUryGBjTBYpBCE6AMZcEkwxoYYRV85i2QVHx
	x8UBlL2lsVTsmEjFT8m+gn9oulaP3BDQ61UPO4b0nzIJzywNq9XpYL53jZshXUqb983+3I6FSDv
	3bpw9x5vbBBmTxh303IqzQlwVyyJ0aIwg==
X-Received: by 2002:a05:6000:230b:b0:439:56ec:4f33 with SMTP id ffacd0b85a97d-4396f166779mr20582054f8f.13.1771944071091;
        Tue, 24 Feb 2026 06:41:11 -0800 (PST)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d3ff6dsm28711195f8f.25.2026.02.24.06.41.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:41:10 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 9/9] alsa-lib: patch CVE-2026-25068
Date: Tue, 24 Feb 2026 15:41:02 +0100
Message-ID: <c0f0667e742a59dce06cbe97baa6b4531fd13617.1771943829.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771943829.git.yoann.congal@smile.fr>
References: <cover.1771943829.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 14:41:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231861

From: Peter Marko <peter.marko@siemens.com>

Pick patch mentioned in NVD report.
It also includes CVE ID in commit message.

Use older SNDERR funtion as new one is not yet available.
This was copied from Debian patch.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../alsa/alsa-lib/CVE-2026-25068.patch        | 34 +++++++++++++++++++
 .../alsa/alsa-lib_1.2.14.bb                   |  1 +
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
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb
index 41a42f9ecc3..c13f9b786b2 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
                     "
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
+SRC_URI += "file://CVE-2026-25068.patch"
 SRC_URI[sha256sum] = "be9c88a0b3604367dd74167a2b754a35e142f670292ae47a2fdef27a2ee97a32"
 
 inherit autotools pkgconfig

