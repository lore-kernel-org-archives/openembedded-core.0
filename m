Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web08.5913.1615541521232187125
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Mar 2021 01:32:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ob2wh8Lv;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id p8so52039650ejb.10
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Mar 2021 01:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F1ykJmTuYGkNDvGxuhp1XhMDhEHn+0r1ED3YOiUU3v8=;
        b=Ob2wh8Lv6N9ybelVZm6DBn13TESPdBLGTU10xH2GnWhR0eaA5HE3F3NvMnncXewWxG
         582u+my9cbkBuAkTal4qiIuIb+VNGLAI21QL00bZivGkPV8/sahBGo5QX5SAPNK3KtjF
         42S2gFf9yN+0i7qZIXGI2FcbPlHZAuJMoIV0x6nPZHi3gQJ+wNaVdU+gfHG1Og/Uygzk
         1xHKpqs6NjoQ12bBgboLDeaCrX3YLVsVOc/JDJ23vUANWtZJNCxqTBq9ETAZYy5pKDLi
         HskA2XojTJfZ9NqP1xiXjKuXreO7SMcnC6PrB4Q1IYBAreAyUXRD7pcLXMxOQ6U0jBi3
         rJgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F1ykJmTuYGkNDvGxuhp1XhMDhEHn+0r1ED3YOiUU3v8=;
        b=MyQXoZgPDLaH4hYFqqnPbdlVYVvGJxAxoAulwrJ+/24rieJxY+Jp6ZPkmu8BpTcncU
         7MIwCmLGmr3GDZ6/CZKXR2FZn7Ds4SX4HTwXBDStu7tFBIV6vacx2Q0oipzLeYLI+pmJ
         P82VPuWd1A8Sugapx7cIlhUw03to7yTqdya86a7iogoEwX0AHDNW+oklwzJv/b4CMV4q
         gse30XohhRu4oD8dgROqfPMeLk9GR0sJJRosbKVbg199OJbnTnmqmAboi0+DYUcr7+mx
         KPyGrVbqYIOBxare5kHAzc+3qnnFzbSjt7GHzFW7wBeRDCOWXQNiBie9xEp8gc5ihfga
         7owA==
X-Gm-Message-State: AOAM532vbcs9cIMBYsGyh8IZ8cTDv6CeiF8+tILUI6S/c58jAQBDC6dp
	ssJGaZ+kH77AGKhckTZK5CGmOyCJHCP3kg==
X-Google-Smtp-Source: ABdhPJwjtOOr86kO/t1KTP5Ffz9rWCP4SSc5iZkav5LHzpTI87X8lldx+YVxT62Ufbjpi2T6FzAibw==
X-Received: by 2002:a17:906:f953:: with SMTP id ld19mr7297642ejb.164.1615541519792;
        Fri, 12 Mar 2021 01:31:59 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id a9sm2635831edt.82.2021.03.12.01.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 01:31:59 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [RFC PATCH 4/7] oeqa/selftest: transition to weston images
Date: Fri, 12 Mar 2021 10:31:36 +0100
Message-Id: <20210312093139.318889-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210312093139.318889-1-alex.kanavin@gmail.com>
References: <20210312093139.318889-1-alex.kanavin@gmail.com>
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
index 20fe8ed8f6..c29af86c4b 100644
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
2.29.2

