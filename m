Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QLQEs-00069o-V0
	for openembedded-core@lists.openembedded.org;
	Sun, 15 May 2011 03:35:23 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 14 May 2011 18:32:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,368,1301900400"; 
   d="scan'208";a="2310657"
Received: from unknown (HELO localhost) ([10.255.12.119])
	by fmsmga001.fm.intel.com with ESMTP; 14 May 2011 18:32:31 -0700
Message-Id: <d656cbb7d853ede29a1ed0b210f92c6d106e8497.1305422996.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305422996.git.sgw@linux.intel.com>
References: <cover.1305422996.git.sgw@linux.intel.com>
Old-Date: Fri, 13 May 2011 10:06:44 +0800
Date: Sat, 14 May 2011 18:32:31 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Kang Kai <kai.kang@windriver.com>
Subject: [PATCH 15/15] foomatic-filters: add a link to pass LSB printing test
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
X-List-Received-Date: Sun, 15 May 2011 01:35:23 -0000

From: Kang Kai <kai.kang@windriver.com>

LSB printing test will test a foomatic-rip under cups' directory,
so add it as link when DISTRO is set to linuxstdbase.
Part fixes [Yocto 904]

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../foomatic/foomatic-filters_4.0.7.bb             |    9 ++++++++-
 1 files changed, 8 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/foomatic/foomatic-filters_4.0.7.bb b/meta/recipes-extended/foomatic/foomatic-filters_4.0.7.bb
index 8d70400..9627187 100644
--- a/meta/recipes-extended/foomatic/foomatic-filters_4.0.7.bb
+++ b/meta/recipes-extended/foomatic/foomatic-filters_4.0.7.bb
@@ -10,7 +10,7 @@ format using a printer-specific, but spooler-independent PPD file. \
 "
 
 DEPENDS += "cups perl libxml2"
-PR = "r0"
+PR = "r1"
 
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://${WORKDIR}/foomatic-filters-${PV}/COPYING;md5=393a5ca445f6965873eca0259a17f833"
@@ -20,4 +20,11 @@ SRC_URI = "http://www.openprinting.org/download/foomatic/foomatic-filters-${PV}.
 SRC_URI[md5sum] = "20abd25c1c98b2dae68709062a132a7d"
 SRC_URI[sha256sum] = "090313fae40b177f505d9c9b93d7a4d7188b6d5d18b6ae41ab24903ac983478d"
 
+do_install_append_linuxstdbase() {
+    install -d ${D}${libdir}/cups/filter
+    ln -sf ${bindir}/foomatic-rip ${D}${libdir}/cups/filter
+}
+
+FILES_${PN}_append_linuxstdbase += "${libdir}/cups/filter/foomatic-rip"
+
 inherit autotools
-- 
1.7.1.1



