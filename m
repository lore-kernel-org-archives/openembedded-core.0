Received: from wp115.webpack.hosteurope.de (wp115.webpack.hosteurope.de [80.237.132.122])
 by mx.groups.io with SMTP id smtpd.web09.41826.1605561886469884359
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2020 13:24:46 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: domaigne.com, ip: 80.237.132.122, mailfrom: tech@domaigne.com)
Received: from ipb21a8083.dynamic.kabel-deutschland.de ([178.26.128.131] helo=localhost.localdomain); authenticated
	by wp115.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	id 1kelzQ-0004Ia-OG; Mon, 16 Nov 2020 22:24:44 +0100
From: "Loic Domaigne" <tech@domaigne.com>
To: openembedded-core@lists.openembedded.org
Cc: "Loic Domaigne (ljd)" <tech@domaigne.com>
Subject: [PATCH] roofs_*.bbclass: fix missing vardeps for do_rootfs
Date: Mon, 16 Nov 2020 22:24:39 +0100
Message-Id: <20201116212439.276364-1-tech@domaigne.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-bounce-key: webpack.hosteurope.de;tech@domaigne.com;1605561886;ea854c54;
X-HE-SMSGID: 1kelzQ-0004Ia-OG
Content-Transfer-Encoding: 8bit

As per lib/oe/rootfs.py and lib/oe/package_manager/???/__init__.py
the PACKAGE_FEED baseurl is defined as the joined paths of:
URIS/BASE_PATHS/ARCHS

Therefore, the do_rootfs task should depend furthermore on
PACKAGE_FEED_{BASE_PATHS,ARCHS} to properly retrigger a build if
the value changes.

Signed-off-by: Loic Domaigne (ljd) <tech@domaigne.com>
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
2.25.4

