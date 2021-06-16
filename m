Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web12.862.1623801935050751033
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jun 2021 17:05:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LIpD+jBO;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id g6-20020a17090adac6b029015d1a9a6f1aso2650252pjx.1
        for <openembedded-core@lists.openembedded.org>; Tue, 15 Jun 2021 17:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kBJZndtlmgh4ZkD4YDvs0MSsqxe+GQAY4SlyeGmOndU=;
        b=LIpD+jBOQPMPd1vSGldRmWg5YSaG5jbJ3axZNWU5BnjNPOPYZkWF0QUJh4TsUr5X5F
         oehtm3SmNHARkcGbyp8Iz2Ma8LzP4Mmwf6/GavhOtDHswAWzFjTHTGzw44SH8GZZQGNe
         GQN7SqpZf465EpY+0seBh3/bXOqIdtI2wR88TPNYn22eZtLc8ZZ9Cv2vZnHh00HfxwAm
         fVDn/Hzrfe3XxE+1Rdrhhs8Lk6FsHvDqzfsd1lPjeh0yUgG8HTGmp5FIrxDbPX7mqXNZ
         FuEW86He8QZootpBcVyd3Hm4EvD2/a1bxHWiTMT9OFaqwgmFeaOehLw0mGq+lMQY05L9
         Jn5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kBJZndtlmgh4ZkD4YDvs0MSsqxe+GQAY4SlyeGmOndU=;
        b=Euzd48Y/s2lWrAVGr6QPZ0OaHO4XefR2rclNo7pTILB4FlVWYHMvUa1RnmsX9vvDaI
         j63OE289SryxtJObznkg2lXiBO7+1qLEV2vwhPAEZ/1Jjeo0rM/BMtLVJtVNnF93LTev
         3UpkADnNMr2zHdD2OBdmJGSCfZK5disS0CjuG8SqPfXgZTohdOfPXrnhhQpL4tp5r0Lv
         xaxFyDItUMF0Wexv8Psj7dv7YanN01Hx5IUL6bRVTwm06J06bWOfTeBK0kstxKcNFvfE
         gHBaH6iznJz0IQhrnNTeewCPIBojb0HJYILj7EEmzN16nSdTdS+HumrEAR2sBp0W3V6O
         RpsA==
X-Gm-Message-State: AOAM5333pCw3PUxXV8n1cmLMO/jHzsH0nuUB1fPFzkHF7cEV1OLVcviU
	rxZabnbZ1mF9VYuFBtLRMm6m01zbRPxU0Q==
X-Google-Smtp-Source: ABdhPJzPzBBEKnpkug+0vQmdlP4wfH01Ld8RU1znhRWyL28QG9/C4/LZxPryhxBj2bZi3ymx+de6wg==
X-Received: by 2002:a17:90b:318:: with SMTP id ay24mr1907502pjb.175.1623801934168;
        Tue, 15 Jun 2021 17:05:34 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a054])
        by smtp.gmail.com with ESMTPSA id x3sm241818pgx.8.2021.06.15.17.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 17:05:33 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] linuxloader: Be aware of riscv32 ldso
Date: Tue, 15 Jun 2021 17:05:30 -0700
Message-Id: <20210616000530.3680003-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/linuxloader.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/linuxloader.bbclass b/meta/classes/linuxloader.bbclass
index 3ded1fc786..4447c8847c 100644
--- a/meta/classes/linuxloader.bbclass
+++ b/meta/classes/linuxloader.bbclass
@@ -54,6 +54,8 @@ def get_glibc_loader(d):
         dynamic_loader = "${base_libdir}/ld-linux-aarch64${ARMPKGSFX_ENDIAN_64}.so.1"
     elif targetarch.startswith("riscv64"):
         dynamic_loader = "${base_libdir}/ld-linux-riscv64-lp64${@['d', ''][d.getVar('TARGET_FPU') == 'soft']}.so.1"
+    elif targetarch.startswith("riscv32"):
+        dynamic_loader = "${base_libdir}/ld-linux-riscv32-ilp32${@['d', ''][d.getVar('TARGET_FPU') == 'soft']}.so.1"
     return dynamic_loader
 
 def get_linuxloader(d):
-- 
2.32.0

