Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.5146.1588855626414014851
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2020 05:47:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VqGOG10j;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id v4so7399882wme.1
        for <openembedded-core@lists.openembedded.org>; Thu, 07 May 2020 05:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uNNZrFZ+tO9vLV9nkYgOhH4N0A8b104ozlMKWCIaZ6w=;
        b=VqGOG10jpV6oE2zyeClwYTNJ/6c0vzvH3gL5gO9xY/ybz3MIHNkAyQDUP3SUa97obO
         GzI3UEtaNAXbVRgDfixO7XcgN7V2xpWWJaXlIyPVb9yvFa0bVOumF2II+pdHzfOp9Iic
         wbsAjR0+p1WL1A/jUFY0MiEshlMfEl1hZOFGFe1n5G9vxgF5Tb8wdXSo+ctGVYbrkPMH
         JKD4lj1Wo7pcNA1R+K3SuEk/flbmAninEjZaEN6VGcHfZyd6arI769oQMAzJlZWTMw3n
         PJBYVrnE6DVNSluOc2aY85vfd7tzM2/af47e9gc7fPZUL61N/WNtkSZlzO2S16mjlZDE
         z8zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uNNZrFZ+tO9vLV9nkYgOhH4N0A8b104ozlMKWCIaZ6w=;
        b=qVDm0GaitWDr5oyWM6v0LrWRU5GJpaV7ADlSI397Cp17ePayRaDyDvEhQAqC1+Y2Gg
         xQHitLaBF64/rRDo1KIqkoOzOA87/i7+1L3wEEXMhK6SAu9vqDY8t2P0Y6wmnFM5DsVR
         PbSEk2C35zF4RlfTUm+bnF8OpbMfKw+Nw3CHCwLmsklFAPsyuSbCcgPZ116j9qq3XUFa
         qx1XLYQA5parO1kGCH94tBxWpFO73G9xp1AJldYJprJnQibx9zoq6CjZRZi4phsLi9FO
         urB6v+ZJrzFHWZh4HWufaucax+Ekj+VD5PsXzoGkbce393TNIH+CLlRXJBB1gVyz+GZy
         wb5A==
X-Gm-Message-State: AGi0PuYYyNZYpbxlap/hNq1I4Z1FX5oKgh/oWfAV1KKdEBxJ8XxSTT0b
	gUvYVM9q38JHzzZCllvTIC1e434x
X-Google-Smtp-Source: APiQypJtXDSCsQX+U/+GIaVrCkeZAni+cY85QzH75j2yBcAmRN5ox4SyUIpJwqDG2vTdM/Q5Lnxfrg==
X-Received: by 2002:a7b:c959:: with SMTP id i25mr10075375wml.20.1588855624746;
        Thu, 07 May 2020 05:47:04 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.box ([5.28.69.65])
        by smtp.gmail.com with ESMTPSA id g10sm7507650wrx.4.2020.05.07.05.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 05:47:04 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 3/3] qemu: enable virglrenderer and glx options subject to 'opengl' DISTRO_FEATURE
Date: Thu,  7 May 2020 14:46:33 +0200
Message-Id: <20200507124633.19377-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200507124633.19377-1-alex.kanavin@gmail.com>
References: <20200507124633.19377-1-alex.kanavin@gmail.com>
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

