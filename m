Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id AA9FD7734D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 14:04:45 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Feb 2017 06:04:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,141,1484035200"; d="scan'208";a="1093187546"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 10 Feb 2017 06:04:45 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id BD9336A4080;
	Fri, 10 Feb 2017 06:03:43 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2017 16:04:38 +0200
Message-Id: <1486735478-8769-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH] libxslt: Add build fix (with ld-is-gold)
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
X-List-Received-Date: Fri, 10 Feb 2017 14:04:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Libraries must be linked with "-lm", otherwise gold fails to link
binaries with those libraries.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../libxslt/0001-Link-libraries-with-libm.patch    | 48 ++++++++++++++++++++++
 meta/recipes-support/libxslt/libxslt_1.1.29.bb     |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-support/libxslt/libxslt/0001-Link-libraries-with-libm.patch

diff --git a/meta/recipes-support/libxslt/libxslt/0001-Link-libraries-with-libm.patch b/meta/recipes-support/libxslt/libxslt/0001-Link-libraries-with-libm.patch
new file mode 100644
index 0000000..16ffeba
--- /dev/null
+++ b/meta/recipes-support/libxslt/libxslt/0001-Link-libraries-with-libm.patch
@@ -0,0 +1,48 @@
+From 487e2f7e35dad3deec7978ce4478a3d4ea5070e7 Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Fri, 10 Feb 2017 14:26:59 +0200
+Subject: [PATCH] Link libraries with libm
+
+Otherwise linking the resulting libraries to a binary (e.g. xsltproc)
+fails when using gold linker:
+| ../libxslt/.libs/libxslt.so: error: undefined reference to 'fmod'
+| ../libxslt/.libs/libxslt.so: error: undefined reference to 'pow'
+| ../libexslt/.libs/libexslt.so: error: undefined reference to 'floor'
+| collect2: error: ld returned 1 exit status
+
+Upstream-Status: Submitted [mailing list, Feb 10 2017]
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+---
+ libexslt/Makefile.am | 2 +-
+ libxslt/Makefile.am  | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libexslt/Makefile.am b/libexslt/Makefile.am
+index 1cf5138..5449524 100644
+--- a/libexslt/Makefile.am
++++ b/libexslt/Makefile.am
+@@ -27,7 +27,7 @@ libexslt_la_SOURCES =                   \
+ 	libexslt.h			\
+ 	dynamic.c
+ 
+-libexslt_la_LIBADD = $(top_builddir)/libxslt/libxslt.la $(EXTRA_LIBS) $(LIBGCRYPT_LIBS)
++libexslt_la_LIBADD = $(top_builddir)/libxslt/libxslt.la $(EXTRA_LIBS) $(LIBGCRYPT_LIBS) $(M_LIBS)
+ libexslt_la_LDFLAGS = $(WIN32_EXTRA_LDFLAGS) -version-info $(LIBEXSLT_VERSION_INFO)
+ 
+ man_MANS = libexslt.3
+diff --git a/libxslt/Makefile.am b/libxslt/Makefile.am
+index d9fed68..9d44c3d 100644
+--- a/libxslt/Makefile.am
++++ b/libxslt/Makefile.am
+@@ -62,7 +62,7 @@ else
+ LIBXSLT_VERSION_SCRIPT =
+ endif
+ 
+-libxslt_la_LIBADD = $(LIBXML_LIBS) $(EXTRA_LIBS)
++libxslt_la_LIBADD = $(LIBXML_LIBS) $(M_LIBS) $(EXTRA_LIBS)
+ libxslt_la_LDFLAGS =					\
+ 		$(WIN32_EXTRA_LDFLAGS)			\
+ 		$(LIBXSLT_VERSION_SCRIPT)		\
+-- 
+2.1.4
+
diff --git a/meta/recipes-support/libxslt/libxslt_1.1.29.bb b/meta/recipes-support/libxslt/libxslt_1.1.29.bb
index be747e6..2946a74 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.29.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.29.bb
@@ -11,6 +11,7 @@ DEPENDS = "libxml2"
 SRC_URI = "ftp://xmlsoft.org/libxslt/libxslt-${PV}.tar.gz \
            file://pkgconfig_fix.patch \
            file://0001-Use-pkg-config-to-find-gcrypt-and-libxml2.patch \
+           file://0001-Link-libraries-with-libm.patch \
            "
 
 SRC_URI[md5sum] = "a129d3c44c022de3b9dcf6d6f288d72e"
-- 
2.1.4


