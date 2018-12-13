Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 36EEE6C0EB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 11:16:07 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id u4so602479wrp.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 03:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=r8dqyueJAhiVoPqxbLtiGpvnt+PJW2iGnDLdQ83x0ec=;
	b=0EtSXAEJOl9V8npb9u+K3GW951oI2Cupx5bkJtTEAV2EVTVnCUgo6FEI0W9SFxABR7
	PPiwHULfECceydMgLLZ21Kyzr5VNJe7jajvF+p3UDB3JtC9Tg6/g7xYJ4r5Wvz2sADI1
	gBMiMqZ/06FGvvQ0Dy2ADlozFr7DEZ8ni5Kz5zdTJcHfYw3QABddQhV1nuKUduk/cKGu
	y1bbvPOuVK/SBsLrQ9VA32tNWBYKjDlSzhawnxtFOqhyLPI6+3q7Y25d9s7hNq6eAx/6
	cy/dqzlXg0eMoR8yL83txM990l32VorRZSpVjAk4sjM3ROAbhg8O2Por124KmaMs/wb0
	MHPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=r8dqyueJAhiVoPqxbLtiGpvnt+PJW2iGnDLdQ83x0ec=;
	b=lrjyn/mB8rRIV185z+wps3wXKB//D05YSkilMt7toOWloiqSRoRbU+1q+nfhVFz28L
	dj5twKjAcFkfcjcdasG8giCUB4QFkOnCBMJXdmhHggI90LsZvRnaAZLY3omNXV+i3v90
	qg4SPDdErii2vkmgO/5uJEDtFDcIL0FB0xynzBsxBecHtfGWEHTuTxCDaONVtLE5Deye
	qtUAHyRPu46IrHXCBDiiCigb4o62pHdOV0E3/vjx4rac224JoAsWRJNb/nh50M8k3BQS
	+ffJdoJ3h+2KTpfGfd0AQx7v3UZwX9oDoYRcvuvc7QPWvIfuvbFpgGRWAebOl+M+EXAs
	gw+Q==
X-Gm-Message-State: AA+aEWZWvOAq44iNlPmXJC3sfz8f+K+C1UG5o44Bwb0PjDSe7Qa6K3XZ
	nDQcz5d+vLSSj0tnKt8MXKzX4ideXWU=
X-Google-Smtp-Source: AFSGD/XroBU0pGDJuKXoO5bdh/JmdI/xGRdEiMpWC64YBniLk9u/zLjom7f14tkbLD/acTWpADQQlw==
X-Received: by 2002:adf:c505:: with SMTP id q5mr20263224wrf.84.1544699767242; 
	Thu, 13 Dec 2018 03:16:07 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	v19sm2919416wrd.46.2018.12.13.03.16.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Dec 2018 03:16:06 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Dec 2018 11:16:03 +0000
Message-Id: <20181213111604.6353-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 1/2] runqemu: clean up subprocess usage
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
X-List-Received-Date: Thu, 13 Dec 2018 11:16:07 -0000

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


