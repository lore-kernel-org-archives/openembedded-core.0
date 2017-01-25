Return-Path: <juro.bystricky@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 43FA171D87
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 20:59:19 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 25 Jan 2017 12:59:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,285,1477983600"; d="scan'208";a="1087288454"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.149])
	by orsmga001.jf.intel.com with ESMTP; 25 Jan 2017 12:59:18 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jan 2017 12:54:57 -0800
Message-Id: <1485377697-19218-2-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1485377697-19218-1-git-send-email-juro.bystricky@intel.com>
References: <1485377697-19218-1-git-send-email-juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com
Subject: [PATCH 1/1] runqemu: allow bypassing of network setup
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
X-List-Received-Date: Wed, 25 Jan 2017 20:59:19 -0000

At present it is silently assumed all QEMU machines support networking.
As a consequence, one cannot run QEMUs without network emulation
using "runqemu".
This patch allows bypassing any network setup providing the qemuboot.conf
file contains:

    qb_net = none

[YOCTO#10661]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 scripts/runqemu | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/runqemu b/scripts/runqemu
index 30e5346..26b9283 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -894,6 +894,8 @@ class BaseConfig(object):
         self.set('NETWORK_CMD', '%s %s' % (self.network_device.replace('@MAC@', mac), qemu_tap_opt))
 
     def setup_network(self):
+        if self.get('QB_NET') == 'none':
+            return
         cmd = "stty -g"
         self.saved_stty = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE).stdout.read().decode('utf-8')
         self.network_device = self.get('QB_NETWORK_DEVICE') or self.network_device
-- 
2.7.4


