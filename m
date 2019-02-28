Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2452A7CCE4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 14:25:42 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id o17so22198837wrw.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 06:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=/FAfY2KQCpYhCjIy2mc5AXpu0+6YcMQapGf2526w3E8=;
	b=IkX5TQX1XUl5lkkcVqLHqZRu4NdHmQwOTj0ArvpsjVJIdXTolaUjC6bWu+q2ylD3+g
	cds/slXP/1K4vAqLiHWoT6hQ21/xrO1xWyTBYMDrqOL/KJlCo9Si36W9YNR55zaa0dZq
	4lEG1EplZTHVS5yUHN51al+RASrYdexq7qy5DqjhRgwn/R/PeFeGupv5WofCC2fasJSm
	SchZhHu/kjYI/T3y0fxbJrD8gqmgk8sqDu5e57gYX4xm9HP+KQnDLwOjM/Q2cUa+4sW+
	aQUxi52vMPCP4UHCUg2PEMOFc8QGAWgFOEQqFHQbCiKaa0Bw7nFoyfDBCtXresui4byu
	Lpxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/FAfY2KQCpYhCjIy2mc5AXpu0+6YcMQapGf2526w3E8=;
	b=sNwObudF1vQIhRGSVYHRwGtsa+28++DRnNXx+HHS0WOROxuMmg+j+vHRc6bpRr/ZsE
	L6+3VEZ5nizKq9m7yRt3o+sY9rCFzIPGYB/jas1dnI9H6NhoqqBls1lWB/3NMrcAuUxO
	dusOOOtURp09V8XXm6V9MO+oymvR4VKnXYFVxLz1zA9OvDCD+/BJCqC7MVfhyGpPifc4
	QcHz+yQOr4zseFQ7qtD7l6TPkzKTOpsDNu/O03qOUg56uoyC9bXymznxIqvgdlgfgYJy
	GWj1Xz8Us4v0jbw81+FdW+GKpXV3g8UpfhC8QXa5pX84ZXzDEqDXcnLGOA8UQP8EpuWQ
	eixw==
X-Gm-Message-State: APjAAAUeNZg0jP06u5js+biRHxd0wYSPM+Z6TQFvbBbqNZ2eZbA7Cbos
	kAZkX/yeEFTFTvfKNULoaxFymuys
X-Google-Smtp-Source: APXvYqx4jqMI2X9XFEJCl0utf+DxNsxb4l1BXu7ZdIhJgxv7IZd9CgyjkPIH6Edkr8cGsMz7CQqAIA==
X-Received: by 2002:a5d:6846:: with SMTP id o6mr6382666wrw.160.1551363943418; 
	Thu, 28 Feb 2019 06:25:43 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	o30sm22192672wro.57.2019.02.28.06.25.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 28 Feb 2019 06:25:42 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Feb 2019 15:25:37 +0100
Message-Id: <20190228142537.46666-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] runqemu: make gl options gtk+-specific
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
X-List-Received-Date: Thu, 28 Feb 2019 14:25:43 -0000

If in the future GL is enabled for SDL frontend, or some other
frontend, it would be useful to be able to differentiate.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/lib/oeqa/selftest/cases/runtime_test.py | 2 +-
 scripts/runqemu                              | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 3cecdc8e42b..d164d3db1dc 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -186,7 +186,7 @@ class TestImage(OESelftestTestCase):
         features += 'TEST_SUITES = "ping ssh virgl"\n'
         features += 'IMAGE_FEATURES_append = " ssh-server-dropbear"\n'
         features += 'IMAGE_INSTALL_append = " kmscube"\n'
-        features += 'TEST_RUNQEMUPARAMS = "gl"\n'
+        features += 'TEST_RUNQEMUPARAMS = "gtk-gl"\n'
         self.write_config(features)
         bitbake('core-image-minimal')
         bitbake('-c testimage core-image-minimal')
diff --git a/scripts/runqemu b/scripts/runqemu
index bbf539a8e67..c0e569c44cb 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -75,8 +75,8 @@ of the following environment variables (in any order):
   Simplified QEMU command-line options can be passed with:
     nographic - disable video console
     sdl - choose the SDL frontend instead of the Gtk+ default
-    gl - enable virgl-based GL acceleration
-    gl-es - enable virgl-based GL acceleration, using OpenGL ES
+    gtk-gl - enable virgl-based GL acceleration using Gtk+ frontend
+    gtk-gl-es - enable virgl-based GL acceleration, using OpenGL ES and Gtk+ frontend
     egl-headless - enable headless EGL output; use vnc or spice to see it
     serial - enable a serial console on /dev/ttyS0
     serialstdio - enable a serial console on the console (regardless of graphics mode)
@@ -407,9 +407,9 @@ class BaseConfig(object):
                 self.kernel_cmdline_script += ' console=ttyS0'
             elif arg == 'sdl':
                 self.qemu_opt_script += ' -display sdl'
-            elif arg == 'gl':
+            elif arg == 'gtk-gl':
                 self.qemu_opt_script += ' -vga virtio -display gtk,gl=on'
-            elif arg == 'gl-es':
+            elif arg == 'gtk-gl-es':
                 self.qemu_opt_script += ' -vga virtio -display gtk,gl=es'
             elif arg == 'egl-headless':
                 self.qemu_opt_script += ' -vga virtio -display egl-headless'
-- 
2.17.1


