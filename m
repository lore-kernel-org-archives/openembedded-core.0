Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B66B66AD40
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 03:30:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5K3UJYX000357
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 19 Jun 2013 20:30:19 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Wed, 19 Jun 2013 20:30:19 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <ross.burton@intel.com>
Date: Thu, 20 Jun 2013 11:29:43 +0800
Message-ID: <91180868c552c9b0779145759d26bca81a2ad348.1371698863.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1371698863.git.kai.kang@windriver.com>
References: <cover.1371698863.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] python-pygtk: fix parallel compile issue
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
X-List-Received-Date: Thu, 20 Jun 2013 03:30:18 -0000
Content-Type: text/plain

defs.c dependes on gdk-types.defs and gtk-types.defs. When parallel
compile, it may fails with:
"IOError: [Errno 2] No such file or directory: 'gtk-types.defs'"

Add them to dependences of defs.c to fix this issue.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../update-dependences-of-defs.c.patch             |   38 ++++++++++++++++++++
 .../recipes-devtools/python/python-pygtk_2.24.0.bb |    3 +-
 2 files changed, 40 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python-pygtk/update-dependences-of-defs.c.patch

diff --git a/meta/recipes-devtools/python/python-pygtk/update-dependences-of-defs.c.patch b/meta/recipes-devtools/python/python-pygtk/update-dependences-of-defs.c.patch
new file mode 100644
index 0000000..3ed954e
--- /dev/null
+++ b/meta/recipes-devtools/python/python-pygtk/update-dependences-of-defs.c.patch
@@ -0,0 +1,38 @@
+From dc024e9079bbffbb44436ba3e70a758ebad5520f Mon Sep 17 00:00:00 2001
+From: "Song.Li" <Song.Li@windriver.com>
+Date: Sat, 5 Jan 2013 14:55:59 +0800
+Subject: [PATCH] update dependences of defs.c in Makefile.am
+
+In gtk/Makefile.am, defs.c should dependes on gdk-types.defs and
+gtk-types.defs, otherwise it fails occasionally when parallel compile.
+The error message:
+"IOError: [Errno 2] No such file or directory: 'gtk-types.defs'"
+
+Add them to dependences of defs.c to fix this issue.
+
+Upstream-Status: Submitted
+https://bugzilla.gnome.org/show_bug.cgi?id=702706
+
+Signed-off-by: Song.Li <Song.Li@windriver.com>
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+---
+ gtk/Makefile.am |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gtk/Makefile.am b/gtk/Makefile.am
+index 7bb5d0c..91826cb 100644
+--- a/gtk/Makefile.am
++++ b/gtk/Makefile.am
+@@ -289,7 +289,7 @@ if HAVE_GIO_TYPES_DEFS
+ extra_codegen_args += --register $(PYGOBJECT_DEFSDIR)/gio-types.defs
+ endif
+ 
+-.defs.c: 
++.defs.c: gdk-types.defs gtk-types.defs
+ 	($(PYTHON) $(CODEGENDIR)/codegen.py \
+ 	   $(PYGTK_CODEGEN_DEFINES) \
+ 	    -I $(srcdir) \
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-devtools/python/python-pygtk_2.24.0.bb b/meta/recipes-devtools/python/python-pygtk_2.24.0.bb
index 0342f82..475ea17 100644
--- a/meta/recipes-devtools/python/python-pygtk_2.24.0.bb
+++ b/meta/recipes-devtools/python/python-pygtk_2.24.0.bb
@@ -15,7 +15,8 @@ SRC_URI = "ftp://ftp.gnome.org/pub/gnome/sources/pygtk/2.24/${SRCNAME}-${PV}.tar
            file://fix-gtkunixprint.patch \
            file://prevent_to_get_display_during_import.patch \
            file://nodocs.patch \
-           file://acinclude.m4"
+           file://acinclude.m4 \
+           file://update-dependences-of-defs.c.patch"
 
 SRC_URI[md5sum] = "a1051d5794fd7696d3c1af6422d17a49"
 SRC_URI[sha256sum] = "cd1c1ea265bd63ff669e92a2d3c2a88eb26bcd9e5363e0f82c896e649f206912"
-- 
1.7.5.4


