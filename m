Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 15FFD7213F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 14:55:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t07Et4jJ025750
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Jan 2015 06:55:04 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 7 Jan 2015 06:55:03 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 7 Jan 2015 06:55:03 -0800
Message-ID: <3fa1980018e080c112b0a92e98805a66beaa235c.1420642464.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1420642464.git.liezhi.yang@windriver.com>
References: <cover.1420642464.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] guile: fixed installed-vs-shipped error
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
X-List-Received-Date: Wed, 07 Jan 2015 14:55:07 -0000
Content-Type: text/plain

Fixed:
guile-2.0.11: guile: Files/directories were installed but not shipped
  /usr/lib64/libguile-2.0*-gdb.scm [installed-vs-shipped]

This is because when there is no file in the directory:
for f in libguile-2.0*; do
    [snip]
done

The f would be libguile-2.0* itself, make sure the libs are installed
firstly will fix the problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../guile/files/libguile-Makefile.am-depends.patch |   39 ++++++++++++++++++++
 meta/recipes-devtools/guile/guile_2.0.11.bb        |    1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-devtools/guile/files/libguile-Makefile.am-depends.patch

diff --git a/meta/recipes-devtools/guile/files/libguile-Makefile.am-depends.patch b/meta/recipes-devtools/guile/files/libguile-Makefile.am-depends.patch
new file mode 100644
index 0000000..1045cbe
--- /dev/null
+++ b/meta/recipes-devtools/guile/files/libguile-Makefile.am-depends.patch
@@ -0,0 +1,39 @@
+From 9c4e120a7a87db34d22a50883a5a525170b480d7 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Tue, 6 Jan 2015 23:10:51 -0800
+Subject: [PATCH] libguile/Makefile.am: install-data-hook: depends on
+ install-libLTLIBRARIES
+
+It may install such a file:
+/usr/lib64/libguile-2.0*-gdb.scm
+
+This is because when there is no file in the directory:
+for f in libguile-2.0*; do
+    [snip]
+done
+
+The f would be libguile-2.0* itself.
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ libguile/Makefile.am |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libguile/Makefile.am b/libguile/Makefile.am
+index 281faac..fe0a3ba 100644
+--- a/libguile/Makefile.am
++++ b/libguile/Makefile.am
+@@ -449,7 +449,7 @@ EXTRA_libguile_@GUILE_EFFECTIVE_VERSION@_la_SOURCES = _scm.h		\
+ install-exec-hook:
+ 	rm -f $(DESTDIR)$(bindir)/guile-snarf.awk
+ 
+-install-data-hook: libguile-2.0-gdb.scm
++install-data-hook: libguile-2.0-gdb.scm install-libLTLIBRARIES
+ 	@$(MKDIR_P) $(DESTDIR)$(libdir)
+ ## We want to install libguile-2.0-gdb.scm as SOMETHING-gdb.scm.
+ ## SOMETHING is the full name of the final library.  We want to ignore
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-devtools/guile/guile_2.0.11.bb b/meta/recipes-devtools/guile/guile_2.0.11.bb
index f2c0759..f5388aa 100644
--- a/meta/recipes-devtools/guile/guile_2.0.11.bb
+++ b/meta/recipes-devtools/guile/guile_2.0.11.bb
@@ -21,6 +21,7 @@ SRC_URI = "${GNU_MIRROR}/guile/guile-${PV}.tar.xz \
            file://arm_endianness.patch \
            file://arm_aarch64.patch \
            file://workaround-ice-ssa-corruption.patch \
+           file://libguile-Makefile.am-depends.patch \
            "
 
 #           file://debian/0001-Change-guile-to-guile-X.Y-for-info-pages.patch
-- 
1.7.9.5


