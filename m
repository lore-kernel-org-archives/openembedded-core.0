Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A1F006C3B6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jan 2019 07:47:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x037l9ZQ017424
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 2 Jan 2019 23:47:25 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Wed, 2 Jan 2019 23:47:20 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 3 Jan 2019 16:05:00 +0800
Message-ID: <3724890350f65ec18b5906ce28dfdcedc61b1381.1546502650.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1546502650.git.liezhi.yang@windriver.com>
References: <cover.1546502650.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] oeqa/selftest/runqemu: enable kvm when QEMU_USE_KVM is set
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
X-List-Received-Date: Thu, 03 Jan 2019 07:47:33 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/lib/oeqa/selftest/cases/runqemu.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/runqemu.py b/meta/lib/oeqa/selftest/cases/runqemu.py
index 4e35bb9..0b664b4 100644
--- a/meta/lib/oeqa/selftest/cases/runqemu.py
+++ b/meta/lib/oeqa/selftest/cases/runqemu.py
@@ -5,6 +5,7 @@
 import re
 import tempfile
 import time
+import oe.types
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake, runqemu, get_bb_var, runCmd
 from oeqa.core.decorator.oeid import OETestID
@@ -22,6 +23,10 @@ class RunqemuTests(OESelftestTestCase):
         self.fstypes = "ext4 iso hddimg wic.vmdk wic.qcow2 wic.vdi"
         self.cmd_common = "runqemu nographic"
 
+        kvm = oe.types.qemu_use_kvm(get_bb_var('QEMU_USE_KVM'), self.machine)
+        if kvm:
+            self.cmd_common += " kvm"
+
         self.write_config(
 """
 MACHINE = "%s"
-- 
2.7.4


