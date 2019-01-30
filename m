Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 065E47C346
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 11:00:09 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id b11so21166890wmj.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 03:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=u7oP66hZP16ci5FHj8XrEGBkVfCva+riamKQPNNfGhQ=;
	b=Ql081p4oupgC7HfeeKtEJV41wapW/CfPLKIQtsHpaMyHVzWJzH3ynq43A0422oMYjo
	cH4o4X/0xc+aNWj0neJI/+njUAxtQgaT07XqT0+AeiZafb+uNNQZQ5zmP1wbn6iL9Gkh
	q0wF3CEckuK73eFXrNtXfGgbBhxj4kN8poljX5Rua3S5Z5fSMIZixn9ytWthC7EPBxtQ
	f+sr5l8VYOPOAMndHvzunDha82+XUfMj+elvLiOukyHtK0jZVSRi3mjANrLN6NYI4TIo
	a9vMTZausrCAOlN+qHKwrZDCsj4cyj7hhxPAmpLyH729a5+srAeZgDdEDNjS/vnm6yB4
	KsGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=u7oP66hZP16ci5FHj8XrEGBkVfCva+riamKQPNNfGhQ=;
	b=Du4RoxnNdFIPX0eZRHYdhMmaur8nVX4GsD2/6HiBuFdpZCqIH3P8xLHaDwXPYucf78
	AE0QImPuImShhsaIGkRl5aOeo//DT6Zl726ZqhDKc2YYqqn5xCDGfVt99w7P5mQZh5yb
	hl/7XzSpSbkOjgjE09pz2kPEHmhkeuv3VRMJnX6jA8ssyWxozZ+lEQdvfwpcbrErWHle
	si3WlLVhPtqAKD28OKqPM3+qkisT09uamOMIFAeHmeY6EBwjwnokIEGWHV/y1zQZsLrf
	BamcUVSHlvTeKauT9QAmzEM+9JDG3YPca0AFqKlCOqX7EwhrYnJjW66ZgC1UoRyGsYaC
	qCVg==
X-Gm-Message-State: AHQUAuZukUYJ3uVKg/c/meWnzOJXSxNi64J71DqLxWhg/xyuUSVdtB9w
	K6D5XgymLMwiclpt13vgMOGBm1oY
X-Google-Smtp-Source: AHgI3IbxWeeNi5CM4Auwx5QUkiZhGvtbrxgxeYpcFBoNQnjv4yDVWpzGpOg04I0syMa37gmtlzoGdw==
X-Received: by 2002:a1c:d14d:: with SMTP id i74mr5704339wmg.100.1548846010471; 
	Wed, 30 Jan 2019 03:00:10 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	a18sm1127705wrp.13.2019.01.30.03.00.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jan 2019 03:00:09 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2019 11:59:41 +0100
Message-Id: <fbbf8a70c63b5ac79fbe37a5731faf2960e613e1.1548845917.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1548845917.git.alex.kanavin@gmail.com>
References: <cover.1548845917.git.alex.kanavin@gmail.com>
Subject: [PATCH 18/20] runqemu: do not check for GL libraries
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
X-List-Received-Date: Wed, 30 Jan 2019 11:00:10 -0000

qemu has been using libepoxy for a long time, and libepoxy loads GL via dlopen()
only when instructed to.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 scripts/runqemu | 35 -----------------------------------
 1 file changed, 35 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 50888a532e8..586f8700c94 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -118,39 +118,6 @@ def check_tun():
     if not os.access(dev_tun, os.W_OK):
         raise RunQemuError("TUN control device %s is not writable, please fix (e.g. sudo chmod 666 %s)" % (dev_tun, dev_tun))
 
-def check_libgl(qemu_bin):
-    cmd = ('ldd', qemu_bin)
-    logger.debug('Running %s...' % str(cmd))
-    need_gl = subprocess.check_output(cmd).decode('utf-8')
-    if re.search('libGLU', need_gl):
-        # We can't run without a libGL.so
-        libgl = False
-        check_files = (('/usr/lib/libGL.so', '/usr/lib/libGLU.so'), \
-            ('/usr/lib64/libGL.so', '/usr/lib64/libGLU.so'), \
-            ('/usr/lib/*-linux-gnu/libGL.so', '/usr/lib/*-linux-gnu/libGLU.so'))
-
-        for (f1, f2) in check_files:
-            if re.search('\*', f1):
-                for g1 in glob.glob(f1):
-                    if libgl:
-                        break
-                    if os.path.exists(g1):
-                        for g2 in glob.glob(f2):
-                            if os.path.exists(g2):
-                                libgl = True
-                                break
-                if libgl:
-                    break
-            else:
-                if os.path.exists(f1) and os.path.exists(f2):
-                    libgl = True
-                    break
-        if not libgl:
-            logger.error("You need libGL.so and libGLU.so to exist in your library path to run the QEMU emulator.")
-            logger.error("Ubuntu package names are: libgl1-mesa-dev and libglu1-mesa-dev.")
-            logger.error("Fedora package names are: mesa-libGL-devel mesa-libGLU-devel.")
-            raise RunQemuError('%s requires libGLU, but not found' % qemu_bin)
-
 def get_first_file(cmds):
     """Return first file found in wildcard cmds"""
     for cmd in cmds:
@@ -1178,8 +1145,6 @@ class BaseConfig(object):
         if not os.access(qemu_bin, os.X_OK):
             raise OEPathError("No QEMU binary '%s' could be found" % qemu_bin)
 
-        check_libgl(qemu_bin)
-
         self.qemu_opt = "%s %s %s %s" % (qemu_bin, self.get('NETWORK_CMD'), self.get('ROOTFS_OPTIONS'), self.get('QB_OPT_APPEND'))
 
         for ovmf in self.ovmf_bios:
-- 
2.17.1


