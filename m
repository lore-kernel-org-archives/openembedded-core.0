Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 60D1C7C547
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Feb 2019 13:06:14 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id l9so6957676wrt.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Feb 2019 05:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=8eo787h00lmNawve0KLMZmco67H3a2i+YKufnz9TILk=;
	b=Bk7UDj2IiPGINK+qW1JUWfkNl5CvICAVOkFV+zXeQ3Gg+/i/x7ZP7qA+sLhIqziviP
	4jYaWTD0zcneRCH6rwvOS6Wie5ZpkJuP84Trfm6jaJnF+Fj3jqEOUwIS/80umAaO4Ce6
	jE2bs2wS5jtwT7IMkQo8A9rE3vj64DLGnvUUvcO/o/1JVtTQ9iwOZWENjltdM7lismWW
	SbgDm+uSYw+I1WRja7lV1QXrDivnWvhZUP9xzebwsWkKjHX7qw6jhJt38+pyuzBNn1TG
	xktQ6vUvxmEnZjRYdO/KFNdflqExFUdgLwPBHd4qaUMaF+pHY3/L9Tq9usMy22xCzRDW
	Z+Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=8eo787h00lmNawve0KLMZmco67H3a2i+YKufnz9TILk=;
	b=AVhhSwbUcQawKL/qW85QU5GYHcRgm/xzb+RFBzbqOokjJ7yn4MV5whCKIPeGVikZY6
	HkKEvTha5sb6kDyenAb5A13y89JTaC4S8Q6Eux1aRYL6gUbU42x0HjNDSY85Q92Ni4ls
	e8Xr28cq9uqr+0fxPljkoEdJu+U7qppV4ZISbTcGGrQc+7CAoyAS5z238swBI0kqW+vF
	eQxeuG7Gaj03/f0LoGYUGYUKEDQZOSvQjtsaULkB7l0G4GcJYO0/oHbsNglq+SE/SED+
	Tc6HicQkUTDK1JdkBKA45nERkCi53wRKcrT+Zoyvfoxi6a8rgWro4EleTmRFA4XGbDIr
	L+cA==
X-Gm-Message-State: AHQUAuZKg9gNy6Kt3EGCfJ9hufT1v3cxpKLWCDuzZKwKoNFWRxcJprBc
	qbn4wn5FgBk2mWvKI+3ve8XjvaSx
X-Google-Smtp-Source: AHgI3IZGl/+Y9b56M0m9v/hODaEVW/U+jGrhcGsST/4H9Ht9FDSvvuGqRxqtsKHMzcuxq4pKzRSH/w==
X-Received: by 2002:adf:f34e:: with SMTP id e14mr2387041wrp.240.1549026374772; 
	Fri, 01 Feb 2019 05:06:14 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	a14sm1273972wrr.13.2019.02.01.05.06.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Feb 2019 05:06:13 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Feb 2019 14:05:52 +0100
Message-Id: <20190201130554.90094-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190201130554.90094-1-alex.kanavin@gmail.com>
References: <20190201130554.90094-1-alex.kanavin@gmail.com>
Subject: [PATCH 11/13] runqemu: add options for enabling virgl GL acceleration
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
X-List-Received-Date: Fri, 01 Feb 2019 13:06:14 -0000

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


