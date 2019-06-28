Return-Path: <anibal.limon@linaro.org>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id BD2397E71D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2019 03:37:51 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id k8so2427129plt.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 20:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hmeKpZsM5UFB/SVPkYcwh/IiH6jl+9WHQTT+pVcUicM=;
	b=mC+j9GQOysUT4arn2pxzjywkLDf4bXV4YObmrGkz/T0ystV0yMZQ1XVB6PmSaUbjtT
	aTiwNLLj8K2U8BGmixDO7U0ROAKmZVMJNEJKCJJOls3qQUyY/bOdjnOmuc62AfNABI4y
	XIlR+kgGAvVRQyakxaB5q3f3TNy2neVmDMOkXy+eJdUMSvo1iZZSA738UbyuQLemARuM
	s7/O2Y2iBjL7yzl/SRwKqyDnNwLVfjwdmAAwCn+fb/Y7buvIE2jmmq37+P4aTq0PIkqb
	us05u7WjMqxH/ylCtcWDC/WLYswkVnYZb5M2mt0Na2Lebh/nqQV1HBbOnOZ3D9cpY6zz
	zvow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hmeKpZsM5UFB/SVPkYcwh/IiH6jl+9WHQTT+pVcUicM=;
	b=PCXZoNkv9/1zK88bEOhi+7Pbts8U0zx30U0269XeMykGMDg/RD6Q2ld/G/M+FtOSGG
	2NS56YFQLpdq78Pv/OKTyH+CA+ZLXaKzI2hEaTjtVCvvdL+QtyxLFeDh0FEJ7wK8jdvp
	/+C2LVf1BWgf69Tiis8VkDHjtKDAL900BqlfcM5QnRmFpyLRcx3Vs+H3b82KQ5K4pqAe
	mHLti1WoFTAhAVUkN4o3c/2VMACVzwkX0UX4dysZWXw6ffiTlXOPCIFqkTvAjRW7zhuW
	8nm+GKhYYOjurKzsTQm4VWf7QKYbr/L73gf59lrMsoCm8d9ItTr8BoDlEF9vfEv8RKT5
	ubdA==
X-Gm-Message-State: APjAAAXDeMxmu//JU1UTHNtSIxBc+V4C6oztC9jvw72J9xTTgXN80MkE
	nvTAcFYHYn+o97ihIxnXM8JwNW+Va1NjHzt4
X-Google-Smtp-Source: APXvYqykfZKc5u7b5XL4MHJ4l3f5RF564NgfNe5Qdt3py6dVrz6L9HHQ+C7lfRnW5lhfSX6A4VBxmQ==
X-Received: by 2002:a17:902:15c5:: with SMTP id
	a5mr8929427plh.39.1561693072635; 
	Thu, 27 Jun 2019 20:37:52 -0700 (PDT)
Received: from blackbox.Home ([200.68.140.5]) by smtp.gmail.com with ESMTPSA id
	e184sm566027pfa.169.2019.06.27.20.37.50
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 27 Jun 2019 20:37:52 -0700 (PDT)
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Jun 2019 22:38:28 -0500
Message-Id: <20190628033830.27713-1-anibal.limon@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/3] runqemu: Allow to store more than one lock for network interfaces
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
X-List-Received-Date: Fri, 28 Jun 2019 03:37:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In order to support multiple tap devices in the same qemu virtual
machine.

Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
---
 scripts/runqemu | 48 ++++++++++++++++++++++++------------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 4079f2b17d..8a54c9ef9a 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -181,8 +181,7 @@ class BaseConfig(object):
         self.audio_enabled = False
         self.tcpserial_portnum = ''
         self.custombiosdir = ''
-        self.lock = ''
-        self.lock_descriptor = None
+        self.lock_descriptors = {}
         self.bitbake_e = ''
         self.snapshot = False
         self.wictypes = ('wic', 'wic.vmdk', 'wic.qcow2', 'wic.vdi')
@@ -204,30 +203,30 @@ class BaseConfig(object):
         # avoid cleanup twice
         self.cleaned = False
 
