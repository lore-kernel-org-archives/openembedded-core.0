Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QEW32-00020U-L8
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Apr 2011 02:22:36 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 25 Apr 2011 17:20:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,267,1301900400"; d="scan'208";a="425359209"
Received: from nbuild1.sc.intel.com (HELO localhost) ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 25 Apr 2011 17:20:06 -0700
Message-Id: <af08fae1636c0ae0c62b5f17dea9824d232c8db6.1303776892.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1303776892.git.nitin.a.kamble@intel.com>
References: <cover.1303776892.git.nitin.a.kamble@intel.com>
Old-Date: Mon, 25 Apr 2011 17:08:31 -0700
Date: Mon, 25 Apr 2011 17:19:46 -0700
To: scott.a.garman@intel.com, poky@yoctoproject.org,
	openembedded-core@lists.openembedded.org
From: Nitin A Kamble <nitin.a.kamble@intel.com>
Subject: [PATCH 2/2] cpio-2.8 (GPLv2) bug fix
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
X-List-Received-Date: Tue, 26 Apr 2011 00:22:36 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../cpio/cpio-2.8/avoid_heap_overflow.patch        |   25 ++++++++++++++++++++
 meta/recipes-extended/cpio/cpio_2.8.bb             |    6 +++-
 2 files changed, 29 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/cpio/cpio-2.8/avoid_heap_overflow.patch

diff --git a/meta/recipes-extended/cpio/cpio-2.8/avoid_heap_overflow.patch b/meta/recipes-extended/cpio/cpio-2.8/avoid_heap_overflow.patch
new file mode 100644
index 0000000..71f5675
--- /dev/null
+++ b/meta/recipes-extended/cpio/cpio-2.8/avoid_heap_overflow.patch
@@ -0,0 +1,25 @@
+Upstream-Status="Inappropriate [bugfix: https://wiki.yoctoproject.org/collab/Tar_GPLv3-v2_transfer_info http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-0624]"
+
+This patch avoids heap overflow reported by :
+http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-0624
+
+This is a clean patch for the GPLv2 tar recipe.
+
+the GPLv2 tar recipe patch is also applicable to this GPLv2 cpio 
+recipe, as they share code.
+
+Nitin A Kamble <nitin.a.kamble@intel.com> 2011/04/25
+
+Index: tar-1.17/lib/rtapelib.c
+===================================================================
+--- tar-1.17.orig/lib/rtapelib.c
++++ tar-1.17/lib/rtapelib.c
+@@ -570,7 +570,7 @@ rmt_read__ (int handle, char *buffer, si
+ 
+   sprintf (command_buffer, "R%lu\n", (unsigned long) length);
+   if (do_command (handle, command_buffer) == -1
+-      || (status = get_status (handle)) == SAFE_READ_ERROR)
++      || ((status = get_status (handle)) == SAFE_READ_ERROR) || (status > length))
+     return SAFE_READ_ERROR;
+ 
+   for (counter = 0; counter < status; counter += rlen, buffer += rlen)
diff --git a/meta/recipes-extended/cpio/cpio_2.8.bb b/meta/recipes-extended/cpio/cpio_2.8.bb
index 412d19f..006e4f6 100644
--- a/meta/recipes-extended/cpio/cpio_2.8.bb
+++ b/meta/recipes-extended/cpio/cpio_2.8.bb
@@ -3,9 +3,11 @@ require cpio_v2.inc
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b7f772ea3a2489231cb4872656cac34b"
 
-PR = "r0"
+PR = "r1"
 
-SRC_URI += "file://m4extensions.patch"
+SRC_URI += "file://m4extensions.patch \
+    file://avoid_heap_overflow.patch \
+    "
 
 SRC_URI[md5sum] = "0caa356e69e149fb49b76bacc64615a1"
 SRC_URI[sha256sum] = "1b203248874c3b5a728b351f06513e5282f73e0170b7f207fbf8c39f28f6b4ad"
-- 
1.7.2.2



