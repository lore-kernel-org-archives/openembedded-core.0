Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.5346.1630415743407115769
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Aug 2021 06:15:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hypI/4Dj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id x6so19425113wrv.13
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Aug 2021 06:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qZcE+Yw9BqSMWUYLERs0HmcRTwS/pRbcTuevJWXkoVg=;
        b=hypI/4Dja3K1VhrZHcRnOWnUGtvP6DUyAMnzDGTW8agPeEyVvfnCWlAnVSd1+zuKXL
         M4XF33lI9NBDJU/+UVrPu2gSQm3o+FqCToOCFvqkWkxFqK3M7GyY0RzBWIWs4AjFD9pL
         e5ub/T5PgLFG8lgNg8mAScpzKwo+1COFP8jfg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qZcE+Yw9BqSMWUYLERs0HmcRTwS/pRbcTuevJWXkoVg=;
        b=nsXiXCZPcIMMggM5AurTEr3HpIjsi9CYZdLS8YwCzsYqi+fRclDL+VTthgkopXs1f4
         ImZ/8PR7aFjRJWjX6q11Ba1oHJ/nPHwUqgGVTDALxDIDLGSlJrDZMkL1zj8NoViVyCwr
         WmmfaVFc36/IjcV1QcDAF87Q1D9E9iPxyzIfcrC4Qpt/9t0uzzXE1nhMnbKOrdyTw0Bb
         LW/NuEWFaaYWRVeCIcc1sMFMz3z7Hfr0Hr8C6XIQsXp0NZUsuYyOg+aPLDrFcEewER++
         F874SZUzO+sYtnIAem2VcnVl3ufCI4Z5LN4V9Zy5RYFxeo2JRkPDjLHgswv+NFNdycKk
         nU9w==
X-Gm-Message-State: AOAM530+MCTK/8I2EPsnJYIW45lZjKn20xpKheRasLyT5MZf7B+tNobL
	w28nIHmDs1VqgmkDV5TvZWpx1Jm0gX8u9g==
X-Google-Smtp-Source: ABdhPJzldTiW38fvJj3zHnwK1cEgNVT9+JIKC1zQu1eUt6T3Qv++kQgKEiWDo9o6q7weS070a3OIIQ==
X-Received: by 2002:adf:8006:: with SMTP id 6mr31858132wrk.38.1630415741261;
        Tue, 31 Aug 2021 06:15:41 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:e840:dd4f:b947:28bf])
        by smtp.gmail.com with ESMTPSA id z17sm14161004wrh.66.2021.08.31.06.15.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 06:15:41 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] oeqa/buildtools-cases: Allow bitbake time to shutdown
Date: Tue, 31 Aug 2021 14:15:40 +0100
Message-Id: <20210831131540.867057-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bitbake may still be shutting down when the UI exists. Wait for the lock
to disappear before trying to delete the directory to avoid errors.

Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/buildtools/build/meta/lib/oeqa/sdk/buildtools-cases/build.py", line 23, in test_libc
    self._run('. %s/oe-init-build-env %s && bitbake virtual/libc' % (corebase, testdir))
  File "/usr/lib64/python3.7/tempfile.py", line 807, in __exit__
    self.cleanup()
  File "/usr/lib64/python3.7/tempfile.py", line 811, in cleanup
    _shutil.rmtree(self.name)
  File "/usr/lib64/python3.7/shutil.py", line 494, in rmtree
    _rmtree_safe_fd(fd, path, onerror)
  File "/usr/lib64/python3.7/shutil.py", line 452, in _rmtree_safe_fd
    onerror(os.unlink, fullname, sys.exc_info())
  File "/usr/lib64/python3.7/shutil.py", line 450, in _rmtree_safe_fd
    os.unlink(entry.name, dir_fd=topfd)
FileNotFoundError: [Errno 2] No such file or directory: 'bitbake.sock'

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/sdk/buildtools-cases/build.py | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/sdk/buildtools-cases/build.py b/meta/lib/oeqa/sdk/buildtools-cases/build.py
index 5a17ab98c6c..a69e4a2443f 100644
--- a/meta/lib/oeqa/sdk/buildtools-cases/build.py
+++ b/meta/lib/oeqa/sdk/buildtools-cases/build.py
@@ -3,6 +3,7 @@
 #
 
 import os, tempfile
+import time
 from oeqa.sdk.case import OESDKTestCase
 from oeqa.utils.subprocesstweak import errors_have_output
 errors_have_output()
@@ -20,4 +21,10 @@ class BuildTests(OESDKTestCase):
                 conf.write('\n')
                 conf.write('DL_DIR = "%s"\n' % self.td['DL_DIR'])
 
-            self._run('. %s/oe-init-build-env %s && bitbake virtual/libc' % (corebase, testdir))
+            try:
+                self._run('. %s/oe-init-build-env %s && bitbake virtual/libc' % (corebase, testdir))
+            finally:
+                delay = 10
+                while delay and os.path.exists(testdir + "/build//bitbake.lock"):
+                    time.sleep(1)
+                    delay = delay - 1
-- 
2.32.0

