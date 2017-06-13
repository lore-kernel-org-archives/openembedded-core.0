Return-Path: <joe.slater@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0D5A1782B6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 19:50:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v5DJoSJu017760
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 12:50:28 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Tue, 13 Jun 2017 12:50:28 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 13 Jun 2017 12:50:26 -0700
Message-ID: <1497383427-31099-2-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1497383427-31099-1-git-send-email-jslater@windriver.com>
References: <1497383427-31099-1-git-send-email-jslater@windriver.com>
MIME-Version: 1.0
Subject: [v3][PATCH 2/3] ghostscript: add X11 PACKAGECONFIG info
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
X-List-Received-Date: Tue, 13 Jun 2017 19:50:28 -0000
Content-Type: text/plain

Add information necessary to build for x11, but
do not enable that option.

Fix parallel build directory creation issue.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 .../ghostscript/avoid-host-contamination.patch     | 19 ++++++++++++
 .../ghostscript/ghostscript/mkdir-p.patch          | 36 ++++++++++++++++++++++
 .../ghostscript/ghostscript_9.21.bb                | 18 ++++++++++-
 3 files changed, 72 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/avoid-host-contamination.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/mkdir-p.patch

diff --git a/meta/recipes-extended/ghostscript/ghostscript/avoid-host-contamination.patch b/meta/recipes-extended/ghostscript/ghostscript/avoid-host-contamination.patch
new file mode 100644
index 0000000..c4794e7
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/avoid-host-contamination.patch
@@ -0,0 +1,19 @@
+Remove hardcode path refer to host to avoid host contamination.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+diff --git a/devices/devs.mak b/devices/devs.mak
+index 3070d2e..df663f0 100644
+--- a/devices/devs.mak
++++ b/devices/devs.mak
+@@ -546,7 +546,7 @@ $(DEVOBJ)gdevxalt.$(OBJ) : $(DEVSRC)gdevxalt.c $(GDEVX) $(math__h) $(memory__h)\
+ ### NON PORTABLE, ONLY UNIX WITH GCC SUPPORT
+ 
+ $(DEVOBJ)X11.so : $(x11alt_) $(x11_) $(DEVS_MAK) $(MAKEDIRS)
+-	$(CCLD) $(LDFLAGS) -shared -o $(DEVOBJ)X11.so $(x11alt_) $(x11_) -L/usr/X11R6/lib -lXt -lSM -lICE -lXext -lX11 $(XLIBDIRS)
++	$(CCLD) $(LDFLAGS) -shared -o $(DEVOBJ)X11.so $(x11alt_) $(x11_) -lXt -lSM -lICE -lXext -lX11 $(XLIBDIRS)
+ 
+ ###### --------------- Memory-buffered printer devices --------------- ######
+ 
diff --git a/meta/recipes-extended/ghostscript/ghostscript/mkdir-p.patch b/meta/recipes-extended/ghostscript/ghostscript/mkdir-p.patch
new file mode 100644
index 0000000..5a7eab1
--- /dev/null
+++ b/meta/recipes-extended/ghostscript/ghostscript/mkdir-p.patch
@@ -0,0 +1,36 @@
+ghostscript: allow directories to be created more than once
+
+When doing parallel builds, we might try to create directories
+more than once.  This should not cause an error.
+
+Upstream-Status: Pending
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+
+--- a/base/unix-end.mak
++++ b/base/unix-end.mak
+@@ -17,15 +17,14 @@
+ UNIX_END_MAK=$(GLSRC)unix-end.mak $(TOP_MAKEFILES)
+ # Define the rule for building standard configurations.
+ directories: $(UNIX_END_MAK)
+-	@if test "$(BINDIR)"    != "" -a ! -d $(BINDIR);        then mkdir $(BINDIR);        fi
+-	@if test "$(GLGENDIR)"  != "" -a ! -d $(GLGENDIR);      then mkdir $(GLGENDIR);      fi
+-	@if test "$(GLOBJDIR)"  != "" -a ! -d $(GLOBJDIR);      then mkdir $(GLOBJDIR);      fi
+-	@if test "$(DEVGENDIR)" != "" -a ! -d $(DEVGENDIR);     then mkdir $(DEVGENDIR);     fi
+-	@if test "$(DEVOBJDIR)" != "" -a ! -d $(DEVOBJDIR);     then mkdir $(DEVOBJDIR);     fi
+-	@if test "$(AUXDIR)"    != "" -a ! -d $(AUXDIR);        then mkdir $(AUXDIR);        fi
+-	@if test "$(PSGENDIR)"  != "" -a ! -d $(PSGENDIR);      then mkdir $(PSGENDIR);      fi
+-	@if test "$(PSGENDIR)"  != "" -a ! -d $(PSGENDIR)/cups; then mkdir $(PSGENDIR)/cups; fi
+-	@if test "$(PSOBJDIR)"  != "" -a ! -d $(PSOBJDIR);      then mkdir $(PSOBJDIR);      fi
++	@if test "$(BINDIR)"    != "" -a ! -d $(BINDIR);        then mkdir -p $(BINDIR);        fi
++	@if test "$(GLGENDIR)"  != "" -a ! -d $(GLGENDIR);      then mkdir -p $(GLGENDIR);      fi
++	@if test "$(GLOBJDIR)"  != "" -a ! -d $(GLOBJDIR);      then mkdir -p $(GLOBJDIR);      fi
++	@if test "$(DEVGENDIR)" != "" -a ! -d $(DEVGENDIR);     then mkdir -p $(DEVGENDIR);     fi
++	@if test "$(DEVOBJDIR)" != "" -a ! -d $(DEVOBJDIR);     then mkdir -p $(DEVOBJDIR);     fi
++	@if test "$(AUXDIR)"    != "" -a ! -d $(AUXDIR);        then mkdir -p $(AUXDIR);        fi
++	@if test "$(PSGENDIR)"  != "" -a ! -d $(PSGENDIR)/cups; then mkdir -p $(PSGENDIR)/cups; fi
++	@if test "$(PSOBJDIR)"  != "" -a ! -d $(PSOBJDIR);      then mkdir -p $(PSOBJDIR);      fi
+ 
+ 
+ gs: .gssubtarget $(UNIX_END_MAK)
diff --git a/meta/recipes-extended/ghostscript/ghostscript_9.21.bb b/meta/recipes-extended/ghostscript/ghostscript_9.21.bb
index 9a2e107..74e7a3f 100644
--- a/meta/recipes-extended/ghostscript/ghostscript_9.21.bb
+++ b/meta/recipes-extended/ghostscript/ghostscript_9.21.bb
@@ -24,6 +24,8 @@ SRC_URI_BASE = "https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/d
                 file://ghostscript-9.16-Werror-return-type.patch \
                 file://png_mak.patch \
                 file://do-not-check-local-libpng-source.patch \
