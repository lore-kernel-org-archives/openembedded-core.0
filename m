Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
 by mx.groups.io with SMTP id smtpd.web09.9593.1603774742457599319
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2020 21:59:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Z7NsC8AK;
 spf=pass (domain: gmail.com, ip: 209.85.216.66, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f66.google.com with SMTP id lt2so146330pjb.2
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2020 21:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8mvUJ9uhuhLLpaPb/krc/e0Fyz7CEnrw4jrvL6al7nQ=;
        b=Z7NsC8AKMcf06GJ7kH6TbikSfpQ8z3mdTp6Y59SL62GGOtVQfkUoiUNNhJAzRe0CSW
         vhZ351ARcz/7KC0xnG+yGVQTlByiCmkpPD1Kdm/es640GEnMpe9iZAynLYUmWGUO0dkE
         enuLk6c6+Ho6EIGSGMxt+kPhjxwhM83h4HWJxVtYI0z+XvzojuYL0Igz+xnkPsV7ezYx
         LMpBt/diVNARSaDWWe2DRwLGCkeWT9t9TOET1HS3XO9Y2JYLol9ZXkGh60mF6E2g7s8Y
         1rvCTiz1L/3Jqq8wcwr7H7jazXWy5pJxWPPA5o6RsLXrvZGdbWH2n80GeT68ZOeZxr+l
         O1ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8mvUJ9uhuhLLpaPb/krc/e0Fyz7CEnrw4jrvL6al7nQ=;
        b=epslJID5PwwTj65B7bFCWOrvKpUdrVQ+RnWVmWdMC9hcNDda7RIZAeKwclqAuW7nmK
         7wAGhVim8lCrDDZDMNaz4LBuf5KBlRNdOV0l8euq+J/8KNu5aW01nDYdT1euBkeyb8CV
         B1V0ZLfn91WvXQtx/SVDmRPEQ25Eoi4gSnWUphWjimVRTsbo/O69Xv/bcSEVSHzsjZWw
         pNyca2XViM4tKRJAtpxrTACplFx120Yxzfr/135jsJHwBRo0kjp0sbwVdMYMe6r8zSFc
         jHQJw0MTI/0Yo4dazJj6z3RsVTBK+h5/Huj8H0mvUlKcKdwJBgagjyrnrV/V3jBerv+W
         TxMg==
X-Gm-Message-State: AOAM533Q7jsJqhHAMVf5mULzF7krCzZsNMANBhmEJOkhjP/JlnYPQf6a
	ORkxkr8p/pJj7DTHBzdD4PcSm3wsDX/w5Q==
X-Google-Smtp-Source: ABdhPJyC17BUlREiHklFH7wwD5Qk76rltS4GhGYozXOmMc/OKfVUBI2iLV3FSbqEIXxHXDw4hHqXaQ==
X-Received: by 2002:a17:90a:7e4:: with SMTP id m91mr403076pjm.47.1603774741639;
        Mon, 26 Oct 2020 21:59:01 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::bc1e])
        by smtp.gmail.com with ESMTPSA id nh4sm406452pjb.1.2020.10.26.21.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 21:59:01 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] webkitgtk: Disable gold linker and JIT on riscv
Date: Mon, 26 Oct 2020 21:58:58 -0700
Message-Id: <20201027045858.665102-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

both unsupported _yet_ on RISCV

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.28.4.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.28.4.bb b/meta/recipes-sato/webkit/webkitgtk_2.28.4.bb
index 8ebb3709a8..34b14f86ea 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.28.4.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.28.4.bb
@@ -94,6 +94,10 @@ EXTRA_OECMAKE_append_armv4 = " -DENABLE_JIT=OFF "
 EXTRA_OECMAKE_append_mipsarch = " -DUSE_LD_GOLD=OFF "
 EXTRA_OECMAKE_append_powerpc = " -DUSE_LD_GOLD=OFF "
 
+# JIT and gold linker does not work on RISCV
+EXTRA_OECMAKE_append_riscv32 = " -DUSE_LD_GOLD=OFF -DENABLE_JIT=OFF"
+EXTRA_OECMAKE_append_riscv64 = " -DUSE_LD_GOLD=OFF -DENABLE_JIT=OFF"
+
 # JIT not supported on MIPS either
 EXTRA_OECMAKE_append_mipsarch = " -DENABLE_JIT=OFF -DENABLE_C_LOOP=ON "
 
-- 
2.29.1

