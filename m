Return-Path: <jukka.rissanen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id F04FB6B3D2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 12:35:20 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 26 Jul 2013 05:32:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,751,1367996400"; d="scan'208";a="371689157"
Received: from sorvi.fi.intel.com ([10.237.72.152])
	by fmsmga001.fm.intel.com with ESMTP; 26 Jul 2013 05:35:21 -0700
From: Jukka Rissanen <jukka.rissanen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Jul 2013 15:35:17 +0300
Message-Id: <1374842117-24504-4-git-send-email-jukka.rissanen@linux.intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1374842117-24504-1-git-send-email-jukka.rissanen@linux.intel.com>
References: <1374842117-24504-1-git-send-email-jukka.rissanen@linux.intel.com>
Subject: [PATCH 3/3] ofono: Enable test scripts by default
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
X-List-Received-Date: Fri, 26 Jul 2013 12:35:21 -0000

oFono test scripts are very useful so enable those by default.

Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>
---
 meta/recipes-connectivity/ofono/ofono.inc     | 3 ++-
 meta/recipes-connectivity/ofono/ofono_1.12.bb | 3 ---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-connectivity/ofono/ofono.inc b/meta/recipes-connectivity/ofono/ofono.inc
index d825496..c5bd4d0 100644
--- a/meta/recipes-connectivity/ofono/ofono.inc
+++ b/meta/recipes-connectivity/ofono/ofono.inc
@@ -15,6 +15,7 @@ INITSCRIPT_PARAMS = "defaults 22"
 EXTRA_OECONF += "\
     ${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdunitdir=${systemd_unitdir}/system/', '--with-systemdunitdir=', d)} \
     ${@base_contains('DISTRO_FEATURES', 'bluetooth','--enable-bluetooth', '--disable-bluetooth', d)} \
+    --enable-test \
 "
 SYSTEMD_SERVICE_${PN} = "ofono.service"
 
@@ -30,5 +31,5 @@ PACKAGES =+ "${PN}-tests"
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


