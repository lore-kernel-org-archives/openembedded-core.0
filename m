Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web11.175.1616600418117403641
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Mar 2021 08:40:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=VGZIJ/IQ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.169, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f169.google.com with SMTP id m7so17838865qtq.11
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Mar 2021 08:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LAtMyn3O0Sv2N+ZPWv2ObsAjUgJuWjZ8UlAD6+jz0zk=;
        b=VGZIJ/IQ4Gp7DEcQO22NsAsqja6LbOtJnTUriCQ254OSBIGQa9WIFW5Rf5q5GoTy0F
         vXaeVbJ/31sfYqtiywwwm8RgjkGzCa1zfcKdRDyc928fx6s1zmqnCU5Zy7xdx4Wl8N2B
         E0IwvcCcWkvQVDgBXEXDzs5ocdwbAWAj8v+AXqqt7ZoyOjeXE2ZdJLdwY73IBybZeoHP
         Sb9A77rOxIAwz9gRMngcITAPI4ynYbtutCcBlcduVmlE9yueRgg/AA+6k9nPhpKAYWEF
         3nVo0zoj9h00Njo4pIWZ0ap9n+mrGaS0aqLh0QHob+cebLGVHlICgZ/ru1n+e57WdRML
         Kc8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LAtMyn3O0Sv2N+ZPWv2ObsAjUgJuWjZ8UlAD6+jz0zk=;
        b=rKR1J4cBe2H9cKpmxkOy2dXq5sxwWAR7IdrKzU6BJVJOM1LjzWMWvN+2GcgZpEUh9l
         nR/6tWRXnns3nFkYet9tBpX+eJiv5noshQ1ERn73tKauUFDzJo52E5wj/KDliU9gDc40
         30AE30KqrMkJMuBQ98JqzUqEGbdV/aPX8NZ6pNkEPd3n1h9y2dN0l+VVSpfCjwh7pV+q
         59qgoUW5r3e2XS5n/N9csuNXgXX3SwoyhqxaBdYHQPlW5P+tcC3XcVvm3U87nRL9RMQm
         sMqtdMthbz6GVFKgO3/9J0kYYhpKFCHCGHS1rj3KMasQQi4nUwE50ltrdEYRLhDGHm9x
         djqw==
X-Gm-Message-State: AOAM532WAJSRX9AegJX60kS5vO9JBghVfF4Gy2kJMwIym6dl8rgCRdJg
	AXfWOkHr6nx1qjMDtmiklprhLiblc1MLIw==
X-Google-Smtp-Source: ABdhPJwFGsCy6P2c8DxRAIUCmMiWkm88hYUXpn1I7JY5iCCGtHMB7YhmpKFMNrISBILCLq9OTWGXtg==
X-Received: by 2002:ac8:1093:: with SMTP id a19mr3547720qtj.365.1616600417044;
        Wed, 24 Mar 2021 08:40:17 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([2605:a601:a601:f800:8daf:27b6:797e:9e83])
        by smtp.gmail.com with ESMTPSA id p66sm2003565qka.108.2021.03.24.08.40.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 08:40:16 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] tune-cortexa32: Add hard FPU
Date: Wed, 24 Mar 2021 11:40:16 -0400
Message-Id: <20210324154016.18180-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A32 always has NEON and VFP.  Set the FPU as hard to always have this
enabled and used.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 meta/conf/machine/include/tune-cortexa32.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/machine/include/tune-cortexa32.inc b/meta/conf/machine/include/tune-cortexa32.inc
index e86de6ccb7a4..b9ae2b1c57b9 100644
--- a/meta/conf/machine/include/tune-cortexa32.inc
+++ b/meta/conf/machine/include/tune-cortexa32.inc
@@ -9,9 +9,9 @@ require conf/machine/include/arm/arch-armv8a.inc
 AVAILTUNES += "cortexa32 cortexa32-crypto"
 ARMPKGARCH_tune-cortexa32             = "cortexa32"
 ARMPKGARCH_tune-cortexa32-crypto      = "cortexa32"
-TUNE_FEATURES_tune-cortexa32          = "armv8a cortexa32 crc"
+TUNE_FEATURES_tune-cortexa32          = "armv8a cortexa32 crc callconvention-hard neon"
 TUNE_FEATURES_tune-cortexa32-crypto   = "${TUNE_FEATURES_tune-cortexa32} crypto"
-PACKAGE_EXTRA_ARCHS_tune-cortexa32             = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa32"
-PACKAGE_EXTRA_ARCHS_tune-cortexa32-crypto      = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa32 cortexa32-crypto"
+PACKAGE_EXTRA_ARCHS_tune-cortexa32             = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa32 cortexa32hf-neon"
+PACKAGE_EXTRA_ARCHS_tune-cortexa32-crypto      = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa32 cortexa32hf-neon cortexa32hf-neon-crypto"
 BASE_LIB_tune-cortexa32               = "lib"
 BASE_LIB_tune-cortexa32-crypto        = "lib"
-- 
2.20.1

