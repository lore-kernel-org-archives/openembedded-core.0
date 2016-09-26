Return-Path: <Zhe.He@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 011C06069D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 06:51:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u8Q6plpd026675
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Sep 2016 23:51:48 -0700 (PDT)
Received: from PEK-ZHE-D1.wrs.com (128.224.162.234) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Sun, 25 Sep 2016 23:51:47 -0700
From: <zhe.he@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 26 Sep 2016 14:51:45 +0800
Message-ID: <1474872705-6005-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] guile: Remove bashisms
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
X-List-Received-Date: Mon, 26 Sep 2016 06:51:49 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

Remove bashisms from do_populate_sysroot task

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 meta/recipes-devtools/guile/guile_2.0.12.bb | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-devtools/guile/guile_2.0.12.bb b/meta/recipes-devtools/guile/guile_2.0.12.bb
index d2fe511..751a035 100644
--- a/meta/recipes-devtools/guile/guile_2.0.12.bb
+++ b/meta/recipes-devtools/guile/guile_2.0.12.bb
@@ -87,22 +87,27 @@ SYSROOT_PREPROCESS_FUNCS = "guile_cross_config"
 
 guile_cross_config() {
 	# this is only for target recipe
-	if [ "${PN}" = "guile" ]
-	then
-	        # Create guile-config returning target values instead of native values
-	        install -d ${SYSROOT_DESTDIR}${STAGING_BINDIR_CROSS}
-        	echo '#!'`which ${BUILD_SYS}-guile`$' \\\n--no-auto-compile -e main -s\n!#\n(define %guile-build-info '\'\( \
-			> ${B}/guile-config.cross
-	        sed -n -e 's:^[ \t]*{[ \t]*":  (:' \
+	[ "${PN}" = "${BPN}" ] || return 0
+
+	vars=$(sed -n -e 's:^[ \t]*{[ \t]*":  (:' \
 			-e 's:",[ \t]*": . ":' \
 			-e 's:" *}, *\\:"):' \
 			-e 's:^.*cachedir.*$::' \
 			-e '/^  (/p' \
-			< ${B}/libguile/libpath.h >> ${B}/guile-config.cross
-	        echo '))' >> ${B}/guile-config.cross
-	        cat ${B}/meta/guile-config >> ${B}/guile-config.cross
-	        install ${B}/guile-config.cross ${STAGING_BINDIR_CROSS}/guile-config
-	fi
+			< ${B}/libguile/libpath.h)
+
+	# Create guile-config returning target values instead of native values
+	install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}
+	cat <<EOF >${B}/guile-config.cross
+#!$(which ${BUILD_SYS}-guile) \\
+--no-auto-compile -e main -s
+!#
+(define %guile-build-info '(
+$vars
+))
+EOF
+	cat ${B}/meta/guile-config >> ${B}/guile-config.cross
+	install ${B}/guile-config.cross ${SYSROOT_DESTDIR}${bindir_crossscripts}/guile-config
 }
 
 # Guile needs the compiled files to be newer than the source, and it won't
-- 
2.8.3


