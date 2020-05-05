Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.1508.1588648841526674198
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 20:20:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=sBs1O6sQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id m7so73176plt.5
        for <openembedded-core@lists.openembedded.org>; Mon, 04 May 2020 20:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=bxx6hV91362xXrVE9CNV5Ho4eF/kJ/qeZcB7IFVTkc8=;
        b=sBs1O6sQbvBF8siBCc9SUh5oLiDHU891oCq9xqsixZeqrqtkFJHVh15GhfQnv6FO4e
         bO3pPF3Spm8gBgHOUnNmk5RW4wEkx5EBay/zIvlw78lT5Qm4YSIYizgjT8tWOsAYOUpB
         WXvYMSA7zLm8c853mDqFJ3R/93rEt6ZT/eRt6yyBdqOJonGd4arbBIMNSdrobGCCCaVW
         FsHa9m2SLSr/Jbe1KGMawU/WZl6nq1vRsepMDteYx2VxD2DUQUr0lqQgMw/3vr6C6WTx
         YcrmDQcpzBUTBLQCxgqT0SyC9tvhWqFSvygxgosh/39GNDN2+OOcpzgMyvBHiuvoYTE+
         /m1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=bxx6hV91362xXrVE9CNV5Ho4eF/kJ/qeZcB7IFVTkc8=;
        b=UKJrGw+algCHs3ELHyyshMWtW32OExThCV4D2d34qCher3+0WEMvqpjRMJqbwv8wf+
         Zw9kj3T6XADEPmzaGGHP176l+348cV7PE8d4TRgMcW814bdwUzucDOQNh+FnDp0qNm1I
         ESup1nbLLKtreu7pUx0kB3dnweZeYKAQcvzkkYbkjfgVc2p9Ymz/pyqK28xUAnshwm6l
         CelT1EDFTwIHzKz9WPbt6JMY6B+G8kc28wP0sUkVWn4s/XLfiQ7FWHlEYgLUlx97Zy0S
         lbojhfSvHaqYCTSaZeDltmO9lF+06tIteRaz8qzqhT/s8flMMcw6GsQZNnR54xMvuTNk
         GHCw==
X-Gm-Message-State: AGi0PuZpkOVFi69918QKVERhM2eaAbtOtWNPwKcrfHTON4rHFBj0lvS7
	w2bnAw3xgqr9nqnoBYWnWf57IsmEMsRm3A==
X-Google-Smtp-Source: APiQypLxKNTsupfAdrXsRMVoGiKjwCRw396TcJ3b/cg53y1xoh04xvcU53yWxd/zozzSTT85sLMsNg==
X-Received: by 2002:a17:90a:30e7:: with SMTP id h94mr376767pjb.186.1588648839577;
        Mon, 04 May 2020 20:20:39 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 20sm503379pfx.116.2020.05.04.20.20.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 20:20:38 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 14/28] testimage.bbclass: correctly process SIGTERM
Date: Mon,  4 May 2020 17:19:09 -1000
Message-Id: <72a19f5f0f4bc4472d13b29e46a5c1673977e37a.1588638879.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588638879.git.steve@sakoman.com>
References: <cover.1588638879.git.steve@sakoman.com>

From: Alexander Kanavin <alex.kanavin@gmail.com>

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.17.1

