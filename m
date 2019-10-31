Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id 618127F8CB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 09:37:05 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id 11so5166952wmk.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 02:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=YnTpQ+VaBis8xrA/6VITHj5QqaPcOAyThH1aKatkZEY=;
	b=CbUdOBNuJGSXzUpl2fYLNPEaxKByTxOu42AcagFwFDTtl46trn1H6XtajCbyJTGi8n
	Xb8ZTpn44lZ5UP0f1RT0o1VamgWgSn/jcMG50zpttv1fDS0GUq8qESA7eoyR4Z9lDfll
	5r8JaMhFD0D3gLcpvknm4wUqXrfQVTojZuIvTBm/ui18yfScp9tWs1tEgY3DRB5Ppq1u
	4OqKopUYAaSc4OnCgeMbIjtvkcYx/AHYLawqToemnGaekKaXDmL+YRpXXxYKDf79p1Zg
	LOzCXUgazB74ODGC7hyrjRQzfD4599R9wZhqO3ILCXG89RcaW1I2Sb3IhaTVmptOeUhv
	ypNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YnTpQ+VaBis8xrA/6VITHj5QqaPcOAyThH1aKatkZEY=;
	b=gxCOgueCxTz2X9hiX+yyHSeYd8JG6Dyr8JshUZ1MjoJxGZPYCNT2IYYdQElcWiHsmQ
	NQpnHjqd/dPMP6YDNkCfAUvDKVPXM2W4D6GTXLZ1yjRz+Yv+Sk13CW2wHyL/OKgX6xUr
	RsoRTjIbVuliDl7VDd+cNePeC7p1ei7NpSikTmPJ2hUy/e8qMEBXn81LkCaLoWBh7e9z
	CkeR/NqOmEUU4Yww1OpaMwH2/cpfYMk4NGTNmW4oAbIZBNScImMFu5gbTowKCYfbvN5A
	H7Ou83dhrUe+3SLMRFmrKiyQSnScU82JmGo8sTyjbcgOkNiDJN2tVeRYe7nAUDJ1WAFC
	JTLw==
X-Gm-Message-State: APjAAAVYee+uicNx21cbin73z4aQzYx8w6zg0pJVdc2+ziuDcSVx3lcS
	V1R4LBxMpjgC0WOoST3KuD2u1GASMHA=
X-Google-Smtp-Source: APXvYqy4FDchs2woZCsHYuM7rl+50YWuUrV7UMi4T2RJLpje/xNbWfUYde35APkvtWI2o4uqhNCb5g==
X-Received: by 2002:a1c:410a:: with SMTP id o10mr4150906wma.117.1572514625749; 
	Thu, 31 Oct 2019 02:37:05 -0700 (PDT)
Received: from localhost.localdomain ([91.217.168.176])
	by smtp.gmail.com with ESMTPSA id
	b186sm2950263wmb.21.2019.10.31.02.37.04
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 31 Oct 2019 02:37:05 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Oct 2019 10:36:50 +0100
Message-Id: <20191031093655.14852-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/6] runqemu: add options that enable virgl with the SDL frontend
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
X-List-Received-Date: Thu, 31 Oct 2019 09:37:05 -0000

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


