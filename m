Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1UBTNl-0003AS-UF
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Mar 2013 18:04:32 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 01 Mar 2013 08:46:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,762,1355126400"; d="scan'208";a="292377373"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.54])
	by orsmga002.jf.intel.com with ESMTP; 01 Mar 2013 08:48:02 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Mar 2013 18:48:26 +0200
Message-Id: <1362156507-10571-2-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1362156507-10571-1-git-send-email-cristian.iorga@intel.com>
References: <1362156507-10571-1-git-send-email-cristian.iorga@intel.com>
Subject: [PATCH 1/2] connman: upgrade to 1.12
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Mar 2013 17:04:34 -0000

- 0002-storage.c-If-there-is-no-d_type-support-use-fstatat.patch no longer needed;
fix included in package source code

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-connectivity/connman/connman.inc      |    2 +-
 ...If-there-is-no-d_type-support-use-fstatat.patch |   55 --------------------
 .../connman/{connman_1.10.bb => connman_1.12.bb}   |    5 +-
 3 files changed, 3 insertions(+), 59 deletions(-)
 delete mode 100644 meta/recipes-connectivity/connman/connman/0002-storage.c-If-there-is-no-d_type-support-use-fstatat.patch
 rename meta/recipes-connectivity/connman/{connman_1.10.bb => connman_1.12.bb} (72%)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index db4d26c..04b21f7 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -20,7 +20,7 @@ DEPENDS  = "dbus glib-2.0 ppp iptables gnutls \
             ${@base_contains('DISTRO_FEATURES', '3g','ofono', '', d)} \
             "
 
-INC_PR = "r18"
+INC_PR = "r0"
 
 TIST = "--enable-tist"
 TIST_powerpc = ""
diff --git a/meta/recipes-connectivity/connman/connman/0002-storage.c-If-there-is-no-d_type-support-use-fstatat.patch b/meta/recipes-connectivity/connman/connman/0002-storage.c-If-there-is-no-d_type-support-use-fstatat.patch
deleted file mode 100644
index 7315545..0000000
--- a/meta/recipes-connectivity/connman/connman/0002-storage.c-If-there-is-no-d_type-support-use-fstatat.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 7007ef32a959ac4717c19339a24fd90a68638a19 Mon Sep 17 00:00:00 2001
-From: Andrei Gherzan <andrei@gherzan.ro>
-Date: Tue, 17 Jul 2012 16:07:17 +0300
-Subject: [PATCH V3 2/2] storage.c: If there is no d_type support use
- fstatat()
-
-This is useful for filesystems where d_type is always DT_UNKNOWN.
-In this case use fstatat() function.
-
-Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
-Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
-Upstream-Status: Submitted
- 
----
- src/storage.c |   19 +++++++++++++++++++
- 1 file changed, 19 insertions(+)
-
-Index: git/src/storage.c
-===================================================================
---- git.orig/src/storage.c
-+++ git/src/storage.c
-@@ -193,7 +193,6 @@ gchar **connman_storage_get_services()
- 
- 		switch (d->d_type) {
- 		case DT_DIR:
--		case DT_UNKNOWN:
- 			/*
- 			 * If the settings file is not found, then
- 			 * assume this directory is not a services dir.
-@@ -203,6 +202,25 @@ gchar **connman_storage_get_services()
- 			ret = stat(str, &buf);
- 			g_free(str);
- 			if (ret < 0)
-+				continue;
-+
-+			g_string_append_printf(result, "%s/", d->d_name);
-+			break;
-+		case DT_UNKNOWN:
-+			/*
-+			 * If there is no d_type support use fstatat()
-+			 * to check if directory
-+			 */
-+			ret = fstatat(dirfd(dir), d->d_name, &buf, 0);
-+			if (ret < 0)
-+				continue;
-+			if (!(buf.st_mode & S_IFDIR))
-+				continue;
-+			str = g_strdup_printf("%s/%s/settings", STORAGEDIR,
-+							d->d_name);
-+			ret = stat(str, &buf);
-+			g_free(str);
-+			if (ret < 0)
- 				continue;
- 
- 			g_string_append_printf(result, "%s/", d->d_name);
diff --git a/meta/recipes-connectivity/connman/connman_1.10.bb b/meta/recipes-connectivity/connman/connman_1.12.bb
similarity index 72%
rename from meta/recipes-connectivity/connman/connman_1.10.bb
rename to meta/recipes-connectivity/connman/connman_1.12.bb
index 10d5255..5da50fe 100644
--- a/meta/recipes-connectivity/connman/connman_1.10.bb
+++ b/meta/recipes-connectivity/connman/connman_1.12.bb
@@ -1,12 +1,11 @@
 require connman.inc
 
-# 1.10 tag
-SRCREV = "3bda76eb442c9395db1dba17352c3e78376671cc"
+# 1.12 tag
+SRCREV = "8397cbbc0a79d39cf3b1880f4fd3f3405b6bc6ad"
 SRC_URI  = "git://git.kernel.org/pub/scm/network/connman/connman.git \
             file://0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch \
             file://add_xuser_dbus_permission.patch \
             file://connman \
-            file://0002-storage.c-If-there-is-no-d_type-support-use-fstatat.patch \
             file://inet-fix-ip-cleanup-functions.patch"
 S = "${WORKDIR}/git"
 PR = "${INC_PR}.0"
-- 
1.7.10.4



