Return-Path: <anuj.mittal@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id B1785786E9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Feb 2018 05:45:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Feb 2018 21:46:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,377,1515484800"; d="scan'208";a="206033841"
Received: from anmitta2-mobl1.png.intel.com ([10.221.20.193])
	by fmsmga005.fm.intel.com with ESMTP; 21 Feb 2018 21:46:00 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Feb 2018 13:45:51 +0800
Message-Id: <1519278352-5224-2-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1519278352-5224-1-git-send-email-anuj.mittal@intel.com>
References: <1519278352-5224-1-git-send-email-anuj.mittal@intel.com>
Subject: [PATCH 2/3] kbd: build tests only when ptest is enabled
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
X-List-Received-Date: Thu, 22 Feb 2018 05:45:59 -0000

Also include the libcheck dependency only when tests are to be built.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/kbd/kbd_2.0.4.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/kbd/kbd_2.0.4.bb b/meta/recipes-core/kbd/kbd_2.0.4.bb
index 5937cb8..b25d5e8 100644
--- a/meta/recipes-core/kbd/kbd_2.0.4.bb
+++ b/meta/recipes-core/kbd/kbd_2.0.4.bb
@@ -3,7 +3,6 @@ HOMEPAGE = "http://www.kbd-project.org/"
 # everything minus console-fonts is GPLv2+
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a5fcc36121d93e1f69d96a313078c8b5"
-DEPENDS = "libcheck"
 
 inherit autotools gettext ptest pkgconfig
 
@@ -19,8 +18,9 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.tar.xz \
 SRC_URI[md5sum] = "c1635a5a83b63aca7f97a3eab39ebaa6"
 SRC_URI[sha256sum] = "5fd90af6beb225a9bb9b9fb414c090fba53c9a55793e172f508cd43652e59a88"
 
-PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
+PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam ptest', d)}"
 PACKAGECONFIG[pam] = "--enable-vlock, --disable-vlock, libpam,"
+PACKAGECONFIG[ptest] = "--enable-tests, --disable-tests, libcheck"
 
 do_compile_ptest() {
     oe_runmake -C ${B}/tests dumpkeys-fulltable alt-is-meta
-- 
2.7.4


