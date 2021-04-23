Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web12.64.1619200984502691361
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Apr 2021 11:03:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NAtc0HSX;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id z5so21883863edr.11
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Apr 2021 11:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7XkvpP1jlzHDfrtvWRZbbs57we05QsdHtJ3NQB0IZl4=;
        b=NAtc0HSXi/37osy8fPW99daXf4MLxmcpKvI6E0axQW9sDY9e/dPoadBd22CvrW4AKr
         cmMT5AG8WCCGOqgBCs+7cwt6Q0MV0wHFVg1GOB1SfV/h32eL2mFBh3dDGI4jRY+zzhF5
         DYh3jrqmpZ6QyAw5qbyX7HJIBq+fPlygDexds/i3eg6gOHHxoleWTf8BW7N2zgDlbIrJ
         4PkSvLoI4au/WDBmNagLTt2BrfsKiHY+daT7WW+d913/ooNcrniW1TAfKqitQokVbrDI
         nwpbpOHTaSoniE8MysysJ4hEAn4pTHqi+3Q6GudPxF3xdLBLnG2m5uh5KHKD1yobA72l
         xd8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7XkvpP1jlzHDfrtvWRZbbs57we05QsdHtJ3NQB0IZl4=;
        b=CnW4iWeqjsa1nyOvzN7ufQ/ZMFYYs+OZO1xdshKkbAyGQNHFXNhrr1dXpIcp2SpVSE
         EfCQy/eBLqSPxCqajOJ1sz3hGtZDI7l84m3spsQx9zCqdmXfwFfpRJsQhybxOKDsNJv6
         ETgDRmHhmyoEY38aml018UGXa4xFkzlDOihj3tVg0gxKH6mCgARCUqILxgF05i+1NlCw
         I6ce9MfZc9D9XoiYArSAJLjzMpCXj12cfwjHjc7h27c/MZ34+GbKFAUrXUKk1gHlA5Of
         G9AmrvPsElfQJks8tRD6c9ZbuzYa1FUtdQUSqyreUuSmaft8zYTLj+HACkYLnD+eATZG
         4oIg==
X-Gm-Message-State: AOAM530u3xQHi9IotgaLkj7RRb2nbdJAGCBaOxOykIrjgoa+ODRPkMW3
	9TmtJ2UANbWkN9O6vLJyWaG9PsY04dv2SQ==
X-Google-Smtp-Source: ABdhPJzyzQtwq2rIpgZWQYuNA7pObpzyt87oFiL6Z1pejp992NhjvsB1/1tRz/87AO3Sc4NaojvxUQ==
X-Received: by 2002:a05:6402:368:: with SMTP id s8mr5957035edw.183.1619200983082;
        Fri, 23 Apr 2021 11:03:03 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id z14sm5315849edc.62.2021.04.23.11.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 11:03:02 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 4/7] oeqa/selftest: transition to weston images
Date: Fri, 23 Apr 2021 20:02:51 +0200
Message-Id: <20210423180254.706537-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210423180254.706537-1-alex.kanavin@gmail.com>
References: <20210423180254.706537-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For readonly rootfs tests core-image-weston
is appended; everywhere else it replaces core-image-sato.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/lib/oeqa/selftest/cases/_sstatetests_noauto.py |  4 ++--
 meta/lib/oeqa/selftest/cases/buildoptions.py        |  4 ++--
 meta/lib/oeqa/selftest/cases/imagefeatures.py       |  6 +++---
 meta/lib/oeqa/selftest/cases/runtime_test.py        |  2 --
 meta/lib/oeqa/selftest/cases/sstatetests.py         | 10 +++++-----
 5 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/_sstatetests_noauto.py b/meta/lib/oeqa/selftest/cases/_sstatetests_noauto.py
index f7c356ad09..7ac03f0cec 100644
--- a/meta/lib/oeqa/selftest/cases/_sstatetests_noauto.py
+++ b/meta/lib/oeqa/selftest/cases/_sstatetests_noauto.py
@@ -90,7 +90,7 @@ class RebuildFromSState(SStateBase):
         self.assertFalse(failed_cleansstate, msg="The following recipes have failed cleansstate(all others have passed both cleansstate and rebuild from sstate tests): %s" % ' '.join(map(str, failed_cleansstate)))
 
     def test_sstate_relocation(self):
-        self.run_test_sstate_rebuild(['core-image-sato-sdk'], relocate=True, rebuild_dependencies=True)
+        self.run_test_sstate_rebuild(['core-image-weston-sdk'], relocate=True, rebuild_dependencies=True)
 
     def test_sstate_rebuild(self):
