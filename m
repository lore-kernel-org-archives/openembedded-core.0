Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 99336772BA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 15:06:11 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP; 13 Feb 2017 07:06:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,156,1484035200"; d="scan'208";a="64546791"
Received: from kanavin-desktop.fi.intel.com (HELO
	kanavin-desktop.fi.intel.comfi.intel.com) ([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 13 Feb 2017 07:06:11 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Feb 2017 17:06:01 +0200
Message-Id: <7f5d277329d262fe7e9723aacba2dc20768380b9.1486997986.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1486997986.git.alexander.kanavin@linux.intel.com>
References: <cover.1486997986.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 31/36] image.bbclass: do not uninstall update-alternatives from readonly rootfs
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
X-List-Received-Date: Mon, 13 Feb 2017 15:06:12 -0000

dnf insists that it cannot be done:

Error: package libglib-2.0-0-1:2.50.2-r0.i586 requires /bin/sh, but none of the providers can be installed
  - package libdnf1-0.2.3+git0+367545629c-r0.i586 requires libglib-2.0-0 >= 2.50.2, but none of the providers can be installed
  - package bash-4.3.30-r0.i586 requires update-alternatives-opkg, but none of the providers can be installed
  - package busybox-1.24.1-r0.i586 requires update-alternatives-opkg, but none of the providers can be installed
  - package dnf-2.0.0+git0+f0093d672d-r0.i586 requires libdnf1, but none of the providers can be installed
  - conflicting requests
  - problem with installed package dnf-2.0.0+git0+f0093d672d-r0.i586

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/classes/image.bbclass             | 2 +-
 meta/lib/oeqa/selftest/buildoptions.py | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index b5a4fb4a337..ca0d0a8c0d1 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -33,7 +33,7 @@ ROOTFS_BOOTSTRAP_INSTALL = "${@bb.utils.contains("IMAGE_FEATURES", "package-mana
 
 # These packages will be removed from a read-only rootfs after all other
 # packages have been installed
-ROOTFS_RO_UNNEEDED = "update-rc.d base-passwd shadow ${VIRTUAL-RUNTIME_update-alternatives} ${ROOTFS_BOOTSTRAP_INSTALL}"
+ROOTFS_RO_UNNEEDED = "update-rc.d base-passwd shadow ${ROOTFS_BOOTSTRAP_INSTALL}"
 
 # packages to install from features
 FEATURE_INSTALL = "${@' '.join(oe.packagegroup.required_packages(oe.data.typed_value('IMAGE_FEATURES', d), d))}"
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


