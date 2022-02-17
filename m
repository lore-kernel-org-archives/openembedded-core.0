Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D71EBC4332F
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 16:09:51 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.1760.1645114190324863755
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 08:09:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oJ49INw6;
 spf=pass (domain: gmail.com, ip: 209.85.218.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id p14so8376590ejf.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 08:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XIVEgKPwkoF8rtqXsd4VAq8kuVVLcqGe6exQD822C88=;
        b=oJ49INw6j6hSRixoU7FJgvNT0t6x4UY7wy5/UDm3Wuk2p7wRhAMRtqU80NR5UolPBF
         XpBaRwQGOt4bl+5PPnK1q26qm/esQwNKeUfILMGzhPm0WYX78bK7xpguh++cIQJwSmT/
         KRFAASTq3vbWPvL3hAm1bUb/+i/96VqrBPlsTxgm8vJwfxzdifDU7qD0U+VLMhjIgmeb
         636LhWZq9ojHRRSnq/fNpfi0zYe9JgVXamflEEZStJn85ndckJ4bQ5/nUoZIyLdg6y2Q
         sMATnwey/iZfRzK9ONiDqQLBCo84oKAh8m/DQX2fdWttgCJ/Z/vBxRQCR7nKJ5Bt5MPM
         TDOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XIVEgKPwkoF8rtqXsd4VAq8kuVVLcqGe6exQD822C88=;
        b=G14v78Y8rhngMotcyqAan6/LIv2Qrh1fhA16MibTj77Mra4VO0wGmCFMvszOL3UrZV
         zloYh3JYudbOv6Xe7OPSIYH8JdsWgZJld4q5d0KPy5LMn4oeLcmTvXozYdHqctITDFBa
         zonmFXPRY7RaU4M0PhrLx1iB06kCbfrHr1GtsQK3nATbk69rtaFizsOC/xCXcNsrkVfy
         5x8Iv6mdG9dUsBZ27kHEpB3Vd8rST0Ydd6dNb3s+kA3hWkxrLFMaXhIu3vvDl8B08MLk
         IUbrICTNiZ7bWf9oUn+YRb/g01Dt5JbHpJa5P1hm+JBUL6pXWBLD4l5b7D8jNeJPUNAb
         h79g==
X-Gm-Message-State: AOAM531BT8VQYJ0ZpjkjJIYPGM8txqQAPe+Ps7PAEjmKLLgSh1Slvpim
	45m0DKmvad2INV39b5MXZLpJfHdVrSw=
X-Google-Smtp-Source: 
 ABdhPJyjrudffnzFUQTyfTDocDMS7W1wBXGtmlDffjNw+LBp5Xz68cMDw87jNoE9Iujsm8SF5gIbwQ==
X-Received: by 2002:a17:907:72c3:b0:6ce:5256:1125 with SMTP id
 du3-20020a17090772c300b006ce52561125mr2845433ejc.697.1645114188762;
        Thu, 17 Feb 2022 08:09:48 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 n2sm1381297ejl.55.2022.02.17.08.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 08:09:48 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/28] weston-init: replace deprecated/disabled fbdev with drm
 backend
Date: Thu, 17 Feb 2022 17:09:13 +0100
Message-Id: <20220217160939.1424397-2-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220217160939.1424397-1-alex@linutronix.de>
References: <20220217160939.1424397-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Feb 2022 16:09:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161819

drm will default to opengl rendering by default; if this is
problematic, --use-pixman option may help, apply only where
it's proven necessary.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-graphics/wayland/weston-init.bb | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index e02da0c358..8e8c0454be 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -19,13 +19,7 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[no-idle-timeout] = ",,"
 
 DEFAULTBACKEND ??= ""
-DEFAULTBACKEND:qemuall ?= "fbdev"
-DEFAULTBACKEND:qemuarm64 = "drm"
-DEFAULTBACKEND:qemux86 = "drm"
-DEFAULTBACKEND:qemux86-64 = "drm"
-# gallium swrast was found to crash weston on startup in x32 qemu
-DEFAULTBACKEND:qemux86-64:x86-x32 = "fbdev"
-DEFAULTBACKEND:x86-x32 = "fbdev"
+DEFAULTBACKEND:qemuall ?= "drm"
 
 do_install() {
         if [ "${VIRTUAL-RUNTIME_init_manager}" != "systemd" ]; then
-- 
2.20.1


