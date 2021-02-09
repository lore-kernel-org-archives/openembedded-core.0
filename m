Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web12.12308.1612885867529966421
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Feb 2021 07:51:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pLkEkR8x;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id v193so14430795oie.8
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Feb 2021 07:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3lV7w6ZOiQXixfu/cQueH0Zl1bZBD9IcYauXbUByARY=;
        b=pLkEkR8xB62ppA0lBVW4AuLrt072bNfuV24sFVJ0qXPRg3dT85QnGzl5AaWH2DUAOy
         Qut3LqfkXMxdov1ZcKBnob50aHpy27WPwvFWLKQ9owV9nKS5mScAeCv4gOgCQv4B/fqW
         NublZLOed+0vhpE/pteSdBcGUL/239/JOvgnwYWNnzfUXekyv98dOb5gRiZL2mLngAQj
         SxP04X3ofch3Uow0Q0m8vTVr0Eu6YBTYEn0gawqI04SdMbBCoRsiwH85ZQQbYHZEb5SE
         n1Vc673H4gMeSTnU/o0zYluE5vfYamupGCKV0rfRqIk74PO8OnCk82/GeeAd+FFYLf5U
         f+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3lV7w6ZOiQXixfu/cQueH0Zl1bZBD9IcYauXbUByARY=;
        b=LOFLNawqhPjZhOu5FxxUL0vTDdaqySxNACRDfCGVRHgCrDl6F7N5w6GWhbSn4RYZ73
         XzV6PBfRyltHiW5oJFvsM2FQKjo+hzRgibcOet0TclpoFedyhqSqkkwLtNzJJXfIGK6T
         6CUaU5tN1fl0yjF6bxHcPOOCmndIIZ/zq9Mv/stFjP49sHBV0fpkDgKqiqa1dEV4j0dy
         Y2Nual616fwNtuhCF+5arDuNgAi5rG/1/E+iBbg2RoMcVZWO0lKjxGeySvzndcjXiwPn
         7szv+kCzBT0tknbEEFzKNGHWL8v1uJghSOdlbGaqhqZDbFhT2+IxuOfOmA93Uve/ZcYw
         bRqg==
X-Gm-Message-State: AOAM530d7qvKfZeYTRlL8XJzEFUTY3iLww21t5fI1rUzV3Ae+3f6srh8
	WbSvnVi7dJaSjS0nbmaR4HRJg0YXyU8=
X-Google-Smtp-Source: ABdhPJwrtdIRGSlB3aFM6Z0iDPfhXvAZ+9S3eRYhklK+poQkrgvlwBpMg/QWSsBsf5yjyex8GvOBQA==
X-Received: by 2002:aca:5481:: with SMTP id i123mr2807915oib.70.1612885866657;
        Tue, 09 Feb 2021 07:51:06 -0800 (PST)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id h6sm347277otn.38.2021.02.09.07.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Feb 2021 07:51:06 -0800 (PST)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] Fix up bitbake logging compatibility
Date: Tue,  9 Feb 2021 09:51:00 -0600
Message-Id: <20210209155100.18345-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bitbake changed the debug() logging call to make it compatible with
standard python logging by no longer including a debug level as the
first argument. Fix up the few places this was being used and remove the
make_logger_bitbake_compatible() API, as it is no longer needed

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/testimage.bbclass         |  3 +--
 meta/lib/oe/terminal.py                |  4 ++--
 meta/lib/oeqa/sdk/testsdk.py           |  3 +--
 meta/lib/oeqa/utils/__init__.py        | 30 --------------------------
 meta/lib/oeqa/utils/package_manager.py |  4 ++--
 5 files changed, 6 insertions(+), 38 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 78da4b09bd..374171f2f5 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -202,7 +202,6 @@ def testimage_main(d):
     from oeqa.runtime.context import OERuntimeTestContextExecutor
     from oeqa.core.target.qemu import supported_fstypes
     from oeqa.core.utils.test import getSuiteCases
