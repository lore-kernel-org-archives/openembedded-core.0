Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1T20ft-0000SJ-2b
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 16:03:50 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 16 Aug 2012 06:50:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,778,1336374000"; d="scan'208";a="134986172"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.33])
	by AZSMGA002.ch.intel.com with ESMTP; 16 Aug 2012 06:50:50 -0700
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Aug 2012 15:55:20 +0300
Message-Id: <1345121720-25925-7-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1345121720-25925-1-git-send-email-constantinx.musca@intel.com>
References: <1345121720-25925-1-git-send-email-constantinx.musca@intel.com>
Cc: Constantin Musca <constantinx.musca@intel.com>
Subject: [PATCH 6/6] connman: upgrade to 1.4
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Aug 2012 14:03:50 -0000

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 ...ck-that-the-string-isn-t-empty-before-spl.patch |   37 --------------------
 .../connman/{connman_1.3.bb => connman_1.4.bb}     |    9 +++--
 2 files changed, 4 insertions(+), 42 deletions(-)
 delete mode 100644 meta/recipes-connectivity/connman/connman/0001-storage-check-that-the-string-isn-t-empty-before-spl.patch
 rename meta/recipes-connectivity/connman/{connman_1.3.bb => connman_1.4.bb} (69%)

diff --git a/meta/recipes-connectivity/connman/connman/0001-storage-check-that-the-string-isn-t-empty-before-spl.patch b/meta/recipes-connectivity/connman/connman/0001-storage-check-that-the-string-isn-t-empty-before-spl.patch
deleted file mode 100644
index c92b586..0000000
--- a/meta/recipes-connectivity/connman/connman/0001-storage-check-that-the-string-isn-t-empty-before-spl.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From ea8c7b3efce4c1762411e073893e948de5d552d6 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Tue, 17 Jul 2012 16:04:12 +0100
-Subject: [PATCH] storage: check that the string isn't empty before splitting
-
-If the string was non-NULL but empty (str="\0"), the following \0 assignment
-would write to str[-1] and thus cause memory corruption.
-
-On PPC and MIPS, this was causing crashes in glibc.
-
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-Upstream-Status: Submitted
- 
----
- src/storage.c |    6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/src/storage.c b/src/storage.c
-index 47bd0cb..20766a3 100644
---- a/src/storage.c
-+++ b/src/storage.c
-@@ -212,7 +212,11 @@ gchar **connman_storage_get_services()
- 	closedir(dir);
- 
- 	str = g_string_free(result, FALSE);
--	if (str) {
-+	if (str && str[0] != '\0') {
-+		/*
-+		 * Remove the trailing separator so that services doesn't end up
-+		 * with an empty element.
-+		 */
- 		str[strlen(str) - 1] = '\0';
- 		services = g_strsplit(str, "/", -1);
- 	}
--- 
-1.7.10.4
-
diff --git a/meta/recipes-connectivity/connman/connman_1.3.bb b/meta/recipes-connectivity/connman/connman_1.4.bb
similarity index 69%
rename from meta/recipes-connectivity/connman/connman_1.3.bb
rename to meta/recipes-connectivity/connman/connman_1.4.bb
index 4d82794..bd8ba65 100644
--- a/meta/recipes-connectivity/connman/connman_1.3.bb
+++ b/meta/recipes-connectivity/connman/connman_1.4.bb
@@ -1,13 +1,12 @@
 require connman.inc
 
-# 1.3 tag
-SRCREV = "3c0fa84091524c7cd6237744f2088ffee2f1d5ad"
+# 1.4 tag
+SRCREV = "f701bbca259f1f35e68d338f31f5373f75f3da5f"
 SRC_URI  = "git://git.kernel.org/pub/scm/network/connman/connman.git \
             file://0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch \
             file://add_xuser_dbus_permission.patch \
             file://connman \
             file://0002-storage.c-If-there-is-no-d_type-support-use-fstatat.patch \
-            file://0001-timezone.c-If-there-is-no-d_type-support-use-fstatat.patch \
-            file://0001-storage-check-that-the-string-isn-t-empty-before-spl.patch"
+            file://0001-timezone.c-If-there-is-no-d_type-support-use-fstatat.patch"
 S = "${WORKDIR}/git"
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.0"
-- 
1.7.9.5



