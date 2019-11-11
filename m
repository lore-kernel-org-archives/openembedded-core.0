Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 55A997FB43
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 16:42:22 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id i12so8466645wro.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 08:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=YnTpQ+VaBis8xrA/6VITHj5QqaPcOAyThH1aKatkZEY=;
	b=a2fV6B9hMBopJZpx0do1X6h7aC9Zx2kBb1rCd47Kqg8UNYL/GVn7QIcBDflcj7HaRf
	h64APvnWorny7u9BlWzOeMqMQTp+JE9ak6z2UcBPvC/r7JjDiQczLkrOIkKNGYu9pF6Q
	MboYJz9XsbIYFAHXWe0wx/G7NnqfGwOSVpbwpKB94epskzKQslojeQEDioHZP30nxLRx
	OOfPAogfDHLT+4mpsT7LNvZrr/5nLUXK/5nwRrN4xBR5Uc9VS0UFyXexvdyW9c/OjVoh
	sY39G2mHUTmZCCJajELoIWNOqs1stD0KxLTh8TCCHpUjYxwqELGr4zqjnLzlqEmLGCdN
	b4uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YnTpQ+VaBis8xrA/6VITHj5QqaPcOAyThH1aKatkZEY=;
	b=Om665XCFkSwVNdJLjZz0iwhHZRnv5BKJaLOyDdfrmu0CRiRXsE+x+yU6UdOge6j6Cd
	n+iy2AZewyn49euIqsTFsedw3xNtPsCdPW3u8l137nKeuid37eJ6/AO8kNyrKFbfCK9t
	HhTZZ1TbWQ9d2gV8lX4BUHtN7ETid1F7cvc+FjGlQTrccylLFpWRCQoi8PRNq/fEPEZv
	U7wYtBiuhBDxEKy6j9dUK5i95cTSH6wXzNAm2t6cKSVgqWmmKGEWa3V3KbxU2bYB18vi
	LN30H3UjhRQ2zjrAU+HtAPTpJ8eCVBGgKknCnuIhEs+T+yNruyb6Du/WU249PGMwm70u
	4jxg==
X-Gm-Message-State: APjAAAV0Nx9aRbBE+Ja1NUD6MDy9c9CM44jZNzttegCxOSRVDI7bM9SF
	s6fipohIa/9A00rcNb+wY19ygb7NPMk=
X-Google-Smtp-Source: APXvYqxp2btt+0BlR2MY3YM5dns/y2JHYY7vw7tuykWi+lwOENlaQpPPWQyQmA2XjoDYzGRFuP+4Ew==
X-Received: by 2002:adf:c641:: with SMTP id u1mr22091979wrg.361.1573490543193; 
	Mon, 11 Nov 2019 08:42:23 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	h140sm21696810wme.22.2019.11.11.08.42.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 11 Nov 2019 08:42:22 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2019 17:42:16 +0100
Message-Id: <20191111164217.68122-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/2] runqemu: add options that enable virgl with the SDL frontend
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
X-List-Received-Date: Mon, 11 Nov 2019 16:42:24 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 scripts/runqemu | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index a05facd0db6..5c56c3fe6c1 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -67,9 +67,9 @@ of the following environment variables (in any order):
     nographic - disable video console
     sdl - choose the SDL UI frontend
     gtk - choose the Gtk UI frontend
-    gl - enable virgl-based GL acceleration (also needs gtk option)
-    gl-es - enable virgl-based GL acceleration, using OpenGL ES (also needs gtk option)
-    egl-headless - enable headless EGL output; use vnc or spice to see it
+    gl - enable virgl-based GL acceleration (also needs gtk or sdl options)
+    gl-es - enable virgl-based GL acceleration, using OpenGL ES (also needs gtk or sdl options)
+    egl-headless - enable headless EGL output; use vnc (via publicvnc option) or spice to see it
     serial - enable a serial console on /dev/ttyS0
     serialstdio - enable a serial console on the console (regardless of graphics mode)
     slirp - enable user networking, no root privileges is required
@@ -437,7 +437,12 @@ class BaseConfig(object):
                 self.qemu_opt_script += ' -nographic'
                 self.kernel_cmdline_script += ' console=ttyS0'
             elif arg == 'sdl':
-                self.qemu_opt_script += ' -display sdl'
+                if 'gl' in sys.argv[1:]:
+                    self.qemu_opt_script += ' -vga virtio -display sdl,gl=on'
+                elif 'gl-es' in sys.argv[1:]:
+                    self.qemu_opt_script += ' -vga virtio -display sdl,gl=es'
+                else:
+                    self.qemu_opt_script += ' -display sdl'
             elif arg == 'gtk':
                 if 'gl' in sys.argv[1:]:
                     self.qemu_opt_script += ' -vga virtio -display gtk,gl=on'
-- 
2.17.1


