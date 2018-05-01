Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 0B163745D7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 May 2018 18:12:49 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 May 2018 11:12:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,352,1520924400"; d="scan'208";a="42174602"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 01 May 2018 11:12:49 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 May 2018 21:06:46 +0300
Message-Id: <20180501180646.28212-4-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180501180646.28212-1-alexander.kanavin@linux.intel.com>
References: <20180501180646.28212-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 4/4] sysvinit-inittab: do not use 'exit 1' to postpone to first boot
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
X-List-Received-Date: Tue, 01 May 2018 18:12:49 -0000

Instead, first check if we need to do anything at all during first boot,
and if so, either postpone to first boot via pkg_postinst_ontarget()
when running on host, or run the necessary setup code when running on target.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
index 5b9c422cafa..8585a418ab8 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
@@ -53,8 +53,15 @@ EOF
 }
 
 pkg_postinst_${PN} () {
+# run this on host and on target
+if [ "${SERIAL_CONSOLES_CHECK}" = "" ]; then
+       exit 0
+fi
+}
+
+pkg_postinst_ontarget_${PN} () {
 # run this on the target
-if [ "x$D" = "x" ] && [ -e /proc/consoles ]; then
+if [ -e /proc/consoles ]; then
 	tmp="${SERIAL_CONSOLES_CHECK}"
 	for i in $tmp
 	do
@@ -68,11 +75,7 @@ if [ "x$D" = "x" ] && [ -e /proc/consoles ]; then
 	done
 	kill -HUP 1
 else
-	if [ "${SERIAL_CONSOLES_CHECK}" = "" ]; then
-		exit 0
-	else
-		exit 1
-	fi
+	exit 1
 fi
 }
 
-- 
2.16.1


