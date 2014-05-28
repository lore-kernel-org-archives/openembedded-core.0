Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 429776FAC7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 07:59:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4S7xlMr026708
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 28 May 2014 00:59:47 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Wed, 28 May 2014 00:59:46 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 28 May 2014 15:59:37 +0800
Message-ID: <a3b490a28af6eedca5952918acfee85cb800ba38.1401263535.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1401263535.git.hongxu.jia@windriver.com>
References: <cover.1401263535.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 2/2] socat: fix supporting cross compiling
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
X-List-Received-Date: Wed, 28 May 2014 07:59:47 -0000
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
index 185dd44..26a8429 100644
--- a/meta/recipes-connectivity/socat/socat_1.7.2.4.bb
+++ b/meta/recipes-connectivity/socat/socat_1.7.2.4.bb
@@ -15,6 +15,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
            file://compile.patch \
            file://socat-enable-termios.patch \
+           file://fix-cross-compiling-failed.patch \
 "
 
 
-- 
1.8.1.2


