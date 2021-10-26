Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C0E5C433FE
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 15:59:34 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.14241.1635263952829079345
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 08:59:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="290783513"
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800";
   d="scan'208";a="290783513"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 08:59:33 -0700
X-IronPort-AV: E=Sophos;i="5.87,184,1631602800";
   d="scan'208";a="578786633"
Received: from wandsuan-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.231.17])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2021 08:59:32 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 26/37] oeqa: Update cleanup code to wait for
 hashserv exit
Date: Tue, 26 Oct 2021 23:57:57 +0800
Message-Id: 
 <635833734b4c61e453ca9843a9fb5cecf3eb1c97.1635257336.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635257336.git.anuj.mittal@intel.com>
References: <cover.1635257336.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 15:59:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157429

From: Richard Purdie <richard.purdie@linuxfoundation.org>

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
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0b07d9add687d78495176cda0f3011c10ffa4d4b)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/sdk/buildtools-cases/build.py | 2 +-
 meta/lib/oeqa/selftest/cases/eSDK.py        | 2 +-
 meta/lib/oeqa/selftest/context.py           | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/sdk/buildtools-cases/build.py b/meta/lib/oeqa/sdk/buildtools-cases/build.py
index 9c9a84bf8a..aee2e5a8c0 100644
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
index 862849af35..d0c402ba8a 100644
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
index 1659926975..78c7a467e2 100644
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
2.31.1


