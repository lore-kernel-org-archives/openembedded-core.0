Return-Path: <valentin.popa@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 727B570292
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 08:01:42 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Jul 2014 01:01:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,663,1400050800"; d="scan'208";a="569954755"
Received: from vpopa-desktop.rb.intel.com ([10.237.105.85])
	by fmsmga002.fm.intel.com with ESMTP; 15 Jul 2014 01:01:27 -0700
From: Valentin Popa <valentin.popa@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jul 2014 11:00:46 +0300
Message-Id: <1405411250-10594-3-git-send-email-valentin.popa@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1405411250-10594-1-git-send-email-valentin.popa@intel.com>
References: <1405411250-10594-1-git-send-email-valentin.popa@intel.com>
Subject: [PATCH 3/9] image.bbclass: set the proper default target
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
X-List-Received-Date: Tue, 15 Jul 2014 08:01:49 -0000

Check also for "wayland" presence in DISTRO_FEATURES
before creating default.target.

Signed-off-by: Valentin Popa <valentin.popa@intel.com>
---
 meta/classes/image.bbclass | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index a03b880..04aa14b 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -153,7 +153,6 @@ ROOTFS_POSTPROCESS_COMMAND =+ "write_image_manifest ; "
 # Set default postinst log file
 POSTINST_LOGFILE ?= "${localstatedir}/log/postinstall.log"
 # Set default target for systemd images
-SYSTEMD_DEFAULT_TARGET ?= '${@bb.utils.contains("IMAGE_FEATURES", "x11-base", "graphical.target", "multi-user.target", d)}'
 ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("DISTRO_FEATURES", "systemd", "set_systemd_default_target; ", "", d)}'
 
 # some default locales
@@ -171,6 +170,17 @@ do_rootfs[cleandirs] += "${S}"
 # task, so that we have a single fakeroot context for the whole process.
 do_rootfs[umask] = "022"
 
+def determine_default_target(d):
+      graphical_target =  bb.utils.contains("IMAGE_FEATURES", "x11-base", True, False, d) or \
+                       bb.utils.contains("DISTRO_FEATURES", "wayland", True, False, d)
+      if graphical_target:
+         return "graphical.target"
+      else:
+        return "multi-user.target"
+
+
+SYSTEMD_DEFAULT_TARGET ?= '${@determine_default_target(d)}'
+
 # A hook function to support read-only-rootfs IMAGE_FEATURES
 # Currently, it only supports sysvinit system.
 read_only_rootfs_hook () {
-- 
1.9.1


