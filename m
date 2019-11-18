Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id 407CB7F93A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 13:08:16 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id q70so17297473wme.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Nov 2019 05:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YnTpQ+VaBis8xrA/6VITHj5QqaPcOAyThH1aKatkZEY=;
	b=pylwloqIK2JGPPVyBM4v4yUTOgSC4FY4tyLlnhr+0Ass9nytUaSkXUB1cd1rnS3bCT
	wgazCQ0Tm6NNLCuOv+pXYZT+S8u3+4DnxpktKzsTPK8OAfKmBy6KYFB25wj6L89Io5pU
	0bdQpDOm/X156kEfvSxuVgCHYfkIskomQzlKLaSeeVSqcYTwik8jqdh756NxaRuB3/ZN
	AHG/gqDiyKS/13iJ3YSXqf1ED6otqJEzjJ8f0bNMMrZ/3cT9PWmB+frbU5K4YBnzkO0H
	aMJEq8dbQW56bLcVpBguBVqADHlXUe7woO3pfG9OSRHHf15f2twEtGbFTJcT0e2JmmIg
	a7EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=YnTpQ+VaBis8xrA/6VITHj5QqaPcOAyThH1aKatkZEY=;
	b=Fm/6e2ZF3sU6uRFQLzqPmKyfjQgKlRkNEl0kMyIXElewjyp8ohGIujrbdvPP7MJKyQ
	kcgLjh87QC67mVfvmvmFUOQR+fUXo9aDAv4MB2GW3tLalmZGqAvuHch+azSuvcY/UplN
	Amv1eOmTjy7w9tFCAS03cuwBNi/pOPEj1AKQReVg7nfbeQahs98l0XGdGjSYkTsTQHWz
	hymffjmMwz8ikxUlxvD19dBPBPxrNUXsTL+XhISTpw3Ll2GSL7TYPDMekPhtkp/eufHU
	aAadOC9euGAAHpeH0AE3PpHXjZ9fzbIYjMkCwAqlI1+g44uPRgOZGra5+Toq2KrKaZtT
	q8/Q==
X-Gm-Message-State: APjAAAUfU16hKXntLPKoWngkYw9CKBPhhrwGRP/VCcWyWoa2bTtii8b9
	D6WQ+SKgzDl+gUN2MDTqAQY4H5VX
X-Google-Smtp-Source: APXvYqwP8Bab3K/unsmfL+cCnvXoIZ3kiaNmFG38VBxsvK5BMnHfe0epue8ab2h1Dko5Gaa0DWNdOw==
X-Received: by 2002:a05:600c:28c:: with SMTP id
	12mr28262949wmk.25.1574082496696; 
	Mon, 18 Nov 2019 05:08:16 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	z4sm21413846wmf.36.2019.11.18.05.08.14
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 18 Nov 2019 05:08:15 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Nov 2019 14:07:50 +0100
Message-Id: <20191118130801.21860-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191118130801.21860-1-alex.kanavin@gmail.com>
References: <20191118130801.21860-1-alex.kanavin@gmail.com>
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
X-List-Received-Date: Mon, 18 Nov 2019 13:08:16 -0000

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


