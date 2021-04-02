Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web08.22387.1617396408803289302
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Apr 2021 13:46:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mZf2dDoW;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id hq27so8830448ejc.9
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Apr 2021 13:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WSBT79PlsX7Al5APm4iMtsTyXAiwuXxLmCQXN701EHc=;
        b=mZf2dDoW2CriRkw7ncf+BA8eWxljTXFnaA2h2b77mk48DPqNfEeSMPARN5tgtzGSbQ
         JMxsRNbHQbNlzGoybfOxLN+zJPorZo2qSY3T4XDdyMdypLOuwohSMiH8RXMGRW2E7iAn
         DmXQyCljPjjaNyTcJxP1k2CLVFYTXdsUEsbmSix0I/rTQWQd09vbhTe5p/icQWZH8UuK
         B/AgH5u9dyUNaa0PzVzfxGkOdACTqflHCH/yUlpICeroqPU14KEItlUuqvMJKIHy11Mc
         tKLky4Y/LN+rEwZ+ewmj3Ao678Qx2BIcB4ZZ+jys4IPym/Xv1GoW9ynyAomO9Z52+1oL
         BF6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WSBT79PlsX7Al5APm4iMtsTyXAiwuXxLmCQXN701EHc=;
        b=QPJrjBS21YeOHLw4GKExHT7ORvbOLIQdX1eVCpjtsi9iiTj7g8Ur13DZ3y+n7AzB7a
         OBTYSfsP/xiiGLeeb2u3foiydjmjoGwFhqF09ErqwObvUfvGH+bTW1fEV1TFW9Cb2g9i
         /B4cTr/vYxFiiaXKGqOXKdsg3ZuFkoZOjhJh0wuCxijCtT6VLnapzP3EWEpEm7Qsig4v
         IuYL+ZknoiKskTYbp1NYC2/3bKhtmEMrEIDzuQohAd3zqXeq1P/U8tCiqWt4+DHC65dc
         4QaVawVtHTs0q8faa0Hs4v/fgHKFhFdRlli3atCuuHNh8i5daw+E7o7pA5vpN2kOtnFE
         fHaA==
X-Gm-Message-State: AOAM533HwBCe07GqIkIqPLSrCv8B+kJ4S7NZExapLWPN0s//DSKkVxPu
	bJmFwpl9mBIzqEw86Uw3cfCpBVUfjEg=
X-Google-Smtp-Source: ABdhPJwadu6FQ62lI7MewPSgLdPNpxzOdcZ/HUCRdVO2sH1NOiQUpkDU0piBU+4C1VS/7PwbuCMhiA==
X-Received: by 2002:a17:907:c16:: with SMTP id ga22mr15840995ejc.120.1617396407414;
        Fri, 02 Apr 2021 13:46:47 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id a22sm5845623edu.14.2021.04.02.13.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 13:46:47 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 6/6] mesa: enable dri in native/nativesdk through gallium drivers
Date: Fri,  2 Apr 2021 22:46:27 +0200
Message-Id: <20210402204627.207068-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210402204627.207068-1-alex.kanavin@gmail.com>
References: <20210402204627.207068-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Previously, dri was enabled via a token dri driver (swrast, then
nouveau). Upstream is discussing removing dri drivers altogether
(they're becoming difficult to support and only needed for obsolete
x86 hardware), so let's prepare for that happening in the future:

https://lists.freedesktop.org/archives/mesa-dev/2021-March/224984.html

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc       | 4 ++--
 meta/recipes-graphics/mesa/mesa_21.0.1.bb | 2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index d7f34739de..caf3c62ad8 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -87,8 +87,8 @@ PACKAGECONFIG_class-target ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland v
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 vulkan', 'dri3', '', d)} \
                    elf-tls \
 		   "
-PACKAGECONFIG_class-native ?= "gbm dri egl opengl elf-tls x11"
-PACKAGECONFIG_class-nativesdk ?= "gbm dri egl opengl elf-tls x11"
+PACKAGECONFIG_class-native ?= "gbm gallium egl opengl elf-tls x11"
+PACKAGECONFIG_class-nativesdk ?= "gbm gallium egl opengl elf-tls x11"
 
 PACKAGECONFIG_remove_libc-musl = "elf-tls"
 
diff --git a/meta/recipes-graphics/mesa/mesa_21.0.1.bb b/meta/recipes-graphics/mesa/mesa_21.0.1.bb
index d578c75e39..8c584d8e9f 100644
--- a/meta/recipes-graphics/mesa/mesa_21.0.1.bb
+++ b/meta/recipes-graphics/mesa/mesa_21.0.1.bb
@@ -1,6 +1,4 @@
 require ${BPN}.inc
 
-DRIDRIVERS_class-native = "nouveau"
-DRIDRIVERS_class-nativesdk = "nouveau"
 DRIDRIVERS_append_x86_class-target = ",r100,r200,nouveau,i965,i915"
 DRIDRIVERS_append_x86-64_class-target = ",r100,r200,nouveau,i965,i915"
-- 
2.29.2

