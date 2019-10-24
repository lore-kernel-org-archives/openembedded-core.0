Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51])
	by mail.openembedded.org (Postfix) with ESMTP id 168807F975
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 11:11:32 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id q130so2002857wme.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Oct 2019 04:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=YnTpQ+VaBis8xrA/6VITHj5QqaPcOAyThH1aKatkZEY=;
	b=F5CRkuUZ9ZVQod71xGknUhZDEUnFxKVt9lj9OWePoT9281/0uCNhHAwUchCg00V2mJ
	ZMgIW/J+l0T/Msj7SjXwSYOgvl2Wlnz+iOhWKtPMnweIUtw8OFZPTS14n36zOvBI64aa
	ajCYzUf9v5o0a8/stvCh22k3W6ZmTSPxX/hyA+2g4DXhaJUnTHjQIzVOk9Vlt1eWTq55
	sUJit+FeEnrfHp5+r2tm1wI8IHsMe/S+m/Exjebvo6HHRgPSu2V+3uptIMqXEY7nkQ3y
	RmO8G0wvq9CgMLgL3t5PYg4Nhtqg4Y3NV6VD3uao6wSLav9fHkOuH+C61j9kOVVqiMU4
	tOYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YnTpQ+VaBis8xrA/6VITHj5QqaPcOAyThH1aKatkZEY=;
	b=jlIUlcTzA3RsXBuKode36D6UKg1ox2sRtFmiRiKfJJZ95n+5a5FHvS0gsA+pYDHCfW
	p0ns82om7FjSOsT07Dwj/3Grf+Kmu1S1FngvCbJ6zO32MxBBAK3cmw0efHteRem45BhH
	Js6qCrO4DLjiZZDytiG/R173Tafzp3Fl3kWIAFbPk5rqZBkogHf4qRbZhuymdpABTZJ7
	KIe88wmXY2a2mLMpgLpFmY67qfG6s57Pc+MEs9/RBI1JHa+n0C6K/NPOZptUQ8E+/XU8
	oTDL18NNIiCgq14CCn70WSDnPMjIuTkLz/RiRWDzkCxv2eqjFZjT2TuNp4+tOw3EIbSG
	UDrA==
X-Gm-Message-State: APjAAAUk8l4bmTeolEE8DoZcM7LCnNj2X6AdRphiH14dC/oyOWCPu0xg
	fMNDJgb+EpMUu6NB9fNZPR3zSWy1gQk=
X-Google-Smtp-Source: APXvYqymhAd0FMIVfUSm0tueQrld2zJ1164xNOAeySFCNLWWva2weWwbw9lCZ2P6+0WYNVQjpLuPPg==
X-Received: by 2002:a1c:7d47:: with SMTP id y68mr4295197wmc.157.1571915493389; 
	Thu, 24 Oct 2019 04:11:33 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id v81sm1073024wmg.4.2019.10.24.04.11.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 24 Oct 2019 04:11:32 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Oct 2019 13:11:22 +0200
Message-Id: <20191024111126.41198-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/5] runqemu: add options that enable virgl with the SDL frontend
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
X-List-Received-Date: Thu, 24 Oct 2019 11:11:33 -0000

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


