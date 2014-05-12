Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0D5CC6605B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 11:06:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4CB6cQB000849
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 12 May 2014 04:06:38 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Mon, 12 May 2014 04:06:37 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 12 May 2014 19:06:31 +0800
Message-ID: <6b5bf7d0a382dc4f9af759c5c7072a411c2bdda5.1399892554.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1399892554.git.hongxu.jia@windriver.com>
References: <cover.1399892554.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 2/2] socat: fix do_configure/do_compile failed
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
X-List-Received-Date: Mon, 12 May 2014 11:07:00 -0000
Content-Type: text/plain

We reference 1.7.2.3 to fix the do_configure/do_compile failures in 1.7.2.4

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../socat/socat/fix-cross-compiling-failed.patch   | 25 ++++++++++++++++++++
 .../socat/fix-linux-errqueue.h-not-found.patch     | 27 ++++++++++++++++++++++
 meta/recipes-connectivity/socat/socat_1.7.2.4.bb   |  2 ++
 3 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-connectivity/socat/socat/fix-cross-compiling-failed.patch
 create mode 100644 meta/recipes-connectivity/socat/socat/fix-linux-errqueue.h-not-found.patch

diff --git a/meta/recipes-connectivity/socat/socat/fix-cross-compiling-failed.patch b/meta/recipes-connectivity/socat/socat/fix-cross-compiling-failed.patch
new file mode 100644
index 0000000..6b9658b
--- /dev/null
+++ b/meta/recipes-connectivity/socat/socat/fix-cross-compiling-failed.patch
@@ -0,0 +1,25 @@
+configure.in: fix cross compiling failed
+
+The confugring failed in 1.7.2.4, we reference 1.7.2.3 to fix this issue.
+
+Upstream-Status: Inappropriate [oe specific]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ configure.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.in b/configure.in
+--- a/configure.in
++++ b/configure.in
+@@ -41,7 +41,7 @@ AC_CHECK_PROG(AR, ar, ar, gar)
+ # fail
+ AC_LANG_COMPILER_REQUIRE()
+ 
+-if test "$CC" = "gcc"; then
++if test "$GCC" = yes; then
+    CFLAGS="$CFLAGS -D_GNU_SOURCE -Wall -Wno-parentheses"
+    ERRONWARN="-Werror -O0"
+ elif test "$CC" = "clang"; then
+-- 
+1.8.1.2
+
diff --git a/meta/recipes-connectivity/socat/socat/fix-linux-errqueue.h-not-found.patch b/meta/recipes-connectivity/socat/socat/fix-linux-errqueue.h-not-found.patch
new file mode 100644
index 0000000..1de7aae
--- /dev/null
+++ b/meta/recipes-connectivity/socat/socat/fix-linux-errqueue.h-not-found.patch
@@ -0,0 +1,27 @@
+configure.in: fix linux/errqueue.h not found
+
+The compiling failed in 1.7.2.4, we reference 1.7.2.3 to fix this issue.
+
+Upstream-Status: Inappropriate [oe specific]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ configure.in | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index 70922f9..bdfbe98 100644
+--- a/configure.in
++++ b/configure.in
+@@ -79,8 +79,7 @@ AC_HEADER_RESOLV()
+ 
+ AC_CHECK_HEADERS(termios.h linux/if_tun.h)
+ AC_CHECK_HEADERS(net/if_dl.h)
+-AC_CHECK_HEADERS(linux/types.h)
+-AC_CHECK_HEADER(linux/errqueue.h, AC_DEFINE(HAVE_LINUX_ERRQUEUE_H), [], [#include <linux/types.h>])
++AC_CHECK_HEADERS(linux/types.h linux/errqueue.h)
+ AC_CHECK_HEADERS(sys/utsname.h sys/select.h sys/file.h)
+ AC_CHECK_HEADERS(util.h bsd/libutil.h libutil.h sys/stropts.h regex.h)
+ AC_CHECK_HEADERS(linux/fs.h linux/ext2_fs.h)
+-- 
+1.8.1.2
+
diff --git a/meta/recipes-connectivity/socat/socat_1.7.2.4.bb b/meta/recipes-connectivity/socat/socat_1.7.2.4.bb
index 6c3aba1..777125f 100644
--- a/meta/recipes-connectivity/socat/socat_1.7.2.4.bb
+++ b/meta/recipes-connectivity/socat/socat_1.7.2.4.bb
@@ -15,6 +15,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
            file://compile.patch \
            file://fix-xxx_SHIFT-autoheader.patch \
+           file://fix-cross-compiling-failed.patch \
+           file://fix-linux-errqueue.h-not-found.patch \
 "
 
 
-- 
1.8.1.2


