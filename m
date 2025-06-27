Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90A1EC7EE31
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 06:30:34 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web10.7431.1751005828607367881
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jun 2025 23:30:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=d6HToAyt;
 spf=pass (domain: linaro.org, ip: 209.85.167.52, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-553644b8f56so1693179e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 23:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751005827; x=1751610627; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Njpkw0p4Yv+Wq8ua1hEDkrILha1Qloz5kYUSLzIVQY=;
        b=d6HToAytU0To/J5qQBL6hvfN2peUZ5hZjQ0HM+8Exrgd2XWtZhsgQ04ogm2FvHVvdl
         wCSBPbZsQA7j0ilmkUNVEUgxvTAX841/9Cf/UWhAiFbpVMzz+FgfHMY1UDYw15NBIr7F
         AtP32jB/OxkPaji6MfPxTUR7xPB+Bo/mbAGKrix6ZnE6UOMVYJeeDLGly6ZwC72+twKi
         J2iYL7y2Yxx7reGBmnZkLhTwJJgZRAP7NHc/gzi4LjsYAEwCZ4i0WZvny4o0Xj/f99TC
         c6/yyhjgf3tRVVVOjY1FakLQpxwnC0yZdB1t0eyW5OQh/dOdVzUgC0KdcUb07qssjxRo
         E58Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751005827; x=1751610627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Njpkw0p4Yv+Wq8ua1hEDkrILha1Qloz5kYUSLzIVQY=;
        b=TCH2CviJjuPl528qXS2t2SqJLJKdiL9QmHGZvFgeO3FdK8/fci3DrCtsixwZWyKCgi
         YwnN8fgZll+iP2AILXQF1GC4ZvhJP6kiWb6jXasyVjjLy3lqgGi63kcmvtMMxEfW8a9h
         5vDbV7BT/S1lJ3fxmhQIzL12CgrRYmivPaM1Ad9YG+81Wolx72sp7TMH+Jqyc2Mvc/AY
         HGswe6OG4C/OxG9Wvy42lI0WWY5SQhJW2C2AWy/IWuTVQBD6OREkxlZFQJ9/x7SLorNa
         u7IUfELfTWnCmlmipR7Lxwd/2SdaCgUFHtclhLulGnwa1A+cisgNUaw4Rrx1tzgO3CBW
         CyjA==
X-Gm-Message-State: AOJu0YzTznvBehSchCXO+gxEe7r5Ot+8XnOBOt5hzp9iOBJQgxJeDAW8
	IKnPP0Hy2nSP/D91TkXBgGgKaDWzODo+4bFhJ27rlg88w2fs5TzZCbJuxjV8IivjzN4hx8p599y
	LnjHtCRg=
X-Gm-Gg: ASbGnctSGbSBqOoMRHI9YkaClaRkNW8wzvXxD1hurGl2samMIX/FP7I2PnaYynHShYo
	ja3qwgT6zTE2XsAgLjvQBmp5V+8n/MC2tmxaMRaOLOuH1UmzdzNl4NEdyY5iLfStu3T6FmDV+Ay
	Ebmu0DZUSrNAfZfHznKr0fRQD7gZdtIzV5uEPKxQcZ6SIOjHoEXoHBer319gazlufAVt8olnOeF
	h3m2LHOBtlg9oUsSuUQrBb2aGcSW1qsZ8mPYEnJdfP8AjhaK4/Btzff9//sWJwe3R3thOgT/tie
	fqRokBlk0BOA4bG9l8BTjTw4VvRY3bwIUWeozh/5/XA9LAFiWm4D6xAIbEgkRrGRImC1B020Ydl
	FG40ybbaWF3WXRja074PkLj1u1w/ntpULd3mgfTI=
X-Google-Smtp-Source: AGHT+IE/YGNWUQNenTxmjfnZ2SyuAdENJLpugXTEQFTj4HMak+82W61P8SdnYoVefsPvTHklwYpzmg==
X-Received: by 2002:a05:6512:638b:10b0:554:f76a:bab1 with SMTP id 2adb3069b0e04-5550b79bd37mr497845e87.0.1751005826649;
        Thu, 26 Jun 2025 23:30:26 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2a740csm318916e87.89.2025.06.26.23.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 23:30:26 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 5/6] testexport.bbclass oe-test: capture tests and data from all layers
Date: Fri, 27 Jun 2025 09:30:03 +0300
Message-ID: <20250627063004.781560-5-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250627063004.781560-1-mikko.rapeli@linaro.org>
References: <20250627063004.781560-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 06:30:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219381

testexport.bbclass only copied files from core layer to
the testexport.tar.gz to run tests. Then it removed
all tests and files which were not specified in
TEST_SUITES variable.

Stop removing files to include for example parselogs.py
test data files which are machine and/or layer specific.
TEST_SUITES variable is now read from build time exported
data store when running tests.

Then copy oeqa runtime files from all layers so that tests and
test data like parselogs ignore files will be provided
to testexport.tar.gz.

Adapt oe-test script to find "lib" directories from
the new structure with layer specific paths.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/classes-recipe/testexport.bbclass | 43 +++++++++++++-------------
 scripts/oe-test                        | 12 ++++---
 2 files changed, 30 insertions(+), 25 deletions(-)

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


