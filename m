Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A313C6FD19
	for <webhook@archiver.kernel.org>; Sun, 12 Mar 2023 14:02:53 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.66966.1678629767983338972
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Mar 2023 07:02:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RyuhlW/l;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id x22so815177wmj.3
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Mar 2023 07:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678629766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/2Bg2hj+Ft0G4/5uH0yUj+xyMAKYXFTfiEYnhPPdkTQ=;
        b=RyuhlW/lXHXN9xnK+K5z/dqkHCm731HMwJWOgAwG+rwa+5JDD+yfzNdyPewv1hvphE
         eyFu8gQcnX68zmN0tXrrJO3NaueEhzlbKYtFzC8y/rEFabVOqocM86JWYbu7ZUWDzeDr
         QPMKimakgreuqsjnSh+DYLagUgCBOL4wZ9/1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678629766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/2Bg2hj+Ft0G4/5uH0yUj+xyMAKYXFTfiEYnhPPdkTQ=;
        b=OtcHfVJB+Okfzzd2vZwl1+/b4Btna2HpjTfC3B1SY45r7VfM+u6OrFQkMqxbBQ3Ya4
         3zlUZ3jtOn0yhbgYQi/fq1hhqsuK26SA8GI5ZQkiozNOpiTS8Oo5Mz8ZVKYLgAIj519E
         UyHpdT34W8aNZS0r4uTFUbCQKyuxLZLV9V690M8e8WGGu/KHQGUKjaK67lMARPYfPc45
         UrNJqVR3ngtgOzaVlSyd2zahqyS+mRRtKOW0oseVvdFvxU3oZpoGq9iVDnyj4gcQ9bVr
         eiNYcnNFof33ed2qi5O+EsxktwvyH/uGvJjiPyukWYnylIEBPEvphr5zFImBUbMDUXZA
         MOWg==
X-Gm-Message-State: AO0yUKXb89fBvqYe1Gy/Ihqgbrqlo+2JDv1N5KQX/2E1K2HS3J9U05Sz
	1jkRZI323zFoG49CBgT5DKg0deZIDQelFI91NCE=
X-Google-Smtp-Source: AK7set9T5shUVl+PgFhIBTIgmW3P2QLEPU5dB6U+Uqfb2Vvknwq3RCZOxX692Fb94mPdi6PLlc8znw==
X-Received: by 2002:a05:600c:4e8e:b0:3e0:1a9:b1d7 with SMTP id f14-20020a05600c4e8e00b003e001a9b1d7mr8451785wmq.19.1678629766039;
        Sun, 12 Mar 2023 07:02:46 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ee:6264:1be3:a6af])
        by smtp.gmail.com with ESMTPSA id t21-20020a7bc3d5000000b003ed2384566fsm1312089wmj.21.2023.03.12.07.02.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 07:02:45 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] oeqa/selftest/sstate: Merge sstate test class with tests themselves
Date: Sun, 12 Mar 2023 14:02:42 +0000
Message-Id: <20230312140244.3565436-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Mar 2023 14:02:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178388

Having this base class as a separate file is just confusing. Merge with
the rest of the test code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../selftest/cases/_sstatetests_noauto.py     |  2 +-
 meta/lib/oeqa/selftest/cases/sstate.py        | 66 -------------------
 meta/lib/oeqa/selftest/cases/sstatetests.py   | 62 ++++++++++++++++-
 3 files changed, 60 insertions(+), 70 deletions(-)
 delete mode 100644 meta/lib/oeqa/selftest/cases/sstate.py

diff --git a/meta/lib/oeqa/selftest/cases/_sstatetests_noauto.py b/meta/lib/oeqa/selftest/cases/_sstatetests_noauto.py
index 5f1c8df2d49..2c9584d3291 100644
--- a/meta/lib/oeqa/selftest/cases/_sstatetests_noauto.py
+++ b/meta/lib/oeqa/selftest/cases/_sstatetests_noauto.py
@@ -9,7 +9,7 @@ import shutil
 
 import oeqa.utils.ftools as ftools
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var
-from oeqa.selftest.cases.sstate import SStateBase
+from oeqa.selftest.cases.sstatetests import SStateBase
 
 
 class RebuildFromSState(SStateBase):
