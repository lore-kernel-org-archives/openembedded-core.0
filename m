Return-Path: <george.l.musat@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D43D073BB8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 11:02:09 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 24 Sep 2015 04:02:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,580,1437462000"; d="scan'208";a="776017258"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 24 Sep 2015 04:02:10 -0700
Received: from localhost.localdomain (unknown [10.237.112.173])
	by linux.intel.com (Postfix) with ESMTP id 9F72F6A4005;
	Thu, 24 Sep 2015 04:01:14 -0700 (PDT)
From: Lucian Musat <george.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Sep 2015 14:00:11 +0300
Message-Id: <1443092411-3822-1-git-send-email-george.l.musat@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oeqa/runexported: Fix a problem with ssh_target_log existing in folder.
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
X-List-Received-Date: Thu, 24 Sep 2015 11:02:11 -0000

When copying the exported tests to a remote machine ssh_target_log can
be transformed from softlink to file. This will recreate the link.

Signed-off-by: Lucian Musat <george.l.musat@intel.com>
---
 meta/lib/oeqa/runexported.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/runexported.py b/meta/lib/oeqa/runexported.py
index d6097a1..07b5ba4 100755
--- a/meta/lib/oeqa/runexported.py
+++ b/meta/lib/oeqa/runexported.py
@@ -51,6 +51,8 @@ class FakeTarget(object):
         sshloglink = os.path.join(self.testdir, "ssh_target_log")
         if os.path.islink(sshloglink):
             os.unlink(sshloglink)
+        elif os.path.isfile(sshloglink):
+                os.remove(sshloglink)
         os.symlink(self.sshlog, sshloglink)
         print("SSH log file: %s" %  self.sshlog)
         self.connection = SSHControl(self.ip, logfile=self.sshlog)
-- 
2.1.4


