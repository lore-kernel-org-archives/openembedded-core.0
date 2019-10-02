Return-Path: <ee.peng.yeoh@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 896E97ECA6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Oct 2019 23:35:57 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Oct 2019 16:35:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,250,1566889200"; d="scan'208";a="221578791"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by fmsmga002.fm.intel.com with ESMTP; 02 Oct 2019 16:35:57 -0700
From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Oct 2019 07:35:54 +0800
Message-Id: <1570059354-83716-1-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] testimage.bbclass: Add kernel provider and version to testresult
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
X-List-Received-Date: Wed, 02 Oct 2019 23:35:57 -0000

In running QA testing, we sometime need to select custom  provider for
virtual/kernel and version. To track the selected virtual/kernel provider
and version used during test, we need to add these information to
testresult.

This patch add the virtual/kernel and version into the testresult
configuration section.

Example of virtual/kernel and version added to testresult configuration:
   - "KERNEL_PROVIDER_VERSION": "linux-intel_4.19"

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
---
 meta/classes/testimage.bbclass | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 525c5a6..194d549 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -129,14 +129,30 @@ def testimage_sanity(d):
 def get_testimage_configuration(d, test_type, machine):
     import platform
     from oeqa.utils.metadata import get_layers
+    distro = d.getVar("DISTRO")
+    distrooverride = d.getVar("DISTROOVERRIDES")
+
+    kernel_provider = d.getVar("PREFERRED_PROVIDER_virtual/kernel")
+    for o in distrooverride.split(":"):
+        kernel_provider_override = d.getVar("PREFERRED_PROVIDER_virtual/kernel_%s" % o)
+        if kernel_provider_override:
+            kernel_provider = kernel_provider_override
+
+    kernel_provider_version = d.getVar("PREFERRED_VERSION_%s" % kernel_provider).replace('%', '')
+    for o in distrooverride.split(":"):
+        kernel_provider_version_override = d.getVar("PREFERRED_VERSION_%s_%s" % (kernel_provider, o))
+        if kernel_provider_version_override:
+            kernel_provider_version = kernel_provider_version_override.replace('%', '')
+
     configuration = {'TEST_TYPE': test_type,
                     'MACHINE': machine,
-                    'DISTRO': d.getVar("DISTRO"),
+                    'DISTRO': distro,
                     'IMAGE_BASENAME': d.getVar("IMAGE_BASENAME"),
                     'IMAGE_PKGTYPE': d.getVar("IMAGE_PKGTYPE"),
                     'STARTTIME': d.getVar("DATETIME"),
                     'HOST_DISTRO': oe.lsb.distro_identifier().replace(' ', '-'),
-                    'LAYERS': get_layers(d.getVar("BBLAYERS"))}
+                    'LAYERS': get_layers(d.getVar("BBLAYERS")),
+                    'KERNEL_PROVIDER_VERSION': '%s_%s' % (kernel_provider, kernel_provider_version)}
     return configuration
 get_testimage_configuration[vardepsexclude] = "DATETIME"
 
-- 
2.7.4


