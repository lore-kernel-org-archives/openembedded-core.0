Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2840060144
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Apr 2014 12:41:53 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 30 Apr 2014 05:32:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,958,1389772800"; d="scan'208";a="531267782"
Received: from cgwithan-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.50])
	by fmsmga002.fm.intel.com with ESMTP; 30 Apr 2014 05:32:20 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Apr 2014 13:31:59 +0100
Message-Id: <58a9e0919e4b5a40dcc321f01b093ef3b3f3f5b2.1398861075.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <cover.1398861075.git.paul.eggleton@linux.intel.com>
References: <cover.1398861075.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1398861075.git.paul.eggleton@linux.intel.com>
References: <cover.1398861075.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/8] oeqa/controllers/masterimage: add a serial control command
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
X-List-Received-Date: Wed, 30 Apr 2014 12:41:53 -0000

From: Stefan Stanacar <stefanx.stanacar@intel.com>

Similar to power control command, this depends on a user's setup to get to
the serial port of a board. For a local connected board this could just be:

TEST_SERIALCONTROL_CMD = "picocom /dev/ttyUSB0 -b 115200"

and for a serial console server: "telnet 10.11.12.13 7003" or some conmux
command.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/controllers/masterimage.py | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/controllers/masterimage.py b/meta/lib/oeqa/controllers/masterimage.py
index e8d321f..c6fc7d6 100644
--- a/meta/lib/oeqa/controllers/masterimage.py
+++ b/meta/lib/oeqa/controllers/masterimage.py
@@ -70,10 +70,12 @@ class MasterImageHardwareTarget(oeqa.targetcontrol.BaseTarget):
         # the command should take as the last argument "off" and "on" and "cycle" (off, on)
         self.powercontrol_cmd = d.getVar("TEST_POWERCONTROL_CMD", True) or None
         self.powercontrol_args = d.getVar("TEST_POWERCONTROL_EXTRA_ARGS") or ""
+
+        self.serialcontrol_cmd = d.getVar("TEST_SERIALCONTROL_CMD", True) or None
+        self.serialcontrol_args = d.getVar("TEST_SERIALCONTROL_EXTRA_ARGS") or ""
+
         self.origenv = os.environ
-        if self.powercontrol_cmd:
-            if self.powercontrol_args:
-                self.powercontrol_cmd = "%s %s" % (self.powercontrol_cmd, self.powercontrol_args)
+        if self.powercontrol_cmd or self.serialcontrol_cmd:
             # the external script for controlling power might use ssh
             # ssh + keys means we need the original user env
             bborigenv = d.getVar("BB_ORIGENV", False) or {}
@@ -81,7 +83,14 @@ class MasterImageHardwareTarget(oeqa.targetcontrol.BaseTarget):
                 val = bborigenv.getVar(key, True)
                 if val is not None:
                     self.origenv[key] = str(val)
+
+        if self.powercontrol_cmd:
+            if self.powercontrol_args:
+                self.powercontrol_cmd = "%s %s" % (self.powercontrol_cmd, self.powercontrol_args)
             self.power_ctl("on")
+        if self.serialcontrol_cmd:
+            if self.serialcontrol_args:
+                self.serialcontrol_cmd = "%s %s" % (self.serialcontrol_cmd, self.serialcontrol_args)
 
     def power_ctl(self, msg):
         if self.powercontrol_cmd:
@@ -172,4 +181,3 @@ class GummibootTarget(MasterImageHardwareTarget):
         self.power_cycle(self.master)
         # there are better ways than a timeout but this should work for now
         time.sleep(120)
-
-- 
1.9.0


