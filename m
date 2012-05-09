Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SRzd1-00065a-F4
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 07:39:59 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 08 May 2012 22:30:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="141721031"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.218])
	by orsmga002.jf.intel.com with ESMTP; 08 May 2012 22:30:00 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 May 2012 22:29:51 -0700
Message-Id: <c6dbad4c01522726fd2705a25d345699c9fc7a7f.1336516205.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1336516205.git.sgw@linux.intel.com>
References: <cover.1336516205.git.sgw@linux.intel.com>
In-Reply-To: <cover.1336516205.git.sgw@linux.intel.com>
References: <cover.1336516205.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 06/12] libpcap: Move pcap-config to -dev package
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
X-List-Received-Date: Wed, 09 May 2012 05:40:00 -0000

pcap-config is a tool used for getting the cflags and ln flags for development

[YOCTO #2367]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-connectivity/libpcap/libpcap.inc |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-connectivity/libpcap/libpcap.inc b/meta/recipes-connectivity/libpcap/libpcap.inc
index 427078f..945d4ca 100644
--- a/meta/recipes-connectivity/libpcap/libpcap.inc
+++ b/meta/recipes-connectivity/libpcap/libpcap.inc
@@ -13,7 +13,7 @@ DEPENDS = "flex-native bison-native"
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluetooth', '', d)}"
 PACKAGECONFIG[bluetooth] = "--enable-bluetooth,--disable-bluetooth,bluez4"
 
-INC_PR = "r1"
+INC_PR = "r2"
 
 SRC_URI = "http://www.tcpdump.org/release/libpcap-${PV}.tar.gz"
 
@@ -30,3 +30,8 @@ do_configure_prepend () {
         cat aclocal.m4 > acinclude.m4
     fi
 }
+
+# pcap-config is a dev tool and should not be packaged in the 
+# core package.
+FILES_${PN} = "${libdir}/lib*${SOLIBS}"
+FILES_${PN}-dev += "${bindir}/pcap-config"
-- 
1.7.7.6



