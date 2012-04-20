Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SLH7M-0005tX-11
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Apr 2012 18:55:32 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 20 Apr 2012 09:45:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="156167858"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.163])
	by fmsmga002.fm.intel.com with ESMTP; 20 Apr 2012 09:45:39 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Apr 2012 09:45:06 -0700
Message-Id: <224c1804357d2d7d7cbf549b22f73c59cdac8983.1334940120.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1334940120.git.sgw@linux.intel.com>
References: <cover.1334940120.git.sgw@linux.intel.com>
In-Reply-To: <cover.1334940120.git.sgw@linux.intel.com>
References: <cover.1334940120.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 15/43] net-tools: Use update-alternatives
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
X-List-Received-Date: Fri, 20 Apr 2012 16:55:32 -0000

From: Mark Hatle <mark.hatle@windriver.com>

Switch to using ALTERNATIVE_LINKS to ensure the update-alternatives are setup
properly, along with the package provides.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../net-tools/net-tools_1.60-23.bb                 |   28 ++++++-------------
 1 files changed, 9 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-23.bb b/meta/recipes-extended/net-tools/net-tools_1.60-23.bb
index c8d2c57..b9a05c6 100644
--- a/meta/recipes-extended/net-tools/net-tools_1.60-23.bb
+++ b/meta/recipes-extended/net-tools/net-tools_1.60-23.bb
@@ -5,7 +5,7 @@ BUGTRACKER = "http://bugs.debian.org/net-tools"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
                     file://ifconfig.c;startline=11;endline=15;md5=da4c7bb79a5d0798faa99ef869721f4a"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/n/net-tools/net-tools_1.60.orig.tar.gz;name=tarball \
            ${DEBIAN_MIRROR}/main/n/net-tools/${BPN}_${PV}.diff.gz;apply=no;name=patch \
@@ -67,26 +67,16 @@ do_compile() {
 	oe_runmake
 }
 
-do_install() {
-	oe_runmake 'BASEDIR=${D}' install
+inherit update-alternatives
 
-	for app in ${D}/${base_sbindir}/* ${D}/${base_bindir}/*; do
-		mv $app $app.${PN}
-	done
-}
+base_sbindir_progs = "arp ifconfig ipmaddr iptunnel mii-tool nameif plipconfig rarp route slattach"
+ALTERNATIVE_LINKS += "${base_sbindir}/${@' ${base_sbindir}/'.join((d.getVar('base_sbindir_progs', True)).split())}"
 
-pkg_postinst_${PN} () {
-	for app in arp ifconfig ipmaddr iptunnel mii-tool nameif plipconfig rarp route slattach ; do
-		update-alternatives --install ${base_sbindir}/$app $app $app.${PN} 100
-	done
+base_bindir_progs  = "dnsdomainname domainname hostname netstat nisdomainname ypdomainname"
+ALTERNATIVE_LINKS += "${base_bindir}/${@' ${base_bindir}/'.join((d.getVar('base_bindir_progs', True)).split())}"
 
-	for app in dnsdomainname domainname hostname netstat nisdomainname ypdomainname ; do
-		update-alternatives --install ${base_bindir}/$app $app $app.${PN} 100
-	done
-}
+ALTERNATIVE_PRIORITY = "100"
 
-pkg_prerm_${PN} () {
-	for app in arp ifconfig ipmaddr iptunnel mii-tool nameif plipconfig rarp route slattach dnsdomainname domainname hostname netstat nisdomainname ypdomainname ; do
-		update-alternatives --remove $app $app.${PN}
-	done
+do_install() {
+	oe_runmake 'BASEDIR=${D}' install
 }
-- 
1.7.7.6



