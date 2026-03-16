Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA633F4642B
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 09:30:08 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46600.1773653404858004976
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 02:30:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=DRrqfs3W;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48541edecf9so47154805e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 02:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1773653403; x=1774258203; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yXe27FB84aZ9Kiga/7Pt5A5u0jddt07q6bvuqLBq8jU=;
        b=DRrqfs3W1kR8FHLY7dh566DmXHdly8HHCzkZ+dGFnTmxKgaofKa8aB+d85sCFWPVGO
         jQU6KLCAOLC1If5/MfsKCbqBMJqctmCRTkr2S5d7Nyh70/HASowkAlHb8lHZ/g49ASj2
         mra14tzNvVI2kRbYyvlxBZN7IO4SjgBuAeXtU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773653403; x=1774258203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yXe27FB84aZ9Kiga/7Pt5A5u0jddt07q6bvuqLBq8jU=;
        b=Yp0HqBUN2NJUSpNU8Dy6FsbAhTGpOh2TixsqNh+P8IcW0dCYIfA2TknDlWCMJDSgTz
         IMiInxmai+XnfD4EQukFIMoUqDD8xsOjClRy8+w93BWeCTawiBOqClc/TrZlhMmLrZVI
         H+m+s4eWEtcUQWTW9Db6vm8PmkM8KPjf2edgX+QReHobRT2vgI9K7Tk6OL2KkBkWeEsU
         GXWsxjtpTCvoNNKDNBB//dwZ153kQ+D155TX+kb7vSOj4eOTW1+pDMcsxxGVOjbvrsHs
         BotLDZmrRdT2IEZbbmHEEUt0DM+v3XHq/5JpbQZGPHL4lp2lRVU99Rb4Xk/hKnAJKQ3Z
         8G3w==
X-Gm-Message-State: AOJu0Yz6v71OvGKp/j3gNAXDEGEv/FFbhHm247KP2re08yemGNe0PQqE
	/UJXK32j1/CTx1WycoU5p4ezQCVd2DHNnLsikaBqR9y929neZkVDuzVh3pOTPVXO5ce8Ib2LQwe
	y8liJ
X-Gm-Gg: ATEYQzxch+6sVviWkKPQETe8e94iAYNNDTMbResLQlZfeVExdMtPAdq7q/Uc6oT/+kT
	dV2AMbnda7nfPpdGv5x93PleYf2KxvvuWruKeQhaSbl7N0MhxlmML3bobQ4nUMria/G3khbJw4T
	MfkQtNN5f5FaB7s1QRfFKzhqSBtneSIfoWktprmX5ben0uKAiZY/5mpB00baU93q6tClxm2woaf
	Nz/4TQ3V3U5ykdn4qP14M1f/kbU+Jb9xpydEEXCuW5D2BJuI0mC1FDckmevRd/vjgjJayIGcMrv
	z2MTdi2p5bCypzf0sCNpQlpJwYQZ7WoWt/7Sc6Nj129QwE7u/ml1abbnB3pm/45lhMzdMvtnTSd
	V8hU/++hsJOCXbs7MXjrBTrKcix8ZqioJIGKIMMCCLrZBTgySQ258cC1oazAgbDt/abdQSIErXk
	XiT7cb2FPZE5EKz6u75ojMD7T3Qfm2eAYehB33d+Dybedh+OAY7rvltpgEKJcd4qicYDqci/FhV
	v6BM7GVjVI1vMfv4e4dGDpqCPfTkf5XUA==
X-Received: by 2002:a05:600c:8489:b0:482:eec4:76d with SMTP id 5b1f17b1804b1-485566f7a2amr213182625e9.17.1773653402914;
        Mon, 16 Mar 2026 02:30:02 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557a732cesm91138265e9.12.2026.03.16.02.30.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 02:30:02 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 02/17] alsa-lib: patch CVE-2026-25068
Date: Mon, 16 Mar 2026 10:28:21 +0100
Message-ID: <70145115785c63596ea997e0cf6577c43c4bedef.1773652940.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773652940.git.yoann.congal@smile.fr>
References: <cover.1773652940.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 09:30:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233224

From: Peter Marko <peter.marko@siemens.com>

Pick patch mentioned in NVD report.
It also includes CVE ID in commit message.

Use older SNDERR funtion as new one is not yet available.
This was copied from Debian patch.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../alsa/alsa-lib/CVE-2026-25068.patch        | 34 +++++++++++++++++++
 .../alsa/alsa-lib_1.2.6.1.bb                  |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-25068.patch

diff --git a/meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-25068.patch b/meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-25068.patch
new file mode 100644
index 00000000000..edc22fd62bc
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
+@@ -1246,6 +1246,11 @@ int tplg_decode_control_mixer1(snd_tplg_t *tplg,
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
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb
index ca6bedae976..8c91863ad1f 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
                     "
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
+SRC_URI += "file://CVE-2026-25068.patch"
 SRC_URI[sha256sum] = "ad582993d52cdb5fb159a0beab60a6ac57eab0cc1bdf85dc4db6d6197f02333f"
 
 inherit autotools pkgconfig

