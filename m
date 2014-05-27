Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D40A26FA68
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 01:59:10 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4R1xBY3026763
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 26 May 2014 18:59:11 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Mon, 26 May 2014 18:59:10 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 27 May 2014 09:59:02 +0800
Message-ID: <b661499ab6fa0c2d3e4da6bf0d5673e677e6b02f.1401155797.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1401155797.git.hongxu.jia@windriver.com>
References: <cover.1401155797.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 2/3] socat: fix supporting cross compiling
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
X-List-Received-Date: Tue, 27 May 2014 01:59:11 -0000
Content-Type: text/plain

The do_configure failed:
...
|checking for equivalent simple type of size_t... configure:
error: in `tmp/work/core2-64-poky-linux/socat/1.7.2.4-r0/build':
|configure: error: cannot run test program while cross compiling
...

For 1.7.2.4, the linux GCC check in configure.in didn't support
cross compiling, but the old version 1.7.2.3 supported, so we
reference 1.7.2.3 to fix this issue.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../socat/socat/fix-cross-compiling-failed.patch   | 34 ++++++++++++++++++++++
 meta/recipes-connectivity/socat/socat_1.7.2.4.bb   |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-connectivity/socat/socat/fix-cross-compiling-failed.patch

diff --git a/meta/recipes-connectivity/socat/socat/fix-cross-compiling-failed.patch b/meta/recipes-connectivity/socat/socat/fix-cross-compiling-failed.patch
new file mode 100644
index 0000000..4106cbd
--- /dev/null
+++ b/meta/recipes-connectivity/socat/socat/fix-cross-compiling-failed.patch
@@ -0,0 +1,34 @@
+configure.in: fix cross compiling failed
+
+The do_configure failed:
+...
+|checking for equivalent simple type of size_t... configure:
+error: in `tmp/work/core2-64-poky-linux/socat/1.7.2.4-r0/build':
+|configure: error: cannot run test program while cross compiling
+...
+
+For 1.7.2.4, the linux GCC check in configure.in didn't support
+cross compiling, but the old version 1.7.2.3 supported, so we
+reference 1.7.2.3 to fix this issue.
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
diff --git a/meta/recipes-connectivity/socat/socat_1.7.2.4.bb b/meta/recipes-connectivity/socat/socat_1.7.2.4.bb
index 6c3aba1..6febe5e 100644
--- a/meta/recipes-connectivity/socat/socat_1.7.2.4.bb
+++ b/meta/recipes-connectivity/socat/socat_1.7.2.4.bb
@@ -15,6 +15,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
            file://compile.patch \
            file://fix-xxx_SHIFT-autoheader.patch \
+           file://fix-cross-compiling-failed.patch \
 "
 
 
-- 
1.8.1.2


