Return-Path: <Yi.Zhao@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 148796E5CB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jul 2016 08:25:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u658POUx016964
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Jul 2016 01:25:24 -0700
Received: from localhost (128.224.162.178) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Tue, 5 Jul 2016 01:25:23 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Jul 2016 16:25:15 +0800
Message-ID: <6bd58f81521a65ed3c33e31b0e617ed41ec9c8bb.1467706418.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1467706418.git.yi.zhao@windriver.com>
References: <cover.1467706418.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.178]
Subject: [PATCH 1/1] autogen-native: fix script error when processing libguile
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
X-List-Received-Date: Tue, 05 Jul 2016 08:25:24 -0000
Content-Type: text/plain

From: Zhenbo Gao <zhenbo.gao@windriver.com>

do_configure for autogen-native would fail if build directory path
contains '-I' characters, which is caused by the unsuitable sed script
when processing libguile.

Error log:
[snip]
checking for GUILE... yes
awk: fatal: cannot open file `/buildarea1/poky/build /libguile/version.h' for reading (No such file or directory)
configure: error: in `/buildarea1/poky/build-Ice/tmp/work/x86_64-linux/autogen-native/5.18.10-r0/build':
configure: error: cannot determine Guile version
[snip]

Signed-off-by: Zhenbo Gao <zhenbo.gao@windriver.com>
Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../autogen/autogen-native_5.18.10.bb              |  1 +
 .../fix-script-err-when-processing-libguile.patch  | 37 ++++++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/autogen/autogen/fix-script-err-when-processing-libguile.patch

diff --git a/meta/recipes-devtools/autogen/autogen-native_5.18.10.bb b/meta/recipes-devtools/autogen/autogen-native_5.18.10.bb
index fd52c83..274427c 100644
--- a/meta/recipes-devtools/autogen/autogen-native_5.18.10.bb
+++ b/meta/recipes-devtools/autogen/autogen-native_5.18.10.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SRC_URI = "${GNU_MIRROR}/autogen/rel${PV}/autogen-${PV}.tar.gz \
            file://increase-timeout-limit.patch \
            file://mk-tpl-config.sh-force-exit-value-to-be-0-in-subproc.patch \
+           file://fix-script-err-when-processing-libguile.patch \
 "
 
 SRC_URI[md5sum] = "2d1b5226e1929d0680011df631289571"
diff --git a/meta/recipes-devtools/autogen/autogen/fix-script-err-when-processing-libguile.patch b/meta/recipes-devtools/autogen/autogen/fix-script-err-when-processing-libguile.patch
new file mode 100644
index 0000000..694a395
--- /dev/null
+++ b/meta/recipes-devtools/autogen/autogen/fix-script-err-when-processing-libguile.patch
@@ -0,0 +1,37 @@
+autogen-native: fix script err when processing libguile
+
+do_configure for autogen will fail if project directory path
+contains '-I' character, which is caused by the unsuitable sed
+script when processing libguile.
+
+Upstream-Status: Pending
+
+Signed-off-by: Zhenbo Gao <zhenbo.gao@windriver.com>
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+
+diff --git a/config/ag_macros.m4 b/config/ag_macros.m4
+index 58186b6..58ed2ad 100644
+--- a/config/ag_macros.m4
++++ b/config/ag_macros.m4
+@@ -32,7 +32,7 @@ AC_DEFUN([INVOKE_AG_MACROS_LAST],[
+   GUILE_FLAGS
+   [ag_gv=`gdir=\`pkg-config --cflags-only-I \
+   guile-${GUILE_EFFECTIVE_VERSION} | \
+-  sed 's/-I *//;s/ *-I.*/ /g'\`
++  sed 's/ *-I *\// \//g'\`
+   for d in $gdir
+   do  test -f "$d/libguile/version.h" && gdir=$d && break
+   done
+diff --git a/config/misc.def b/config/misc.def
+index 490d361..6e183ef 100644
+--- a/config/misc.def
++++ b/config/misc.def
+@@ -342,7 +342,7 @@ do-always = <<- _END_ALWAYS_
+ 	GUILE_FLAGS
+ 	[ag_gv=`gdir=\`pkg-config --cflags-only-I \
+ 			guile-${GUILE_EFFECTIVE_VERSION} | \
+-			sed 's/-I *//;s/ *-I.*/ /g'\`
++			sed 's/ *-I *\// \//g'\`
+ 		test -z "$gdir" && gdir=/usr/include
+ 		for d in $gdir
+ 		do  test -f "$d/libguile/version.h" && gdir=$d && break
-- 
2.7.4


