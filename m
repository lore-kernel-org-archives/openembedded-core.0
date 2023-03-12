Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70C8DC6FA99
	for <webhook@archiver.kernel.org>; Sun, 12 Mar 2023 14:02:53 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.66968.1678629768606126945
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Mar 2023 07:02:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Vcn2Asv+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id j19-20020a05600c191300b003eb3e1eb0caso9201590wmq.1
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Mar 2023 07:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678629767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j90C4DpAIMyXit1hq2VseGhGXfY2cm2lYqnXra6DtV4=;
        b=Vcn2Asv+ek6+FCQO19rahDC+kHy6BlEfjWqvUV4owI+il7dELeD0zDE7SEGCZTwmhG
         1BSdpZSMPzLy3vlCGZ+UO++ArbywyOjs/d+KEqeNnh9BOlPxiLUnRXdCa0shep18rgmA
         R0HhXp581lndXUt3EoZd+I46lFhfeoH+tfwFo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678629767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j90C4DpAIMyXit1hq2VseGhGXfY2cm2lYqnXra6DtV4=;
        b=ZwX/x58B65cb11iYg7mkd48sBj2HBwQLSGNrVGwUEChIdwUJjcHahGv350MugOfwcB
         lwNU283k/o+08FT1Kl6fz4v6HOFj6qj54y+YZlmzf1HnS6sNb3fsodgJ8Drsdb+IMUAa
         gtPiOWuiHeSkXW55Pl6i8zD7z2WlkoyrcEX/kf18UiJ5tkSS1hYWtds5sCHoJDfA4v+p
         vOJIla41xoS/PBdobBVeZ/NjgMZwkz4OXhbFro/6KLz+S933/9xbIN6zq0D3VIZSnmLU
         QnPOkYWZlsNZpykOtPZII0tWoujFUlTt9mO0smuSIidjmUUcXjp6xnC3kZb3pXOB2HyY
         TT5g==
X-Gm-Message-State: AO0yUKXC40KTFhjUDecu8QUw1sLb4b5GeHeHy6xp/wsOqCzUAOrTmvYc
	++qrWlkO7EGACa19Sf3SyQ+XjvhFYtL/qg6iHZ8=
X-Google-Smtp-Source: AK7set83FpdbwTLMgYqVaprtuL50r73kUkl73INlvPX+D7gXKZpviy0MDvrCbE1edGyKWpZR1+eOag==
X-Received: by 2002:a05:600c:19d1:b0:3e2:dba:7155 with SMTP id u17-20020a05600c19d100b003e20dba7155mr7943723wmq.20.1678629766711;
        Sun, 12 Mar 2023 07:02:46 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ee:6264:1be3:a6af])
        by smtp.gmail.com with ESMTPSA id t21-20020a7bc3d5000000b003ed2384566fsm1312089wmj.21.2023.03.12.07.02.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 07:02:46 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] oeqa/selftest/sstate: Move common code to base class
Date: Sun, 12 Mar 2023 14:02:43 +0000
Message-Id: <20230312140244.3565436-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230312140244.3565436-1-richard.purdie@linuxfoundation.org>
References: <20230312140244.3565436-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Mar 2023 14:02:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178389

Move the other common shares test functions to the base class to
improve the code structure.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/sstatetests.py | 197 ++++++++++----------
 1 file changed, 98 insertions(+), 99 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index a6a688cc19d..aedc35c2626 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -71,47 +71,6 @@ class SStateBase(OESelftestTestCase):
                         result.append(f)
         return result
 
