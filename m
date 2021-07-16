Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web12.1365.1626403374584786576
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jul 2021 19:42:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10046"; a="232494634"
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; 
   d="scan'208";a="232494634"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2021 19:42:54 -0700
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; 
   d="scan'208";a="656075516"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.225.206])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2021 19:42:53 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 15/28] runqemu: Remove potential lock races around tap device handling
Date: Fri, 16 Jul 2021 10:42:13 +0800
Message-Id: <61682a1a8bfe5f7be6e271a4143fa4a02ca5dca9.1626403078.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1626403078.git.anuj.mittal@intel.com>
References: <cover.1626403078.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The qemu tap device handling is potentially race ridden. We pass the
fd to the main qemu subprocess which is good as it means the lock is held
as long as the qemu process exists. This means we shouldn't unlock it
ourselves though, only close the file. We also can't delete the file
as we have no idea if qemu is still using it. We could try and obtain
an exclusive new lock, then the file would be safe to unlink but it
doesn't seem worth it.

Also fix the same issue in the port lock code.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2a87bddabf816d09ec801e33972879e6983627eb)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/runqemu | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index edd17d09c4..c985f4e75a 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -232,9 +232,12 @@ class BaseConfig(object):
     def release_taplock(self):
         if self.taplock_descriptor:
             logger.debug("Releasing lockfile for tap device '%s'" % self.tap)
-            fcntl.flock(self.taplock_descriptor, fcntl.LOCK_UN)
+            # We pass the fd to the qemu process and if we unlock here, it would unlock for
+            # that too. Therefore don't unlock, just close
+            # fcntl.flock(self.taplock_descriptor, fcntl.LOCK_UN)
             self.taplock_descriptor.close()
-            os.remove(self.taplock)
+            # Removing the file is a potential race, don't do that either
+            # os.remove(self.taplock)
             self.taplock_descriptor = None
 
     def check_free_port(self, host, port, lockdir):
@@ -272,17 +275,23 @@ class BaseConfig(object):
 
     def release_portlock(self, lockfile=None):
         if lockfile != None:
-           logger.debug("Releasing lockfile '%s'" % lockfile)
-           fcntl.flock(self.portlocks[lockfile], fcntl.LOCK_UN)
-           self.portlocks[lockfile].close()
-           os.remove(lockfile)
-           del self.portlocks[lockfile]
+            logger.debug("Releasing lockfile '%s'" % lockfile)
+            # We pass the fd to the qemu process and if we unlock here, it would unlock for
+            # that too. Therefore don't unlock, just close
+            # fcntl.flock(self.portlocks[lockfile], fcntl.LOCK_UN)
+            self.portlocks[lockfile].close()
+            # Removing the file is a potential race, don't do that either
+            # os.remove(lockfile)
+            del self.portlocks[lockfile]
         elif len(self.portlocks):
             for lockfile, descriptor in self.portlocks.items():
                 logger.debug("Releasing lockfile '%s'" % lockfile)
-                fcntl.flock(descriptor, fcntl.LOCK_UN)
+                # We pass the fd to the qemu process and if we unlock here, it would unlock for
+                # that too. Therefore don't unlock, just close
+                # fcntl.flock(descriptor, fcntl.LOCK_UN)
                 descriptor.close()
-                os.remove(lockfile)
+                # Removing the file is a potential race, don't do that either
+                # os.remove(lockfile)
             self.portlocks = {}
 
     def get(self, key):
-- 
2.31.1

