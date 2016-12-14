Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 90622731DA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Dec 2016 02:29:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uBE2TS4I013655
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 18:29:28 -0800 (PST)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 13 Dec 2016 18:29:27 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Dec 2016 10:26:13 +0800
Message-ID: <20161214022613.4587-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
Subject: [v2][PATCH] valgrind: make ld-XXX.so strlen intercept optional
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
X-List-Received-Date: Wed, 14 Dec 2016 02:29:26 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Hack: Depending on how glibc was compiled (e.g. optimised
for size or built with _FORTIFY_SOURCE enabled) the strlen
symbol might not be found in ld-XXX.so. Therefore although
we should still try to intercept it, don't make it mandatory
to do so.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 ...-make-ld-XXX.so-strlen-intercept-optional.patch | 45 ++++++++++++++++++++++
 meta/recipes-devtools/valgrind/valgrind_3.12.0.bb  |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/valgrind-make-ld-XXX.so-strlen-intercept-optional.patch

diff --git a/meta/recipes-devtools/valgrind/valgrind/valgrind-make-ld-XXX.so-strlen-intercept-optional.patch b/meta/recipes-devtools/valgrind/valgrind/valgrind-make-ld-XXX.so-strlen-intercept-optional.patch
new file mode 100644
index 0000000..d04297d
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/valgrind-make-ld-XXX.so-strlen-intercept-optional.patch
@@ -0,0 +1,45 @@
+From 005bd11809a1ce65e9f2c28e884354a4741650b9 Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <armccurdy@gmail.com>
+Date: Tue, 13 Dec 2016 11:29:55 +0800
+Subject: [PATCH] make ld-XXX.so strlen intercept optional
+
+Hack: Depending on how glibc was compiled (e.g. optimised for size or
+built with _FORTIFY_SOURCE enabled) the strlen symbol might not be
+found in ld-XXX.so. Therefore although we should still try to
+intercept it, don't make it mandatory to do so.
+
+Upstream-Status: Inappropriate
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ coregrind/m_redir.c | 13 ++++++++++++-
+ 1 file changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/coregrind/m_redir.c b/coregrind/m_redir.c
+index ff35009..d7d6816 100644
+--- a/coregrind/m_redir.c
++++ b/coregrind/m_redir.c
+@@ -1275,7 +1275,18 @@ static void add_hardwired_spec (const  HChar* sopatt, const HChar* fnpatt,
+    spec->to_addr     = to_addr;
+    spec->isWrap      = False;
+    spec->isGlobal    = False;
+-   spec->mandatory   = mandatory;
++
++   /* Hack: Depending on how glibc was compiled (e.g. optimised for size or
++      built with _FORTIFY_SOURCE enabled) the strlen symbol might not be found.
++      Therefore although we should still try to intercept it, don't make it
++      mandatory to do so. We over-ride "mandatory" here to avoid the need to
++      patch the many different architecture specific callers to
++      add_hardwired_spec(). */
++   if (0==VG_(strcmp)("strlen", fnpatt))
++      spec->mandatory = NULL;
++   else
++      spec->mandatory = mandatory;
++
+    /* VARIABLE PARTS */
+    spec->mark        = False; /* not significant */
+    spec->done        = False; /* not significant */
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
index 233ff47..5c3002f 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.12.0.bb
@@ -22,6 +22,7 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
            file://0001-Remove-tests-that-fail-to-build-on-some-PPC32-config.patch \
            file://use-appropriate-march-mcpu-mfpu-for-ARM-test-apps.patch \
            file://avoid-neon-for-targets-which-don-t-support-it.patch \
+           file://valgrind-make-ld-XXX.so-strlen-intercept-optional.patch \
 "
 SRC_URI_append_libc-musl = "\
            file://0001-fix-build-for-musl-targets.patch \
-- 
2.8.3


