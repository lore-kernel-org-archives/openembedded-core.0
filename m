Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 042F077D70
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Apr 2017 14:28:33 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Apr 2017 07:28:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,384,1488873600"; d="scan'208";a="94884621"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 27 Apr 2017 07:28:35 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Apr 2017 17:28:10 +0300
Message-Id: <635f0c44d349cf80a3bdcdd9cb537d825b4f50e4.1493302527.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1493302527.git.alexander.kanavin@linux.intel.com>
References: <cover.1493302527.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 11/13] mc: do not package Python-based extfs helpers
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
X-List-Received-Date: Thu, 27 Apr 2017 14:28:34 -0000

They have not been ported to Python 3, and they are for
browsing Amazon s3+ and Commodore 64/128 emulator filesystems -
hardly consequential.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-core/packagegroups/packagegroup-self-hosted.bb      | 1 -
 meta/recipes-extended/mc/mc_4.8.18.bb                            | 9 +++------
 .../packagegroups/packagegroup-core-full-cmdline.bb              | 1 -
 meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb     | 1 -
 4 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index 51de75debdb..0abd5bc90ee 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -42,7 +42,6 @@ RDEPENDS_packagegroup-self-hosted-host-tools = "\
     mc-fish \
     mc-helpers \
     mc-helpers-perl \
-    mc-helpers-python \
     parted \
     ${PSEUDO} \
     screen \
diff --git a/meta/recipes-extended/mc/mc_4.8.18.bb b/meta/recipes-extended/mc/mc_4.8.18.bb
index 17f3f73af77..7a56d544825 100644
--- a/meta/recipes-extended/mc/mc_4.8.18.bb
+++ b/meta/recipes-extended/mc/mc_4.8.18.bb
@@ -27,10 +27,11 @@ CACHED_CONFIGUREVARS += "ac_cv_path_PERL='/usr/bin/env perl'"
 
 do_install_append () {
 	sed -i -e '1s,#!.*perl,#!${bindir}/env perl,' ${D}${libexecdir}/mc/extfs.d/*
-	sed -i -e '1s,#!.*python,#!${bindir}/env python,' ${D}${libexecdir}/mc/extfs.d/*
+        
+        rm ${D}${libexecdir}/mc/extfs.d/s3+ ${D}${libexecdir}/mc/extfs.d/uc1541
 }
 
-PACKAGES =+ "${BPN}-helpers-perl ${BPN}-helpers-python ${BPN}-helpers ${BPN}-fish"
+PACKAGES =+ "${BPN}-helpers-perl ${BPN}-helpers ${BPN}-fish"
 
 SUMMARY_${BPN}-helpers-perl = "Midnight Commander Perl-based helper scripts"
 FILES_${BPN}-helpers-perl = "${libexecdir}/mc/extfs.d/a+ ${libexecdir}/mc/extfs.d/apt+ \
@@ -41,10 +42,6 @@ FILES_${BPN}-helpers-perl = "${libexecdir}/mc/extfs.d/a+ ${libexecdir}/mc/extfs.
                              ${libexecdir}/mc/extfs.d/uzip"
 RDEPENDS_${BPN}-helpers-perl = "perl"
 
-SUMMARY_${BPN}-helpers-python = "Midnight Commander Python-based helper scripts"
-FILES_${BPN}-helpers-python = "${libexecdir}/mc/extfs.d/s3+ ${libexecdir}/mc/extfs.d/uc1541"
-RDEPENDS_${BPN}-helpers-python = "python"
-
 SUMMARY_${BPN}-helpers = "Midnight Commander shell helper scripts"
 FILES_${BPN}-helpers = "${libexecdir}/mc/extfs.d/* ${libexecdir}/mc/ext.d/*"
 
diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb b/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
index 9379fb91998..fdede5954c3 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-full-cmdline.bb
@@ -86,7 +86,6 @@ RDEPENDS_packagegroup-core-full-cmdline-utils = "\
     mc-fish \
     mc-helpers \
     mc-helpers-perl \
-    mc-helpers-python \
     mktemp \
     ncurses \
     net-tools \
diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
index a156bcb95c5..224ff19819c 100644
--- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
+++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
@@ -66,7 +66,6 @@ RDEPENDS_packagegroup-core-sys-extended = "\
     mc-fish \
     mc-helpers \
     mc-helpers-perl \
-    mc-helpers-python \
     mdadm \
     minicom \
     neon \
-- 
2.11.0


