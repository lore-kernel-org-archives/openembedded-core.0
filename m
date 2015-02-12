Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 152C4606E8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Feb 2015 09:07:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t1C97iBQ007565
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Feb 2015 01:07:44 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 12 Feb 2015 01:07:44 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Feb 2015 01:07:40 -0800
Message-ID: <f783f1ce72214275bd85a460b527077bc751dd66.1423732000.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1423732000.git.liezhi.yang@windriver.com>
References: <cover.1423732000.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 7/7] neard: do not ship version.h
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
X-List-Received-Date: Thu, 12 Feb 2015 09:07:43 -0000
Content-Type: text/plain

The HEADERS' name has been changed to pkginclude_HEADERS, so use
nodist_pkginclude_HEADERS, otherwise version.h would be shipped.

It would cause other pkgs failed to build if ship version.h to
usr/include/version.h

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../neard/Makefile.am-do-not-ship-version.h.patch  |   36 ++++++++++++++++++++
 meta/recipes-connectivity/neard/neard_0.15.bb      |    1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-connectivity/neard/neard/Makefile.am-do-not-ship-version.h.patch

diff --git a/meta/recipes-connectivity/neard/neard/Makefile.am-do-not-ship-version.h.patch b/meta/recipes-connectivity/neard/neard/Makefile.am-do-not-ship-version.h.patch
new file mode 100644
index 0000000..16875e0
--- /dev/null
+++ b/meta/recipes-connectivity/neard/neard/Makefile.am-do-not-ship-version.h.patch
@@ -0,0 +1,36 @@
+From bfd32d68cfc9f1e31dab88e07446d1c02bc80b5e Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Thu, 12 Feb 2015 00:39:29 -0800
+Subject: [PATCH] Makefile.am: do not ship version.h
+
+The HEADERS' name has been changed to pkginclude_HEADERS, so use
+nodist_pkginclude_HEADERS, otherwise version.h would be shipped.
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ Makefile.am |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 3334790..69cd58f 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -10,11 +10,11 @@ pkginclude_HEADERS = include/types.h include/log.h include/plugin.h \
+ 			include/tlv.h include/setting.h include/device.h \
+ 			include/nfc_copy.h include/snep.h
+ 
+-nodist_include_HEADERS = include/version.h
++nodist_pkginclude_HEADERS = include/version.h
+ 
+ noinst_HEADERS = include/dbus.h
+ 
+-local_headers = $(foreach file,$(pkginclude_HEADERS) $(nodist_include_HEADERS) \
++local_headers = $(foreach file,$(pkginclude_HEADERS) $(nodist_pkginclude_HEADERS) \
+ 			$(noinst_HEADERS), include/near/$(notdir $(file)))
+ 
+ gdbus_sources = gdbus/gdbus.h gdbus/mainloop.c gdbus/watch.c \
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-connectivity/neard/neard_0.15.bb b/meta/recipes-connectivity/neard/neard_0.15.bb
index c92a171..508c622 100644
--- a/meta/recipes-connectivity/neard/neard_0.15.bb
+++ b/meta/recipes-connectivity/neard/neard_0.15.bb
@@ -3,6 +3,7 @@ require neard.inc
 SRC_URI = "${KERNELORG_MIRROR}/linux/network/nfc/${BP}.tar.xz \
            file://neard.in \
            file://Makefile.am-fix-parallel-issue.patch \
+           file://Makefile.am-do-not-ship-version.h.patch \
           "
 SRC_URI[md5sum] = "b746ce62eeef88e8de90765e00a75a1c"
 SRC_URI[sha256sum] = "651f6513d32cdaf8a426255d03aff38a6620a89b0567ec2b36606c6330a93353"
-- 
1.7.9.5


