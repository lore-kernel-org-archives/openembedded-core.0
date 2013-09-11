Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id C2B5F60FE6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 21:38:06 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 11 Sep 2013 14:38:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,886,1371106800"; d="scan'208";a="401984457"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.99])
	by orsmga002.jf.intel.com with ESMTP; 11 Sep 2013 14:38:01 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Sep 2013 14:38:01 -0700
Message-Id: <1378935481-592-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] bluez4/5: Add EXCLUDE_FROM_WORLD = 1
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
X-List-Received-Date: Wed, 11 Sep 2013 21:38:07 -0000

We can't build both recipes in the world build as there is a collision of package name
and PR values. Specificly the libasound-module-bluez which is the same in both goes
backwards from r5 (bluez4) -> r0 (bluez5) and the subpackage_metadata check fails:

ERROR: Recipe lib32-bluez5 is trying to change PR from 'r0' to 'r5'. This will cause do_package_write_* failures since the incorrect data will be used and they will be unable to find the right workdir.

[YOCTO #5165]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-connectivity/bluez/bluez4.inc  | 1 +
 meta/recipes-connectivity/bluez5/bluez5.inc | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/meta/recipes-connectivity/bluez/bluez4.inc b/meta/recipes-connectivity/bluez/bluez4.inc
index b540622..e4f6834 100644
--- a/meta/recipes-connectivity/bluez/bluez4.inc
+++ b/meta/recipes-connectivity/bluez/bluez4.inc
@@ -43,3 +43,4 @@ EXTRA_OECONF = "\
   --with-udevrulesdir=`pkg-config --variable=udevdir udev`/rules.d \
 "
 
+EXCLUDE_FROM_WORLD = "1"
diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index e5cb9e8..2e25d86 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -82,3 +82,5 @@ FILES_${PN}-dbg += "\
 RDEPENDS_${PN}-testtools += "python python-dbus python-pygobject"
 
 SYSTEMD_SERVICE_${PN} = "bluetooth.service"
+
+EXCLUDE_FROM_WORLD = "1"
-- 
1.8.3.1


