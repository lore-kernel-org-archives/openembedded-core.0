Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC57BCD98DA
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 11:59:36 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.127803.1781524767479597574
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2026 04:59:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OhIUz6AY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-491b390f9e9so25827845e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 04:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781524766; x=1782129566; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fHH1CVtEoIe9dWbCkuqMcZBrjAsa/vSyocdD/pa/+wI=;
        b=OhIUz6AY9mvw2EPrrwSGk90Lxywlvl2d8Q4RVEQ0545O7MSQ2g1gRYFSS7PEKMjahr
         ZZ2jXxORL4tUukU5zqEYiwCuNFOSbYWkRo3DBDOgIVY8LW2nlNr4XZRWEwwSIS4ppV9U
         WMo68305Sxpev4d4bT6DVbBWAuyMKyCV597m8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781524766; x=1782129566;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fHH1CVtEoIe9dWbCkuqMcZBrjAsa/vSyocdD/pa/+wI=;
        b=b1s9FxS8isF01t//ohaq5ais4uNPoXhtiI9kUP/fFqdOzxR2vFFG8/2ij25Nl34FmZ
         cK8snDK6/s5OpOqnhrzN1LVbeYHSL9nu4yeuS7zwy3G54E1dklTJPAp9Rb9uAkZFsJNc
         e65Z+9tEnorvemuFSBe5o6J4fK2bu2XjzkkERZF+DUpq6OsvA0eOK24p6C5HpQP09USj
         akTkoS261W5tCdPgJ4C0bS5nYqv0IQixtZIUgSEVvw87NNv6Atpu593rzzY+FQ4uHJqv
         U99du+lam+QLi/XRk1Dd6rY7Tw2gzfPSGqWk5V9Jzk7UyFHmHoAvJL+dlnkE4pQ6zPkt
         IH9w==
X-Gm-Message-State: AOJu0YwV060VmXFq66wUfoh2CgPu/Ftf5sxef/fMqTO2XIW6wqKHkP5x
	RENpGiMQ/JwJaH2IW4RL2LfDwnGvy31sveAQYxA5nGSjulpMbltK67Aw/x72oF03FNW1D5mtxBn
	uqp+2
X-Gm-Gg: Acq92OG+WgRUkRpLXYS8W+FUCf2fUkNYR8hHdb/efFxy7KqEqVz9Vr9I2T7hrNwqBhl
	p4h+NxWmFnEmBu+7SFyaoVdBUMl+4QN53dnj5FcO3GmbL2c+Bmhh2GBWIuCtgvjo7U8pMBU1/Oe
	1L2w+A4Bykk1DZzwvP9Swyt5ff3PMey1CDy6UC3f41/bMD5urkW4qZwhQVb/JBOMbxafv95+A8j
	jBJ40/5h05bBpXbiPrrJDxmX8KD6Hi3teg12a/N5yl1fP/f6JKmIAo4nnWzQ0CVjJUXW38GanIZ
	iS208gtJyZ8EVORLaekcCgCLAgGPNh8QPB3B20j121jJ2tnEW8N7TuFCeMREGYsL+ZGxR8IVh7v
	CJRxp51e+6aqN7bGenopW+Rtetg6lt4IXE2hUmvFbjjce7G9eLXEMtjcfsQYnhiAdVfgYqrCWsn
	pYK3P5QkaQDWKVg8XxHv1wS4zEhKiCFd2JQDZC3Lh9btQzYH5iH+NO
X-Received: by 2002:a05:600c:a47:b0:490:52c0:744c with SMTP id 5b1f17b1804b1-490ec4ee63cmr175475955e9.20.1781524765702;
        Mon, 15 Jun 2026 04:59:25 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:e2da:88d9:f720:efe2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edec6sm273306935e9.3.2026.06.15.04.59.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 04:59:25 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] alsa-lib: upgrade 1.2.15.3 -> 1.2.16.1
Date: Mon, 15 Jun 2026 12:59:21 +0100
Message-ID: <20260615115921.706829-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260615115921.706829-1-richard.purdie@linuxfoundation.org>
References: <20260615115921.706829-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 11:59:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238841

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../alsa/alsa-lib/CVE-2026-25068.patch        | 34 -------------------
 ...a-lib_1.2.15.3.bb => alsa-lib_1.2.16.1.bb} |  3 +-
 2 files changed, 1 insertion(+), 36 deletions(-)
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-25068.patch
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.2.15.3.bb => alsa-lib_1.2.16.1.bb} (91%)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-25068.patch b/meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-25068.patch
deleted file mode 100644
index 9bb24c24e28..00000000000
--- a/meta/recipes-multimedia/alsa/alsa-lib/CVE-2026-25068.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 5f7fe33002d2d98d84f72e381ec2cccc0d5d3d40 Mon Sep 17 00:00:00 2001
-From: Jaroslav Kysela <perex@perex.cz>
-Date: Thu, 29 Jan 2026 16:51:09 +0100
-Subject: [PATCH] topology: decoder - add boundary check for channel mixer
- count
-
-Malicious binary topology file may cause heap corruption.
-
-CVE: CVE-2026-25068
-
-Signed-off-by: Jaroslav Kysela <perex@perex.cz>
-
-Upstream-Status: Backport [https://github.com/alsa-project/alsa-lib/commit/5f7fe33002d2d98d84f72e381ec2cccc0d5d3d40]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
----
- src/topology/ctl.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/src/topology/ctl.c b/src/topology/ctl.c
-index a0c24518..322c461c 100644
---- a/src/topology/ctl.c
-+++ b/src/topology/ctl.c
-@@ -1250,6 +1250,11 @@ int tplg_decode_control_mixer1(snd_tplg_t *tplg,
- 	if (mc->num_channels > 0) {
- 		map = tplg_calloc(heap, sizeof(*map));
- 		map->num_channels = mc->num_channels;
-+		if (map->num_channels > SND_TPLG_MAX_CHAN ||
-+		    map->num_channels > SND_SOC_TPLG_MAX_CHAN) {
-+			snd_error(TOPOLOGY, "mixer: unexpected channel count %d", map->num_channels);
-+			return -EINVAL;
-+		}
- 		for (i = 0; i < map->num_channels; i++) {
- 			map->channel[i].reg = mc->channel[i].reg;
- 			map->channel[i].shift = mc->channel[i].shift;
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb
similarity index 91%
rename from meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb
rename to meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb
index 1ebb3569256..0c81e3cb3b9 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.3.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.16.1.bb
@@ -10,8 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
                     "
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-SRC_URI += "file://CVE-2026-25068.patch"
-SRC_URI[sha256sum] = "7b079d614d582cade7ab8db2364e65271d0877a37df8757ac4ac0c8970be861e"
+SRC_URI[sha256sum] = "f740db7f488255944ffd4428416ee3390a96742856916433df468c281436480e"
 
 inherit autotools pkgconfig
 

