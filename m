Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
	[209.85.128.50])
	by mail.openembedded.org (Postfix) with ESMTP id 276037F918
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2019 11:28:09 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id v17so1920843wml.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2019 04:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=H9aXtB9pr1uccnt54nbrCH09GZkDSP+w3dd8AMBR3Lk=;
	b=os9YHDjDwyXgQgNzqYBm9P75WV3M6xeJYWJNsyOZbDnMibBys/C7Y1vnU+g8DIrllf
	zY7wdoT/TlYxdD3FbTO4EZrKOj36bss6CERVNirBglzqI7GlWj8fMgNWEBFuoDGQCCVC
	WN3fCDoV7fpD+K3x13EnB04yTutSp+5A/n6TZ+2rNr+IYaNPU1txbMMf7C0Py+hv1azB
	kOPVOOJ+DIckcOs+6hXfJv0NGcwGH1P0c5Tf7mk93q39D0TMwB092jKFDkwhUDNSYjLR
	z+9J0fBy84mnMChYJFK+lG6EE0+DAFBKC0u6fXMHE69BhmoQjUf9kT7Zv2x+l2OwMOSr
	g5kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=H9aXtB9pr1uccnt54nbrCH09GZkDSP+w3dd8AMBR3Lk=;
	b=pWAXspaljpWhJkZ3DrwUk8Cpv7vkaEO0M6NxHqUOUvaGZv+xLjeqxo3zVPEuNxrFP4
	gcZQaGnfLJlX/hEVGDEYXTiLQf2kxuoiOarg71/VK/fP1WzqIFZa7ylRPZaGha2lZj/q
	Lt8u67MrcAWNYsRCxmdt9feyIKZ9BbQiSIanaG7KvPoiTFNBS0DuE6fxU6DnFLdk4kty
	bO2ZtRcDaGE1xBiNqSstTnGSsjU/GpEWl0uUiNHRe1vW9H0Zf/7HA1Qh3/Str+YoF+fk
	Ru+T5NI6MO0KXPE8C/JCoM7BHUlzfWgZBccLQC1fHb/bR0CX/XusMSNZaOxua+fh3r/C
	t7IA==
X-Gm-Message-State: APjAAAVwFXHQGTnTL5qzoKsXS/gLE4jUAVBpBYc3R8iKqw0O6VUPzGOR
	Z8LbVNFznNY4y84bnzDzDeKg9G63NC4=
X-Google-Smtp-Source: APXvYqzYuip1/muGkotJXteaeu2OdKAW42Vk+AYmboC2Dmubp+Htl5i2hLHhOid58UtTNXCtcVXepg==
X-Received: by 2002:a1c:9e0b:: with SMTP id h11mr3040323wme.144.1568978889230; 
	Fri, 20 Sep 2019 04:28:09 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	t13sm3347737wra.70.2019.09.20.04.28.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Sep 2019 04:28:08 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Sep 2019 12:28:03 +0100
Message-Id: <20190920112805.32622-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/3] distcc: clean up the UI install logic
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
X-List-Received-Date: Fri, 20 Sep 2019 11:28:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove the local copy of the desktop file, instead apply a patch from upstream
to fix the file. This also fixes the install paths, so update the recipe.

Remove glibc-specific installation as this was due to uclibc failures.

Refresh and submit upstream the out-of-tree build fix.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/distcc/distcc_3.3.3.bb  |  13 +-
 .../distcc/files/distccmon-gnome.desktop      |  12 --
 .../distcc/files/fix-gnome.patch              | 122 ++++++++++++++++++
 .../distcc/files/separatebuilddir.patch       |  42 +++---
 4 files changed, 154 insertions(+), 35 deletions(-)
 delete mode 100644 meta/recipes-devtools/distcc/files/distccmon-gnome.desktop
 create mode 100644 meta/recipes-devtools/distcc/files/fix-gnome.patch

