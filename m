Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 65DBE7E5F2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2019 15:36:51 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id a11so19213721wrx.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Sep 2019 08:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=F5BM6oNGQUXIo0/mFnXVb9yROtnoPdlOILWnzLks+70=;
	b=jS9Z/rMQeR7dKGqJgX6jYnQPKJ0afGM/zx7JnUC9xjqsUn5CBclwFhlDYzFlXAdp0D
	QhRwBqQGCOZQ0Jx4dOaMDQZpip0cs499BynPCz8fI3yUtPyY+mfWOWMbXHtTb8uuR/eo
	iYSHnNikXoRTJJey++qWSlE6vqobtmwh+NKyRunq9ch1cg2DR9sY1MbQv8PIswwmcXy8
	RtpyfqFSEib7RitvnP3Q9W+e0jwcYhrj8Vocwow9Nvh6EXkBuD7MKilUZB0BhstCOAgx
	XEBsODw2o9GsJ9rF5/aVVk/4h8JxDYShvp0bcSDV9GTspFWmq75RoPrr+r2F4Q4EGyDu
	bTPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=F5BM6oNGQUXIo0/mFnXVb9yROtnoPdlOILWnzLks+70=;
	b=dEm/PRT7eGOTJi4NlAntSdqWKfajZxizThAdr8px8LOiWjtVRthnibB92C5Z5pWf1K
	4/rkq+g1b/LgMa8LI1R8hAhPj6818ILdhGLcsBXQA3ujzls4YRcF4wOt7Rr9XGTeVnGv
	Htoz0+3tT9rhB/8OR16lwa9RzbqWeew6q9t8HD9dVB5e7oKjeMOExPYT62i/chb4AUyH
	qlgkyNThuR34sJFuU3rGwX3tknxzV0uGhSkJReKvZGcpEHLqYYdg+t2U/XKe+5gJehg1
	8smkz6kqSboKNVi5Jto/T8NfgPllAdpc0LZ9D1Mtf5n7ZFRPKA2q8lgBfBGG9AdvqGM6
	3ETA==
X-Gm-Message-State: APjAAAW2akdJNzZ8JtEGC1+nddLhcynDwivujr0QceytJuJG9ULsUAAg
	rT9iU1EDil/kUEiYSGlaDMevgpYQ
X-Google-Smtp-Source: APXvYqyc+4ue54/GXXDYV5sV/kzDX7ZY68wW/EdWOyqOTe3oZPp9Ir9/fEac23kvsq+XdzxhAMp/5g==
X-Received: by 2002:a5d:670c:: with SMTP id o12mr1708185wru.103.1568302611887; 
	Thu, 12 Sep 2019 08:36:51 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id 189sm456447wmz.19.2019.09.12.08.36.51
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 12 Sep 2019 08:36:51 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Sep 2019 17:36:43 +0200
Message-Id: <20190912153644.19473-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190912153644.19473-1-alex.kanavin@gmail.com>
References: <20190912153644.19473-1-alex.kanavin@gmail.com>
Subject: [PATCH 2/3] runqemu: add options that enable virgl with the SDL frontend
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

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 scripts/runqemu | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 68ba7dcfb94..18091a29c3b 100755
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
@@ -436,7 +436,12 @@ class BaseConfig(object):
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


