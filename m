Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 6CF156FFD8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2016 12:43:31 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga104.jf.intel.com with ESMTP; 11 Oct 2016 05:43:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,329,1473145200"; d="scan'208";a="1052292210"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga001.fm.intel.com with ESMTP; 11 Oct 2016 05:43:32 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Oct 2016 15:43:29 +0300
Message-Id: <1476189809-24240-3-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1476189809-24240-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1476189809-24240-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 2/2] sysklogd and busybox: ignore return code from init script stop
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
X-List-Received-Date: Tue, 11 Oct 2016 12:43:31 -0000

The init script will return '1' if we try to stop the service and it is
not currently running. The prerm scriptlet must not fail because of this
because it will cause package deinstallation of upgrade fail if opkg
package manager is used.

[YOCTO #10299]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/recipes-core/busybox/busybox.inc       | 2 +-
 meta/recipes-extended/sysklogd/sysklogd.inc | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
index 9f10770..bb782bc 100644
--- a/meta/recipes-core/busybox/busybox.inc
+++ b/meta/recipes-core/busybox/busybox.inc
@@ -423,7 +423,7 @@ pkg_prerm_${PN}-syslog () {
 	# remove syslog
 	if test "x$D" = "x"; then
 		if test "$1" = "upgrade" -o "$1" = "remove"; then
-			${sysconfdir}/init.d/syslog stop
+			${sysconfdir}/init.d/syslog stop || :
 		fi
 	fi
 }
diff --git a/meta/recipes-extended/sysklogd/sysklogd.inc b/meta/recipes-extended/sysklogd/sysklogd.inc
index dec75ed..2b325a8 100644
--- a/meta/recipes-extended/sysklogd/sysklogd.inc
+++ b/meta/recipes-extended/sysklogd/sysklogd.inc
@@ -55,7 +55,7 @@ ALTERNATIVE_LINK_NAME[syslog-conf] = "${sysconfdir}/syslog.conf"
 pkg_prerm_${PN} () {
 	if test "x$D" = "x"; then
 	if test "$1" = "upgrade" -o "$1" = "remove"; then
-		/etc/init.d/syslog stop
+		/etc/init.d/syslog stop || :
 	fi
 	fi
 }
-- 
2.6.6