-        self.run_test_sstate_rebuild(['core-image-sato-sdk'], relocate=False, rebuild_dependencies=True)
+        self.run_test_sstate_rebuild(['core-image-weston-sdk'], relocate=False, rebuild_dependencies=True)
diff --git a/meta/lib/oeqa/selftest/cases/buildoptions.py b/meta/lib/oeqa/selftest/cases/buildoptions.py
index 1859d3222a..754b77defd 100644
--- a/meta/lib/oeqa/selftest/cases/buildoptions.py
+++ b/meta/lib/oeqa/selftest/cases/buildoptions.py
@@ -50,9 +50,9 @@ class ImageOptionsTests(OESelftestTestCase):
     def test_read_only_image(self):
         distro_features = get_bb_var('DISTRO_FEATURES')
         if not ('x11' in distro_features and 'opengl' in distro_features):
-            self.skipTest('core-image-sato requires x11 and opengl in distro features')
+            self.skipTest('core-image-sato/weston requires x11 and opengl in distro features')
         self.write_config('IMAGE_FEATURES += "read-only-rootfs"')
-        bitbake("core-image-sato")
+        bitbake("core-image-sato core-image-weston")
         # do_image will fail if there are any pending postinsts
 
 class DiskMonTest(OESelftestTestCase):
diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeqa/selftest/cases/imagefeatures.py
index 6723a8198f..5d4330b48f 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -240,8 +240,8 @@ USERADD_GID_TABLES += "files/static-group"
 
     def test_no_busybox_base_utils(self):
         config = """
-# Enable x11
-DISTRO_FEATURES_append += "x11"
+# Enable wayland
+DISTRO_FEATURES_append += "pam opengl wayland"
 
 # Switch to systemd
 DISTRO_FEATURES += "systemd"
@@ -262,7 +262,7 @@ PNBLACKLIST[busybox] = "Don't build this"
 """
         self.write_config(config)
 
-        bitbake("--graphviz core-image-sato")
+        bitbake("--graphviz core-image-weston")
 
     def test_image_gen_debugfs(self):
         """
diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index b20c5b427b..84c2cb77e8 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -128,7 +128,6 @@ class TestImage(OESelftestTestCase):
         features += 'TEST_SUITES = "ping ssh selftest"\n'
         self.write_config(features)
 
-        # Build core-image-sato and testimage
         bitbake('core-image-full-cmdline socat')
         bitbake('-c testimage core-image-full-cmdline')
 
@@ -164,7 +163,6 @@ class TestImage(OESelftestTestCase):
         features += 'PSEUDO_IGNORE_PATHS .= ",%s"\n' % self.gpg_home
         self.write_config(features)
 
-        # Build core-image-sato and testimage
         bitbake('core-image-full-cmdline socat')
         bitbake('-c testimage core-image-full-cmdline')
 
diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index c46e8ba489..9db2a0bb44 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -261,7 +261,7 @@ PACKAGE_CLASSES = "package_rpm package_ipk package_deb"
 BB_SIGNATURE_HANDLER = "OEBasicHash"
 """)
         self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash")
-        bitbake("core-image-sato -S none")
+        bitbake("core-image-weston -S none")
         self.write_config("""
 MACHINE = "qemux86"
 TMPDIR = "${TOPDIR}/tmp-sstatesamehash2"
@@ -273,12 +273,12 @@ PACKAGE_CLASSES = "package_rpm package_ipk package_deb"
 BB_SIGNATURE_HANDLER = "OEBasicHash"
 """)
         self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash2")
-        bitbake("core-image-sato -S none")
+        bitbake("core-image-weston -S none")
 
         def get_files(d):
             f = []
             for root, dirs, files in os.walk(d):
-                if "core-image-sato" in root:
+                if "core-image-weston" in root:
                     # SDKMACHINE changing will change
                     # do_rootfs/do_testimage/do_build stamps of images which
                     # is safe to ignore.
@@ -306,7 +306,7 @@ NATIVELSBSTRING = \"DistroA\"
 BB_SIGNATURE_HANDLER = "OEBasicHash"
 """)
         self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash")
-        bitbake("core-image-sato -S none")
+        bitbake("core-image-weston -S none")
         self.write_config("""
 TMPDIR = \"${TOPDIR}/tmp-sstatesamehash2\"
 TCLIBCAPPEND = \"\"
@@ -314,7 +314,7 @@ NATIVELSBSTRING = \"DistroB\"
 BB_SIGNATURE_HANDLER = "OEBasicHash"
 """)
         self.track_for_cleanup(self.topdir + "/tmp-sstatesamehash2")
-        bitbake("core-image-sato -S none")
+        bitbake("core-image-weston -S none")
 
         def get_files(d):
             f = []
-- 
2.30.2

