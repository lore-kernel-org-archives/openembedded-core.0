Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id B199E7F400
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Sep 2019 20:36:45 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id 30so994306wrk.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Sep 2019 13:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=RLsWmZAP9uoKxyupbFavP2ILE1Ky9C4smdR4ackWy8o=;
	b=b585AOTemX/VI0BXVh2mWPzC8slujtBSsGE9W1mycBv0mh5txaPZGujjwxZCUxyWsR
	d52nuNh5jphuA0wr95qwX1BsE7SMU7GLtDvxPMl6KZ6oH223bkV85Gb4RVLjVRzo5Uk5
	MhF1yx67N4HASj6DmW00bXRlL7GcSoI8z6W2LYeoSGdPPwQKyBhdgrsSRhHiiHEZvr3M
	Zk3kmNhekPo3zaC5Ejeug1i3tXqTQLYsyYvgxDidLwxOFXPHnJxe4OpVI/FpbZVZ1rA1
	4dTQFI7DqYi5YQ8GqRG3gG0ZA1NdtLMsNddlaglFk3jqdzS6OiJ5POPy52x2L+xgy0dc
	4bSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=RLsWmZAP9uoKxyupbFavP2ILE1Ky9C4smdR4ackWy8o=;
	b=ZCUVSNEhpu1nDk2zU73RHebFGXtuh2f9O4XhV87Lrgc76JNHrFBntUFArPGR2JntJV
	slgvGR2iGTN7cUi5GU3CcefvoidLRqHz7dI86cTn8mQ0kLuvZOh0Hx2tlxK49lPlsGQl
	k1TnUpO7kbCT87CX3gupkD3Y/j6f74QfZeqmIFPQM7a15RmyPJ/a3De4UJJ2S8TyqV1A
	WCfL5mWCPJm8ZrHIQmAucs2WSNydlcuKXR6954AO1W5wuxNHqgawrEbkDMDbg15nK0Lm
	LCwDSjX4ft8Dx7gRGJ900dlXVbGsf7gV5juBzvW0mdBbE7Hw6U4d0QagMz7gNgG1795P
	02NQ==
X-Gm-Message-State: APjAAAVDFJpPcljIcii6eNmY+2PBTmV/VR6AuY394FPK0QW814CNZJfA
	aJoBT6uJc9mx8ZDqzoDs2Y+fIQlN
X-Google-Smtp-Source: APXvYqw83ETfuklRSd3m9wUc5FvKYUWtTInwR5rvb7/TtgnIyfmYAEzsKK7LqmhADy8Uszjsj2tQyw==
X-Received: by 2002:adf:e605:: with SMTP id p5mr7922163wrm.105.1567370206202; 
	Sun, 01 Sep 2019 13:36:46 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	f6sm25876192wrh.30.2019.09.01.13.36.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 01 Sep 2019 13:36:45 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Sep 2019 22:36:33 +0200
Message-Id: <a6d467cc5777a2c94cd23c2ab4e7a3b272e2a13c.1567369258.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1567369258.git.alex.kanavin@gmail.com>
References: <cover.1567369258.git.alex.kanavin@gmail.com>
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
X-List-Received-Date: Sun, 01 Sep 2019 20:36:46 -0000

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


