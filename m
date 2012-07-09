Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SoGMq-00065Z-4L
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 17:59:20 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Jul 2012 08:48:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="190292939"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.157])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jul 2012 08:48:03 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jul 2012 08:47:48 -0700
Message-Id: <0c777e4c4d3d7a1e4de8b1fecc942bf3d228abb5.1341802889.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1341802889.git.sgw@linux.intel.com>
References: <cover.1341802889.git.sgw@linux.intel.com>
In-Reply-To: <cover.1341802889.git.sgw@linux.intel.com>
References: <cover.1341802889.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 34/41] packagedata.py: Fix get_subpkgedata_fn for multilib
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Jul 2012 15:59:21 -0000

From: Matthew McClintock <msm@freescale.com>

This happens when tryng to add libgcc-dev to as a multilib package
(e.g. IMAGE_INSTALL_append = " lib32-libgcc-dev")

| Processing task-core-boot...
| Processing fman-ucode...
| Processing dosfstools...
| Processing lib32-libgcc-dev...
| Unable to find package lib32-libgcc-dev (libgcc-dev)!
NOTE: package fsl-image-full-1.0-r1.1.3.6: task do_rootfs: Failed

RPM (or bitbake?) is looking in the tmp/pkgdata, however some of these file
paths are mungned for the multilib scenario:

$ find tmp/pkgdata/ | grep libgcc-dev$
tmp/pkgdata/ppce5500-fsl-linux/runtime/lib32-libgcc-dev
tmp/pkgdata/ppc64e5500-fsl-linux/runtime/libgcc-dev

This patch fixes where we look for these files so they can be found and
properly installed for the multilib root file system

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/lib/oe/packagedata.py |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/meta/lib/oe/packagedata.py b/meta/lib/oe/packagedata.py
index a7a40f0..9a28e6b 100644
--- a/meta/lib/oe/packagedata.py
+++ b/meta/lib/oe/packagedata.py
@@ -27,6 +27,14 @@ def read_pkgdatafile(fn):
 
 def get_subpkgedata_fn(pkg, d):
     archs = d.expand("${PACKAGE_ARCHS}").split(" ")
+    mlarchs = d.getVar("MULTILIB_PACKAGE_ARCHS", d) or None
+
+    if mlarchs:
+        for mlarch in mlarchs.split(" "):
+            if "_" in mlarch:
+                prefix, split, new_arch = mlarch.partition("_")
+                archs.append(new_arch)
+
     archs.reverse()
     pkgdata = d.expand('${TMPDIR}/pkgdata/')
     targetdir = d.expand('${TARGET_VENDOR}-${TARGET_OS}/runtime/')
-- 
1.7.7.6



