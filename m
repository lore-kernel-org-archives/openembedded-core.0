Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1F78F7CBFF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 14:34:04 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id l5so2609039wrw.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 06:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Oj3HgFxF7ekf10ZfJs5wQk5uzI4oDDebKPQdYwo/M/o=;
	b=qctt1WkjDyJAXf+86g9Wz34tJfWoSj5om2jnsjO6RYpKGTtQ6PVzDbRn0JGeqFxQLT
	lieSvYeKIh+rOqh7bD7AkiA9JRwW2P8sF0KiCoSpSnKBFguiCDaqEOeMXHSo6UDmfJEu
	Tpq/t/ChcFmTfrNtoBN7XY/ajroWdm7+lTJkl1QDtlZSHFdhS5tGXRR23fmDWYm2R6b+
	J4AYy/tcxDz1s46Bip/e4aUUoXLWSzmxutziku5ADA1jgJNVJ846Lxg5uI+NKZpc60EV
	60lvJK0wrZRPzdPelJdpLSbJKRdBqFqoO1wBPWod6R8H4Q+p+KNaVaejI38N35X4sS/n
	IchA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Oj3HgFxF7ekf10ZfJs5wQk5uzI4oDDebKPQdYwo/M/o=;
	b=b2lkrlvuzutN7bGPOWl4MM6FrIIN1crAvDW8uI2y4hgdDlqVzoob7734V9qqfgJGrI
	v5JFVLRqdNoa677sduVpFO4qAaapZhKokrFFUYMjVFPGdCn6jK/X5OIYofWrResg0RwI
	ElbYhXHzAHUQM+bGGK5O+KdX3OgG4d8C7LkGB3vK/gCkVe2uOcBYtkRat7wwxEymKvH6
	8+l0JxiPAAbvZDp2K3XEpQ9ypWseK6kFwM0wfmV632F5lCce0DA5JSsGjIDVyVJAdTGP
	M+KM9jtOPmbO5bn5tRGIWxpZKf/QcmJB8LnLxbuqJkdNiqIZL2eUQqLAvUZ7U9UcT06e
	/Mpg==
X-Gm-Message-State: AHQUAublTbpQuxAGZpFf5qOhkxrBiCzQKaLC5hVdwvpImz2xugUxj/Xs
	fQLS647Ds+mI/rKMtMFy8/gIF1Sz
X-Google-Smtp-Source: AHgI3IakPzmudimNfq6rNVceG+5oQCcPRXoiBL8MrA6j8vTGtlQJ5LAO0V35eLDhQv7QNXkEYUxc0g==
X-Received: by 2002:adf:9f54:: with SMTP id f20mr3323165wrg.88.1550846045523; 
	Fri, 22 Feb 2019 06:34:05 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id p1sm2085184wrx.50.2019.02.22.06.34.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Feb 2019 06:34:04 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Feb 2019 15:33:46 +0100
Message-Id: <5f3f78a31e8eccfb2703b684e247aeda8090f691.1550845989.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1550845989.git.alex.kanavin@gmail.com>
References: <cover.1550845989.git.alex.kanavin@gmail.com>
Subject: [PATCH 11/12] runqemu: do not check for GL libraries
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
X-List-Received-Date: Fri, 22 Feb 2019 14:34:05 -0000

qemu has been using libepoxy for a long time, and libepoxy loads GL via dlopen()
only when instructed to.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 scripts/runqemu | 35 -----------------------------------
 1 file changed, 35 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 054037312b8..ec6188ba4a2 100755
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
@@ -1194,8 +1161,6 @@ class BaseConfig(object):
         if not os.access(qemu_bin, os.X_OK):
             raise OEPathError("No QEMU binary '%s' could be found" % qemu_bin)
 
-        check_libgl(qemu_bin)
-
         self.qemu_opt = "%s %s %s %s" % (qemu_bin, self.get('NETWORK_CMD'), self.get('ROOTFS_OPTIONS'), self.get('QB_OPT_APPEND'))
 
         for ovmf in self.ovmf_bios:
-- 
2.17.1


