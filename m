Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7B70D60123
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 08:27:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w2F8RhNq029764
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 01:27:43 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 15 Mar 2018 01:27:42 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 15 Mar 2018 16:24:45 +0800
Message-ID: <20180315082445.8104-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] distcc: update to 3.3
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
X-List-Received-Date: Thu, 15 Mar 2018 08:27:42 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

* update to version 3.3
* Remove 0001-zeroconf-Include-fcntl.h.patch since it's
  included in v3.3
* Add update-distcc-symlinks into FILES.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../distcc/{distcc_3.2.bb => distcc_3.3.bb}        | 10 +++++---
 .../files/0001-zeroconf-Include-fcntl.h.patch      | 29 ----------------------
 2 files changed, 6 insertions(+), 33 deletions(-)
 rename meta/recipes-devtools/distcc/{distcc_3.2.bb => distcc_3.3.bb} (91%)
 delete mode 100644 meta/recipes-devtools/distcc/files/0001-zeroconf-Include-fcntl.h.patch

diff --git a/meta/recipes-devtools/distcc/distcc_3.2.bb b/meta/recipes-devtools/distcc/distcc_3.3.bb
similarity index 91%
rename from meta/recipes-devtools/distcc/distcc_3.2.bb
rename to meta/recipes-devtools/distcc/distcc_3.3.bb
index b6da65a582a..a266e7dde9b 100644
--- a/meta/recipes-devtools/distcc/distcc_3.2.bb
+++ b/meta/recipes-devtools/distcc/distcc_3.3.bb
@@ -14,14 +14,15 @@ PACKAGECONFIG[popt] = "--without-included-popt,--with-included-popt,popt"
 
 RRECOMMENDS_${PN} = "avahi-daemon"
 
-SRC_URI = "git://github.com/distcc/distcc.git;branch=${PV} \
+SRC_URI = "git://github.com/distcc/distcc.git;branch=master \
            file://separatebuilddir.patch \
-           file://0001-zeroconf-Include-fcntl.h.patch \
            file://default \
            file://distccmon-gnome.desktop \
            file://distcc \
            file://distcc.service"
-SRCREV = "d8b18df3e9dcbe4f092bed565835d3975e99432c"
+
+SRCREV = "002e68b766ccd7ad05551e67d162b71a7a773d0d"
+
 S = "${WORKDIR}/git"
 UPSTREAM_VERSION_UNKNOWN = "1"
 
@@ -60,9 +61,10 @@ PACKAGES += "distcc-distmon-gnome"
 
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
index b17ec9c9599..00000000000
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
-- 
2.13.0


