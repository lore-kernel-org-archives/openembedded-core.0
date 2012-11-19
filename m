Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1TaOXU-0003RC-5S
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Nov 2012 11:25:18 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qAJABCsP011888
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2012 02:11:12 -0800 (PST)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Mon, 19 Nov 2012 02:11:11 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 19 Nov 2012 18:11:08 +0800
Message-ID: <cb57fc8cfa89e9e96d33006decadd5b0e5095b03.1353319512.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4
In-Reply-To: <cover.1353319512.git.jackie.huang@windriver.com>
References: <cover.1353319512.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Cc: Jackie.Huang@windriver.com, Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/1] python-pygtk: add gtk-types.defs into gdk.c dependence
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Nov 2012 10:25:19 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

gdk.c depends on gtk-types.defs but
gdk/Makefile.am miss this. This will cause
build error sometimes when built
with multi-jobbing, so add gtk-types.defs into
gdk.c dependence.

[YOCTO #3460]

Signed-off-by: Song.Li <Song.Li@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../add-gtk-types.defs-into-gdk.c-dependence.patch |   32 ++++++++++++++++++++
 .../recipes-devtools/python/python-pygtk_2.24.0.bb |    1 +
 2 files changed, 33 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python-pygtk/add-gtk-types.defs-into-gdk.c-dependence.patch

diff --git a/meta/recipes-devtools/python/python-pygtk/add-gtk-types.defs-into-gdk.c-dependence.patch b/meta/recipes-devtools/python/python-pygtk/add-gtk-types.defs-into-gdk.c-dependence.patch
new file mode 100644
index 0000000..df0f9cd
--- /dev/null
+++ b/meta/recipes-devtools/python/python-pygtk/add-gtk-types.defs-into-gdk.c-dependence.patch
@@ -0,0 +1,32 @@
+Upstream-Status: Submitted
+
+add gtk-types.defs into gdk.c dependence
+
+gdk.c depends on gtk-types.defs but
+gdk/Makefile.am miss this. This will cause
+build error sometimes when built
+with multi-jobbing, so add gtk-types.defs into
+gdk.c dependence.
+
+Signed-off-by: Song.Li <Song.Li@windriver.com>
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ gtk/Makefile.am |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/gtk/Makefile.am b/gtk/Makefile.am
+index 7bb5d0c..4a88351 100644
+--- a/gtk/Makefile.am
++++ b/gtk/Makefile.am
+@@ -214,7 +214,7 @@ gtkunixprint.defs: $(GTKUNIXPRINT_DEFS) Makefile
+ gtkunixprint-types.defs: $(GTKUNIXPRINT_TYPES_DEFS) Makefile
+ 	$(CREATEDEFS) $@ $(GTKUNIXPRINT_TYPES_DEFS)
+ 
+-gdk.c: gdk-types.defs gdk.defs $(GDK_OVERRIDES)
++gdk.c: gdk-types.defs gtk-types.defs gdk.defs $(GDK_OVERRIDES)
+ gtk.c: gdk-types.defs gtk-types.defs gtk.defs gdk-types.defs $(GTK_OVERRIDES)
+ _gtk_la_CFLAGS = $(PYCAIRO_CFLAGS) $(GTK_CFLAGS)
+ _gtk_la_LDFLAGS = $(common_ldflags) -export-symbols-regex init_gtk
+-- 
+1.7.4
+
diff --git a/meta/recipes-devtools/python/python-pygtk_2.24.0.bb b/meta/recipes-devtools/python/python-pygtk_2.24.0.bb
index 4747d98..624d924 100644
--- a/meta/recipes-devtools/python/python-pygtk_2.24.0.bb
+++ b/meta/recipes-devtools/python/python-pygtk_2.24.0.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
 PR = "r1"
 
 SRC_URI = "ftp://ftp.gnome.org/pub/gnome/sources/pygtk/2.24/${SRCNAME}-${PV}.tar.bz2 \
+           file://add-gtk-types.defs-into-gdk.c-dependence.patch \
            file://fix-gtkunixprint.patch \
            file://prevent_to_get_display_during_import.patch \
            file://nodocs.patch \
-- 
1.7.4



