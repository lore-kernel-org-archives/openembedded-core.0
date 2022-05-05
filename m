Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3943BC433F5
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 05:06:03 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web08.7297.1651727154549771697
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:05:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ChR4Wrej;
 spf=pass (domain: gmail.com, ip: 209.85.218.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id n10so6556895ejk.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JmygqhfZ8qPsKMl4+o9aa6LI29Kt2DA5em++sNMNarI=;
        b=ChR4WrejFaMpSR0VzlGTIqbIBs3ZCDAePWnsKSEiqeSHEs8xQ3ptegQqdP9avMUQyE
         uwYArV/vNN5O2qukq3/IEBmWMZWWjBli+ea/bKx6CYOwnNy5xOwDAE882PnMXmO2Zs2S
         0l77ymwhFqCYOo6cWRGQIIz1hISgCxpPSauEvlFTY61DT1b3mGzyT1lQvYJGa49mCKDC
         7XmBj0IzUdlEZeGzpGBpjXFSXjRgqYMjYf0Tqf6wfg0xXXedqsFWo84XB3VEZPRXYcFz
         FMl0XRH2FXVnAn5FIBAkTAGw7yXyfkM1jBJ/VZMguM8NKRVwxOM8dcpg+7XdX8IGd5r3
         FtHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JmygqhfZ8qPsKMl4+o9aa6LI29Kt2DA5em++sNMNarI=;
        b=yVpb/Vp55fQyHy0TW2Pwwh2u1LIadDHfmyf6RvtLGOJ+yYsp/9NKKfFUjA0w2bFpep
         q6/stfmAHR9kVv7pJm/6X+w9j1qaXxbbMCszVxOWRsqUJT1XOzAR3r9xEtwvKu2KkNuc
         pFY39k91NR+M+JlpaWhqzrZio4NYe5fpqOQDPSCYPYlEVKAnAMR7Tzb/VwGLPboOlDlU
         IlPF8Qf195rZ6ycBoXkx7Z1rzYmv5hk5O+mQzy4OIDvnAgcrrlKQ6EqONXnXXw7CCUWa
         UQMKVktwJBaHas+4HF6w6P/nld7V44vvxuJv8NFag7tpPbMQ4m1Wkm8r2bv7GrHJwLDk
         xVEA==
X-Gm-Message-State: AOAM5338k4STii1fx11jehuQoh9+DT80vQKE7LJ7ix3Annb29lLBLgC8
	6dMc84rFAP56xIEzvBGNnZzGuijJrSk=
X-Google-Smtp-Source: 
 ABdhPJzpObTMe3TPDOziTHOqoM4Q5GybgkyHG4mBtxKGimZs+4gvxFlY6eL5ZA90PcgoBqZVcOA8Rw==
X-Received: by 2002:a17:907:1c21:b0:6f4:7a8a:d6a2 with SMTP id
 nc33-20020a1709071c2100b006f47a8ad6a2mr13357598ejc.288.1651727152982;
        Wed, 04 May 2022 22:05:52 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gg19-20020a170906899300b006f3ef214dfbsm313386ejc.97.2022.05.04.22.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 22:05:52 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 08/61] mesa: upgrade 22.0.0 -> 22.0.2
Date: Thu,  5 May 2022 07:04:51 +0200
Message-Id: <20220505050544.651895-8-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220505050544.651895-1-alex@linutronix.de>
References: <20220505050544.651895-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 05:06:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165237

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../mesa/{mesa-gl_22.0.0.bb => mesa-gl_22.0.2.bb}               | 0
 meta/recipes-graphics/mesa/mesa.inc                             | 2 +-
 meta/recipes-graphics/mesa/{mesa_22.0.0.bb => mesa_22.0.2.bb}   | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_22.0.0.bb => mesa-gl_22.0.2.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_22.0.0.bb => mesa_22.0.2.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_22.0.0.bb b/meta/recipes-graphics/mesa/mesa-gl_22.0.2.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_22.0.0.bb
rename to meta/recipes-graphics/mesa/mesa-gl_22.0.2.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 21fa1a6a9e..d3571467b9 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -22,7 +22,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-util-format-Check-for-NEON-before-using-it.patch \
            "
 
-SRC_URI[sha256sum] = "e6c41928b5b9917485bd67cec22d15e62cad7a358bf4c711a647979987601250"
+SRC_URI[sha256sum] = "df4fa560dcce6680133067cd15b0505fc424ca703244ce9ab247c74d2fab6885"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_22.0.0.bb b/meta/recipes-graphics/mesa/mesa_22.0.2.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_22.0.0.bb
rename to meta/recipes-graphics/mesa/mesa_22.0.2.bb
-- 
2.30.2