-
-class SStateTests(SStateBase):
-    def test_autorev_sstate_works(self):
-        # Test that a git repository which changes is correctly handled by SRCREV = ${AUTOREV}
-        # when PV does not contain SRCPV
-
-        tempdir = tempfile.mkdtemp(prefix='sstate_autorev')
-        tempdldir = tempfile.mkdtemp(prefix='sstate_autorev_dldir')
-        self.track_for_cleanup(tempdir)
-        self.track_for_cleanup(tempdldir)
-        create_temp_layer(tempdir, 'selftestrecipetool')
-        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % tempdir)
-        self.append_config("DL_DIR = \"%s\"" % tempdldir)
-        runCmd('bitbake-layers add-layer %s' % tempdir)
-
-        # Use dbus-wait as a local git repo we can add a commit between two builds in
-        pn = 'dbus-wait'
-        srcrev = '6cc6077a36fe2648a5f993fe7c16c9632f946517'
-        url = 'git://git.yoctoproject.org/dbus-wait'
-        result = runCmd('git clone %s noname' % url, cwd=tempdir)
-        srcdir = os.path.join(tempdir, 'noname')
-        result = runCmd('git reset --hard %s' % srcrev, cwd=srcdir)
-        self.assertTrue(os.path.isfile(os.path.join(srcdir, 'configure.ac')), 'Unable to find configure script in source directory')
-
-        recipefile = os.path.join(tempdir, "recipes-test", "dbus-wait-test", 'dbus-wait-test_git.bb')
-        os.makedirs(os.path.dirname(recipefile))
-        srcuri = 'git://' + srcdir + ';protocol=file;branch=master'
-        result = runCmd(['recipetool', 'create', '-o', recipefile, srcuri])
-        self.assertTrue(os.path.isfile(recipefile), 'recipetool did not create recipe file; output:\n%s' % result.output)
-
-        with open(recipefile, 'a') as f:
-            f.write('SRCREV = "${AUTOREV}"\n')
-            f.write('PV = "1.0"\n')
-
-        bitbake("dbus-wait-test -c fetch")
-        with open(os.path.join(srcdir, "bar.txt"), "w") as f:
-            f.write("foo")
-        result = runCmd('git add bar.txt; git commit -asm "add bar"', cwd=srcdir)
-        bitbake("dbus-wait-test -c unpack")
-
-
     # Test sstate files creation and their location
     def run_test_sstate_creation(self, targets, distro_specific=True, distro_nonspecific=True, temp_sstate_location=True, should_pass=True):
         self.config_sstate(temp_sstate_location, [self.sstate_path])
@@ -137,18 +96,6 @@ class SStateTests(SStateBase):
         else:
             self.assertTrue(not file_tracker , msg="Found sstate files in the wrong place for: %s (found %s)" % (', '.join(map(str, targets)), str(file_tracker)))
 
-    def test_sstate_creation_distro_specific_pass(self):
-        self.run_test_sstate_creation(['binutils-cross-'+ self.tune_arch, 'binutils-native'], distro_specific=True, distro_nonspecific=False, temp_sstate_location=True)
-
-    def test_sstate_creation_distro_specific_fail(self):
-        self.run_test_sstate_creation(['binutils-cross-'+ self.tune_arch, 'binutils-native'], distro_specific=False, distro_nonspecific=True, temp_sstate_location=True, should_pass=False)
-
-    def test_sstate_creation_distro_nonspecific_pass(self):
-        self.run_test_sstate_creation(['linux-libc-headers'], distro_specific=False, distro_nonspecific=True, temp_sstate_location=True)
-
-    def test_sstate_creation_distro_nonspecific_fail(self):
-        self.run_test_sstate_creation(['linux-libc-headers'], distro_specific=True, distro_nonspecific=False, temp_sstate_location=True, should_pass=False)
-
     # Test the sstate files deletion part of the do_cleansstate task
     def run_test_cleansstate_task(self, targets, distro_specific=True, distro_nonspecific=True, temp_sstate_location=True):
         self.config_sstate(temp_sstate_location, [self.sstate_path])
@@ -166,20 +113,6 @@ class SStateTests(SStateBase):
         archives_removed = self.search_sstate('|'.join(map(str, [s + r'.*?\.tar.zst$' for s in targets])), distro_specific, distro_nonspecific)
         self.assertTrue(not archives_removed, msg="do_cleansstate didn't remove .tar.zst sstate files for: %s (%s)" % (', '.join(map(str, targets)), str(archives_removed)))
 
-    def test_cleansstate_task_distro_specific_nonspecific(self):
-        targets = ['binutils-cross-'+ self.tune_arch, 'binutils-native']
-        targets.append('linux-libc-headers')
-        self.run_test_cleansstate_task(targets, distro_specific=True, distro_nonspecific=True, temp_sstate_location=True)
-
-    def test_cleansstate_task_distro_nonspecific(self):
-        self.run_test_cleansstate_task(['linux-libc-headers'], distro_specific=False, distro_nonspecific=True, temp_sstate_location=True)
-
-    def test_cleansstate_task_distro_specific(self):
-        targets = ['binutils-cross-'+ self.tune_arch, 'binutils-native']
-        targets.append('linux-libc-headers')
-        self.run_test_cleansstate_task(targets, distro_specific=True, distro_nonspecific=False, temp_sstate_location=True)
-
-
     # Test rebuilding of distro-specific sstate files
     def run_test_rebuild_distro_specific_sstate(self, targets, temp_sstate_location=True):
         self.config_sstate(temp_sstate_location, [self.sstate_path])
