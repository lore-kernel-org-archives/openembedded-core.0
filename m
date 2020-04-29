Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.1881.1588192113091079943
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2020 13:28:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TeYUKCTQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: bartlomiej.burdukiewicz@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id u6so4066493ljl.6
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2020 13:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CiDMUmWnzJZwB16wwoDoGJMz1he7g4888Y4JoaN3O7E=;
        b=TeYUKCTQR0UpCk9r4AZOIhwQS+FCwAzrHIyYYrArpJ0XgY79a5jbb9xgz7hsjED+57
         /alWv9eV7M5xsEW3CYz/mU78nkPNdjuIz7p3rXYRIlK5fSR82GNmLSAnWhWKkbK++BgI
         eyEHwrWeeBK2Oo2B89ZRCvpdKKZ/2qQW5KuVQzv1EsU8sTnmFf7Amwl5/ifLcvsGiRPL
         Lis7jQ8uspgzPDifUSl5E5Dw0zzZdvgJGg/pAoUqMsDtVdSD7huXGR8kOnPCtI2Gkrwq
         bYYGW4oghJoznFrTCn7UBdsPt1XPeR1xlCgEUhBn7eNdbpN3UelicgbEW/Mf2UhrZETQ
         e1Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CiDMUmWnzJZwB16wwoDoGJMz1he7g4888Y4JoaN3O7E=;
        b=h2whkKgZ5LvtUw2AimeG0mXa25zNy0pxygE8yMpN8ktcacsitgaxjruUX4kV4a5m6A
         3im/CutWRtdu9pkL3XGiNXiAjB8Ighc0IPMph8lLbXxYqbavpBo0aCYRe/zagQilO0bW
         MX3PNjzogJF9ukZbUt4m7XPqh4+gCbB0IfwGC4fpJMT5Oqzp0Ej0YJDRas8Y7SS21Txy
         UDgk9E3tKU2WZoAZFsfb05mQi6FG/NiXo/+qVm4y5BlGyHcSisAtWkc02R8UHusEzV5I
         u06PqihxnfITP27OQzbuhuji4FeEL6zOm6zpq8XxZhckT1PJJ1b8kdp7N7TQk/Kr0rNL
         2OGA==
X-Gm-Message-State: AGi0PuYyOCmO7QrEuktG3WfAs+pVEkuGgPd6yr0C5BqgdfRN6XpSS8mi
	NMtXWHhCU/NDr0Xxj60WdlMQMqhBbydFgw==
X-Google-Smtp-Source: APiQypIwaC2D4cCNA+B7usGEdAnp229sGPwjj2jD3N6Zvhpg1YH6LED3kWSHMT2FjfbmYVwZt9qmMQ==
X-Received: by 2002:a2e:8087:: with SMTP id i7mr20363491ljg.99.1588192110920;
        Wed, 29 Apr 2020 13:28:30 -0700 (PDT)
Return-Path: <bartlomiej.burdukiewicz@gmail.com>
Received: from localhost.localdomain (dynamic-78-8-50-212.ssp.dialog.net.pl. [78.8.50.212])
        by smtp.gmail.com with ESMTPSA id a6sm2941933ljk.22.2020.04.29.13.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 13:28:30 -0700 (PDT)
From: =?UTF-8?B?QmFydMWCb21pZWogQnVyZHVraWV3aWN6?= <bartlomiej.burdukiewicz@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Bart=C5=82omiej=20Burdukiewicz?= <bartlomiej.burdukiewicz@gmail.com>
Subject: [OE-core][PATCH 2/2] libva: removed opengl from REQUIRED_DISTRO_FEATURES.
Date: Wed, 29 Apr 2020 22:27:45 +0200
Message-Id: <20200429202745.3891440-2-bartlomiej.burdukiewicz@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200429202745.3891440-1-bartlomiej.burdukiewicz@gmail.com>
References: <20200429202745.3891440-1-bartlomiej.burdukiewicz@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since libva can be built without virtual/mesa, opengl
requirement is only true for glx backend and it's
incorrect for wayland and x11 backends.

Signed-off-by: Bartłomiej Burdukiewicz <bartlomiej.burdukiewicz@gmail.com>
---
 meta/recipes-graphics/libva/libva_2.6.1.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-graphics/libva/libva_2.6.1.bb b/meta/recipes-graphics/libva/libva_2.6.1.bb
index 8c495bad70..071be345d2 100644
--- a/meta/recipes-graphics/libva/libva_2.6.1.bb
+++ b/meta/recipes-graphics/libva/libva_2.6.1.bb
@@ -27,8 +27,6 @@ DEPENDS = "libdrm"
 
 inherit meson pkgconfig features_check
 
-REQUIRED_DISTRO_FEATURES = "opengl"
-
 PACKAGECONFIG ??= " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'glx', '', d)} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'x11 wayland', d)} \
-- 
2.26.2

