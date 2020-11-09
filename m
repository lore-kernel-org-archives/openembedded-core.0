Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web10.8643.1604910708099220769
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2020 00:31:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KVovWV24;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id q3so7773995edr.12
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2020 00:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dn08BcinNauKloQA+vCAnTIne6hR8GGUTe9Zv6olflk=;
        b=KVovWV24BsINyQQWAmpVqRrFH3Puf1OOJndR9YKrGfvEKk/OcThn4sGs1Cm+oHf5VL
         H3Np6sTAzQPTWZuqJ0cEhi82gCA47sbqc5HMUDKgd8IGFD/oLTyR8o6WLS7gaWvFlNhe
         brWdLhh4k6SPMs7IPdSPrpdsA/SGi7MTXKP+ZotM5XeQTVw90CZCaF2OYNzzQKeseeIU
         De0iWsfn3zs4kWZbEmc7NMNO0H2DEbg2I5jFwWeYq9IL0CFTodNIGDR7jmEpbKsG6BD8
         INVaKbNmQa54NleakucOsVp9DnA4IlOt5OeUOwAFbiQwqH4yaROhetdxk3Lk9KCPivX9
         gsKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dn08BcinNauKloQA+vCAnTIne6hR8GGUTe9Zv6olflk=;
        b=Bqqzzzr1qSosojy6YYF3Hi6/xRwzQPjrp2yHEOjU7MpYaB6R9OfvK0iGZWc6R0ihcW
         /gMPwpVTREpv195e8XFsPQ0vhu1m+aB+fTm+U5P/cv/uFzOCBT5GORzXHpFIMBA8XR7S
         p4tSgGTp9aSgiv3JT8odEtMxMyrzcKIUzJK5u6k+EFeWsqEm4f1Sk5qKhblwpilFVIAz
         kC8s9PYP1YlW57hTyZTWvYn4i0ujn/71o8uT/qBKcK+d7ce/p9s/JMf4aZ7huBO3o2Sf
         Mm6cPbc2YZu2z64+oXMNx/ZfK3BDG8nB+XaMDfB6P0ncpUPRHzvcNO6LLTu7NLBNcckM
         ytcw==
X-Gm-Message-State: AOAM531dzna7Wqk7TRwbB4NM2m2KJDB28xmLRh1MB141CIPnVH05N8e9
	Ln1MMunZiBbDfK6ii6bZSHwaS7rrkJ58Mw==
X-Google-Smtp-Source: ABdhPJxw7v2OnwwjQXOUzgHae3mBEoujgl81rQYz4QbQy7jXVT3CzyjCyKhk9B/zRgTprQQffPWt7g==
X-Received: by 2002:aa7:d64b:: with SMTP id v11mr14138460edr.253.1604910706236;
        Mon, 09 Nov 2020 00:31:46 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id sa23sm8187691ejb.80.2020.11.09.00.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 00:31:45 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [RFC PATCH 04/12] oeqa/selftest: transition to weston images
Date: Mon,  9 Nov 2020 09:31:25 +0100
Message-Id: <20201109083133.16503-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.1
In-Reply-To: <20201109083133.16503-1-alex.kanavin@gmail.com>
References: <20201109083133.16503-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For readonly rootfs and reproducibility tests core-image-weston
is appended; everywhere else it replaces core-image-sato.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/lib/oeqa/selftest/cases/_sstatetests_noauto.py |  4 ++--
 meta/lib/oeqa/selftest/cases/buildoptions.py        |  4 ++--
 meta/lib/oeqa/selftest/cases/imagefeatures.py       |  6 +++---
 meta/lib/oeqa/selftest/cases/reproducible.py        |  2 +-
 meta/lib/oeqa/selftest/cases/runtime_test.py        |  2 --
 meta/lib/oeqa/selftest/cases/sstatetests.py         | 10 +++++-----
 6 files changed, 13 insertions(+), 15 deletions(-)

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
index e91f0bd18f..fef1250ba5 100644
--- a/meta/lib/oeqa/selftest/cases/buildoptions.py
+++ b/meta/lib/oeqa/selftest/cases/buildoptions.py
@@ -49,9 +49,9 @@ class ImageOptionsTests(OESelftestTestCase):
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
index 415e0315fc..c23d648fa4 100644
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
 
     def test_fit_image(self):
         """
diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index a7ef336143..2b48791634 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -105,7 +105,7 @@ class DiffoscopeTests(OESelftestTestCase):
 
 class ReproducibleTests(OESelftestTestCase):
     package_classes = ['deb', 'ipk']
-    images = ['core-image-minimal', 'core-image-sato', 'core-image-full-cmdline']
+    images = ['core-image-minimal', 'core-image-sato', 'core-image-weston', 'core-image-full-cmdline']
     save_results = False
     if 'OEQA_DEBUGGING_SAVED_OUTPUT' in os.environ:
         save_results = os.environ['OEQA_DEBUGGING_SAVED_OUTPUT']
diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 1bb1c4bee4..48d9ca9466 100644
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
2.29.1

