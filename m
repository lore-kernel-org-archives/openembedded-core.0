Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id B70D97D17A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 17:16:42 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id o10so5317445wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 10:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KasX1NnejYZZIpA7TrGxLGxiR5Nd//B1xChIk0BBavc=;
	b=eNsRyqPLtLdZjOdQlLBmTcA35lGVDtGvPLA8mPdO+8D0KDdPt+kctb491upVp0HkwT
	/3OsEMpRAMVNMP3XgQ6w242y8NQfmdnOecShBaBRjr/UBbFpByhw1I3GZbkbDYKmsBLB
	MZ8GpzMx5EfpHknGXzqwCaT7E0lmtzAWN8Dcaa8uIDONzF3KkVxL1EXOPlaCtSsUqP0h
	8uPwZK3unvaKYGe1bgUoHeMVuF7QS/LTKQs5JsRdprxNyho46mVhi2X2vVFbeRAO9Tdx
	RiSIRoFmQqEPaaVxdr4tPSOTJmyQFpsbnztLALaJfVMpn+BRfUclplhdxFYs4c1DuUx7
	beiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KasX1NnejYZZIpA7TrGxLGxiR5Nd//B1xChIk0BBavc=;
	b=dL9FDcHXAsuql4IjCMPOFyZPXHrDBkvDdLh2PiKkBwVCtRj47BicAq+mhyfQ8LNuL6
	Ih5Q9Tdjr/cT/OpKsI0l2qAClrKFuUZpetleZAYLg/ezvW+HCzdnTsZZapc0s3t2YTtG
	1qdGZdeR22L5lD8sz3Hc3RrX6aMDfRo0+QBBZbYx7/PUuB9I2d19PHPrgTJb8Q49T+uo
	BWCS73eKEVzZEijtxUcssux1HHfgsdxAWV2xSgN/KkhU+4sKUWoPpGVZIvg65RJ8NoqX
	qJvKF3AsFNgMk05aeIfomIw10cpLbvkTyOcuGd6TnQANOTHhyy+1jKcFPsVUj9yoc35M
	faSQ==
X-Gm-Message-State: APjAAAX/TiP2JOJzvotGnoOgGQ4kMFnt9s3TS6PlpwJmSXmFvTbhntiR
	coSNFhaVOLJ0gNjZI09ett8ajJjmPUo=
X-Google-Smtp-Source: APXvYqxnVkjiPspmUSXJkO6ilslvVgtjKJA+pioeM1329TY2mu9dwO1FysJyOK8jnkJdH9b/Yz/WLw==
X-Received: by 2002:a1c:bd8b:: with SMTP id n133mr13469514wmf.73.1553707003219;
	Wed, 27 Mar 2019 10:16:43 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id x84sm873848wmg.13.2019.03.27.10.16.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Mar 2019 10:16:42 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Mar 2019 18:16:28 +0100
Message-Id: <20190327171633.34697-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190327171633.34697-1-alex.kanavin@gmail.com>
References: <20190327171633.34697-1-alex.kanavin@gmail.com>
Subject: [PATCH 3/8] qemu: enable virglrenderer and glx options subject to 'opengl' DISTRO_FEATURE
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
X-List-Received-Date: Wed, 27 Mar 2019 17:16:43 -0000

Note that to actually use accelerated GL passthrough, there are two options

1) a suitable frontend need to be also enabled - gtk+ seems to work well,
sdl was found to be buggy.

2) it is also possible to render off-screen with -display egl-headless option,
and see the output with a VNC viewer (for which, qemu needs to be started
with a VNC server):

$ runqemu kvm egl-headless publicvnc

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py      | 15 ++++++---------
 .../qemu/qemu-system-native_3.1.0.bb              |  4 +++-
 meta/recipes-devtools/qemu/qemu_3.1.0.bb          |  5 ++++-
 3 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 6c25bb901d1..fca803ffbc5 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -185,13 +185,12 @@ class TestImage(OESelftestTestCase):
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
@@ -220,12 +219,10 @@ class TestImage(OESelftestTestCase):
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
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_3.1.0.bb b/meta/recipes-devtools/qemu/qemu-system-native_3.1.0.bb
index 5bf528bec12..6928592a94c 100644
--- a/meta/recipes-devtools/qemu/qemu-system-native_3.1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu-system-native_3.1.0.bb
@@ -9,7 +9,9 @@ DEPENDS = "glib-2.0-native zlib-native pixman-native qemu-native"
 
 EXTRA_OECONF_append = " --target-list=${@get_qemu_system_target_list(d)}"
 
-PACKAGECONFIG ??= "fdt alsa kvm"
+PACKAGECONFIG ??= "fdt alsa kvm \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer glx', '' ,d)} \
+"
 
 # Handle distros such as CentOS 5 32-bit that do not have kvm support
 PACKAGECONFIG_remove = "${@'kvm' if not os.path.exists('/usr/include/linux/kvm.h') else ''}"
diff --git a/meta/recipes-devtools/qemu/qemu_3.1.0.bb b/meta/recipes-devtools/qemu/qemu_3.1.0.bb
index 04d8bee99f2..8113fc24e8b 100644
--- a/meta/recipes-devtools/qemu/qemu_3.1.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_3.1.0.bb
@@ -16,7 +16,10 @@ do_install_append_class-nativesdk() {
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


