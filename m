Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RQzyI-0005Vl-3Q
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Nov 2011 12:17:34 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pAHBB8Uw024908
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2011 03:11:08 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 17 Nov 2011 03:11:08 -0800
Message-ID: <3dccc17f05b5413aa0190416feeff2a14d72be8a.1321527995.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1321527995.git.xiaofeng.yan@windriver.com>
References: <cover.1321527995.git.xiaofeng.yan@windriver.com>
Old-Date: Thu, 17 Nov 2011 19:03:21 +0800
Date: Thu, 17 Nov 2011 19:10:26 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] tslib: Set open mode for ts_calibate.c
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
X-List-Received-Date: Thu, 17 Nov 2011 11:17:34 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Get patch from: http://permalink.gmane.org/gmane.comp.lib.uclibc.buildroot/27614

There is a potentially "unsafe" use of open(). Ubuntu 8.10+, for instance,
by default enables the compiler flag -D_FORTIFY_SOURCE=2 \
which throws an error of ts_calibrate.c. To fix this, \
set a mode in the open() call, patch patched ts_calibrate.c \
to set 0644 (S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH) and it compiles fine

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 .../tslib/set-open-mode-for-ts_calibrate_c.patch   |   30 ++++++++++++++++++++
 meta/recipes-graphics/tslib/tslib_1.0.bb           |    5 ++-
 2 files changed, 33 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/tslib/tslib/set-open-mode-for-ts_calibrate_c.patch

diff --git a/meta/recipes-graphics/tslib/tslib/set-open-mode-for-ts_calibrate_c.patch b/meta/recipes-graphics/tslib/tslib/set-open-mode-for-ts_calibrate_c.patch
new file mode 100644
index 0000000..738ef9a
--- /dev/null
+++ b/meta/recipes-graphics/tslib/tslib/set-open-mode-for-ts_calibrate_c.patch
@@ -0,0 +1,30 @@
+Get patch from: http://permalink.gmane.org/gmane.comp.lib.uclibc.buildroot/27614
+
+Upstream-Status: Inappropriate [configuration]
+
+diff --git a/tests/ts_calibrate.c b/tests/ts_calibrate.c
+index 004517b..c0a9771 100644
+--- a/tests/ts_calibrate.c
++++ b/tests/ts_calibrate.c
+@@ -21,6 +21,7 @@
+ #include <sys/ioctl.h>
+ #include <sys/mman.h>
+ #include <sys/time.h>
++#include <sys/stat.h>
+ #include <linux/kd.h>
+ #include <linux/vt.h>
+ #include <linux/fb.h>
+@@ -224,9 +225,11 @@ int main()
+		for (i = 0; i < 7; i++) printf("%d ", cal.a [i]);
+		printf("\n");
+		if ((calfile = getenv("TSLIB_CALIBFILE")) != NULL) {
+-			cal_fd = open (calfile, O_CREAT | O_RDWR);
++			cal_fd = open (calfile, O_CREAT | O_RDWR,
++			S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
+		} else {
+-			cal_fd = open ("/etc/pointercal", O_CREAT | O_RDWR);
++			cal_fd = open ("/etc/pointercal", O_CREAT | O_RDWR,
++			S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
+		}
+		sprintf (cal_buffer,"%d %d %d %d %d %d %d",
+			 cal.a[1], cal.a[2], cal.a[0],
diff --git a/meta/recipes-graphics/tslib/tslib_1.0.bb b/meta/recipes-graphics/tslib/tslib_1.0.bb
index dbabce0..f47116f 100644
--- a/meta/recipes-graphics/tslib/tslib_1.0.bb
+++ b/meta/recipes-graphics/tslib/tslib_1.0.bb
@@ -10,13 +10,14 @@ SECTION = "base"
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f30a9716ef3762e3467a2f62bf790f0a"
 
-PR = "r19"
+PR = "r20"
 
 SRC_URI = "http://download.berlios.de/tslib/tslib-${PV}.tar.bz2 \
            file://fix_version.patch \
            file://0001-Link-plugins-against-libts.patch \
            file://ts.conf \
-           file://tslib.sh"
+           file://tslib.sh \
+           file://set-open-mode-for-ts_calibrate_c.patch"
 
 SRC_URI[md5sum] = "92b2eb55b1e4ef7e2c0347069389390e"
 SRC_URI[sha256sum] = "9c40d914e4f6fe00bdd77137d671c7ce4f211686228f2eb8b2d3c2360bc249c8"
-- 
1.7.0.4