@@ -212,6 +145,104 @@ class SStateTests(SStateBase):
         created_once = [x for x in file_tracker_2 if x not in file_tracker_1]
         self.assertTrue(created_once == [], msg="The following sstate files were created only in the second run: %s" % ', '.join(map(str, created_once)))
 
+    def sstate_common_samesigs(self, configA, configB, allarch=False):
+
+        self.write_config(configA)
+        self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash")
+        bitbake("world meta-toolchain -S none")
+        self.write_config(configB)
+        self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash2")
+        bitbake("world meta-toolchain -S none")
+
+        def get_files(d, result):
+            for root, dirs, files in os.walk(d):
+                for name in files:
+                    if "meta-environment" in root or "cross-canadian" in root:
+                        continue
+                    if "do_build" not in name:
+                        # 1.4.1+gitAUTOINC+302fca9f4c-r0.do_package_write_ipk.sigdata.f3a2a38697da743f0dbed8b56aafcf79
+                        (_, task, _, shash) = name.rsplit(".", 3)
+                        result[os.path.join(os.path.basename(root), task)] = shash
+
+        files1 = {}
+        files2 = {}
+        subdirs = sorted(glob.glob(self.topdir + "/tmp-sstatesamehash/stamps/*-nativesdk*-linux"))
+        if allarch:
+            subdirs.extend(sorted(glob.glob(self.topdir + "/tmp-sstatesamehash/stamps/all-*-linux")))
+
+        for subdir in subdirs:
+            nativesdkdir = os.path.basename(subdir)
+            get_files(self.topdir + "/tmp-sstatesamehash/stamps/" + nativesdkdir, files1)
+            get_files(self.topdir + "/tmp-sstatesamehash2/stamps/" + nativesdkdir, files2)
+
+        self.maxDiff = None
+        self.assertEqual(files1, files2)
+
+class SStateTests(SStateBase):
+    def test_autorev_sstate_works(self):
+        # Test that a git repository which changes is correctly handled by SRCREV = ${AUTOREV}
+        # when PV does not contain SRCPV
+
+        tempdir = tempfile.mkdtemp(prefix='sstate_autorev')
+        tempdldir = tempfile.mkdtemp(prefix='sstate_autorev_dldir')
+        self.track_for_cleanup(tempdir)
+        self.track_for_cleanup(tempdldir)
+        create_temp_layer(tempdir, 'selftestrecipetool')
+        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % tempdir)
+        self.append_config("DL_DIR = \"%s\"" % tempdldir)
+        runCmd('bitbake-layers add-layer %s' % tempdir)
+
+        # Use dbus-wait as a local git repo we can add a commit between two builds in
+        pn = 'dbus-wait'
+        srcrev = '6cc6077a36fe2648a5f993fe7c16c9632f946517'
+        url = 'git://git.yoctoproject.org/dbus-wait'
+        result = runCmd('git clone %s noname' % url, cwd=tempdir)
+        srcdir = os.path.join(tempdir, 'noname')
+        result = runCmd('git reset --hard %s' % srcrev, cwd=srcdir)
+        self.assertTrue(os.path.isfile(os.path.join(srcdir, 'configure.ac')), 'Unable to find configure script in source directory')
+
+        recipefile = os.path.join(tempdir, "recipes-test", "dbus-wait-test", 'dbus-wait-test_git.bb')
+        os.makedirs(os.path.dirname(recipefile))
+        srcuri = 'git://' + srcdir + ';protocol=file;branch=master'
+        result = runCmd(['recipetool', 'create', '-o', recipefile, srcuri])
+        self.assertTrue(os.path.isfile(recipefile), 'recipetool did not create recipe file; output:\n%s' % result.output)
+
+        with open(recipefile, 'a') as f:
+            f.write('SRCREV = "${AUTOREV}"\n')
+            f.write('PV = "1.0"\n')
+
+        bitbake("dbus-wait-test -c fetch")
+        with open(os.path.join(srcdir, "bar.txt"), "w") as f:
+            f.write("foo")
+        result = runCmd('git add bar.txt; git commit -asm "add bar"', cwd=srcdir)
+        bitbake("dbus-wait-test -c unpack")
+
+    def test_sstate_creation_distro_specific_pass(self):
+        self.run_test_sstate_creation(['binutils-cross-'+ self.tune_arch, 'binutils-native'], distro_specific=True, distro_nonspecific=False, temp_sstate_location=True)
+
+    def test_sstate_creation_distro_specific_fail(self):
+        self.run_test_sstate_creation(['binutils-cross-'+ self.tune_arch, 'binutils-native'], distro_specific=False, distro_nonspecific=True, temp_sstate_location=True, should_pass=False)
+
+    def test_sstate_creation_distro_nonspecific_pass(self):
+        self.run_test_sstate_creation(['linux-libc-headers'], distro_specific=False, distro_nonspecific=True, temp_sstate_location=True)
+
+    def test_sstate_creation_distro_nonspecific_fail(self):
+        self.run_test_sstate_creation(['linux-libc-headers'], distro_specific=True, distro_nonspecific=False, temp_sstate_location=True, should_pass=False)
+
+    def test_cleansstate_task_distro_specific_nonspecific(self):
+        targets = ['binutils-cross-'+ self.tune_arch, 'binutils-native']
+        targets.append('linux-libc-headers')
+        self.run_test_cleansstate_task(targets, distro_specific=True, distro_nonspecific=True, temp_sstate_location=True)
+
+    def test_cleansstate_task_distro_nonspecific(self):
+        self.run_test_cleansstate_task(['linux-libc-headers'], distro_specific=False, distro_nonspecific=True, temp_sstate_location=True)
+
+    def test_cleansstate_task_distro_specific(self):
+        targets = ['binutils-cross-'+ self.tune_arch, 'binutils-native']
+        targets.append('linux-libc-headers')
+        self.run_test_cleansstate_task(targets, distro_specific=True, distro_nonspecific=False, temp_sstate_location=True)
+
+
     def test_rebuild_distro_specific_sstate_cross_native_targets(self):
         self.run_test_rebuild_distro_specific_sstate(['binutils-cross-' + self.tune_arch, 'binutils-native'], temp_sstate_location=True)
 
