Return-Path: <george.l.musat@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D02F96AC36
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Mar 2015 09:26:37 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 23 Mar 2015 02:26:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,451,1422950400"; d="scan'208";a="702707235"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 23 Mar 2015 02:26:37 -0700
Received: from localhost.localdomain (unknown [10.237.112.173])
	by linux.intel.com (Postfix) with ESMTP id 5EE306A4090;
	Mon, 23 Mar 2015 02:26:18 -0700 (PDT)
From: Lucian Musat <george.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Mar 2015 11:24:03 +0200
Message-Id: <1427102643-19366-1-git-send-email-george.l.musat@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH] oeqa/selftest: New auto bitbake test for poky tiny.
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
X-List-Received-Date: Mon, 23 Mar 2015 09:26:38 -0000

The test builds a poky-tiny image, boots it in background and
tries to comunicate with it via serial.

Signed-off-by: Lucian Musat <george.l.musat@intel.com>
---
 meta/lib/oeqa/selftest/bbtests.py | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/meta/lib/oeqa/selftest/bbtests.py b/meta/lib/oeqa/selftest/bbtests.py
index aeccbf5..6305550 100644
--- a/meta/lib/oeqa/selftest/bbtests.py
+++ b/meta/lib/oeqa/selftest/bbtests.py
@@ -3,6 +3,8 @@ import os
 import logging
 import re
 import shutil
+import socket, select, signal, subprocess
+import time
 
 import oeqa.utils.ftools as ftools
 from oeqa.selftest.base import oeSelfTest
@@ -187,4 +189,31 @@ class BitbakeTests(oeSelfTest):
         self.assertEqual(result.status, 0)
         self.assertFalse(os.path.isfile(os.path.join(self.builddir, 'tmp/deploy/licenses/readline/generic_GPLv3')))
         self.assertTrue(os.path.isfile(os.path.join(self.builddir, 'tmp/deploy/licenses/readline/generic_GPLv2')))
+        ftools.remove_from_file(conf ,data)
+
+    def test_boot_poky_tiny(self):
+        conf = os.path.join(self.builddir, 'conf/local.conf')
+        data = 'DISTRO = "poky-tiny"'
+        ftools.append_file(conf ,data)
+        bitbake('core-image-minimal')
+        result = runCmd('qemu-system-i386 -kernel tmp/deploy/images/qemux86/bzImage-qemux86.bin -initrd tmp/deploy/images/qemux86/core-image-minimal-qemux86.cpio.gz -append "root=/dev/ram0 console=ttyS0" -nographic -serial unix:console.sock,server,nowait', bg=True, shell=True)
+        qemupid = result.pid
+        time.sleep(30)
+        clientsocket = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
+        clientsocket.connect('console.sock')
+        clientsocket.sendall('uname -r\n')
+        data = ''
+        stopread = False
+        endtime = time.time()+5
+        while time.time()<endtime and not stopread:
+                sread, _, _ = select.select([clientsocket],[],[],5)
+                for sock in sread:
+                        answer = sock.recv(1024)
+                        if answer:
+                                data += answer
+                        else:
+                                sock.close()
+                                stopread = True
+        self.assertTrue("yocto-tiny" in data, msg="Cannot detect poky tiny boot!")
+        subprocess.call(['pkill', '-9', '-P', str(qemupid)])
         ftools.remove_from_file(conf ,data)
\ No newline at end of file
-- 
2.1.0


