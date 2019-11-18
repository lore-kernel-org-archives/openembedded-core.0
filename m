Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id 880F87F98A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 14:31:19 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id b3so19736938wrs.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 06:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YnTpQ+VaBis8xrA/6VITHj5QqaPcOAyThH1aKatkZEY=;
	b=IGcXYOq3AqDzMtdrNiOXOqT/aSV70v5gaZh4Y1mFHRUi4ly0gb1RLyJOCO6pFpZ6LZ
	6iJz4T+r13B/frE729co6uv+b7L2/tInXYlQfpXHWnDYrUFO/VcBecJiHv+AuWzbeLlG
	ZMHkScnwo9uN8G8Y4+v5wmt/dw4nlomXCM/L7FaNImd2NBaQ3X4gF/KuYRx+b6xWOX67
	BoQPDSNf3QyWmwXKon+LkI9+FEY2JWZ/PaxhiBWZhjNlsiJyvdzNtUCDPWw5FFQetmuy
	RaH4yrX5DRzA48HAcRwyOqXmX5amQkVIM4W0Lf0WgDQBziwo3yNS7BBI4hsgA7BVETks
	PIPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=YnTpQ+VaBis8xrA/6VITHj5QqaPcOAyThH1aKatkZEY=;
	b=cgRHZNOKCwRDAKnQyd+ZCglkIBlDV1qRrQew0FAQdR2Y8kO9B1RQB7uJV5HZMSVOQz
	ceEDZtTsy/+hI0Q/fw8ezSbog+4XQXsfxD3AEIMf3aW006CZt8VMK4uAew7e+iINgj4q
	/AzdkhiTCPVSHuKsJJr4m85DRl7OFR22Pz7u2e+NSmHCU7B4Q20+Zjm6cwAA5620KLAU
	mfloqTXM/AJF4C9SIVtG/75rPHFqbu+ZJL6G8J5eg3anAYgegytzNyxDA2Q66FAF10WT
	Hbb2zu66rMTcVPp3P6ah2GKL81N8QFjcKrP332IawX1G475030hF5cYOffvGUYR1+ZLh
	VDkQ==
X-Gm-Message-State: APjAAAUyELKNwEzw37X1C9d/1n0UTRm62KBmV3vosQfoCUdPUzrRnxL8
	C2KvhkpOyCHAl4REoyF64zPlSbs8
X-Google-Smtp-Source: APXvYqx4BMa4PFlfpSun44+cfdvnytKcoZ7NHsoPMmq/HuL2qA5KNH+sxuX1tTGM4ZJlCuAl8pxDJQ==
X-Received: by 2002:adf:ed48:: with SMTP id u8mr977349wro.28.1574087480078;
	Mon, 18 Nov 2019 06:31:20 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	f24sm20097324wmb.37.2019.11.18.06.31.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 18 Nov 2019 06:31:19 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Nov 2019 15:28:41 +0100
Message-Id: <20191118142852.22981-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191118142852.22981-1-alex.kanavin@gmail.com>
References: <20191118142852.22981-1-alex.kanavin@gmail.com>
Subject: [PATCH 02/13] runqemu: add options that enable virgl with the SDL frontend
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
X-List-Received-Date: Mon, 18 Nov 2019 14:31:19 -0000

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


