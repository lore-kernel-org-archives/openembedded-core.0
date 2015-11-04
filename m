Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 307CA7702B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Nov 2015 22:53:07 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 04 Nov 2015 14:53:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,245,1444719600"; d="scan'208";a="843330569"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by fmsmga002.fm.intel.com with ESMTP; 04 Nov 2015 14:53:07 -0800
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Nov 2015 22:52:11 +0000
Message-Id: <1446677531-15347-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [PATCH] qemurunner: Enable timestamps on kernel boot-up
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
X-List-Received-Date: Wed, 04 Nov 2015 22:53:08 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Having the timestamps in the log is useful when debugging those cases when
the booting time takes longer than expected. printk.times=1 enables stamping
into every printk Kernel call.

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index bdc6e0a..abbafd5 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -121,7 +121,7 @@ class QemuRunner:
         # Set this flag so that Qemu doesn't do any grabs as SDL grabs interact
         # badly with screensavers.
         os.environ["QEMU_DONT_GRAB"] = "1"
-        self.qemuparams = 'bootparams="console=tty1 console=ttyS0,115200n8" qemuparams="-serial tcp:127.0.0.1:{}"'.format(threadport)
+        self.qemuparams = 'bootparams="console=tty1 console=ttyS0,115200n8 printk.time=1" qemuparams="-serial tcp:127.0.0.1:{}"'.format(threadport)
         if qemuparams:
             self.qemuparams = self.qemuparams[:-1] + " " + qemuparams + " " + '\"'
 
-- 
1.8.4.5


