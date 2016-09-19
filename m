Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2029E70016
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2016 07:20:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8J7KABp008620
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2016 00:20:10 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 19 Sep 2016 00:20:09 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 19 Sep 2016 00:20:08 -0700
Message-ID: <f91c59ec68a08318eee53865979246cfa55888c9.1474269586.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1474269586.git.liezhi.yang@windriver.com>
References: <cover.1474269586.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] runqemu: acquire_lock() should fail when failed to open the file
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
X-List-Received-Date: Mon, 19 Sep 2016 07:20:11 -0000
Content-Type: text/plain

The open(self.lock, 'w') may fail when the lock is created by other
users, return false for this case to let it try other devices.

Fixed:
runqemu - INFO - Running /sbin/ip link...
runqemu - INFO - Acquiring lockfile /tmp/qemu-tap-locks/tap0.lock...
Traceback (most recent call last):
  File "/buildarea/lyang1/poky/scripts/runqemu", line 972, in <module>
    ret = main()
  File "/buildarea/lyang1/poky/scripts/runqemu", line 963, in main
    config.setup_network()
  File "/buildarea/lyang1/poky/scripts/runqemu", line 810, in setup_network
    self.setup_tap()
  File "/buildarea/lyang1/poky/scripts/runqemu", line 761, in setup_tap
    if self.acquire_lock():
  File "/buildarea/lyang1/poky/scripts/runqemu", line 182, in acquire_lock
    lock_descriptor = open(self.lock, 'w')
PermissionError: [Errno 13] Permission denied: '/tmp/qemu-tap-locks/tap0.lock'

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 scripts/runqemu | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index b6bc0ba..3805685 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -168,14 +168,14 @@ class BaseConfig(object):
 
     def acquire_lock(self):
         logger.info("Acquiring lockfile %s..." % self.lock)
-        lock_descriptor = open(self.lock, 'w')
         try:
-            fcntl.flock(lock_descriptor, fcntl.LOCK_EX|fcntl.LOCK_NB)
+            self.lock_descriptor = open(self.lock, 'w')
+            fcntl.flock(self.lock_descriptor, fcntl.LOCK_EX|fcntl.LOCK_NB)
         except Exception as e:
             logger.info("Acquiring lockfile %s failed: %s" % (self.lock, e))
-            lock_descriptor.close()
+            if self.lock_descriptor:
+                self.lock_descriptor.close()
             return False
-        self.lock_descriptor = lock_descriptor
         return True
 
     def release_lock(self):
-- 
2.9.0


