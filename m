Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
 by mx.groups.io with SMTP id smtpd.web10.3524.1594324178094723084
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2020 12:49:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kg/3uwtf;
 spf=pass (domain: gmail.com, ip: 209.85.215.195, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f195.google.com with SMTP id d4so1430217pgk.4
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2020 12:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JR9zCZLpOuMaWHqGlFBR308uKtCSc6QWrk0MBXNl8Xk=;
        b=kg/3uwtfc8+MPa/ATv+BWXXtbxwuFI8jS3YeQajDWSbXgBzuMiCu7X3a5aN2D743J6
         JLE+v19skUptQK7/poecVUcY7T0xgh450A/RE9Y4nB7ZCQEPFSITJzqXPSuSSh+A/D1e
         PFJB2s0a0unV4Ahh5Fhuw5W4DuSZAXnShdumNHXiMjW4y6lQmsDY9TrGZ+N0uUu+ScjK
         S67kKTeqNgAZdRfKvI1rJm5sx3iJ+znHu0eVyKy4uzJpN2sPYStjQ6L4WwJmM2VuT7gX
         48O854MVyCBrAA4SyQxP1aoqWwvcEpUKEwbOBAt+tAv6A6vQh7gGxK4gE7xutUmXPTae
         VGWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JR9zCZLpOuMaWHqGlFBR308uKtCSc6QWrk0MBXNl8Xk=;
        b=oScBBCfVIQaNH7zFC/p9pjA0qldO0SW1dOlrB7HqbQpT5eLNIV1CrOqzxCYavpqEFy
         NBn9magiI/c8dE8+z9rPcTAN3NpVH4EZgMdtjDRx8rhnWG0C1rJba52s9qv84psdjfYu
         tltLwBbLTOk859F3/VK/fH4FfCIR97CTeXL1qXUv09tkuibPfJZ6EDz1CpipODGtLGt6
         LLSFJwCLVfvCR9zzePgbqQOV3e5xVoh+gGWa47Co2VyL2g2+tF2RQa/u8co3Jli7thNz
         HWPEzXosei/oa4KouoKnY0UfMlzJVS1UXRqM8CN/XUQvtF0EL8CmU4kD9nY3QHVOf4uy
         ux/Q==
X-Gm-Message-State: AOAM533W3GCPfj8q0QLiIGxJLOKoMHR2udvMm7zorRbZvxMjT2wg32eA
	OjVkLUG/oWPd8VyxDjwt02Hx7/QFQLM=
X-Google-Smtp-Source: ABdhPJz8V6kvvzQLAQe95Zox8JJSw60WaaEsYQHp/tDv3wk84/UVckq3SiKzHdgBeREKC02I2M4/tg==
X-Received: by 2002:a05:6a00:d:: with SMTP id h13mr54048783pfk.288.1594324177318;
        Thu, 09 Jul 2020 12:49:37 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::c85a])
        by smtp.gmail.com with ESMTPSA id b18sm3446703pju.10.2020.07.09.12.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 12:49:36 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] go-runtime: Disbale CGO for riscv64
Date: Thu,  9 Jul 2020 12:49:34 -0700
Message-Id: <20200709194934.2179514-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cgo is still not available in go for riscv64, we will re-evaluate it
once we upgrade to 1.15

Fixes
| /usr/src/debug/go-runtime/1.14.4-r0/go/src/runtime/cgo/gcc_util.c:23: undefined reference to `_cgo_sys_thread_start'

[YOCTO #13966]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/go/go-runtime_1.14.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/go/go-runtime_1.14.bb b/meta/recipes-devtools/go/go-runtime_1.14.bb
index 43b68b4e46..4eeee65e0c 100644
--- a/meta/recipes-devtools/go/go-runtime_1.14.bb
+++ b/meta/recipes-devtools/go/go-runtime_1.14.bb
@@ -1,2 +1,3 @@
+export CGO_ENABLED_riscv64 = ""
 require go-${PV}.inc
 require go-runtime.inc
-- 
2.27.0

