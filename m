Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DB9A46D76F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 07:22:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAL7Mn17013882
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 23:22:49 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Wed, 20 Nov 2013 23:22:49 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Nov 2013 01:22:46 -0600
Message-ID: <1385018566-23581-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH] matchbox-keyboard: check and link against libXrender
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
X-List-Received-Date: Thu, 21 Nov 2013 07:22:50 -0000
Content-Type: text/plain

From: Lei Liu <lei.liu2@windriver.com>

Implict dependency library libXrender is missing from linker
options, which causes build error.  Fix it by checking and
linking the library explictly.

Signed-off-by: Lei Liu <lei.liu2@windriver.com>
Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
Signed-off-by: Jeff Polk <jeff.polk@windriver.com>
---
 .../files/add-lXrender-to-link.patch               | 55 ++++++++++++++++++++++
 .../matchbox-keyboard/matchbox-keyboard_git.bb     |  4 +-
 2 files changed, 58 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-sato/matchbox-keyboard/files/add-lXrender-to-link.patch

diff --git a/meta/recipes-sato/matchbox-keyboard/files/add-lXrender-to-link.patch b/meta/recipes-sato/matchbox-keyboard/files/add-lXrender-to-link.patch
new file mode 100644
index 0000000..5f99d05
--- /dev/null
+++ b/meta/recipes-sato/matchbox-keyboard/files/add-lXrender-to-link.patch
@@ -0,0 +1,55 @@
+Add explict link against -lXrender to fix build error.
+
+Upstream-Status: Pending
+
+Signed-off-by: Lei Liu <lei.liu2@windriver.com>
+---
+ configure.ac    |    6 ++++++
+ src/Makefile.am |    4 ++--
+ 2 files changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 9bbbd76..75bffee 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -65,6 +65,9 @@ AC_ARG_WITH(expat-lib,
+ PKG_CHECK_MODULES(FAKEKEY, libfakekey,,
+ 	         AC_MSG_ERROR([*** You need to install libfakekey from MB SVN  ***]))
+ 
++PKG_CHECK_MODULES(XRENDER, xrender,,
++	         AC_MSG_ERROR([*** Required Xrender Library not found ***]))
++
+ if test x$enable_cairo = xyes; then
+    PKG_CHECK_MODULES(CAIRO, cairo,, [enable_cairo="no"])
+ fi
+@@ -202,6 +205,9 @@ AC_SUBST(EXPAT_CFLAGS)
+ AC_SUBST(PNG_LIBS)
+ AC_SUBST(PNG_CFLAGS)
+ 
++AC_SUBST(XRENDER_LIBS)
++AC_SUBST(XRENDER_CFLAGS)
++
+ AC_OUTPUT([
+ Makefile
+ src/Makefile  
+diff --git a/src/Makefile.am b/src/Makefile.am
+index 6dc986e..6df9480 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -12,11 +12,11 @@ XFT_BACKEND_C =                                                       \
+         matchbox-keyboard-ui-xft-backend.h
+ endif
+ 
+-INCLUDES = -DDATADIR=\"$(DATADIR)\" -DPKGDATADIR=\"$(PKGDATADIR)\" -DPREFIX=\"$(PREFIXDIR)\" $(FAKEKEY_CFLAGS) $(XFT_CFLAGS) $(EXPAT_CFLAGS) $(CAIRO_CFLAGS) $(PNG_CFLAGS)
++INCLUDES = -DDATADIR=\"$(DATADIR)\" -DPKGDATADIR=\"$(PKGDATADIR)\" -DPREFIX=\"$(PREFIXDIR)\" $(FAKEKEY_CFLAGS) $(XFT_CFLAGS) $(EXPAT_CFLAGS) $(CAIRO_CFLAGS) $(PNG_CFLAGS) $(XRENDER_CFLAGS)
+ 
+ bin_PROGRAMS = matchbox-keyboard
+ 
+-matchbox_keyboard_LDADD = $(FAKEKEY_LIBS) $(XFT_LIBS) $(EXPAT_LIBS) $(CAIRO_LIBS) $(PNG_LIBS)
++matchbox_keyboard_LDADD = $(FAKEKEY_LIBS) $(XFT_LIBS) $(EXPAT_LIBS) $(CAIRO_LIBS) $(PNG_LIBS) $(XRENDER_LIBS)
+ 
+ matchbox_keyboard_SOURCES =                                          \
+ 	matchbox-keyboard.c matchbox-keyboard.h                      \
+-- 
+1.7.0.4
+
diff --git a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
index ffcabca..85e856f 100644
--- a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
+++ b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
@@ -18,7 +18,9 @@ SRC_URI = "git://git.yoctoproject.org/${BPN} \
            file://configure_fix.patch;maxrev=1819 \
            file://single-instance.patch \
            file://80matchboxkeyboard.shbg \
-           file://png-fix.patch"
+           file://png-fix.patch \
+           file://add-lXrender-to-link.patch \
+           "
 
 S = "${WORKDIR}/git"
 
-- 
1.8.1.2.545.g2f19ada


