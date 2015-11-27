Return-Path: <mcrowe@brightsign.biz>
Received: from relay.appriver.com (relay.appriver.com [207.97.230.34])
	by mail.openembedded.org (Postfix) with ESMTP id EB72F6012A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 14:50:33 +0000 (UTC)
Received: from [86.30.112.98] (HELO elite.brightsign)
	by relay.appriver.com (CommuniGate Pro SMTP 6.1.2)
	with ESMTP id 647152509; Fri, 27 Nov 2015 09:50:32 -0500
Received: from chuckie.brightsign ([172.30.1.25] helo=chuckie)
	by elite.brightsign with esmtp (Exim 4.84)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1a2KM2-000EWP-KC; Fri, 27 Nov 2015 14:50:30 +0000
Received: from mac by chuckie with local (Exim 4.84)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1a2KM2-0005PV-Io; Fri, 27 Nov 2015 14:50:30 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Nov 2015 14:50:27 +0000
Message-Id: <1448635827-20634-1-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 2.1.4
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH] icu: Upgrade 55.1 -> 56.1
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
X-List-Received-Date: Fri, 27 Nov 2015 14:50:40 -0000

Upgrade ICU from v55.1 to v56.1 and backport a later patch that is
necessary to avoid errors during the build.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 .../icu/icu/icu-release-56-1-flagparser-fix.patch  | 24 ++++++++++++++++++++++
 .../icu/{icu_55.1.bb => icu_56.1.bb}               |  5 +++--
 2 files changed, 27 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/icu/icu/icu-release-56-1-flagparser-fix.patch
 rename meta/recipes-support/icu/{icu_55.1.bb => icu_56.1.bb} (74%)

diff --git a/meta/recipes-support/icu/icu/icu-release-56-1-flagparser-fix.patch b/meta/recipes-support/icu/icu/icu-release-56-1-flagparser-fix.patch
new file mode 100644
index 0000000..1519d84
--- /dev/null
+++ b/meta/recipes-support/icu/icu/icu-release-56-1-flagparser-fix.patch
@@ -0,0 +1,24 @@
+icu: Ticket #11959: pkgdata dies when compiled with lots'o'flags
+
+See: http://bugs.icu-project.org/trac/ticket/11959
+
+The patch avoids premature failure which results in a segfault.
+
+Upstream-Status: Backport of r38081
+Signed-off-by: Mike Crowe <mac@mcrowe.com>
+
+Index: source/tools/toolutil/flagparser.c
+===================================================================
+--- source/tools/toolutil/flagparser.c	(revision 38046)
++++ source/tools/toolutil/flagparser.c	(working copy)
+@@ -96,8 +96,8 @@
+     uprv_free(buffer);
+ 
+     T_FileStream_close(f);
+-    
+-    if (U_FAILURE(*status)) {
++
++    if (U_FAILURE(*status) && *status != U_BUFFER_OVERFLOW_ERROR) {
+         return -1;
+     }
+ 
diff --git a/meta/recipes-support/icu/icu_55.1.bb b/meta/recipes-support/icu/icu_56.1.bb
similarity index 74%
rename from meta/recipes-support/icu/icu_55.1.bb
rename to meta/recipes-support/icu/icu_56.1.bb
index 2661fd3..4b16b5c 100644
--- a/meta/recipes-support/icu/icu_55.1.bb
+++ b/meta/recipes-support/icu/icu_56.1.bb
@@ -12,11 +12,12 @@ BASE_SRC_URI = "http://download.icu-project.org/files/icu4c/${PV}/icu4c-${ICU_PV
 SRC_URI = "${BASE_SRC_URI} \
            file://icu-pkgdata-large-cmd.patch \
            file://fix-install-manx.patch \
+           file://icu-release-56-1-flagparser-fix.patch \
           "
 
 SRC_URI_append_class-target = "\
            file://0001-Disable-LDFLAGSICUDT-for-Linux.patch \
           "
-SRC_URI[md5sum] = "e2d523df79d6cb7855c2fbe284f4db29"
-SRC_URI[sha256sum] = "e16b22cbefdd354bec114541f7849a12f8fc2015320ca5282ee4fd787571457b"
+SRC_URI[md5sum] = "c4a2d71ff56aec5ebfab2a3f059be99d"
+SRC_URI[sha256sum] = "3a64e9105c734dcf631c0b3ed60404531bce6c0f5a64bfe1a6402a4cc2314816"
 
-- 
2.1.4


