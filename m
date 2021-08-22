Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web08.9626.1629636709904561296
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Aug 2021 05:51:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AeWPLr3p;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id k8so21788458wrn.3
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Aug 2021 05:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1xQt5O6UwVgZ6Cq9fMb89TBchPRs67oiOV08/d92hv4=;
        b=AeWPLr3pP8AC6oSynFwTA+nAJN4U+739wpu9Sv9gpXecMzefaFrCvHXojTqGZQatI5
         9jpdbvbOeRJCpoXIakgOu55pOnni2aBEaR0vngfzKvn7aAdqNR8ELp/9vH9eJ14Rxu7Y
         RzROcEhzQZ9qvPhVVrSa1rni8mjsvKh87xkM0a2E4cadocsomH64dIxrL/99JPni5awU
         F8PqwcP5wn8ymV+WjTMAh/3dmo34VCF6l7B4Fjxq2rf+7wO1//kvJx/IjshKBPpCTY0V
         U4b99E1kcvB3xPAzdewXregAhqJd+GS/usTHwAdTlalP5pF8aloleFT0okNKnH3+H2VG
         9fFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1xQt5O6UwVgZ6Cq9fMb89TBchPRs67oiOV08/d92hv4=;
        b=iYcoFIrGCg0r6PJQBH0nIZBevUUzbxN//mB0sMKjIeAny7d6dywxZ0iNukqWbYcnEg
         am95wREuVmVphH1pP5SW8stUUw21njaCRfA6kUglE0UQFAtErytZukkfpZwZCDuI27vZ
         fWy+DOtIsxDzWbsDzhNGeaH7lFLcca+0a/eQxzGj9vTTLXw9lI5C/xtI83YHEam6uTp9
         zrAtNI+K1xjsUj1jnFCdfXGJZBw+RkNMTCeBWQPfHzCIfuhrv0VFL4fPlPiHIkVGrJ/O
         mtzO1C81c2LaUs+UUmc2SGxU2IP1cZeI25HJ+B/hjluzuVMHIcMlgHUpTqXLdGWua5Dm
         Bjzw==
X-Gm-Message-State: AOAM533i+6BZ0ONEPeUyvoP7QlPSdU03PBYHGYt3o1f/Qkq6xpBec6QG
	wPkwgiM8tDy21gb+vOQfi8fO81w6pwEPAg==
X-Google-Smtp-Source: ABdhPJwdoSE5N4iJsCOdy5LMF9qieq6xorXLgdgcMNKwGYyedEEjiNBR9T/SpQzDpWOaJTZMjJ+iwQ==
X-Received: by 2002:adf:dc0b:: with SMTP id t11mr8413053wri.259.1629636708581;
        Sun, 22 Aug 2021 05:51:48 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id c8sm11915882wrx.53.2021.08.22.05.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Aug 2021 05:51:48 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 55/55] kea: backport a patch to fix build errors exposed by latest update batch
Date: Sun, 22 Aug 2021 14:51:03 +0200
Message-Id: <20210822125103.310416-55-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210822125103.310416-1-alex.kanavin@gmail.com>
References: <20210822125103.310416-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-add-missing-headers-in-timer_mgr.cc.patch | 29 +++++++++++++++++++
 meta/recipes-connectivity/kea/kea_1.8.2.bb    |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta/recipes-connectivity/kea/files/0001-add-missing-headers-in-timer_mgr.cc.patch

diff --git a/meta/recipes-connectivity/kea/files/0001-add-missing-headers-in-timer_mgr.cc.patch b/meta/recipes-connectivity/kea/files/0001-add-missing-headers-in-timer_mgr.cc.patch
new file mode 100644
index 0000000000..1cd8bc70f5
--- /dev/null
+++ b/meta/recipes-connectivity/kea/files/0001-add-missing-headers-in-timer_mgr.cc.patch
@@ -0,0 +1,29 @@
+From 11981d637273778f408d15f488cc9e1d244dcae8 Mon Sep 17 00:00:00 2001
+From: Andrei Pavel <andrei@isc.org>
+Date: Thu, 29 Jul 2021 21:33:42 +0300
+Subject: [PATCH] add missing headers in timer_mgr.cc
+
+Upstream-Status: Backport [https://github.com/isc-projects/kea/commit/2bba96164f6c5c8f56de7a5dc52af73bfd51cccd]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ src/lib/dhcpsrv/timer_mgr.cc | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/src/lib/dhcpsrv/timer_mgr.cc b/src/lib/dhcpsrv/timer_mgr.cc
+index 5ec4123..5611c46 100644
+--- a/src/lib/dhcpsrv/timer_mgr.cc
++++ b/src/lib/dhcpsrv/timer_mgr.cc
+@@ -14,6 +14,13 @@
+ #include <functional>
+ #include <utility>
+ 
++#include <exception>
++#include <map>
++#include <mutex>
++#include <ostream>
++#include <string>
++#include <stddef.h>
++
+ using namespace isc;
+ using namespace isc::asiolink;
+ 
diff --git a/meta/recipes-connectivity/kea/kea_1.8.2.bb b/meta/recipes-connectivity/kea/kea_1.8.2.bb
index f1bbbc49e7..04424d0d70 100644
--- a/meta/recipes-connectivity/kea/kea_1.8.2.bb
+++ b/meta/recipes-connectivity/kea/kea_1.8.2.bb
@@ -20,6 +20,7 @@ SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
            file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch \
            file://0001-ax_cpp11.m4-Include-memory-header.patch \
            file://0001-include-limits.h.patch \
+           file://0001-add-missing-headers-in-timer_mgr.cc.patch \
            "
 SRC_URI[sha256sum] = "486ca7abedb9d6fdf8e4344ad8688d1171f2ef0f5506d118988aadeae80a1d39"
 
-- 
2.31.1

