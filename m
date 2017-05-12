Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 05D1F600B3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 May 2017 13:59:21 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1d9B6I-0003rs-IE from Awais_Belal@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Fri, 12 May 2017 06:59:22 -0700
Received: from svr-pkl-eng-07.mgc.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server id 14.3.224.2; Fri, 12 May 2017 14:59:21 +0100
From: Awais Belal <awais_belal@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 12 May 2017 18:59:18 +0500
Message-ID: <20170512135918.25150-1-awais_belal@mentor.com>
X-Mailer: git-send-email 2.11.1
MIME-Version: 1.0
Subject: [PATCH] autogen: fix autoopts script generation to handle shebang
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
X-List-Received-Date: Fri, 12 May 2017 13:59:22 -0000
Content-Type: text/plain

With deep directory hierarchy of the build dir the shenbang
generated for the autoopts scripts fail due to shebang length
crossing 128 characters.
This patch handles such scenarios for most cases by following
the symlink in HOSTTOOLS to the actual host executable so the
problem is resolved in most cases.

Signed-off-by: Awais Belal <awais_belal@mentor.com>
---
 .../autogen/autogen-native_5.18.12.bb              |  1 +
 ...oopts-mk-tpl-config.sh-fix-shebang-length.patch | 49 ++++++++++++++++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-devtools/autogen/autogen/0001-autoopts-mk-tpl-config.sh-fix-shebang-length.patch

diff --git a/meta/recipes-devtools/autogen/autogen-native_5.18.12.bb b/meta/recipes-devtools/autogen/autogen-native_5.18.12.bb
index 853477cf7c..1d76810fd7 100644
--- a/meta/recipes-devtools/autogen/autogen-native_5.18.12.bb
+++ b/meta/recipes-devtools/autogen/autogen-native_5.18.12.bb
@@ -14,6 +14,7 @@ SRC_URI = "${GNU_MIRROR}/autogen/rel${PV}/autogen-${PV}.tar.gz \
            file://fix-script-err-when-processing-libguile.patch \
            file://0001-config-libopts.m4-regenerate-it-from-config-libopts..patch \
            file://0002-autoopts-mk-tpl-config.sh-fix-perl-path.patch \
+           file://0001-autoopts-mk-tpl-config.sh-fix-shebang-length.patch \
 "
 
 SRC_URI[md5sum] = "551d15ccbf5b5fc5658da375d5003389"
diff --git a/meta/recipes-devtools/autogen/autogen/0001-autoopts-mk-tpl-config.sh-fix-shebang-length.patch b/meta/recipes-devtools/autogen/autogen/0001-autoopts-mk-tpl-config.sh-fix-shebang-length.patch
new file mode 100644
index 0000000000..453ecb28d6
--- /dev/null
+++ b/meta/recipes-devtools/autogen/autogen/0001-autoopts-mk-tpl-config.sh-fix-shebang-length.patch
@@ -0,0 +1,49 @@
+From 2648a4064aff7ae82e74b8de6ade93dc9c04ce3b Mon Sep 17 00:00:00 2001
+From: Awais Belal <awais_belal@mentor.com>
+Date: Fri, 12 May 2017 18:22:02 +0500
+Subject: [PATCH] autoopts/mk-tpl-config.sh: fix shebang length
+
+The shebang length cannot be more than 128 charaters
+and the change
+http://cgit.openembedded.org/openembedded-core/commit/meta/classes/base.bbclass?id=fa764a403da34bb0ca9fa3767a9e9dba8d685965
+requires that a user needs to make sure the HOSTTOOLS
+directory is under 128 characters in order to get
+the build through otherwise this causes
+bad interpreter: Permission denied
+when the builddir path is too long.
+This change now follows the path to actual host
+executable to be put in the final scripts that
+are generated so the shebang remains correct in
+most situations.
+
+Upstream-Status: Inappropriate
+
+Signed-off-by: Awais Belal <awais_belal@mentor.com>
+---
+ autoopts/mk-tpl-config.sh | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/autoopts/mk-tpl-config.sh b/autoopts/mk-tpl-config.sh
+index c4708a2..7de546b 100755
+--- a/autoopts/mk-tpl-config.sh
++++ b/autoopts/mk-tpl-config.sh
+@@ -98,11 +98,14 @@ fix_scripts() {
+         st=`sed 1q $f`
+ 
+         case "$st" in
+-        *perl ) echo '#!/usr/bin/env perl'
++        *perl )  PERL=`which perl`
++                 PERL=`readlink -f ${PERL}`
++                 echo '#!' ${PERL}
+                  sed 1d $f
+                  ;;
+ 
+-        */sh )   echo '#!' ${POSIX_SHELL}
++        */sh )   SH=`readlink -f ${POSIX_SHELL}`
++                 echo '#!' ${SH}
+                  sed 1d $f
+                  ;;
+ 
+-- 
+2.11.1
+
-- 
2.11.1


