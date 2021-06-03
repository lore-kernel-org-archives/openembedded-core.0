Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.307.1622733804469136695
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jun 2021 08:23:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id A9F341BF206;
	Thu,  3 Jun 2021 15:23:22 +0000 (UTC)
From: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH] runqemu: time the copy to tmpfs
Date: Thu,  3 Jun 2021 17:23:08 +0200
Message-Id: <20210603152308.193587-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Measure and display the time it takes to copy the rootfs to its new
location (usually in tmpfs) to try to understand whether it sometimes takes
a lot of time on the autobuilders.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 scripts/runqemu | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index e2dc529baaf1..1f332ef52529 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -18,6 +18,7 @@ import shutil
 import glob
 import configparser
 import signal
+import time
 
 class RunQemuError(Exception):
     """Custom exception to raise on known errors."""
@@ -1201,8 +1202,10 @@ class BaseConfig(object):
         tmpfsdir = os.environ.get("RUNQEMU_TMPFS_DIR", None)
         if self.snapshot and tmpfsdir:
             newrootfs = os.path.join(tmpfsdir, os.path.basename(self.rootfs)) + "." + str(os.getpid())
+            logger.info("Copying rootfs to %s" % newrootfs)
+            copy_start = time.time()
             shutil.copyfile(self.rootfs, newrootfs)
-            #print("Copying rootfs to tmpfs: %s" % newrootfs)
+            logger.info("Copy done in %s seconds" % (time.time() - copy_start))
             self.rootfs = newrootfs
             # Don't need a second copy now!
             self.snapshot = False
-- 
2.31.1

