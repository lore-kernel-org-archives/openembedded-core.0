Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B836CA9ED8
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 20:00:00 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32779.1791748795179815389
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 12:59:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=UW4uwx8M;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1329275-20261011195952a7b10dad7200020728-g2w1jd@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20261011195952a7b10dad7200020728
        for <openembedded-core@lists.openembedded.org>;
        Sun, 11 Oct 2026 21:59:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=74L/jaV7VvqffBY4Zn4nO45hJB3XP1YCW+Cgii61EHo=;
 b=UW4uwx8Ml+CS7j5fWy2iEXbuIDuVMU70M8eCCrUACEeb23PythX8tSUwDHkLJlZidMyUVC
 H2oUNdnYYnblW7ryZL6b+H1Fkmbj09Pa79udzLxXuFZHRxHyEG5xEwoLi4H0l45IOfv2OCcA
 xtI0fXiKj/ycwRelEAyDnq3okgb0UYskl/i/i5irRWdjrnMlrt6SBcOThM15H4/bWcKXbHGG
 foYo2+5eqHvDT8i3dX5jlpWCbv7OatqXjj0yzZE/reGgcl3kAT6zXD7Sn/Gg93plip4XkFzY
 JYeKbUICZAz7pbrKHfTvQrOiTlAtalVbbT/uaH9DIaYuEWVqFF++7aHQ==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 03/11] runqemu: rename the port lock helpers to generic lock helpers
Date: Sun, 11 Oct 2026 21:59:08 +0200
Message-ID: <20261011195949.2118607-4-adrian.freihofer@siemens.com>
In-Reply-To: <20261011195949.2118607-1-adrian.freihofer@siemens.com>
References: <20261011195949.2118607-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 20:00:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247582

From: Adrian Freihofer <adrian.freihofer@siemens.com>

acquire_portlock()/release_portlock()/self.portlocks implement a plain
"hold a flock on a numbered lockfile, pass the fd to qemu, close it on
cleanup" scheme that is not specific to ports. Drop "port" from the
names so the same helpers can be used to allocate other per-instance
resources without the names becoming misleading.

No functional change.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/runqemu | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 5f1af740c9..6544c3884b 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -198,7 +198,7 @@ class BaseConfig(object):
         self.tcpserial_portnum = ''
         self.taplock = ''
         self.taplock_descriptor = None
-        self.portlocks = {}
+        self.locks = {}
         self.bitbake_e = ''
         self.snapshot = False
         self.wictypes = ('wic.zst', 'wic', 'wic.vmdk', 'wic.qcow2', 'wic.vdi', "wic.vhd", "wic.vhdx")
@@ -263,11 +263,11 @@ class BaseConfig(object):
     def check_free_port(self, host, port, lockdir):
         """ Check whether the port is free or not """
         lockfile = os.path.join(lockdir, str(port) + '.lock')
-        if self.acquire_portlock(lockfile):
+        if self.acquire_lock(lockfile):
             with closing(socket.socket(socket.AF_INET, socket.SOCK_STREAM)) as sock:
                 if sock.connect_ex((host, port)) == 0:
                     # Port is open, so not free
-                    self.release_portlock(lockfile)
+                    self.release_lock(lockfile)
                     return False
                 else:
                     # Port is not open, so free
@@ -275,33 +275,33 @@ class BaseConfig(object):
         else:
             return False
 
-    def acquire_portlock(self, lockfile):
+    def acquire_lock(self, lockfile):
         logger.debug("Acquiring lockfile %s..." % lockfile)
-        portlock_descriptor = None
+        lock_descriptor = None
         try:
-            portlock_descriptor = open(lockfile, 'w')
-            fcntl.flock(portlock_descriptor, fcntl.LOCK_EX|fcntl.LOCK_NB)
+            lock_descriptor = open(lockfile, 'w')
+            fcntl.flock(lock_descriptor, fcntl.LOCK_EX|fcntl.LOCK_NB)
         except Exception as e:
             msg = "Acquiring lockfile %s failed: %s" % (lockfile, e)
             logger.info(msg)
-            if portlock_descriptor:
-                portlock_descriptor.close()
+            if lock_descriptor:
+                lock_descriptor.close()
             return False
-        self.portlocks[lockfile] = portlock_descriptor
+        self.locks[lockfile] = lock_descriptor
         return True
 
-    def release_portlock(self, lockfile=None):
+    def release_lock(self, lockfile=None):
         if lockfile != None:
             logger.debug("Releasing lockfile '%s'" % lockfile)
             # We pass the fd to the qemu process and if we unlock here, it would unlock for
             # that too. Therefore don't unlock, just close
-            # fcntl.flock(self.portlocks[lockfile], fcntl.LOCK_UN)
-            self.portlocks[lockfile].close()
+            # fcntl.flock(self.locks[lockfile], fcntl.LOCK_UN)
+            self.locks[lockfile].close()
             # Removing the file is a potential race, don't do that either
             # os.remove(lockfile)
-            del self.portlocks[lockfile]
-        elif len(self.portlocks):
-            for lockfile, descriptor in self.portlocks.items():
+            del self.locks[lockfile]
+        elif len(self.locks):
+            for lockfile, descriptor in self.locks.items():
                 logger.debug("Releasing lockfile '%s'" % lockfile)
                 # We pass the fd to the qemu process and if we unlock here, it would unlock for
                 # that too. Therefore don't unlock, just close
@@ -309,7 +309,7 @@ class BaseConfig(object):
                 descriptor.close()
                 # Removing the file is a potential race, don't do that either
                 # os.remove(lockfile)
-            self.portlocks = {}
+            self.locks = {}
 
     def get(self, key):
         if key in self.d:
@@ -1632,8 +1632,8 @@ to your build configuration.
         pass_fds = []
         if self.taplock_descriptor:
             pass_fds = [self.taplock_descriptor.fileno()]
-        if len(self.portlocks):
-            for descriptor in self.portlocks.values():
+        if len(self.locks):
+            for descriptor in self.locks.values():
                 pass_fds.append(descriptor.fileno())
         process = subprocess.Popen(cmds, stderr=subprocess.PIPE, pass_fds=pass_fds, env=self.qemu_environ)
         self.qemuprocess = process
@@ -1682,7 +1682,7 @@ to your build configuration.
             cmd = ("runqemu-export-rootfs", "stop", self.rootfs)
             logger.debug('Running %s' % str(cmd))
             subprocess.check_call(cmd)
-        self.release_portlock()
+        self.release_lock()
 
         if self.saved_stty:
             subprocess.check_call(("stty", self.saved_stty))
-- 
2.56.0


