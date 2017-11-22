Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E4C5B786FA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Nov 2017 16:32:11 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Nov 2017 08:32:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,436,1505804400"; d="scan'208";a="179367880"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 22 Nov 2017 08:32:12 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Nov 2017 18:32:28 +0200
Message-Id: <20171122163233.10292-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.0
Subject: [PATCH 1/6] meta-selftest: fix upstream version checks for devtool test recipes
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
X-List-Received-Date: Wed, 22 Nov 2017 16:32:12 -0000

So that they're reported correctly when checking 'universe' for
latest upstream versions.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta-selftest/recipes-test/devtool/devtool-test-patch-gz.bb       | 1 +
 meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb | 2 ++
 meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb   | 2 ++
 3 files changed, 5 insertions(+)

diff --git a/meta-selftest/recipes-test/devtool/devtool-test-patch-gz.bb b/meta-selftest/recipes-test/devtool/devtool-test-patch-gz.bb
index e45ee9f60a0..fc3799590cc 100644
--- a/meta-selftest/recipes-test/devtool/devtool-test-patch-gz.bb
+++ b/meta-selftest/recipes-test/devtool/devtool-test-patch-gz.bb
@@ -6,6 +6,7 @@ DEPENDS = "libxres libxext virtual/libx11 ncurses"
 SRC_URI = "http://downloads.yoctoproject.org/releases/xrestop/xrestop-0.4.tar.gz \
            file://readme.patch.gz \
            "
+UPSTREAM_VERSION_UNKNOWN = "1"
 
 S = "${WORKDIR}/xrestop-0.4"
 
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb b/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb
index 4049be292b4..333ecac7ed8 100644
--- a/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test1_1.5.3.bb
@@ -4,6 +4,8 @@ LIC_FILES_CHKSUM = "file://doc/COPYING;md5=9c50db2589ee3ef10a9b7b2e50ce1d02"
 
 SRC_URI = "http://www.ivarch.com/programs/sources/pv-${PV}.tar.gz \
            file://0001-Add-a-note-line-to-the-quick-reference.patch"
+UPSTREAM_CHECK_URI = "http://www.ivarch.com/programs/pv.shtml"
+RECIPE_NO_UPDATE_REASON = "This recipe is used to test devtool upgrade feature"
 
 SRC_URI[md5sum] = "9365d86bd884222b4bf1039b5a9ed1bd"
 SRC_URI[sha256sum] = "681bcca9784bf3cb2207e68236d1f68e2aa7b80f999b5750dc77dcd756e81fbc"
diff --git a/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb
index 450636ef182..07b83276fb9 100644
--- a/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb
+++ b/meta-selftest/recipes-test/devtool/devtool-upgrade-test2_git.bb
@@ -12,6 +12,8 @@ PV = "0.1+git${SRCPV}"
 PR = "r2"
 
 SRC_URI = "git://git.yoctoproject.org/dbus-wait"
+UPSTREAM_CHECK_COMMITS = "1"
+RECIPE_NO_UPDATE_REASON = "This recipe is used to test devtool upgrade feature"
 
 S = "${WORKDIR}/git"
 
-- 
2.15.0


