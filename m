Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web09.1143.1631666300907509426
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Sep 2021 17:38:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KqdQhIZL;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id 2so860701qtw.1
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Sep 2021 17:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=73TxYIbacSuI8X8pmWLhIyhOwFLol/VgHii6JAeZ010=;
        b=KqdQhIZLwXoy1svCDDMQSNmg+07XE9cU57wRIpOZIpsbu8IAsDxk1tJZruZLwAVnSo
         knLCyWWMSc6/dMbW35fERZHb3AI7e6fgA/krZqOBYfqkOEtygs1Vo3sZ4P1gyQkKFcQX
         J52J52vAiyXvIAUUmuXtMx9GLADyw6mpm++kJHLd3lgozzMbPQ3Qd5PSvPmJ4m0nuBc+
         eJkwBHVvllk6UIwbV+H3A1p8eHDJl8IRPFhkwte4hz7OaPHqi/pJhCknOP7yS5b1KWNI
         VJ5gWX3F1PMu1uruayylRVwMgcaJGTxhllgsU3jkCRT8rzV8WZJFIWuDOI3ru/iAZ6G9
         H8lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=73TxYIbacSuI8X8pmWLhIyhOwFLol/VgHii6JAeZ010=;
        b=osvPacX8qs0CGfrsHShsAc0VNpwC+v18sfKZslfuV0uN3uGuLJI3ot/O6hNuuB2EZS
         63cbO9LViYcnFPLIfFKm3RzEeY88XZY8xr6VqyBlTuMpIV9asMpgUwCbYdlkGVEGR+5a
         xr3QcipsyR0mYLJ9DLIlNyboh3Buhj9XsOVrB0sLXY0f4NgVh8sukCJE13YCdQnC2ANI
         y0gOxw7neSWT8L1vu+PrEA68XTdWNjCOVgdTONNzCg6EPAT77EYiwF3anuN2RmInIQBK
         X83RyV6WBsuVZ/77LhIaBotGZF4W50QAfIW+LSkOBns8dRCVCV9H2NXtQSDEl+pPa7GR
         wveQ==
X-Gm-Message-State: AOAM530Q+4h6FsYK8HTxC0YZhLLLmLQndEmSkf/N9b+GAv5deeJ4N+sC
	rTLgD4O3uyoCd+TCzCsZYwG1pZtkw74=
X-Google-Smtp-Source: ABdhPJyHwNWDkNbZRszt97G/ToFDWEyeLs8EKPI+s3o36Ns0GhcKw6vDTHhkYv3uqyavJYJRrYAfpQ==
X-Received: by 2002:ac8:66da:: with SMTP id m26mr7422189qtp.273.1631666299747;
        Tue, 14 Sep 2021 17:38:19 -0700 (PDT)
Return-Path: <twoerner@gmail.com>
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id h70sm9072677qke.54.2021.09.14.17.38.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 17:38:19 -0700 (PDT)
From: "Trevor Woerner" <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta-skeleton][PATCH 1/2] hello-mod/hello.c: convert to module_init/module_exit
Date: Tue, 14 Sep 2021 20:38:03 -0400
Message-Id: <20210915003804.34746-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.30.0.rc0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch away from the old init_module/cleanup_module function names for the
main entry points. Change them to the documented method with module_init()
and module_exit() markers next to static functions.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta-skeleton/recipes-kernel/hello-mod/files/hello.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-skeleton/recipes-kernel/hello-mod/files/hello.c b/meta-skeleton/recipes-kernel/hello-mod/files/hello.c
index f3c0d372eb..b68b0c348e 100644
--- a/meta-skeleton/recipes-kernel/hello-mod/files/hello.c
+++ b/meta-skeleton/recipes-kernel/hello-mod/files/hello.c
@@ -19,15 +19,17 @@
 
 #include <linux/module.h>
 
-int init_module(void)
+static int __init hello_init(void)
 {
 	printk("Hello World!\n");
 	return 0;
 }
 
-void cleanup_module(void)
+static void __exit hello_exit(void)
 {
 	printk("Goodbye Cruel World!\n");
 }
 
+module_init(hello_init);
+module_exit(hello_exit);
 MODULE_LICENSE("GPL");
-- 
2.30.0.rc0

