Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web12.37304.1597028423159899557
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2020 20:00:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=zWh7FF28;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id z20so4063559plo.6
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Aug 2020 20:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=ION1J2GBbZo/+LX2i1gOTK2V/keqOmQJUAA6fKOLzwY=;
        b=zWh7FF28NbFYsiv1AZRW/p5jeo9w7GuNP463lSsZWNKjSWkFL6jkuhgvCW9QfhvznP
         nT6BsHFcIfT7oRuAoMLHzKP4+mFePoOCzDlEsNWOZHga1bsnTBoVG0JMCbsPwkaUmWDu
         Cv0L+AgXvNotl0VHsY9uDh4bD4IyAJq2S3pnNV2Q/KD1RIRD12uqfOPWe/vP91PVLgdG
         jj6yk1nTnpLKuYvtqDfGbTN/74OI/lk8OGfoeW6Lyqyh0VmN3Z/3l1OxQecC0cysOb7Z
         ZR5IIX7m+e5xsTjlfgKKui+mAp0y2uYFK4hk0llyzju5dpA5+0Jxft2O5XV9SJp/+Y0L
         qj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=ION1J2GBbZo/+LX2i1gOTK2V/keqOmQJUAA6fKOLzwY=;
        b=oJDYBdmA66bHxq75JqfId2vcenIXyIfjg8flqlBfnmIGYfFrA1VN2VG/evpQb6AsLm
         70JPMuVlQfn0qHQ+cfwJ/zNRHoL6RTxMO6KW4OCrfjGNh5g4QI5wgQYSrFK0eha9yH3U
         zmg97/y+Qxxa9fTudZL/KhYZqOcWJ9F5HUnA3l5j/HqMIoZ6ANDW4E6DOlhNR9Ni7GS0
         ruedVkTK/SnkCxeG8CPOKyFHNRPyzwKfOfCWTowfETYy4OtqmwGBSwjCbd+EOTi19vFM
         GbU6opixArQvnMesmiRLCcYinBTnnKjgkIlEeeywjx8KH/22c/ev803/uwv2mnD/o2GG
         EBAw==
X-Gm-Message-State: AOAM531KwI+72XEmTmKV8hLdup+c17IX+8MJtqtSC3JNcIWeKzxzbiVW
	DxROSrY1jL+TIBFpOa2ZplLoAB+S1fchFQ==
X-Google-Smtp-Source: ABdhPJxvQpO+hykyT2sQn3yBnENkxsMDCwQHU1p+SFVx2v38rlFWmK2F1/pS1ITE0PWZ1wjqnrjnog==
X-Received: by 2002:a17:90a:2a0d:: with SMTP id i13mr25530361pjd.92.1597028422243;
        Sun, 09 Aug 2020 20:00:22 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id e23sm7187271pgb.79.2020.08.09.20.00.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2020 20:00:21 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 17/19] testimage: add an overall timeout setting
Date: Sun,  9 Aug 2020 16:59:23 -1000
Message-Id: <eb57207f983b454dbdf2321da330fc1ec8a8bcbf.1597028036.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1597028036.git.steve@sakoman.com>
References: <cover.1597028036.git.steve@sakoman.com>

From: Alexander Kanavin <alex.kanavin@gmail.com>

This is useful when tests misbehave and get stuck, or when
a significant increase in testing time is undesirable and
needs to be caught automatically.

(From OE-Core rev: d77546e910ad9048f0057f4465716d417b810065)

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.17.1

