Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 345757C1AB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 08:27:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x0G8Rd7F002206
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 16 Jan 2019 00:27:39 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Wed, 16 Jan 2019 00:27:38 -0800
From: <kai.kang@windriver.com>
To: <ross.burton@intel.com>
Date: Wed, 16 Jan 2019 15:45:42 +0800
Message-ID: <20190116074542.10073-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190116074542.10073-1-kai.kang@windriver.com>
References: <20190116074542.10073-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] selftest/wic: update test case test_qemu
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
X-List-Received-Date: Wed, 16 Jan 2019 08:27:39 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

This test case boots the image in qemu and checks for mounted partitions.
But the outputs of mount are different between sysvinit and systemd:

sysvinit:
/dev/root /\r\n/dev/sda1 /boot\r\n/dev/sda3 /media\r\n/dev/sda4 /mnt
systemd:
/dev/sda1 /boot\r\n/dev/sda2 /\r\n/dev/sda3 /media\r\n/dev/sda4 /mnt

So check mounted partitions by egrep rather than check output of runqemu.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 36ee5e5a14..79925f942f 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -625,9 +625,11 @@ class Wic2(WicTestCase):
         self.remove_config(config)
 
         with runqemu('wic-image-minimal', ssh=False) as qemu:
-            cmd = "mount |grep '^/dev/' | cut -f1,3 -d ' ' | sort"
+            cmd = "mount | grep '^/dev/' | cut -f1,3 -d ' ' | egrep -c -e '/dev/sda1 /boot' " \
+                  "-e '/dev/root /|/dev/sda2 /' -e '/dev/sda3 /media' -e '/dev/sda4 /mnt'"
             status, output = qemu.run_serial(cmd)
-            self.assertEqual(output, '/dev/root /\r\n/dev/sda1 /boot\r\n/dev/sda3 /media\r\n/dev/sda4 /mnt')
+            self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
+            self.assertEqual(output, '4')
             cmd = "grep UUID= /etc/fstab"
             status, output = qemu.run_serial(cmd)
             self.assertEqual(1, status, 'Failed to run command "%s": %s' % (cmd, output))
-- 
2.18.0


