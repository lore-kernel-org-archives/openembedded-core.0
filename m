Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 36CB06B0DA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2013 14:05:00 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 12 Jul 2013 07:05:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,653,1367996400"; d="scan'208";a="344562801"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga001.jf.intel.com with ESMTP; 12 Jul 2013 07:04:58 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Jul 2013 17:06:29 +0300
Message-Id: <1373637989-24991-6-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1373637989-24991-1-git-send-email-cristian.iorga@intel.com>
References: <1373637989-24991-1-git-send-email-cristian.iorga@intel.com>
Subject: [PATCH 5/5] bluez5: Set udev variables using pkg-config
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
X-List-Received-Date: Fri, 12 Jul 2013 14:05:00 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc    |    4 ++--
 meta/recipes-connectivity/bluez5/bluez5_5.7.bb |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 86a9bbe..240e13d 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -37,8 +37,8 @@ EXTRA_OECONF = "\
   --disable-cups \
   --enable-test \
   --enable-datafiles \
-  --with-udevdir=${base_libdir}/udev \
-  --with-udevrulesdir=${nonarch_base_libdir}/udev/rules.d \
+  --with-udevdir=`pkg-config --variable=udevdir udev` \
+  --with-udevrulesdir=`pkg-config --variable=udevdir udev`/rules.d \
   ${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdunitdir=${systemd_unitdir}/system/', '--disable-systemd', d)} \
 "
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.7.bb b/meta/recipes-connectivity/bluez5/bluez5_5.7.bb
index 824800b..0160f61 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.7.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.7.bb
@@ -34,5 +34,5 @@ FILES_${PN}-dbg += "\
   ${libdir}/${PN}/bluetooth/.debug \
   ${libdir}/bluetooth/plugins/.debug \
   ${libdir}/*/.debug \
-  ${base_libdir}/udev/.debug \
+  */udev/.debug \
   "
-- 
1.7.10.4