@@ -433,38 +464,6 @@ BB_SIGNATURE_HANDLER = "OEBasicHash"
 """
         self.sstate_common_samesigs(configA, configB)
 
-    def sstate_common_samesigs(self, configA, configB, allarch=False):
-
-        self.write_config(configA)
-        self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash")
-        bitbake("world meta-toolchain -S none")
-        self.write_config(configB)
-        self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash2")
-        bitbake("world meta-toolchain -S none")
-
-        def get_files(d, result):
-            for root, dirs, files in os.walk(d):
-                for name in files:
-                    if "meta-environment" in root or "cross-canadian" in root:
-                        continue
-                    if "do_build" not in name:
-                        # 1.4.1+gitAUTOINC+302fca9f4c-r0.do_package_write_ipk.sigdata.f3a2a38697da743f0dbed8b56aafcf79
-                        (_, task, _, shash) = name.rsplit(".", 3)
-                        result[os.path.join(os.path.basename(root), task)] = shash
-
-        files1 = {}
-        files2 = {}
-        subdirs = sorted(glob.glob(self.topdir + "/tmp-sstatesamehash/stamps/*-nativesdk*-linux"))
-        if allarch:
-            subdirs.extend(sorted(glob.glob(self.topdir + "/tmp-sstatesamehash/stamps/all-*-linux")))
-
-        for subdir in subdirs:
-            nativesdkdir = os.path.basename(subdir)
-            get_files(self.topdir + "/tmp-sstatesamehash/stamps/" + nativesdkdir, files1)
-            get_files(self.topdir + "/tmp-sstatesamehash2/stamps/" + nativesdkdir, files2)
-
-        self.maxDiff = None
-        self.assertEqual(files1, files2)
 
     def test_sstate_sametune_samesigs(self):
         """
-- 
2.38.1


