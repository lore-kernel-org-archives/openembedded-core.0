Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id 108A86D2AB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 17:10:30 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id y1so6346929wmi.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 09:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=r8dqyueJAhiVoPqxbLtiGpvnt+PJW2iGnDLdQ83x0ec=;
	b=vT1r3/JD1v4tOTAx6Ucb4/ig6lVIxmJ95CzD2mR+aD8x3RdvD5kAn5DI0iDr6W5/lE
	aiAm/RehVoxDH1iXByYS5k9nmqJeQmSbOJt0CN2m+chU3HM37QOvYvFeGvvaualnVVGk
	iu7UBgYRm9Dg0POvNvoEulSfCfhqDM2+ekGVkHsNBogGWqdJ4OFv46zaTI4XjReJNBBy
	05CJWkHPtsHT1/8QUvVXTKmCGdkwz+5aNYfKY1E8o8s4SEMuKFQF+YpniRcVLzwiUIK6
	RCvWiee4Px1oo8gowPH2Dh6r0ne2TlBUgnblVUpFHvVkFggGfZ3SP+OkP/Ku/+0MzN9G
	NbQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=r8dqyueJAhiVoPqxbLtiGpvnt+PJW2iGnDLdQ83x0ec=;
	b=R9q7KI6QZVJadthohvpdCAQtkKenhDy31oAJk6Jzyca6npHukGeV00AWcduTtaPqMQ
	7Bjd/5yC/cCmyAJ4Lolla3N9OlLsIaCdsqH3SV2UD9BmtORXj6S0MlDhOfzcqp/lEGgU
	5WmnvqzFZ7A80/EL+VhKsvBTBMhi7+wyZGp3iQ/Q4kYrCABrXElXv/5y2avpuOw6ySao
	6c1KFYz1j2uGk+BpRBKlzAT6Caexqj79CRv/wB4RGFMth3yun0TuWksEqdxDr/yCpYcI
	CntEPdziG3D+4tv2mOHBRYAPKx3nO+HuUpdMPxqmQWo+n9N33AQa2EbInLyVqF6F3wGV
	a+tg==
X-Gm-Message-State: AA+aEWZP3fOnz6zj4W/yAlP+sKxnJARzjCGe1ro+TlsnvwiY2Ju0KAnL
	iRnXF6Rbi84nESZRVDAbO/NlnSZU5DY=
X-Google-Smtp-Source: AFSGD/XmWx6Z/c3aJmxbiRduqdFJVvpq1Zzjle9y2WB3P6dQfYvDl8J7f+Wxlonxf84eTnkwzXTJPQ==
X-Received: by 2002:a1c:888d:: with SMTP id k135mr4059322wmd.137.1544807431240;
	Fri, 14 Dec 2018 09:10:31 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id f2sm3743394wre.34.2018.12.14.09.10.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Dec 2018 09:10:30 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Dec 2018 17:10:28 +0000
Message-Id: <20181214171028.1846-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] runqemu: clean up subprocess usage
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
X-List-Received-Date: Fri, 14 Dec 2018 17:10:31 -0000

Where possible pass lists instead of strings, don't use a subshell, and call
check*() instead of using Popen directly.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/runqemu | 63 ++++++++++++++++++++++++++-------------------------------
 1 file changed, 29 insertions(+), 34 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index f661892aecf..c4a0ca811d9 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -116,9 +116,9 @@ def check_tun():
         raise RunQemuError("TUN control device %s is not writable, please fix (e.g. sudo chmod 666 %s)" % (dev_tun, dev_tun))
 
 def check_libgl(qemu_bin):
-    cmd = 'ldd %s' % qemu_bin
-    logger.debug('Running %s...' % cmd)
-    need_gl = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE).stdout.read().decode('utf-8')
+    cmd = ('ldd', qemu_bin)
+    logger.debug('Running %s...' % str(cmd))
+    need_gl = subprocess.check_output(cmd).decode('utf-8')
     if re.search('libGLU', need_gl):
         # We can't run without a libGL.so
         libgl = False
@@ -400,7 +400,7 @@ class BaseConfig(object):
 
         cmd = 'MACHINE=%s bitbake -e' % arg
         logger.info('Running %s...' % cmd)
-        self.bitbake_e = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE).stdout.read().decode('utf-8')
+        self.bitbake_e = subprocess.check_output(cmd, shell=True).decode('utf-8')
         # bitbake -e doesn't report invalid MACHINE as an error, so
         # let's check DEPLOY_DIR_IMAGE to make sure that it is a valid
         # MACHINE.
@@ -843,10 +843,7 @@ class BaseConfig(object):
                 self.nfs_server = '192.168.7.1'
 
         # Figure out a new nfs_instance to allow multiple qemus running.
-        # CentOS 7.1's ps doesn't print full command line without "ww"
-        # when invoke by subprocess.Popen().
-        cmd = "ps auxww"
-        ps = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE).stdout.read().decode('utf-8')
+        ps = subprocess.check_output(("ps", "auxww")).decode('utf-8')
         pattern = '/bin/unfsd .* -i .*\.pid -e .*/exports([0-9]+) '
         all_instances = re.findall(pattern, ps, re.M)
         if all_instances:
@@ -886,17 +883,17 @@ class BaseConfig(object):
                 if not src:
                     raise RunQemuError("No NFS_DIR is set, and can't find %s or %s to extract" % (src1, src2))
                 logger.info('NFS_DIR not found, extracting %s to %s' % (src, dest))
