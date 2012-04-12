Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SILTc-0007tN-A3
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Apr 2012 16:58:24 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 12 Apr 2012 07:49:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="140917391"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.89])
	by fmsmga001.fm.intel.com with ESMTP; 12 Apr 2012 07:49:03 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Apr 2012 07:49:02 -0700
Message-Id: <1334242142-18603-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH] mklibs-native 0.1.33: include unistd.h to fix build for gcc 4.7
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
X-List-Received-Date: Thu, 12 Apr 2012 14:58:24 -0000

From: Robert Yang <liezhi.yang@windriver.com>

Many of the standard C++ library include files have been edited to no
longer include <unistd.h> to remove namespace pollution in gcc 4.7, so
we need include <unistd.h> manually sometimes.

More information:
http://gcc.gnu.org/gcc-4.7/porting_to.html

[YOCTO #2278]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>

[Updated patch header - sgw]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../mklibs/files/include-unistd.h-for-gcc47.patch  |   43 ++++++++++++++++++++
 .../mklibs/mklibs-native_0.1.33.bb                 |    3 +-
 2 files changed, 45 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/mklibs/files/include-unistd.h-for-gcc47.patch

diff --git a/meta/recipes-devtools/mklibs/files/include-unistd.h-for-gcc47.patch b/meta/recipes-devtools/mklibs/files/include-unistd.h-for-gcc47.patch
new file mode 100644
index 0000000..baa12bd
--- /dev/null
+++ b/meta/recipes-devtools/mklibs/files/include-unistd.h-for-gcc47.patch
@@ -0,0 +1,43 @@
+include <unistd.h> to fix build on gcc 4.7
+
+Many of the standard C++ library include files have been edited to no
+longer include <unistd.h> to remove namespace pollution in gcc 4.7, so
+we need include <unistd.h> manually sometimes.
+
+mklibs (0.1.33+nmu1) UNRELEASED; urgency=low
+ * Non-maintainer upload
+ * Fix FTBFS with gcc 4.7 due to missing <unistd.h> include (Closes: #667282).
+
+-- Cyril Brulebois <kibi@debian.org>  Thu, 05 Apr 2012 00:15:27 +0000
+
+mklibs (0.1.33) unstable; urgency=low
+ 
+  * Adjust the libc_pic directory for multiarch as well.
+
+Upstream-Status: Backport 
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+
+[Added upstream information about patch]
+
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+---
+ src/mklibs-readelf/elf.cpp |    1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/mklibs-readelf/elf.cpp b/src/mklibs-readelf/elf.cpp
+index 444f330..654c46f 100644
+--- a/src/mklibs-readelf/elf.cpp
++++ b/src/mklibs-readelf/elf.cpp
+@@ -25,6 +25,7 @@
+ #include <fcntl.h>
+ #include <sys/mman.h>
+ #include <sys/stat.h>
++#include <unistd.h>
+ 
+ using namespace Elf;
+ 
+-- 
+1.7.10
+
diff --git a/meta/recipes-devtools/mklibs/mklibs-native_0.1.33.bb b/meta/recipes-devtools/mklibs/mklibs-native_0.1.33.bb
index d288c77..a8d12ec 100644
--- a/meta/recipes-devtools/mklibs/mklibs-native_0.1.33.bb
+++ b/meta/recipes-devtools/mklibs/mklibs-native_0.1.33.bb
@@ -5,11 +5,12 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=98d31037b13d896e33890738ef01af64"
 DEPENDS = "python-native"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://ftp.de.debian.org/debian/pool/main/m/mklibs/${BPN}_${PV}.tar.gz \
 	file://ac_init_fix.patch\
 	file://fix_STT_GNU_IFUNC.patch\
+	file://include-unistd.h-for-gcc47.patch \
 "
 
 SRC_URI[md5sum] = "a462d9b802164993d247c1193116d78b"
-- 
1.7.7.6



