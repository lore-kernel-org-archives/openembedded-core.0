Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1ADD26A660
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Jun 2013 14:17:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5GEHKGD018770
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Jun 2013 07:17:20 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Sun, 16 Jun 2013 07:17:20 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 16 Jun 2013 22:16:26 +0800
Message-ID: <959281c96e2293454a6084d17a6f35f2a86129ac.1371392062.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1371392062.git.kai.kang@windriver.com>
References: <cover.1371392062.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Subject: [PATCH 2/2] Add needed libx11 library for sato applications
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
X-List-Received-Date: Sun, 16 Jun 2013 14:17:19 -0000
Content-Type: text/plain

From binutils-2.22, --copy-dt-needed-entries option is no longer enabled
by default. Instead, --no-copy-dt-needed-entries is now the default option.

When use other toolchain than default toolchain, some sato applications
may compiled failed that they need libx11 but don't link to it directly.
So we should add needed libraries to avoid build these sato applications
fail.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../files/link-with-new-binutils.patch             |   41 +++++++++++++
 .../matchbox-panel-2/matchbox-panel-2_git.bb       |    3 +-
 .../sato-screenshot/files/add-needed-libx11.patch  |   63 ++++++++++++++++++++
 .../sato-screenshot/sato-screenshot_git.bb         |    3 +-
 4 files changed, 108 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-sato/matchbox-panel-2/files/link-with-new-binutils.patch
 create mode 100644 meta/recipes-sato/sato-screenshot/files/add-needed-libx11.patch

diff --git a/meta/recipes-sato/matchbox-panel-2/files/link-with-new-binutils.patch b/meta/recipes-sato/matchbox-panel-2/files/link-with-new-binutils.patch
new file mode 100644
index 0000000..b81d07c
--- /dev/null
+++ b/meta/recipes-sato/matchbox-panel-2/files/link-with-new-binutils.patch
@@ -0,0 +1,41 @@
+Subject: [PATCH] matchbox-panel-2: FTBFS with new binutils
+
+This bug is same as:
+http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=555589
+Port debian/patches/linking-fix to fix matchbox-panel-2.
+
+Upstream-Status: pending
+
+Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>
+
+From binutils-2.22, --copy-dt-needed-entries option is no longer enabled by
+default. Instead, --no-copy-dt-needed-entries is now the default option.
+
+For default toolchain, it includes tcmode-default.inc which requires as-needed.inc.
+In as-needed.inc, ld option '--as-needed' is added to TARGET_LDFLAGS. That's why sato-screenshot
+can be built successfully with default toolchain but failed with other toolchain.
+
+So we should add needed libraries to avoid build failed.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+---
+ matchbox-panel/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/matchbox-panel/Makefile.am b/matchbox-panel/Makefile.am
+index 81e62c5..8046cd7 100644
+--- a/matchbox-panel/Makefile.am
++++ b/matchbox-panel/Makefile.am
+@@ -12,7 +12,7 @@ bin_PROGRAMS = matchbox-panel
+ 
+ matchbox_panel_SOURCES = mb-panel.c mb-panel-scaling-image.c
+ 
+-matchbox_panel_LDADD = $(MATCHBOX_PANEL_LIBS)
++matchbox_panel_LDADD = $(MATCHBOX_PANEL_LIBS) -lX11
+ # This is required as gmodule-export in Poky doesn't have it
+ matchbox_panel_LDFLAGS = -Wl,--export-dynamic
+ 
+-- 
+1.7.11
+
diff --git a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
index 1160b87..37c1e7b 100644
--- a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
+++ b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
@@ -19,7 +19,8 @@ RPROVIDES_${PN} = "matchbox-panel"
 RREPLACES_${PN} = "matchbox-panel"
 RCONFLICTS_${PN} = "matchbox-panel"
 
-SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git"
+SRC_URI = "git://git.yoctoproject.org/${BPN};protocol=git \
+           file://link-with-new-binutils.patch"
 
 EXTRA_OECONF = "--enable-startup-notification --enable-dbus"
 EXTRA_OECONF += " ${@base_contains("MACHINE_FEATURES", "acpi", "--with-battery=acpi", "",d)}"
diff --git a/meta/recipes-sato/sato-screenshot/files/add-needed-libx11.patch b/meta/recipes-sato/sato-screenshot/files/add-needed-libx11.patch
new file mode 100644
index 0000000..a679949
--- /dev/null
+++ b/meta/recipes-sato/sato-screenshot/files/add-needed-libx11.patch
@@ -0,0 +1,63 @@
+Subject: [PATCH] sato-screenshot: add needed libx11
+
+Upstream-Status: pending
+
+From binutils-2.22, --copy-dt-needed-entries option is no longer enabled by
+default. Instead, --no-copy-dt-needed-entries is now the default option.
+
+So we should add needed libraries to avoid build these failures.
+
+xxx/bin/ld: note: 'XQueryTree' is defined in DSO
+  proj/bitbake_build/tmp/sysroots/qemumips/hard-float/usr/lib/libX11.so.6 so
+  try adding it to the linker command line
+proj/bitbake_build/tmp/sysroots/qemumips/hard-float/usr/lib/libX11.so.6:
+  could not read symbols: Invalid operation
+collect2: ld returned 1 exit status
+
+Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>
+
+For default toolchain, it includes tcmode-default.inc which requires as-needed.inc.
+In as-needed.inc, ld option '--as-needed' is added to TARGET_LDFLAGS. That's why sato-screenshot
+can be built successfully with default toolchain but failed with other toolchain.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+---
+ Makefile.am  | 4 ++--
+ configure.ac | 1 +
+ 2 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 3623b6e..f1e3ae9 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -13,7 +13,7 @@ appletdir = $(libdir)/matchbox-panel
+ applet_LTLIBRARIES = libscreenshot.la
+ libscreenshot_la_SOURCES = applet.c
+ libscreenshot_la_LDFLAGS = -avoid-version
+-libscreenshot_la_LIBADD = $(GTK_LIBS) $(MBAPP_LIBS) libshot.la
++libscreenshot_la_LIBADD = $(GTK_LIBS) $(MBAPP_LIBS) libshot.la $(X11_LIBS)
+ 
+ # The icon for the panel applet.
+ icondir = $(datadir)/pixmaps
+@@ -23,4 +23,4 @@ endif
+ # A standalone tool for running from a terminal and scripts
+ bin_PROGRAMS = screenshot
+ screenshot_SOURCES = main.c
+-screenshot_LDADD = libshot.la $(GTK_LIBS)
++screenshot_LDADD = libshot.la $(GTK_LIBS) $(X11_LIBS)
+diff --git a/configure.ac b/configure.ac
+index 9e084c1..868ca07 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -10,6 +10,7 @@ AC_PROG_CC
+ AC_STDC_HEADERS
+ AC_PROG_LIBTOOL
+ 
++PKG_CHECK_MODULES(X11, x11)
+ PKG_CHECK_MODULES(GTK, gtk+-2.0)
+ 
+ MB_APPLET="yes"
+-- 
+1.7.11
+
diff --git a/meta/recipes-sato/sato-screenshot/sato-screenshot_git.bb b/meta/recipes-sato/sato-screenshot/sato-screenshot_git.bb
index ff92142..6c5861f 100644
--- a/meta/recipes-sato/sato-screenshot/sato-screenshot_git.bb
+++ b/meta/recipes-sato/sato-screenshot/sato-screenshot_git.bb
@@ -13,7 +13,8 @@ PV = "0.1+git${SRCPV}"
 PR = "r2"
 
 SRC_URI = "git://git.yoctoproject.org/screenshot;protocol=git \
-           file://fix_ldadd_order.patch"
+           file://fix_ldadd_order.patch \
+           file://add-needed-libx11.patch"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.5.4


