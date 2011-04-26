Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QEW32-00020T-OJ
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Apr 2011 02:22:36 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 25 Apr 2011 17:20:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,267,1301900400"; d="scan'208";a="738318122"
Received: from nbuild1.sc.intel.com (HELO localhost) ([172.25.110.36])
	by orsmga001.jf.intel.com with ESMTP; 25 Apr 2011 17:20:06 -0700
Message-Id: <7e9ac75e9a9b792eccedf3c0cd8c3b01064bc94f.1303776892.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1303776892.git.nitin.a.kamble@intel.com>
References: <cover.1303776892.git.nitin.a.kamble@intel.com>
Old-Date: Mon, 25 Apr 2011 17:07:37 -0700
Date: Mon, 25 Apr 2011 17:19:46 -0700
To: scott.a.garman@intel.com, poky@yoctoproject.org,
	openembedded-core@lists.openembedded.org
From: Nitin A Kamble <nitin.a.kamble@intel.com>
Subject: [PATCH 1/2] tar-1.17 (GPLv2) bugfix
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
X-List-Received-Date: Tue, 26 Apr 2011 00:22:37 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../tar/tar-1.17/avoid_heap_overflow.patch         |   22 ++++++++++++++++++++
 meta/recipes-extended/tar/tar_1.17.bb              |    3 +-
 2 files changed, 24 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-extended/tar/tar-1.17/avoid_heap_overflow.patch

diff --git a/meta/recipes-extended/tar/tar-1.17/avoid_heap_overflow.patch b/meta/recipes-extended/tar/tar-1.17/avoid_heap_overflow.patch
new file mode 100644
index 0000000..abfd0ae
--- /dev/null
+++ b/meta/recipes-extended/tar/tar-1.17/avoid_heap_overflow.patch
@@ -0,0 +1,22 @@
+Upstream-Status="Inappropriate [bugfix: https://wiki.yoctoproject.org/collab/Tar_GPLv3-v2_transfer_info http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-0624]"
+
+This patch avoids heap overflow reported by :
+http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-0624
+
+This is a clean patch for the GPLv2 tar recipe.
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
diff --git a/meta/recipes-extended/tar/tar_1.17.bb b/meta/recipes-extended/tar/tar_1.17.bb
index be74542..138ea71 100644
--- a/meta/recipes-extended/tar/tar_1.17.bb
+++ b/meta/recipes-extended/tar/tar_1.17.bb
@@ -3,10 +3,11 @@ require tar.inc
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI += "file://m4extensions.patch \
     file://gcc43build.patch \
+    file://avoid_heap_overflow.patch \
     "
 
 SRC_URI[md5sum] = "c6c4f1c075dbf0f75c29737faa58f290"
-- 
1.7.2.2



