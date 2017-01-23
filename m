Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 51AC16FFD3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 09:58:29 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 23 Jan 2017 01:58:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,274,1477983600"; d="scan'208";a="1086210871"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 23 Jan 2017 01:58:29 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	by linux.intel.com (Postfix) with ESMTP id F07E66A4080
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 01:57:32 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2017 11:58:57 +0200
Message-Id: <1485165540-16646-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 1/4] screen: Upgrade 4.4.0 -> 4.5.0
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
X-List-Received-Date: Mon, 23 Jan 2017 09:58:30 -0000

Removed the following Backported patches:
 1. 0001-fix-for-multijob-build.patch
 2. 0002-comm.h-now-depends-on-term.h.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../screen/0001-fix-for-multijob-build.patch       | 58 ----------------------
 .../screen/0002-comm.h-now-depends-on-term.h.patch | 33 ------------
 .../screen/{screen_4.4.0.bb => screen_4.5.0.bb}    |  6 +--
 3 files changed, 2 insertions(+), 95 deletions(-)
 delete mode 100644 meta/recipes-extended/screen/screen/0001-fix-for-multijob-build.patch
 delete mode 100644 meta/recipes-extended/screen/screen/0002-comm.h-now-depends-on-term.h.patch
 rename meta/recipes-extended/screen/{screen_4.4.0.bb => screen_4.5.0.bb} (88%)

