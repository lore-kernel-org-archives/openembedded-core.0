Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 727E778741
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Dec 2017 10:02:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 19438180A2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Dec 2017 11:02:53 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id ogjOtkwTz2Zj
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Dec 2017 11:02:52 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 2D6AA18105
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Dec 2017 11:02:52 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 150961E087
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Dec 2017 11:02:52 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 09E8D1E083
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Dec 2017 11:02:52 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Dec 2017 11:02:51 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id F2350290E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Dec 2017 11:02:51 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id vB6A2lRF022954
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Dec 2017 11:02:47 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id vB6A2lCK022952
	for openembedded-core@lists.openembedded.org;
	Wed, 6 Dec 2017 11:02:47 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Dec 2017 11:02:46 +0100
Message-Id: <20171206100246.22911-1-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [PATCH] iptables: Split the iptables modules into separate packages
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
X-List-Received-Date: Wed, 06 Dec 2017 10:02:52 -0000

By splitting the iptables modules into separate packages it is
possible to pick and choose the modules to install and thereby reduce
the total size of the installed modules.

Backwards compatibility is maintained by adding a recommendation of
iptables-modules, which is a meta package that depends on all the
generated packages.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

In our case we could save more than 1 MB by removing modules we do not
use.

 meta/recipes-extended/iptables/iptables_1.6.1.bb | 43 +++++++++++++++++-------
 1 file changed, 30 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-extended/iptables/iptables_1.6.1.bb b/meta/recipes-extended/iptables/iptables_1.6.1.bb
index b37c55a64e..b6e6cbe8a3 100644
--- a/meta/recipes-extended/iptables/iptables_1.6.1.bb
+++ b/meta/recipes-extended/iptables/iptables_1.6.1.bb
@@ -7,17 +7,6 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263\
                     file://iptables/iptables.c;beginline=13;endline=25;md5=c5cffd09974558cf27d0f763df2a12dc"
 
-RRECOMMENDS_${PN} = "kernel-module-x-tables \
-                     kernel-module-ip-tables \
-                     kernel-module-iptable-filter \
-                     kernel-module-iptable-nat \
-                     kernel-module-nf-defrag-ipv4 \
-                     kernel-module-nf-conntrack \
-                     kernel-module-nf-conntrack-ipv4 \
-                     kernel-module-nf-nat \
-                     kernel-module-ipt-masquerade"
-FILES_${PN} =+ "${libdir}/xtables/ ${datadir}/xtables"
-
 SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.bz2 \
            file://types.h-add-defines-that-are-required-for-if_packet.patch \
            file://0001-configure-Add-option-to-enable-disable-libnfnetlink.patch \
@@ -30,8 +19,8 @@ SRC_URI[sha256sum] = "0fc2d7bd5d7be11311726466789d4c65fb4c8e096c9182b56ce9744086
 
 inherit autotools pkgconfig
 
-EXTRA_OECONF = "--with-kernel=${STAGING_INCDIR} \
-               "
+EXTRA_OECONF = "--with-kernel=${STAGING_INCDIR}"
+
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
@@ -47,3 +36,31 @@ do_configure_prepend() {
 	# Keep ax_check_linker_flags.m4 which belongs to autoconf-archive.
 	rm -f libtool.m4 lt~obsolete.m4 ltoptions.m4 ltsugar.m4 ltversion.m4
 }
+
+PACKAGES += "${PN}-modules"
+PACKAGES_DYNAMIC += "^${PN}-module-.*"
+
+python populate_packages_prepend() {
+    modules = do_split_packages(d, '${libdir}/xtables', 'lib(.*)\.so$', '${PN}-module-%s', '${PN} module %s', extra_depends='')
+    if modules:
+        metapkg = d.getVar('PN') + '-modules'
+        d.appendVar('RDEPENDS_' + metapkg, ' ' + ' '.join(modules))
+}
+
+FILES_${PN} += "${datadir}/xtables"
+
+ALLOW_EMPTY_${PN}-modules = "1"
+
+RDEPENDS_${PN} = "iptables-module-xt-standard"
+RRECOMMENDS_${PN} = " \
+    ${PN}-modules \
+    kernel-module-x-tables \
+    kernel-module-ip-tables \
+    kernel-module-iptable-filter \
+    kernel-module-iptable-nat \
+    kernel-module-nf-defrag-ipv4 \
+    kernel-module-nf-conntrack \
+    kernel-module-nf-conntrack-ipv4 \
+    kernel-module-nf-nat \
+    kernel-module-ipt-masquerade \
+"
-- 
2.12.0


