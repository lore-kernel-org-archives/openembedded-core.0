Return-Path: <anibal.limon@linaro.org>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id 86C096C149
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2019 21:18:07 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id o101so14671412ota.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Jul 2019 14:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hmeKpZsM5UFB/SVPkYcwh/IiH6jl+9WHQTT+pVcUicM=;
	b=uXwSaZq9G7scokVTooEpKVk1pOUHc9gcegarj1xiJRFL+3C+AAzKT8kpr3X9+fLppT
	ea4/A4NAes6qfGe4MLd/muscSU2X9GRrDd+ioFxZjnzzA7vLMykzre82DjjKu+dsPFuZ
	IS+B/U/Qh7XNK89F+duwzknT6RJ/O1IGooZMl4LOHyUYuNB6XmxtJPWpIx6Fgvdjud9E
	4xVsqzOQlPuDkWzeQo3h8jlwua8UMVbJdB4EFwN/0CX2Dpjkp3I+Sc27vGuIoNGPFir+
	awNqaq4cSAIbF2raLOSHQQqlVrCTpFJB9bjQcQqcsO09+kEvtXVOza5UxMgNKd4D86nB
	0ypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hmeKpZsM5UFB/SVPkYcwh/IiH6jl+9WHQTT+pVcUicM=;
	b=Z8qf1FqoZvfTTFtBcO3vzoxaIN/Dz74FwO0PpkG9OyEWE4pirf49582G7gE4qJiSBi
	n7zA6VBX3EVWCuKoOOikFg2xfEyOhqXdqq0MZVsOwNhqBvux/QXCwwiANzahr9o5LYNp
	99KuUJBnzLa49PCWngf4a53VGmqeXX7otJrG+clsiIg9q1QRF28JEj/ZICWAYpBxg1+V
	akYIYxVz92zBPhcoNAnj9alz1Ugep3xGB0TITbAAwFYyHPfjh4jNJcKbNjhsPkbFrvXl
	zo4D9rvOB+ToeRuwZiriLDr6Y2ZfKFp1+6ymWufcr5Z9xrHPLw+bA4DvoN0+9fOebjT9
	sSdg==
X-Gm-Message-State: APjAAAX7fRcHy0jI+LBpiHFip9Wkm1IzstOSZifZ5R54j0gCn59Zrpfr
	aD+ldhR5tAhSRVw8Uyg6jmIIT4zfQSk=
X-Google-Smtp-Source: APXvYqwiwnte+dQnuawp4qo76H4mgvYsoM1nr990DVQ8CG1rq/yJlaWnd7yIAaMK3+a71bhfwxWWzw==
X-Received: by 2002:a9d:69ce:: with SMTP id v14mr2876934oto.39.1562015888174; 
	Mon, 01 Jul 2019 14:18:08 -0700 (PDT)
Received: from blackbox.Home ([200.68.140.5]) by smtp.gmail.com with ESMTPSA id
	l15sm4460040otr.38.2019.07.01.14.18.06
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 01 Jul 2019 14:18:07 -0700 (PDT)
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Jul 2019 16:18:47 -0500
Message-Id: <20190701211849.31989-1-anibal.limon@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCHv2 1/3] runqemu: Allow to store more than one lock for network interfaces
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
X-List-Received-Date: Mon, 01 Jul 2019 21:18:07 -0000
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


