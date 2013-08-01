Return-Path: <jukka.rissanen@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 8CF146B1F2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2013 15:01:46 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 01 Aug 2013 08:01:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,795,1367996400"; d="scan'208";a="276321884"
Received: from sorvi.fi.intel.com ([10.237.72.152])
	by AZSMGA002.ch.intel.com with ESMTP; 01 Aug 2013 08:01:45 -0700
From: Jukka Rissanen <jukka.rissanen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Aug 2013 18:01:39 +0300
Message-Id: <1375369300-13471-4-git-send-email-jukka.rissanen@linux.intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1375369300-13471-1-git-send-email-jukka.rissanen@linux.intel.com>
References: <1375369300-13471-1-git-send-email-jukka.rissanen@linux.intel.com>
Subject: [PATCH v2 3/4] ofono: Enable test scripts by default
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
X-List-Received-Date: Thu, 01 Aug 2013 15:01:46 -0000

oFono test scripts are very useful so enable those by default.

Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>
---
 meta/recipes-connectivity/ofono/ofono.inc     | 3 ++-
 meta/recipes-connectivity/ofono/ofono_1.12.bb | 3 ---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-connectivity/ofono/ofono.inc b/meta/recipes-connectivity/ofono/ofono.inc
index 7adc667..3972e06 100644
--- a/meta/recipes-connectivity/ofono/ofono.inc
+++ b/meta/recipes-connectivity/ofono/ofono.inc
@@ -15,6 +15,7 @@ INITSCRIPT_PARAMS = "defaults 22"
 EXTRA_OECONF += "\
     ${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdunitdir=${systemd_unitdir}/system/', '--with-systemdunitdir=', d)} \
     ${@base_contains('DISTRO_FEATURES', 'bluetooth','--enable-bluetooth', '--disable-bluetooth', d)} \
+    --enable-test \
 "
 SYSTEMD_SERVICE_${PN} = "ofono.service"
 
@@ -28,5 +29,5 @@ PACKAGES =+ "${PN}-tests"
 RDEPENDS_${PN} += "dbus"
 
 FILES_${PN} += "${base_libdir}/udev ${systemd_unitdir}"
-FILES_${PN}-tests = "${libdir}/ofono"
+FILES_${PN}-tests = "${libdir}/${BPN}/test"
 RDEPENDS_${PN}-tests = "python python-pygobject python-dbus"
diff --git a/meta/recipes-connectivity/ofono/ofono_1.12.bb b/meta/recipes-connectivity/ofono/ofono_1.12.bb
index 32c8bc2..ad524a0 100644
--- a/meta/recipes-connectivity/ofono/ofono_1.12.bb
+++ b/meta/recipes-connectivity/ofono/ofono_1.12.bb
@@ -12,7 +12,4 @@ PR = "r2"
 SRC_URI[md5sum] = "aa8924c0e8de3ec7ac5e41fe7df4cb99"
 SRC_URI[sha256sum] = "733b75bfd1b2a1925b6de532989c496b8ae17a746691120ef64cceb00b3ef751"
 
-EXTRA_OECONF += "\
-    --enable-test \
-"
 CFLAGS_append_libc-uclibc = " -D_GNU_SOURCE"
-- 
1.7.11.7


