Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id E924977011
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Apr 2016 09:14:27 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 08 Apr 2016 02:14:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,449,1455004800"; d="scan'208";a="928169339"
Received: from jlock-mobl1.gar.corp.intel.com (HELO
	jlock-mobl.gar.corp.intel.com) ([10.252.22.160])
	by orsmga001.jf.intel.com with ESMTP; 08 Apr 2016 02:14:27 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Apr 2016 10:14:19 +0100
Message-Id: <1460106859-14007-2-git-send-email-joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1460106859-14007-1-git-send-email-joshua.g.lock@intel.com>
References: <1460106859-14007-1-git-send-email-joshua.g.lock@intel.com>
Cc: Joshua Lock <joshua.lock@collabora.co.uk>
Subject: [PATCH 2/2] oeqa/selftest/wic: add test case for sparse images
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
X-List-Received-Date: Fri, 08 Apr 2016 09:14:28 -0000

From: Joshua Lock <joshua.lock@collabora.co.uk>

Add a testcase to build a directdisk image and check that the
used disk size is less than the apparent size, as wic now
assembles images as sparse files.

Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/wic.py | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index a569fbf..dd32075 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -276,3 +276,16 @@ class Wic(oeSelfTest):
             status, output = qemu.run_serial(command)
             self.assertEqual(1, status, 'Failed to run command "%s": %s' % (command, output))
             self.assertEqual(output, '/dev/root /\r\n/dev/vda3 /mnt')
+
+    def test_sparseness(self):
+        """Test that assembled images are sparse; apparent size > disk usage"""
+        self.assertEqual(0, runCmd("wic create directdisk "
+                                   "--image-name core-image-minimal").status)
+        images = glob(self.resultdir + "directdisk-*.direct")
+        self.assertEqual(1, len(images))
+
+        imagestat = os.stat(images.pop())
+        # st_blocks is the "number of 512-byte blocks allocated for file"
+        used = imagestat.st_blocks*512
+        apparent = imagestat.st_size
+        self.assertLess(used, apparent)
-- 
2.5.5


