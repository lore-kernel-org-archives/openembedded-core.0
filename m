Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7A53B73177
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jan 2016 16:32:14 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Jan 2016 08:32:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,525,1444719600"; d="scan'208";a="884241709"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 05 Jan 2016 08:32:15 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id E3AEA6A4004
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jan 2016 09:20:12 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Jan 2016 18:34:13 +0200
Message-Id: <1452011653-10012-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH v2] bluez5: upgrade to 5.37
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
X-List-Received-Date: Tue, 05 Jan 2016 16:32:14 -0000

5.36 -> 5.37

Remove the backported patch:
core-profile-Fix-possible-crash-when-registering-pro.patch

Blacklist bluez5 only recipes when bluez4 is in DISTRO_FEATURES

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 ...e-Fix-possible-crash-when-registering-pro.patch | 54 ----------------------
 .../bluez5/{bluez5_5.36.bb => bluez5_5.37.bb}      |  7 +--
 2 files changed, 4 insertions(+), 57 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bluez5/bluez5/core-profile-Fix-possible-crash-when-registering-pro.patch
 rename meta/recipes-connectivity/bluez5/{bluez5_5.36.bb => bluez5_5.37.bb} (78%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5/core-profile-Fix-possible-crash-when-registering-pro.patch b/meta/recipes-connectivity/bluez5/bluez5/core-profile-Fix-possible-crash-when-registering-pro.patch
deleted file mode 100644
index 5c6cee1..0000000
--- a/meta/recipes-connectivity/bluez5/bluez5/core-profile-Fix-possible-crash-when-registering-pro.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From bc4dbda3362d3654447d8ae6525cac1540b7d705 Mon Sep 17 00:00:00 2001
-From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
-Date: Thu, 5 Nov 2015 15:14:50 +0200
-Subject: [PATCH] core/profile: Fix possible crash when registering profiles
-
-Upstream-Status: Backport
-
-Profiles under ext_profiles are local and should no be mixed with other
-external profiles since its type is different which can may cause invalid
-memory when accessing member of ext_profile struct.
----
- src/profile.c | 14 ++------------
- 1 file changed, 2 insertions(+), 12 deletions(-)
-
-diff --git a/src/profile.c b/src/profile.c
-index 49445d7..5a4f09c 100644
---- a/src/profile.c
-+++ b/src/profile.c
-@@ -719,19 +719,13 @@ void btd_profile_foreach(void (*func)(struct btd_profile *p, void *data),
- 
- int btd_profile_register(struct btd_profile *profile)
- {
--	if (profile->external)
--		ext_profiles = g_slist_append(ext_profiles, profile);
--	else
--		profiles = g_slist_append(profiles, profile);
-+	profiles = g_slist_append(profiles, profile);
- 	return 0;
- }
- 
- void btd_profile_unregister(struct btd_profile *profile)
- {
--	if (profile->external)
--		ext_profiles = g_slist_remove(ext_profiles, profile);
--	else
--		profiles = g_slist_remove(profiles, profile);
-+	profiles = g_slist_remove(profiles, profile);
- }
- 
- static struct ext_profile *find_ext_profile(const char *owner,
-@@ -742,10 +736,6 @@ static struct ext_profile *find_ext_profile(const char *owner,
- 	for (l = ext_profiles; l != NULL; l = g_slist_next(l)) {
- 		struct ext_profile *ext = l->data;
- 
--		/*
--		 * Owner and path can be NULL if profile was registered by a
--		 * plugin using external flag.
--		 */
- 		if (g_strcmp0(ext->owner, owner))
- 			continue;
- 
--- 
-2.5.0
-
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.36.bb b/meta/recipes-connectivity/bluez5/bluez5_5.37.bb
similarity index 78%
rename from meta/recipes-connectivity/bluez5/bluez5_5.36.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.37.bb
index 884bb77..a0a4e32 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.36.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.37.bb
@@ -1,8 +1,9 @@
 require bluez5.inc
 
-SRC_URI += "file://core-profile-Fix-possible-crash-when-registering-pro.patch"
-SRC_URI[md5sum] = "9a0ee479cacc44fac68f6a65b1cd3eba"
-SRC_URI[sha256sum] = "a343ea1aeb53d3bd139087f3b1c1e1fb70db452d9762cc7a3d23e75962e578f2"
+PNBLACKLIST[bluez5] ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluez4', 'bluez5 conflicts with bluez4 and bluez4 is selected in DISTRO_FEATURES', '', d)}"
+
+SRC_URI[md5sum] = "33177e5743e24b2b3738f72be64e3ffb"
+SRC_URI[sha256sum] = "c14ba9ddcb0055522073477b8fd8bf1ddf5d219e75fdfd4699b7e0ce5350d6b0"
 
 # noinst programs in Makefile.tools that are conditional on READLINE
 # support
-- 
2.4.0


