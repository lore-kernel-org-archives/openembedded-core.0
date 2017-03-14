Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id AE7F5776BD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 08:45:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v2E8jw4N029631
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 01:46:00 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 14 Mar 2017 01:45:59 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Mar 2017 01:45:44 -0700
Message-ID: <069eb13801ed99973d9177ff271ace90c27b91fa.1489481108.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0.rc2.dirty
In-Reply-To: <cover.1489481108.git.liezhi.yang@windriver.com>
References: <cover.1489481108.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 7/8] autogen-native: fix POSIX_SHELL and perl
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
X-List-Received-Date: Tue, 14 Mar 2017 08:45:59 -0000
Content-Type: text/plain

The shebang's length is usually 128 as defined in /usr/include/linux/binfmts.h:
  #define BINPRM_BUF_SIZE 128

So there would be errors when /path/to/hosttools/perl is longer than 128.

This patch fixes the problem when POSIX_SHELL and perl are used as the interpreters.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../autogen/autogen-native_5.18.12.bb              |  3 ++
 ...2-autoopts-mk-tpl-config.sh-fix-perl-path.patch | 32 ++++++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-devtools/autogen/autogen/0002-autoopts-mk-tpl-config.sh-fix-perl-path.patch

diff --git a/meta/recipes-devtools/autogen/autogen-native_5.18.12.bb b/meta/recipes-devtools/autogen/autogen-native_5.18.12.bb
index 0004389b11..c3c8287210 100644
--- a/meta/recipes-devtools/autogen/autogen-native_5.18.12.bb
+++ b/meta/recipes-devtools/autogen/autogen-native_5.18.12.bb
@@ -13,6 +13,7 @@ SRC_URI = "${GNU_MIRROR}/autogen/rel${PV}/autogen-${PV}.tar.gz \
            file://mk-tpl-config.sh-force-exit-value-to-be-0-in-subproc.patch \
            file://fix-script-err-when-processing-libguile.patch \
            file://0001-config-libopts.m4-regenerate-it-from-config-libopts..patch \
+           file://0002-autoopts-mk-tpl-config.sh-fix-perl-path.patch \
 "
 
 SRC_URI[md5sum] = "551d15ccbf5b5fc5658da375d5003389"
@@ -30,6 +31,8 @@ inherit autotools texinfo native pkgconfig
 export GUILE_LOAD_PATH = "${STAGING_DATADIR_NATIVE}/guile/2.0"
 export GUILE_LOAD_COMPILED_PATH = "${STAGING_LIBDIR_NATIVE}/guile/2.0/ccache"
 
+export POSIX_SHELL = "/bin/bash"
+
 do_install_append () {
 	create_wrapper ${D}/${bindir}/autogen \
 		GUILE_LOAD_PATH=${STAGING_DATADIR_NATIVE}/guile/2.0 \
diff --git a/meta/recipes-devtools/autogen/autogen/0002-autoopts-mk-tpl-config.sh-fix-perl-path.patch b/meta/recipes-devtools/autogen/autogen/0002-autoopts-mk-tpl-config.sh-fix-perl-path.patch
new file mode 100644
index 0000000000..d5fe143ce4
--- /dev/null
+++ b/meta/recipes-devtools/autogen/autogen/0002-autoopts-mk-tpl-config.sh-fix-perl-path.patch
@@ -0,0 +1,32 @@
+From 9f69f3f5ef22bf1bcffb0e651efc260889cfaa46 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Mon, 13 Mar 2017 20:33:30 -0700
+Subject: [PATCH] autoopts/mk-tpl-config.sh: fix perl path
+
+Use "which perl" as shebang doesn't work when it is longer than
+BINPRM_BUF_SIZE which is 128 usually. So use "/usr/bin/env perl" to
+instead of.
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ autoopts/mk-tpl-config.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/autoopts/mk-tpl-config.sh b/autoopts/mk-tpl-config.sh
+index 093e808..8dfc6dd 100755
+--- a/autoopts/mk-tpl-config.sh
++++ b/autoopts/mk-tpl-config.sh
+@@ -98,7 +98,7 @@ fix_scripts() {
+         st=`sed 1q $f`
+ 
+         case "$st" in
+-        *perl ) echo '#!' `which perl`
++        *perl ) echo '#!/usr/bin/env perl'
+                  sed 1d $f
+                  ;;
+ 
+-- 
+2.10.2
+
-- 
2.11.0.rc2.dirty


