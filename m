Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1TvD3G-00087K-AS
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Jan 2013 21:24:13 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 15 Jan 2013 12:08:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,475,1355126400"; d="scan'208";a="244286462"
Received: from sentry (HELO localhost.localdomain) ([10.237.105.30])
	by azsmga001.ch.intel.com with ESMTP; 15 Jan 2013 12:08:41 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2013 22:08:45 +0200
Message-Id: <1358280527-14078-2-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1358280527-14078-1-git-send-email-cristian.iorga@intel.com>
References: <1358280527-14078-1-git-send-email-cristian.iorga@intel.com>
Subject: [PATCH V4 1/3] connman: upgrade to 1.10
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
X-List-Received-Date: Tue, 15 Jan 2013 20:24:31 -0000

0002-storage.c-If-there-is-no-d_type-support-use-fstatat.patch
    - adapted to the new version

0001-timezone.c-If-there-is-no-d_type-support-use-fstatat.patch
    - patch removed (it is included in the new version)

inet-fix-ip-cleanup-functions.patch: added
    - fix for ip cleanup functions

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 ...If-there-is-no-d_type-support-use-fstatat.patch |   61 --------------------
 ...If-there-is-no-d_type-support-use-fstatat.patch |   38 +++++++-----
 .../connman/inet-fix-ip-cleanup-functions.patch    |   40 +++++++++++++
 .../connman/{connman_1.4.bb => connman_1.10.bb}    |    8 ++-
 4 files changed, 67 insertions(+), 80 deletions(-)
 delete mode 100644 meta/recipes-connectivity/connman/connman/0001-timezone.c-If-there-is-no-d_type-support-use-fstatat.patch
 create mode 100644 meta/recipes-connectivity/connman/connman/inet-fix-ip-cleanup-functions.patch
 rename meta/recipes-connectivity/connman/{connman_1.4.bb => connman_1.10.bb} (71%)

diff --git a/meta/recipes-connectivity/connman/connman/0001-timezone.c-If-there-is-no-d_type-support-use-fstatat.patch b/meta/recipes-connectivity/connman/connman/0001-timezone.c-If-there-is-no-d_type-support-use-fstatat.patch
deleted file mode 100644
index 3bced52..0000000
--- a/meta/recipes-connectivity/connman/connman/0001-timezone.c-If-there-is-no-d_type-support-use-fstatat.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From f2094e6b2e4542adf458d8fa58d7bccd5edb762e Mon Sep 17 00:00:00 2001
-From: Andrei Gherzan <andrei@gherzan.ro>
-Date: Tue, 17 Jul 2012 17:27:39 +0300
-Subject: [PATCH V3 1/2] timezone.c: If there is no d_type support use
- fstatat()
-
-This is useful for filesystems where d_type is always DT_UNKNOWN.
-In this case use fstatat() function.
-
-Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
-Upstream-Status: Submitted
- 
----
- src/timezone.c |   24 ++++++++++++++++++++++++
- 1 file changed, 24 insertions(+)
-
-diff --git a/src/timezone.c b/src/timezone.c
-index 173d658..f951f6b 100644
---- a/src/timezone.c
-+++ b/src/timezone.c
-@@ -157,6 +157,8 @@ static char *find_origin(void *src_map, struct stat *src_st,
- 	DIR *dir;
- 	struct dirent *d;
- 	char *str, pathname[PATH_MAX];
-+	struct stat buf;
-+	int ret;
- 
- 	if (subpath == NULL)
- 		strncpy(pathname, basepath, sizeof(pathname));
-@@ -205,6 +207,28 @@ static char *find_origin(void *src_map, struct stat *src_st,
- 				return str;
- 			}
- 			break;
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
-+			if (subpath == NULL)
-+				strncpy(pathname, d->d_name, sizeof(pathname));
-+			else
-+				snprintf(pathname, sizeof(pathname),
-+						"%s/%s", subpath, d->d_name);
-+
-+			str = find_origin(src_map, src_st, basepath, pathname);
-+			if (str != NULL) {
-+				closedir(dir);
-+				return str;
-+			}
-+			break;
- 		}
- 	}
- 
--- 
-1.7.9.5
-
diff --git a/meta/recipes-connectivity/connman/connman/0002-storage.c-If-there-is-no-d_type-support-use-fstatat.patch b/meta/recipes-connectivity/connman/connman/0002-storage.c-If-there-is-no-d_type-support-use-fstatat.patch
index d3205c0..7315545 100644
--- a/meta/recipes-connectivity/connman/connman/0002-storage.c-If-there-is-no-d_type-support-use-fstatat.patch
+++ b/meta/recipes-connectivity/connman/connman/0002-storage.c-If-there-is-no-d_type-support-use-fstatat.patch
@@ -8,20 +8,33 @@ This is useful for filesystems where d_type is always DT_UNKNOWN.
 In this case use fstatat() function.
 
 Signed-off-by: Andrei Gherzan <andrei.gherzan@windriver.com>
+Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
 Upstream-Status: Submitted
  
 ---
  src/storage.c |   19 +++++++++++++++++++
  1 file changed, 19 insertions(+)
 
-diff --git a/src/storage.c b/src/storage.c
-index 47bd0cb..0491a52 100644
---- a/src/storage.c
-+++ b/src/storage.c
-@@ -206,6 +206,25 @@ gchar **connman_storage_get_services()
+Index: git/src/storage.c
+===================================================================
+--- git.orig/src/storage.c
++++ git/src/storage.c
+@@ -193,7 +193,6 @@ gchar **connman_storage_get_services()
  
- 			g_string_append_printf(result, "%s/", d->d_name);
- 			break;
+ 		switch (d->d_type) {
+ 		case DT_DIR:
+-		case DT_UNKNOWN:
+ 			/*
+ 			 * If the settings file is not found, then
+ 			 * assume this directory is not a services dir.
+@@ -203,6 +202,25 @@ gchar **connman_storage_get_services()
+ 			ret = stat(str, &buf);
+ 			g_free(str);
+ 			if (ret < 0)
++				continue;
++
++			g_string_append_printf(result, "%s/", d->d_name);
++			break;
 +		case DT_UNKNOWN:
 +			/*
 +			 * If there is no d_type support use fstatat()
@@ -37,13 +50,6 @@ index 47bd0cb..0491a52 100644
 +			ret = stat(str, &buf);
 +			g_free(str);
 +			if (ret < 0)
-+				continue;
-+
-+			g_string_append_printf(result, "%s/", d->d_name);
-+			break;
- 		}
- 	}
+ 				continue;
  
--- 
-1.7.9.5
-
+ 			g_string_append_printf(result, "%s/", d->d_name);
diff --git a/meta/recipes-connectivity/connman/connman/inet-fix-ip-cleanup-functions.patch b/meta/recipes-connectivity/connman/connman/inet-fix-ip-cleanup-functions.patch
new file mode 100644
index 0000000..3071549
--- /dev/null
+++ b/meta/recipes-connectivity/connman/connman/inet-fix-ip-cleanup-functions.patch
@@ -0,0 +1,40 @@
+From 100353e10f60a50ca1ba78daa6bc4dfebf5b3297 Mon Sep 17 00:00:00 2001
+From: Constantin Musca <constantinx.musca@intel.com>
+Date: Wed, 5 Dec 2012 15:07:21 +0200
+Subject: [PATCH] inet: fix ip cleanup functions
+
+Upstream-Status: Pending
+Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
+---
+ src/inet.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/src/inet.c b/src/inet.c
+index be69aca..e76a1f1 100644
+--- a/src/inet.c
++++ b/src/inet.c
+@@ -626,6 +626,10 @@ int connman_inet_clear_ipv6_address(int index, const char *address,
+ 
+ 	DBG("index %d address %s prefix_len %d", index, address, prefix_len);
+ 
++	if (address == NULL) {
++		return -1;
++	}
++
+ 	err = __connman_inet_modify_address(RTM_DELADDR, 0, index, AF_INET6,
+ 				address, NULL, prefix_len, NULL);
+ 	if (err < 0) {
+@@ -649,6 +653,10 @@ int connman_inet_clear_address(int index, struct connman_ipaddress *ipaddress)
+ 
+ 	DBG("index %d address %s prefix_len %d", index, address, prefix_len);
+ 
++	if (address == NULL) {
++		return -1;
++	}
++
+ 	err = __connman_inet_modify_address(RTM_DELADDR, 0, index, AF_INET,
+ 				address, peer, prefix_len, broadcast);
+ 	if (err < 0) {
+-- 
+1.7.11.7
+
diff --git a/meta/recipes-connectivity/connman/connman_1.4.bb b/meta/recipes-connectivity/connman/connman_1.10.bb
similarity index 71%
rename from meta/recipes-connectivity/connman/connman_1.4.bb
rename to meta/recipes-connectivity/connman/connman_1.10.bb
index bd8ba65..10d5255 100644
--- a/meta/recipes-connectivity/connman/connman_1.4.bb
+++ b/meta/recipes-connectivity/connman/connman_1.10.bb
@@ -1,12 +1,14 @@
 require connman.inc
 
-# 1.4 tag
-SRCREV = "f701bbca259f1f35e68d338f31f5373f75f3da5f"
+# 1.10 tag
+SRCREV = "3bda76eb442c9395db1dba17352c3e78376671cc"
 SRC_URI  = "git://git.kernel.org/pub/scm/network/connman/connman.git \
             file://0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch \
             file://add_xuser_dbus_permission.patch \
             file://connman \
             file://0002-storage.c-If-there-is-no-d_type-support-use-fstatat.patch \
-            file://0001-timezone.c-If-there-is-no-d_type-support-use-fstatat.patch"
+            file://inet-fix-ip-cleanup-functions.patch"
 S = "${WORKDIR}/git"
 PR = "${INC_PR}.0"
+
+RRECOMMENDS_${PN} = "connman-conf"
-- 
1.7.10.4



