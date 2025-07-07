Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8806FC8303C
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 07:21:46 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.54250.1751872903827488368
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Jul 2025 00:21:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=xHYJh3aH;
 spf=pass (domain: linaro.org, ip: 209.85.167.45, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54d98aa5981so3657830e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Jul 2025 00:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751872902; x=1752477702; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4j11ies84bJxy8e2PRI3DCfL4TKiRsy5QXj/iArKo0U=;
        b=xHYJh3aH7PH+o9QgBzf7DGNdifDUODvaZPFh7slxck680VZxUYV300X7f0huW8DJWP
         JIq9vGxPTSCwlLaqZnBwT6XPCLK7GL4l6TBddP+amj2JhhAZqnX5bdUGnipX3Q6WgKqo
         +wnuQRy0Fy8Iu97Mn0eHnfRaR9ph0fi0ivkKnYCo/sI+/gjnNWRHxasxSc7Fv6+5teNF
         SQiE9c+ZRD+8TphvyidvSiUmpFACY1LJVXCZEYWA7iOJADnp20g4I349wtwtu09bSpu7
         tmV3XeyO1tGD++DVRpvat22qJDLmygtPQzz2Kn4WPdTvvtcXWrSjsY4gdAyFn5Pq5q1o
         /uHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751872902; x=1752477702;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4j11ies84bJxy8e2PRI3DCfL4TKiRsy5QXj/iArKo0U=;
        b=glfCGhmyR/FZ7n/4Z9bmYyjaSjyLSvWZYi38hzcCd3aDlml82YCDbeUG21d25ledNr
         oOGdsKy6Nkx1Ns3BfF+MUkM2/B3JqtH8qjeoDjeK0pV6vy4fAYi2XXDBTau5r08k/LPq
         kbHslIKmFiq088R7mEvqXE+04n6wnkL1m3IwdPsLy/n6cQe6p90Dffv4QSJygezP4bwU
         XVdtPGeAs43kWQg089FdR8Ze6pobMXxIv+yEpOm1rPrjsMPtj57sjTmJpUGJfMPqhvUa
         Hni7D9kVcA0pEcM1/FvBRGRk5adgj9sF7wGL+SYDDRrwt8YImadS6VUi1SafGD8hVH0X
         c2lg==
X-Gm-Message-State: AOJu0Yw13XiDimAu4yNiN0DWKXo0sahqxNOkTFVlTin0VI1/N093m5vv
	l3L6SU8IBWu2fYQ5igAxwhaJrkt02YuWW9s17J+jAhSn8WGjLeyHrafle3NWHUHJnEJ8XlnT+5K
	6qxKw
X-Gm-Gg: ASbGnctiLAh6EkeKsvkF5QIeo6t+tXUuNy/oITM4P2mnwTj2N7pFB95Kz74MpYJslYJ
	g3U0qoZZuwJIzBZn1NAxwt3WWDZXbDQUshm++SspXAebO6+Yn/8NASxMkqzjdsD2DcdlMvTIdeP
	X5acOZWSjDvjsRdkNlCI8ZKaiVYKY8f1ov0ttDHI8SZSjMZ53ImlpLpVFl/KWEFZU677sdRFWFf
	hXYynugAKnEVLQWY4bTu76FvsRWg+AtU/bz8GOMCNsJ87ABMjxx2w0bSSY8JOUEz1Xw1stD6yeR
	Y/4ERlXJshrRgJQdYbDkOLiTWxQ17w5mWEk164SSDBq14IK+Vy0pMpVDgV2/GcA9WhjX1KMc71h
	GW1H6sbXNZ63o3P+m10Fc9BESnpZlB8hu/a1/Ze0=
X-Google-Smtp-Source: AGHT+IGUkQUrbzcUjoNK0JU5ht5hBj/a6SVbo+XDga1zo4iqH2B2SP807alL1ccKomdVp72JrCrf5Q==
X-Received: by 2002:a05:6512:3e07:b0:54a:cc04:ea24 with SMTP id 2adb3069b0e04-557aaa5919cmr2717988e87.46.1751872901587;
        Mon, 07 Jul 2025 00:21:41 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384d077dsm1240962e87.251.2025.07.07.00.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:21:41 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v4] testexport.bbclass oe-test: capture all tests and data from all layers
Date: Mon,  7 Jul 2025 10:21:32 +0300
Message-ID: <20250707072132.14807-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Jul 2025 07:21:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219980

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

v4: dropped root_dir from python glob in oe-test since versions < 3.10 don't support it

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
index 55985b0b2453..3a00369e0196 100755
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
+meta_lib_paths = glob.glob(scripts_path + '/*/lib', recursive=True)
+for p in meta_lib_paths:
+    sys.path.append(p)
 import argparse_oe
 import scriptutils
 
-- 
2.43.0


