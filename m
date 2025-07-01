Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 283C3C8303B
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 07:34:21 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.4578.1751355260121487320
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 00:34:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=QjkBPZcC;
 spf=pass (domain: linaro.org, ip: 209.85.208.178, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-32addf54a01so55182681fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 00:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751355258; x=1751960058; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bh0K2X3zKys6o7GQ9IGTFFDIrbsnXFUEWr9wDdouecY=;
        b=QjkBPZcCUInu2JV1dzwxfuRYYOg41AjjLN/nisfQjay/76EGRs982mWKAPYgKU27dK
         oLtnuVkHM0+ntyWlfD3QOg6EpoX59n4KJb0fLIvdHLQvOv88Nag+xHm5RqCB/yGSAULO
         1//fOOGmhh7IJ9u1CUu1on+YGO5IcQh7vJxUJHhKwHzRSdBBA0GjELOn1SeV0G9DTYpn
         94gwUfRnq9tvs3n11zpovYioZ1OB/jVM5ebcNjGU/U/U5OtgXxfssnZD+QLIWpty1c92
         5KTVz6aFvNIe1lavWBGDM9baLBWcTjXZgH1BoUTZcdXuVtlR2tekQ4RPlxNB6Hl90Ujz
         Ay7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751355258; x=1751960058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bh0K2X3zKys6o7GQ9IGTFFDIrbsnXFUEWr9wDdouecY=;
        b=uzFNQiLS29mY708nH/POfMS/m3QTZjnPcsh9Jtucgr+tlVP0VS6HXjWYeKqW6Y+DUa
         vkBCytfti/G7FbldMgZeHA0NmAaxo0pfHIijshY+ngjkY1yF6PZDElwiSTbigdyoIcNC
         D6NnO0ID/hslenXHch/ttJ7cnchhUmzI6gnuBOb56Xe8yftFEzV60Ik4sCGw9eZ8gh9c
         oHzBgt756NTWvgXLidLIzGaBKDQkUGAiop5CCAXxBFKN40EoSWOcG5QvZ4gMyuYYbB5E
         2Zo9HovsOfjP4tGpXswT4wFxNAvvrHXnMRDRE9e+oyVjZlA02rJyP0kZ5YUXv7UDPadK
         ix+w==
X-Gm-Message-State: AOJu0YwGe1EwLg8bZxV8cz12xeGH5DeT9uuGpEruzx/ikZeZU6EV6up6
	jZLEEj0r3hp9wYnFPrJIZ/mlv17ap4PjhAEnqqq9bDbjqJxV6/OFAo+zg9Qfs1ztiLbhs3c1sGh
	lPE5jn/Y=
X-Gm-Gg: ASbGnctxCIj7Jf6erU66w6XQrZJ+qjDLloO1QCnZjPXLSbiZh9oN2/q2QDxsWm1Daun
	zMR4MHjwauOBzXWwh+XmfPhTQV6MG8Grr69h3MMevYZI1bzcxpwJ4CNG9DJ/WKXQmU6//tbOu+8
	PmmjK4nXp3wi4Rk/RXU1TUeW3wI6/+fjehJaJpxzBd5UPQ2qDqGIu1A2Q59TekjwDAhNSz2CvKJ
	V5giQblgRSS3bNVF+hgsA2AZiu1llo7AcsHQLLnjVejHhI3eJHaknulwMDr+HJmIl0SMB2VYRH0
	+zucftzLi3pfWQx3oygY9w5BnRmGK6ZhiMyaQUZKpdQyV2Bnv5KMF12K/v7vFrHHn/hUpVuai/y
	jaBrP4PU7ZlkyxiKpwVhE/R4l6SEC/BAnv1BtaFM=
X-Google-Smtp-Source: AGHT+IGcaWqDfowD80l42zXhS28xRshVtgh3/aWtoUUb00/xXG0lMQggdE6c3zDlMQljU+L+YHxrUQ==
X-Received: by 2002:a05:651c:214f:b0:32a:ec98:e15c with SMTP id 38308e7fff4ca-32cdc4f217amr35385051fa.19.1751355258060;
        Tue, 01 Jul 2025 00:34:18 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2dead99sm15268581fa.22.2025.07.01.00.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 00:34:17 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v2 4/6] testexport.bbclass oe-test: capture all tests and data from all layers
Date: Tue,  1 Jul 2025 10:33:57 +0300
Message-ID: <20250701073359.979368-4-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250701073359.979368-1-mikko.rapeli@linaro.org>
References: <20250701073359.979368-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 07:34:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219551

testexport.bbclass only copied files from core layer to
the testexport.tar.gz to run tests. Then it filtered
out tests and files which were not specified in
TEST_SUITES variable.

Remove filtering of files to include parselogs.py
test data files which are machine and/or layer specific.
TEST_SUITES variable is now read from build time exported
data store when running tests so there is no need to remove
files from exported tests in testexport.bbclass.

Adapt oe-test script to find "lib" directories from
the new structure with layer specific paths which are
used to find tests and test data files.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/classes-recipe/testexport.bbclass | 43 +++++++++++++-------------
 scripts/oe-test                        | 12 ++++---
 2 files changed, 30 insertions(+), 25 deletions(-)

