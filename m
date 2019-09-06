Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id A88B77F3A9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2019 11:18:14 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id q12so6648772wmj.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Sep 2019 04:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=RLsWmZAP9uoKxyupbFavP2ILE1Ky9C4smdR4ackWy8o=;
	b=iTDxxvdvwz4WQGxMQh0pOYpXP4sEv79F+LYhpjBSXBEhZI9r8fLolOGEm/u71HU4r1
	z9GjntDmzkwcHnM/fDBPV8/ot4pFMVq7CYY0GFTgV1+ba6xBe2IgZIFx7gjPJfJMoTfW
	omoNlHwIPWA06sFTDg3gxCuWD5fgAPHV2+yGOZtraFzP93cV2X7q1NLNBFR4nVe4Bap6
	UotjVj1zxL9fH4dEXgymefq3AgchV1RSCOlLDho9E/0nSv0DVwP1AX80jehx3zjG0RcS
	OYl3utgUAP6ek1/CEHXn67+OQvwr1NtoNanrHvMOTic2M3Mn52ieyfLmKaN3GVLGKNis
	/btQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=RLsWmZAP9uoKxyupbFavP2ILE1Ky9C4smdR4ackWy8o=;
	b=GTBUNXBTjm5PN3WodI8PChbI2FmqOq8rF4ORGhb0dLRSWPZ+6udNt/SCAW/jvVqQ8d
	SfLQeGLv3vaK/n3HAVBY6ldvRImeB64/RIC9R3wj65cN4t8UXRz5+sT3wung6xhJxu76
	qhTnnziwdXsQVmRr9zyfwdNrXzN35Vp6ZvIgmvxUYHk6Ddtas5IvQmftMoRAviTsF0Jo
	squ6dUe+AHkLJI4OXN/EzoTvmM2DKV/A5MDjs6umY0QULdYCcRHCb4QkcsfwKaQhsj5c
	78HaXPIxX+m8zk2E8XABWL81HwKaeYadFmDRM0+tQMWxaPG3A44rGGSoPO0DglxSxn5/
	iK1w==
X-Gm-Message-State: APjAAAXb/58G9c1daedKNMEyROFaflqv/hgcu4Nt14g54XgyyNrWnpXD
	PmUlT4aD4od3gQ17XSZ1c4kEiiGJ
X-Google-Smtp-Source: APXvYqx0VZJBrgqas9baW37JKol5PXuhUcC1OMxkbbXqqxkQyLwAfxTjyAovc6GsjfHiUPvOfkLrDQ==
X-Received: by 2002:a1c:6c0c:: with SMTP id h12mr6735529wmc.162.1567768694909; 
	Fri, 06 Sep 2019 04:18:14 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	q15sm4659730wmb.28.2019.09.06.04.18.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Sep 2019 04:18:14 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Sep 2019 13:18:03 +0200
Message-Id: <7806e3fc06c1d717db91bdc60573659db8142bd6.1567765705.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1567765705.git.alex.kanavin@gmail.com>
References: <cover.1567765705.git.alex.kanavin@gmail.com>
Subject: [PATCH 3/5] qemu: enable virglrenderer and glx options subject to 'opengl' DISTRO_FEATURE
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
X-List-Received-Date: Fri, 06 Sep 2019 11:18:15 -0000

Note that to actually use accelerated GL passthrough, there are two options

1) a suitable frontend need to be also enabled - gtk+ and SDL both seem to work well.
Previously I struggled to make SDL work, but now it seems fine.

2) it is also possible to render off-screen with -display egl-headless option,
and see the output with a VNC viewer (for which, qemu needs to be started
with a VNC server):

$ runqemu kvm egl-headless publicvnc

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py      | 15 ++++++---------
 .../qemu/qemu-system-native_4.1.0.bb              |  4 +++-
 meta/recipes-devtools/qemu/qemu_4.1.0.bb          |  5 ++++-
 3 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 20969d2c48a..7b48fe562ef 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -181,13 +181,12 @@ class TestImage(OESelftestTestCase):
             self.skipTest('virgl isn\'t working with Debian 8')
 
         qemu_packageconfig = get_bb_var('PACKAGECONFIG', 'qemu-system-native')
+        qemu_distrofeatures = get_bb_var('DISTRO_FEATURES', 'qemu-system-native')
         features = 'INHERIT += "testimage"\n'
         if 'gtk+' not in qemu_packageconfig:
             features += 'PACKAGECONFIG_append_pn-qemu-system-native = " gtk+"\n'
-        if 'virglrenderer' not in qemu_packageconfig:
-            features += 'PACKAGECONFIG_append_pn-qemu-system-native = " virglrenderer"\n'
-        if 'glx' not in qemu_packageconfig:
-            features += 'PACKAGECONFIG_append_pn-qemu-system-native = " glx"\n'
+        if 'opengl' not in qemu_distrofeatures:
+            features += 'DISTRO_FEATURES_append = " opengl"\n'
         features += 'TEST_SUITES = "ping ssh virgl"\n'
         features += 'IMAGE_FEATURES_append = " ssh-server-dropbear"\n'
         features += 'IMAGE_INSTALL_append = " kmscube"\n'
@@ -215,12 +214,10 @@ class TestImage(OESelftestTestCase):
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


