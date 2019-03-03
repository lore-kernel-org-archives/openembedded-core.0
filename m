Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 419AA7C886
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Mar 2019 11:28:00 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id i12so2403047wrw.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 03 Mar 2019 03:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=9kNFhcAxNfd8kpkwcA8SGieTHRZneblHN9M7wYL0hXg=;
	b=ot4aAvjG+qb+2UH2J177jsP755C8jAKadFjcHWJqtTufmPFApBf6kbh8aO8rjC9P3e
	mzqRdIloFMKtSrFfMmxRgqxxhlLwttfrKF4X1djEAfZ50dtdssmbTIrfeOtsT11vAtV3
	IGwikpdRO5kVXHBJgoSd9jNY4l7rGHeNiKmyAtKsGYLUpypusFcM2fWp8YIz7xBmebe9
	kAGshxjjzffim4HQ6+jd7wZ1qs2L/cHfc+isD22KWZBw4Y3XzObVoivyNSJPD7sN77Cc
	LsH+D+IYaJssZif0Ojgxurv1Q+9tgtEmO8RkhfWgN6YSecbBfapa7DdxEP73YRcHbyoP
	CPoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=9kNFhcAxNfd8kpkwcA8SGieTHRZneblHN9M7wYL0hXg=;
	b=FBrfZ8Yf0HS3MK7RZBPo0CVMLo97HCL/Dvookz1er8IQrY4MpNyvTHae1xVRuMdb4/
	uyKXd+2CJErg/6FhuAVapWLNRT9LqbxPtFwA1qii/e26HmuCparCwlG2buMKkl5VCyLu
	o3XTtDb0XC53FUrzukB0AhP4BqrXxyQDDTlYLYsBGus7n6m7obDValpSea8fkLz/eO2i
	dDNpnFmZVLQL1W6EK/vUS7G2h12FuDsPEXG/TdaTH1dlkUsCSUOWzr0jpphBGQY9B67C
	PbLdqCmXSXUOeQzc1lhrGW/NKO6RpI7SAg2d3VaCDo7o+1ew8JpqH52HpJXFDxOvkVmK
	+9pQ==
X-Gm-Message-State: APjAAAUSdB+Y/UBkH0avM6E+BgJKRskfe11kkyIMP/gP4YGI/MiKsGrl
	A9C5HU03APyVIvwEkdyy4P06qCMh
X-Google-Smtp-Source: APXvYqzMLvdojvqqla8Rb+2DlGtv3hPBCWthS+vZScwG0z92s5l0i77/s96lT8uXfnrAOiqsgQremg==
X-Received: by 2002:adf:e548:: with SMTP id z8mr9598801wrm.52.1551612480754;
	Sun, 03 Mar 2019 03:28:00 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id r6sm3773462wrx.48.2019.03.03.03.27.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 03 Mar 2019 03:28:00 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  3 Mar 2019 12:27:45 +0100
Message-Id: <20190303112752.16353-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190303112752.16353-1-alex.kanavin@gmail.com>
References: <20190303112752.16353-1-alex.kanavin@gmail.com>
Subject: [PATCH 2/9] runqemu: make gl options gtk+-specific
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
X-List-Received-Date: Sun, 03 Mar 2019 11:28:01 -0000

If in the future GL is enabled for SDL frontend, or some other
frontend, it would be useful to be able to differentiate.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 scripts/runqemu | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

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