-    def acquire_lock(self, error=True):
-        logger.debug("Acquiring lockfile %s..." % self.lock)
+    def acquire_lock(self, lock, error=True):
+        logger.debug("Acquiring lockfile %s..." % lock)
         try:
-            self.lock_descriptor = open(self.lock, 'w')
-            fcntl.flock(self.lock_descriptor, fcntl.LOCK_EX|fcntl.LOCK_NB)
+            self.lock_descriptors[lock] = open(lock, 'w')
+            fcntl.flock(self.lock_descriptors[lock], fcntl.LOCK_EX|fcntl.LOCK_NB)
         except Exception as e:
-            msg = "Acquiring lockfile %s failed: %s" % (self.lock, e)
+            msg = "Acquiring lockfile %s failed: %s" % (lock, e)
             if error:
                 logger.error(msg)
             else:
                 logger.info(msg)
-            if self.lock_descriptor:
-                self.lock_descriptor.close()
-                self.lock_descriptor = None
+            if self.lock_descriptors[lock]:
+                self.lock_descriptor[lock].close()
+                self.lock_descriptor[lock] = None
             return False
         return True
 
-    def release_lock(self):
-        if self.lock_descriptor:
-            logger.debug("Releasing lockfile for tap device '%s'" % self.tap)
-            fcntl.flock(self.lock_descriptor, fcntl.LOCK_UN)
-            self.lock_descriptor.close()
-            os.remove(self.lock)
-            self.lock_descriptor = None
+    def release_lock(self, lock):
+        if self.lock_descriptors[lock]:
+            logger.debug("Releasing lockfile for tap device '%s'" % lock)
+            fcntl.flock(self.lock_descriptors[lock], fcntl.LOCK_UN)
+            self.lock_descriptors[lock].close()
+            os.remove(lock)
+            self.lock_descriptors[lock] = None
 
     def get(self, key):
         if key in self.d:
@@ -1016,8 +1015,8 @@ class BaseConfig(object):
             if os.path.exists('%s.skip' % lockfile):
                 logger.info('Found %s.skip, skipping %s' % (lockfile, p))
                 continue
-            self.lock = lockfile + '.lock'
-            if self.acquire_lock(error=False):
+            lock = lockfile + '.lock'
+            if self.acquire_lock(lock, error=False):
                 tap = p
                 logger.info("Using preconfigured tap device %s" % tap)
                 logger.info("If this is not intended, touch %s.skip to make runqemu skip %s." %(lockfile, tap))
@@ -1035,8 +1034,8 @@ class BaseConfig(object):
             cmd = ('sudo', self.qemuifup, str(uid), str(gid), self.bindir_native)
             tap = subprocess.check_output(cmd).decode('utf-8').strip()
             lockfile = os.path.join(lockdir, tap)
-            self.lock = lockfile + '.lock'
-            self.acquire_lock()
+            lock = lockfile + '.lock'
+            self.acquire_lock(lock)
             self.cleantap = True
             logger.debug('Created tap: %s' % tap)
 
@@ -1268,8 +1267,8 @@ class BaseConfig(object):
         cmds = shlex.split(cmd)
         logger.info('Running %s\n' % cmd)
         pass_fds = []
-        if self.lock_descriptor:
-            pass_fds = [self.lock_descriptor.fileno()]
+        if self.lock_descriptors.keys():
+            pass_fds = [self.lock_descriptors[lock].fileno() for lock in self.lock_descriptors.keys()]
         process = subprocess.Popen(cmds, stderr=subprocess.PIPE, pass_fds=pass_fds)
         self.qemupid = process.pid
         retcode = process.wait()
@@ -1291,7 +1290,8 @@ class BaseConfig(object):
             cmd = ('sudo', self.qemuifdown, self.tap, self.bindir_native)
             logger.debug('Running %s' % str(cmd))
             subprocess.check_call(cmd)
-        self.release_lock()
+        for lock in self.lock_descriptors.keys():
+            self.release_lock(lock)
 
         if self.nfs_running:
             logger.info("Shutting down the userspace NFS server...")
-- 
2.20.1


