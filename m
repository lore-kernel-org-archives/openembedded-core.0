Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SFlPT-0002aK-Tx
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Apr 2012 14:03:28 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 05 Apr 2012 04:54:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="125611286"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.110])
	by orsmga001.jf.intel.com with ESMTP; 05 Apr 2012 04:54:14 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Apr 2012 19:49:21 +0800
Message-Id: <f00fe78b88d2be6d6f02ecfb8a619b84d4ea35a0.1333626413.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <0e25605bf5ef290a098abc577c99607a99493df5.1333626413.git.lianhao.lu@intel.com>
References: <0e25605bf5ef290a098abc577c99607a99493df5.1333626413.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1333626413.git.lianhao.lu@intel.com>
References: <cover.1333626413.git.lianhao.lu@intel.com>
Subject: [PATCH 2/2] connman: Fixed multilib support.
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
X-List-Received-Date: Thu, 05 Apr 2012 12:03:28 -0000

1. Added static depends to ofono.
2. Corrected the package content of connman-test.

This is part of the bug fixing [YOCTO #2216].

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/recipes-connectivity/connman/connman.inc     |    3 ++-
 meta/recipes-connectivity/connman/connman_0.79.bb |    1 +
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index d9d663c..bfe6620 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -17,6 +17,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
 DEPENDS  = "dbus glib-2.0 ppp iptables gnutls \
             ${@base_contains('DISTRO_FEATURES', 'bluetooth','bluez4', '', d)} \
             ${@base_contains('DISTRO_FEATURES', 'wifi','wpa-supplicant', '', d)} \
+            ofono \
             "
 
 EXTRA_OECONF += "\
@@ -90,7 +91,7 @@ PACKAGES =+ "${PN}-tools ${PN}-tests"
 
 FILES_${PN}-tools = "${bindir}/wispr"
 
-FILES_${PN}-tests = "${bindir}/*-test ${libdir}/${PN}/test/*"
+FILES_${PN}-tests = "${bindir}/*-test ${libdir}/${BPN}/test/*"
 RDEPENDS_${PN}-tests = "python-dbus"
 
 FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*.so.* \
diff --git a/meta/recipes-connectivity/connman/connman_0.79.bb b/meta/recipes-connectivity/connman/connman_0.79.bb
index 0c3a6fe..f87c4dd 100644
--- a/meta/recipes-connectivity/connman/connman_0.79.bb
+++ b/meta/recipes-connectivity/connman/connman_0.79.bb
@@ -8,3 +8,4 @@ SRC_URI  = "git://git.kernel.org/pub/scm/network/connman/connman.git \
             file://disable_alg-test.patch \
             file://connman"
 S = "${WORKDIR}/git"
+PR = "r1"
-- 
1.7.0.4



