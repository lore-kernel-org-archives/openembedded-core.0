Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.3834.1619041254768878858
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Apr 2021 14:40:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=p+tjOF81;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id w6so15603290pfc.8
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Apr 2021 14:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bPv3P3CUpXomjb+OkwAS9Ox87u+eLN7k5cYl0ZXSaOI=;
        b=p+tjOF81Dkd4J4Uk19yIwrVa6yoemtVuVpKtoRzVoiMZEvoiHWb4Fl5px3cqlrfGtY
         /EEF1C8bhDB4aLRXDne81hcq7E3Lkw90GEZvoY9+z9sSG/D77a836hspxEHsgnVxvdnP
         33pigz48pIY7rRiR4IeN888t9DoyE5qwxIUzmRflp52SvcGKUakTgK5/3lPT0WTwzDcz
         1/m8G1rGZtFy4QP4mOhEKvKpOmtDdlODFkUJftlLei7/BSgNBr2dxWs+MNqv7ssfsIdu
         l1ZHuNTNKoYKIyltV+0XR2MeoQoANBwTBMIEYK75zxX2x+cYY6XYBXoaVC7UPdL88Hud
         LEzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bPv3P3CUpXomjb+OkwAS9Ox87u+eLN7k5cYl0ZXSaOI=;
        b=omIobTHBvVimxoiAUukiPlq05J+du7gRUOr1T+goCL5bBdERaq3tzVOf4BG2twFuH0
         +KGU37G3PRC48B2Q3FKcuuraIqT7z0AyKp4z4vCJyv8QjfD19QxSm2+9HpbcRnhI/n3z
         kYs/K0xCUHqhk9rPbWSRtgpo+ZToQc6oHMr/tmR+ns3E7nUlHIllZ+X77mYgP/OBZNXr
         53+UQs0gJlLA1yjmm85WeDLHScQ2iZGGeFGGAnmT11Fc3Q5eu172zvqrVC3q/5OE1Tc1
         FCtZmw+R7OPXCdeBtKt39cxuxpMCKssSOadXoKTZS9lJily788sM31N8J86gqALGPiv+
         5qZw==
X-Gm-Message-State: AOAM530D7gdQF/IR48mnmQ2LNYFBhZIaYz40ClAGPMmhHgsvRpUciWfC
	kvWXTeeGW5rr4KB48nMqKBPTQSrqWX8KkA==
X-Google-Smtp-Source: ABdhPJxMZ5lM1lNL3HYAJkuWvIah6frnMfpvRnzQfd3C4FxthUt0MsJRcP+gruj1ZjsEybBxV68nAA==
X-Received: by 2002:a65:4d49:: with SMTP id j9mr194580pgt.113.1619041253842;
        Wed, 21 Apr 2021 14:40:53 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bc1b])
        by smtp.gmail.com with ESMTPSA id a129sm230189pfa.36.2021.04.21.14.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 14:40:53 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] weston: Drop loading xwayland.so module
Date: Wed, 21 Apr 2021 14:40:51 -0700
Message-Id: <20210421214051.3374048-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This module is no longer installed by x11 instead it uses a stand along
server for xwayland, as a result when xwayland is enabled in
packageconfig in weston then it fails to load xwayland.so during runtime

Fixes

[21:07:12.-100663296] Old Xwayland module loading detected: Please use --xwayland command line option or set xwayland=true in the [core] section in weston.ini
[21:07:12.-100663296] Loading module '/usr/lib/libweston-9/xwayland.so'
[21:07:12.-100663296] Failed to load module: /usr/lib/libweston-9/xwayland.so: cannot open shared object file: No such file or directory
[21:07:12.-100663296] Destroying fbdev output.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/wayland/weston/xwayland.weston-start | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston/xwayland.weston-start b/meta/recipes-graphics/wayland/weston/xwayland.weston-start
index b483c97cf1..db384b1a53 100644
--- a/meta/recipes-graphics/wayland/weston/xwayland.weston-start
+++ b/meta/recipes-graphics/wayland/weston/xwayland.weston-start
@@ -2,6 +2,4 @@
 
 if type Xwayland  >/dev/null 2>/dev/null; then
 	mkdir -p /tmp/.X11-unix
-
-	add_weston_argument "--modules=xwayland.so"
 fi
-- 
2.31.1