diff --git a/meta/lib/oeqa/selftest/cases/sstate.py b/meta/lib/oeqa/selftest/cases/sstate.py
deleted file mode 100644
index e73bb948841..00000000000
--- a/meta/lib/oeqa/selftest/cases/sstate.py
+++ /dev/null
@@ -1,66 +0,0 @@
-#
-# Copyright OpenEmbedded Contributors
-#
-# SPDX-License-Identifier: MIT
-#
-
-import datetime
-import os
-import re
-
-from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import get_bb_vars
-
-
-class SStateBase(OESelftestTestCase):
-
-    def setUpLocal(self):
-        super(SStateBase, self).setUpLocal()
-        self.temp_sstate_location = None
-        needed_vars = ['SSTATE_DIR', 'NATIVELSBSTRING', 'TCLIBC', 'TUNE_ARCH',
-                       'TOPDIR', 'TARGET_VENDOR', 'TARGET_OS']
-        bb_vars = get_bb_vars(needed_vars)
-        self.sstate_path = bb_vars['SSTATE_DIR']
-        self.hostdistro = bb_vars['NATIVELSBSTRING']
-        self.tclibc = bb_vars['TCLIBC']
-        self.tune_arch = bb_vars['TUNE_ARCH']
-        self.topdir = bb_vars['TOPDIR']
-        self.target_vendor = bb_vars['TARGET_VENDOR']
-        self.target_os = bb_vars['TARGET_OS']
-        self.distro_specific_sstate = os.path.join(self.sstate_path, self.hostdistro)
-
-    # Creates a special sstate configuration with the option to add sstate mirrors
-    def config_sstate(self, temp_sstate_location=False, add_local_mirrors=[]):
-        self.temp_sstate_location = temp_sstate_location
-
-        if self.temp_sstate_location:
-            temp_sstate_path = os.path.join(self.builddir, "temp_sstate_%s" % datetime.datetime.now().strftime('%Y%m%d%H%M%S'))
-            config_temp_sstate = "SSTATE_DIR = \"%s\"" % temp_sstate_path
-            self.append_config(config_temp_sstate)
-            self.track_for_cleanup(temp_sstate_path)
-        bb_vars = get_bb_vars(['SSTATE_DIR', 'NATIVELSBSTRING'])
-        self.sstate_path = bb_vars['SSTATE_DIR']
-        self.hostdistro = bb_vars['NATIVELSBSTRING']
-        self.distro_specific_sstate = os.path.join(self.sstate_path, self.hostdistro)
-
-        if add_local_mirrors:
-            config_set_sstate_if_not_set = 'SSTATE_MIRRORS ?= ""'
-            self.append_config(config_set_sstate_if_not_set)
-            for local_mirror in add_local_mirrors:
-                self.assertFalse(os.path.join(local_mirror) == os.path.join(self.sstate_path), msg='Cannot add the current sstate path as a sstate mirror')
-                config_sstate_mirror = "SSTATE_MIRRORS += \"file://.* file:///%s/PATH\"" % local_mirror
-                self.append_config(config_sstate_mirror)
-
-    # Returns a list containing sstate files
-    def search_sstate(self, filename_regex, distro_specific=True, distro_nonspecific=True):
-        result = []
-        for root, dirs, files in os.walk(self.sstate_path):
-            if distro_specific and re.search(r"%s/%s/[a-z0-9]{2}/[a-z0-9]{2}$" % (self.sstate_path, self.hostdistro), root):
-                for f in files:
-                    if re.search(filename_regex, f):
-                        result.append(f)
-            if distro_nonspecific and re.search(r"%s/[a-z0-9]{2}/[a-z0-9]{2}$" % self.sstate_path, root):
-                for f in files:
-                    if re.search(filename_regex, f):
-                        result.append(f)
-        return result
diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index ae766f91bd8..a6a688cc19d 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -9,13 +9,69 @@ import shutil
 import glob
 import subprocess
 import tempfile
