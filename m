Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33728C61DA4
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 14:20:55 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.20662.1678717245790280351
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Mar 2023 07:20:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ULEp0jRo;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id er25so21259879edb.5
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 07:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678717244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gEG5glNfxedWfG+2zz3Yp7z3rJscLwmwSC2/Su6lPsU=;
        b=ULEp0jRoX745TEJ5aiPTSiWESBcf4JU/AmzT7+SFo0TFFQi8QSfk45DbP6OSYfmKM2
         B1cPAUOC9LatnbrjFEl/mE99vlerGidmRsJ3yj0Rchzr2YSPzbmfhwhxHlKG76fjyIRl
         3ifspkeLBhaym86x88BG/ge0qvVUQbhMf4Ew4+OFhiDxMjqmXCUtcrUxsCfUIgqswrg9
         3PlHZNTUVYJMIXKKE2TMSW2z5OUUjOVm60QfaIpbVdedrhiphTVn+MJefKsx6X9rUbEx
         gMC0exNwEJTzxtQvfk1SKTZ1GjRSpGwjFVUtXazzzKDIdkhxE9DB3Vnl0TJpRAPGepO9
         jTwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678717244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gEG5glNfxedWfG+2zz3Yp7z3rJscLwmwSC2/Su6lPsU=;
        b=wyQdrmbEVAN09VaKE3xu0mN+dlaUOdRZAq8gOaaOH/r9xTQ2PlsDi71/m/fFwibqh7
         xuwbOdSACWWPPsXr2eEgzl76woNkLi44D5+jGRrS/XNH3ncb8KiYRla2cE9dUnUYxzVc
         /SMhaYRwjv5lJ6nJ9lFlTHp4FsHv8isOpbLON5V/DOtYnO7g0bhuiHcNM4NwvL8reaGf
         AoGvQQBIyjxcCW2svkh63Scs9mlHwIUdITKxpjFWKYt2P1EU5hMLqdBq82pMLCN/X049
         5P2YKr+XF3PGJiasHiUGqpCMhAKjXw+zktIddt7LXnxGusTcWuXukD2WdqwrQz6e47Rd
         uPMQ==
X-Gm-Message-State: AO0yUKX8XqZilrpUdMBos01UTGB68laLwld5yDjqrnWQ1ocB5UzntG8v
	nnnY3IHGoB15BqPnQKG7ai1cyjBq0RY=
X-Google-Smtp-Source: AK7set/4ieKQaNMaF6PrgKoUWzKfCYIT0XSxx00SKORgk1aklK4tLPK/wq3XgB6R5EPcidFdoymmqA==
X-Received: by 2002:a17:906:8614:b0:91e:9cc8:427b with SMTP id o20-20020a170906861400b0091e9cc8427bmr9326777ejx.25.1678717243825;
        Mon, 13 Mar 2023 07:20:43 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id h26-20020a170906399a00b00915d58e56f0sm3501395eje.77.2023.03.13.07.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 07:20:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: chee.yang.lee@intel.com,
	leonardo.sandoval.gonzalez@linux.intel.com,
	peter.kjellerstedt@axis.com,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 1/2] oeqa: loader.py: show warning when skipping selected module and abort if all are skipped
Date: Mon, 13 Mar 2023 15:20:31 +0100
Message-Id: <20230313142032.2823381-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 14:20:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178450

* skipped modules were triggering an ERROR before:

  poky $ oe-selftest -v -r eSDK.oeSDKExtSelfTest.test_install_libraries_headers imagefeatures.ImageFeatures.test_image_gen_debugfs -K -B /OE/build/poky/build-eSDK
  2023-03-13 15:07:53,430 - oe-selftest - ERROR - Not found eSDK.oeSDKExtSelfTest.test_install_libraries_headers in loaded test cases

* but didn't show the reason why it wasn't loaded and more importantly -r
  was ignored when all selected modules were silently skipped

