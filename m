Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
 by mx.groups.io with SMTP id smtpd.web12.18367.1588480054190092626
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2020 21:27:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ncaj0M+/;
 spf=pass (domain: gmail.com, ip: 209.85.208.193, mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f193.google.com with SMTP id w20so6393232ljj.0
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2020 21:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k5Ckd3TqwjQ3SOOFXn3EI3q4MX4q7Okazgb4InhItkg=;
        b=Ncaj0M+/yj4hM3LPFS0ueoZG99a0U+IBT0pwMypDT0a7n4YcPqQHOY6xQiGOnR5l5/
         1DuzxsKAZ0gfpt0DtgU5Z7qBxtCdXunR5UOSs8hfJiFsdLpQhxYLguVIT4HiNcFxpDzD
         kE3bQW16jIqQPEjmqYgu/YPRBWl/205wTbvL+cE7460anm8sgcAL3zLagPfHFVMmyCjy
         6i0FxZeA44a78MiuFMdV3uWcl6bF+MbwRb7cy1Z594l1v1fVI6a368yN5z+iWy2JlS/u
         LqnK6U6BteUK4diIuikKk/F9ALh2arLWQQIFyZivv/RM44bRkRX00aD1+OTn1NzmNYlk
         YvQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k5Ckd3TqwjQ3SOOFXn3EI3q4MX4q7Okazgb4InhItkg=;
        b=Y/U9qdVP/z6CKkIrz6HgacicnvYBGwosgG1sdIF88LcWKmy06kf+QqNUVexWJjR5Fn
         4TAjET2dWg2CJqpP6uQGgJLG3LbN6oPeqhfInUv9jV89y03ud4Fwy964bgABTBGfLskY
         Ze3f2caPgKhjpSxCzoUM0EtENXV6W/sjZ184P0nKa3I5A7Pl0SCrQjR3MGGOqPmabR6S
         RQdn7mVc7pN9qd1rGDMDuUei1lM3Diqv09MdjSscLN5ql/mR4SVxiu/dVJ+gnH68vSGG
         osFARz+dpxr35idwqSZlPI7DGPQq3IJGZtCFSqd7U4gGY6RFwjU3AgJxI2OQuLKhES3G
         pKvA==
X-Gm-Message-State: AGi0PuZP3jMEFW7fCM+D947X9VfgpOhtSvuSBoTIfLGAH+JH8YQFVz+H
	bo3bQ2bkuGo+R7D0kWliKE3bWLl7
X-Google-Smtp-Source: APiQypL2js/xTFMzDvwSf+RofItAGKf9JG2tL6uQHl0sepbYngYwLXre98yH8ppbGfOyLV87p0MQeg==
X-Received: by 2002:a2e:9a4a:: with SMTP id k10mr6760692ljj.115.1588480051781;
        Sat, 02 May 2020 21:27:31 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se. [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id s11sm5767959lfo.86.2020.05.02.21.27.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2020 21:27:30 -0700 (PDT)
From: "Jacob Kroon" <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [pseudo][PATCH] pseudo_ipc.h: Fix enum typedef
Date: Sun,  3 May 2020 06:27:12 +0200
Message-Id: <20200503042712.1878496-1-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'pseudo_access_t' is a type, so use typedef.

Fixes building pseudo with gcc 10 where -fno-common is the default.

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 pseudo_ipc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/pseudo_ipc.h b/pseudo_ipc.h
index caeae5c..d945257 100644
--- a/pseudo_ipc.h
+++ b/pseudo_ipc.h
@@ -29,7 +29,7 @@ typedef struct {
 	char path[];
 } pseudo_msg_t;
 
-enum {
+typedef enum {
 	PSA_EXEC = 1,
 	PSA_WRITE = (PSA_EXEC << 1),
 	PSA_READ = (PSA_WRITE << 1),
-- 
2.26.2