diff --git a/meta/recipes-devtools/distcc/distcc_3.3.3.bb b/meta/recipes-devtools/distcc/distcc_3.3.3.bb
index 7942debec9e..d8ad498f2b4 100644
--- a/meta/recipes-devtools/distcc/distcc_3.3.3.bb
+++ b/meta/recipes-devtools/distcc/distcc_3.3.3.bb
@@ -15,9 +15,9 @@ PACKAGECONFIG[popt] = "--without-included-popt,--with-included-popt,popt"
 RRECOMMENDS_${PN} = "avahi-daemon"
 
 SRC_URI = "git://github.com/distcc/distcc.git \
+           file://fix-gnome.patch \
            file://separatebuilddir.patch \
            file://default \
-           file://distccmon-gnome.desktop \
            file://distcc \
            file://distcc.service"
 SRCREV = "4cde9bcfbda589abd842e3bbc652ce369085eaae"
@@ -51,13 +51,8 @@ do_install() {
     install -d ${D}${systemd_unitdir}/system/
     install -m 0644 ${WORKDIR}/distcc.service ${D}${systemd_unitdir}/system
     sed -i -e 's,@BINDIR@,${bindir},g' ${D}${systemd_unitdir}/system/distcc.service
-    ${DESKTOPINSTALL}
-}
-DESKTOPINSTALL = ""
-DESKTOPINSTALL_libc-glibc () {
-    install -d ${D}${datadir}/distcc/
-    install -m 0644 ${WORKDIR}/distccmon-gnome.desktop ${D}${datadir}/distcc/
 }
+
 PACKAGES += "distcc-distmon-gnome"
 
 FILES_${PN} = " ${sysconfdir} \
@@ -67,8 +62,10 @@ FILES_${PN} = " ${sysconfdir} \
 		${bindir}/distccmon-text \
 		${sbindir}/update-distcc-symlinks \
 		${systemd_unitdir}/system/distcc.service"
+
 FILES_distcc-distmon-gnome = "  ${bindir}/distccmon-gnome \
-				${datadir}/distcc"
+				${datadir}/applications \
+				${datadir}/pixmaps"
 
 
 #
