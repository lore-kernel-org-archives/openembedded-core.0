Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eflanagan@envy.jf.intel.com>) id 1ScmQT-00047k-BU
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jun 2012 01:47:37 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 07 Jun 2012 16:37:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="149733204"
Received: from envy.jf.intel.com ([10.7.201.175])
	by orsmga001.jf.intel.com with ESMTP; 07 Jun 2012 16:37:05 -0700
Received: from envy.jf.intel.com (localhost [127.0.0.1])
	by envy.jf.intel.com (8.14.4/8.14.4/Debian-2ubuntu2) with ESMTP id
	q57NbIsX006567 for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Jun 2012 16:37:18 -0700
Received: (from eflanagan@localhost)
	by envy.jf.intel.com (8.14.4/8.14.4/Submit) id q57NbIS1006566
	for openembedded-core@lists.openembedded.org;
	Thu, 7 Jun 2012 16:37:18 -0700
From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jun 2012 16:37:04 -0700
Message-Id: <0f6849c5a17d322d1829320a49977d299ce0b0c4.1339111944.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <480358f458a7874b5705fc48547489d19a9df72c.1339111944.git.elizabeth.flanagan@intel.com>
References: <480358f458a7874b5705fc48547489d19a9df72c.1339111944.git.elizabeth.flanagan@intel.com>
In-Reply-To: <cover.1339111944.git.elizabeth.flanagan@intel.com>
References: <cover.1339111944.git.elizabeth.flanagan@intel.com>
Subject: [Consolidated Pull 16/22] connman: respect the 3g feature and enable/disable ofono support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Jun 2012 23:47:38 -0000

From: Ross Burton <ross.burton@intel.com>

[YOCTO #2357]

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
---
 meta/recipes-connectivity/connman/connman.inc     |    4 ++--
 meta/recipes-connectivity/connman/connman_0.79.bb |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index f2da8d9..58e3f56 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -17,7 +17,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
 DEPENDS  = "dbus glib-2.0 ppp iptables gnutls \
             ${@base_contains('DISTRO_FEATURES', 'bluetooth','bluez4', '', d)} \
             ${@base_contains('DISTRO_FEATURES', 'wifi','wpa-supplicant', '', d)} \
-            ofono \
+            ${@base_contains('DISTRO_FEATURES', '3g','ofono', '', d)} \
             "
 
 TIST = "--enable-tist"
@@ -34,7 +34,7 @@ EXTRA_OECONF += "\
     ${@base_contains('DISTRO_FEATURES', 'wifi','--enable-wifi ${TIST}', '--disable-wifi', d)} \
     ${@base_contains('DISTRO_FEATURES', 'bluetooth','--enable-bluetooth ${TIST}', '--disable-bluetooth', d)} \
     --enable-dnsproxy \
-    --enable-ofono \
+    ${@base_contains('DISTRO_FEATURES', '3g', '', '--disable-ofono', d)} \
     --enable-tools \
     --enable-test \
     --disable-polkit \
diff --git a/meta/recipes-connectivity/connman/connman_0.79.bb b/meta/recipes-connectivity/connman/connman_0.79.bb
index d7f22b9..ec3d147 100644
--- a/meta/recipes-connectivity/connman/connman_0.79.bb
+++ b/meta/recipes-connectivity/connman/connman_0.79.bb
@@ -11,4 +11,4 @@ SRC_URI  = "git://git.kernel.org/pub/scm/network/connman/connman.git \
             file://test-set-ipv6-method-api-fix.patch \
             file://connman"
 S = "${WORKDIR}/git"
-PR = "r4"
+PR = "r5"
-- 
1.7.5.4



