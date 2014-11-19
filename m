Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5C33D6AC93
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Nov 2014 21:29:56 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Nov 2014 13:29:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,419,1413270000"; d="scan'208";a="610707316"
Received: from aehernan-devstation.zpn.intel.com ([10.219.4.47])
	by orsmga001.jf.intel.com with ESMTP; 19 Nov 2014 13:29:56 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Nov 2014 15:29:53 -0600
Message-Id: <e9cea26e44e20f5ac9e45cd27056a9302c2e1439.1416432211.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1416432211.git.alejandro.hernandez@linux.intel.com>
References: <cover.1416432211.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 1/1] cronie: Added default crontab
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
X-List-Received-Date: Wed, 19 Nov 2014 21:30:00 -0000

Added default configuration to crontab, for instructive pruposes

Added /etc/crontab to CONFFILES to avoid overwriting if updating via PMS

[YOCTO 6644]

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 meta/recipes-extended/cronie/cronie/crontab   | 6 +++++-
 meta/recipes-extended/cronie/cronie_1.4.12.bb | 3 ++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/cronie/cronie/crontab b/meta/recipes-extended/cronie/cronie/crontab
index cc9169e..22c4feb 100644
--- a/meta/recipes-extended/cronie/cronie/crontab
+++ b/meta/recipes-extended/cronie/cronie/crontab
@@ -7,4 +7,8 @@
 SHELL=/bin/sh
 PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
 
-# m h dom mon dow user	command
+#  m  h  dom mon dow user	command
+#  1  *     * * *    root        cd / && run-parts /etc/cron.hourly
+# 30  7     * * *    root        cd / && run-parts /etc/cron.daily
+# 42  7     * * 7    root        cd / && run-parts /etc/cron.weekly
+# 55  7     1 * *    root        cd / && run-parts /etc/cron.monthly
diff --git a/meta/recipes-extended/cronie/cronie_1.4.12.bb b/meta/recipes-extended/cronie/cronie_1.4.12.bb
index e404756..977332b 100644
--- a/meta/recipes-extended/cronie/cronie_1.4.12.bb
+++ b/meta/recipes-extended/cronie/cronie_1.4.12.bb
@@ -63,7 +63,7 @@ do_install_append () {
 	mkdir -p ${D}${sysconfdir}/cron.weekly
 	mkdir -p ${D}${sysconfdir}/cron.monthly
 	touch ${D}${sysconfdir}/cron.deny
-	
+
 	# below setting is necessary to allow normal user using crontab
 
 	# setgid for crontab binary
@@ -78,3 +78,4 @@ do_install_append () {
 }
 
 FILES_${PN} += "${sysconfdir}/cron*"
+CONFFILES_${PN} += "${sysconfdir}/crontab"
-- 
1.9.1


