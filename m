Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A97B7CDB47A
	for <webhook@archiver.kernel.org>; Sat, 20 Jun 2026 13:00:27 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6014.1781960426865806473
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jun 2026 06:00:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=CboE0yEv;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490ac357c55so30096915e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 06:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781960425; x=1782565225; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XDrVjcYXgCyp7xThME7E1c/7Xmf/78E/vBSZrz196TY=;
        b=CboE0yEvU9gyvj/GYEM8xw4XvoPv9HOgPMeTvZ/QRYiC8s0Fdfpkmd/KeDJzyi6pFv
         8y2ECudPOyytgiuryM3dyttrgHmwgcPwSVie/fksNYwkWDvdb92peIXNuCWn9I3P84xc
         VxHiBjYp/0rs0UatBpyIbsmBytpjxhQH7YT9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781960425; x=1782565225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XDrVjcYXgCyp7xThME7E1c/7Xmf/78E/vBSZrz196TY=;
        b=JkLRtpW1Z8EDeRz4D07Ho5HR6lnasckafals/q7XwljPNtnE6Du41Y6M6TuAR9H+Rt
         GekBwx9GG8SU+hEH1WPnPgOyZVBYm7xp1DDeXR8DsxESTjg9N45YnG8Y3rO6NeI3TiOn
         7UDi++ZX6Nb22i7qDGooD5+D46wtc2JXGsggrQR0PPxc5PAMOXPApyaMY7eMz9d8zWvs
         mbGy7k9pnqUGb5yh/ANiauUfptzBF0uS5F9VHOJQ5I9tG+LkRhk91WLV8f8wRPQo6cew
         Ybb8sVMuq7md+R/7kP1rv3W0JfmJOPSkkz8SWX+qdUcsiJngxoS9vBdD/+nd5oomb0k3
         AY8Q==
X-Gm-Message-State: AOJu0YyDkdtAIFcVXZf5dbELA3PerGw3rT5RNnxz3MWnvZTXzvdp5cpS
	9odB7o9ppUyn/4Ee61/aNOQQkZYNL59jTiwiHCAPagyC28xzjeb3hV7JF8DSULxDu6bnBshsyGY
	xbZDN
X-Gm-Gg: AfdE7cmntxF2gUF17QYprfQ4GLwS66BWXgJGn+OX/09w1NSE2VAooLX6SOrTaPwon0g
	X1hZhp7ITA9psXj6LRr1WH/kKSFtlPIt3/LopggAbewrgmK+JyJVdyAi2PBuQ1inRjRyFIpHcML
	oG+ONw7sVf3mjVzwtrgIXup3ZuE9Kp/dZwbWQlnosOatDrVYX6TH9jiVaEwEabZWTc84+aUEnrm
	SsiX82KCI7JQJW2BjV/BN018S4b7ceSrmlR26IxvA4nHdxFugArLsY6c/mIqGLe7ZP0LzjUwvPo
	xfkBx+BR31JeUxh1OWrQdxhJ/fTSPNC+Pe6LvtVl90Z2EFiewdKP5/2OH+2wYinF7yfm+UIzTBq
	a06X+O4fiNcX1AdoIcfD4QtgWnKX6yPtXJyo6qi1E+RRTgjXNNwJ+IgY2ejYHrE4/nmerHOCScF
	ljAWbdSgtkWvORrKypAWTi4kQr5vnIT8LQ0JehJuXETD0M5PZwfv5yD1YV0rNxt4l+v6YIt3XbB
	Zj9UyrXZIChbbcOcEE8FdH9F8Y=
X-Received: by 2002:a05:600c:2305:b0:492:2f59:4969 with SMTP id 5b1f17b1804b1-49240e5b469mr90500645e9.22.1781960425103;
        Sat, 20 Jun 2026 06:00:25 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4666722141csm7338573f8f.34.2026.06.20.06.00.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 06:00:24 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 24/36] gettext-minimal-native: Use SPDX License Identifier
Date: Sat, 20 Jun 2026 14:59:39 +0200
Message-ID: <8c9520e140258a8e5254f08527fc3a3555862758.1781960051.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781960051.git.yoann.congal@smile.fr>
References: <cover.1781960051.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2026 13:00:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239234

From: Joshua Watt <JPEWhacker@gmail.com>

Changes the license from FSF-Unlimited to FSFULLR, which is the SPDX
identifier for the same license.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a9ee9fe85638ed488a3b17d3c3d02c23021bea23)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-core/gettext/gettext-minimal-native_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/gettext/gettext-minimal-native_1.0.bb b/meta/recipes-core/gettext/gettext-minimal-native_1.0.bb
index 28392a26b55..c0cd701ab15 100644
--- a/meta/recipes-core/gettext/gettext-minimal-native_1.0.bb
+++ b/meta/recipes-core/gettext/gettext-minimal-native_1.0.bb
@@ -12,7 +12,7 @@ SRC_URI += " \
 INHIBIT_DEFAULT_DEPS = "1"
 INHIBIT_AUTOTOOLS_DEPS = "1"
 
-LICENSE = "FSF-Unlimited"
+LICENSE = "FSFULLR"
 LIC_FILES_CHKSUM = "file://${UNPACKDIR}/COPYING;md5=4bd090a20bfcd1a18f1f79837b5e3e91"
 
 inherit native

