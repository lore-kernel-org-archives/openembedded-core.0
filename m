Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2230E7D8DC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 10:13:32 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id o4so26434422wra.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 May 2019 03:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wWtHSAKf1ruBaAZ3x4g+LYMuRvSigSyi8abInbNTOMo=;
	b=rTpF9NfafmEa1O4/KdG6+OpMmWkPBe/gCLQiP7HhDWmFs4aSp2yQD94P1hUwB7GQEa
	4UrZwfHi7Iy132UnMnhRVext0FbmbnbJCs+MwQm01FgEGkqdHu01bR0FWKf0hDkhFYSf
	O7E/ozM1VKy1JXvIz1s51s8v0RasKeTfWi2QmPB7h4lvuU3acqZHaigQg/ITYkmwuywH
	+sv/ZP6f8Hzd9tKUzO10L/BK1dy8n/5zIH0ZTotWjv3Gnr64e5LVh3GJIN+b1duLaOmT
	tMj6J+GE+8KIqnZRxUC+yT3hnxKcNiRkJUSixU8OXzhoONhSHs17mORN7ohjPunQqWmf
	f1SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wWtHSAKf1ruBaAZ3x4g+LYMuRvSigSyi8abInbNTOMo=;
	b=ksdTmD9WuC4QzXs9dtIyBwOUu0dHmF1D1oSmtE6ldF9dJrZ4LhgkM4LysVJJDEFU/O
	noMMgDh30sDlGy0bk1gl2VwGfZkZ1o6kWGA1JQo5PuAxMiuOjhigoXqzJOwnceNmuUd7
	B3XKEvgl6hVmeAjrBx2VZaP8mXqt0Ex4nVCcGKWPKZevp8aJdXRXysEMqISWIp8a+tfC
	zid+sdv5YMKgRZIhbCRxH89rmWz/RzDx+TA2WU59DkvPdb08OEACKNleYnZee//yQYTi
	CcOSfdTQeXm7AC2/XND5eOcLJhQelj2eCZfBsXxheZx0FxwRvvWJ6/uXk3KyEq1eDe8U
	tU9A==
X-Gm-Message-State: APjAAAWMQYjHnPWizDBF897E73BzXL4MN4IGg1KLeSIzZhxesTDhiNDS
	GHHCjiO3ouw7BbusG5WBAVc3L2v4
X-Google-Smtp-Source: APXvYqxZyEGgjkPC1Vton4n2WKuL/ToJO5XBtmpy0wPncEJ0A9rmUJ4M9VF6qKvVw4NMu4Y5mwjvmg==
X-Received: by 2002:a5d:6143:: with SMTP id y3mr2045139wrt.148.1557310412712; 
	Wed, 08 May 2019 03:13:32 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	c20sm19088365wre.28.2019.05.08.03.13.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 May 2019 03:13:31 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 May 2019 12:13:22 +0200
Message-Id: <20190508101325.51102-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190508101325.51102-1-alex.kanavin@gmail.com>
References: <20190508101325.51102-1-alex.kanavin@gmail.com>
Subject: [PATCH 2/5] qemu: enable virglrenderer and glx options subject to 'opengl' DISTRO_FEATURE
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
X-List-Received-Date: Wed, 08 May 2019 10:13:32 -0000

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
 .../qemu/qemu-system-native_4.0.0.bb              |  4 +++-
 meta/recipes-devtools/qemu/qemu_4.0.0.bb          |  5 ++++-
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
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_4.0.0.bb b/meta/recipes-devtools/qemu/qemu-system-native_4.0.0.bb
index 820883df651..5b14559818a 100644
--- a/meta/recipes-devtools/qemu/qemu-system-native_4.0.0.bb
+++ b/meta/recipes-devtools/qemu/qemu-system-native_4.0.0.bb
@@ -9,7 +9,9 @@ DEPENDS = "glib-2.0-native zlib-native pixman-native qemu-native"
 
 EXTRA_OECONF_append = " --target-list=${@get_qemu_system_target_list(d)}"
 
-PACKAGECONFIG ??= "fdt alsa kvm"
+PACKAGECONFIG ??= "fdt alsa kvm \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer glx', '' ,d)} \
+"
 
 # Handle distros such as CentOS 5 32-bit that do not have kvm support
 PACKAGECONFIG_remove = "${@'kvm' if not os.path.exists('/usr/include/linux/kvm.h') else ''}"
diff --git a/meta/recipes-devtools/qemu/qemu_4.0.0.bb b/meta/recipes-devtools/qemu/qemu_4.0.0.bb
index 247e0311edc..52cb3b8f3dc 100644
--- a/meta/recipes-devtools/qemu/qemu_4.0.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_4.0.0.bb
@@ -16,5 +16,8 @@ do_install_append_class-nativesdk() {
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


