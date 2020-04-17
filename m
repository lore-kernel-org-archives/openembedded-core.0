Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.1882.1587133148672655767
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Apr 2020 07:19:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UGwMxhkR;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id a81so3164999wmf.5
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Apr 2020 07:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AQbIzoFEEpR3dfEaClNoaUwgu2OScNxNN6iikmW6SKU=;
        b=UGwMxhkRaMKyn4MYUkPy4VxoV093XDS2oxk5JzoELk141eI8gjein5f0NTHIkQT2zJ
         GGF3fJhuUeRLuSgfxS6Lclz+So7hoUh7GuLqGid+RziwdNc9GpRBCiZUSAkeKANVNBKv
         8EWOTL7g0JaMTiF3q4Yo0DydZuKtAr72MK1Un6Sdu0LX7AIkmxqQthZSOKgD7igenK9q
         fC9hu8WXO3JcjZNTZ2jMk74RDasD4WUQbsC6gzwYP+kQdFmzi55aSOgcts4bfYbyGgaW
         vasaK4ZPYobdDVaeSCXud474PczFtCgTPf0eQSHBL20JZyFtWyclhcsNMEeLtOfuwDTB
         IHOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AQbIzoFEEpR3dfEaClNoaUwgu2OScNxNN6iikmW6SKU=;
        b=k8yNus/1zB1WFFKP/zx6I9L/MLtuHGKLR+sxWl6hGp88akrEnuWwrctfTsZDC+YX/7
         +1e6reNu46ZsfiOgHNgy26yb7amij72QWm3cTTtuXpqoM+ZEAPAQ/LNJAhNxtVRUl3SH
         GfTrrGKYv1Ha3LYHepBhzByF3lO28XbosB1NlRaxeFA9qlpBJlWWOfhXYL/3CpKQ69f0
         m9xpcY8Vm41fdxWpPhTqiftTfu1UlzjPA7wR3Kjv71FRvLU1FrC40d5qanTHXFsJ4Lt/
         P9VJYGllFvOar8rNzlFrAOUOxaBPN02WQWY2h9rMDMVaYPyKb7cMhiV34p6FueyGYIta
         Smpw==
X-Gm-Message-State: AGi0Pub5sBuTu8YQ0bupDRMuU45judNEObd7yuUURRKceXeuGCAPUCAu
	8WM00JQ4jKfnV+XAn1Co9NaMkkCn
X-Google-Smtp-Source: APiQypJCqXySIzJUYgi7VKti1f2HdjFsMU70Ok/PG77wMpbhb7UPpmEzMfiKfi1MnDxe1CzW/jzETw==
X-Received: by 2002:a1c:2506:: with SMTP id l6mr3530634wml.44.1587133146679;
        Fri, 17 Apr 2020 07:19:06 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id x18sm31474825wrs.11.2020.04.17.07.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2020 07:19:05 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 2/2] testimage: add an overall timeout setting
Date: Fri, 17 Apr 2020 16:18:45 +0200
Message-Id: <20200417141845.23834-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200417141845.23834-1-alex.kanavin@gmail.com>
References: <20200417141845.23834-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is useful when tests misbehave and get stuck, or when
a significant increase in testing time is undesirable and
needs to be caught automatically.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/classes/testimage.bbclass | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index deb81bc256..d5666716fb 100644
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
@@ -359,6 +365,11 @@ def testimage_main(d):
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
2.26.0

