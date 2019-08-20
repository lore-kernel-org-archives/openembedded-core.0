Return-Path: <zangrc.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 430987EC5D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2019 06:00:46 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,407,1559491200"; d="scan'208";a="73929746"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Aug 2019 14:00:46 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 6D32F4CE03D7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2019 14:00:47 +0800 (CST)
Received: from localhost.local (10.167.225.40) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Tue, 20 Aug 2019 14:00:50 +0800
From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 20 Aug 2019 14:00:10 +0800
Message-ID: <20190820060010.20247-1-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.40]
X-yoursite-MailScanner-ID: 6D32F4CE03D7.AA772
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] libbsd:upgrade 0.9.1 -> 0.10.0
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
X-List-Received-Date: Tue, 20 Aug 2019 06:00:47 -0000
Content-Type: text/plain; charset="ASCII"
Content-Transfer-Encoding: 8bit

-License-Update: Copyright year updated to 2019.

-libbsd/0001-flopen-Add-missing-fcntl.h-include.patch
  Removed since these are included in 0.10.0.

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 .../0001-flopen-Add-missing-fcntl.h-include.patch  | 46 ----------------------
 .../libbsd/{libbsd_0.9.1.bb => libbsd_0.10.0.bb}   |  7 ++--
 2 files changed, 3 insertions(+), 50 deletions(-)
 delete mode 100644 meta/recipes-support/libbsd/libbsd/0001-flopen-Add-missing-fcntl.h-include.patch
 rename meta/recipes-support/libbsd/{libbsd_0.9.1.bb => libbsd_0.10.0.bb} (83%)

diff --git a/meta/recipes-support/libbsd/libbsd/0001-flopen-Add-missing-fcntl.h-include.patch b/meta/recipes-support/libbsd/libbsd/0001-flopen-Add-missing-fcntl.h-include.patch
deleted file mode 100644
index 8abb876..0000000
--- a/meta/recipes-support/libbsd/libbsd/0001-flopen-Add-missing-fcntl.h-include.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 13c32916b4baab58d93940d57fea9ff0777f1931 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Tue, 5 Jun 2018 19:21:46 +0300
-Subject: [PATCH] flopen: Add missing <fcntl.h> include
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Commit 993828d84ee (Add flopenat() function from FreeBSD) dropped the
-fcntl.h header. This breaks the build with musl libc:
-
-flopen.c: In function ‘vflopenat’:
-flopen.c:60:14: error: ‘O_CREAT’ undeclared (first use in this function)
-  if (flags & O_CREAT) {
-              ^~~~~~~
-
-Restore the fcntl.h header include to fix the build.
-
-Fixes: commit 993828d84eed0468c6c15b2818e534e6b134b8e4
-Submitted-also-by: parazyd <parazyd@dyne.org>
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
-Signed-off-by: Guillem Jover <guillem@hadrons.org>
-
-Upstream-Status: Backport
-[https://gitlab.freedesktop.org/libbsd/libbsd/commit/13c32916b4baab58d93940d57fea9ff0777f1931]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- src/flopen.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/flopen.c b/src/flopen.c
-index b9972c9..ff20d07 100644
---- a/src/flopen.c
-+++ b/src/flopen.c
-@@ -32,6 +32,7 @@
- #include <sys/stat.h>
- 
- #include <errno.h>
-+#include <fcntl.h>
- #include <stdarg.h>
- #include <unistd.h>
- 
--- 
-2.7.4
-
diff --git a/meta/recipes-support/libbsd/libbsd_0.9.1.bb b/meta/recipes-support/libbsd/libbsd_0.10.0.bb
similarity index 83%
rename from meta/recipes-support/libbsd/libbsd_0.9.1.bb
rename to meta/recipes-support/libbsd/libbsd_0.10.0.bb
index 2b75cdf..d6b4bd1 100644
--- a/meta/recipes-support/libbsd/libbsd_0.9.1.bb
+++ b/meta/recipes-support/libbsd/libbsd_0.10.0.bb
@@ -28,16 +28,15 @@ HOMEPAGE = "http://libbsd.freedesktop.org/wiki/"
 # License: public-domain
 # License: public-domain-Colin-Plumb
 LICENSE = "BSD-4-Clause & ISC & PD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b552602fda69e34c753d26de383f33c5"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2120be0173469a06ed185b688e0e1ae0"
 SECTION = "libs"
 
 SRC_URI = " \
     http://libbsd.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
-    file://0001-flopen-Add-missing-fcntl.h-include.patch \
 "
 
-SRC_URI[md5sum] = "a74b80c4143afa032c90226a4518fffe"
-SRC_URI[sha256sum] = "56d835742327d69faccd16955a60b6dcf30684a8da518c4eca0ac713b9e0a7a4"
+SRC_URI[md5sum] = "ead96d240d02faa5b921c0aa50c812b5"
+SRC_URI[sha256sum] = "34b8adc726883d0e85b3118fa13605e179a62b31ba51f676136ecb2d0bc1a887"
 
 inherit autotools pkgconfig
 
-- 
2.7.4




