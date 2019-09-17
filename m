Return-Path: <alex.kanavin@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8C9317F72F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 14:45:13 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id m13so3762970ljj.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 07:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=F5BM6oNGQUXIo0/mFnXVb9yROtnoPdlOILWnzLks+70=;
	b=VtwqVgQ+d1o2hx8cfi2gdFNsKJft3/53TqIHQCY2enQFMsdlU5a94tfLXw2xXDdqpB
	GQqJJ3+vEBWS5g3OH1nHiemvrcW+OOd95bBFIkc5oQSjc80XeqeuosINXTUrMbOb6XIS
	fFGGAD8Gxlwej6Sv8rCIKS3+xSDwKiLO+90r0AfeVBjlO4wXxXvQLgvwZ6eRZL9yq6Rj
	9I11n7AQbKVD43fO2K/gWgmu47MgL0nkRZTu3XNn94s8wSEmB1c2dC/1MbJpyDYzzDXT
	yH7Xs2qDZhxMo9/35yhD2emZIHgYBi60L7Zj1TJnn41u1eYb1+Ah/jLApzmU3bxDFKTf
	qrfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=F5BM6oNGQUXIo0/mFnXVb9yROtnoPdlOILWnzLks+70=;
	b=kyq7/SKXWCz0oK+ODurvBhjeLgsF6iuca+GP8FodjACFyyTn6O4jrA2+lkMsGNQ2tr
	FQXAp83EPj00f/b/nujOySes1gRgy261odY6wW3wKIE9FnjvSNFoxC5dotnZKbYktl99
	qLlheBp16NTiZV5N/U+jC8K8/zAZmrmEEFmk2JtvK8W5XaamMgvaiEtBlakaXH7iG0NN
	UXHAqF8t8tmcMg2yYtEhkf9HIFEG7LkMOh0NbcI4ZUj57Oseup5kwG3w3CLo9VuFJAdO
	hzebFNQ2GgQk7DlN7s8XEpieP3pqzNQpkUcxISbUgNlrJV4C7zA81Mj9MoyHivU/rnAs
	LnKQ==
X-Gm-Message-State: APjAAAXK3eiOHz/GgyqvZJNKvehtscnfcTbwfwmoQ+sMKm8eH5Nd0nNb
	Md8qzA3R0QfusaovHD/4hxaoT27+
X-Google-Smtp-Source: APXvYqy252OArYxzem//kUBMKLfR3PgFDck9GXTN3jxZv+p00v9UeBZmBYSOgG7OzVue3RiuZhhA0w==
X-Received: by 2002:a2e:a408:: with SMTP id p8mr2153839ljn.54.1568731513704;
	Tue, 17 Sep 2019 07:45:13 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id a14sm479022lfg.74.2019.09.17.07.45.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Sep 2019 07:45:12 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Sep 2019 16:45:03 +0200
Message-Id: <20190917144506.43003-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/4] runqemu: add options that enable virgl with the SDL frontend
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
X-List-Received-Date: Tue, 17 Sep 2019 14:45:13 -0000

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


