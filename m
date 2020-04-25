Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.1105.1587841252601695891
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Apr 2020 12:00:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=DB8S79TA;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id k1so15653085wrx.4
        for <openembedded-core@lists.openembedded.org>; Sat, 25 Apr 2020 12:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=PTy8il0i2O1CAK5qbE9Kyp6FRy1plhSwvKlOHqCDYog=;
        b=DB8S79TAYhZBC5liC/65xnY7g5TIvyzNW8xBKcQ7OzOqgq9O4oJfEVi3q1tTeQVvK4
         POkmsxuro89ESAD5S8KveEpjftpFg2AjQ5hR0ByG74zRzvUW7Xtg0BdQP7GK/KAoQbt/
         Xj4ohm3zOszw/Ef4QNCs/iIimZcm/dmu/S/1mj4Dd28SbCL16JkU4Qnmw5UTv7kzBrcM
         CCewv2uc2sJZ/U0YUguy7xRFlS9PPoxBMU8VRI5N+BGIg1K+l1hIgy5Gw/6JfiU+1i5i
         yVdrXo9Siq606VqSs30HRlWZ6wGNJb19YW+NmUID/U0p7T1KNh4ofJkO3Cf2f4DpDWfV
         0sfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PTy8il0i2O1CAK5qbE9Kyp6FRy1plhSwvKlOHqCDYog=;
        b=Fzfz2jyYMvMmtWtZQx6OLPKDuzfSJPpRjJFGEVGcyxZ9wt04tj9wGQvcb+xeQHFzza
         9NHet+BZwsmiW8TprQUYRany6SAAZiD+gAF8ylmGmpoVYXqLH/TFeQ4fZzB/M7p3urRg
         ASoYfJz0MEZDq5Kj19jgaEg/TPrubGzaCHLqMMUWSEp6E04+V9bKCfEf0tq5o5a+h4bT
         sBOPGP5ZiuLrjIY0lMK2IsDI87G4tmitqgQgpcgZpgjorNMenClu7oGP7LNsdrAYKYa4
         hm1Ws2nRHwlYBRgul0NHwQ4Rpr3VRizRgRhyDv631xoJ9hD8YjAZ8WiFfNYHlBwBZBA4
         25Pw==
X-Gm-Message-State: AGi0Pua176ILOJYHQssmhaDzpLE36JhA7KPF8evLa4IvGP9gNZ4zMNNN
	OTjajn534vIXfo28AXJ6QS5zRADZ
X-Google-Smtp-Source: APiQypKXRule+97e4YhUCFRaqqmgoAR6GEdjLYdf099twihaCyuWV8bTSu8lev7sdl+yUimLObUNkQ==
X-Received: by 2002:a5d:420a:: with SMTP id n10mr17526362wrq.235.1587841250890;
        Sat, 25 Apr 2020 12:00:50 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id n25sm3494135wmk.9.2020.04.25.12.00.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2020 12:00:50 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] qemu: enable virglrenderer and glx options subject to 'opengl' DISTRO_FEATURE
Date: Sat, 25 Apr 2020 21:00:18 +0200
Message-Id: <39856e11e454bf7c82ec7863f710a0712e57d781.1587841042.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <cover.1587841042.git.alex.kanavin@gmail.com>
References: <cover.1587841042.git.alex.kanavin@gmail.com>
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
index 60cb2e01a6..9b87c04e24 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -186,18 +186,14 @@ class TestImage(OESelftestTestCase):
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
@@ -229,12 +225,10 @@ class TestImage(OESelftestTestCase):
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

