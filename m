Return-Path: <jukka.rissanen@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 441136B256
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2013 15:01:47 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 01 Aug 2013 08:01:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,795,1367996400"; d="scan'208";a="276321904"
Received: from sorvi.fi.intel.com ([10.237.72.152])
	by AZSMGA002.ch.intel.com with ESMTP; 01 Aug 2013 08:01:46 -0700
From: Jukka Rissanen <jukka.rissanen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Aug 2013 18:01:40 +0300
Message-Id: <1375369300-13471-5-git-send-email-jukka.rissanen@linux.intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1375369300-13471-1-git-send-email-jukka.rissanen@linux.intel.com>
References: <1375369300-13471-1-git-send-email-jukka.rissanen@linux.intel.com>
Subject: [PATCH v2 4/4] ofono: Move do_install() to ofono recipe file
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
X-List-Received-Date: Thu, 01 Aug 2013 15:01:47 -0000

This allows the ofono.inc file to be used by a recipe that does
not have or use ofono init script.

Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>
---
 meta/recipes-connectivity/ofono/ofono.inc     | 5 -----
 meta/recipes-connectivity/ofono/ofono_1.12.bb | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-connectivity/ofono/ofono.inc b/meta/recipes-connectivity/ofono/ofono.inc
index 3972e06..5e98be9 100644
--- a/meta/recipes-connectivity/ofono/ofono.inc
+++ b/meta/recipes-connectivity/ofono/ofono.inc
@@ -19,11 +19,6 @@ EXTRA_OECONF += "\
 "
 SYSTEMD_SERVICE_${PN} = "ofono.service"
 
-do_install_append() {
-  install -d ${D}${sysconfdir}/init.d/
-  install -m 0755 ${WORKDIR}/ofono ${D}${sysconfdir}/init.d/ofono
-}
-
 PACKAGES =+ "${PN}-tests"
 
 RDEPENDS_${PN} += "dbus"
diff --git a/meta/recipes-connectivity/ofono/ofono_1.12.bb b/meta/recipes-connectivity/ofono/ofono_1.12.bb
index ad524a0..8f5c341 100644
--- a/meta/recipes-connectivity/ofono/ofono_1.12.bb
+++ b/meta/recipes-connectivity/ofono/ofono_1.12.bb
@@ -13,3 +13,8 @@ SRC_URI[md5sum] = "aa8924c0e8de3ec7ac5e41fe7df4cb99"
 SRC_URI[sha256sum] = "733b75bfd1b2a1925b6de532989c496b8ae17a746691120ef64cceb00b3ef751"
 
 CFLAGS_append_libc-uclibc = " -D_GNU_SOURCE"
+
+do_install_append() {
+  install -d ${D}${sysconfdir}/init.d/
+  install -m 0755 ${WORKDIR}/ofono ${D}${sysconfdir}/init.d/ofono
+}
-- 
1.7.11.7


