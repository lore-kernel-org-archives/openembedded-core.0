Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9768D60116
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 10:03:15 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 17 Dec 2015 02:03:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,440,1444719600"; d="scan'208";a="862811233"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga001.fm.intel.com with ESMTP; 17 Dec 2015 02:03:14 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Dec 2015 12:07:09 +0200
Message-Id: <1450346829-20936-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] xdg-utils: Do not build the in-script documentation
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
X-List-Received-Date: Thu, 17 Dec 2015 10:03:16 -0000

Building the contents for "--manual" option requires a web browser
or java. That's bonkers so let's not do it.

[YOCTO #8823]

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../0001-Don-t-build-the-in-script-manual.patch    | 30 ++++++++++++++++++++++
 meta/recipes-extended/xdg-utils/xdg-utils_1.1.1.bb |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-extended/xdg-utils/xdg-utils/0001-Don-t-build-the-in-script-manual.patch

diff --git a/meta/recipes-extended/xdg-utils/xdg-utils/0001-Don-t-build-the-in-script-manual.patch b/meta/recipes-extended/xdg-utils/xdg-utils/0001-Don-t-build-the-in-script-manual.patch
new file mode 100644
index 0000000..14160bf
--- /dev/null
+++ b/meta/recipes-extended/xdg-utils/xdg-utils/0001-Don-t-build-the-in-script-manual.patch
@@ -0,0 +1,30 @@
+From 33f42aa8d190b40be18cd0541b5881d46978b572 Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Thu, 17 Dec 2015 11:50:05 +0200
+Subject: [PATCH] Don't build the in-script manual
+
+Building the contents for "--manual" option requires a web browser
+or java (these are the two options for "xmlto txt" support).
+That's bonkers so don't do it: the man pages are still available
+and contain the same info.
+
+Upstream-Status: Inappropriate [disables in-script docs]
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+---
+ scripts/Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/scripts/Makefile.in b/scripts/Makefile.in
+index 430032d..85359bc 100644
+--- a/scripts/Makefile.in
++++ b/scripts/Makefile.in
+@@ -112,5 +112,5 @@ html/%.html: desc/%.xml
+ 	(cd html;$(XMLTO) html-nochunks ../$<)
+ 
+ %.txt: desc/%.xml
+-	$(XMLTO) txt $<
++	echo "Please see the man pages." > $@
+ 
+-- 
+2.1.4
+
diff --git a/meta/recipes-extended/xdg-utils/xdg-utils_1.1.1.bb b/meta/recipes-extended/xdg-utils/xdg-utils_1.1.1.bb
index 4f39594f..6f66c6e 100644
--- a/meta/recipes-extended/xdg-utils/xdg-utils_1.1.1.bb
+++ b/meta/recipes-extended/xdg-utils/xdg-utils_1.1.1.bb
@@ -19,6 +19,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a5367a90934098d6b05af3b746405014"
 
 SRC_URI = "http://portland.freedesktop.org/download/${BPN}-${PV}.tar.gz \
            file://0001-Reinstate-xdg-terminal.patch \
+           file://0001-Don-t-build-the-in-script-manual.patch \
           "
 
 SRC_URI[md5sum] = "2d0aec6037769a5f138ff404b1bb4b15"
-- 
2.1.4


