Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 13D3560144
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Apr 2014 12:41:46 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 30 Apr 2014 05:32:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,958,1389772800"; d="scan'208";a="531267787"
Received: from cgwithan-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.50])
	by fmsmga002.fm.intel.com with ESMTP; 30 Apr 2014 05:32:21 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Apr 2014 13:32:00 +0100
Message-Id: <14a5c1e962c2fbe217ad29c0211b2ae7d1328853.1398861075.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <cover.1398861075.git.paul.eggleton@linux.intel.com>
References: <cover.1398861075.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1398861075.git.paul.eggleton@linux.intel.com>
References: <cover.1398861075.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/8] oeqa/controllers/masterimage: more robust master image startup
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
X-List-Received-Date: Wed, 30 Apr 2014 12:41:46 -0000

Instead of powering up the target when the object is constructed, wait
until deploy is called. Then there are basically two different
scenarios:

a) The device is booted into the master image already, in which case
   we can just use it
b) The device is booted into another image or can't be contacted, in
   which case we need to power cycle it. Here we also now wait until it
   has booted up instead of trying to contact it immediately.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/controllers/masterimage.py | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/controllers/masterimage.py b/meta/lib/oeqa/controllers/masterimage.py
index c6fc7d6..d151e24 100644
--- a/meta/lib/oeqa/controllers/masterimage.py
+++ b/meta/lib/oeqa/controllers/masterimage.py
@@ -87,7 +87,6 @@ class MasterImageHardwareTarget(oeqa.targetcontrol.BaseTarget):
         if self.powercontrol_cmd:
             if self.powercontrol_args:
                 self.powercontrol_cmd = "%s %s" % (self.powercontrol_cmd, self.powercontrol_args)
-            self.power_ctl("on")
         if self.serialcontrol_cmd:
             if self.serialcontrol_args:
                 self.serialcontrol_cmd = "%s %s" % (self.serialcontrol_cmd, self.serialcontrol_args)
@@ -108,13 +107,25 @@ class MasterImageHardwareTarget(oeqa.targetcontrol.BaseTarget):
             if status != 0:
                 bb.error("Failed rebooting target and no power control command defined. You need to manually reset the device.\n%s" % output)
 
+    def _wait_until_booted(self):
+        ''' Waits until the target device has booted (if we have just power cycled it) '''
+        # Subclasses with better methods of determining boot can override this
+        time.sleep(120)
+
     def deploy(self):
-        bb.plain("%s - deploying image on target" % self.pn)
         # base class just sets the ssh log file for us
         super(MasterImageHardwareTarget, self).deploy()
         self.master = sshcontrol.SSHControl(ip=self.ip, logfile=self.sshlog, timeout=600, port=self.port)
         status, output = self.master.run("cat /etc/masterimage")
         if status != 0:
+            # We're not booted into the master image, so try rebooting
+            bb.plain("%s - booting into the master image" % self.pn)
+            self.power_ctl("cycle")
+            self._wait_until_booted()
+
+        bb.plain("%s - deploying image on target" % self.pn)
+        status, output = self.master.run("cat /etc/masterimage")
+        if status != 0:
             bb.fatal("No ssh connectivity or target isn't running a master image.\n%s" % output)
         if self.user_cmds:
             self.deploy_cmds = self.user_cmds.split("\n")
-- 
1.9.0