diff --git a/meta/recipes-devtools/distcc/files/distccmon-gnome.desktop b/meta/recipes-devtools/distcc/files/distccmon-gnome.desktop
deleted file mode 100644
index 7b5d85ce4e2..00000000000
--- a/meta/recipes-devtools/distcc/files/distccmon-gnome.desktop
+++ /dev/null
@@ -1,12 +0,0 @@
-[Desktop Entry]
-Version=0.9.4
-Exec=distccmon-gnome
-Name=distcc monitor
-GenericName=Distributed Compile Monitor
-Comment=Graphical view of distributed compile tasks
-Icon=distccmon-gnome-icon
-TryExec=distccmon-gnome
-Terminal=false
-Type=Application
-Categories=GNOME;Development;
-StartupNotify=true
diff --git a/meta/recipes-devtools/distcc/files/fix-gnome.patch b/meta/recipes-devtools/distcc/files/fix-gnome.patch
new file mode 100644
index 00000000000..f1f5ed1a9f2
--- /dev/null
+++ b/meta/recipes-devtools/distcc/files/fix-gnome.patch
@@ -0,0 +1,122 @@
+Upstream-Status: Backport [https://github.com/distcc/distcc/pull/319]
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 2faacc2be8d7eeee0a3f66d88fedd1d3ab11070e Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Micha=C5=82=20G=C3=B3rny?= <mgorny@gentoo.org>
+Date: Sat, 8 Dec 2018 12:50:07 +0100
+Subject: [PATCH] Fix desktop spec compliance of distccmon-gnome install
+
+Update the .desktop file and install rules for distccmon-gnome to
+conform to the freedesktop.org specifications.  More specifically:
+
+- update to version 1.0 of the spec
+- remove obsolete 'Encoding' key
+- remove obsolete 'Application' category and add recommended 'GTK'
+- install icon file to the correct directory
+- strip suffix from desktop file (specifying it is deprecated)
+- while at it, remove redundant '-icon' from the filename
+- install desktop file to the correct directory
+---
+ Makefile.in                                   |  18 ++++++++++--------
+ gnome/distccmon-gnome.desktop                 |   7 +++----
+ ...mon-gnome-icon.png => distccmon-gnome.png} | Bin
+ src/mon-gnome.c                               |   2 +-
+ 4 files changed, 14 insertions(+), 13 deletions(-)
+ rename gnome/{distccmon-gnome-icon.png => distccmon-gnome.png} (100%)
+
+diff --git a/Makefile.in b/Makefile.in
+index 6e1e467..1106559 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -52,13 +52,14 @@ mandir = @mandir@
+ includedir = @includedir@
+ oldincludedir = /usr/include
+ docdir = @docdir@
+-pkgdatadir = $(datadir)/@PACKAGE_NAME@
++icondir = $(datarootdir)/pixmaps
++desktopdir = $(datarootdir)/applications
+ 
+ include_server_builddir = $(builddir)/_include_server
+ 
+ # These must be done from here, not from autoconf, because they can 
+ # contain variable expansions written in Make syntax.  Ew.
+-DIR_DEFS = -DLIBDIR="\"${libdir}\"" -DSYSCONFDIR="\"${sysconfdir}\"" -DPKGDATADIR="\"${pkgdatadir}\""
++DIR_DEFS = -DLIBDIR="\"${libdir}\"" -DSYSCONFDIR="\"${sysconfdir}\"" -DICONDIR="\"${icondir}\""
+ 
+ # arguments to pkgconfig
+ GNOME_PACKAGES = @GNOME_PACKAGES@
+@@ -387,7 +388,7 @@ man_HTML = man/distcc_1.html man/distccd_1.html man/distccmon_text_1.html \
+            man/lsdistcc_1.html man/pump_1.html man/include_server_1.html
+ MEN = $(man1_MEN)
+ 
+-gnome_data = gnome/distccmon-gnome-icon.png	\
++gnome_data = gnome/distccmon-gnome.png	\
+ 	gnome/distccmon-gnome.desktop
+ 
+ popt_OBJS=popt/findme.o  popt/popt.o  popt/poptconfig.o \
+@@ -1033,7 +1034,8 @@ showpaths:
+ 	@echo "  programs             $(DESTDIR)$(bindir)"
+ 	@echo "  sbin programs        $(DESTDIR)$(sbindir)"
+ 	@echo "  system configuration $(DESTDIR)$(sysconfdir)"
+-	@echo "  shared data files    $(DESTDIR)$(pkgdatadir)"
++	@echo "  icon file            $(DESTDIR)$(icondir)"
++	@echo "  application file     $(DESTDIR)$(desktopdir)"
+ 
+ 
+ # install-sh can't handle multiple arguments, but we don't need any
+@@ -1129,10 +1131,10 @@ install-example: $(example_DOCS)
+ 	done
+ 
+ install-gnome-data: $(gnome_data)
+-	$(mkinstalldirs) "$(DESTDIR)$(pkgdatadir)"
+-	for p in $(gnome_data); do \
+-	  $(INSTALL_DATA) "$$p" "$(DESTDIR)$(pkgdatadir)" || exit 1; \
+-	done
++	$(mkinstalldirs) "$(DESTDIR)$(icondir)"
++	$(mkinstalldirs) "$(DESTDIR)$(desktopdir)"
++	$(INSTALL_DATA) gnome/distccmon-gnome.png "$(DESTDIR)$(icondir)"
++	$(INSTALL_DATA) gnome/distccmon-gnome.desktop "$(DESTDIR)$(desktopdir)"
+ 
+ install-conf: $(conf_files) $(default_files)
+ 	$(mkinstalldirs) "$(DESTDIR)$(sysconfdir)/distcc"
+diff --git a/gnome/distccmon-gnome.desktop b/gnome/distccmon-gnome.desktop
+index bd1fa26..7205f5e 100644
+--- a/gnome/distccmon-gnome.desktop
++++ b/gnome/distccmon-gnome.desktop
+@@ -1,6 +1,5 @@
+ [Desktop Entry]
+-Version=0.9.4
+-Encoding=UTF-8
++Version=1.0
+ Exec=distccmon-gnome
+ Name=distcc monitor
+ Name[sv]=distcc övervakare
+@@ -8,9 +7,9 @@ GenericName=Distributed Compile Monitor
+ GenericName[sv]=Distribuerad kompilerings-övervakare
+ Comment=Graphical view of distributed compile tasks
+ Comment[sv]=Grafisk vy av distribuerade kompileringsuppgifter
+-Icon=distccmon-gnome-icon.png
++Icon=distccmon-gnome
+ TryExec=distccmon-gnome
+ Terminal=false
+ Type=Application
+-Categories=GNOME;Application;Development;
++Categories=GNOME;GTK;Development;
+ StartupNotify=true
+diff --git a/gnome/distccmon-gnome-icon.png b/gnome/distccmon-gnome.png
+similarity index 100%
+rename from gnome/distccmon-gnome-icon.png
+rename to gnome/distccmon-gnome.png
+diff --git a/src/mon-gnome.c b/src/mon-gnome.c
+index 24681d0..bfc286d 100644
+--- a/src/mon-gnome.c
++++ b/src/mon-gnome.c
+@@ -599,7 +599,7 @@ static GtkWidget * dcc_gnome_make_mainwin (void)
+ 
+ #if GTK_CHECK_VERSION(2,2,0)
+   gtk_window_set_icon_from_file (GTK_WINDOW (mainwin),
+-                                 PKGDATADIR "/distccmon-gnome-icon.png",
++                                 ICONDIR "/distccmon-gnome.png",
+                                  NULL);
+ #endif
+ 
diff --git a/meta/recipes-devtools/distcc/files/separatebuilddir.patch b/meta/recipes-devtools/distcc/files/separatebuilddir.patch
index 7580b5584bc..c8da9d51c36 100644
--- a/meta/recipes-devtools/distcc/files/separatebuilddir.patch
+++ b/meta/recipes-devtools/distcc/files/separatebuilddir.patch
@@ -1,21 +1,33 @@
-When building with a separate build directory, make install fails,
-unable to find the gnome_data files. This patch corrects the
-patch and ensures the build works in this case.
+Upstream-Status: Backport [https://github.com/distcc/distcc/pull/363]
+Signed-off-by: Ross Burton <ross.burton@intel.com>
 
-RP 2013/3/8
+From 469628ee8dc90c7162d1a850c0b179b7349f9cf3 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Tue, 17 Sep 2019 13:04:22 +0100
+Subject: [PATCH] Makefile.in: fix out-of-tree builds when the GNOME UI is
+ enabled
 
-Upstream-Status: Pending
+The install command doesn't use $(srcdir) so out-of-tree builds fail.
 
-Index: git/Makefile.in
-===================================================================
---- git.orig/Makefile.in
-+++ git/Makefile.in
-@@ -1117,7 +1117,7 @@ install-example: $(example_DOCS)
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+---
+ Makefile.in | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 123054f..b9ce974 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -1130,8 +1130,8 @@ install-example: $(example_DOCS)
  install-gnome-data: $(gnome_data)
- 	$(mkinstalldirs) "$(DESTDIR)$(pkgdatadir)"
- 	for p in $(gnome_data); do \
--	  $(INSTALL_DATA) "$$p" "$(DESTDIR)$(pkgdatadir)" || exit 1; \
-+	  $(INSTALL_DATA) "$(srcdir)/$$p" "$(DESTDIR)$(pkgdatadir)" || exit 1; \
- 	done
+ 	$(mkinstalldirs) "$(DESTDIR)$(icondir)"
+ 	$(mkinstalldirs) "$(DESTDIR)$(desktopdir)"
+-	$(INSTALL_DATA) gnome/distccmon-gnome.png "$(DESTDIR)$(icondir)"
+-	$(INSTALL_DATA) gnome/distccmon-gnome.desktop "$(DESTDIR)$(desktopdir)"
++	$(INSTALL_DATA) $(srcdir)/gnome/distccmon-gnome.png "$(DESTDIR)$(icondir)"
++	$(INSTALL_DATA) $(srcdir)/gnome/distccmon-gnome.desktop "$(DESTDIR)$(desktopdir)"
  
  install-conf: $(conf_files) $(default_files)
+ 	$(mkinstalldirs) "$(DESTDIR)$(sysconfdir)/distcc"
+-- 
+2.20.1
-- 
2.20.1


