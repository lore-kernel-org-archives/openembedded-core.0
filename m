Return-Path: <maxin.john@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 7DDD3785DA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 12:00:15 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga104.jf.intel.com with ESMTP; 10 Nov 2017 04:00:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,374,1505804400"; 
   d="scan'208";a="6157599"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 10 Nov 2017 04:00:17 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id D15195801AD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 04:00:16 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Nov 2017 14:00:25 +0200
Message-Id: <1510315228-24186-5-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1510315228-24186-1-git-send-email-maxin.john@intel.com>
References: <1510315228-24186-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 4/7] screen: upgrade to 4.6.2
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
X-List-Received-Date: Fri, 10 Nov 2017 12:00:16 -0000

4.6.1 -> 4.6.2

Removed backported patches:
        1. 0001-fix-for-multijob-build.patch
        2. 0002-comm.h-now-depends-on-term.h.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../screen/0001-fix-for-multijob-build.patch       | 58 ----------------------
 .../screen/0002-comm.h-now-depends-on-term.h.patch | 33 ------------
 .../screen/{screen_4.6.1.bb => screen_4.6.2.bb}    |  6 +--
 3 files changed, 2 insertions(+), 95 deletions(-)
 delete mode 100644 meta/recipes-extended/screen/screen/0001-fix-for-multijob-build.patch
 delete mode 100644 meta/recipes-extended/screen/screen/0002-comm.h-now-depends-on-term.h.patch
 rename meta/recipes-extended/screen/{screen_4.6.1.bb => screen_4.6.2.bb} (88%)

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
diff --git a/meta/recipes-extended/screen/screen_4.6.1.bb b/meta/recipes-extended/screen/screen_4.6.2.bb
similarity index 88%
rename from meta/recipes-extended/screen/screen_4.6.1.bb
rename to meta/recipes-extended/screen/screen_4.6.2.bb
index bcd83a2..f54113f 100644
--- a/meta/recipes-extended/screen/screen_4.6.1.bb
+++ b/meta/recipes-extended/screen/screen_4.6.2.bb
@@ -21,13 +21,11 @@ SRC_URI = "${GNU_MIRROR}/screen/screen-${PV}.tar.gz \
            file://Provide-cross-compile-alternatives-for-AC_TRY_RUN.patch \
            file://Skip-host-file-system-checks-when-cross-compiling.patch \
            file://Avoid-mis-identifying-systems-as-SVR4.patch \
-           file://0002-comm.h-now-depends-on-term.h.patch \
-           file://0001-fix-for-multijob-build.patch \
            file://0001-configure.ac-fix-configure-failed-while-build-dir-ha.patch \
           "
 
-SRC_URI[md5sum] = "132c893aabfaf2020074790215c8cacd"
-SRC_URI[sha256sum] = "aba9af66cb626155d6abce4703f45cce0e30a5114a368bd6387c966cbbbb7c64"
+SRC_URI[md5sum] = "a0f529d3333b128dfaa324d978ba73a8"
+SRC_URI[sha256sum] = "1b6922520e6a0ce5e28768d620b0f640a6631397f95ccb043b70b91bb503fa3a"
 
 inherit autotools texinfo
 
-- 
2.4.0


