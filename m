Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 198D5CD98F7
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 21:47:54 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4354.1763070469267919912
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Nov 2025 13:47:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=LLOGlZTP;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2953e415b27so12468485ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 13:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1763070468; x=1763675268; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NO4JiF+pIxfXB7xT6ErmJ0tMWLdXBKz5Z/U1bK0YJI8=;
        b=LLOGlZTPxiLCThL8QaPSRcfD7od7rBAGbj8Nsw9YjUkCq1eufAW5p9IQXeQMyWVM4C
         xOyB7LXcnm9kbWDnP4lAz05eSgZ7v8ceL/4kyeg3cDSuhsVEObMoLC0UIZYUKs9TSiGC
         EebaqF5aeXUztCWutyRVEgtOcSR/GNjN6iPc/uZpv3JWb3gQMtFy1nzZvBkJjG9qLSRT
         v8+U9pgoE2L+56Y/Ru1OdB3T0QDYt77b3DNHFcamkSLEl/+b9VI0YDlC2i8+JaV6DwAm
         y2Oo1U9YUIWSx8nxjkNzb3NIuZAwMa4W7asWQCPXNYXQ7HMd/zGkH0SPBMzNjBNfRDDr
         f1Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763070468; x=1763675268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NO4JiF+pIxfXB7xT6ErmJ0tMWLdXBKz5Z/U1bK0YJI8=;
        b=vOsiAretqumuXjadUIcmfKayP/yMKHkOzbkcXPmYhBaIOK/5VwvoqSKEkhb1zicils
         sT99IyhNWquc6L1/DbBErIPCjUILQAZXG7VbSOS7W5DUWG2FPrnjD+WNZyF7Y+45su0W
         kMfbaSSWp6EV6JdkQpZ3RBgnMp4WgQQDKhvQZ97zJGWBnoEZt6R8ZZxUHc8w5MjEZ3Si
         VeXO4121z9nO/rs3FrsrJ2fCZ7dDMSDgqhdQpjGw9u2KtsCoZK+xN0d4z3Hp6mUQSxV0
         7+ZlJNAhINREWnwIRduFDihdMqpIbsYckQuPNLEWUFZNsfNdqr7acLTSG3DYzxtgXRnY
         E/MA==
X-Gm-Message-State: AOJu0YxdtLASRKzVP82y/tsAMZ1VGS9qPPgnjpa2WOqV20Tc/P98pK5x
	bSe4EgGvs9PTm1OF7Aa+S79EGJdV2NrQdvOVX3l9YabKE5jXHMMFutJayOk+cpIpP2s++o4SfoM
	6iNy2
X-Gm-Gg: ASbGncvAqhCwvgeEpKcV0WQiUpjXqybqyApPL0L6ti5PzpWSoLe9yTnCtKkMC0u10PM
	bm33YmxegIow220ftgDeRlPQABOkNV0Mm7QIydSY8imxhk5YyOzpe5L02ZoTwmsRiw9Ap0KvGHi
	Svxr6CS3ltElnm1RPE+XrE+tiLNymxPMKz4G9NJXWQut3ZBun/rU7Dw3XORh6UAZ5n3rODsXJpF
	Is+0zunPHQ31AXIVXJUpxBuXhIlaXae8hpClgr248VtVW1XK5rdVE4RbyvIJ/dvyTVyBCWpjM+j
	kBVoBXXZDlrMOGXCZAd5zH6OtRzwqtFgxpY/ciPxpR9CZJAqN2DhG0FdZptz56DKiNCfajb3Ei/
	9BgkhPQE5YwqGoRvWE+qRmvPeE/WervCCyl4Ij7YnhPVYgC2XWc0jx+42Sg2AK6okOuUksR1ERf
	qT
X-Google-Smtp-Source: AGHT+IH0a498PjNUrIT4FeDPndsXyVUlqdnrURnahtjvayB8/s6oXJowBDKP3zW7Yoh3gU4lOw2wiA==
X-Received: by 2002:a17:903:7c7:b0:298:616a:bae9 with SMTP id d9443c01a7336-2986a73af36mr3721605ad.28.1763070468579;
        Thu, 13 Nov 2025 13:47:48 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:70b:f91f:acd9:f6d9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2b0d68sm34639815ad.61.2025.11.13.13.47.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 13:47:48 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/10] xf86-video-intel: correct SRC_URI as freedesktop anongit is down
Date: Thu, 13 Nov 2025 13:47:27 -0800
Message-ID: <e2c288a92f06af82559cf33db6c988b9dbc8b7ea.1763070333.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763070333.git.steve@sakoman.com>
References: <cover.1763070333.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Nov 2025 21:47:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226280

From: Alexander Kanavin <alex@linutronix.de>

(From OE-Core rev: 04037a14e1431c4a51f5d51885974732a6108368)

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9649bec517996558e01d668d2b59e68306a3a647)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
index 74ec57aa66..e747d2046f 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
@@ -13,8 +13,7 @@ SRCREV = "31486f40f8e8f8923ca0799aea84b58799754564"
 PV = "2.99.917+git${SRCPV}"
 S = "${WORKDIR}/git"
 
-SRC_URI = "git://anongit.freedesktop.org/xorg/driver/xf86-video-intel;branch=master \
-"
+SRC_URI = "git://gitlab.freedesktop.org/xorg/driver/xf86-video-intel.git;protocol=https;branch=master"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
 
-- 
2.43.0


