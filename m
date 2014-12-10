Return-Path: <raphael.freudiger@siemens.com>
X-Greylist: delayed 965 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 10 Dec 2014 09:41:02 UTC
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id 105627231B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 09:41:02 +0000 (UTC)
Received: from mail1.siemens.de (localhost [127.0.0.1])
	by goliath.siemens.de (8.14.3/8.14.3) with ESMTP id sBA9OsEn015677
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Dec 2014 10:24:55 +0100
Received: from localhost.localdomain (MD1AT2FC.ww002.siemens.net
	[139.16.79.114])
	by mail1.siemens.de (8.14.3/8.14.3) with ESMTP id sBA9Os8h029677;
	Wed, 10 Dec 2014 10:24:54 +0100
From: Raphael Freudiger <raphael.freudiger@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Dec 2014 10:22:49 +0100
Message-Id: <1418203369-6949-1-git-send-email-raphael.freudiger@siemens.com>
X-Mailer: git-send-email 1.7.10.4
Cc: Raphael Freudiger <raphael.freudiger@siemens.com>
Subject: [PATCH] p7zip: new recipe
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
X-List-Received-Date: Wed, 10 Dec 2014 09:41:09 -0000

p7zip is the command line version of 7-Zip for Unix/Linux.

Signed-off-by: Raphael Freudiger <raphael.freudiger@siemens.com>
---
 .../p7zip/files/do_not_override_compiler.patch     |   23 ++++++++++++++++++++
 meta/recipes-extended/p7zip/p7zip_9.20.1.bb        |   22 +++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-extended/p7zip/files/do_not_override_compiler.patch
 create mode 100644 meta/recipes-extended/p7zip/p7zip_9.20.1.bb

diff --git a/meta/recipes-extended/p7zip/files/do_not_override_compiler.patch b/meta/recipes-extended/p7zip/files/do_not_override_compiler.patch
new file mode 100644
index 0000000..5d27bad
--- /dev/null
+++ b/meta/recipes-extended/p7zip/files/do_not_override_compiler.patch
@@ -0,0 +1,23 @@
+do not override compiler
+
+The default makefile sets the compiler to g++ or gcc. This leads to a wrong architecture when cross-compiling.
+Remove the hardcoded compiler and just append the flags to CXX and CC.
+
+Upstream-Status: Pending
+Signed-off-by: Raphael Freudiger <raphael.freudiger@siemens.com>
+
+Index: p7zip_9.20.1/makefile.machine
+=====================================================================
+--- p7zip_9.20.1.orig/makefile.machine	2011-03-13 12:54:57.000000000 +0100
++++ p7zip_9.20.1/makefile.machine	2014-11-12 16:20:22.880349826 +0100
+@@ -10,8 +10,8 @@
+ 	-D_7ZIP_LARGE_PAGES \
+ 	$(LOCAL_FLAGS)
+ 
+-CXX=g++ $(ALLFLAGS)
+-CC=gcc $(ALLFLAGS)
++CXX+=$(ALLFLAGS)
++CC+=$(ALLFLAGS)
+ CC_SHARED=-fPIC
+ LINK_SHARED=-fPIC -shared
+ 
diff --git a/meta/recipes-extended/p7zip/p7zip_9.20.1.bb b/meta/recipes-extended/p7zip/p7zip_9.20.1.bb
new file mode 100644
index 0000000..b67db00
--- /dev/null
+++ b/meta/recipes-extended/p7zip/p7zip_9.20.1.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "7-zip is a commandline utility handling 7z archives."
+HOMEPAGE = "http://www.7-zip.org/"
+LICENSE = "LGPL-2.1+"
+LIC_FILES_CHKSUM = "file://./DOCS/copying.txt;md5=ecfc54c9e37b63ac58900061ce2eab5a"
+PR = "r1"
+
+SRC_URI = "http://downloads.sourceforge.net/p7zip/p7zip/${PV}/p7zip_${PV}_src_all.tar.bz2 \
+          file://do_not_override_compiler.patch"
+
+S = "${WORKDIR}/${PN}_${PV}"
+
+INHIBIT_PACKAGE_STRIP = "1"
+
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 0755 ${S}/bin/* ${D}${bindir}    
+}
+
+
+SRC_URI[md5sum] = "bd6caaea567dc0d995c990c5cc883c89"
+SRC_URI[sha256sum] = "49557e7ffca08100f9fc687f4dfc5aea703ca207640c76d9dee7b66f03cb4782"
-- 
1.7.10.4


