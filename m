Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 723D17318F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 14:49:55 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 03 May 2016 07:49:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,572,1455004800"; d="scan'208";a="696140397"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 03 May 2016 07:49:57 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id B3C336A4006
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 08:37:30 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 May 2016 17:49:45 +0300
Message-Id: <1462286989-22848-7-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1462286989-22848-1-git-send-email-maxin.john@intel.com>
References: <1462286989-22848-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 06/10] mc: upgrade to 4.8.16
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
X-List-Received-Date: Tue, 03 May 2016 14:49:55 -0000

4.8.15 -> 4.8.16

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-extended/mc/mc_4.8.15.bb | 49 -----------------------------------
 meta/recipes-extended/mc/mc_4.8.16.bb | 49 +++++++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+), 49 deletions(-)
 delete mode 100644 meta/recipes-extended/mc/mc_4.8.15.bb
 create mode 100644 meta/recipes-extended/mc/mc_4.8.16.bb

diff --git a/meta/recipes-extended/mc/mc_4.8.15.bb b/meta/recipes-extended/mc/mc_4.8.15.bb
deleted file mode 100644
index 6c3a16a..0000000
--- a/meta/recipes-extended/mc/mc_4.8.15.bb
+++ /dev/null
@@ -1,49 +0,0 @@
-SUMMARY = "Midnight Commander is an ncurses based file manager"
-HOMEPAGE = "http://www.midnight-commander.org/"
-LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=270bbafe360e73f9840bd7981621f9c2"
-SECTION = "console/utils"
-DEPENDS = "ncurses glib-2.0 util-linux"
-RDEPENDS_${PN} = "ncurses-terminfo"
-
-SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2 \
-           "
-SRC_URI[md5sum] = "db48ce26ba425a61edc51930e94227fd"
-SRC_URI[sha256sum] = "f74e3da70410975cdeb27ee9a66d1dd812250b6d3ede364bca728dd5a48e5471"
-
-inherit autotools gettext pkgconfig
-
-#
-# Both Samba (smb) and sftp require package delivered from meta-openembedded
-#
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[smb] = "--enable-vfs-smb,--disable-vfs-smb,samba,"
-PACKAGECONFIG[sftp] = "--enable-vfs-sftp,--disable-vfs-sftp,libssh2,"
-
-EXTRA_OECONF = "--with-screen=ncurses --without-gpm-mouse --without-x"
-
-do_install_append () {
-	sed -i -e '1s,#!.*perl,#!${bindir}/env perl,' ${D}${libexecdir}/mc/extfs.d/*
-	sed -i -e '1s,#!.*python,#!${bindir}/env python,' ${D}${libexecdir}/mc/extfs.d/*
-}
-
-PACKAGES =+ "${BPN}-helpers-perl ${BPN}-helpers-python ${BPN}-helpers ${BPN}-fish"
-
-SUMMARY_${BPN}-helpers-perl = "Midnight Commander Perl-based helper scripts"
-FILES_${BPN}-helpers-perl = "${libexecdir}/mc/extfs.d/a+ ${libexecdir}/mc/extfs.d/apt+ \
-                             ${libexecdir}/mc/extfs.d/deb ${libexecdir}/mc/extfs.d/deba \
-                             ${libexecdir}/mc/extfs.d/debd ${libexecdir}/mc/extfs.d/dpkg+ \
-                             ${libexecdir}/mc/extfs.d/mailfs ${libexecdir}/mc/extfs.d/patchfs \ 
-                             ${libexecdir}/mc/extfs.d/rpms+ ${libexecdir}/mc/extfs.d/ulib \ 
-                             ${libexecdir}/mc/extfs.d/uzip"
-RDEPENDS_${BPN}-helpers-perl = "perl"
-
-SUMMARY_${BPN}-helpers-python = "Midnight Commander Python-based helper scripts"
-FILES_${BPN}-helpers-python = "${libexecdir}/mc/extfs.d/s3+ ${libexecdir}/mc/extfs.d/uc1541"
-RDEPENDS_${BPN}-helpers-python = "python"
-
-SUMMARY_${BPN}-helpers = "Midnight Commander shell helper scripts"
-FILES_${BPN}-helpers = "${libexecdir}/mc/extfs.d/* ${libexecdir}/mc/ext.d/*"
-
-SUMMARY_${BPN}-fish = "Midnight Commander Fish scripts"
-FILES_${BPN}-fish = "${libexecdir}/mc/fish"
diff --git a/meta/recipes-extended/mc/mc_4.8.16.bb b/meta/recipes-extended/mc/mc_4.8.16.bb
new file mode 100644
index 0000000..16ed6a9
--- /dev/null
+++ b/meta/recipes-extended/mc/mc_4.8.16.bb
@@ -0,0 +1,49 @@
+SUMMARY = "Midnight Commander is an ncurses based file manager"
+HOMEPAGE = "http://www.midnight-commander.org/"
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=270bbafe360e73f9840bd7981621f9c2"
+SECTION = "console/utils"
+DEPENDS = "ncurses glib-2.0 util-linux"
+RDEPENDS_${PN} = "ncurses-terminfo"
+
+SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2 \
+           "
+SRC_URI[md5sum] = "b93706dfe66ffe4f61c1a2650798d207"
+SRC_URI[sha256sum] = "c37ea495df93f6d375a3ce59cdcf0f3a3690338526205347b03a316daebdaaf8"
+
+inherit autotools gettext pkgconfig
+
+#
+# Both Samba (smb) and sftp require package delivered from meta-openembedded
+#
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[smb] = "--enable-vfs-smb,--disable-vfs-smb,samba,"
+PACKAGECONFIG[sftp] = "--enable-vfs-sftp,--disable-vfs-sftp,libssh2,"
+
+EXTRA_OECONF = "--with-screen=ncurses --without-gpm-mouse --without-x"
+
+do_install_append () {
+	sed -i -e '1s,#!.*perl,#!${bindir}/env perl,' ${D}${libexecdir}/mc/extfs.d/*
+	sed -i -e '1s,#!.*python,#!${bindir}/env python,' ${D}${libexecdir}/mc/extfs.d/*
+}
+
+PACKAGES =+ "${BPN}-helpers-perl ${BPN}-helpers-python ${BPN}-helpers ${BPN}-fish"
+
+SUMMARY_${BPN}-helpers-perl = "Midnight Commander Perl-based helper scripts"
+FILES_${BPN}-helpers-perl = "${libexecdir}/mc/extfs.d/a+ ${libexecdir}/mc/extfs.d/apt+ \
+                             ${libexecdir}/mc/extfs.d/deb ${libexecdir}/mc/extfs.d/deba \
+                             ${libexecdir}/mc/extfs.d/debd ${libexecdir}/mc/extfs.d/dpkg+ \
+                             ${libexecdir}/mc/extfs.d/mailfs ${libexecdir}/mc/extfs.d/patchfs \ 
+                             ${libexecdir}/mc/extfs.d/rpms+ ${libexecdir}/mc/extfs.d/ulib \ 
+                             ${libexecdir}/mc/extfs.d/uzip"
+RDEPENDS_${BPN}-helpers-perl = "perl"
+
+SUMMARY_${BPN}-helpers-python = "Midnight Commander Python-based helper scripts"
+FILES_${BPN}-helpers-python = "${libexecdir}/mc/extfs.d/s3+ ${libexecdir}/mc/extfs.d/uc1541"
+RDEPENDS_${BPN}-helpers-python = "python"
+
+SUMMARY_${BPN}-helpers = "Midnight Commander shell helper scripts"
+FILES_${BPN}-helpers = "${libexecdir}/mc/extfs.d/* ${libexecdir}/mc/ext.d/*"
+
+SUMMARY_${BPN}-fish = "Midnight Commander Fish scripts"
+FILES_${BPN}-fish = "${libexecdir}/mc/fish"
-- 
2.4.0


