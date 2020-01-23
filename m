Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 8C91B7FDDA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 15:38:02 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id g17so3595858wro.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 07:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=vYIvODBH1RjeN0Ri/vELtpPm2ZBUkjlYlAYClpmR++s=;
	b=egBEp9EGDTIxFB7QhicRn6m3OC94+u+7XFKHhlxTtqEV5etjQhJww0+YzoM9a/Aamm
	zJjyLYsCfoIQU8Hczizm2trDwGRAvq2kAEM9aSjIsBa2GWEKl8fZvuTOcGEG7bHHFwrt
	ObUqEaqw52m4HKbjuPkVPNhmqiBqsHfdJYKithd81uzd/4xXEH4pARiOQ7ZWolPmLNsr
	Je5cn290huwOEL41XpRZH2gydPMbKBBLH5ZE6kxr0IuoBbH7/9uY0s1uNQNNVBsFwOJP
	EdQm1yuHPTWhM3rSfx/Fz1Ko6uuIJoIwhzB4qnJb2j7J8b0BGmEjE0VOKACyVrjVjNTt
	uTCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=vYIvODBH1RjeN0Ri/vELtpPm2ZBUkjlYlAYClpmR++s=;
	b=LenJL0KEXk0BpV5u2NW+U8bzhXD9piQupwYkyBZeppNjtci4Aub9WCpvv/Te6E2kmK
	CQPCAksanGyN5RPX6YNJ+7FYzzlOCv8jZV94Fr+YqhsiNP02u997ohHsQghyheHuXYB5
	N1H6wVxJNdqJBF/uytW+LuQLWnlnBFO7pys/aqvbppYuqOzWajQ0LzuVVCKmZwKdQdmV
	U352dEPPXFHv+lV22oXEgRwBNYu24w+yN/aqeQ4+2vEMtkix1hSz6Eewd0IiQU+2AJ9d
	cAvxjwzAd2UrUvph9LPBPFjzJSlBLd02jbqvbRkKO28tdlLqOP1tCIgBEZy8oxY17u/O
	ciEA==
X-Gm-Message-State: APjAAAVVjM+JphVXiSpePQq3UHjzxYYbj6TqVycrP8yVsC1y34HBLIw5
	c1jT8xX010e37WkuIS3ij5b3Eyvz
X-Google-Smtp-Source: APXvYqy1CGjy3tnWbvazcToFLKpM9kZrtRtw5PKvD/l6cixEp22GNKk6PVigZmWbEFLvdxokCKhhGA==
X-Received: by 2002:adf:d848:: with SMTP id k8mr17442609wrl.328.1579793883049; 
	Thu, 23 Jan 2020 07:38:03 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	t25sm3152466wmj.19.2020.01.23.07.38.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 23 Jan 2020 07:38:02 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jan 2020 16:37:55 +0100
Message-Id: <c5c2024bfde61542f23217c9aafb2cb9966013b6.1579793597.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579793597.git.alex.kanavin@gmail.com>
References: <cover.1579793597.git.alex.kanavin@gmail.com>
Subject: [PATCH 3/3] qemu: enable virglrenderer and glx options subject to 'opengl' DISTRO_FEATURE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Jan 2020 15:38:02 -0000

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
 .../qemu/qemu-system-native_4.1.0.bb           |  4 +++-
 meta/recipes-devtools/qemu/qemu_4.1.0.bb       |  5 ++++-
 3 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 60cb2e01a60..9b87c04e246 100644
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
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_4.1.0.bb b/meta/recipes-devtools/qemu/qemu-system-native_4.1.0.bb
index d83ee59375c..7394385d30b 100644
--- a/meta/recipes-devtools/qemu/qemu-system-native_4.1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu-system-native_4.1.0.bb
@@ -9,7 +9,9 @@ DEPENDS = "glib-2.0-native zlib-native pixman-native qemu-native bison-native"
 
 EXTRA_OECONF_append = " --target-list=${@get_qemu_system_target_list(d)}"
 
-PACKAGECONFIG ??= "fdt alsa kvm"
+PACKAGECONFIG ??= "fdt alsa kvm \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer glx', '' ,d)} \
+"
 
 # Handle distros such as CentOS 5 32-bit that do not have kvm support
 PACKAGECONFIG_remove = "${@'kvm' if not os.path.exists('/usr/include/linux/kvm.h') else ''}"
diff --git a/meta/recipes-devtools/qemu/qemu_4.1.0.bb b/meta/recipes-devtools/qemu/qemu_4.1.0.bb
index f0c1daabe15..a4018cc4485 100644
--- a/meta/recipes-devtools/qemu/qemu_4.1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_4.1.0.bb
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
2.17.1


