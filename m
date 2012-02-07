Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RutvR-0004HI-Pw
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 23:54:13 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 07 Feb 2012 14:46:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="122206442"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.116])
	by fmsmga002.fm.intel.com with ESMTP; 07 Feb 2012 14:46:03 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Feb 2012 14:45:47 -0800
Message-Id: <086679cfbc30dba4af2f650984084195e5171b8f.1328654424.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1328654424.git.sgw@linux.intel.com>
References: <cover.1328654424.git.sgw@linux.intel.com>
In-Reply-To: <cover.1328654424.git.sgw@linux.intel.com>
References: <cover.1328654424.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 27/35] libdrm: Fix build failure unearthed by uclibc
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
X-List-Received-Date: Tue, 07 Feb 2012 22:54:14 -0000

From: Khem Raj <raj.khem@gmail.com>

uclibc wants to know value of __USE_GNU for certain
header prototypes to be enabled. So we move the config.h
header up in search list.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../drm/libdrm/GNU_SOURCE_definition.patch         |   30 ++++++++++++++++++++
 meta/recipes-graphics/drm/libdrm_2.4.30.bb         |    6 ++-
 2 files changed, 34 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/drm/libdrm/GNU_SOURCE_definition.patch

diff --git a/meta/recipes-graphics/drm/libdrm/GNU_SOURCE_definition.patch b/meta/recipes-graphics/drm/libdrm/GNU_SOURCE_definition.patch
new file mode 100644
index 0000000..8eb1d5e
--- /dev/null
+++ b/meta/recipes-graphics/drm/libdrm/GNU_SOURCE_definition.patch
@@ -0,0 +1,30 @@
+uclibc headers need to know if _GNU_SOURCE is defined or not and its defined
+in config.h so include it first to get the definition if its there fixed build
+problems on uclibc
+
+test_decode.c:107:2: error: implicit declaration of function 'open_memstream' [-Werror=implicit-function-declaration]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+
+Index: libdrm-2.4.30/intel/test_decode.c
+===================================================================
+--- libdrm-2.4.30.orig/intel/test_decode.c	2012-02-03 14:28:46.409355918 -0800
++++ libdrm-2.4.30/intel/test_decode.c	2012-02-03 14:29:02.357356689 -0800
+@@ -21,6 +21,8 @@
+  * IN THE SOFTWARE.
+  */
+ 
++#include "config.h"
++
+ #include <string.h>
+ #include <stdlib.h>
+ #include <stdio.h>
+@@ -31,7 +33,6 @@
+ #include <sys/mman.h>
+ #include <err.h>
+ 
+-#include "config.h"
+ #include "intel_bufmgr.h"
+ #include "intel_chipset.h"
+ 
diff --git a/meta/recipes-graphics/drm/libdrm_2.4.30.bb b/meta/recipes-graphics/drm/libdrm_2.4.30.bb
index 4a6052d..5d99916 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.30.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.30.bb
@@ -2,9 +2,11 @@ require libdrm.inc
 
 LIC_FILES_CHKSUM = "file://xf86drm.c;beginline=9;endline=32;md5=c8a3b961af7667c530816761e949dc71"
 
-PR = "r0"
+PR = "r1"
 
-SRC_URI += "file://installtests.patch"
+SRC_URI += "file://installtests.patch \
+            file://GNU_SOURCE_definition.patch \
+           "
 
 SRC_URI[md5sum] = "9f57a68b2c0836b55ebcbc241f6ca175"
 SRC_URI[sha256sum] = "cacea9c157ec824ad278a06f4910659b2f3ae69686518ece8d6967843cddcd56"
-- 
1.7.6.5



