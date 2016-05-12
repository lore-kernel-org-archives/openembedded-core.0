Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id D3BD770101
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 08:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 6950D2E1F9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 10:38:14 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id oXv6nPiuAN15
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 10:38:13 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id 41ADB2E1F2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 10:38:13 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 2B26A1768
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 10:38:13 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 2061E1766
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 10:38:13 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 1ED9910E2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 10:38:13 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u4C8cDJX001990
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 10:38:13 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u4C8cD9R001989
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2016 10:38:13 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 May 2016 10:37:48 +0200
Message-Id: <91f87920968964957ee6a9d89c37bfe26d67580c.1463042237.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1463042237.git.pkj@axis.com>
References: <cover.1463042237.git.pkj@axis.com>
In-Reply-To: <cover.1463042237.git.pkj@axis.com>
References: <cover.1463042237.git.pkj@axis.com>
Subject: [PATCHv2 01/16] staging.bbclass: Make it easier to define which dirs to stage
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
X-List-Received-Date: Thu, 12 May 2016 08:38:15 -0000

The directories that should be staged in the sysroot are now specified
in the SYSROOT_DIRS variable. Extra directories that should be staged
for native are specified in SYSROOT_DIRS_NATIVE. Finally, directories
that should not be staged are specified in SYSROOT_DIRS_BLACKLIST.

This also removes the sysroot_stage_libdir() function as it is no
longer used (it was just a wrapper for sysroot_stage_dir()).

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/staging.bbclass | 75 +++++++++++++++++++++++++-------------------
 1 file changed, 42 insertions(+), 33 deletions(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index bc5dfa8..a0f82be 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -1,3 +1,37 @@
+# These directories will be staged in the sysroot
+SYSROOT_DIRS = " \
+    ${includedir} \
+    ${libdir} \
+    ${base_libdir} \
+    ${nonarch_base_libdir} \
+    ${datadir} \
+"
+
+# These directories are also staged in the sysroot when they contain files that
+# are usable on the build system
+SYSROOT_DIRS_NATIVE = " \
+    ${bindir} \
+    ${sbindir} \
+    ${base_bindir} \
+    ${base_sbindir} \
+    ${libexecdir} \
+    ${sysconfdir} \
+    ${localstatedir} \
+"
+SYSROOT_DIRS_append_class-native = " ${SYSROOT_DIRS_NATIVE}"
+SYSROOT_DIRS_append_class-cross = " ${SYSROOT_DIRS_NATIVE}"
+SYSROOT_DIRS_append_class-crosssdk = " ${SYSROOT_DIRS_NATIVE}"
+
+# These directories will not be staged in the sysroot
+SYSROOT_DIRS_BLACKLIST = " \
+    ${mandir} \
+    ${docdir} \
+    ${infodir} \
+    ${datadir}/locale \
+    ${datadir}/applications \
+    ${datadir}/fonts \
+    ${datadir}/pixmaps \
+"
 
 sysroot_stage_dir() {
 	src="$1"
@@ -14,43 +48,18 @@ sysroot_stage_dir() {
 	)
 }
 
-sysroot_stage_libdir() {
-	src="$1"
-	dest="$2"
-
-	sysroot_stage_dir $src $dest
-}
-
 sysroot_stage_dirs() {
 	from="$1"
 	to="$2"
 
-	sysroot_stage_dir $from${includedir} $to${includedir}
-	if [ "${BUILD_SYS}" = "${HOST_SYS}" ]; then
-		sysroot_stage_dir $from${bindir} $to${bindir}
-		sysroot_stage_dir $from${sbindir} $to${sbindir}
-		sysroot_stage_dir $from${base_bindir} $to${base_bindir}
-		sysroot_stage_dir $from${base_sbindir} $to${base_sbindir}
-		sysroot_stage_dir $from${libexecdir} $to${libexecdir}
-		sysroot_stage_dir $from${sysconfdir} $to${sysconfdir}
-		sysroot_stage_dir $from${localstatedir} $to${localstatedir}
-	fi
-	if [ -d $from${libdir} ]
-	then
-		sysroot_stage_libdir $from${libdir} $to${libdir}
-	fi
-	if [ -d $from${base_libdir} ]
-	then
-		sysroot_stage_libdir $from${base_libdir} $to${base_libdir}
-	fi
-	if [ -d $from${nonarch_base_libdir} ]
-	then
-		sysroot_stage_libdir $from${nonarch_base_libdir} $to${nonarch_base_libdir}
-	fi
-	sysroot_stage_dir $from${datadir} $to${datadir}
-	# We don't care about docs/info/manpages/locales
-	rm -rf $to${mandir}/ $to${docdir}/ $to${infodir}/ ${to}${datadir}/locale/
-	rm -rf $to${datadir}/applications/ $to${datadir}/fonts/ $to${datadir}/pixmaps/
+	for dir in ${SYSROOT_DIRS}; do
+		sysroot_stage_dir "$from$dir" "$to$dir"
+	done
+
+	# Remove directories we do not care about
+	for dir in ${SYSROOT_DIRS_BLACKLIST}; do
+		rm -rf "$to$dir"
+	done
 }
 
 sysroot_stage_all() {
-- 
2.1.0


