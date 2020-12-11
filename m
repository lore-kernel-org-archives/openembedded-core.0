Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.13351.1607718422230301051
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Dec 2020 12:27:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RWCGhCOD;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id b5so1435902pjk.2
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Dec 2020 12:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pOyuRSTJ6PhVLdNSwCPcjnPOA0gMzRFbm+ta9rh7KHs=;
        b=RWCGhCODJmCzk1n8qV8H1x2zfGrSldPi5tN8rF3Ke0Vy+qIyE+E6fh03INXk83igr/
         zPiFmmS8KbUN4o27zrbsM/dS4gryI6IvVeebVjXBUzpJvzpYtT/EPmRhgzKrk4vqiTn0
         opXCvVgnJcVJ30rH2xate/ApUpjUZa0JbMepiMIMnage4AfER5inrzZVMtpctwKRk2cp
         RCoEM5H7VA9flVDSiaHn2WaAvaxjmOAuSDoSqOVqUPBEO02bWDxtFUSDdX34jZpIAuHB
         kvkQUfwbz8Dt9PD7CDZJ2o1HAuOl2Rky4lateaGJnFRsNtNaZ+rqh939m7a62nUnew9G
         XZ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pOyuRSTJ6PhVLdNSwCPcjnPOA0gMzRFbm+ta9rh7KHs=;
        b=DqaAStfQYKGiEbuVeFrIFMZnUH7FOH76FMGQq6I391pLd4hD2S39g2MyBAGwavgc4w
         sLUWfNpjQLGKSx9MmEb7aGiPP7Zdvs80es2W/yadWsuA8O6CQ637l5bZkC5X5IxGieH5
         IthHPgpUfJKw7SHe8IXlYI792vPBqfIF5JHpqVGpMM2NPRRPk3hieUAsmWeyqG1SA1N7
         7dI6GNKlcFJehtoEr/GKwE2Chg25MvihqCsTXeiXAeywgsGN6/zFCRAjm+VQELWAs/7d
         qhOdrG1vmgPPxisj1q0krSJHAhNqy2z5tOOM0pevK20EgH8IXGhxi+KHehP/GfO13t/e
         gJYw==
X-Gm-Message-State: AOAM532XkpZSPysSek1bmIfD6XH4xJURua5uTI/jKwzR1iwP5W28DZz6
	21I5h+VgUVW1mBmtwHS1IFiLj1JlYSN/eA==
X-Google-Smtp-Source: ABdhPJx4Q2P0b2RPytHCVHMgElbBNknoyaQBuySmVn+XZ3NuNWhusqaS1a2vX8XRSgm0AOIosH1DTw==
X-Received: by 2002:a17:90a:a108:: with SMTP id s8mr14495200pjp.206.1607718419942;
        Fri, 11 Dec 2020 12:26:59 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::5bf5])
        by smtp.gmail.com with ESMTPSA id b11sm10986794pjl.41.2020.12.11.12.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 12:26:59 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] qemuriscv: check serial consoles w.r.t. /proc/consoles
Date: Fri, 11 Dec 2020 12:26:56 -0800
Message-Id: <20201211202657.1237295-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qemuriscv enables hvc0 along with ttyS0, however its not enabled in
/proc/consoles, getty tries to enable it in inittab and erroring out

Fixes below message with sysvinit

INIT: Id "hvc0" respawning too fast: disabled for 5 minutes

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/machine/include/riscv/qemuriscv.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/machine/include/riscv/qemuriscv.inc b/meta/conf/machine/include/riscv/qemuriscv.inc
index 0e88c91aa6..47d7e9b174 100644
--- a/meta/conf/machine/include/riscv/qemuriscv.inc
+++ b/meta/conf/machine/include/riscv/qemuriscv.inc
@@ -10,6 +10,7 @@ KERNEL_IMAGETYPES += "uImage"
 KEEPUIMAGE = "no"
 
 SERIAL_CONSOLES ?= "115200;ttyS0 115200;hvc0"
+SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
 IMAGE_FSTYPES += "ext4 wic.qcow2"
 
-- 
2.29.2

