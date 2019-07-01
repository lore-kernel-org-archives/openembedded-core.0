Return-Path: <anibal.limon@linaro.org>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5D2B77E7D0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2019 21:23:04 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id o101so14683935ota.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Jul 2019 14:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ByJSqe5Mc8tbY0a/Dr5mbuQgR+hIRCO4ewhQfk+Otig=;
	b=APdDJeR3nqB5vUq7ajHoJVY41OSpGGWHGCd98d5Csp+rpcbZO9WySBXBvQA9vTHdPD
	hIVExTNyfiDPLKuviBAUfibpNKoWACAGi974e1wTkG2OpEaMILel7EtOgjlhwlEZbMuP
	KcB3TjRmrKYP/E8ETkkWAVy3f1lq13Ags4SR2Z1gmuLDevHG7E3SNAtuxLML5ASNaNtm
	5cy5r49sDAmUldqcmkh/sq3B2JxQ+TtAt3Y6zwgVnPS5Tx5ma13R4fXfLQCPI1dRza5P
	505iM/ptgoyn4w2Asi5kLP69hDuY/L6B3BRqp+IpLWVGsmL5fBYcrsIS/ao9uPYEEAMl
	WEqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ByJSqe5Mc8tbY0a/Dr5mbuQgR+hIRCO4ewhQfk+Otig=;
	b=iwkwsuB0R7C1jhXL4vPWdh3YRxZPtAMpDRO8zY+CC5xlD1KIZTGsDdChaTbl+gsrEZ
	fq9U+qXArZ2ndcyvPSxJf2SCb460sXhCZGHfFG2BFcntNfWJJp7vvbO411LfvL4axIcA
	cvfrCiVUz4LR6epY3oA5eUWNjXVtSggQBjI1IniOHDtSmjveVHw6T+LL0tHhli8gVPOk
	YjaC65OpvtsZJwne+iXIc5tgaZ3CH9vVLfd98Ks7vzpiWOpRA/HsJ1tBsjmAEyuwR7y3
	ocWNZLASmMt6etqJsmtOtpbo2V8Z2v0humTeSuR5G3cwpCE3hYWR06TmmVA/HrF7Z9Tm
	cq7A==
X-Gm-Message-State: APjAAAU4h6A5XRICN/iYs2NRKS+Yp9V0zkdavY7q5l/5WovLY7uul2ER
	g9gl/5TI/4FUbh3aeuoXO5r4Mksg9Ro=
X-Google-Smtp-Source: APXvYqw/6XoBVZtRZrefFh4Vh7VgtpoOrI9Xgp9Q334radgKY+tjbIc7rRqZyv6m55ZtTHev7yCabg==
X-Received: by 2002:a9d:4d0b:: with SMTP id n11mr10346304otf.229.1562016185158;
	Mon, 01 Jul 2019 14:23:05 -0700 (PDT)
Received: from blackbox.Home ([200.68.140.5]) by smtp.gmail.com with ESMTPSA id
	v203sm4569695oie.5.2019.07.01.14.23.03
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 01 Jul 2019 14:23:04 -0700 (PDT)
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Jul 2019 16:23:48 -0500
Message-Id: <20190701212350.32503-1-anibal.limon@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCHv3 1/3] runqemu: Allow to store more than one lock for network interfaces
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
X-List-Received-Date: Mon, 01 Jul 2019 21:23:04 -0000
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


