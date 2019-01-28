Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id EEA2F7C482
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 12:47:28 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id a62so13854107wmh.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 04:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=8eo787h00lmNawve0KLMZmco67H3a2i+YKufnz9TILk=;
	b=JztXptrRIqKlkkezeHa3VS0otJkCJJ/GansadeoVw6f5VVUAsJDRLGFTBb4hACbT0C
	oR1+hZJIZd+AsnsWmBlf0+aXNENYgK4qLu2mYg6b2PIpGZ2QFEJVkj1+4wMbwHRnuUTL
	qDXTClUTmGPHaCYhViKAa47Hso6snESoPwZ+jSA/DslOJtVEr8vzF1vNazsdCXkHHU3R
	uNBqpAkCGxIciSfP8JxyYa54sn0tWzs/EmX/9IYqSeU4QcMDu7whkZxnSXSAujtWnyH0
	Be/8Gu1rgSH+C86ocHoPzZ6/WIh4moIdJBZVZ+/rm57FEqCaQPIwujL9cFaQFaHjoPU2
	6m4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=8eo787h00lmNawve0KLMZmco67H3a2i+YKufnz9TILk=;
	b=e3WdU/UPwVmkV10s0dfq4xKYreZuL7u4zLbs/jfaBMRS6WnkxAUJS73EB36Wrp2Hcx
	N1JP5J2kXsED+M2taKyviONLTU8RQmoD3K2nu05v50M50tjtXvBVsp0zXtXsFB+fLKki
	EVoHE5qzUTdszg76kpeverayMJhkTXJRAZ5FFGZUim4bp4EXvhBqJ6Jt/qXXAuvX07IE
	054lrcs2j8QJIB6F0GWag177hccAOczdLsazaDhy+N+qtfxDRnP21UoyXJmV0yj+XU4g
	UBtRfUwoHxPb4IwUY167kcIJA3bYXdK0LudAiCJ6c8IUA6Nc52t89plL8IG9jiZ/SXjy
	BZYw==
X-Gm-Message-State: AJcUukf5jRrZw6+SzNlN7F0+5AcW/KAYLqfeMpsTK5zuX0nbIYVgYEMb
	m2REtLr6E9c4lZY+cvR6qNDXMtfg
X-Google-Smtp-Source: ALg8bN4Q49WmKcjdhNgvkWlZYVSX0W0VvLGMRe+p5IMSrrNHEw7dsSje/8lehIP1ce2oQgjthNoQcg==
X-Received: by 2002:a1c:968a:: with SMTP id
	y132mr16801961wmd.107.1548679649541; 
	Mon, 28 Jan 2019 04:47:29 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	j33sm186026218wre.91.2019.01.28.04.47.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Jan 2019 04:47:28 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2019 13:46:52 +0100
Message-Id: <4d7b245b7ce321d20714cc999b03ce82088ae9f9.1548679462.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1548679462.git.alex.kanavin@gmail.com>
References: <cover.1548679462.git.alex.kanavin@gmail.com>
Subject: [PATCH 21/24] runqemu: add options for enabling virgl GL acceleration
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
X-List-Received-Date: Mon, 28 Jan 2019 12:47:29 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 scripts/runqemu | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index c4a0ca811d9..50888a532e8 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -74,6 +74,9 @@ of the following environment variables (in any order):
   MACHINE - the machine name (optional, autodetected from KERNEL filename if unspecified)
   Simplified QEMU command-line options can be passed with:
     nographic - disable video console
+    gl - enable virgl-based GL acceleration
+    gl-es - enable virgl-based GL acceleration, using OpenGL ES
+    egl-headless - enable headless EGL output; use vnc or spice to see it
     serial - enable a serial console on /dev/ttyS0
     serialstdio - enable a serial console on the console (regardless of graphics mode)
     slirp - enable user networking, no root privileges is required
@@ -433,6 +436,26 @@ class BaseConfig(object):
             elif arg == 'nographic':
                 self.qemu_opt_script += ' -nographic'
                 self.kernel_cmdline_script += ' console=ttyS0'
+            elif arg == 'gl':
+                self.qemu_opt_script += ' -vga virtio -display gtk,gl=on'
+            elif arg == 'gl-es':
+                self.qemu_opt_script += ' -vga virtio -display gtk,gl=es'
+            elif arg == 'egl-headless':
+                self.qemu_opt_script += ' -vga virtio -display egl-headless'
+                # As runqemu can be run within bitbake (when using testimage, for example),
+                # we need to ensure that we run host pkg-config, and that it does not
+                # get mis-directed to native build paths set by bitbake.
+                try:
+                    del os.environ['PKG_CONFIG_PATH']
+                    del os.environ['PKG_CONFIG_DIR']
+                    del os.environ['PKG_CONFIG_LIBDIR']
+                except KeyError:
+                    pass
+                try:
+                    dripath = subprocess.check_output("PATH=/bin:/usr/bin:$PATH pkg-config --variable=dridriverdir dri", shell=True)
+                except subprocess.CalledProcessError as e:
+                    raise RunQemuError("Could not determine the path to dri drivers on the host via pkg-config.\nPlease install Mesa development files (particularly, dri.pc) on the host machine.")
+                os.environ['LIBGL_DRIVERS_PATH'] = dripath.decode('utf-8').strip()
             elif arg == 'serial':
                 self.kernel_cmdline_script += ' console=ttyS0'
                 self.serialconsole = True
-- 
2.17.1


