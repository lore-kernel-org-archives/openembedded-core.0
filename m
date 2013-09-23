Return-Path: <laurentiu.palcu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id A85C8610FF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2013 09:31:50 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 23 Sep 2013 02:31:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,961,1371106800"; d="scan'208";a="399635793"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by fmsmga001.fm.intel.com with ESMTP; 23 Sep 2013 02:31:49 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2013 12:31:45 +0300
Message-Id: <f2f7d42ff33d48bdd89ab2f55983ebd9c0579c09.1379928510.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1379928510.git.laurentiu.palcu@intel.com>
References: <cover.1379928510.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1379928510.git.laurentiu.palcu@intel.com>
References: <cover.1379928510.git.laurentiu.palcu@intel.com>
Subject: [PATCH 1/1] package_deb, apt.conf: fix apt failure in do_rootfs()
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
X-List-Received-Date: Mon, 23 Sep 2013 09:31:50 -0000

The changes in this commit, dc5f6c3898555b59f16bf809ae4c5418656e6ac9,
moved apt config directory from native SYSROOT to WORKDIR.
Unfortunately, Dir::Etc in apt.conf was not changed accordingly and
sources.list file could not be found during do_rootfs().

This commit fixes this issue.

[YOCTO #5241]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/package_deb.bbclass         |    1 +
 meta/recipes-devtools/apt/files/apt.conf |    2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 765e894..6a8e080 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -100,6 +100,7 @@ package_install_internal_deb () {
 	cat "${STAGING_ETCDIR_NATIVE}/apt/apt.conf.sample" \
 		| sed -e "s#Architecture \".*\";#Architecture \"${dpkg_arch}\";#" \
 		| sed -e "s:#ROOTFS#:${target_rootfs}:g" \
+		| sed -e "s:#APTCONF#:${APTCONF_TARGET}/apt:g" \
 		> "${APTCONF_TARGET}/apt/apt.conf"
 
 	export APT_CONFIG="${APTCONF_TARGET}/apt/apt.conf"
diff --git a/meta/recipes-devtools/apt/files/apt.conf b/meta/recipes-devtools/apt/files/apt.conf
index 5c20ea4..5058650 100644
--- a/meta/recipes-devtools/apt/files/apt.conf
+++ b/meta/recipes-devtools/apt/files/apt.conf
@@ -21,7 +21,7 @@ Dir "${STAGING_DIR_NATIVE}/"
       apt-get "apt-get";
       apt-cache "apt-cache";
    };
-   Etc "etc/apt/"
+   Etc "#APTCONF#"
    {
       Preferences "preferences";
    };
-- 
1.7.9.5


