Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SJvEF-0000Ow-DJ
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Apr 2012 01:21:03 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q3GNBbef000656
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 16:11:37 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 16 Apr 2012 16:11:37 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Apr 2012 18:16:03 -0500
Message-ID: <fb4308a2c36e4a210413ba5790d7fd821a0ca947.1334616144.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1334616144.git.mark.hatle@windriver.com>
References: <cover.1334616144.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 09/17] shadow: Use update-alternatives
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
X-List-Received-Date: Mon, 16 Apr 2012 23:21:03 -0000
Content-Type: text/plain

Switch to using ALTERNATIVE_LINKS to ensure the update-alternatives are setup
properly, along with the package provides.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-extended/shadow/shadow_4.1.4.3.bb |   42 +++++++++++------------
 1 files changed, 20 insertions(+), 22 deletions(-)

diff --git a/meta/recipes-extended/shadow/shadow_4.1.4.3.bb b/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
index f892eb9..e27ca47 100644
--- a/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
+++ b/meta/recipes-extended/shadow/shadow_4.1.4.3.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=08c553a87d4e51bbed50b20e0adcaede \
 
 DEPENDS = "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS_${PN} = "shadow-securetty ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_PLUGINS}', '', d)}"
-PR = "r8"
+PR = "r9"
 
 SRC_URI = "http://pkg-shadow.alioth.debian.org/releases/${BPN}-${PV}.tar.bz2 \
            file://login_defs_pam.sed \
@@ -84,14 +84,12 @@ do_install_append() {
 	sed -i '/^CREATE_MAIL_SPOOL/ s:^:#:' ${D}${sysconfdir}/default/useradd
 
 	install -d ${D}${sbindir} ${D}${base_sbindir} ${D}${base_bindir} 
-	for i in passwd chfn newgrp chsh groups ; do
-		mv ${D}${bindir}/$i ${D}${bindir}/$i.${PN}
-	done
 
-	mv ${D}${sbindir}/chpasswd ${D}${sbindir}/chpasswd.${PN}
+	# We create the ${PN} versions to avoid link problems
+	mv ${D}${bindir}/newgrp ${D}${bindir}/newgrp.${PN}
 	mv ${D}${sbindir}/vigr ${D}${base_sbindir}/vigr.${PN}
 	mv ${D}${sbindir}/vipw ${D}${base_sbindir}/vipw.${PN}
-	mv ${D}${bindir}/login ${D}${base_bindir}/login.${PN}
+	mv ${D}${bindir}/login ${D}${base_bindir}/login
 
 	# Handle link properly after rename, otherwise missing files would
 	# lead rpm failed dependencies.
@@ -99,17 +97,23 @@ do_install_append() {
 	ln -sf newgrp.${PN} ${D}${bindir}/sg
 }
 
-pkg_postinst_${PN} () {
-	update-alternatives --install ${bindir}/passwd passwd passwd.${PN} 200
-	update-alternatives --install ${sbindir}/chpasswd chpasswd chpasswd.${PN} 200
-	update-alternatives --install ${bindir}/chfn chfn chfn.${PN} 200
-	update-alternatives --install ${bindir}/newgrp newgrp newgrp.${PN} 200
-	update-alternatives --install ${bindir}/chsh chsh chsh.${PN} 200
-	update-alternatives --install ${bindir}/groups groups groups.${PN} 200
-	update-alternatives --install ${base_bindir}/login login login.${PN} 200
-	update-alternatives --install ${base_sbindir}/vipw vipw vipw.${PN} 200
-	update-alternatives --install ${base_sbindir}/vigr vigr vigr.${PN} 200
+inherit update-alternatives
+
+ALTERNATIVE_PRIORITY = "200"
+
+bindir_progs = "passwd chfn newgrp chsh groups"
+ALTERNATIVE_LINKS += "${bindir}/${@' ${bindir}/'.join((d.getVar('bindir_progs', True)).split())}"
+
+sbindir_progs = "chpasswd"
+ALTERNATIVE_LINKS += "${sbindir}/${@' ${sbindir}/'.join((d.getVar('sbindir_progs', True)).split())}"
+
+base_bindir_progs = "login"
+ALTERNATIVE_LINKS += "${base_bindir}/${@' ${base_bindir}/'.join((d.getVar('base_bindir_progs', True)).split())}"
 
+base_sbindir_progs = "vipw vigr"
+ALTERNATIVE_LINKS += "${base_sbindir}/${@' ${base_sbindir}/'.join((d.getVar('base_sbindir_progs', True)).split())}"
+
+pkg_postinst_${PN} () {
 	if [ "x$D" != "x" ]; then
 	  rootarg="--root=$D"
 	else
@@ -119,9 +123,3 @@ pkg_postinst_${PN} () {
 	pwconv $rootarg
 	grpconv $rootarg
 }
-
-pkg_prerm_${PN} () {
-	for i in passwd chpasswd chfn newgrp chsh login vipw vigr ; do
-		update-alternatives --remove $i $i.${PN}
-	done
-}
-- 
1.7.3.4



