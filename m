Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D687D77AE1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 12:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490705000; x=1522241000;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=O/bFngpqfZ/o5aQs4PIFexk5kOAXczLp4uA3xNRw3PA=;
	b=TimX8HczgqAU841Wa4bU1B3UhCCpzNXkcwXP8CmU1LAYj8xBVMrcf3i0
	RxgXzv8WnRK2AATTIP1ERa4T8D/U6g==;
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Mar 2017 05:43:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,236,1486454400"; d="scan'208";a="1128027305"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 28 Mar 2017 05:43:19 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id D41EF6A4006
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 05:43:12 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Mar 2017 15:41:01 +0300
Message-Id: <2c767a5362756822d47b4a407d2008422c630dd1.1490704390.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1490704390.git.ed.bartosh@linux.intel.com>
References: <cover.1490704390.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 4/9] oe-selftest: add kickstart_parser test case
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
X-List-Received-Date: Tue, 28 Mar 2017 12:43:19 -0000

Added test_kickstart_parser test case to test wks parser
options not yet covered by tests.

[YOCTO #10618]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/wic.py | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 2af3bf5..f0d9dd9 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -736,3 +736,15 @@ part /etc --source rootfs --ondisk mmcblk0 --fstype=ext4 --exclude-path bin/ --r
             wksname = os.path.splitext(os.path.basename(wks.name))[0]
             out = glob(self.resultdir + "%s-*direct" % wksname)
             self.assertEqual(1, len(out))
+
+    def test_kickstart_parser(self):
+        """Test wks parser options"""
+        with NamedTemporaryFile("w", suffix=".wks") as wks:
+            wks.writelines(['part / --fstype ext3 --source rootfs --system-id 0xFF '\
+                            '--overhead-factor 1.2 --size 100k\n'])
+            wks.flush()
+            cmd = "wic create %s -e core-image-minimal -o %s" % (wks.name, self.resultdir)
+            self.assertEqual(0, runCmd(cmd).status)
+            wksname = os.path.splitext(os.path.basename(wks.name))[0]
+            out = glob(self.resultdir + "%s-*direct" % wksname)
+            self.assertEqual(1, len(out))
-- 
2.1.4


