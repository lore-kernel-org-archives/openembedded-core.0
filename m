Return-Path: <anibal.limon@linaro.org>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 44F7A7E18C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2019 17:01:38 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id a93so1568204pla.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jul 2019 10:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ByJSqe5Mc8tbY0a/Dr5mbuQgR+hIRCO4ewhQfk+Otig=;
	b=S6KaxAwOJbArlIQe2+5aXr+D24ct+ojiGKBuUKLCcnjrS9OlJc6i5GpcPJ4ZiGnxMN
	FW5s9nd9ewjCKwSteAhPzXfNElfkLYyB51lhd95aSOnW3yNuZ4RmE1rnYl/GVTCJff8N
	FzwMFmlaF5oeYyWnz5BIooxwOvCUNxjw7UkL8ZlIVOcVZfdtHZ2K79ql1HtRwkIhuxEV
	qTMfIPUdMJngWqLsYm8pUN5ledC2jwACn4YIZvv3gHbOi+CCnIyrcroQ8QLXPpACCQC2
	JIocfLMbf/65WUPPXGRLLT6CgJ9qixsoi4B+VKhZhH9g+RdVt68B6TncS71YFdbsKJVZ
	nVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ByJSqe5Mc8tbY0a/Dr5mbuQgR+hIRCO4ewhQfk+Otig=;
	b=n3d8A5WxCB39QtdQpwnVEkPOxW0UrJ5wLchsAMUmuStUzVk90X4Zurj15i23eBUqHV
	ndWoJLYJDLiYHPzPlqhXhI8OSZvlzgPp28UKtWyqUfXwpy3heYh+jFG4iSmBgtxKg9IG
	0GDQBSlUqzjKrIwMro2mokD8GDvvs7YEJQQ1iB5G8CDJrllROhPBAqyFl/5lZyEDHswv
	BAsFs2Hz9ryVZyB97h/TXuOV4xLyHsJFUjlufhBuLSXp8S2Wn1LIWvxCETgrcGZDaOLb
	+Dut15rmlcFmL5ONVOpaftSvka4P0bRFcBPxFNHoM38q21lpkv9ihYDnIQ9NMS+HHFY+
	Tpzg==
X-Gm-Message-State: APjAAAUlEQA8us4Lb8mmcQBXEmReqBbnQQQh2qM5yeQe8Nm5Q1fna5Gm
	n9V/xj+AZowCFA1qKCgP3jlCFDPvJJSq+A==
X-Google-Smtp-Source: APXvYqyqCacC2z9Kfj79lxGmKPgDTn1Bv3uHDcosQLN5BYLL2xQZpooIP1QWB+gKPDLwOlUtUO+e8w==
X-Received: by 2002:a17:902:a411:: with SMTP id
	p17mr44061222plq.104.1562173299151; 
	Wed, 03 Jul 2019 10:01:39 -0700 (PDT)
Received: from blackbox.Home ([200.68.141.206])
	by smtp.gmail.com with ESMTPSA id
	o16sm8417666pgi.36.2019.07.03.10.01.37
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 03 Jul 2019 10:01:38 -0700 (PDT)
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Jul 2019 12:02:21 -0500
Message-Id: <20190703170223.6228-1-anibal.limon@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCHv4 1/3] runqemu: Allow to store more than one lock for network interfaces
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
X-List-Received-Date: Wed, 03 Jul 2019 17:01:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In order to support multiple tap devices in the same qemu virtual
machine.

Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
---
 scripts/runqemu | 50 +++++++++++++++++++++++++------------------------
 1 file changed, 26 insertions(+), 24 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 4079f2b17d..38dd1c30d9 100755
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
@@ -204,30 +203,32 @@ class BaseConfig(object):
         # avoid cleanup twice
         self.cleaned = False
 
-    def acquire_lock(self, error=True):
-        logger.debug("Acquiring lockfile %s..." % self.lock)
+    def acquire_lock(self, lock, error=True):
+        logger.debug("Acquiring lockfile %s..." % lock)
+        descriptor = None
         try:
-            self.lock_descriptor = open(self.lock, 'w')
-            fcntl.flock(self.lock_descriptor, fcntl.LOCK_EX|fcntl.LOCK_NB)
+            descriptor = open(lock, 'w')
+            fcntl.flock(descriptor, fcntl.LOCK_EX|fcntl.LOCK_NB)
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
+            if descriptor:
+                descriptor.close()
+                descriptor = None
             return False
+        self.lock_descriptors[lock] = descriptor
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
@@ -1016,8 +1017,8 @@ class BaseConfig(object):
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
@@ -1035,8 +1036,8 @@ class BaseConfig(object):
             cmd = ('sudo', self.qemuifup, str(uid), str(gid), self.bindir_native)
             tap = subprocess.check_output(cmd).decode('utf-8').strip()
             lockfile = os.path.join(lockdir, tap)
-            self.lock = lockfile + '.lock'
-            self.acquire_lock()
+            lock = lockfile + '.lock'
+            self.acquire_lock(lock)
             self.cleantap = True
             logger.debug('Created tap: %s' % tap)
 
@@ -1268,8 +1269,8 @@ class BaseConfig(object):
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
@@ -1291,7 +1292,8 @@ class BaseConfig(object):
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


