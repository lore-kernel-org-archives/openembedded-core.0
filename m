Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 99DA4607A4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 22:14:11 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 12 Aug 2015 15:14:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,664,1432623600"; d="scan'208";a="540760379"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by FMSMGA003.fm.intel.com with ESMTP; 12 Aug 2015 15:14:12 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Aug 2015 14:05:52 +0000
Message-Id: <f76a752e03825bde2096a5917703e3bee570fe2b.1439387979.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cover.1439387979.git.mariano.lopez@linux.intel.com>
References: <cover.1439387979.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1439387979.git.mariano.lopez@linux.intel.com>
References: <cover.1439387979.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 2/6] qemurunner.py: Added login to start method
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
X-List-Received-Date: Wed, 12 Aug 2015 22:14:11 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This adds the automatic login after the target
finished booting. If the automatic login fails
it won't stop the target or any test, it would
only send a log to the file.

[YOCTO #8118]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 81ca32e..fc2e244 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -37,6 +37,7 @@ class QemuRunner:
         self.deploy_dir_image = deploy_dir_image
         self.logfile = logfile
         self.boottime = boottime
+        self.logged = False
 
         self.runqemutime = 60
 
@@ -159,6 +160,7 @@ class QemuRunner:
                             self.log(data)
                             self.bootlog += data
                             if re.search(".* login:", self.bootlog):
+                                self.server_socket = self.qemusock
                                 stopread = True
                                 reachedlogin = True
                                 logger.info("Reached login banner")
@@ -174,6 +176,15 @@ class QemuRunner:
                 logger.info("Check full boot log: %s" % self.logfile)
                 self.stop()
                 return False
+
+            (status, output) = self.run_serial("root\n")
+            if re.search("root@[a-zA-Z0-9\-]+:~#", output):
+                self.logged = True
+                logger.info("Logged as root in serial console")
+            else:
+                logger.info("Couldn't login into serial console"
+                        " as root using blank password")
+
         else:
             logger.info("Qemu pid didn't appeared in %s seconds" % self.runqemutime)
             self.stop()
-- 
1.8.4.5


