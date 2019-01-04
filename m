Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 94B1E60229
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Jan 2019 03:31:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x043UPOi014100
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 3 Jan 2019 19:30:35 -0800
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Thu, 3 Jan 2019 19:30:14 -0800
From: <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 4 Jan 2019 10:49:10 +0800
Message-ID: <20190104024910.674-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] wic: update test case test_qemu
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
X-List-Received-Date: Fri, 04 Jan 2019 03:31:01 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

It checks output of mount in wic test case test_qemu. But the outputs are
different between sysvinit and systemd. Add assertion for systemd.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 36ee5e5a14..a6bc566166 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -627,7 +627,10 @@ class Wic2(WicTestCase):
         with runqemu('wic-image-minimal', ssh=False) as qemu:
             cmd = "mount |grep '^/dev/' | cut -f1,3 -d ' ' | sort"
             status, output = qemu.run_serial(cmd)
-            self.assertEqual(output, '/dev/root /\r\n/dev/sda1 /boot\r\n/dev/sda3 /media\r\n/dev/sda4 /mnt')
+            if 'sysvinit' in get_bb_var('DISTRO_FEATURES'):
+                self.assertEqual(output, '/dev/root /\r\n/dev/sda1 /boot\r\n/dev/sda3 /media\r\n/dev/sda4 /mnt')
+            else:
+                self.assertEqual(output, '/dev/sda1 /boot\r\n/dev/sda2 /\r\n/dev/sda3 /media\r\n/dev/sda4 /mnt')
             cmd = "grep UUID= /etc/fstab"
             status, output = qemu.run_serial(cmd)
             self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
-- 
2.18.0