-    from oeqa.utils import make_logger_bitbake_compatible
 
     def sigterm_exception(signum, stackframe):
         """
@@ -220,7 +219,7 @@ def testimage_main(d):
        and ('dnf' in d.getVar('TEST_SUITES') or 'auto' in d.getVar('TEST_SUITES'))):
         create_rpm_index(d)
 
-    logger = make_logger_bitbake_compatible(logging.getLogger("BitBake"))
+    logger = logging.getLogger("BitBake")
     pn = d.getVar("PN")
 
     bb.utils.mkdirhier(d.getVar("TEST_LOG_DIR"))
diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
index eb10a6e33e..61c2687ef4 100644
--- a/meta/lib/oe/terminal.py
+++ b/meta/lib/oe/terminal.py
@@ -185,7 +185,7 @@ class Custom(Terminal):
             Terminal.__init__(self, sh_cmd, title, env, d)
             logger.warning('Custom terminal was started.')
         else:
-            logger.debug(1, 'No custom terminal (OE_TERMINAL_CUSTOMCMD) set')
+            logger.debug('No custom terminal (OE_TERMINAL_CUSTOMCMD) set')
             raise UnsupportedTerminal('OE_TERMINAL_CUSTOMCMD not set')
 
 
@@ -216,7 +216,7 @@ def spawn_preferred(sh_cmd, title=None, env=None, d=None):
 
 def spawn(name, sh_cmd, title=None, env=None, d=None):
     """Spawn the specified terminal, by name"""
-    logger.debug(1, 'Attempting to spawn terminal "%s"', name)
+    logger.debug('Attempting to spawn terminal "%s"', name)
     try:
         terminal = Registry.registry[name]
     except KeyError:
diff --git a/meta/lib/oeqa/sdk/testsdk.py b/meta/lib/oeqa/sdk/testsdk.py
index 35e40187bc..04eb109dd4 100644
--- a/meta/lib/oeqa/sdk/testsdk.py
+++ b/meta/lib/oeqa/sdk/testsdk.py
@@ -71,10 +71,9 @@ class TestSDK(TestSDKBase):
         import logging
 
         from bb.utils import export_proxies
-        from oeqa.utils import make_logger_bitbake_compatible
 
         pn = d.getVar("PN")
-        logger = make_logger_bitbake_compatible(logging.getLogger("BitBake"))
+        logger = logging.getLogger("BitBake")
 
         # sdk use network for download projects for build
         export_proxies(d)
diff --git a/meta/lib/oeqa/utils/__init__.py b/meta/lib/oeqa/utils/__init__.py
index 70fbe7b552..39dde8d05c 100644
--- a/meta/lib/oeqa/utils/__init__.py
+++ b/meta/lib/oeqa/utils/__init__.py
@@ -39,36 +39,6 @@ def avoid_paths_in_environ(paths):
     new_path = new_path[:-1]
     return new_path
 
-def make_logger_bitbake_compatible(logger):
-    import logging
-
-    """ 
-        Bitbake logger redifines debug() in order to
-        set a level within debug, this breaks compatibility
-        with vainilla logging, so we neeed to redifine debug()
-        method again also add info() method with INFO + 1 level.
-    """
-    def _bitbake_log_debug(*args, **kwargs):
-        lvl = logging.DEBUG
-
-        if isinstance(args[0], int):
-            lvl = args[0]
-            msg = args[1]
-            args = args[2:]
-        else:
-            msg = args[0]
-            args = args[1:]
-
-        logger.log(lvl, msg, *args, **kwargs)
-    
-    def _bitbake_log_info(msg, *args, **kwargs):
-        logger.log(logging.INFO + 1, msg, *args, **kwargs)
-
-    logger.debug = _bitbake_log_debug
-    logger.info = _bitbake_log_info
-
-    return logger
-
 def load_test_components(logger, executor):
     import sys
     import os
diff --git a/meta/lib/oeqa/utils/package_manager.py b/meta/lib/oeqa/utils/package_manager.py
index 3623299295..6b67f22fdd 100644
--- a/meta/lib/oeqa/utils/package_manager.py
+++ b/meta/lib/oeqa/utils/package_manager.py
@@ -117,7 +117,7 @@ def extract_packages(d, needed_packages):
             extract = package.get('extract', True)
 
             if extract:
-                #logger.debug(1, 'Extracting %s' % pkg)
+                #logger.debug('Extracting %s' % pkg)
                 dst_dir = os.path.join(extracted_path, pkg)
                 # Same package used for more than one test,
                 # don't need to extract again.
@@ -130,7 +130,7 @@ def extract_packages(d, needed_packages):
                 shutil.rmtree(pkg_dir)
 
             else:
-                #logger.debug(1, 'Copying %s' % pkg)
+                #logger.debug('Copying %s' % pkg)
                 _copy_package(d, pkg)
 
 def _extract_in_tmpdir(d, pkg):
-- 
2.30.0

