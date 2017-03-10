Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 64D5477657
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Mar 2017 11:25:57 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP; 10 Mar 2017 03:25:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,140,1486454400"; d="scan'208";a="1106988226"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 10 Mar 2017 03:25:58 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Mar 2017 13:24:08 +0200
Message-Id: <1445a94e484e2b05061837a54854da414582bbbd.1489144807.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1489144807.git.alexander.kanavin@linux.intel.com>
References: <cover.1489144807.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 29/44] selftest: update output checks in incremental image test to match what dnf prints
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
X-List-Received-Date: Fri, 10 Mar 2017 11:25:57 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/lib/oeqa/selftest/buildoptions.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/buildoptions.py b/meta/lib/oeqa/selftest/buildoptions.py
index 568882ba8f3..a97257e4177 100644
--- a/meta/lib/oeqa/selftest/buildoptions.py
+++ b/meta/lib/oeqa/selftest/buildoptions.py
@@ -22,12 +22,12 @@ class ImageOptionsTests(oeSelfTest):
         bitbake("core-image-minimal")
         log_data_file = os.path.join(get_bb_var("WORKDIR", "core-image-minimal"), "temp/log.do_rootfs")
         log_data_created = ftools.read_file(log_data_file)
-        incremental_created = re.search("NOTE: load old install solution for incremental install\nNOTE: old install solution not exist\nNOTE: creating new install solution for incremental install(\n.*)*NOTE: Installing the following packages:.*packagegroup-core-ssh-openssh", log_data_created)
+        incremental_created = re.search("Installing  : packagegroup-core-ssh-openssh", log_data_created)
         self.remove_config('IMAGE_FEATURES += "ssh-server-openssh"')
         self.assertTrue(incremental_created, msg = "Match failed in:\n%s" % log_data_created)
         bitbake("core-image-minimal")
         log_data_removed = ftools.read_file(log_data_file)
-        incremental_removed = re.search("NOTE: load old install solution for incremental install\nNOTE: creating new install solution for incremental install(\n.*)*NOTE: incremental removed:.*openssh-sshd-.*", log_data_removed)
+        incremental_removed = re.search("Erasing     : packagegroup-core-ssh-openssh", log_data_removed)
         self.assertTrue(incremental_removed, msg = "Match failed in:\n%s" % log_data_removed)
 
     @testcase(286)
-- 
2.11.0


