Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.101.1620745081845000114
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 May 2021 07:58:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DsK8NvZa;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id c22so2110174ejd.12
        for <openembedded-core@lists.openembedded.org>; Tue, 11 May 2021 07:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m8ie/LVtc9Y3ZRKqqScCdshCPihFrhz0bVJQ2YrbVOc=;
        b=DsK8NvZaSPf0pD+ZU0FK/p6o5UBTerzyXlbst9U5NZQVPIDiCtu7QL4DHACCagA9Rr
         oqkmp8ClPLHrm8jzQFdn1i9QURozzCyQ6BgBAZKK71UZsZBM6moKWybB1PjYyHMX3xJ4
         aoYa/IGHyCewjsb4xvGeaDa3e/N5xjOSqz2wocMWwF05XihGOUyc2+6Lv5jAJMo/nkIm
         69nD+wY26tCcfoGHWYPVlRNpCEGyWS5Zp/xCZoJJ3BYxCsXMFxqRzz5xyL/QkHonHeyn
         /ZhFCNh5dGDILN3Dz9aONwgIe6/sOg5ZE5w024LeAxZGCFongGhQcISHMvbsnrm3rPyN
         S5XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m8ie/LVtc9Y3ZRKqqScCdshCPihFrhz0bVJQ2YrbVOc=;
        b=dIxtZh64/Rxzod2VJrIAmF4Tr2w0jYDTOYPewvcHyEBVXE8SkEF1X2cBos8ATt/WMx
         yTM1ig1Xw6t1PE5gDaJDHXmR8NOdNJgBGzU6SSGgINjQTTTvk2CEa5rrQto3F8fYq90/
         mYv69fRLAUfDE9/hdjVfOgPZDtJvKUozVBmc7jSvn6E30RVuIbdUU4ZjTpZL9EdFswrq
         j2c8/Zx/NqqQ59VfFHAW3K6U9JFRtU4Lx2RERbLnb/ebTZKpA6JY/vZIZTw1MmN2so6i
         oShGsLqjBvxRI64Wx8iTADlcwMcuhLMCQnq0/OJvCZQyF0T2DqTf5K77nKfzpF6ZHJbU
         jsow==
X-Gm-Message-State: AOAM533XSKU+VG4dDLifdLH4e22xZ/8yHDGil2wy5YIfysnCTPzLzzuO
	1Yhb0eH6+vmHxGYMGEEcMIWm/0QBu4k=
X-Google-Smtp-Source: ABdhPJzuFa1sohX7b5FPPiYUZLPNXYLbUvyYKm81ERE9f1g9+23QCbk6qgacfQpgF/r7uAM5rBEPxA==
X-Received: by 2002:a17:907:93a:: with SMTP id au26mr3459542ejc.271.1620745080280;
        Tue, 11 May 2021 07:58:00 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id x18sm12259157eju.45.2021.05.11.07.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 07:57:59 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH] avahi: disable gtk bits
Date: Tue, 11 May 2021 16:57:43 +0200
Message-Id: <20210511145743.979922-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This should greatly reduce dependency chains on the autobuilder;
the only affected recipe is remmina, where avahi support will be
disabled by default.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-connectivity/avahi/avahi_0.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/avahi/avahi_0.8.bb b/meta/recipes-connectivity/avahi/avahi_0.8.bb
index c8a3f876aa..f1efe2ddfd 100644
--- a/meta/recipes-connectivity/avahi/avahi_0.8.bb
+++ b/meta/recipes-connectivity/avahi/avahi_0.8.bb
@@ -33,7 +33,7 @@ SRC_URI[sha256sum] = "060309d7a333d38d951bc27598c677af1796934dbd98e1024e7ad8de79
 DEPENDS = "expat libcap libdaemon glib-2.0 intltool-native"
 
 # For gtk related PACKAGECONFIGs: gtk, gtk3
-AVAHI_GTK ?= "gtk3"
+AVAHI_GTK ?= ""
 
 PACKAGECONFIG ??= "dbus ${@bb.utils.contains_any('DISTRO_FEATURES','x11 wayland','${AVAHI_GTK}','',d)}"
 PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus"
-- 
2.31.1

