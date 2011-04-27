Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QEzE7-0005KA-C2
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 09:31:59 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 27 Apr 2011 00:29:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,273,1301900400"; d="scan'208";a="634683171"
Received: from unknown (HELO localhost) ([10.255.12.245])
	by orsmga002.jf.intel.com with ESMTP; 27 Apr 2011 00:29:28 -0700
Message-Id: <190a34b6dc38b4c9a2c57d7f8f0ea508f6447ece.1303889119.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303889119.git.sgw@linux.intel.com>
References: <cover.1303889119.git.sgw@linux.intel.com>
Old-Date: Mon, 25 Apr 2011 17:08:31 -0700
Date: Wed, 27 Apr 2011  0:29:28 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Wed, 27 Apr 2011 09:50:50 +0200
Cc: Darren Hart <dvhart@linux.intel.com>, Chris Larson <clarson@kergoth.com>,
	Antonio Ospite <ospite@studenti.unina.it>
Subject: [PATCH 08/52] cpio-2.8 (GPLv2) bug fix
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
X-List-Received-Date: Wed, 27 Apr 2011 07:31:59 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

This fixes bug [YOCTO #982]

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../cpio/cpio-2.8/avoid_heap_overflow.patch        |   25 ++++++++++++++++++++
 meta/recipes-extended/cpio/cpio_2.8.bb             |    6 +++-
 2 files changed, 29 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/cpio/cpio-2.8/avoid_heap_overflow.patch

diff --git a/meta/recipes-extended/cpio/cpio-2.8/avoid_heap_overflow.patch b/meta/recipes-extended/cpio/cpio-2.8/avoid_heap_overflow.patch
new file mode 100644
index 0000000..cf068fa
--- /dev/null
+++ b/meta/recipes-extended/cpio/cpio-2.8/avoid_heap_overflow.patch
@@ -0,0 +1,25 @@
+Upstream-Status="Inappropriate [bugfix: http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2010-0624]"
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
1.7.1.1



