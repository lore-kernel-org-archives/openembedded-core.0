Return-Path: <anibal.limon@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 645AC7198F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 17:07:07 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga105.fm.intel.com with ESMTP; 16 Feb 2017 09:07:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,169,1484035200"; d="scan'208";a="66024610"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.120])
	by fmsmga005.fm.intel.com with ESMTP; 16 Feb 2017 09:07:07 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Feb 2017 11:10:30 -0600
Message-Id: <1487265030-14032-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Cc: leonardo.sandoval.gonzalez@intel.com, paul.eggleton@intel.com
Subject: [PATCH] scripts/runqemu: Add always ttyS1 when no serial options are specified
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
X-List-Received-Date: Thu, 16 Feb 2017 17:07:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We always wants ttyS0 and ttyS1 in qemu machines (see SERIAL_CONSOLES),
if not serial or serialtcp options was specified only ttyS0 is created
and sysvinit shows an error trying to enable ttyS1:

     INIT: Id "S1" respawning too fast: disabled for 5 minutes

[YOCTO #10491]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 scripts/runqemu | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index d74f252..38c9fca 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1038,6 +1038,17 @@ class BaseConfig(object):
             elif serial_num == 1:
                 self.qemu_opt += " %s" % self.get("QB_SERIAL_OPT")
 
+        # We always wants ttyS0 and ttyS1 in qemu machines (see SERIAL_CONSOLES),
+        # if not serial or serialtcp options was specified only ttyS0 is created
+        # and sysvinit shows an error trying to enable ttyS1:
+        #     INIT: Id "S1" respawning too fast: disabled for 5 minutes
+        serial_num = len(re.findall("-serial", self.qemu_opt))
+        if serial_num == 0:
+            if re.search("-nographic", self.qemu_opt):
+                self.qemu_opt += " -serial mon:stdio -serial null"
+            else:
+                self.qemu_opt += " -serial mon:vc -serial null"
+
     def start_qemu(self):
         if self.kernel:
             kernel_opts = "-kernel %s -append '%s %s %s'" % (self.kernel, self.kernel_cmdline, self.kernel_cmdline_script, self.get('QB_KERNEL_CMDLINE_APPEND'))
-- 
2.1.4


