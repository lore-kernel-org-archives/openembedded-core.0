Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id DBEC2616EA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Oct 2013 13:24:11 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 03 Oct 2013 06:24:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,1026,1371106800"; d="scan'208";a="404785753"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.147])
	by fmsmga001.fm.intel.com with ESMTP; 03 Oct 2013 06:24:12 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Oct 2013 14:24:08 +0100
Message-Id: <1380806648-15754-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] dbus: fix QA error building nativesdk-dbus
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
X-List-Received-Date: Thu, 03 Oct 2013 13:24:11 -0000

Fixes the following QA error:

ERROR: QA Issue: nativesdk-dbus: Files/directories were installed but not shipped
  /run
  /run/dbus

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-core/dbus/dbus.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 580a936..5864643 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -141,5 +141,8 @@ do_install_class-nativesdk() {
 	# dbus-launch has no X support so lets not install it in case the host
 	# has a more featured and useful version
 	rm -f ${D}${bindir}/dbus-launch
+
+	# Remove /var/run to avoid QA error
+	rm -rf ${D}${localstatedir}/run
 }
 BBCLASSEXTEND = "native nativesdk"
-- 
1.8.1.2