v2: tried to improve commit message to clearly say that test filtering is removed

v1: https://lists.openembedded.org/g/openembedded-core/message/219381

diff --git a/meta/classes-recipe/testexport.bbclass b/meta/classes-recipe/testexport.bbclass
index cc4088c71a13..843d777e3bb9 100644
--- a/meta/classes-recipe/testexport.bbclass
+++ b/meta/classes-recipe/testexport.bbclass
@@ -85,6 +85,7 @@ def copy_needed_files(d, tc):
 
     export_path = d.getVar('TEST_EXPORT_DIR')
     corebase_path = d.getVar('COREBASE')
+    bblayers = d.getVar('BBLAYERS').split()
 
     # Clean everything before starting
     oe.path.remove(export_path)
@@ -92,17 +93,11 @@ def copy_needed_files(d, tc):
 
     # The source of files to copy are relative to 'COREBASE' directory
     # The destination is relative to 'TEST_EXPORT_DIR'
-    # Because we are squashing the libraries, we need to remove
-    # the layer/script directory
-    files_to_copy = [ os.path.join('meta', 'lib', 'oeqa', 'core'),
-                      os.path.join('meta', 'lib', 'oeqa', 'runtime'),
-                      os.path.join('meta', 'lib', 'oeqa', 'files'),
-                      os.path.join('meta', 'lib', 'oeqa', 'utils'),
-                      os.path.join('scripts', 'oe-test'),
+    # core files/dirs first
+    core_files_to_copy = [ os.path.join('scripts', 'oe-test'),
                       os.path.join('scripts', 'lib', 'argparse_oe.py'),
                       os.path.join('scripts', 'lib', 'scriptutils.py'), ]
-
-    for f in files_to_copy:
+    for f in core_files_to_copy:
         src = os.path.join(corebase_path, f)
         dst = os.path.join(export_path, f.split('/', 1)[-1])
         if os.path.isdir(src):
@@ -110,18 +105,21 @@ def copy_needed_files(d, tc):
         else:
             shutil.copy2(src, dst)
 
-    # Remove cases and just copy the ones specified
-    cases_path = os.path.join(export_path, 'lib', 'oeqa', 'runtime', 'cases')
-    oe.path.remove(cases_path)
-    bb.utils.mkdirhier(cases_path)
-    test_paths = get_runtime_paths(d)
-    test_modules = d.getVar('TEST_SUITES').split()
-    tc.loadTests(test_paths, modules=test_modules)
-    for f in getSuiteCasesFiles(tc.suites):
-        shutil.copy2(f, cases_path)
-        json_file = _get_json_file(f)
-        if json_file:
-            shutil.copy2(json_file, cases_path)
+    # layer specific files/dirs
+    layer_files_to_copy = [ os.path.join('lib', 'oeqa', 'core'),
+                      os.path.join('lib', 'oeqa', 'runtime'),
+                      os.path.join('lib', 'oeqa', 'files'),
+                      os.path.join('lib', 'oeqa', 'utils'),]
+    for layer in bblayers:
+        meta = os.path.basename(layer)
+        for f in layer_files_to_copy:
+            src = os.path.join(layer, f)
+            dst = os.path.join(export_path, meta, f)
+            if os.path.exists(src):
+                if os.path.isdir(src):
+                    oe.path.copytree(src, dst)
+                else:
+                    shutil.copy2(src, dst)
 
     # Copy test data
     image_name = ("%s/%s" % (d.getVar('DEPLOY_DIR_IMAGE'),
@@ -142,6 +140,9 @@ def copy_needed_files(d, tc):
     testexport_create_tarball(d, "testexport.tar.gz", d.getVar("TEST_EXPORT_DIR"))
 
     # Copy packages needed for runtime testing
+    test_paths = get_runtime_paths(d)
+    test_modules = d.getVar('TEST_SUITES').split()
+    tc.loadTests(test_paths, modules=test_modules)
     package_extraction(d, tc.suites)
     test_pkg_dir = d.getVar("TEST_NEEDED_PACKAGES_DIR")
     if os.path.isdir(test_pkg_dir) and os.listdir(test_pkg_dir):
diff --git a/scripts/oe-test b/scripts/oe-test
index 55985b0b2453..efb83c3e7809 100755
--- a/scripts/oe-test
+++ b/scripts/oe-test
@@ -7,14 +7,18 @@
 # SPDX-License-Identifier: MIT
 #
 
-import os
-import sys
 import argparse
+import glob
 import logging
+import os
+import sys
 
 scripts_path = os.path.dirname(os.path.realpath(__file__))
-lib_path = scripts_path + '/lib'
-sys.path = sys.path + [lib_path]
+lib_path = os.path.join(scripts_path, 'lib')
+sys.path.append(lib_path)
+meta_lib_paths = glob.glob(scripts_path + '/*/lib', root_dir=scripts_path, recursive=True)
+for p in meta_lib_paths:
+    sys.path.append(p)
 import argparse_oe
 import scriptutils
 
-- 
2.43.0


