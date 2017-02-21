Return-Path: <dmitry.rozhkov@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7210372F64
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 15:18:23 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Feb 2017 07:18:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,190,1484035200"; d="scan'208";a="50797874"
Received: from drozhkov-desk.fi.intel.com ([10.237.72.60])
	by orsmga002.jf.intel.com with ESMTP; 21 Feb 2017 07:18:23 -0800
From: Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Feb 2017 17:18:08 +0200
Message-Id: <1487690288-18275-1-git-send-email-dmitry.rozhkov@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] runqemu: avoid overridden user input for bootparams
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
X-List-Received-Date: Tue, 21 Feb 2017 15:18:23 -0000

Currently runqemu hardcodes the "ip=" kernel boot parameter
when configuring QEMU to use tap or slirp networking. This makes
the guest system to have a network interface pre-configured
by kernel and causes systemd to fail renaming the interface
to whatever pleases it:

  Feb 21 10:10:20 intel-corei7-64 systemd-udevd[201]: Error changing
      net interface name 'eth0' to 'enp0s3': Device or resource busy,

Always append user input for kernel boot params after the ones
added by the script. This way user input has priority over runqemu's
default params.

Signed-off-by: Dmitry Rozhkov <dmitry.rozhkov@linux.intel.com>
---
 scripts/runqemu | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index d74f252..8899cbb 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -180,6 +180,7 @@ class BaseConfig(object):
         self.kernel = ''
         self.kernel_cmdline = ''
         self.kernel_cmdline_script = ''
+        self.bootparams = ''
         self.dtb = ''
         self.fstype = ''
         self.kvm_enabled = False
@@ -400,7 +401,7 @@ class BaseConfig(object):
             elif arg.startswith('qemuparams='):
                 self.qemu_opt_script += ' %s' % arg[len('qemuparams='):]
             elif arg.startswith('bootparams='):
-                self.kernel_cmdline_script += ' %s' % arg[len('bootparams='):]
+                self.bootparams = arg[len('bootparams='):]
             elif os.path.exists(arg) or (re.search(':', arg) and re.search('/', arg)):
                 self.check_arg_path(os.path.abspath(arg))
             elif re.search('-image-', arg):
@@ -1040,7 +1041,9 @@ class BaseConfig(object):
 
     def start_qemu(self):
         if self.kernel:
-            kernel_opts = "-kernel %s -append '%s %s %s'" % (self.kernel, self.kernel_cmdline, self.kernel_cmdline_script, self.get('QB_KERNEL_CMDLINE_APPEND'))
+            kernel_opts = "-kernel %s -append '%s %s %s %s'" % (self.kernel, self.kernel_cmdline,
+                                                                self.kernel_cmdline_script, self.get('QB_KERNEL_CMDLINE_APPEND'),
+                                                                self.bootparams)
             if self.dtb:
                 kernel_opts += " -dtb %s" % self.dtb
         else:
-- 
2.7.4


