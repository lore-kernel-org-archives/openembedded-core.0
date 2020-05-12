Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web12.7879.1589296331590390574
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2020 08:12:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uN2kKD37;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id y16so8721386wrs.3
        for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2020 08:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uNNZrFZ+tO9vLV9nkYgOhH4N0A8b104ozlMKWCIaZ6w=;
        b=uN2kKD37xbQmR4bU7S4VVJSnDAlHnKqhBSSwE0BD5TdE9PFD74oilKp4o6Iu+1CbA3
         KxFl8rxpBswlwB/mFHjNzLFV/QYroED45pqg02cesppd79IrZWPQ2+Hys4K3sUCnqYeb
         07i3bEGkkQGR07fjwxGyFNPtChOakT26ufwQ6nADCFc0NUANqRwQuOKXBDKg1aWoi3U1
         tgfVhBTypTPdkDKRrRCHAuwacUkENcUARc2PXtJyOaLMRchPogWrELuxSWkXkCD+stUq
         4jGY/mWwfTJGJGU+d/CGZLI31ykWyhW9nH0ayWNJC6ub/we7euf6c8nRTzbpRTgB9/qa
         2uyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uNNZrFZ+tO9vLV9nkYgOhH4N0A8b104ozlMKWCIaZ6w=;
        b=mCjXNceucg2qGzub9LZ3yhwBfc1TucpyF3VZ3SO9FUh/+FJk5N2WQAoXTsZQ25GgTh
         mf5T8PiZrei5aN/IVsGPobkhmYlisApySNj667FtVyNFdzbkUeHW4PLkQVfWKHPoBhD3
         GlAK2TonGSFMt0PIVvBx+l/624eS1Hr+TdXl9L13quck6I6vJlKk3W0CzO5PSBmuiG0E
         3Jz3mZwMmEFuz0EBaem/cSquRFL2XIDNLQ0BVH0+6mrH3Udsiz0gWApIK2bM7qQ9EAHv
         BN5IjSAYdODBvDkP1fQvFXn6hTwbgQn5e8c/2gzUNgBE4X1nHTUi08dKV3q+Qu9I2iOu
         i8rw==
X-Gm-Message-State: AGi0PuZba8NCdLMVWjRA8hdYompJdHwQD2cjyfduqBuC2HY6ofNuhR+H
	KBFZbhJ+P+yzuTHMTwiRghvczzS1
X-Google-Smtp-Source: APiQypKFa3w2S2E13uw85GcZ12KQtIsj+BEv2cObelOxok3kVEeGqqGVKkqG4IQOs/4e0kZ3JLG9Ww==
X-Received: by 2002:a5d:6702:: with SMTP id o2mr19122047wru.231.1589296329691;
        Tue, 12 May 2020 08:12:09 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id y10sm20520193wrd.95.2020.05.12.08.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 08:12:09 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 3/3] qemu: enable virglrenderer and glx options subject to 'opengl' DISTRO_FEATURE
Date: Tue, 12 May 2020 17:11:25 +0200
Message-Id: <20200512151125.30472-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200512151125.30472-1-alex.kanavin@gmail.com>
References: <20200512151125.30472-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Note that to actually use accelerated GL passthrough, there are two options

1) a suitable frontend need to be also enabled - gtk+ and SDL both seem to work well.
Previously I struggled to make SDL work, but now it seems fine.

2) it is also possible to render off-screen with -display egl-headless option,
and see the output with a VNC viewer (for which, qemu needs to be started
with a VNC server):

$ runqemu kvm egl-headless publicvnc

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py   | 18 ++++++------------
 .../qemu/qemu-system-native_4.2.0.bb           |  4 +++-
 meta/recipes-devtools/qemu/qemu_4.2.0.bb       |  5 ++++-
 3 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 09d3de7aea..793c98a335 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -188,18 +188,14 @@ class TestImage(OESelftestTestCase):
             self.skipTest('virgl isn\'t working with Opensuse 15.0')
 
         qemu_packageconfig = get_bb_var('PACKAGECONFIG', 'qemu-system-native')
