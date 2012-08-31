Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T7Z8c-0002UQ-Ge
	for openembedded-core@lists.openembedded.org;
	Fri, 31 Aug 2012 23:52:26 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 31 Aug 2012 14:39:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,349,1344236400"; d="scan'208";a="216474567"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.251])
	by fmsmga002.fm.intel.com with ESMTP; 31 Aug 2012 14:39:51 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Aug 2012 14:39:51 -0700
Message-Id: <1346449191-22541-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH v2] connman: Don't start connmand when booting using nfsroot
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 31 Aug 2012 21:52:26 -0000

There was a change to connman, such that it cleans up the
route table for devices at startup, this was causing the
network to get lost and NFS to loose it connection.

[YOCTO #3008]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-connectivity/connman/connman.inc     |    2 +-
 meta/recipes-connectivity/connman/connman/connman |    5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 653d1df..0f96202 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -20,7 +20,7 @@ DEPENDS  = "dbus glib-2.0 ppp iptables gnutls \
             ${@base_contains('DISTRO_FEATURES', '3g','ofono', '', d)} \
             "
 
-INC_PR = "r15"
+INC_PR = "r16"
 
 TIST = "--enable-tist"
 TIST_powerpc = ""
diff --git a/meta/recipes-connectivity/connman/connman/connman b/meta/recipes-connectivity/connman/connman/connman
index f01bf37..4a0017f 100644
--- a/meta/recipes-connectivity/connman/connman/connman
+++ b/meta/recipes-connectivity/connman/connman/connman
@@ -28,10 +28,9 @@ done
 
 do_start() {
 	EXTRA_PARAM=""
-	if test $nfsroot -eq 1 ; then
-		EXTRA_PARAM="-P ethernet"
+	if test $nfsroot -eq 0 ; then
+		$DAEMON $EXTRA_PARAM
 	fi
-	$DAEMON $EXTRA_PARAM
 }
 
 do_stop() {
-- 
1.7.7.6



