Return-Path: <juro.bystricky@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id EF944773F2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 18:05:43 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 30 Jan 2017 10:05:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,312,1477983600"; d="scan'208";a="928256023"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.149])
	by orsmga003.jf.intel.com with ESMTP; 30 Jan 2017 10:05:43 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jan 2017 10:02:13 -0800
Message-Id: <1485799333-7481-2-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1485799333-7481-1-git-send-email-juro.bystricky@intel.com>
References: <1485799333-7481-1-git-send-email-juro.bystricky@intel.com>
Cc: richard.purdie@intel.com, jurobystricky@hotmail.com
Subject: [PATCH v2 1/1] runqemu: allow bypassing of network setup
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
X-List-Received-Date: Mon, 30 Jan 2017 18:05:44 -0000

At present it is silently assumed all QEMU machines support networking.
As a consequence, one cannot run QEMUs without network emulation
using "runqemu".
This patch allows bypassing any network setup providing the user
specifies:

    QB_NETWORK_DEVICE = "none"

[YOCTO#10661]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/classes/qemuboot.bbclass | 3 ++-
 scripts/runqemu               | 3 +++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
index 3ca97ca..4deb201 100644
--- a/meta/classes/qemuboot.bbclass
+++ b/meta/classes/qemuboot.bbclass
@@ -36,8 +36,9 @@
 #                    Note, runqemu will replace @MAC@ with a predefined mac, you can set
 #                    a custom one, but that may cause conflicts when multiple qemus are
 #                    running on the same host.
+#                    Set to "none" if qemu has no network support.
 #
-# QB_TAP_OPT: netowrk option for 'tap' mode, e.g.,
+# QB_TAP_OPT: network option for 'tap' mode, e.g.,
 #             "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
 #              Note, runqemu will replace "@TAP@" with the one which is used, such as tap0, tap1 ...
 #
diff --git a/scripts/runqemu b/scripts/runqemu
index 3d475d3..c846727 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -894,6 +894,9 @@ class BaseConfig(object):
         self.set('NETWORK_CMD', '%s %s' % (self.network_device.replace('@MAC@', mac), qemu_tap_opt))
 
     def setup_network(self):
+        if self.get('QB_NETWORK_DEVICE') == 'none':
+            return
+
         cmd = "stty -g"
         self.saved_stty = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE).stdout.read().decode('utf-8')
         self.network_device = self.get('QB_NETWORK_DEVICE') or self.network_device
-- 
2.7.4


