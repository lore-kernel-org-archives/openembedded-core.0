Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web11.10410.1592658651088487394
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jun 2020 06:10:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.128.68, mailfrom: valentin.longchamp@gmail.com)
Received: by mail-wm1-f68.google.com with SMTP id t194so11432895wmt.4
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jun 2020 06:10:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/nRAIFlEZeYd2a+cUh5rX2kdGAq0GcJxh1V8eGmY/cQ=;
        b=WoLJcFb/ZO/vx0Rdg85usF3uD/b1TjLypow+4eSR/M+dGJZt6e/MiTDYgxDOuKF11E
         orx3UuRXE4+9glhr0iMO8RubHX/6uOHs+XpAfIVFyXBETZxFKJemBGltcKoX4PcZ9OVR
         CAtZqX6AIuOg31ian1B5F4t8aatakQp2eB6IW6a++2TjkWppg8UL3PEr6i8fxhv8PvSU
         2RA0aVm6M8tvifc8qAyVoBevo/vMgrzc7SEaoF6fs7AY0zE7AFQWw5Z6r71GpaqFvDOc
         60qmM3uTLGx/SPEAiN77RyDuUrCFM/qYYmXObgvvKpLL6pqyPrWiXPFs0F4gtlu4a1+1
         lp/w==
X-Gm-Message-State: AOAM531vJOmk0HZUKWyKM+K95NRYlvff3cBHgHdwcgYMYlN+qEmkZ40Z
	FuaStmglEHD4fBBJcUUfrSryjcyu3hg=
X-Google-Smtp-Source: ABdhPJy46RpQCDbwlCyNxgR9JK/1WSQFtmWtFsTiiwaTdG7ZLBkf4p5JowdVVJL0rZYNWVhjbTXeQw==
X-Received: by 2002:a1c:4d11:: with SMTP id o17mr8423755wmh.37.1592658649200;
        Sat, 20 Jun 2020 06:10:49 -0700 (PDT)
Return-Path: <valentin.longchamp@gmail.com>
Received: from silentold.home ([2a02:21b0:9002:414a:f66d:4ff:fe13:bb3d])
        by smtp.gmail.com with ESMTPSA id h13sm6498362wrp.77.2020.06.20.06.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2020 06:10:48 -0700 (PDT)
From: valentin@longchamp.me
To: openembedded-core@lists.openembedded.org
Cc: Valentin Longchamp <valentin@longchamp.me>
Subject: [PATCH 1/2] tools-profile: disable valgrind for powerpc soft-float
Date: Sat, 20 Jun 2020 13:10:45 +0000
Message-Id: <20200620131046.31603-1-valentin@longchamp.me>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since valgrind does not build for powerpc soft-float, disable it from
the tools-profile packagegroup so that it can still be enabled for such
architectures (but without valgrind of course).

Signed-off-by: Valentin Longchamp <valentin@longchamp.me>
---
 .../packagegroups/packagegroup-core-tools-profile.bb             | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index ac180b542a..8aed1e8458 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -61,6 +61,7 @@ VALGRIND_armv6 = ""
 VALGRIND_armeb = ""
 VALGRIND_aarch64 = ""
 VALGRIND_riscv64 = ""
+VALGRIND_powerpc = "${@bb.utils.contains('TARGET_FPU', 'soft', '', 'valgrind', d)}"
 VALGRIND_linux-gnux32 = ""
 VALGRIND_linux-gnun32 = ""
 
-- 
2.25.1

