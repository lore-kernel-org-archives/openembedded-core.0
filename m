Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 628D378302
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 16:05:36 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7TG5ZGx028732
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 29 Aug 2017 17:05:36 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1dmj1D-0002kk-L3; Tue, 29 Aug 2017 17:05:35 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Aug 2017 17:05:34 +0100
Message-Id: <1504022734-10538-2-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1504022734-10538-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1504022734-10538-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Tue, 29 Aug 2017 17:05:36 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: [PATCH 2/2] scripts/runqemu: Don't print error messages about tap file locks
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
X-List-Received-Date: Tue, 29 Aug 2017 16:05:37 -0000

Errors like:
runqemu - ERROR - Acquiring lockfile /tmp/qemu-tap-locks/tap0.lock failed: [Errno 11] Resource temporarily unavailable

are not really fatal errors. Change these to info messages instead
so people look later in the log for the real errors.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/runqemu | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 1131324..df76270 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -232,13 +232,17 @@ class BaseConfig(object):
         self.mac_tap = "52:54:00:12:34:"
         self.mac_slirp = "52:54:00:12:35:"
 
-    def acquire_lock(self):
+    def acquire_lock(self, error=True):
         logger.debug("Acquiring lockfile %s..." % self.lock)
         try:
             self.lock_descriptor = open(self.lock, 'w')
             fcntl.flock(self.lock_descriptor, fcntl.LOCK_EX|fcntl.LOCK_NB)
         except Exception as e:
-            logger.error("Acquiring lockfile %s failed: %s" % (self.lock, e))
+            msg = "Acquiring lockfile %s failed: %s" % (self.lock, e)
+            if error:
+                logger.error(msg)
+            else:
+                logger.info(msg)
             if self.lock_descriptor:
                 self.lock_descriptor.close()
             return False
@@ -927,7 +931,7 @@ class BaseConfig(object):
                 logger.info('Found %s.skip, skipping %s' % (lockfile, p))
                 continue
             self.lock = lockfile + '.lock'
-            if self.acquire_lock():
+            if self.acquire_lock(error=False):
                 tap = p
                 logger.info("Using preconfigured tap device %s" % tap)
                 logger.info("If this is not intended, touch %s.skip to make runqemu skip %s." %(lockfile, tap))
-- 
2.7.4


