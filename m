Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.10577.1604787844761636311
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Nov 2020 14:24:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PS6JcYkc;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id t22so2658004plr.9
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Nov 2020 14:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jRNDubiE3KR1VLpL+/8kuvxc9Zu/uRJ04dmP6EPDReI=;
        b=PS6JcYkcjxFQRDoWFMb1T/f9XgQt319R84fxBDK/FmGjLf0lRS/qc3QQxiwAjOX5ba
         RB8pUZi72WjH/wX0N/mcXPC6beub6tro5mAQ1Wb6n1Q/EWCUbEZCOL3g1cCGLywZ1720
         4O/17tJpU//q+xkr4kBzvgmx/3dZAy1kI467cCD9CU00xoBBYIOWH7Bjike1WbjI8tnj
         aNu+1oqsXdIXQsNNR9/agfk0JDJUhV1uM7Hpp+k1UIhDKYHbaD5IMCLJOVkm72j2EVGc
         M0jnlGQB9Zi3YyVcID3pXdlNEJyhElMRnNJFAUT8loOV1edGFegFKwNOEGYLW65UqOMR
         XNqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jRNDubiE3KR1VLpL+/8kuvxc9Zu/uRJ04dmP6EPDReI=;
        b=bWmaLmHEvRNPhgKQtc1dCJvdQV1avdcFHFHyMgIlc/wmE+17g2rmr+DgUr8jQUuUxj
         u6dBa2FC3HIGLuf3wfKYBEGui0IIdXvlHJLm49vQPUhAKdL0Ey4q+9d+GYveGh1/eJhM
         C9aCwH2PJ3VQ3C72fvjiETmG8U0OnCAubkPS5QbBt9YjhRU/hKulbL1D+KutrEr6A8W0
         0DNkRJlyyHXfGhyO3lJDesbkg+OEMlEejCa2QSEbIwQZ/9+b7M+ZVcTYcqSxPKVdVqqP
         NByptSEyumQtDq8ECmYJsb7e1+3TCetAtbhVLN0Pu9V2U1gvND9xbQWsK5ZHx/aMRx5d
         Dbjw==
X-Gm-Message-State: AOAM532BDKS4+0VDoQmZ/s0yCNoqxlOduqVHhEOO+qOHVz9Ezt5Flf8x
	Ytddq1on5JavJGw0tUFGprQ1sXmvpiv0yQ==
X-Google-Smtp-Source: ABdhPJy2jt6Hoj2n+v6aqbwcHRGFQgZvYZZtvm8ToWVLsP41RgEZpia8ySDK0fZp5Wl6v45Y8bZkSg==
X-Received: by 2002:a17:902:ba90:b029:d5:cbb1:1733 with SMTP id k16-20020a170902ba90b02900d5cbb11733mr7039745pls.6.1604787844021;
        Sat, 07 Nov 2020 14:24:04 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id s18sm6900725pfc.5.2020.11.07.14.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2020 14:24:03 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v4 4/4] lto: Introduce LTOEXTRA variable
Date: Sat,  7 Nov 2020 14:23:57 -0800
Message-Id: <20201107222357.43102-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201107222357.43102-1-raj.khem@gmail.com>
References: <20201107222357.43102-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Certain packages may need additional flags to enable LTO, therefore
LTOEXTRA can be used to pass those flags

Add -flto-partition=none for alsa-libs

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/lto.inc | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/meta/conf/distro/include/lto.inc b/meta/conf/distro/include/lto.inc
index d7fea26c64..39d99b157d 100644
--- a/meta/conf/distro/include/lto.inc
+++ b/meta/conf/distro/include/lto.inc
@@ -18,6 +18,13 @@ LTO_pn-libcap = ""
 LTO_pn-libproxy = ""
 LTO_pn-libbsd = ""
 
+# Custom LTO flags
+# disable partitioning/streaming algorithm since its uses ASM
+# constructs not compatible with lto
+LTOEXTRA_pn-alsa-libs = "-flto-partition=none"
+
+LTOEXTRA ?= ""
+
 # Override it for additional or different options if needed e.g.
 # with clang thin-lto might be better for compile speed
 #
@@ -29,9 +36,9 @@ LTO_pn-libbsd = ""
 # -fuse-linker-plugin
 # ensures that libraries participate in LTO by supplying intermediate
 # code from .a files to linker
-LTO ?= "-flto -ffat-lto-objects -fuse-linker-plugin "
+LTO ?= "-flto -ffat-lto-objects -fuse-linker-plugin ${LTOEXTRA}"
 
 SELECTED_OPTIMIZATION_append = "${@bb.utils.contains('DISTRO_FEATURES', 'lto', ' ${LTO}', '', d)}"
 TARGET_LDFLAGS_append_class-target = "${@bb.utils.contains('DISTRO_FEATURES', 'lto', ' ${LTO}', '', d)}"
 
-SELECTED_OPTIMIZATION[vardeps] += "LTO"
+SELECTED_OPTIMIZATION[vardeps] += "LTO LTOEXTRA"
-- 
2.29.2

