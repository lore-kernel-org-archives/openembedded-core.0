Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1THdIp-000431-RW
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 18:20:36 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 28 Sep 2012 09:07:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,502,1344236400"; d="scan'208";a="227814840"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.60])
	by fmsmga001.fm.intel.com with ESMTP; 28 Sep 2012 09:07:40 -0700
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Sep 2012 18:13:12 +0300
Message-Id: <1348845192-28857-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Constantin Musca <constantinx.musca@intel.com>
Subject: [PATCH v2] libnss-mdns: fix mDNS resolving speed
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
X-List-Received-Date: Fri, 28 Sep 2012 16:20:36 -0000

We need to fix the "hosts: files dns mdns4" nsswitch.conf line
because for a .local lookup it does a DNS lookup first which will fail.
The recommended solution is:
hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4

[YOCTO #2502]

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 .../libnss-mdns/libnss-mdns_0.10.bb                |   14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
index a1f2f9a..f7356e4 100644
--- a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
+++ b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 DEPENDS = "avahi"
 RDEPENDS_${PN} = "avahi-daemon"
-PR = "r5"
+PR = "r6"
 
 SRC_URI = "http://0pointer.de/lennart/projects/nss-mdns/nss-mdns-${PV}.tar.gz"
 
@@ -24,13 +24,13 @@ DEBIANNAME_${PN} = "libnss-mdns"
 EXTRA_OECONF = "--libdir=${base_libdir} --disable-lynx --enable-avahi"
 
 pkg_postinst_${PN} () {
-if ! grep -q '^hosts:.*\<mdns4\>' $D/etc/nsswitch.conf; then
-	sed -e 's/^hosts:.*/& mdns4/' -i $D/etc/nsswitch.conf
-fi
+	sed -e '/^hosts:/s/\s*\<mdns4\>//' \
+		-e 's/\(^hosts:.*\)\(\<files\>\)\(.*\)\(\<dns\>\)\(.*\)/\1\2 mdns4_minimal [NOTFOUND=return]\3\4 mdns4\5/' \
+		-i $D/etc/nsswitch.conf
 }
 
 pkg_prerm_${PN} () {
-if grep -q '^hosts:.*\<mdns4\>' /etc/nsswitch.conf; then
-	sed -e '/^hosts:/s/\s\<mdns4\>//' -i /etc/nsswitch.conf
-fi
+	sed -e '/^hosts:/s/\s*\<mdns4\>//' \
+		-e '/^hosts:/s/\s*mdns4_minimal\s\+\[NOTFOUND=return\]//' \
+		-i /etc/nsswitch.conf
 }
-- 
1.7.9.5



