Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T1GCe-0000ex-8S
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 14:26:33 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Aug 2012 05:14:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,766,1336374000"; d="scan'208";a="186181368"
Received: from unknown (HELO swold-mobl.amr.corp.intel.com) ([10.255.12.219])
	by orsmga002.jf.intel.com with ESMTP; 14 Aug 2012 05:14:34 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2012 15:13:21 +0300
Message-Id: <1667ef3181f6b7ac3df109da981507f5a9e0fec6.1344946189.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
References: <76ac3ef04e78b07441df7d2c93c4a002deac74d5.1344946189.git.sgw@linux.intel.com>
In-Reply-To: <cover.1344946189.git.sgw@linux.intel.com>
References: <cover.1344946189.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED REQUEST 34/64] net-tools: cleanup update-alternatives deprecated code
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
X-List-Received-Date: Tue, 14 Aug 2012 12:26:37 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../net-tools/net-tools_1.60-23.bb                 |   19 ++++++++++++-------
 1 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-23.bb b/meta/recipes-extended/net-tools/net-tools_1.60-23.bb
index 764955e..309363b 100644
--- a/meta/recipes-extended/net-tools/net-tools_1.60-23.bb
+++ b/meta/recipes-extended/net-tools/net-tools_1.60-23.bb
@@ -5,7 +5,7 @@ BUGTRACKER = "http://bugs.debian.org/net-tools"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
                     file://ifconfig.c;startline=11;endline=15;md5=da4c7bb79a5d0798faa99ef869721f4a"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/n/net-tools/net-tools_1.60.orig.tar.gz;name=tarball \
            ${DEBIAN_MIRROR}/main/n/net-tools/${BPN}_${PV}.diff.gz;apply=no;name=patch \
@@ -67,16 +67,21 @@ do_compile() {
 	oe_runmake
 }
 
+do_install() {
+	oe_runmake 'BASEDIR=${D}' install
+}
+
 inherit update-alternatives
 
 base_sbindir_progs = "arp ifconfig ipmaddr iptunnel mii-tool nameif plipconfig rarp route slattach"
-ALTERNATIVE_LINKS += "${base_sbindir}/${@' ${base_sbindir}/'.join((d.getVar('base_sbindir_progs', True)).split())}"
-
 base_bindir_progs  = "dnsdomainname domainname hostname netstat nisdomainname ypdomainname"
-ALTERNATIVE_LINKS += "${base_bindir}/${@' ${base_bindir}/'.join((d.getVar('base_bindir_progs', True)).split())}"
 
+ALTERNATIVE_${PN} = "${base_sbindir_progs} ${base_bindir_progs}"
+python __anonymous() {
+	for prog in d.getVar('base_sbindir_progs', True).split():
+		d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('base_sbindir', True), prog))
+	for prog in d.getVar('base_bindir_progs', True).split():
+		d.setVarFlag('ALTERNATIVE_LINK_NAME', prog, '%s/%s' % (d.getVar('base_bindir', True), prog))
+}
 ALTERNATIVE_PRIORITY = "100"
 
-do_install() {
-	oe_runmake 'BASEDIR=${D}' install
-}
-- 
1.7.7.6



