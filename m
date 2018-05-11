Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9789A77142
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 16:07:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w4BG7TOW012294
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 11 May 2018 09:07:29 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Fri, 11 May 2018 09:07:28 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Sat, 12 May 2018 00:15:20 +0800
Message-ID: <1526055320-13443-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH V2] distcc: update to 3.3
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
X-List-Received-Date: Fri, 11 May 2018 16:07:29 -0000
Content-Type: text/plain

* update to version 3.3
* Remove 0001-zeroconf-Include-fcntl.h.patch since it's
  included in v3.3
* Add update-distcc-symlinks into FILES.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>

* Correct upstream SRC_URI and SRCREV to v3.3
* Correct default to fix starting distccd service failed
  It caused by upstream commit:
  https://github.com/distcc/distcc/commit/920e8b922addea8c54e68cc29c1416753f532f78
  ...
  commit 920e8b922addea8c54e68cc29c1416753f532f78
  Author: Shawn Landden <slandden@gmail.com>
  Date:   Mon Feb 26 11:29:14 2018 -0800

      daemon: warn when masquerade is not setup
  ...
  Add option --make-me-a-botnet to disable the warning.

* Use localhost to replace 192.168.7.0/24 which is inappropriate for runqemu slirp.

[YOCTO #12741]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../distcc/{distcc_3.2.bb => distcc_3.3.bb}        |  8 +++---
 .../files/0001-zeroconf-Include-fcntl.h.patch      | 29 ----------------------
 meta/recipes-devtools/distcc/files/default         |  4 +--
 3 files changed, 6 insertions(+), 35 deletions(-)
 rename meta/recipes-devtools/distcc/{distcc_3.2.bb => distcc_3.3.bb} (91%)
 delete mode 100644 meta/recipes-devtools/distcc/files/0001-zeroconf-Include-fcntl.h.patch

diff --git a/meta/recipes-devtools/distcc/distcc_3.2.bb b/meta/recipes-devtools/distcc/distcc_3.3.bb
similarity index 91%
rename from meta/recipes-devtools/distcc/distcc_3.2.bb
rename to meta/recipes-devtools/distcc/distcc_3.3.bb
index ff0e22f..c4c65e6 100644
--- a/meta/recipes-devtools/distcc/distcc_3.2.bb
+++ b/meta/recipes-devtools/distcc/distcc_3.3.bb
@@ -14,14 +14,13 @@ PACKAGECONFIG[popt] = "--without-included-popt,--with-included-popt,popt"
 
 RRECOMMENDS_${PN} = "avahi-daemon"
 
-SRC_URI = "git://github.com/akuster/distcc.git;branch=${PV} \
+SRC_URI = "git://github.com/distcc/distcc.git \
            file://separatebuilddir.patch \
-           file://0001-zeroconf-Include-fcntl.h.patch \
            file://default \
            file://distccmon-gnome.desktop \
            file://distcc \
            file://distcc.service"
-SRCREV = "d8b18df3e9dcbe4f092bed565835d3975e99432c"
+SRCREV = "002e68b766ccd7ad05551e67d162b71a7a773d0d"
 S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig update-rc.d useradd systemd
@@ -59,9 +58,10 @@ PACKAGES += "distcc-distmon-gnome"
 
 FILES_${PN} = " ${sysconfdir} \
 		${bindir}/distcc \
-    ${bindir}/lsdistcc \
+		${bindir}/lsdistcc \
 		${bindir}/distccd \
 		${bindir}/distccmon-text \
+		${sbindir}/update-distcc-symlinks \
 		${systemd_unitdir}/system/distcc.service"
 FILES_distcc-distmon-gnome = "  ${bindir}/distccmon-gnome \
 				${datadir}/distcc"
diff --git a/meta/recipes-devtools/distcc/files/0001-zeroconf-Include-fcntl.h.patch b/meta/recipes-devtools/distcc/files/0001-zeroconf-Include-fcntl.h.patch
deleted file mode 100644
index b17ec9c..0000000
--- a/meta/recipes-devtools/distcc/files/0001-zeroconf-Include-fcntl.h.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 8331fc4759d809512f404e7a27f817ad6d616450 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 13 Apr 2015 18:00:33 -0700
-Subject: [PATCH] zeroconf: Include fcntl.h
-
-We need it for getting deinitions for O_* e.g. O_CREAT
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/zeroconf.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/zeroconf.c b/src/zeroconf.c
-index 414ddc4..31bd33f 100644
---- a/src/zeroconf.c
-+++ b/src/zeroconf.c
-@@ -33,6 +33,7 @@
- #include <unistd.h>
- #include <stdlib.h>
- #include <limits.h>
-+#include <fcntl.h>
- 
- #include <avahi-common/domain.h>
- #include <avahi-common/error.h>
--- 
-2.1.4
-
diff --git a/meta/recipes-devtools/distcc/files/default b/meta/recipes-devtools/distcc/files/default
index 63c4159..e5ca68b 100644
--- a/meta/recipes-devtools/distcc/files/default
+++ b/meta/recipes-devtools/distcc/files/default
@@ -16,9 +16,9 @@ STARTDISTCC="true"
 #
 # ALLOWEDNETS="127.0.0.1"
 
-ALLOWEDNETS="192.168.7.0/24"
+ALLOWEDNETS="127.0.0.1"
 
 #
 # OPTIONS is used for the systemd service file
 #
-OPTIONS="--allow 192.168.7.0/24"
+OPTIONS="--allow 127.0.0.1 --make-me-a-botnet"
-- 
2.7.4


