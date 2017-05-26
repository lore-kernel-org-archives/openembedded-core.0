Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 53D3E60103
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 11:39:59 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 May 2017 04:40:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,396,1491289200"; d="scan'208";a="1153133147"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 26 May 2017 04:40:00 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 069D7580240;
	Fri, 26 May 2017 04:39:58 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 May 2017 14:39:39 +0300
Message-Id: <1495798779-545-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] runqemu: output qemu-system errors
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
X-List-Received-Date: Fri, 26 May 2017 11:40:00 -0000

Included error output from qemu-system into the runqemu error message.
Made error output more visible by printing new line before it.

[YOCTO #11542]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/runqemu | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 72c4176..0039b83 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1137,9 +1137,10 @@ class BaseConfig(object):
         else:
             kernel_opts = ""
         cmd = "%s %s" % (self.qemu_opt, kernel_opts)
-        logger.info('Running %s' % cmd)
-        if subprocess.call(cmd, shell=True) != 0:
-            raise Exception('Failed to run %s' % cmd)
+        logger.info('Running %s\n' % cmd)
+        process = subprocess.Popen(cmd, shell=True, stderr=subprocess.PIPE)
+        if process.wait():
+            logger.error("Failed to run qemu: %s", process.stderr.read().decode())
 
     def cleanup(self):
         if self.cleantap:
-- 
2.1.4


