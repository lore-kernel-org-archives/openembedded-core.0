Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E012C60746
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 06:49:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u6Q6nrZ8006087
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jul 2016 23:49:53 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 25 Jul 2016 23:49:52 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Jul 2016 02:49:51 -0400
Message-ID: <1469515791-235219-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] screen: add back the patch for parallel build
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
X-List-Received-Date: Tue, 26 Jul 2016 06:49:57 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The patch 0001-fix-for-multijob-build.patch was removed by:
"d437921 screen: upgrade to 4.4.0"

But in fact the fixes is not all in the version 4.4.0, we
still get errors in parallel builds:

| ../screen-4.4.0/screen.h:48:18: fatal error: comm.h: No such file or directory

So rebase the patch and add it back.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../screen/0001-fix-for-multijob-build.patch       | 58 ++++++++++++++++++++++
 meta/recipes-extended/screen/screen_4.4.0.bb       |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-extended/screen/screen/0001-fix-for-multijob-build.patch

diff --git a/meta/recipes-extended/screen/screen/0001-fix-for-multijob-build.patch b/meta/recipes-extended/screen/screen/0001-fix-for-multijob-build.patch
new file mode 100644
index 0000000..fbdb0eb
--- /dev/null
+++ b/meta/recipes-extended/screen/screen/0001-fix-for-multijob-build.patch
@@ -0,0 +1,58 @@
+From 79ad2885e26631077dd6b8aebe17ae95b38133a6 Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Tue, 26 Jul 2016 14:23:59 +0800
+Subject: [PATCH] fix for multijob build
+
+make sure that comm.sh script generates comm.h header before doing
+anything else
+
+Signed-off-by: Amadeusz Sawiski <amade@asmblr.net>
+
+Upstream-Status: Backport
+
+Backport patch to fix parallel build failure and update context to make patch
+coulde be applied.
+
+http://git.savannah.gnu.org/cgit/screen.git/commit?id=c0de6dd
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ Makefile.in | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index aca7da3..3607711 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -298,7 +298,7 @@ search.o: layout.h viewport.h canvas.h search.c config.h screen.h os.h osdef.h a
+  comm.h layer.h term.h image.h display.h window.h mark.h extern.h
+ tty.o: layout.h viewport.h canvas.h tty.c config.h screen.h os.h osdef.h ansi.h acls.h comm.h \
+  layer.h term.h image.h display.h window.h extern.h
+-term.o: layout.h viewport.h canvas.h term.c term.h
++term.o: layout.h viewport.h canvas.h term.c term.h comm.h
+ window.o: layout.h viewport.h canvas.h window.c config.h screen.h os.h osdef.h ansi.h acls.h \
+  comm.h layer.h term.h image.h display.h window.h extern.h logfile.h
+ utmp.o: layout.h viewport.h canvas.h utmp.c config.h screen.h os.h osdef.h ansi.h acls.h \
+@@ -324,7 +324,7 @@ canvas.o: layout.h viewport.h canvas.h canvas.c config.h screen.h os.h osdef.h a
+  comm.h layer.h term.h image.h display.h window.h extern.h \
+  braille.h
+ comm.o: layout.h viewport.h canvas.h comm.c config.h acls.h comm.h
+-kmapdef.o: layout.h viewport.h canvas.h kmapdef.c config.h
++kmapdef.o: layout.h viewport.h canvas.h kmapdef.c config.h comm.h
+ acls.o: layout.h viewport.h canvas.h acls.c config.h screen.h os.h osdef.h ansi.h acls.h comm.h \
+  layer.h term.h image.h display.h window.h extern.h
+ braille.o: layout.h viewport.h canvas.h braille.c config.h screen.h os.h osdef.h ansi.h acls.h \
+@@ -350,7 +350,7 @@ layout.o: layout.h viewport.h canvas.h layout.c config.h screen.h os.h osdef.h a
+ viewport.o: layout.h viewport.h canvas.h viewport.c config.h screen.h os.h osdef.h ansi.h acls.h \
+  comm.h layer.h term.h image.h display.h window.h extern.h \
+  braille.h
+-list_generic.o: list_generic.h list_generic.c layer.h screen.h osdef.h
+-list_display.o: list_generic.h list_display.c layer.h screen.h osdef.h
++list_generic.o: list_generic.h list_generic.c layer.h screen.h osdef.h comm.h
++list_display.o: list_generic.h list_display.c layer.h screen.h osdef.h comm.h
+ list_window.o: list_generic.h list_window.c window.h layer.h screen.h osdef.h comm.h
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-extended/screen/screen_4.4.0.bb b/meta/recipes-extended/screen/screen_4.4.0.bb
index e970c5b..769bac1 100644
--- a/meta/recipes-extended/screen/screen_4.4.0.bb
+++ b/meta/recipes-extended/screen/screen_4.4.0.bb
@@ -23,6 +23,7 @@ SRC_URI = "${GNU_MIRROR}/screen/screen-${PV}.tar.gz \
            file://Skip-host-file-system-checks-when-cross-compiling.patch \
            file://Avoid-mis-identifying-systems-as-SVR4.patch \
            file://0002-comm.h-now-depends-on-term.h.patch \
+           file://0001-fix-for-multijob-build.patch \
           "
 
 SRC_URI[md5sum] = "d26e11a3648c2b11aaefa215a55dfd39"
-- 
2.8.1


