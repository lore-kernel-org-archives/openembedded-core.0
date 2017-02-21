Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id C469E72F83
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 14:48:56 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP; 21 Feb 2017 06:48:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,190,1484035200"; d="scan'208";a="1132875825"
Received: from kanavin-desktop.fi.intel.com (HELO
	kanavin-desktop.fi.intel.comfi.intel.com) ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 21 Feb 2017 06:48:57 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Feb 2017 16:46:46 +0200
Message-Id: <2b580d319b644c4f2d54ad1928f5a48055457fad.1487687951.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1487687951.git.alexander.kanavin@linux.intel.com>
References: <cover.1487687951.git.alexander.kanavin@linux.intel.com>
Subject: [PATCHv2 29/39] selftest: update output checks in incremental image test to match what dnf prints
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
X-List-Received-Date: Tue, 21 Feb 2017 14:48:57 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/lib/oeqa/selftest/buildoptions.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/buildoptions.py b/meta/lib/oeqa/selftest/buildoptions.py
index d40eb007ded..1801511913b 100644
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


