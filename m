Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 62FBE6011C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jul 2016 13:02:18 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 04 Jul 2016 06:02:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,574,1459839600"; d="scan'208";a="133585822"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 04 Jul 2016 06:02:20 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 35A846A4080
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jul 2016 06:02:12 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Jul 2016 16:02:04 +0300
Message-Id: <1467637324-16642-5-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1467637324-16642-1-git-send-email-maxin.john@intel.com>
References: <1467637324-16642-1-git-send-email-maxin.john@intel.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] screen: upgrade to 4.4.0
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
X-List-Received-Date: Mon, 04 Jul 2016 13:02:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Removed the following backported patch:
 * 0001-fix-for-multijob-build.patch
 * 0001-Fix-stack-overflow-due-to-too-deep-recursion.patch

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...-stack-overflow-due-to-too-deep-recursion.patch | 58 ----------------------
 .../screen/0001-fix-for-multijob-build.patch       | 58 ----------------------
 .../screen/{screen_4.3.1.bb => screen_4.4.0.bb}    |  6 +--
 3 files changed, 2 insertions(+), 120 deletions(-)
 delete mode 100644 meta/recipes-extended/screen/screen/0001-Fix-stack-overflow-due-to-too-deep-recursion.patch
 delete mode 100644 meta/recipes-extended/screen/screen/0001-fix-for-multijob-build.patch
 rename meta/recipes-extended/screen/{screen_4.3.1.bb => screen_4.4.0.bb} (87%)

diff --git a/meta/recipes-extended/screen/screen/0001-Fix-stack-overflow-due-to-too-deep-recursion.patch b/meta/recipes-extended/screen/screen/0001-Fix-stack-overflow-due-to-too-deep-recursion.patch
deleted file mode 100644
index 4ac820f..0000000
--- a/meta/recipes-extended/screen/screen/0001-Fix-stack-overflow-due-to-too-deep-recursion.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-Bug: 45713
-
-How to reproduce:
-Run this command inside screen
-$ printf '\x1b[10000000T'
-
-screen will recursively call MScrollV to depth n/256.
-This is time consuming and will overflow stack if n is huge.
-
-Fixes CVE-2015-6806
-
-Upstream-Status: Backport
-CVE: CVE-2015-6806
-
-Signed-off-by: Kuang-che Wu <kcwu@csie.org>
-Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
----
-diff -Naur screen-4.3.1-orig/ansi.c screen-4.3.1/ansi.c
---- screen-4.3.1-orig/ansi.c	2015-06-29 00:22:55.000000000 +0300
-+++ screen-4.3.1/ansi.c	2015-10-06 13:13:58.297648039 +0300
-@@ -2502,13 +2502,13 @@
-     return;
-   if (n > 0)
-     {
-+      if (ye - ys + 1 < n)
-+	  n = ye - ys + 1;
-       if (n > 256)
- 	{
- 	  MScrollV(p, n - 256, ys, ye, bce);
- 	  n = 256;
- 	}
--      if (ye - ys + 1 < n)
--	n = ye - ys + 1;
- #ifdef COPY_PASTE
-       if (compacthist)
- 	{
-@@ -2562,15 +2562,15 @@
-     }
-   else
-     {
--      if (n < -256)
--	{
--	  MScrollV(p, n + 256, ys, ye, bce);
--	  n = -256;
--	}
-       n = -n;
-       if (ye - ys + 1 < n)
- 	n = ye - ys + 1;
- 
-+      if (n > 256)
-+      {
-+        MScrollV(p, - (n - 256), ys, ye, bce);
-+        n = 256;
-+      }
-       ml = p->w_mlines + ye;
-       /* Clear lines */
-       for (i = ye; i > ye - n; i--, ml--)
diff --git a/meta/recipes-extended/screen/screen/0001-fix-for-multijob-build.patch b/meta/recipes-extended/screen/screen/0001-fix-for-multijob-build.patch
deleted file mode 100644
index 40ecef0..0000000
--- a/meta/recipes-extended/screen/screen/0001-fix-for-multijob-build.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-Upstream-Status: Backport
-
-Backport patch to fix parallel build failure and update context to make patch
-coulde be applied.
-
-http://git.savannah.gnu.org/cgit/screen.git/commit?id=c0de6dd
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
-From c0de6dd7970b2c7b426a5c39dcbc31c2bef87232 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
-Date: Thu, 2 Jan 2014 18:18:06 +0100
-Subject: [PATCH] fix for multijob build
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-make sure that comm.sh script generates comm.h header before doing
-anything else
-
-Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
----
- Makefile.in | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index ce86cbc..dea16d8 100644
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
--list_window.o: list_generic.h list_window.c window.h layer.h screen.h osdef.h
-+list_generic.o: list_generic.h list_generic.c layer.h screen.h osdef.h comm.h
-+list_display.o: list_generic.h list_display.c layer.h screen.h osdef.h comm.h
-+list_window.o: list_generic.h list_window.c window.h layer.h screen.h osdef.h comm.h
- 
diff --git a/meta/recipes-extended/screen/screen_4.3.1.bb b/meta/recipes-extended/screen/screen_4.4.0.bb
similarity index 87%
rename from meta/recipes-extended/screen/screen_4.3.1.bb
rename to meta/recipes-extended/screen/screen_4.4.0.bb
index 00d878b..e970c5b 100644
--- a/meta/recipes-extended/screen/screen_4.3.1.bb
+++ b/meta/recipes-extended/screen/screen_4.4.0.bb
@@ -22,13 +22,11 @@ SRC_URI = "${GNU_MIRROR}/screen/screen-${PV}.tar.gz \
            file://Provide-cross-compile-alternatives-for-AC_TRY_RUN.patch \
            file://Skip-host-file-system-checks-when-cross-compiling.patch \
            file://Avoid-mis-identifying-systems-as-SVR4.patch \
-           file://0001-fix-for-multijob-build.patch \
            file://0002-comm.h-now-depends-on-term.h.patch \
-           file://0001-Fix-stack-overflow-due-to-too-deep-recursion.patch \
           "
 
-SRC_URI[md5sum] = "5bb3b0ff2674e29378c31ad3411170ad"
-SRC_URI[sha256sum] = "fa4049f8aee283de62e283d427f2cfd35d6c369b40f7f45f947dbfd915699d63"
+SRC_URI[md5sum] = "d26e11a3648c2b11aaefa215a55dfd39"
+SRC_URI[sha256sum] = "ef722a54759a3bf23aad272bbf33c414c1078cad6bcd982fada93c0d7917218b"
 
 inherit autotools texinfo
 
-- 
2.4.0


