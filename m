Return-Path: <juro.bystricky@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0891D781D3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Aug 2017 19:20:58 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Aug 2017 12:21:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,354,1498546800"; d="scan'208";a="122199892"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.53])
	by orsmga002.jf.intel.com with ESMTP; 10 Aug 2017 12:21:00 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Aug 2017 12:20:55 -0700
Message-Id: <1502392855-10187-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] e2fsprogs-doc: binary reproducible
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
X-List-Received-Date: Thu, 10 Aug 2017 19:21:04 -0000

When compressing by gzip, do not save the original file name and time stamp.

[YOCTO #11916]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 .../e2fsprogs/e2fsprogs/reproducible-doc.patch      | 21 +++++++++++++++++++++
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.4.bb |  1 +
 2 files changed, 22 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/reproducible-doc.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/reproducible-doc.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/reproducible-doc.patch
new file mode 100644
index 0000000..8e5d1d3
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/reproducible-doc.patch
@@ -0,0 +1,21 @@
+
+Suppport for binary reproducibility.
+When compressing, do not save the original file name and time stamp.
+
+Upstream-Status: Submitted [Theodore Ts'o tytso@mit.edu (maintainer)]
+
+Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
+
+diff --git a/doc/Makefile.in b/doc/Makefile.in
+index 9cb584c..0bee4e4 100644
+--- a/doc/Makefile.in
++++ b/doc/Makefile.in
+@@ -28,7 +28,7 @@ install-doc-libs: libext2fs.info libext2fs.dvi
+ 		$(INSTALL_DATA) $$i $(DESTDIR)$(infodir)/$$i ; \
+ 	done
+ 	$(E) "	GZIP $(infodir)/libext2fs.info*"
+-	-$(Q) gzip -9 $(DESTDIR)$(infodir)/libext2fs.info*
++	-$(Q) gzip -9 -n $(DESTDIR)$(infodir)/libext2fs.info*
+ 
+ uninstall-doc-libs:
+ 	$(RM) -rf $(DESTDIR)$(infodir)/libext2fs.info*
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.4.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.4.bb
index 7c8809a..56929c9 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.4.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.4.bb
@@ -10,6 +10,7 @@ SRC_URI += "file://acinclude.m4 \
             file://e2fsprogs-1.43-sysmacros.patch \
             file://mkdir_p.patch \
             file://0001-e2fsck-exit-with-exit-status-0-if-no-errors-were-fix.patch \
+            file://reproducible-doc.patch \
 "
 
 SRC_URI_append_class-native = " file://e2fsprogs-fix-missing-check-for-permission-denied.patch"
-- 
2.7.4


