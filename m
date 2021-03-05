Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.7839.1614918154051973024
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 20:22:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: wtAV3orj8ZTbcKmBLyfQHpylZiTRJxepCbAhPFlMcXCeQljLq7Bt/czoU8HF3awbowHDEeXcgq
 M7PYHUWEBpIA==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="187671166"
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="187671166"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:51 -0800
IronPort-SDR: eXV5FFwF26t5E13L6beSObYjHUF8hxaooNcLXm8LVNfI0JmrVBAbUdJ17zBLAnRk3GLtC2dBqY
 7nrUbX9j9vGQ==
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="408129093"
Received: from selvan2x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.249])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:50 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 39/52] epiphany: Fix reproducibility issue
Date: Fri,  5 Mar 2021 12:21:15 +0800
Message-Id: <5004bee2e5b1ea903b9a935ce439bc9eb0896974.1614917620.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614917620.git.anuj.mittal@intel.com>
References: <cover.1614917620.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We don't want to encide BUILD_ROOT into target packages. This is used
for build time tests but in our case those would be on target anyway
do use the target paths.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 2818dc90bd62487879e7da2c68357b39282415b0)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../recipes-gnome/epiphany/epiphany_3.36.4.bb |  1 +
 .../epiphany/files/migrator.patch             | 24 +++++++++++++++++++
 2 files changed, 25 insertions(+)
 create mode 100644 meta/recipes-gnome/epiphany/files/migrator.patch

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.36.4.bb b/meta/recipes-gnome/epiphany/epiphany_3.36.4.bb
index 4c3b18331a..dcb337f4cb 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.36.4.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.36.4.bb
@@ -13,6 +13,7 @@ REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
 SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
            file://0002-help-meson.build-disable-the-use-of-yelp.patch \
+           file://migrator.patch \
            "
 SRC_URI[archive.sha256sum] = "588a75b1588f5a509c33cf0be6a38a0f4fc1748eeb499a51d991ddef485242bf"
 
diff --git a/meta/recipes-gnome/epiphany/files/migrator.patch b/meta/recipes-gnome/epiphany/files/migrator.patch
new file mode 100644
index 0000000000..a9a650a64a
--- /dev/null
+++ b/meta/recipes-gnome/epiphany/files/migrator.patch
@@ -0,0 +1,24 @@
+We don't want to encide BUILD_ROOT into target packages. This is used
+for build time tests but in our case those would be on target anyway
+do use the target paths.
+
+Upstream-Status: Pending
+RP 2021/2/25
+
+Index: epiphany-3.38.2/lib/ephy-profile-utils.c
+===================================================================
+--- epiphany-3.38.2.orig/lib/ephy-profile-utils.c
++++ epiphany-3.38.2/lib/ephy-profile-utils.c
+@@ -130,10 +130,10 @@ ephy_profile_utils_do_migration (const c
+   argv[i++] = NULL;
+ 
+ #if DEVELOPER_MODE
+-  argv[0] = BUILD_ROOT "/src/" EPHY_PROFILE_MIGRATOR;
++  argv[0] = PKGLIBEXECDIR "/" EPHY_PROFILE_MIGRATOR;
+ #else
+   if (debug)
+-    argv[0] = BUILD_ROOT "/src/" EPHY_PROFILE_MIGRATOR;
++    argv[0] = PKGLIBEXECDIR "/" EPHY_PROFILE_MIGRATOR;
+ #endif
+ 
+   g_spawn_sync (NULL, (char **)argv, envp, G_SPAWN_SEARCH_PATH,
-- 
2.29.2