+import datetime
+import re
 
-from oeqa.utils.commands import runCmd, bitbake, get_bb_var, create_temp_layer
-from oeqa.selftest.cases.sstate import SStateBase
-import oe
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var, create_temp_layer, get_bb_vars
+from oeqa.selftest.case import OESelftestTestCase
 
+import oe
 import bb.siggen
 
+class SStateBase(OESelftestTestCase):
+
+    def setUpLocal(self):
+        super(SStateBase, self).setUpLocal()
+        self.temp_sstate_location = None
+        needed_vars = ['SSTATE_DIR', 'NATIVELSBSTRING', 'TCLIBC', 'TUNE_ARCH',
+                       'TOPDIR', 'TARGET_VENDOR', 'TARGET_OS']
+        bb_vars = get_bb_vars(needed_vars)
+        self.sstate_path = bb_vars['SSTATE_DIR']
+        self.hostdistro = bb_vars['NATIVELSBSTRING']
+        self.tclibc = bb_vars['TCLIBC']
+        self.tune_arch = bb_vars['TUNE_ARCH']
+        self.topdir = bb_vars['TOPDIR']
+        self.target_vendor = bb_vars['TARGET_VENDOR']
+        self.target_os = bb_vars['TARGET_OS']
+        self.distro_specific_sstate = os.path.join(self.sstate_path, self.hostdistro)
+
+    # Creates a special sstate configuration with the option to add sstate mirrors
+    def config_sstate(self, temp_sstate_location=False, add_local_mirrors=[]):
+        self.temp_sstate_location = temp_sstate_location
+
+        if self.temp_sstate_location:
+            temp_sstate_path = os.path.join(self.builddir, "temp_sstate_%s" % datetime.datetime.now().strftime('%Y%m%d%H%M%S'))
+            config_temp_sstate = "SSTATE_DIR = \"%s\"" % temp_sstate_path
+            self.append_config(config_temp_sstate)
+            self.track_for_cleanup(temp_sstate_path)
+        bb_vars = get_bb_vars(['SSTATE_DIR', 'NATIVELSBSTRING'])
+        self.sstate_path = bb_vars['SSTATE_DIR']
+        self.hostdistro = bb_vars['NATIVELSBSTRING']
+        self.distro_specific_sstate = os.path.join(self.sstate_path, self.hostdistro)
+
+        if add_local_mirrors:
+            config_set_sstate_if_not_set = 'SSTATE_MIRRORS ?= ""'
+            self.append_config(config_set_sstate_if_not_set)
+            for local_mirror in add_local_mirrors:
+                self.assertFalse(os.path.join(local_mirror) == os.path.join(self.sstate_path), msg='Cannot add the current sstate path as a sstate mirror')
+                config_sstate_mirror = "SSTATE_MIRRORS += \"file://.* file:///%s/PATH\"" % local_mirror
+                self.append_config(config_sstate_mirror)
+
+    # Returns a list containing sstate files
+    def search_sstate(self, filename_regex, distro_specific=True, distro_nonspecific=True):
+        result = []
+        for root, dirs, files in os.walk(self.sstate_path):
+            if distro_specific and re.search(r"%s/%s/[a-z0-9]{2}/[a-z0-9]{2}$" % (self.sstate_path, self.hostdistro), root):
+                for f in files:
+                    if re.search(filename_regex, f):
+                        result.append(f)
+            if distro_nonspecific and re.search(r"%s/[a-z0-9]{2}/[a-z0-9]{2}$" % self.sstate_path, root):
+                for f in files:
+                    if re.search(filename_regex, f):
+                        result.append(f)
+        return result
+
+
 class SStateTests(SStateBase):
     def test_autorev_sstate_works(self):
         # Test that a git repository which changes is correctly handled by SRCREV = ${AUTOREV}
-- 
2.38.1


