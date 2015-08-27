Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5B1DC76E17
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 09:33:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t7R9XTNR023576
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 02:33:29 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Thu, 27 Aug 2015 02:33:28 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Aug 2015 17:28:59 +0800
Message-ID: <883baed64d4645e7d054209cbfb22fbfdaccc228.1440667679.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1440667679.git.kai.kang@windriver.com>
References: <cover.1440667679.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] screen: fix parallel build failure
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
X-List-Received-Date: Thu, 27 Aug 2015 09:33:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Kai Kang <kai.kang@windriver.com>

Backport patch to fix screen parallel build failure.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../screen/0001-fix-for-multijob-build.patch       | 58 ++++++++++++++++++++++
 meta/recipes-extended/screen/screen_4.3.1.bb       |  4 +-
 2 files changed, 61 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/screen/screen/0001-fix-for-multijob-build.patch

diff --git a/meta/recipes-extended/screen/screen/0001-fix-for-multijob-build.patch b/meta/recipes-extended/screen/screen/0001-fix-for-multijob-build.patch
new file mode 100644
index 0000000..40ecef0
--- /dev/null
+++ b/meta/recipes-extended/screen/screen/0001-fix-for-multijob-build.patch
@@ -0,0 +1,58 @@
+Upstream-Status: Backport
+
+Backport patch to fix parallel build failure and update context to make patch
+coulde be applied.
+
+http://git.savannah.gnu.org/cgit/screen.git/commit?id=c0de6dd
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+From c0de6dd7970b2c7b426a5c39dcbc31c2bef87232 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amade@asmblr.net>
+Date: Thu, 2 Jan 2014 18:18:06 +0100
+Subject: [PATCH] fix for multijob build
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+make sure that comm.sh script generates comm.h header before doing
+anything else
+
+Signed-off-by: Amadeusz Sławiński <amade@asmblr.net>
+---
+ Makefile.in | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index ce86cbc..dea16d8 100644
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
+-list_window.o: list_generic.h list_window.c window.h layer.h screen.h osdef.h
++list_generic.o: list_generic.h list_generic.c layer.h screen.h osdef.h comm.h
++list_display.o: list_generic.h list_display.c layer.h screen.h osdef.h comm.h
++list_window.o: list_generic.h list_window.c window.h layer.h screen.h osdef.h comm.h
+ 
diff --git a/meta/recipes-extended/screen/screen_4.3.1.bb b/meta/recipes-extended/screen/screen_4.3.1.bb
index f95578b..6aea56d 100644
--- a/meta/recipes-extended/screen/screen_4.3.1.bb
+++ b/meta/recipes-extended/screen/screen_4.3.1.bb
@@ -21,7 +21,9 @@ SRC_URI = "${GNU_MIRROR}/screen/screen-${PV}.tar.gz \
            file://Remove-redundant-compiler-sanity-checks.patch \
            file://Provide-cross-compile-alternatives-for-AC_TRY_RUN.patch \
            file://Skip-host-file-system-checks-when-cross-compiling.patch \
-           file://Avoid-mis-identifying-systems-as-SVR4.patch"
+           file://Avoid-mis-identifying-systems-as-SVR4.patch \
+           file://0001-fix-for-multijob-build.patch \
+          "
 
 SRC_URI[md5sum] = "5bb3b0ff2674e29378c31ad3411170ad"
 SRC_URI[sha256sum] = "fa4049f8aee283de62e283d427f2cfd35d6c369b40f7f45f947dbfd915699d63"
-- 
1.9.1


