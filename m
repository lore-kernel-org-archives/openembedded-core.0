Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RBXVQ-0007UD-PZ
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Oct 2011 21:51:53 +0200
Received: by pzd13 with SMTP id 13so5234485pzd.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Oct 2011 12:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=M2dmiPA4p/aoO38CHlweZRZMtKuZQiAIe1FxNIGENgY=;
	b=UzmmqHLFAlL+u5564UZZzuioNO8d3SrTsHsrK1xUvg+1oqz5scrabPE7pu9SGMABJx
	Wa/yXhmpUsGrP7VJxJt+BDKlCehkMEvyA5DhasxxLLZ8ifEyfH2XDNaQhdK5dnLCDfMl
	i88RmYQNWoDco1+i2l18UIjL2NKgRYGtfuwAA=
Received: by 10.68.33.164 with SMTP id s4mr21404094pbi.119.1317843976463;
	Wed, 05 Oct 2011 12:46:16 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id h5sm10575691pbq.11.2011.10.05.12.46.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Oct 2011 12:46:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Oct 2011 12:46:12 -0700
Message-Id: <1317843972-4213-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] shared-mime-info: Upgrade recipes from 0.90 -> 0.91
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
X-List-Received-Date: Wed, 05 Oct 2011 19:51:53 -0000

The parallel build problems are solved upstream therefore removed

License file has been corrected to use 'GNU Lesser GPL' instead of
'GNU library GPL' and some indentation changes

The license is LGPLv2+ therefore mark it so

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../files/fix-parallel-build-backport.patch        |   26 ---------------
 .../files/fix-parallel-build.patch                 |   33 --------------------
 .../shared-mime-info/shared-mime-info.inc          |    6 ++--
 .../shared-mime-info/shared-mime-info_0.90.bb      |    8 -----
 .../shared-mime-info/shared-mime-info_0.91.bb      |    6 +++
 5 files changed, 9 insertions(+), 70 deletions(-)
 delete mode 100644 meta/recipes-support/shared-mime-info/files/fix-parallel-build-backport.patch
 delete mode 100644 meta/recipes-support/shared-mime-info/files/fix-parallel-build.patch
 delete mode 100644 meta/recipes-support/shared-mime-info/shared-mime-info_0.90.bb
 create mode 100644 meta/recipes-support/shared-mime-info/shared-mime-info_0.91.bb