diff --git a/meta/recipes-extended/screen/screen/0001-fix-for-multijob-build.patch b/meta/recipes-extended/screen/screen/0001-fix-for-multijob-build.patch
deleted file mode 100644
index fbdb0eb..0000000
--- a/meta/recipes-extended/screen/screen/0001-fix-for-multijob-build.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 79ad2885e26631077dd6b8aebe17ae95b38133a6 Mon Sep 17 00:00:00 2001
-From: Jackie Huang <jackie.huang@windriver.com>
-Date: Tue, 26 Jul 2016 14:23:59 +0800
-Subject: [PATCH] fix for multijob build
-
-make sure that comm.sh script generates comm.h header before doing
-anything else
-
-Signed-off-by: Amadeusz Sawiski <amade@asmblr.net>
-
-Upstream-Status: Backport
-
-Backport patch to fix parallel build failure and update context to make patch
-coulde be applied.
-
-http://git.savannah.gnu.org/cgit/screen.git/commit?id=c0de6dd
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
----
- Makefile.in | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index aca7da3..3607711 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -298,7 +298,7 @@ search.o: layout.h viewport.h canvas.h search.c config.h screen.h os.h osdef.h a
-  comm.h layer.h term.h image.h display.h window.h mark.h extern.h
- tty.o: layout.h viewport.h canvas.h tty.c config.h screen.h os.h osdef.h ansi.h acls.h comm.h \
-  layer.h term.h image.h display.h window.h extern.h
--term.o: layout.h viewport.h canvas.h term.c term.h
-+term.o: layout.h viewport.h canvas.h term.c term.h comm.h
- window.o: layout.h viewport.h canvas.h window.c config.h screen.h os.h osdef.h ansi.h acls.h \
-  comm.h layer.h term.h image.h display.h window.h extern.h logfile.h
- utmp.o: layout.h viewport.h canvas.h utmp.c config.h screen.h os.h osdef.h ansi.h acls.h \
-@@ -324,7 +324,7 @@ canvas.o: layout.h viewport.h canvas.h canvas.c config.h screen.h os.h osdef.h a
-  comm.h layer.h term.h image.h display.h window.h extern.h \
-  braille.h
- comm.o: layout.h viewport.h canvas.h comm.c config.h acls.h comm.h
--kmapdef.o: layout.h viewport.h canvas.h kmapdef.c config.h
-+kmapdef.o: layout.h viewport.h canvas.h kmapdef.c config.h comm.h
- acls.o: layout.h viewport.h canvas.h acls.c config.h screen.h os.h osdef.h ansi.h acls.h comm.h \
-  layer.h term.h image.h display.h window.h extern.h
- braille.o: layout.h viewport.h canvas.h braille.c config.h screen.h os.h osdef.h ansi.h acls.h \
-@@ -350,7 +350,7 @@ layout.o: layout.h viewport.h canvas.h layout.c config.h screen.h os.h osdef.h a
- viewport.o: layout.h viewport.h canvas.h viewport.c config.h screen.h os.h osdef.h ansi.h acls.h \
-  comm.h layer.h term.h image.h display.h window.h extern.h \
-  braille.h
--list_generic.o: list_generic.h list_generic.c layer.h screen.h osdef.h
--list_display.o: list_generic.h list_display.c layer.h screen.h osdef.h
-+list_generic.o: list_generic.h list_generic.c layer.h screen.h osdef.h comm.h
-+list_display.o: list_generic.h list_display.c layer.h screen.h osdef.h comm.h
- list_window.o: list_generic.h list_window.c window.h layer.h screen.h osdef.h comm.h
- 
--- 
-1.9.1
-
diff --git a/meta/recipes-extended/screen/screen/0002-comm.h-now-depends-on-term.h.patch b/meta/recipes-extended/screen/screen/0002-comm.h-now-depends-on-term.h.patch
deleted file mode 100644
index b5d71cc..0000000
--- a/meta/recipes-extended/screen/screen/0002-comm.h-now-depends-on-term.h.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-Upstream-Status: Backport
-
-Backport from:
-
-http://git.savannah.gnu.org/cgit/screen.git/commit/?id=39c5f1c
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
-From 39c5f1c76f1fcef4b5958bf828a63f53426b6984 Mon Sep 17 00:00:00 2001
-From: Mike Gerwitz <mike@mikegerwitz.com>
-Date: Tue, 24 Dec 2013 22:16:31 -0500
-Subject: [PATCH] comm.h now depends on term.h
-
----
- src/Makefile.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/Makefile.in b/src/Makefile.in
-index e791e79..d4f7c0b 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -113,7 +113,7 @@ term.h: term.c term.sh
- 
- kmapdef.c: term.h
- 
--comm.h: comm.c comm.sh config.h
-+comm.h: comm.c comm.sh config.h term.h
- 	AWK=$(AWK) CC="$(CC) $(CFLAGS)" srcdir=${srcdir} sh $(srcdir)/comm.sh
- 
- docs:
--- 
-2.4.1
-
diff --git a/meta/recipes-extended/screen/screen_4.4.0.bb b/meta/recipes-extended/screen/screen_4.5.0.bb
similarity index 88%
rename from meta/recipes-extended/screen/screen_4.4.0.bb
rename to meta/recipes-extended/screen/screen_4.5.0.bb
index 769bac1..4e4a95f 100644
--- a/meta/recipes-extended/screen/screen_4.4.0.bb
+++ b/meta/recipes-extended/screen/screen_4.5.0.bb
@@ -22,12 +22,10 @@ SRC_URI = "${GNU_MIRROR}/screen/screen-${PV}.tar.gz \
            file://Provide-cross-compile-alternatives-for-AC_TRY_RUN.patch \
            file://Skip-host-file-system-checks-when-cross-compiling.patch \
            file://Avoid-mis-identifying-systems-as-SVR4.patch \
-           file://0002-comm.h-now-depends-on-term.h.patch \
-           file://0001-fix-for-multijob-build.patch \
           "
 
-SRC_URI[md5sum] = "d26e11a3648c2b11aaefa215a55dfd39"
-SRC_URI[sha256sum] = "ef722a54759a3bf23aad272bbf33c414c1078cad6bcd982fada93c0d7917218b"
+SRC_URI[md5sum] = "a32105a91359afab1a4349209a028e31"
+SRC_URI[sha256sum] = "01c3a7c362185f35d6a95dff52d64337076496acd034d717de3c263500cfefb0"
 
 inherit autotools texinfo
 
-- 
2.4.0


