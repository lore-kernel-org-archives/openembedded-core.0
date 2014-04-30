Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 10DB760144
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Apr 2014 12:41:41 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 30 Apr 2014 05:32:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,958,1389772800"; d="scan'208";a="531267794"
Received: from cgwithan-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.50])
	by fmsmga002.fm.intel.com with ESMTP; 30 Apr 2014 05:32:22 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Apr 2014 13:32:01 +0100
Message-Id: <ffac00dc794434d8e00c74ebf90b0946cec1a248.1398861075.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <cover.1398861075.git.paul.eggleton@linux.intel.com>
References: <cover.1398861075.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1398861075.git.paul.eggleton@linux.intel.com>
References: <cover.1398861075.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 5/8] classes/testimage: if start fails, don't try to stop
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
X-List-Received-Date: Wed, 30 Apr 2014 12:41:41 -0000

If we couldn't start the target, it doesn't make sense to try and stop
it here since logically it shouldn't now be in any kind of "started"
state. (It's the start function's job to clean up after itself if it
fails - to that end, fix up the QemuTarget class so that it does.)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/testimage.bbclass | 2 +-
 meta/lib/oeqa/targetcontrol.py | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 691c7f6..285c6a9 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -209,8 +209,8 @@ def testimage_main(d):
 
     target.deploy()
 
+    target.start()
     try:
-        target.start()
         if export:
             exportTests(d,tc)
         else:
diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index 02cb370..ff1bb89 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -124,6 +124,7 @@ class QemuTarget(BaseTarget):
             self.server_ip = self.runner.server_ip
             self.connection = SSHControl(ip=self.ip, logfile=self.sshlog)
         else:
+            self.stop()
             raise bb.build.FuncFailed("%s - FAILED to start qemu - check the task log and the boot log" % self.pn)
 
     def stop(self):
-- 
1.9.0


