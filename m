Return-Path: <anuj.mittal@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 7EBA97FE1D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 05:41:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Dec 2019 21:41:23 -0800
X-IronPort-AV: E=Sophos;i="5.69,330,1571727600"; d="scan'208";a="206089318"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.221.17.193])
	by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Dec 2019 21:41:23 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Dec 2019 13:41:08 +0800
Message-Id: <509b450af8d1e4c25ded53db18524d669ecd834e.1576733575.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1576733575.git.anuj.mittal@intel.com>
References: <cover.1576733575.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [PATCH 7/7] libtasn1: upgrade 4.14 -> 4.15.0
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
X-List-Received-Date: Thu, 19 Dec 2019 05:41:22 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Remove backported patches and explicitly pass -std=gnu99 to native CFLAGS
to make sure build passes on older and still supported OSes like CentOS 7.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../gnutls/libtasn1/fix-gtkdoc.patch          | 38 -------------------
 .../gnutls/libtasn1/fix-ldflags.patch         | 31 ---------------
 .../{libtasn1_4.14.bb => libtasn1_4.15.0.bb}  |  8 ++--
 3 files changed, 4 insertions(+), 73 deletions(-)
 delete mode 100644 meta/recipes-support/gnutls/libtasn1/fix-gtkdoc.patch
 delete mode 100644 meta/recipes-support/gnutls/libtasn1/fix-ldflags.patch
 rename meta/recipes-support/gnutls/{libtasn1_4.14.bb => libtasn1_4.15.0.bb} (75%)

diff --git a/meta/recipes-support/gnutls/libtasn1/fix-gtkdoc.patch b/meta/recipes-support/gnutls/libtasn1/fix-gtkdoc.patch
deleted file mode 100644
index bfc9b9fca7..0000000000
--- a/meta/recipes-support/gnutls/libtasn1/fix-gtkdoc.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-Upstream-Status: Backport [https://gitlab.com/gnutls/libtasn1/merge_requests/49]
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From ebd4f871b5241809f6a5b461444a6d331e15c949 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Mon, 9 Sep 2019 13:11:39 +0100
-Subject: [PATCH] doc/reference: don't add empty object hierarchy chapter
-
-The object hierarchy section is empty because there are no GObjects in the
-libtasn1 API.  With gtk-doc 1.30 onwards if there are no objects then the object
-hierarchy file won't exist, resulting in a failure when building the
-documentation:
-
-| ../libtasn1-docs.xml:39: element include: XInclude error : could not load ../xml/tree_index.sgml, and no fallback was found
-
-Signed-off-by: Ross Burton <ross.burton@intel.com>
----
- doc/reference/libtasn1-docs.xml | 4 ----
- 1 file changed, 4 deletions(-)
-
-diff --git a/doc/reference/libtasn1-docs.xml b/doc/reference/libtasn1-docs.xml
-index accdb85..f88b888 100644
---- a/doc/reference/libtasn1-docs.xml
-+++ b/doc/reference/libtasn1-docs.xml
-@@ -34,10 +34,6 @@
-         <xi:include href="xml/libtasn1.xml"/>
- 
-   </chapter>
--  <chapter id="object-tree">
--    <title>Object Hierarchy</title>
--    <xi:include href="xml/tree_index.sgml"/>
--  </chapter>
-   <index id="api-index-full">
-     <title>API Index</title>
-     <xi:include href="xml/api-index-full.xml"><xi:fallback /></xi:include>
--- 
-2.20.1
-
diff --git a/meta/recipes-support/gnutls/libtasn1/fix-ldflags.patch b/meta/recipes-support/gnutls/libtasn1/fix-ldflags.patch
deleted file mode 100644
index f18f3c6267..0000000000
--- a/meta/recipes-support/gnutls/libtasn1/fix-ldflags.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From a6f93b7ace347bc4fe29eb4a8fe4383d786cc8d0 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Tim=20R=C3=BChsen?= <tim.ruehsen@gmx.de>
-Date: Tue, 23 Jul 2019 20:44:01 +0200
-Subject: [PATCH] Fix LDFLAGS to AM_LDFLAGS in src/Makefile.am
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Signed-off-by: Tim Rühsen <tim.ruehsen@gmx.de>
-Upstream-Status: Backport
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
- src/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 5bf3622..4459767 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -21,7 +21,7 @@ AM_CPPFLAGS = -I$(top_builddir)/lib/includes -I$(top_srcdir)/lib/includes \
-  -I$(top_builddir)/lib/gl -I$(top_srcdir)/lib/gl $(CODE_COVERAGE_CPPFLAGS)
- 
- LDADD = ../lib/libtasn1.la
--LDFLAGS = $(CODE_COVERAGE_LDFLAGS)
-+AM_LDFLAGS = $(CODE_COVERAGE_LDFLAGS)
- 
- bin_PROGRAMS = asn1Parser asn1Coding asn1Decoding
- 
--- 
-2.21.0
-
diff --git a/meta/recipes-support/gnutls/libtasn1_4.14.bb b/meta/recipes-support/gnutls/libtasn1_4.15.0.bb
similarity index 75%
rename from meta/recipes-support/gnutls/libtasn1_4.14.bb
rename to meta/recipes-support/gnutls/libtasn1_4.15.0.bb
index ef2c1956a2..115c98ae57 100644
--- a/meta/recipes-support/gnutls/libtasn1_4.14.bb
+++ b/meta/recipes-support/gnutls/libtasn1_4.15.0.bb
@@ -10,15 +10,15 @@ LIC_FILES_CHKSUM = "file://doc/COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 
 SRC_URI = "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz \
            file://dont-depend-on-help2man.patch \
-           file://fix-ldflags.patch \
-           file://fix-gtkdoc.patch \
            "
 
 DEPENDS = "bison-native"
 
-SRC_URI[md5sum] = "e9918200ed4a778e2b3cbe34c1be4205"
-SRC_URI[sha256sum] = "9e604ba5c5c8ea403487695c2e407405820d98540d9de884d6e844f9a9c5ba08"
+SRC_URI[md5sum] = "33e3fb5501bb2142184238c815b0beb8"
+SRC_URI[sha256sum] = "dd77509fe8f5304deafbca654dc7f0ea57f5841f41ba530cff9a5bf71382739e"
 
 inherit autotools texinfo lib_package gtk-doc
 
+CFLAGS_append_class-native = " -std=gnu99"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.21.0


