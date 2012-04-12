Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SIKS2-0006ZS-8S
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Apr 2012 15:52:42 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q3CDhLBs029926
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2012 06:43:21 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Thu, 12 Apr 2012 06:43:20 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Apr 2012 21:43:20 +0800
Message-ID: <eaff1dc212834597e0e3b1c114617717aec4523d.1334238048.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1334238048.git.liezhi.yang@windriver.com>
References: <cover.1334238048.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] mklibs-native 0.1.33: include unistd.h to fix build for gcc 4.7
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
X-List-Received-Date: Thu, 12 Apr 2012 13:52:42 -0000
Content-Type: text/plain

Many of the standard C++ library include files have been edited to no
longer include <unistd.h> to remove namespace pollution in gcc 4.7, so
we need include <unistd.h> manually sometimes.

More information:
http://gcc.gnu.org/gcc-4.7/porting_to.html

[YOCTO #2278]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../mklibs/files/include-unistd.h-for-gcc47.patch  |   29 ++++++++++++++++++++
 .../mklibs/mklibs-native_0.1.33.bb                 |    3 +-
 2 files changed, 31 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/mklibs/files/include-unistd.h-for-gcc47.patch

diff --git a/meta/recipes-devtools/mklibs/files/include-unistd.h-for-gcc47.patch b/meta/recipes-devtools/mklibs/files/include-unistd.h-for-gcc47.patch
new file mode 100644
index 0000000..181b7ff
--- /dev/null
+++ b/meta/recipes-devtools/mklibs/files/include-unistd.h-for-gcc47.patch
@@ -0,0 +1,29 @@
+include <unistd.h> to fix build on gcc 4.7
+
+Many of the standard C++ library include files have been edited to no
+longer include <unistd.h> to remove namespace pollution in gcc 4.7, so
+we need include <unistd.h> manually sometimes.
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
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
1.7.1



