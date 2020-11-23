Received: from mga07.intel.com (mga07.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.36702.1606144038537265324
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2020 07:07:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: NQDdazFy3PsSph/wsbTDK/2Q4hCwldJhCBRh8fwjfHG3TdBH84aqe6kYS5wAjATdmqcsnjjIUf
 esOEn8WFYpUw==
X-IronPort-AV: E=McAfee;i="6000,8403,9813"; a="235920744"
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; 
   d="scan'208";a="235920744"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 07:07:28 -0800
IronPort-SDR: aVh2LdFpgI05l8nCKN8pkKaUkvRoBC5KscQeP03gN2mbD1lEzjoXKQle32WvT5zTwYLEwdx6sr
 jneHPMxdkX2A==
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; 
   d="scan'208";a="361475236"
Received: from kpteh-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.244.15])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 07:07:27 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 17/21] roofs_*.bbclass: fix missing vardeps for do_rootfs
Date: Mon, 23 Nov 2020 23:06:47 +0800
Message-Id: <14165724d41a5d00384a9db60b49b37ac4f3b40f.1606111370.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1606111370.git.anuj.mittal@intel.com>
References: <cover.1606111370.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Loic Domaigne <tech@domaigne.com>

As per lib/oe/rootfs.py and lib/oe/package_manager/???/__init__.py
the PACKAGE_FEED baseurl is defined as the joined paths of:
URIS/BASE_PATHS/ARCHS

Therefore, the do_rootfs task should depend furthermore on
PACKAGE_FEED_{BASE_PATHS,ARCHS} to properly retrigger a build if
the value changes.

Signed-off-by: Loic Domaigne (ljd) <tech@domaigne.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e5329464f5ebad909c4c9bd27a718bbd8f4cc221)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/classes/rootfs_deb.bbclass | 2 +-
 meta/classes/rootfs_ipk.bbclass | 2 +-
 meta/classes/rootfs_rpm.bbclass | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/rootfs_deb.bbclass b/meta/classes/rootfs_deb.bbclass
index 2b93796a76..ef616da229 100644
--- a/meta/classes/rootfs_deb.bbclass
+++ b/meta/classes/rootfs_deb.bbclass
@@ -7,7 +7,7 @@ ROOTFS_PKGMANAGE = "dpkg apt"
 do_rootfs[depends] += "dpkg-native:do_populate_sysroot apt-native:do_populate_sysroot"
 do_populate_sdk[depends] += "dpkg-native:do_populate_sysroot apt-native:do_populate_sysroot bzip2-native:do_populate_sysroot"
 do_rootfs[recrdeptask] += "do_package_write_deb do_package_qa"
-do_rootfs[vardeps] += "PACKAGE_FEED_URIS"
+do_rootfs[vardeps] += "PACKAGE_FEED_URIS PACKAGE_FEED_BASE_PATHS PACKAGE_FEED_ARCHS"
 
 do_rootfs[lockfiles] += "${DEPLOY_DIR_DEB}/deb.lock"
 do_populate_sdk[lockfiles] += "${DEPLOY_DIR_DEB}/deb.lock"
diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index e73d2bfdae..f1e0219732 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -11,7 +11,7 @@ ROOTFS_PKGMANAGE = "opkg ${EXTRAOPKGCONFIG}"
 do_rootfs[depends] += "opkg-native:do_populate_sysroot opkg-utils-native:do_populate_sysroot"
 do_populate_sdk[depends] += "opkg-native:do_populate_sysroot opkg-utils-native:do_populate_sysroot"
 do_rootfs[recrdeptask] += "do_package_write_ipk do_package_qa"
-do_rootfs[vardeps] += "PACKAGE_FEED_URIS"
+do_rootfs[vardeps] += "PACKAGE_FEED_URIS PACKAGE_FEED_BASE_PATHS PACKAGE_FEED_ARCHS"
 
 do_rootfs[lockfiles] += "${WORKDIR}/ipk.lock"
 do_populate_sdk[lockfiles] += "${WORKDIR}/ipk.lock"
diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index 82584f386c..0af7d65b1a 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -24,7 +24,7 @@ do_rootfs[depends] += "${RPMROOTFSDEPENDS}"
 do_populate_sdk[depends] += "${RPMROOTFSDEPENDS}"
 
 do_rootfs[recrdeptask] += "do_package_write_rpm do_package_qa"
-do_rootfs[vardeps] += "PACKAGE_FEED_URIS"
+do_rootfs[vardeps] += "PACKAGE_FEED_URIS PACKAGE_FEED_BASE_PATHS PACKAGE_FEED_ARCHS"
 
 python () {
     if d.getVar('BUILD_IMAGES_FROM_FEEDS'):
-- 
2.28.0

