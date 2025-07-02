Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E92FC7EE30
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 07:25:42 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.18000.1751441139822013403
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jul 2025 00:25:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=z3CdaIGE;
 spf=pass (domain: linaro.org, ip: 209.85.208.181, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-32b43cce9efso33379691fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 00:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751441138; x=1752045938; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNG3Ac3P2BHd/fGDmW5fVDRaHT09pFE9RNLrpCEtV6Y=;
        b=z3CdaIGEs6LfonFMIY369up7J9kxe3nQQPrT02+NRVJ2PW7Rt1VHM2u3j8FjZKxaXa
         vsZKNFTjBS/UsSE3SMkv3rcYNWixPh2nfhlipXl7Cf11ThayNGLhJ0SqS8foWI/o5mC0
         ALzgttNWNmfq0OQpMCQ0miCZtZQlIX8VHIY8eqD8s1GDUiaeoqZ+ca9eWQZ0O+rbFnls
         RVCv6U7d/S494WWxYVhJRIgXjPGXXya4MEDVNW0ceyebKkU18gCto2Oqv3nZUpQXzQhL
         w2lR/szuyRJDDe5JwVtucRsqGpztIhsonsWRpGRCjB/oHrQT4yYAhGDOyOPOWL4eecVS
         2flw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751441138; x=1752045938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UNG3Ac3P2BHd/fGDmW5fVDRaHT09pFE9RNLrpCEtV6Y=;
        b=SwmGV1L7NiZXO9txdPzOQbE8WqXwbRBUMWEV2O3UmfdDEIannFqxXg9SEln/V4vnyf
         bliOAkqh8bizOmiwmbfilY6+id6uHZxA5N/pzfGm8Yk0ITDNCu3+mVPouUHRZq0jp5A5
         09YRaJketUq67dxvKRgF9OCfMwXQgRpuVuV5M0t9CLzPYo1U0cklJpTNP35G5Ddqr7i/
         XEbndppgORbxdp/GkD03S9JkoqlXpLkdd6b+P2baPHib9XGUcIfwO3HWHNiSiQ7tKpw4
         wnjEY5I6pDlPLddnC1TxWPJ6zELCj7bpNjb4eVG52Wggmntr0e7+kA9DXLg3eaP3SR8q
         xcMQ==
X-Gm-Message-State: AOJu0YxCSTa9uokgclBf2eUToX35oM4ZDQTMVsCKQPaY7mouvlvcewJo
	VBxJoD7pAcaSn2g39lYXpjDFc5tU3867IQek93hhkGT0HSPVdojsCZwHZO1uqEqJE2rsd+iu7p3
	YjECd
X-Gm-Gg: ASbGncupC/kY8euor7gQwcIC8Fu71/dGPOiFKREVoFh3A2BqdnHyGR+U8qr+SiqQf0J
	vMa8U7PPl3Vh52w9NuiwheNfMHbUBBrgbi3YqxmBGU+RoOmS9eTkj6nGDcl3/5cSC4OGSZnyaFM
	+GBL7c+Tsj6v75NSYxHPv7FZ7Xdsf9I7b5sAy/5NaBC7uCNMXitg7NPYk2gqeiubp38NnnwLg3M
	x5TYbjuS+jxYRjJYmT3vyt+w8R8HaD0v/9d9DRf4+aoIB76djDY3x/YbYHlFRyhbJKQ16OnGgIv
	Ve67H1z4xFKRekXIZyZsVyo3HmHpglCjd/G2oI4WgX34ymPWNaRSx4JryN2vxPuxkDbgWf+QBI8
	SoO8muVyzY1v/DLz65lxKXBCX19GxpNAGVrxwtD57eHf1mqVpkQ==
X-Google-Smtp-Source: AGHT+IFJCUqGOT3gZ16pH7T8D27cgwcbXAKkt9+5QaUmstYYO1+TLoBiHay69k+P0vj916lLNCIKtA==
X-Received: by 2002:a05:651c:227:b0:32a:7750:a0e1 with SMTP id 38308e7fff4ca-32e00059a40mr5751101fa.26.1751441137863;
        Wed, 02 Jul 2025 00:25:37 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2f0c7d7sm18781181fa.102.2025.07.02.00.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 00:25:37 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v3 3/5] testexport.bbclass oe-test: capture all tests and data from all layers
Date: Wed,  2 Jul 2025 10:25:14 +0300
Message-ID: <20250702072516.1075450-3-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250702072516.1075450-1-mikko.rapeli@linaro.org>
References: <20250702072516.1075450-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 07:25:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219791

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


