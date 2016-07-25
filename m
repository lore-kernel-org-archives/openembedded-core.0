Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E04FA6E667
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 08:16:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u6P8GgaB027688
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 01:16:42 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 25 Jul 2016 01:16:42 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 25 Jul 2016 01:16:31 -0700
Message-ID: <54eb366b1c1942a7e8c9115d98b194bd481167e5.1469431066.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1469431066.git.liezhi.yang@windriver.com>
References: <cover.1469431066.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 7/7] ccache: 3.2.4 -> 3.2.5
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
X-List-Received-Date: Mon, 25 Jul 2016 08:16:42 -0000
Content-Type: text/plain

Add Revert-Create-man-page-in-the-make-install-from-git-.patch to
disable asciidoc since we don't have it.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/ccache/ccache_3.2.4.bb       | 10 -------
 meta/recipes-devtools/ccache/ccache_3.2.5.bb       | 11 ++++++++
 ...te-man-page-in-the-make-install-from-git-.patch | 33 ++++++++++++++++++++++
 3 files changed, 44 insertions(+), 10 deletions(-)
 delete mode 100644 meta/recipes-devtools/ccache/ccache_3.2.4.bb
 create mode 100644 meta/recipes-devtools/ccache/ccache_3.2.5.bb
 create mode 100644 meta/recipes-devtools/ccache/files/Revert-Create-man-page-in-the-make-install-from-git-.patch

diff --git a/meta/recipes-devtools/ccache/ccache_3.2.4.bb b/meta/recipes-devtools/ccache/ccache_3.2.4.bb
deleted file mode 100644
index fd45e41..0000000
--- a/meta/recipes-devtools/ccache/ccache_3.2.4.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require ccache.inc
-
-LICENSE = "GPLv3+"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b3c337e7664559a789d9f7a93e5283c1"
-
-SRCREV = "2254797f1c5cfb83c4272da7b138f7f47218eb7d"
-
-SRC_URI += " \
-            file://0002-dev.mk.in-fix-file-name-too-long.patch \
-"
diff --git a/meta/recipes-devtools/ccache/ccache_3.2.5.bb b/meta/recipes-devtools/ccache/ccache_3.2.5.bb
new file mode 100644
index 0000000..afd1b0e
--- /dev/null
+++ b/meta/recipes-devtools/ccache/ccache_3.2.5.bb
@@ -0,0 +1,11 @@
+require ccache.inc
+
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b8a4fa173ed91c1a5204ea4f9c9eadc3"
+
+SRCREV = "424d3ae1fb73444c6c38bf189f8fc048f66d6499"
+
+SRC_URI += " \
+            file://0002-dev.mk.in-fix-file-name-too-long.patch \
+            file://Revert-Create-man-page-in-the-make-install-from-git-.patch \
+"
diff --git a/meta/recipes-devtools/ccache/files/Revert-Create-man-page-in-the-make-install-from-git-.patch b/meta/recipes-devtools/ccache/files/Revert-Create-man-page-in-the-make-install-from-git-.patch
new file mode 100644
index 0000000..f0208b9
--- /dev/null
+++ b/meta/recipes-devtools/ccache/files/Revert-Create-man-page-in-the-make-install-from-git-.patch
@@ -0,0 +1,33 @@
+From 94fabcdda5c7e54ccdbc1f0aeccb26ce30e61226 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Mon, 18 Jul 2016 19:53:00 -0700
+Subject: [PATCH] Revert "Create man page in the make-install-from-git-repo
+ case"
+
+This reverts commit b86784902d28defd5e475c8922de594787df4541.
+
+We dont' have asciidoc, so revert it.
+
+Upstream-Status: Inappropriate [OE-Core specific]
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index d474f2a..c6cdc04 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -76,7 +76,7 @@ ccache$(EXEEXT): $(ccache_objs) $(extra_libs)
+ 	$(CC) $(all_cflags) -o $@ $(ccache_objs) $(LDFLAGS) $(extra_libs) $(LIBS)
+ 
+ .PHONY: install
+-install: all $(srcdir)/ccache.1
++install: all
+ 	$(installcmd) -d $(DESTDIR)$(bindir)
+ 	$(installcmd) -m 755 ccache$(EXEEXT) $(DESTDIR)$(bindir)
+ 	$(installcmd) -d $(DESTDIR)$(mandir)/man1
+-- 
+2.9.0
+
-- 
2.9.0


