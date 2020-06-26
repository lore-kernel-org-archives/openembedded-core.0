Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web10.10460.1593186049951134797
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2020 08:40:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=ealS5eAl;
 spf=pass (domain: burtonini.com, ip: 209.85.128.66, mailfrom: ross@burtonini.com)
Received: by mail-wm1-f66.google.com with SMTP id u26so9141301wmn.1
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2020 08:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K9RmfUN1Yv3ZnBjhpgF1f956xr6FKiwSsJsp+1Y2Y1U=;
        b=ealS5eAleJI34X8WfypCOJGRYr8E6+lBu8hfBVGElhJnuv9uPFEagwh9UsegrFvuY3
         Ay1APOSeuZvZk4HAuFfB8hmZMTBzvv8wtbPn3K6708HlWZgIgsjR/QA6h7c1GNDjKLO2
         TCh4Cn/XVxRZwmeS6yTqynF6xFp0Jr2MihLt1Js86SV+HyhqIkv8g8mTEM8rg2kw5bqL
         /j6bIxZ6EPFgPyd5HKgmGjGZooK5dQ5OFvwom2eVm7xvHPRKg5Ffi4AeNe6YGPfSJMga
         VmCWdcNiuk4By1dL8cHYzbk2J1F896lBysNIOkYMKSgcSG3boI09sz2NEDrHK3nAzke0
         CZCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K9RmfUN1Yv3ZnBjhpgF1f956xr6FKiwSsJsp+1Y2Y1U=;
        b=iqtm/fqqojJ4G/Q6myN+77m2hXKgI9ndRWQRInFdrANt6IDvtx8wJKqjpHtWUFazc2
         wGqR+trqlWVZPVM/qRw5VbJwZaCh/5suq58kUroK4/mMfwiWkdZQ2grRdzOlKqUcF62O
         IJmukNEsLHpZsI6FDlZ9a3MyfpSi9PWUWdxBd6OnazpnPoto/TUra0/zLH1gtUD/b0gY
         GykZdKx04Zb9thRMvzCzGiBLZV/mGgredaoDnIa3QsuD6/nPILuKoETIBke6i7Wjdpp1
         TtMzBfWNGXzRX8pV5ilqTjxuIy1SKm8KBhfA/McNiz833Bu00yG5zP0YvtCaE1GFwz+b
         DSKg==
X-Gm-Message-State: AOAM5335SsC1lRoNuTjl4DfgL2D5TqP2a/CDikDGhSnwq5I9wLbXDILG
	A0zt7FHuvhb9F3YKilN80X0ZHi3pFew=
X-Google-Smtp-Source: ABdhPJyktLzxxOfJ4xD/OUwXiqqOKCKnHqWFESPA0t/od0qH0U6eeJHQZtMb2bY0CCqC32M/bF0Bbw==
X-Received: by 2002:a05:600c:2945:: with SMTP id n5mr4003024wmd.120.1593186048120;
        Fri, 26 Jun 2020 08:40:48 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from rossb-vm.manchester.arm.com ([213.86.15.71])
        by smtp.gmail.com with ESMTPSA id t205sm17903490wmt.8.2020.06.26.08.40.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2020 08:40:47 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] ovmf: build natively everywhere
Date: Fri, 26 Jun 2020 16:40:44 +0100
Message-Id: <20200626154044.1546774-1-ross@burtonini.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

The OVMF target binaries are (currently) x86-specific, but the native
tools to build them are not.

Make the COMPATIBLE_HOST assignment target-specific, so that the native
tools can be built on an arm64 build server.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index 91c1b6ba14..7292ebbb77 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -37,7 +37,7 @@ EDK_TOOLS_DIR="edk2_basetools"
 BUILD_OPTIMIZATION="-pipe"
 
 # OVMF supports IA only, although it could conceivably support ARM someday.
-COMPATIBLE_HOST='(i.86|x86_64).*'
+COMPATIBLE_HOST_class-target='(i.86|x86_64).*'
 
 # Additional build flags for OVMF with Secure Boot.
 # Fedora also uses "-D SMM_REQUIRE -D EXCLUDE_SHELL_FROM_FD".
-- 
2.26.2

