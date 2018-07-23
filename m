Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AB9ED74743
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2018 07:37:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w6N7bFX1006708
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2018 00:37:15 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Mon, 23 Jul 2018 00:37:08 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 23 Jul 2018 15:37:07 +0800
Message-ID: <1532331427-405224-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] apr: fix ptest hangs since enter non-terminating loop
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
X-List-Received-Date: Mon, 23 Jul 2018 07:37:15 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

ptest hangs in teststr since enter non-terminating loop,
fixed by a backport patch

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../apr/0008-apr-fix-ptest-hang-in-teststr.patch   | 32 ++++++++++++++++++++++
 meta/recipes-support/apr/apr_1.6.3.bb              |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-support/apr/apr/0008-apr-fix-ptest-hang-in-teststr.patch

diff --git a/meta/recipes-support/apr/apr/0008-apr-fix-ptest-hang-in-teststr.patch b/meta/recipes-support/apr/apr/0008-apr-fix-ptest-hang-in-teststr.patch
new file mode 100644
index 0000000..6809fa6
--- /dev/null
+++ b/meta/recipes-support/apr/apr/0008-apr-fix-ptest-hang-in-teststr.patch
@@ -0,0 +1,32 @@
+From 036f90748247417dbfa714b1b912ca7dd4053f04 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Mon, 23 Jul 2018 14:12:35 +0800
+Subject: [PATCH] apr: fix ptest hang in teststr
+
+ptest hang in teststr since turns into a non-terminating loop,
+fix by below backported patch.
+
+Upstream-Status: Backport[https://github.com/apache/apr/commit/
+         2e8fbff4ecf82d0decf6baf774c209948f2f4998?diff=unified]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ test/teststr.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/test/teststr.c b/test/teststr.c
+index d9a5054..951a830 100644
+--- a/test/teststr.c
++++ b/test/teststr.c
+@@ -307,7 +307,7 @@ static void overflow_strfsize(abts_case *tc, void *data)
+     for (; off < 999999999; off += 999) {
+         apr_strfsize(off, buf);
+     }
+-    for (off = 1; off < LONG_MAX && off > 0; off *= 2) {
++    for (off = LONG_MAX; off > 1; off /= 2) {
+         apr_strfsize(off, buf);
+         apr_strfsize(off + 1, buf);
+         apr_strfsize(off - 1, buf);
+-- 
+2.7.4
+
diff --git a/meta/recipes-support/apr/apr_1.6.3.bb b/meta/recipes-support/apr/apr_1.6.3.bb
index 87b8787..e044c4a 100644
--- a/meta/recipes-support/apr/apr_1.6.3.bb
+++ b/meta/recipes-support/apr/apr_1.6.3.bb
@@ -18,6 +18,7 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
            file://0005-configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch \
            file://0006-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch \
            file://0007-explicitly-link-libapr-against-phtread-to-make-gold-.patch \
+           file://0008-apr-fix-ptest-hang-in-teststr.patch \
 "
 
 SRC_URI[md5sum] = "12f2a349483ad6f12db49ba01fbfdbfa"
-- 
2.7.4


