Return-Path: <corneliux.stoicescu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B1682706F1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Aug 2014 08:00:13 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 26 Aug 2014 00:54:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,402,1406617200"; d="scan'208";a="593336833"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 26 Aug 2014 01:00:14 -0700
Received: from localhost.localdomain (unknown [10.237.112.162])
	by linux.intel.com (Postfix) with ESMTP id 67E132C8002;
	Tue, 26 Aug 2014 00:59:33 -0700 (PDT)
From: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Aug 2014 13:05:41 +0300
Message-Id: <1409047544-7026-2-git-send-email-corneliux.stoicescu@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1409047544-7026-1-git-send-email-corneliux.stoicescu@intel.com>
References: <1409047544-7026-1-git-send-email-corneliux.stoicescu@intel.com>
Subject: [PATCH 1/4] classes/populate_sdk_base.bbclass: add a manifest for target sdk
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
X-List-Received-Date: Tue, 26 Aug 2014 08:00:17 -0000

Similar to the way BSP images have rootfs a manifest, the toolchain now also has a manifest file created alongside the sdk image.

Signed-off-by: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
---
 meta/classes/populate_sdk_base.bbclass | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 9e3bd61..db64d3a 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -52,6 +52,18 @@ EXCLUDE_FROM_WORLD = "1"
 
 SDK_PACKAGING_FUNC ?= "create_shar"
 
+SDK_MANIFEST = "${SDK_DEPLOY}/${TOOLCHAIN_OUTPUTNAME}.manifest"
+python write_target_sdk_manifest () {
+    from oe.sdk import sdk_list_installed_packages
+    sdkmanifestdir = os.path.dirname(d.getVar("SDK_MANIFEST", True))
+    if not os.path.exists(sdkmanifestdir):
+        bb.utils.mkdirhier(sdkmanifestdir)
+    with open(d.getVar('SDK_MANIFEST', True), 'w') as output:
+        output.write(sdk_list_installed_packages(d, True, 'ver'))
+}
+
+POPULATE_SDK_POST_TARGET_COMMAND_append = " write_target_sdk_manifest ; "
+
 fakeroot python do_populate_sdk() {
     from oe.sdk import populate_sdk
     from oe.manifest import create_manifest, Manifest
-- 
1.8.3.2


