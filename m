Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 38AC760124
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Dec 2015 13:04:42 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 07 Dec 2015 05:04:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,394,1444719600"; d="scan'208";a="855581547"
Received: from sentry.rb.intel.com ([10.237.105.108])
	by fmsmga001.fm.intel.com with ESMTP; 07 Dec 2015 05:04:42 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Dec 2015 15:06:03 +0200
Message-Id: <1449493563-32455-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH V2] bluez5: upgrade to 5.36
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
X-List-Received-Date: Mon, 07 Dec 2015 13:04:43 -0000

Backported a fix for a segfault crash.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc        |  1 +
 ...e-Fix-possible-crash-when-registering-pro.patch | 54 ++++++++++++++++++++++
 .../bluez5/{bluez5_5.33.bb => bluez5_5.36.bb}      |  4 +-
 3 files changed, 57 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/core-profile-Fix-possible-crash-when-registering-pro.patch
 rename meta/recipes-connectivity/bluez5/{bluez5_5.33.bb => bluez5_5.36.bb} (88%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 13fd600..529d5a6 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -18,6 +18,7 @@ PACKAGECONFIG[experimental] = "--enable-experimental,--disable-experimental,"
 
 SRC_URI = "\
     ${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
+    file://core-profile-Fix-possible-crash-when-registering-pro.patch \
     file://init \
 "
 S = "${WORKDIR}/bluez-${PV}"
diff --git a/meta/recipes-connectivity/bluez5/bluez5/core-profile-Fix-possible-crash-when-registering-pro.patch b/meta/recipes-connectivity/bluez5/bluez5/core-profile-Fix-possible-crash-when-registering-pro.patch
new file mode 100644
index 0000000..5c6cee1
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/core-profile-Fix-possible-crash-when-registering-pro.patch
@@ -0,0 +1,54 @@
+From bc4dbda3362d3654447d8ae6525cac1540b7d705 Mon Sep 17 00:00:00 2001
+From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
+Date: Thu, 5 Nov 2015 15:14:50 +0200
+Subject: [PATCH] core/profile: Fix possible crash when registering profiles
+
+Upstream-Status: Backport
+
+Profiles under ext_profiles are local and should no be mixed with other
+external profiles since its type is different which can may cause invalid
+memory when accessing member of ext_profile struct.
+---
+ src/profile.c | 14 ++------------
+ 1 file changed, 2 insertions(+), 12 deletions(-)
+
+diff --git a/src/profile.c b/src/profile.c
+index 49445d7..5a4f09c 100644
+--- a/src/profile.c
++++ b/src/profile.c
+@@ -719,19 +719,13 @@ void btd_profile_foreach(void (*func)(struct btd_profile *p, void *data),
+ 
+ int btd_profile_register(struct btd_profile *profile)
+ {
+-	if (profile->external)
+-		ext_profiles = g_slist_append(ext_profiles, profile);
+-	else
+-		profiles = g_slist_append(profiles, profile);
++	profiles = g_slist_append(profiles, profile);
+ 	return 0;
+ }
+ 
+ void btd_profile_unregister(struct btd_profile *profile)
+ {
+-	if (profile->external)
+-		ext_profiles = g_slist_remove(ext_profiles, profile);
+-	else
+-		profiles = g_slist_remove(profiles, profile);
++	profiles = g_slist_remove(profiles, profile);
+ }
+ 
+ static struct ext_profile *find_ext_profile(const char *owner,
+@@ -742,10 +736,6 @@ static struct ext_profile *find_ext_profile(const char *owner,
+ 	for (l = ext_profiles; l != NULL; l = g_slist_next(l)) {
+ 		struct ext_profile *ext = l->data;
+ 
+-		/*
+-		 * Owner and path can be NULL if profile was registered by a
+-		 * plugin using external flag.
+-		 */
+ 		if (g_strcmp0(ext->owner, owner))
+ 			continue;
+ 
+-- 
+2.5.0
+
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.33.bb b/meta/recipes-connectivity/bluez5/bluez5_5.36.bb
similarity index 88%
rename from meta/recipes-connectivity/bluez5/bluez5_5.33.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.36.bb
index 23c7397..b94ed31 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.33.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.36.bb
@@ -1,6 +1,6 @@
 require bluez5.inc
-SRC_URI[md5sum] = "78782dc33d9a8b6344c4cc1af70c8a98"
-SRC_URI[sha256sum] = "1801807a13506678cbfeb15c6a4b89ecb5739efe1067eb464da6641d731436d3"
+SRC_URI[md5sum] = "9a0ee479cacc44fac68f6a65b1cd3eba"
+SRC_URI[sha256sum] = "a343ea1aeb53d3bd139087f3b1c1e1fb70db452d9762cc7a3d23e75962e578f2"
 
 # noinst programs in Makefile.tools that are conditional on READLINE
 # support
-- 
2.5.0


