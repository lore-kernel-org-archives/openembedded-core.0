Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1EDF678A84
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 18:20:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 01AC4182CF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 20:20:08 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id sTJsiFnRXS6v
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 20:20:03 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 22BBF185AF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 20:20:03 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BB0291E07D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 20:20:01 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AE16E1E07B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 20:20:01 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 20:20:01 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id A16A92FD2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 20:20:01 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id w6JIJnno007506
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 20:19:49 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id w6JIJnPj007505
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2018 20:19:49 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jul 2018 20:19:38 +0200
Message-Id: <2e174f160e5d3d5aa8c65f78011752221c0c1860.1532024250.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1532024250.git.pkj@axis.com>
References: <cover.1532024250.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 1/3] iptables: Split the iptables modules into separate packages
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
X-List-Received-Date: Thu, 19 Jul 2018 18:20:07 -0000

By splitting the iptables modules into separate packages it is
possible to pick and choose the modules to install and thereby reduce
the total size of the installed modules.

Backwards compatibility is maintained by adding a recommendation of
iptables-modules, which is a meta package that depends on all the
generated packages.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-extended/iptables/iptables_1.6.2.bb | 43 +++++++++++++++++-------
 1 file changed, 30 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-extended/iptables/iptables_1.6.2.bb b/meta/recipes-extended/iptables/iptables_1.6.2.bb
index 38a83d2b32..e00824f763 100644
--- a/meta/recipes-extended/iptables/iptables_1.6.2.bb
+++ b/meta/recipes-extended/iptables/iptables_1.6.2.bb
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
            file://0001-configure-Add-option-to-enable-disable-libnfnetlink.patch \
            file://0002-configure.ac-only-check-conntrack-when-libnfnetlink-enabled.patch \
@@ -28,8 +17,8 @@ SRC_URI[sha256sum] = "55d02dfa46263343a401f297d44190f2a3e5113c8933946f094ed40237
 
 inherit autotools pkgconfig
 
-EXTRA_OECONF = "--with-kernel=${STAGING_INCDIR} \
-               "
+EXTRA_OECONF = "--with-kernel=${STAGING_INCDIR}"
+
 PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
@@ -45,3 +34,31 @@ do_configure_prepend() {
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
+RDEPENDS_${PN} = "${PN}-module-xt-standard"
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


