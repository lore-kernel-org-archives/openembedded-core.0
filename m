Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web12.917.1619398513291207353
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 17:55:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: ZWZZ6hY1rx2iJursu9ZKpsJDy6vds60MZ7U+laFAbRWNpGrD+9ZGdBQfPx/cnjoyVB/bFzxHKx
 lt9YT67lUDmQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="257568888"
X-IronPort-AV: E=Sophos;i="5.82,250,1613462400"; 
   d="scan'208";a="257568888"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:55:11 -0700
IronPort-SDR: aFr/2A37vrwNPlbYNQxBD2FVZVJ/XEI/IAzBDjlrDl7r+3XlnRqs/E7Su8NqmWvFk/73+vozR1
 osHl1LJijR3Q==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="454067576"
Received: from wsan-mobl1.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.45.138])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:55:10 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 55/64] runqemu: Ensure we cleanup snapshot files after image run
Date: Mon, 26 Apr 2021 08:53:26 +0800
Message-Id: <63f3c44f51cf36d3ac550ebb2292eb8e08d1b8d4.1619397968.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619397968.git.anuj.mittal@intel.com>
References: <cover.1619397968.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We need to cleanup snapshot files if we make a copy of them to ensure
the tmpfs doesn't run out of space. There is already NFS code needing
this so make it a generic code path.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a3e0eec5a4785a0c4859455eb10b43aa832e606d)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/runqemu | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index ba0b701aff..edd17d09c4 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -145,7 +145,6 @@ class BaseConfig(object):
         self.qemu_opt = ''
         self.qemu_opt_script = ''
         self.qemuparams = ''
-        self.clean_nfs_dir = False
         self.nfs_server = ''
         self.rootfs = ''
         # File name(s) of a OVMF firmware file or variable store,
@@ -210,6 +209,8 @@ class BaseConfig(object):
         self.qemupid = None
         # avoid cleanup twice
         self.cleaned = False
+        # Files to cleanup after run
+        self.cleanup_files = []
 
     def acquire_taplock(self, error=True):
         logger.debug("Acquiring lockfile %s..." % self.taplock)
@@ -1020,8 +1021,9 @@ class BaseConfig(object):
                 logger.info('Running %s...' % str(cmd))
                 if subprocess.call(cmd) != 0:
                     raise RunQemuError('Failed to run %s' % cmd)
-                self.clean_nfs_dir = True
                 self.rootfs = dest
+                self.cleanup_files.append(self.rootfs)
+                self.cleanup_files.append('%s.pseudo_state' % self.rootfs)
 
         # Start the userspace NFS server
         cmd = ('runqemu-export-rootfs', 'start', self.rootfs)
@@ -1204,6 +1206,7 @@ class BaseConfig(object):
             self.rootfs = newrootfs
             # Don't need a second copy now!
             self.snapshot = False
+            self.cleanup_files.append(newrootfs)
 
         qb_rootfs_opt = self.get('QB_ROOTFS_OPT')
         if qb_rootfs_opt:
@@ -1476,10 +1479,13 @@ class BaseConfig(object):
         if self.saved_stty:
             subprocess.check_call(("stty", self.saved_stty))
 
-        if self.clean_nfs_dir:
-            logger.info('Removing %s' % self.rootfs)
-            shutil.rmtree(self.rootfs)
-            shutil.rmtree('%s.pseudo_state' % self.rootfs)
+        if self.cleanup_files:
+            for ent in self.cleanup_files:
+                logger.info('Removing %s' % ent)
+                if os.path.isfile(ent):
+                    os.remove(ent)
+                else:
+                    shutil.rmtree(ent)
 
         self.cleaned = True
 
-- 
2.30.2

