Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.12196.1631883566845567603
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Sep 2021 05:59:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SSeUoaNG;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id u19-20020a7bc053000000b002f8d045b2caso6843538wmc.1
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Sep 2021 05:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=orgJgdtg4oR6NSAQVaaKa4BHMQfK6x81PHYKgb+uh08=;
        b=SSeUoaNGNEMDbLBQD9ndT+QqvEmJTGFNKzI7M5yy05NMs+NAHuQLzuhz8kungifXbs
         GZ8jlFKPy6RwhpFMG0chqmw37ps8WIlCJmu/cZvdPSZyfEY1YnCLfpo9W4kRdQn8llWk
         Nerelr1eE7Pf3YULuBT4YTHDHwKi2B9cJ8l/mnBKtmlwrEopPCOleifgu0DURo80cCAF
         fIq9L7JvqyLRS+gNgr+J2e2McIDweMjTo7mThDAq54iRGLA3e4sM0xYXrSsSzejByaz1
         8U7dDlL53Gg1CNs+LbdTPsWbiy4ptohLKeQI/niJBaKZc5Y9YgOsb2yNQ1mVJXXFjjIz
         4whQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=orgJgdtg4oR6NSAQVaaKa4BHMQfK6x81PHYKgb+uh08=;
        b=5Vx10F/Z6CRhjt+bMOOM7x5Rtl8wiQoiopgzRS0ofTu9uX6KDSNqMisGCBaCBktXlW
         fHtZLwPxZnFXgwW6Vg24tuhqjRSiAeI0TJH+xZclOBcyuC3kzS+fMfxBL9mH2MZ5fW0f
         E8ipuwU1Urxt6d5tSBtz0iinipEkb6Ig9hkUoXExD1WCRuwSq8WFSeDha1BDbuRfVgKS
         MgOKanvMSVRMOI0v//LLQPPt42iFw5LhPcruiB/q0bOK20zeLsVr0UtuQUGOvsmeB0re
         WfXBhRX1MdC22IEET62e4aVgl8tDfjUlqkmdYbsFI4bCpzISSAzkeATVSAVrY9dIF9ka
         yCIw==
X-Gm-Message-State: AOAM533ZM/OhkvPNA4YIBK5EpfupuPi2Bv4oJCbt3FC2idAzZgNbxDLJ
	OTgKEl6Xfs7+OO6h89J81gXneoxL2hM=
X-Google-Smtp-Source: ABdhPJyvEqdo9vQkOLvFL4gEzliV5bH5G3k1MduMDUf/5lotZC7FTG54YPGFUH2qoALiSFdWjtV/Jg==
X-Received: by 2002:a05:600c:17d1:: with SMTP id y17mr15168040wmo.135.1631883565496;
        Fri, 17 Sep 2021 05:59:25 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id j21sm6929041wmj.40.2021.09.17.05.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 05:59:25 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/4] wic: keep rootfs_size as integer
Date: Fri, 17 Sep 2021 14:59:20 +0200
Message-Id: <20210917125922.2435721-2-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210917125922.2435721-1-alex@linutronix.de>
References: <20210917125922.2435721-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The corrected line accidentally converted it to float,
which causes problems later on with python 3.10:

|   File "/home/alex/development/poky/scripts/lib/wic/partition.py", line 278, in prepare_rootfs_ext
|     os.ftruncate(sparse.fileno(), rootfs_size * 1024)
| TypeError: 'float' object cannot be interpreted as an integer

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 scripts/lib/wic/partition.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index ab304f1b2a8..a25834048e8 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -105,7 +105,7 @@ class Partition():
                 extra_blocks = self.extra_space
 
             rootfs_size = actual_rootfs_size + extra_blocks
-            rootfs_size *= self.overhead_factor
+            rootfs_size = int(rootfs_size * self.overhead_factor)
 
             logger.debug("Added %d extra blocks to %s to get to %d total blocks",
                          extra_blocks, self.mountpoint, rootfs_size)
-- 
2.20.1

