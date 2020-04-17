Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web11.1888.1587133147288031729
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Apr 2020 07:19:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nATrbs44;
 spf=pass (domain: gmail.com, ip: 209.85.128.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f67.google.com with SMTP id v8so5055616wma.0
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Apr 2020 07:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YOQBLSIAVPDs97dtSiwkdSO5gvhPSbhDhmHhflTIRA4=;
        b=nATrbs44gdiyeWWfgpjCzh1ZBp+mpEcowo0qmoo4T65QNG9jRKY1kUIGeUyZA7UnLY
         2/p7hOo0gvMCnVJ2MyEQW5PG/FvPdaMBQW+r3ygsmwQGNS0x4sJNWGOrRvtkmDaDLrBg
         dS2Z7JNO46Hg881HWMB9QQEFPcpLPDcID2TFLSiKYbLKezUoISPE8LvahouBaZAeBQCk
         uLDRFbk2TArCBAGAeO0OyGOJ1vLk6GQc68Qg0qV9HTUIQnQRHa3bqFFgkRLhCAJ7HWZz
         I+cdnlnOlAqCp6Etz/vvw389fCPo3xJ5ber8bxV2+J3sv1I054/rcc8hlsykewoMOKNU
         PRFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YOQBLSIAVPDs97dtSiwkdSO5gvhPSbhDhmHhflTIRA4=;
        b=MAlKorZ9wGypdZtKJ1DCv8dsQ4pBJul/4zeCd+eQU/iPmT2AWJlGbkw0BwkQ95YBzY
         Z1y7Hi4l/GRKI0G6ihH7jankX1p0gP4AIHXssM4xnK5mq4ZpQUMT143471sjDhHSbTda
         dp8T2Gs8ipod0TXBt+MFv0hrqpC1V6v2KFOH3tZo71AvoufWwVu0mh4mbPtzxyNU5XB1
         6QrXcfjP0SIPnVx7lJyMFmw9lUNH6iQDSyTGSZurb+f5phchwTMM52XvuXpY+ouU0us7
         UGSFh4RD/IFS/n5g/tu8CeX45e4msOlz24jD1WAL4qojrdSWnNUaFUN2UQEkhi8XB/4K
         ASzQ==
X-Gm-Message-State: AGi0PuYdB8MYD/MGcwdmS8DOVFCBNvbjpE+IlAgriGt2nsYqeT+CdNTd
	7zdDCyZug4jS2BiW4RVL1fMWqd2g
X-Google-Smtp-Source: APiQypLL2EDnp2O2iCulKt/WXUJhPRoFYbtIyUTEZs9bKBJaY4031AeSgfvTwM28oZUgtYSB4b4YRA==
X-Received: by 2002:a1c:64c5:: with SMTP id y188mr3566911wmb.130.1587133144872;
        Fri, 17 Apr 2020 07:19:04 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id x18sm31474825wrs.11.2020.04.17.07.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2020 07:19:03 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 1/2] testimage.bbclass: correctly process SIGTERM
Date: Fri, 17 Apr 2020 16:18:44 +0200
Message-Id: <20200417141845.23834-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Python's unittest will not propagate exceptions upside
of itself, but rather will just catch and print them.

The working way to make it stop is to send a SIGINT
(e.g. simulate a ctrl-c press), which will make it exit
with a KeyboardInterrupt exception.

This also makes pressing ctrl-c twice from bitbake work
again (previously hanging instances of bitbake and qemu were
left around, and bitbake would no longer start until they
were killed manually).

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/classes/testimage.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 01d8598604..deb81bc256 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -204,7 +204,7 @@ def testimage_main(d):
         """
         Catch SIGTERM from worker in order to stop qemu.
         """
-        raise RuntimeError
+        os.kill(os.getpid(), signal.SIGINT)
 
     testimage_sanity(d)
 
@@ -360,9 +360,9 @@ def testimage_main(d):
         # or if the worker send us a SIGTERM
         tc.target.start(params=d.getVar("TEST_QEMUPARAMS"), runqemuparams=d.getVar("TEST_RUNQEMUPARAMS"))
         results = tc.runTests()
-    except (RuntimeError, BlockingIOError) as err:
-        if isinstance(err, RuntimeError):
-            bb.error('testimage received SIGTERM, shutting down...')
+    except (KeyboardInterrupt, BlockingIOError) as err:
+        if isinstance(err, KeyboardInterrupt):
+            bb.error('testimage interrupted, shutting down...')
         else:
             bb.error('runqemu failed, shutting down...')
         if results:
-- 
2.26.0

