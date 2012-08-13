Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1T12Ag-00050g-Ue
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Aug 2012 23:27:35 +0200
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id A06463042E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2012 17:15:33 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Aug 2012 14:14:46 -0700
Message-Id: <24e8399aeccf4b0742acd986bb506ff6f388b4a2.1344892361.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1344892361.git.scott.a.garman@intel.com>
References: <cover.1344892361.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1344892361.git.scott.a.garman@intel.com>
References: <cover.1344892361.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: A06463042E.D9A9B
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 05/32] packagedata.py: Fix get_subpkgedata_fn for multilib
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
X-List-Received-Date: Mon, 13 Aug 2012 21:27:35 -0000

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/packagedata.py |    8 ++++++++
 1 file changed, 8 insertions(+)

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
1.7.9.5



