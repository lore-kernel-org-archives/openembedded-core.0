Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web11.8711.1604910711738690367
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2020 00:31:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NU45+48P;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id cq7so7576284edb.4
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2020 00:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PUgYzpFOpwNwfWQbY6Ary2dKDI4aqeBHmlbRkkxWYSU=;
        b=NU45+48PNtwmVPA/hWJ7JzDJQFdosZGUgshptcFBP3J9V+d6pqp07B0msanqJ9qnf/
         IkDDDRqSSwmWca0YpbeTrSHZ4wulrigPl7p5fjWlP91W06wVoJ5Tws3nY9TUWqLV/TOC
         RKt0hG8fhaDrgiBgt3CYZureP6y0zzvEZ8XT94QTw1gd4R2o+l3BY3bVKPAYYi3yYQhF
         LKXRbYcPeeCxQPnAdTzzgqHz9I9kB+Cat0+sx3ULhsrCblO2A3rBKe1iIiev6j+RITwP
         JYxVnrqz11uIKoZBLqC+KOm9Z878XYP/1qDTBlE9zPIbABx+6iueBHQ5kkAKlrUVr4w2
         mG0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PUgYzpFOpwNwfWQbY6Ary2dKDI4aqeBHmlbRkkxWYSU=;
        b=tcWg9JK+A28YR760Qlla0FbypVdSmiGjKCBlgXdbJfiVs788AXbEah5wGl4lQn4xr1
         hB45oLR+yagJBZBZGNUcZAu6CGHygyr4evk1OGt19SMU7GLOh/DlJE8j/ZZ1xBUqKI9H
         BMs7dR+npswpMbgHHL7Zh7Ob6zdUl+0fkFEqRFSbiNWHrQK1XF2pF/sr9A+tHrH9UbyJ
         87tofXYs8KdyNOp6j/QO54StD7RaTxMYQgufzyOSPrsKfhzI3QH8L5d/SXTRoEXP0jFJ
         mhUYsDk2zeXjqCiNW9oWOtd4Pzfb2PgrXlGhxEDEQKUH7fSeaY5fDW1bqpLd3hYXAM+m
         P2Sg==
X-Gm-Message-State: AOAM530O77a2LES5CmRkDHqQuOtE89RDFQ4XbLaZEUUC9ppSRkR0hlmy
	X5lpI4GE4eOvdPAQ8wlsyyvxw1ALprgGgA==
X-Google-Smtp-Source: ABdhPJzPmsJWUroIRHAhKfmQwTjuF34t9NHDoJkAYfBkM5oAn04rv1jZwy3gSYVPxAUp0mgYe3GuRw==
X-Received: by 2002:a50:d885:: with SMTP id p5mr5607649edj.169.1604910710059;
        Mon, 09 Nov 2020 00:31:50 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id sa23sm8187691ejb.80.2020.11.09.00.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 00:31:49 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [RFC PATCH 09/12] weston-init: fall back to fbdev under x32
Date: Mon,  9 Nov 2020 09:31:30 +0100
Message-Id: <20201109083133.16503-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201109083133.16503-1-alex.kanavin@gmail.com>
References: <20201109083133.16503-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Otherwise, there's a crash in swrast - the same issue as with
X11.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/wayland/weston-init.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-graphics/wayland/weston-init.bb b/meta/recipes-graphics/wayland/weston-init.bb
index 4b2a6ca983..0cc32985c1 100644
--- a/meta/recipes-graphics/wayland/weston-init.bb
+++ b/meta/recipes-graphics/wayland/weston-init.bb
@@ -24,6 +24,9 @@ DEFAULTBACKEND_qemuall ?= "fbdev"
 DEFAULTBACKEND_qemuarm64 = "drm"
 DEFAULTBACKEND_qemux86 = "drm"
 DEFAULTBACKEND_qemux86-64 = "drm"
+# gallium swrast was found to crash weston on startup in x32 qemu
+DEFAULTBACKEND_qemux86-64_x86-x32 = "fbdev"
+DEFAULTBACKEND_x86-x32 = "fbdev"
 
 do_install() {
         if [ "${VIRTUAL-RUNTIME_init_manager}" != "systemd" ]; then
-- 
2.29.1

