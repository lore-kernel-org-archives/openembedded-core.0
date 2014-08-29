Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E75B071210
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 13:10:47 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 29 Aug 2014 06:10:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,424,1406617200"; d="scan'208";a="591690120"
Received: from sentry.rb.intel.com ([10.237.105.37])
	by fmsmga002.fm.intel.com with ESMTP; 29 Aug 2014 06:10:48 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Aug 2014 16:10:41 +0300
Message-Id: <83fa3c7f371998382d646d3cd4675c579a701f0e.1409317786.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1409317786.git.cristian.iorga@intel.com>
References: <cover.1409317786.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1409317786.git.cristian.iorga@intel.com>
References: <cover.1409317786.git.cristian.iorga@intel.com>
Subject: [PATCH 2/3] libpcap: upgrade to 1.6.1
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
X-List-Received-Date: Fri, 29 Aug 2014 13:10:48 -0000

- Still BSD licensed, some changes into
pcap triggered a checksum change;
- ieee80215-arphrd.patch removed, obsolete.
- switched to ${BP} variable;

Changelog from previous version:
Saturday  Jul. 19, 2014 mcr@sandelman.ca
  Summary for 1.6.1 libpcap release
	some fixes for the any device
	changes for how --enable-XXX works

Wednesday Jul. 2, 2014 mcr@sandelman.ca
  Summary for 1.6.0 libpcap release
        Don't support D-Bus sniffing on OS X
        fixes for byte order issues with NFLOG captures
        Handle using cooked mode for DLT_NETLINK in activate_new().
        on platforms where you can not capture on down interfaces, do not list them
        but: do list interfaces which are down, if you can capture on them!

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-connectivity/libpcap/libpcap.inc      |  4 ++--
 .../libpcap/libpcap/ieee80215-arphrd.patch         | 24 ----------------------
 .../libpcap/{libpcap_1.5.3.bb => libpcap_1.6.1.bb} |  8 +++-----
 3 files changed, 5 insertions(+), 31 deletions(-)
 delete mode 100644 meta/recipes-connectivity/libpcap/libpcap/ieee80215-arphrd.patch
 rename meta/recipes-connectivity/libpcap/{libpcap_1.5.3.bb => libpcap_1.6.1.bb} (66%)

diff --git a/meta/recipes-connectivity/libpcap/libpcap.inc b/meta/recipes-connectivity/libpcap/libpcap.inc
index 92d6eff..a12eb16 100644
--- a/meta/recipes-connectivity/libpcap/libpcap.inc
+++ b/meta/recipes-connectivity/libpcap/libpcap.inc
@@ -7,7 +7,7 @@ BUGTRACKER = "http://sourceforge.net/tracker/?group_id=53067&atid=469577"
 SECTION = "libs/network"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1d4b0366557951c84a94fabe3529f867 \
-                    file://pcap.h;beginline=1;endline=34;md5=8d6cf7e17d5745010d633e30bc529ea9"
+                    file://pcap.h;beginline=1;endline=32;md5=39af3510e011f34b8872f120b1dc31d2"
 DEPENDS = "flex-native bison-native"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluetooth', '', d)}"
@@ -17,7 +17,7 @@ PACKAGECONFIG[libnl] = "--with-libnl,--without-libnl,libnl"
 
 INC_PR = "r5"
 
-SRC_URI = "http://www.tcpdump.org/release/libpcap-${PV}.tar.gz"
+SRC_URI = "http://www.tcpdump.org/release/${BP}.tar.gz"
 
 BINCONFIG = "${bindir}/pcap-config"
 
diff --git a/meta/recipes-connectivity/libpcap/libpcap/ieee80215-arphrd.patch b/meta/recipes-connectivity/libpcap/libpcap/ieee80215-arphrd.patch
deleted file mode 100644
index 2f5cd21..0000000
--- a/meta/recipes-connectivity/libpcap/libpcap/ieee80215-arphrd.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Upstream-Status: Pending
-
-Index: libpcap-1.0.0/pcap-linux.c
-===================================================================
---- libpcap-1.0.0.orig/pcap-linux.c	2009-01-28 11:58:54.000000000 +0300
-+++ libpcap-1.0.0/pcap-linux.c	2009-01-28 11:59:04.000000000 +0300
-@@ -1616,6 +1616,17 @@
- 		 * so let's use "Linux-cooked" mode. Jean II */
- 		//handle->md.cooked = 1;
- 		break;
-+#ifndef ARPHRD_IEEE80215
-+#define ARPHRD_IEEE80215 805
-+#endif
-+#ifndef ARPHRD_IEEE80215_PHY
-+#define ARPHRD_IEEE80215_PHY 806
-+#endif
-+
-+    case ARPHRD_IEEE80215:
-+    case ARPHRD_IEEE80215_PHY:
-+        handle->linktype = DLT_IEEE802_15_4;
-+        break;
- 
- 	/* ARPHRD_LAPD is unofficial and randomly allocated, if reallocation
- 	 * is needed, please report it to <daniele@orlandi.com> */
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.5.3.bb b/meta/recipes-connectivity/libpcap/libpcap_1.6.1.bb
similarity index 66%
rename from meta/recipes-connectivity/libpcap/libpcap_1.5.3.bb
rename to meta/recipes-connectivity/libpcap/libpcap_1.6.1.bb
index 3ba3caa..f570ebb 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.5.3.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.6.1.bb
@@ -1,10 +1,8 @@
 require libpcap.inc
 
-SRC_URI += "file://aclocal.patch \
-            file://ieee80215-arphrd.patch \
-           "
-SRC_URI[md5sum] = "7e7321fb3aff2f2bb05c8229f3795d4a"
-SRC_URI[sha256sum] = "9ae92159c1060f15e6a90f2c4ad227268b6aaa382c316fa49a31c496b9979e93"
+SRC_URI += "file://aclocal.patch"
+SRC_URI[md5sum] = "5eb05edf6b6c6e63d536d1c9fbfb2f7c"
+SRC_URI[sha256sum] = "116cbb3ac9e96d5dd7b39638a2f894a67fa3dcf06d794e6dae2b9a942ad13476"
 
 #
 # make install doesn't cover the shared lib
-- 
1.9.1


