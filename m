Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id E78F8731CA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 15:46:00 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 26 Jul 2016 08:46:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,425,1464678000"; d="scan'208";a="740010967"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by FMSMGA003.fm.intel.com with ESMTP; 26 Jul 2016 08:46:01 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jul 2016 07:39:08 +0000
Message-Id: <9f7cfd3227faf8fbece69bb7b4ea3cbc4a154156.1469518569.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1469518569.git.mariano.lopez@linux.intel.com>
References: <cover.1469518569.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1469518569.git.mariano.lopez@linux.intel.com>
References: <cover.1469518569.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 3/3] oeqa/utils/sshcontrol.py: Allows to copy symlinks to target
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
X-List-Received-Date: Tue, 26 Jul 2016 15:46:01 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

Currently when copying a symlink to the target it will fail
throwing an exception. This will recreate symlinks from
the system performing the tests to the device under tests.

[YOCTO #9932]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/utils/sshcontrol.py | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/sshcontrol.py b/meta/lib/oeqa/utils/sshcontrol.py
index f5d46e0..da485ee 100644
--- a/meta/lib/oeqa/utils/sshcontrol.py
+++ b/meta/lib/oeqa/utils/sshcontrol.py
@@ -147,8 +147,13 @@ class SSHControl(object):
         return self._internal_run(command, timeout, self.ignore_status)
 
     def copy_to(self, localpath, remotepath):
-        command = self.scp + [localpath, '%s@%s:%s' % (self.user, self.ip, remotepath)]
-        return self._internal_run(command, ignore_status=False)
+        if os.path.islink(localpath):
+            link = os.readlink(localpath)
+            dst_dir, dst_base = os.path.split(remotepath)
+            return self.run("cd %s; ln -s %s %s" % (dst_dir, link, dst_base))
+        else:
+            command = self.scp + [localpath, '%s@%s:%s' % (self.user, self.ip, remotepath)]
+            return self._internal_run(command, ignore_status=False)
 
     def copy_from(self, remotepath, localpath):
         command = self.scp + ['%s@%s:%s' % (self.user, self.ip, remotepath), localpath]
-- 
2.6.6


