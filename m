Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.3012.1596883268834035032
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Aug 2020 03:41:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=piKXjMAw;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id jp10so4636200ejb.0
        for <openembedded-core@lists.openembedded.org>; Sat, 08 Aug 2020 03:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cEbB0WeCIHG8O6BM25lnC37qFoSBFQjXIWHqV6Ai6PQ=;
        b=piKXjMAw8Jg31myAbmW2oh0mTLxt29deHZqJHctJncT/ifDwFIzXq63bE9GV03YE87
         VltR2dsiX4zwYmwfeSSbwxO1DPAxO35EQd04YfQxber4FLN/Bm+2R7tXtIpTuPXQ/21a
         uVzCoJUMOLmWgAF8oicGJ8fUU0RlYKITqe7ylHr5nKA0Wic9QV3Qr6w1q3MB/8lihrrx
         ASK+cCd46jmWFHojcq9WSaq5Y5T2Q2PzD5Hj5fbXu+jSlKL19cCworCFIvUAHiEiPFpU
         PMcbP3vL2OcMAjdDfOMCdeXiZc/pJsHawKJ1vGEfqiRQySovCGKcFYierw5G5B4vMH8H
         bPrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cEbB0WeCIHG8O6BM25lnC37qFoSBFQjXIWHqV6Ai6PQ=;
        b=WlC3wjQrqu7ukHpzwWTlAaAFwyu9xjZTz0XExvbnK14aTRiqG6O3YkZkq/LPis82Tf
         j4Vc5hmUrDI24T2/l6XC+rcewkkokpLxEWWGYSdKXl1U60z714vn+eWjK8/0uKjyuKJy
         Q69lVEtqquivEZ7rtmlNHhwuIwEifh+H32tBRBjHTjGICfqOeuNF6NhY0/Vcp77/MOAp
         BT4jRu/hVY/FWgUKIZLTXGKY0gLVvChJezZqYQaM+x6cJaCJgJTBfl39jAYcUBjkbJ6B
         l9tsNdU9kZ0vL21D95Ty0xPxzvTUM5idcNFtXUkPRLaGRCdQL0ZlHlvDcQgtP0ieKRLU
         tQFw==
X-Gm-Message-State: AOAM532tJnU9wWEz1uRTCIB97L1PY33qXvtP+HPOPoOgazfTqKXhToX1
	aiLQc+K/hMLg7PVafLZc1+qlNLRq
X-Google-Smtp-Source: ABdhPJw/c5gUpIp3l1MqOmZNGJUpyLA+ZlwHTYxlbh27UqqupwhiLX+L2Tkw23jbYK/hnEmZJhpVpg==
X-Received: by 2002:a17:906:8595:: with SMTP id v21mr13927745ejx.347.1596883266981;
        Sat, 08 Aug 2020 03:41:06 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id c7sm7528049edf.1.2020.08.08.03.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2020 03:41:06 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [dunfell][PATCH 1/2] testimage: add an overall timeout setting
Date: Sat,  8 Aug 2020 12:40:53 +0200
Message-Id: <20200808104054.28306-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is useful when tests misbehave and get stuck, or when
a significant increase in testing time is undesirable and
needs to be caught automatically.

(From OE-Core rev: d77546e910ad9048f0057f4465716d417b810065)

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/testimage.bbclass | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 53945478af..00f0c29836 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -31,6 +31,7 @@ TESTIMAGE_AUTO ??= "0"
 # TEST_LOG_DIR contains a command ssh log and may contain infromation about what command is running, output and return codes and for qemu a boot log till login.
 # Booting is handled by this class, and it's not a test in itself.
 # TEST_QEMUBOOT_TIMEOUT can be used to set the maximum time in seconds the launch code will wait for the login prompt.
+# TEST_OVERALL_TIMEOUT can be used to set the maximum time in seconds the tests will be allowed to run (defaults to no limit).
 # TEST_QEMUPARAMS can be used to pass extra parameters to qemu, e.g. "-m 1024" for setting the amount of ram to 1 GB.
 # TEST_RUNQEMUPARAMS can be used to pass extra parameters to runqemu, e.g. "gl" to enable OpenGL acceleration.
 
@@ -75,6 +76,7 @@ DEFAULT_TEST_SUITES_remove_qemumips64 = "${MIPSREMOVE}"
 TEST_SUITES ?= "${DEFAULT_TEST_SUITES}"
 
 TEST_QEMUBOOT_TIMEOUT ?= "1000"
+TEST_OVERALL_TIMEOUT ?= ""
 TEST_TARGET ?= "qemu"
 TEST_QEMUPARAMS ?= ""
 TEST_RUNQEMUPARAMS ?= ""
@@ -206,6 +208,10 @@ def testimage_main(d):
         """
         os.kill(os.getpid(), signal.SIGINT)
 
+    def handle_test_timeout(timeout):
+        bb.warn("Global test timeout reached (%s seconds), stopping the tests." %(timeout))
+        os.kill(os.getpid(), signal.SIGINT)
+
     testimage_sanity(d)
 
     if (d.getVar('IMAGE_PKGTYPE') == 'rpm'
@@ -363,6 +369,11 @@ def testimage_main(d):
         # We need to check if runqemu ends unexpectedly
         # or if the worker send us a SIGTERM
         tc.target.start(params=d.getVar("TEST_QEMUPARAMS"), runqemuparams=d.getVar("TEST_RUNQEMUPARAMS"))
+        import threading
+        try:
+            threading.Timer(int(d.getVar("TEST_OVERALL_TIMEOUT")), handle_test_timeout, (int(d.getVar("TEST_OVERALL_TIMEOUT")),)).start()
+        except ValueError:
+            pass
         results = tc.runTests()
     except (KeyboardInterrupt, BlockingIOError) as err:
         if isinstance(err, KeyboardInterrupt):
-- 
2.28.0

