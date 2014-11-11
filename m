Return-Path: <cristian.iorga@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3C804713A5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Nov 2014 08:46:35 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 11 Nov 2014 00:46:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,359,1413270000"; d="scan'208";a="630016403"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by fmsmga002.fm.intel.com with ESMTP; 11 Nov 2014 00:46:33 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Nov 2014 10:46:22 +0200
Message-Id: <773f5ac6b817a0f4c8227b7e371fbc3f9b987c13.1415695544.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1415695544.git.cristian.iorga@intel.com>
References: <cover.1415695544.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1415695544.git.cristian.iorga@intel.com>
References: <cover.1415695544.git.cristian.iorga@intel.com>
Subject: [PATCH 1/4] wpa-supplicant: upgrade to 2.3
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
X-List-Received-Date: Tue, 11 Nov 2014 08:46:45 -0000

- P2P WiFi improvements;
- Bug fixes.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../recipes-connectivity/wpa-supplicant/wpa-supplicant.inc |  4 ++--
 .../wpa-supplicant/fix-libnl3-host-contamination.patch     | 14 +++++++-------
 .../{wpa-supplicant_2.2.bb => wpa-supplicant_2.3.bb}       |  0
 3 files changed, 9 insertions(+), 9 deletions(-)
 rename meta/recipes-connectivity/wpa-supplicant/{wpa-supplicant_2.2.bb => wpa-supplicant_2.3.bb} (100%)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
index 3abcf86..2bc9339 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
@@ -26,8 +26,8 @@ SRC_URI = "http://hostap.epitest.fi/releases/wpa_supplicant-${PV}.tar.gz \
            file://99_wpa_supplicant \
            file://fix-libnl3-host-contamination.patch \
           "
-SRC_URI[md5sum] = "238e8e888bbd558e1a57e3eb28d1dd07"
-SRC_URI[sha256sum] = "e0d8b8fd68a659636eaba246bb2caacbf53d22d53b2b6b90eb4b4fef0993c8ed"
+SRC_URI[md5sum] = "f2ed8fef72cf63d8d446a2d0a6da630a"
+SRC_URI[sha256sum] = "eaaa5bf3055270e521b2dff64f2d203ec8040f71958b8588269a82c00c9d7b6a"
 
 S = "${WORKDIR}/wpa_supplicant-${PV}"
 
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/fix-libnl3-host-contamination.patch b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/fix-libnl3-host-contamination.patch
index eb8036f..e899c16 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/fix-libnl3-host-contamination.patch
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/fix-libnl3-host-contamination.patch
@@ -15,15 +15,15 @@ diff --git a/src/drivers/drivers.mak b/src/drivers/drivers.mak
 index 68ff910..1f38f57 100644
 --- a/src/drivers/drivers.mak
 +++ b/src/drivers/drivers.mak
-@@ -30,7 +30,7 @@ NEED_RFKILL=y
+@@ -35,7 +35,7 @@ NEED_RFKILL=y
  ifdef CONFIG_LIBNL32
    DRV_LIBS += -lnl-3
    DRV_LIBS += -lnl-genl-3
 -  DRV_CFLAGS += -DCONFIG_LIBNL20 -I/usr/include/libnl3
 +  DRV_CFLAGS += -DCONFIG_LIBNL20
- else
-   ifdef CONFIG_LIBNL_TINY
-     DRV_LIBS += -lnl-tiny
+ ifdef CONFIG_LIBNL3_ROUTE
+   DRV_LIBS += -lnl-route-3
+   DRV_CFLAGS += -DCONFIG_LIBNL3_ROUTE
 diff --git a/src/drivers/drivers.mk b/src/drivers/drivers.mk
 index db8561a..c93e88d 100644
 --- a/src/drivers/drivers.mk
@@ -34,9 +34,9 @@ index db8561a..c93e88d 100644
    DRV_LIBS += -lnl-genl-3
 -  DRV_CFLAGS += -DCONFIG_LIBNL20 -I/usr/include/libnl3
 +  DRV_CFLAGS += -DCONFIG_LIBNL20
- else
-   ifdef CONFIG_LIBNL_TINY
-     DRV_LIBS += -lnl-tiny
+ ifdef CONFIG_LIBNL3_ROUTE
+   DRV_LIBS += -lnl-route-3
+   DRV_CFLAGS += -DCONFIG_LIBNL3_ROUTE
 -- 
 1.7.10.4
 
diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.2.bb b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.3.bb
similarity index 100%
rename from meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.2.bb
rename to meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.3.bb
-- 
2.1.0