-        sdl_packageconfig = get_bb_var('PACKAGECONFIG', 'libsdl2-native')
+        qemu_distrofeatures = get_bb_var('DISTRO_FEATURES', 'qemu-system-native')
         features = 'INHERIT += "testimage"\n'
         if 'gtk+' not in qemu_packageconfig:
             features += 'PACKAGECONFIG_append_pn-qemu-system-native = " gtk+"\n'
         if 'sdl' not in qemu_packageconfig:
             features += 'PACKAGECONFIG_append_pn-qemu-system-native = " sdl"\n'
-        if 'virglrenderer' not in qemu_packageconfig:
-            features += 'PACKAGECONFIG_append_pn-qemu-system-native = " virglrenderer"\n'
-        if 'glx' not in qemu_packageconfig:
-            features += 'PACKAGECONFIG_append_pn-qemu-system-native = " glx"\n'
-        if 'opengl' not in sdl_packageconfig:
-            features += 'PACKAGECONFIG_append_pn-libsdl2-native = " opengl"\n'
+        if 'opengl' not in qemu_distrofeatures:
+            features += 'DISTRO_FEATURES_append = " opengl"\n'
         features += 'TEST_SUITES = "ping ssh virgl"\n'
         features += 'IMAGE_FEATURES_append = " ssh-server-dropbear"\n'
         features += 'IMAGE_INSTALL_append = " kmscube"\n'
@@ -231,12 +227,10 @@ class TestImage(OESelftestTestCase):
             dripath = subprocess.check_output("pkg-config --variable=dridriverdir dri", shell=True)
         except subprocess.CalledProcessError as e:
             self.skipTest("Could not determine the path to dri drivers on the host via pkg-config.\nPlease install Mesa development files (particularly, dri.pc) on the host machine.")
-        qemu_packageconfig = get_bb_var('PACKAGECONFIG', 'qemu-system-native')
+        qemu_distrofeatures = get_bb_var('DISTRO_FEATURES', 'qemu-system-native')
         features = 'INHERIT += "testimage"\n'
-        if 'virglrenderer' not in qemu_packageconfig:
-            features += 'PACKAGECONFIG_append_pn-qemu-system-native = " virglrenderer"\n'
-        if 'glx' not in qemu_packageconfig:
-            features += 'PACKAGECONFIG_append_pn-qemu-system-native = " glx"\n'
+        if 'opengl' not in qemu_distrofeatures:
+            features += 'DISTRO_FEATURES_append = " opengl"\n'
         features += 'TEST_SUITES = "ping ssh virgl"\n'
         features += 'IMAGE_FEATURES_append = " ssh-server-dropbear"\n'
         features += 'IMAGE_INSTALL_append = " kmscube"\n'
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_4.2.0.bb b/meta/recipes-devtools/qemu/qemu-system-native_4.2.0.bb
index d83ee59375..7394385d30 100644
--- a/meta/recipes-devtools/qemu/qemu-system-native_4.2.0.bb
+++ b/meta/recipes-devtools/qemu/qemu-system-native_4.2.0.bb
@@ -9,7 +9,9 @@ DEPENDS = "glib-2.0-native zlib-native pixman-native qemu-native bison-native"
 
 EXTRA_OECONF_append = " --target-list=${@get_qemu_system_target_list(d)}"
 
-PACKAGECONFIG ??= "fdt alsa kvm"
+PACKAGECONFIG ??= "fdt alsa kvm \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer glx', '' ,d)} \
+"
 
 # Handle distros such as CentOS 5 32-bit that do not have kvm support
 PACKAGECONFIG_remove = "${@'kvm' if not os.path.exists('/usr/include/linux/kvm.h') else ''}"
diff --git a/meta/recipes-devtools/qemu/qemu_4.2.0.bb b/meta/recipes-devtools/qemu/qemu_4.2.0.bb
index f0c1daabe1..a4018cc448 100644
--- a/meta/recipes-devtools/qemu/qemu_4.2.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_4.2.0.bb
@@ -21,5 +21,8 @@ do_install_append_class-nativesdk() {
 PACKAGECONFIG ??= " \
     fdt sdl kvm \
     ${@bb.utils.filter('DISTRO_FEATURES', 'alsa xen', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer glx', '' ,d)} \
+"
+PACKAGECONFIG_class-nativesdk ??= "fdt sdl kvm \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer glx', '' ,d)} \
 "
-PACKAGECONFIG_class-nativesdk ??= "fdt sdl kvm"
-- 
2.26.1

