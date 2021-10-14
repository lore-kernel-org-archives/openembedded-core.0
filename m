Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DD50C433F5
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 22:27:18 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web08.1983.1634250437400113387
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 15:27:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eH+XZZ8k;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id
 63-20020a1c0042000000b0030d60716239so919827wma.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 15:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a7o+fINjOC9SQaf4RQ+uTC2VWTnuQgFDAs1aN3WwMoo=;
        b=eH+XZZ8k6UqMjz0Y/ynL30+N3ip/lPnpLfmh4+xQhMyKQP+h1LtH4s8vfek4cgge30
         SMhGPEcHPbs/LnW33nWq6vqzgLK0440Y+aMQQdUHdzFN4RGcU/SN0ppOcgkGxH1/t+Lq
         ZkBkVvA2AwPX4MRgz+bd5W1H6LQLwk9CEnBb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=a7o+fINjOC9SQaf4RQ+uTC2VWTnuQgFDAs1aN3WwMoo=;
        b=aRXqMI4YwOqaniXWtgZC3ComcAvc1vroafPtg6ou00elhlFc/IwO1yzQI5Ldw/aGDV
         yD1IjQ4pVWQ9MBFltuNeeDsHj3kNS1czBZxOb+i2r+8L4pZTKXzN3LPs1WdHa5orLu8B
         +qdBAvgiUdk60PiSbZDYN/faMXOHDF/1yslGShDSTb3i1fxwveXNxPTVcObqekEjrTVH
         ms2L9rC0BL0/y74ui8Ywz277X/cmfjWAtBXb+aqkIdw7I5rOjiQaqLPYbiTcDk0ah3nJ
         CoKNtiNw5fpvefc1c0qTIggbZWE5JkOJbdi2eVAy9p2rR3pG9ZlIecSYO6RVxOCNcHME
         sbQg==
X-Gm-Message-State: AOAM532pQr9oARFRgmxSXL9xSI1qvnoZGdlPGyi5ZidlKjRlYm5kPGWY
	IbRAuVwvRQ7fZwu+Q2EJsh+rAPsj5PNCjw==
X-Google-Smtp-Source: 
 ABdhPJyef6UTJGC8wzJ3IxF5oCmEHpgXPbx7XRawUOE+/al/XKPAWENrvVXIxbBZWMkgBqgCRGolUw==
X-Received: by 2002:a1c:3b86:: with SMTP id
 i128mr22645535wma.132.1634250435663;
        Thu, 14 Oct 2021 15:27:15 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:3c2a:82f4:3a7b:54b1])
        by smtp.gmail.com with ESMTPSA id
 u2sm3255678wrr.35.2021.10.14.15.27.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 15:27:15 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa: Update cleanup code to wait for hashserv exit
Date: Thu, 14 Oct 2021 23:27:14 +0100
Message-Id: <20211014222714.2937483-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Oct 2021 22:27:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156978

We sometimes see exceptions from code seeing the hashserv DB files
being removed at directory cleanup time. Add a check to ensure the
hashserv has written the data base journal (and hence likely exited)
before cleaning up.

This will hopefully avoid errors like:

Traceback (most recent call last):
  File "[...]/meta/lib/oeqa/sdk/buildtools-cases/build.py", line 30, in test_libc
    delay = delay - 1
  File "/usr/lib/python3.6/tempfile.py", line 948, in __exit__
    self.cleanup()
  File "/usr/lib/python3.6/tempfile.py", line 952, in cleanup
    _rmtree(self.name)
  File "/usr/lib/python3.6/shutil.py", line 486, in rmtree
    _rmtree_safe_fd(fd, path, onerror)
  File "/usr/lib/python3.6/shutil.py", line 424, in _rmtree_safe_fd
    _rmtree_safe_fd(dirfd, fullname, onerror)
  File "/usr/lib/python3.6/shutil.py", line 444, in _rmtree_safe_fd
    onerror(os.unlink, fullname, sys.exc_info())
  File "/usr/lib/python3.6/shutil.py", line 442, in _rmtree_safe_fd
    os.unlink(name, dir_fd=topfd)
FileNotFoundError: [Errno 2] No such file or directory: 'hashserv.db-wal'

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/sdk/buildtools-cases/build.py | 2 +-
 meta/lib/oeqa/selftest/cases/eSDK.py        | 2 +-
 meta/lib/oeqa/selftest/context.py           | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/sdk/buildtools-cases/build.py b/meta/lib/oeqa/sdk/buildtools-cases/build.py
index 9c9a84bf8a0..aee2e5a8c06 100644
--- a/meta/lib/oeqa/sdk/buildtools-cases/build.py
+++ b/meta/lib/oeqa/sdk/buildtools-cases/build.py
@@ -25,6 +25,6 @@ class BuildTests(OESDKTestCase):
                 self._run('. %s/oe-init-build-env %s && bitbake virtual/libc' % (corebase, testdir))
             finally:
                 delay = 10
-                while delay and os.path.exists(testdir + "/bitbake.lock"):
+                while delay and (os.path.exists(testdir + "/bitbake.lock") or os.path.exists(testdir + "/cache/hashserv.db-wal")):
                     time.sleep(1)
                     delay = delay - 1
diff --git a/meta/lib/oeqa/selftest/cases/eSDK.py b/meta/lib/oeqa/selftest/cases/eSDK.py
index 862849af35c..d0c402ba8a4 100644
--- a/meta/lib/oeqa/selftest/cases/eSDK.py
+++ b/meta/lib/oeqa/selftest/cases/eSDK.py
@@ -100,7 +100,7 @@ SSTATE_MIRRORS =  "file://.* file://%s/PATH"
     @classmethod
     def tearDownClass(cls):
         for i in range(0, 10):
-            if os.path.exists(os.path.join(cls.tmpdir_eSDKQA, 'bitbake.lock')):
+            if os.path.exists(os.path.join(cls.tmpdir_eSDKQA, 'bitbake.lock')) or os.path.exists(os.path.join(cls.tmpdir_eSDKQA, 'cache/hashserv.db-wal')):
                 time.sleep(1)
             else:
                 break
diff --git a/meta/lib/oeqa/selftest/context.py b/meta/lib/oeqa/selftest/context.py
index 16599269751..78c7a467e2f 100644
--- a/meta/lib/oeqa/selftest/context.py
+++ b/meta/lib/oeqa/selftest/context.py
@@ -39,7 +39,7 @@ class NonConcurrentTestSuite(unittest.TestSuite):
 
 def removebuilddir(d):
     delay = 5
-    while delay and os.path.exists(d + "/bitbake.lock"):
+    while delay and (os.path.exists(d + "/bitbake.lock") or os.path.exists(d + "/cache/hashserv.db-wal")):
         time.sleep(1)
         delay = delay - 1
     # Deleting these directories takes a lot of time, use autobuilder
-- 
2.32.0


