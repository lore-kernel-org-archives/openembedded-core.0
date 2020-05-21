Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.10665.1590080455359930283
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2020 10:00:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=axf+kBHC;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id s19so7099994edt.12
        for <openembedded-core@lists.openembedded.org>; Thu, 21 May 2020 10:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=34Yts0HPa3i91rW0KaWtzECrh8aU3ZyLwbUgpK6hgko=;
        b=axf+kBHCY21gYauIipgcGgjCnYLSQyRDqFol+Dhub21J2Wu1yDsRE7BNLmEC6Z2GGB
         XMAsfvL/jLrJa+G6i9LvjuswRqiWOXopmloKh/EWXsVYZxJtjyO0ejddKw+nhfZmGomy
         LO7KRItwzkh1oWhg5XgXf7RkjcBLxm5ZQJCex6O+w2O6Np/dRaiRk0aEXXRtcLC+lx6F
         rkqz1qMTgIEQjvgIkVI0EWgV9mAitKi20z8cX+pnCViMuzJkZ0OwZv3gkgMviiMs4th4
         uylpGty9np95ZXKkacVaTV06jCf21Nx4w2aU0tlxZU1pADACwSwtbvL+tvOWIudEG28R
         eKtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=34Yts0HPa3i91rW0KaWtzECrh8aU3ZyLwbUgpK6hgko=;
        b=DHyVrzWNos8AAE40lk0dv6/rakdEuq11PJYFbjUvAWTN1PstbTYbo2ap4T0Qe2CP8/
         fKPlzQhM1BvswO2XMuoCYmoHzoMm+z77YlcN3CpNfROVA8uniudDxw/Vk4T05w0q49WQ
         dPLzQatyy4rFlaphJcQDAHloDfBtp0QGdPwb6KKrI3dwVrTx0JfVcZUDz5IDtRTA7C/Z
         rDpcajtkwD9HmyFQSKUrWdmF2/3Y2sPxXW2K/saXXSU4pYmGi2C8nl6XWSo17Qac77gK
         AvtzRx5hzhKahW/0HDhV51PR/aJlwHJFDAInL4QZHG3AsAgnwns28+hfbvIA/tloBooM
         8dvQ==
X-Gm-Message-State: AOAM532Pl6212x7o63cTloYFaYmV+VwXiXKwHCjy3lQi+JfIyEMDOLpD
	k6adoexfXky6z7bEJhCxJr+2v08m
X-Google-Smtp-Source: ABdhPJzR8bBwXE7/9ck32dX1nExACezERZtB3lEFkv8FjAv1EmDabaslXHhPX4jqwngQAy/TnJ6YSQ==
X-Received: by 2002:aa7:cb4f:: with SMTP id w15mr8407345edt.239.1590080453592;
        Thu, 21 May 2020 10:00:53 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id cz9sm4960252edb.18.2020.05.21.10.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 10:00:53 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 3/3] qemu: enable virglrenderer and glx options subject to 'opengl' DISTRO_FEATURE
Date: Thu, 21 May 2020 19:00:20 +0200
Message-Id: <20200521170020.4123-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200521170020.4123-1-alex.kanavin@gmail.com>
References: <20200521170020.4123-1-alex.kanavin@gmail.com>
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
2.26.2

