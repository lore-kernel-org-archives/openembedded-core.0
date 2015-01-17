Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E592172C2B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Jan 2015 00:31:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0H0VJil008788
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jan 2015 16:31:20 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 16 Jan 2015 16:31:19 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Jan 2015 16:31:16 -0800
Message-ID: <88f88dcb486fa30a6d14bc397906434d64ab4651.1421454635.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1421454635.git.liezhi.yang@windriver.com>
References: <cover.1421454635.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] guile: fix installed-vs-shipped error
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
X-List-Received-Date: Sat, 17 Jan 2015 00:31:26 -0000
Content-Type: text/plain

Fixed:
guile-2.0.11: guile: Files/directories were installed but not shipped
  /usr/lib64/libguile-2.0*-gdb.scm [installed-vs-shipped]

This is because when there is no file in the directory:
for f in libguile-2.0*; do
    [snip]
done

The f would be libguile-2.0* itself, use install-exec-hook will fix the
problem since it depends on install-libLTLIBRARIES.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../guile/files/libguile-Makefile.am-hook.patch    |   42 ++++++++++++++++++++
 meta/recipes-devtools/guile/guile_2.0.11.bb        |    1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-devtools/guile/files/libguile-Makefile.am-hook.patch

diff --git a/meta/recipes-devtools/guile/files/libguile-Makefile.am-hook.patch b/meta/recipes-devtools/guile/files/libguile-Makefile.am-hook.patch
new file mode 100644
index 0000000..290b9d4
--- /dev/null
+++ b/meta/recipes-devtools/guile/files/libguile-Makefile.am-hook.patch
@@ -0,0 +1,42 @@
+From 9c4e120a7a87db34d22a50883a5a525170b480d7 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Tue, 6 Jan 2015 23:10:51 -0800
+Subject: [PATCH] libguile/Makefile.am: install-data-hook -> install-exec-hook
+
+It may install such a file:
+/usr/lib64/libguile-2.0*-gdb.scm
+
+This is because when there is no file in the directory:
+for f in libguile-2.0*; do
+    [snip]
+done
+
+The f would be libguile-2.0* itself, use install-exec-hook will fix the
+problem since it depends on install-libLTLIBRARIES.
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ libguile/Makefile.am |    4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/libguile/Makefile.am b/libguile/Makefile.am
+index 5decd99..52645b7 100644
+--- a/libguile/Makefile.am
++++ b/libguile/Makefile.am
+@@ -446,10 +446,8 @@ EXTRA_libguile_@GUILE_EFFECTIVE_VERSION@_la_SOURCES = _scm.h		\
+ ## delete guile-snarf.awk from the installation bindir, in case it's
+ ## lingering there due to an earlier guile version not having been
+ ## wiped out.
+-install-exec-hook:
++install-exec-hook: libguile-2.0-gdb.scm
+ 	rm -f $(DESTDIR)$(bindir)/guile-snarf.awk
+-
+-install-data-hook: libguile-2.0-gdb.scm
+ 	@$(MKDIR_P) $(DESTDIR)$(libdir)
+ ## We want to install libguile-2.0-gdb.scm as SOMETHING-gdb.scm.
+ ## SOMETHING is the full name of the final library.  We want to ignore
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-devtools/guile/guile_2.0.11.bb b/meta/recipes-devtools/guile/guile_2.0.11.bb
index f2c0759..d1578e0 100644
--- a/meta/recipes-devtools/guile/guile_2.0.11.bb
+++ b/meta/recipes-devtools/guile/guile_2.0.11.bb
@@ -21,6 +21,7 @@ SRC_URI = "${GNU_MIRROR}/guile/guile-${PV}.tar.xz \
            file://arm_endianness.patch \
            file://arm_aarch64.patch \
            file://workaround-ice-ssa-corruption.patch \
+           file://libguile-Makefile.am-hook.patch \
            "
 
 #           file://debian/0001-Change-guile-to-guile-X.Y-for-info-pages.patch
-- 
1.7.9.5


