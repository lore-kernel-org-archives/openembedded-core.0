Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id C639D7E5F2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2019 15:36:50 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id p7so542259wmp.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2019 08:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=8js4TKVA5fB7aXXaLBVTVO1QjO5F04VD7Zjp6gNpNQQ=;
	b=D89wfd7qxU+WtxGhlvonGoNEhUGm3bS0fEmR/DKxlOIay0cDQ6dGyqDKnpW00lCWAg
	H661aiwz1Hp2io+PVjZ01vI0qfL5d0dVrSMP6LVoGXhKMgnM3VAto1lOEj6KIElSWpYT
	Y8U/4pHb1LLlv1fPV8soQmIZcU0rGUqKhakVK06xJUxUVe4NwnWZ+F8+ocR81/Kqpcw4
	Z3MhegMjEPPhaZuOmiSHtbBkH6vEunfs4xmWwb50Xhs2kNw66XQxq3PxP1ToLUGvijuN
	aLIdxR9XJVOBEAGBeEKxPm7TG+7QpBUO2m4mN+IL0Uf5Ty5eHkqsHZfqH253DxhOMfie
	BV+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8js4TKVA5fB7aXXaLBVTVO1QjO5F04VD7Zjp6gNpNQQ=;
	b=g4sf0PANg+ckejRqifj6QfhHHAJ1CepBnjTsl09znNzXvdPF8apML0LGKdxnyCch13
	0c0fSrtYRLCwdo2wwUV/Bcs11p7CPolRvs1oophTGUCRJrdxWbIpluM7z8p7SHYv5WLc
	OuWjHbfjtWmUYsmTRZSO/PzwEAR9A8q+cnSReYFgJp+4n+kzKcCDr4WRVnmHCCJrG2fT
	8uzpVjCzi76rEHsm6cIVOT9YjnQF6VR9Gr8eKxZwPDFUoirjFx+ajUzAGCE1jjHOkNLn
	x7WV+y14wi5ztFlTyT5qebMMjm/VwTBThdMM7PXNx11FGr8XrimU/9qMJk1LQnrq2Xtb
	L1Lg==
X-Gm-Message-State: APjAAAWp4HH1jhkqDtnEg5mrsFkqjlq6UZi+3QFKhFnU/InIbYhott16
	DN0X/31dntNdTFBOJr/hkecL0W3j
X-Google-Smtp-Source: APXvYqyX218r/JrqVGw56z8pizmDWYYQ4dR+6HxVx7Y7UH9mprIhsKthm+JgHRrVVambpOr2fYonNQ==
X-Received: by 2002:a1c:a8cb:: with SMTP id r194mr519610wme.156.1568302611095; 
	Thu, 12 Sep 2019 08:36:51 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id 189sm456447wmz.19.2019.09.12.08.36.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Sep 2019 08:36:49 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Sep 2019 17:36:42 +0200
Message-Id: <20190912153644.19473-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/3] runqemu: decouple gtk and gl options
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
X-List-Received-Date: Thu, 12 Sep 2019 15:36:51 -0000

This will allow not having to multiply these options for the sdl
frontend, instead combining them as needed.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py |  2 +-
 scripts/runqemu                              | 21 +++++++++++++-------
 2 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 20969d2c48a..3f212bd0eac 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -191,7 +191,7 @@ class TestImage(OESelftestTestCase):
         features += 'TEST_SUITES = "ping ssh virgl"\n'
         features += 'IMAGE_FEATURES_append = " ssh-server-dropbear"\n'
         features += 'IMAGE_INSTALL_append = " kmscube"\n'
-        features += 'TEST_RUNQEMUPARAMS = "gtk-gl"\n'
+        features += 'TEST_RUNQEMUPARAMS = "gtk gl"\n'
         self.write_config(features)
         bitbake('core-image-minimal')
         bitbake('-c testimage core-image-minimal')
diff --git a/scripts/runqemu b/scripts/runqemu
index 4415e9b69f8..68ba7dcfb94 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -65,9 +65,10 @@ of the following environment variables (in any order):
   MACHINE - the machine name (optional, autodetected from KERNEL filename if unspecified)
   Simplified QEMU command-line options can be passed with:
     nographic - disable video console
-    sdl - choose the SDL frontend instead of the Gtk+ default
-    gtk-gl - enable virgl-based GL acceleration using Gtk+ frontend
-    gtk-gl-es - enable virgl-based GL acceleration, using OpenGL ES and Gtk+ frontend
+    sdl - choose the SDL UI frontend
+    gtk - choose the Gtk UI frontend
+    gl - enable virgl-based GL acceleration (also needs gtk option)
+    gl-es - enable virgl-based GL acceleration, using OpenGL ES (also needs gtk option)
     egl-headless - enable headless EGL output; use vnc or spice to see it
     serial - enable a serial console on /dev/ttyS0
     serialstdio - enable a serial console on the console (regardless of graphics mode)
@@ -436,10 +437,16 @@ class BaseConfig(object):
                 self.kernel_cmdline_script += ' console=ttyS0'
             elif arg == 'sdl':
                 self.qemu_opt_script += ' -display sdl'
-            elif arg == 'gtk-gl':
-                self.qemu_opt_script += ' -vga virtio -display gtk,gl=on'
-            elif arg == 'gtk-gl-es':
-                self.qemu_opt_script += ' -vga virtio -display gtk,gl=es'
+            elif arg == 'gtk':
+                if 'gl' in sys.argv[1:]:
+                    self.qemu_opt_script += ' -vga virtio -display gtk,gl=on'
+                elif 'gl-es' in sys.argv[1:]:
+                    self.qemu_opt_script += ' -vga virtio -display gtk,gl=es'
+                else:
+                    self.qemu_opt_script += ' -display gtk'
+            elif arg == 'gl' or arg == 'gl-es':
+                # These args are handled inside sdl or gtk blocks above
+                pass
             elif arg == 'egl-headless':
                 self.qemu_opt_script += ' -vga virtio -display egl-headless'
                 # As runqemu can be run within bitbake (when using testimage, for example),
-- 
2.17.1


