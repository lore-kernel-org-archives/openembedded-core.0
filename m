Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id ECB0E60720
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Nov 2018 08:56:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wA98uWwA003277
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 9 Nov 2018 00:56:33 -0800 (PST)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Fri, 9 Nov 2018 00:56:32 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Fri, 9 Nov 2018 17:07:03 +0800
Message-ID: <598849d406a8d65cc25913072ac657197a3b92cc.1541754319.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1541754319.git.hongxu.jia@windriver.com>
References: <cover.1541754319.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/6] apr: upgrade 1.6.3 -> 1.6.5
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
X-List-Received-Date: Fri, 09 Nov 2018 08:56:33 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../apr/0008-apr-fix-ptest-hang-in-teststr.patch   | 32 ----------------------
 .../apr/{apr_1.6.3.bb => apr_1.6.5.bb}             |  7 ++---
 2 files changed, 3 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-support/apr/apr/0008-apr-fix-ptest-hang-in-teststr.patch
 rename meta/recipes-support/apr/{apr_1.6.3.bb => apr_1.6.5.bb} (95%)

diff --git a/meta/recipes-support/apr/apr/0008-apr-fix-ptest-hang-in-teststr.patch b/meta/recipes-support/apr/apr/0008-apr-fix-ptest-hang-in-teststr.patch
deleted file mode 100644
index 6809fa6..0000000
--- a/meta/recipes-support/apr/apr/0008-apr-fix-ptest-hang-in-teststr.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 036f90748247417dbfa714b1b912ca7dd4053f04 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Mon, 23 Jul 2018 14:12:35 +0800
-Subject: [PATCH] apr: fix ptest hang in teststr
-
-ptest hang in teststr since turns into a non-terminating loop,
-fix by below backported patch.
-
-Upstream-Status: Backport[https://github.com/apache/apr/commit/
-         2e8fbff4ecf82d0decf6baf774c209948f2f4998?diff=unified]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- test/teststr.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/test/teststr.c b/test/teststr.c
-index d9a5054..951a830 100644
---- a/test/teststr.c
-+++ b/test/teststr.c
-@@ -307,7 +307,7 @@ static void overflow_strfsize(abts_case *tc, void *data)
-     for (; off < 999999999; off += 999) {
-         apr_strfsize(off, buf);
-     }
--    for (off = 1; off < LONG_MAX && off > 0; off *= 2) {
-+    for (off = LONG_MAX; off > 1; off /= 2) {
-         apr_strfsize(off, buf);
-         apr_strfsize(off + 1, buf);
-         apr_strfsize(off - 1, buf);
--- 
-2.7.4
-
diff --git a/meta/recipes-support/apr/apr_1.6.3.bb b/meta/recipes-support/apr/apr_1.6.5.bb
similarity index 95%
rename from meta/recipes-support/apr/apr_1.6.3.bb
rename to meta/recipes-support/apr/apr_1.6.5.bb
index 7bfb698..c2f5900 100644
--- a/meta/recipes-support/apr/apr_1.6.3.bb
+++ b/meta/recipes-support/apr/apr_1.6.5.bb
@@ -18,11 +18,10 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
            file://0005-configure.in-fix-LTFLAGS-to-make-it-work-with-ccache.patch \
            file://0006-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch \
            file://0007-explicitly-link-libapr-against-phtread-to-make-gold-.patch \
-           file://0008-apr-fix-ptest-hang-in-teststr.patch \
-"
+           "
 
-SRC_URI[md5sum] = "12f2a349483ad6f12db49ba01fbfdbfa"
-SRC_URI[sha256sum] = "131f06d16d7aabd097fa992a33eec2b6af3962f93e6d570a9bd4d85e95993172"
+SRC_URI[md5sum] = "ad4add8efdfe87330b88e5e788241775"
+SRC_URI[sha256sum] = "a67ca9fcf9c4ff59bce7f428a323c8b5e18667fdea7b0ebad47d194371b0a105"
 
 inherit autotools-brokensep lib_package binconfig multilib_header ptest
 
-- 
2.7.4