+                file://avoid-host-contamination.patch \
+                file://mkdir-p.patch \
 "
 
 SRC_URI = "${SRC_URI_BASE} \
@@ -48,7 +50,21 @@ SRC_URI_class-native = "${SRC_URI_BASE} \
 SRC_URI[md5sum] = "5f213281761d2750fcf27476c404d17f"
 SRC_URI[sha256sum] = "02bceadbc4dddeb6f2eec9c8b1623d945d355ca11b8b4df035332b217d58ce85"
 
-EXTRA_OECONF = "--without-x --with-system-libtiff --without-jbig2dec \
+# Put something like
+#
+#   PACKAGECONFIG_append_pn-ghostscript = " x11"
+#
+# in local.conf to enable building with X11.  Be careful.  The order
+# of the overrides matters!
+#
+#PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+PACKAGECONFIG_class-native = ""
+
+PACKAGECONFIG[x11] = "--with-x --x-includes=${STAGING_INCDIR} --x-libraries=${STAGING_LIBDIR}, \
+                      --without-x, virtual/libx11 libxext libxt gtk+3\
+                      "
+
+EXTRA_OECONF = "--with-system-libtiff --without-jbig2dec \
                 --with-fontpath=${datadir}/fonts \
                 --without-libidn --with-cups-serverbin=${exec_prefix}/lib/cups \
                 --with-cups-datadir=${datadir}/cups \
-- 
2.7.4