diff --git a/meta/recipes-support/shared-mime-info/files/fix-parallel-build-backport.patch b/meta/recipes-support/shared-mime-info/files/fix-parallel-build-backport.patch
deleted file mode 100644
index a78e6a8..0000000
--- a/meta/recipes-support/shared-mime-info/files/fix-parallel-build-backport.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Backport fix for https://bugs.freedesktop.org/show_bug.cgi?id=32127
-
-Upstream-Status: Inappropriate [Backport]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-From 68e31f61f5e50e5222bc05437d1123e932922796 Mon Sep 17 00:00:00 2001
-From: Samuli Suominen <ssuominen@gentoo.org>
-Date: Mon, 06 Dec 2010 19:46:57 +0000
-Subject: Fix parallel build
-
-https://bugs.freedesktop.org/show_bug.cgi?id=32127
----
-Index: shared-mime-info-0.90/Makefile.am
-===================================================================
---- shared-mime-info-0.90.orig/Makefile.am	2011-05-25 15:50:18.000000000 -0700
-+++ shared-mime-info-0.90/Makefile.am	2011-05-25 15:50:45.153489305 -0700
-@@ -72,7 +72,7 @@
- create-pot:
- 	$(MAKE) -C po shared-mime-info.pot
- 
--check: freedesktop.org.xml check-translations
-+check: create-pot freedesktop.org.xml check-translations
- 	if test -n $(XMLLINT) ; then \
- 		if test -e $(top_builddir)/freedesktop.org.xml; then \
- 		xmllint --noout --valid $(top_builddir)/freedesktop.org.xml;	\
diff --git a/meta/recipes-support/shared-mime-info/files/fix-parallel-build.patch b/meta/recipes-support/shared-mime-info/files/fix-parallel-build.patch
deleted file mode 100644
index ea8b05e..0000000
--- a/meta/recipes-support/shared-mime-info/files/fix-parallel-build.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-the check rule will trigger a weird dependency issue in automake,
-it's possible that update-mime-database are invoked simultaneously in
-two different threads at the same time.
-
-As a workaround, revert it to the logic in 0.80
-
-Upstream-Status: Inappropriate [workaround]
-
-Signed-off-by: qing He <qing.he@intel.com>
-
-diff --git a/Makefile.am b/Makefile.am
-index 1a887bc..9df581e 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -72,7 +72,7 @@ uninstall-hook:
- create-pot:
- 	$(MAKE) -C po shared-mime-info.pot
- 
--check: freedesktop.org.xml update-mime-database check-translations
-+check: freedesktop.org.xml check-translations
- 	if test -n $(XMLLINT) ; then \
- 		if test -e $(top_builddir)/freedesktop.org.xml; then \
- 		xmllint --noout --valid $(top_builddir)/freedesktop.org.xml;	\
-@@ -80,9 +80,6 @@ check: freedesktop.org.xml update-mime-database check-translations
- 		xmllint --noout --valid $(top_srcdir)/freedesktop.org.xml;	\
- 		fi \
- 	fi
--	if test -d .git/ && test -x $(top_builddir)/update-mime-database && test -d $(top_srcdir)/mime-db-tests ; then \
--		$(top_builddir)/update-mime-database mime-db-tests/ ; \
--	fi
- 	if test -d .git/ && test -x ../xdgmime/src/test-mime-data && test -x $(top_builddir)/test-tree-magic ; then \
- 		mkdir -p $(top_builddir)/temp-mime-dir/mime/packages ; \
- 		cp -a $(top_builddir)/freedesktop.org.xml $(top_builddir)/temp-mime-dir/mime/packages/ ; \
diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info.inc b/meta/recipes-support/shared-mime-info/shared-mime-info.inc
index 64eef9d..c8cab29 100644
--- a/meta/recipes-support/shared-mime-info/shared-mime-info.inc
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info.inc
@@ -2,13 +2,13 @@ DESCRIPTION = "shared MIME database and spec"
 HOMEPAGE = "http://freedesktop.org/wiki/Software/shared-mime-info"
 SECTION = "base"
 
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
+LICENSE = "LGPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS = "libxml2 intltool-native glib-2.0 shared-mime-info-native"
 DEPENDS_virtclass-native = "libxml2-native intltool-native glib-2.0-native"
 
-SRC_URI = "http://freedesktop.org/~hadess/shared-mime-info-${PV}.tar.bz2"
+SRC_URI = "http://freedesktop.org/~hadess/shared-mime-info-${PV}.tar.xz"
 
 inherit autotools pkgconfig gettext
 
diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_0.90.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_0.90.bb
deleted file mode 100644
index cbbd0fe..0000000
--- a/meta/recipes-support/shared-mime-info/shared-mime-info_0.90.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require shared-mime-info.inc
-PR = "r0"
-
-SRC_URI += "file://fix-parallel-build.patch \
-            file://fix-parallel-build-backport.patch \
-           "
-SRC_URI[md5sum] = "967d68d3890ba3994cfce3adf5b8f15b"
-SRC_URI[sha256sum] = "52c9f84a8c72de631a0458542980b1728560f59845eb5e93e1dbe825f4b72304"
diff --git a/meta/recipes-support/shared-mime-info/shared-mime-info_0.91.bb b/meta/recipes-support/shared-mime-info/shared-mime-info_0.91.bb
new file mode 100644
index 0000000..76d2756
--- /dev/null
+++ b/meta/recipes-support/shared-mime-info/shared-mime-info_0.91.bb
@@ -0,0 +1,6 @@
+require shared-mime-info.inc
+PR = "r0"
+
+SRC_URI[md5sum] = "982a211560ba4c47dc791ccff34e8fbc"
+SRC_URI[sha256sum] = "98cfebe1d809afb24934e634373821e2a1dfa86fc6462cab230589a1c80988bd"
+
-- 
1.7.5.4