* add a warning when skipping some module and abort if some modules were
  selected, but all ended being skipped:

  poky $ oe-selftest -v -r eSDK.oeSDKExtSelfTest.test_install_libraries_headers -K -B /OE/build/poky/build-eSDK
  2023-03-13 15:11:51,028 - oe-selftest - WARNING - module 'eSDK.oeSDKExtSelfTest.test_install_libraries_headers' was skipped from selected modules, because it doesn't match with module name assumptions: package and module names do not contain upper case characters, whereas class names do
  2023-03-13 15:11:51,028 - oe-selftest - ERROR - All selected modules were skipped, this would trigger selftest with all tests and -r ignored.

* I was hit by this in oe-selftest -r eSDK.oeSDKExtSelfTest.test_install_libraries_headers
  which is skipped due to upper case characters in module name and selftest started to run
  all tests (archiver.Archiver.test_archiver_allows_to_filter_on_recipe_name as first from 529)

  poky $ oe-selftest -v -r eSDK.oeSDKExtSelfTest.test_install_libraries_headers -K -B /OE/build/poky/build-eSDK
  2023-03-13 14:00:52,955 - oe-selftest - DEBUG - Selected tests with -r: ['eSDK.oeSDKExtSelfTest.test_install_libraries_headers']
  2023-03-13 14:00:55,531 - oe-selftest - INFO - Changing cwd to /OE/build/poky/build
  ..
  2023-03-13 14:00:58,128 - oe-selftest - INFO - test_archiver_allows_to_filter_on_recipe_name (archiver.Archiver.test_archiver_allows_to_filter_on_recipe_name)

  I'll rename eSDK to esdk in next commit to avoid this.

* also fix small typo in context I've noticed when debugging this

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/lib/oeqa/core/context.py | 2 +-
 meta/lib/oeqa/core/loader.py  | 9 +++++++--
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/core/context.py b/meta/lib/oeqa/core/context.py
index 2abe353d27..9313271f58 100644
--- a/meta/lib/oeqa/core/context.py
+++ b/meta/lib/oeqa/core/context.py
@@ -81,7 +81,7 @@ class OETestContext(object):
     def runTests(self, processes=None, skips=[]):
         self.runner = self.runnerClass(self, descriptions=False, verbosity=2)
 
-        # Dinamically skip those tests specified though arguments
+        # Dynamically skip those tests specified though arguments
         self.skipTests(skips)
 
         self._run_start_time = time.time()
diff --git a/meta/lib/oeqa/core/loader.py b/meta/lib/oeqa/core/loader.py
index 11978213b8..f25b5970e9 100644
--- a/meta/lib/oeqa/core/loader.py
+++ b/meta/lib/oeqa/core/loader.py
@@ -37,7 +37,7 @@ def _find_duplicated_modules(suite, directory):
         if path:
             raise ImportError("Duplicated %s module found in %s" % (module, path))
 
-def _built_modules_dict(modules):
+def _built_modules_dict(modules, logger):
     modules_dict = {}
 
     if modules == None:
@@ -48,6 +48,9 @@ def _built_modules_dict(modules):
         # characters, whereas class names do
         m = re.match(r'^([0-9a-z_.]+)(?:\.(\w[^.]*)(?:\.([^.]+))?)?$', module, flags=re.ASCII)
         if not m:
+            logger.warn("module '%s' was skipped from selected modules, "\
+                "because it doesn't match with module name assumptions: "\
+                "package and module names do not contain upper case characters, whereas class names do" % module)
             continue
 
         module_name, class_name, test_name = m.groups()
@@ -58,6 +61,8 @@ def _built_modules_dict(modules):
             modules_dict[module_name][class_name] = []
         if test_name and test_name not in modules_dict[module_name][class_name]:
             modules_dict[module_name][class_name].append(test_name)
+    if modules and not modules_dict:
+        raise OEQATestNotFound("All selected modules were skipped, this would trigger selftest with all tests and -r ignored.")
 
     return modules_dict
 
@@ -71,7 +76,7 @@ class OETestLoader(unittest.TestLoader):
             *args, **kwargs):
         self.tc = tc
 
-        self.modules = _built_modules_dict(modules)
+        self.modules = _built_modules_dict(modules, tc.logger)
 
         self.tests = tests
         self.modules_required = modules_required
-- 
2.39.2


