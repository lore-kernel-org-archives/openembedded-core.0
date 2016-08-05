Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9527E73D46
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2016 21:42:58 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 05 Aug 2016 14:42:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,475,1464678000"; d="scan'208";a="1035977105"
Received: from pgronows-mobl.amr.corp.intel.com (HELO
	alimonb-mobl1.zpn.intel.com) ([10.254.134.94])
	by fmsmga002.fm.intel.com with ESMTP; 05 Aug 2016 14:42:51 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Aug 2016 16:42:48 -0500
Message-Id: <1470433368-13508-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH] apt: Fix build in musl it was break due to upgrade to 1.2.12
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
X-List-Received-Date: Fri, 05 Aug 2016 21:43:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

methods/connect.cc: Musl doesn't support AI_IDN flag in netdb.h
header so define it manually.
apt-pkg/contrib/srvrec.h: Add explicity include of sys/types.h
to avoid errors in types u_int_SIZE.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/recipes-devtools/apt/apt.inc                  |  1 +
 .../apt/apt/0001-apt-1.2.12-Fix-musl-build.patch   | 50 ++++++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-devtools/apt/apt/0001-apt-1.2.12-Fix-musl-build.patch

diff --git a/meta/recipes-devtools/apt/apt.inc b/meta/recipes-devtools/apt/apt.inc
index 87cc206..3026370 100644
--- a/meta/recipes-devtools/apt/apt.inc
+++ b/meta/recipes-devtools/apt/apt.inc
@@ -12,6 +12,7 @@ SRC_URI = "http://snapshot.debian.org/archive/debian/20160526T162943Z/pool/main/
            file://disable-configure-in-makefile.patch \
            file://disable-test.patch \
            file://0001-environment.mak-musl-based-systems-can-generate-shar.patch \
+           file://0001-apt-1.2.12-Fix-musl-build.patch \
            "
 SRC_URI[md5sum] = "80f6f0ef110a45a7e5af8a9d233fb0e7"
 SRC_URI[sha256sum] = "e820d27cba73476df4abcff27dadd1b5847474bfe85f7e9202a9a07526973ea6"
diff --git a/meta/recipes-devtools/apt/apt/0001-apt-1.2.12-Fix-musl-build.patch b/meta/recipes-devtools/apt/apt/0001-apt-1.2.12-Fix-musl-build.patch
new file mode 100644
index 0000000..04b0406
--- /dev/null
+++ b/meta/recipes-devtools/apt/apt/0001-apt-1.2.12-Fix-musl-build.patch
@@ -0,0 +1,50 @@
+From 33b97e089d4a98d3acd20bd78337dd915b989bc2 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
+Date: Fri, 5 Aug 2016 15:24:27 -0500
+Subject: [PATCH] apt 1.2.12: Fix musl build
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+methods/connect.cc: Musl doesn't support AI_IDN flag in netdb.h
+header so define it manually.
+apt-pkg/contrib/srvrec.h: Add explicity include of sys/types.h
+to avoid errors in types u_int_SIZE.
+
+Upstream-status: Pending
+
+Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
+---
+ apt-pkg/contrib/srvrec.h | 1 +
+ methods/connect.cc       | 3 +++
+ 2 files changed, 4 insertions(+)
+
+diff --git a/apt-pkg/contrib/srvrec.h b/apt-pkg/contrib/srvrec.h
+index 01b8102..15b6875 100644
+--- a/apt-pkg/contrib/srvrec.h
++++ b/apt-pkg/contrib/srvrec.h
+@@ -9,6 +9,7 @@
+ #ifndef SRVREC_H
+ #define SRVREC_H
+ 
++#include <sys/types.h>
+ #include <arpa/nameser.h>
+ #include <vector>
+ #include <string>
+diff --git a/methods/connect.cc b/methods/connect.cc
+index 07a730b..bb0ab5a 100644
+--- a/methods/connect.cc
++++ b/methods/connect.cc
+@@ -33,6 +33,9 @@
+ #include <sys/socket.h>
+ #include <arpa/inet.h>
+ #include <netdb.h>
++#ifndef AI_IDN
++#define AI_IDN 0x0040
++#endif
+ 
+ #include "connect.h"
+ #include "rfc2553emu.h"
+-- 
+2.1.4
+
-- 
2.1.4


