Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C41F87750B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jun 2016 09:15:32 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 03 Jun 2016 02:15:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,411,1459839600"; d="scan'208";a="994440295"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 03 Jun 2016 02:15:33 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Jun 2016 12:15:01 +0300
Message-Id: <fa0f3722d5696d723dc8982386bfee6bcc43735f.1464945141.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
References: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
References: <cover.1464945141.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 24/25] systemtap: update to 3.0
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
X-List-Received-Date: Fri, 03 Jun 2016 09:15:33 -0000

Remove docproc-build-fix.patch, as the build problem it's fixing
now happens only if building html docs is explicitly enabled
(which we do not do).

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../systemtap/systemtap/docproc-build-fix.patch       | 19 -------------------
 meta/recipes-kernel/systemtap/systemtap_git.bb        |  2 +-
 meta/recipes-kernel/systemtap/systemtap_git.inc       |  5 ++---
 3 files changed, 3 insertions(+), 23 deletions(-)
 delete mode 100644 meta/recipes-kernel/systemtap/systemtap/docproc-build-fix.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/docproc-build-fix.patch b/meta/recipes-kernel/systemtap/systemtap/docproc-build-fix.patch
deleted file mode 100644
index 33a8994..0000000
--- a/meta/recipes-kernel/systemtap/systemtap/docproc-build-fix.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
-
-Index: git/doc/SystemTap_Tapset_Reference/Makefile.am
-===================================================================
---- git.orig/doc/SystemTap_Tapset_Reference/Makefile.am	2012-04-13 08:43:46.263339003 -0500
-+++ git/doc/SystemTap_Tapset_Reference/Makefile.am	2012-04-13 09:31:22.470083915 -0500
-@@ -27,6 +27,10 @@
- noinst_PROGRAMS = docproc
- SRCTREE=$(abs_top_srcdir)/
- DOCPROC=$(abs_builddir)/docproc
-+docproc_LINK = $(CC_FOR_BUILD) $(LDFLAGS_FOR_BUILD) -o $@
-+
-+docproc.o: $(srcdir)/docproc.c
-+	$(CC_FOR_BUILD) -c $(CFLAGS_FOR_BUILD) -o $@ $(srcdir)/docproc.c
- 
- all: $(PDFDOCS) stamp-htmldocs stamp-mandocs
- tapsets.xml: docproc $(shell find $(SRCTREE)/tapset -name '*.stp')
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.bb b/meta/recipes-kernel/systemtap/systemtap_git.bb
index 97064b8..b431a23 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap_git.bb
@@ -2,7 +2,7 @@ SUMMARY = "Script-directed dynamic tracing and performance analysis tool for Lin
 
 require systemtap_git.inc
 
-DEPENDS = "elfutils sqlite3 systemtap-native"
+DEPENDS = "elfutils sqlite3 systemtap-native json-c"
 DEPENDS_class-native = "elfutils-native sqlite3-native gettext-native"
 DEPENDS_class-nativesdk = "nativesdk-elfutils nativesdk-sqlite3 nativesdk-gettext"
 
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index 656f15f..ce976ed 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -1,10 +1,9 @@
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-SRCREV = "7009f2f782e52d6105fe68d6ea2a9820a1099c06"
-PV = "2.9"
+SRCREV = "616ec7a0b916df7785d911b824c3df6eb022b213"
+PV = "3.0"
 
 SRC_URI = "git://sourceware.org/git/systemtap.git \
-           file://docproc-build-fix.patch \
            file://obsolete_automake_macros.patch \
            file://system_map_location.patch \
            file://configure-allow-to-disable-libvirt.patch \
-- 
2.8.1


