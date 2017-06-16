Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 072CB784DB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 12:29:29 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Jun 2017 05:29:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,347,1493708400"; d="scan'208";a="1161279607"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 16 Jun 2017 05:29:15 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Jun 2017 15:28:51 +0300
Message-Id: <671fa9c476269908cd092f0d033e03ae477119c7.1497615866.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1497615866.git.alexander.kanavin@linux.intel.com>
References: <cover.1497615866.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 28/32] gettext: relocate msgfmt utility for all recipes
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
X-List-Received-Date: Fri, 16 Jun 2017 12:29:30 -0000

Now that epiphany needs a working msgfmt as well, let's do this trick
where it should be.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-core/gettext/gettext_0.19.8.1.bb | 4 ++++
 meta/recipes-kernel/sysprof/sysprof_3.24.1.bb | 4 ----
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/gettext/gettext_0.19.8.1.bb b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
index 83edffe530f..e080e76bf77 100644
--- a/meta/recipes-core/gettext/gettext_0.19.8.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.19.8.1.bb
@@ -119,6 +119,10 @@ do_install_append_class-native () {
 	rm ${D}${datadir}/gettext/config.rpath
 	rm ${D}${datadir}/gettext/po/Makefile.in.in
 	rm ${D}${datadir}/gettext/po/remove-potcdate.sin
+
+        create_wrapper ${D}${bindir}/msgfmt \
+                GETTEXTDATADIR="${STAGING_DATADIR_NATIVE}/gettext-0.19.8/"
+
 }
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-kernel/sysprof/sysprof_3.24.1.bb b/meta/recipes-kernel/sysprof/sysprof_3.24.1.bb
index ca3589bcc97..0d140838f85 100644
--- a/meta/recipes-kernel/sysprof/sysprof_3.24.1.bb
+++ b/meta/recipes-kernel/sysprof/sysprof_3.24.1.bb
@@ -20,10 +20,6 @@ AUTOTOOLS_AUXDIR = "${S}/build-aux"
 
 EXTRA_OECONF = "--enable-compile-warnings"
 
-# This properly relocates msgfmt, which otherwise fails to find its data files. 
-# Tips on how to get rid of hardcoded version welcome.
-export GETTEXTDATADIR = "${STAGING_DATADIR_NATIVE}/gettext-0.19.8/"
-
 PACKAGECONFIG ?= "${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}', 'gtk', '', d)}"
 PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+3"
 PACKAGECONFIG[polkit] = "--enable-polkit,--disable-polkit,polkit dbus"
-- 
2.11.0