-                cmd = 'runqemu-extract-sdk %s %s' % (src, dest)
-                logger.info('Running %s...' % cmd)
-                if subprocess.call(cmd, shell=True) != 0:
+                cmd = ('runqemu-extract-sdk', src, dest)
+                logger.info('Running %s...' % str(cmd))
+                if subprocess.call(cmd) != 0:
                     raise RunQemuError('Failed to run %s' % cmd)
                 self.clean_nfs_dir = True
                 self.rootfs = dest
 
         # Start the userspace NFS server
-        cmd = 'runqemu-export-rootfs start %s' % self.rootfs
-        logger.info('Running %s...' % cmd)
-        if subprocess.call(cmd, shell=True) != 0:
+        cmd = ('runqemu-export-rootfs', 'start', self.rootfs)
+        logger.info('Running %s...' % str(cmd))
+        if subprocess.call(cmd) != 0:
             raise RunQemuError('Failed to run %s' % cmd)
 
         self.nfs_running = True
@@ -962,9 +959,9 @@ class BaseConfig(object):
             except FileExistsError:
                 pass
 
-        cmd = '%s link' % ip
-        logger.debug('Running %s...' % cmd)
-        ip_link = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE).stdout.read().decode('utf-8')
+        cmd = (ip, 'link')
+        logger.debug('Running %s...' % str(cmd))
+        ip_link = subprocess.check_output(cmd).decode('utf-8')
         # Matches line like: 6: tap0: <foo>
         possibles = re.findall('^[0-9]+: +(tap[0-9]+): <.*', ip_link, re.M)
         tap = ""
@@ -989,8 +986,8 @@ class BaseConfig(object):
             gid = os.getgid()
             uid = os.getuid()
             logger.info("Setting up tap interface under sudo")
-            cmd = 'sudo %s %s %s %s' % (self.qemuifup, uid, gid, self.bindir_native)
-            tap = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE).stdout.read().decode('utf-8').rstrip('\n')
+            cmd = ('sudo', self.qemuifup, str(uid), str(gid), self.bindir_native)
+            tap = subprocess.check_output(cmd).decode('utf-8').strip()
             lockfile = os.path.join(lockdir, tap)
             self.lock = lockfile + '.lock'
             self.acquire_lock()
@@ -1025,7 +1022,7 @@ class BaseConfig(object):
         if self.get('QB_NET') == 'none':
             return
         if sys.stdin.isatty():
-            self.saved_stty = subprocess.check_output("stty -g", shell=True).decode('utf-8')
+            self.saved_stty = subprocess.check_output(("stty", "-g")).decode('utf-8').strip()
         self.network_device = self.get('QB_NETWORK_DEVICE') or self.network_device
         if self.slirp_enabled:
             self.setup_slirp()
@@ -1139,7 +1136,7 @@ class BaseConfig(object):
         if not qemu_system:
             raise RunQemuError("Failed to boot, QB_SYSTEM_NAME is NULL!")
 
-        qemu_bin = '%s/%s' % (self.bindir_native, qemu_system)
+        qemu_bin = os.path.join(self.bindir_native, qemu_system)
 
         # It is possible to have qemu-native in ASSUME_PROVIDED, and it won't
         # find QEMU in sysroot, it needs to use host's qemu.
@@ -1177,7 +1174,7 @@ class BaseConfig(object):
 
         if self.serialconsole:
             if sys.stdin.isatty():
-                subprocess.check_call("stty intr ^]", shell=True)
+                subprocess.check_call(("stty", "intr", "^]"))
                 logger.info("Interrupt character is '^]'")
 
             first_serial = ""
@@ -1241,20 +1238,19 @@ class BaseConfig(object):
 
         logger.info("Cleaning up")
         if self.cleantap:
-            cmd = 'sudo %s %s %s' % (self.qemuifdown, self.tap, self.bindir_native)
-            logger.debug('Running %s' % cmd)
-            subprocess.check_call(cmd, shell=True)
+            cmd = ('sudo', self.qemuifdown, self.tap, self.bindir_native)
+            logger.debug('Running %s' % str(cmd))
+            subprocess.check_call(cmd)
         self.release_lock()
 
         if self.nfs_running:
             logger.info("Shutting down the userspace NFS server...")
-            cmd = "runqemu-export-rootfs stop %s" % self.rootfs
-            logger.debug('Running %s' % cmd)
-            subprocess.check_call(cmd, shell=True)
+            cmd = ("runqemu-export-rootfs", "stop", self.rootfs)
+            logger.debug('Running %s' % str(cmd))
+            subprocess.check_call(cmd)
 
         if self.saved_stty:
-            cmd = "stty %s" % self.saved_stty
-            subprocess.check_call(cmd, shell=True)
+            subprocess.check_call(("stty", self.saved_stty))
 
         if self.clean_nfs_dir:
             logger.info('Removing %s' % self.rootfs)
@@ -1296,10 +1292,9 @@ class BaseConfig(object):
         if result and os.path.exists(result):
             return result
 
-        cmd = 'bitbake qemu-helper-native -e'
-        logger.info('Running %s...' % cmd)
-        out = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE)
-        out = out.stdout.read().decode('utf-8')
+        cmd = ('bitbake', 'qemu-helper-native', '-e')
+        logger.info('Running %s...' % str(cmd))
+        out = subprocess.check_output(cmd).decode('utf-8')
 
         match = re.search('^STAGING_BINDIR_NATIVE="(.*)"', out, re.M)
         if match:
-- 
2.11.0


