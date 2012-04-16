Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SJvEi-0000RH-LM
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Apr 2012 01:21:33 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q3GNC7aB000676
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 16:12:07 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 16 Apr 2012 16:12:06 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Apr 2012 18:16:27 -0500
Message-ID: <a2a9fdfc936c5b9e78c0d7aefc3c42a7f09b19dd.1334616144.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1334616144.git.mark.hatle@windriver.com>
References: <cover.1334616144.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 14/17] console-tools: Use update-alternatives
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
X-List-Received-Date: Mon, 16 Apr 2012 23:21:33 -0000
Content-Type: text/plain

Use update-alternatives and sync to the way the replace kbd package
does things.  Using update-alternatives ensures that the proper provides
are setup in the packages.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../console-tools/console-tools_0.3.2.bb           |   27 +++----------------
 1 files changed, 5 insertions(+), 22 deletions(-)

diff --git a/meta/recipes-core/console-tools/console-tools_0.3.2.bb b/meta/recipes-core/console-tools/console-tools_0.3.2.bb
index 5f1d640..6027d4a 100644
--- a/meta/recipes-core/console-tools/console-tools_0.3.2.bb
+++ b/meta/recipes-core/console-tools/console-tools_0.3.2.bb
@@ -3,7 +3,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING.kbd;md5=9b2d91511d3d80d4d20ac6e6b0137fe9"
 SUMMARY = "Allows you to set-up and manipulate the Linux console."
 DESCRIPTION = "Provides tools that enable the set-up and manipulation of the linux console and console-font files."
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/lct/console-tools-${PV}.tar.gz \
            file://codepage.patch \
@@ -30,28 +30,11 @@ do_compile () {
 	oe_runmake 'SUBDIRS=${SUBDIRS}'
 }
 
-inherit autotools gettext
+inherit autotools gettext update-alternatives
 
-do_install () {
-	autotools_do_install
-	mv ${D}${bindir}/chvt ${D}${bindir}/chvt.${PN}
-	mv ${D}${bindir}/deallocvt ${D}${bindir}/deallocvt.${PN}
-	mv ${D}${bindir}/openvt ${D}${bindir}/openvt.${PN}
-	mv ${D}${bindir}/fgconsole ${D}${bindir}/fgconsole.${PN}
-}
-
-pkg_postinst_${PN} () {
-	update-alternatives --install ${bindir}/chvt chvt chvt.${PN} 100
-	update-alternatives --install ${bindir}/deallocvt deallocvt deallocvt.${PN} 100
-	update-alternatives --install ${bindir}/openvt openvt openvt.${PN} 100
-	update-alternatives --install ${bindir}/fgconsole fgconsole fgconsole.${PN} 100
-}
+ALTERNATIVE_PRIORITY = "100"
 
-pkg_prerm_${PN} () {
-	update-alternatives --remove chvt chvt.${PN}
-	update-alternatives --remove deallocvt deallocvt.${PN}
-	update-alternatives --remove openvt openvt.${PN}
-	update-alternatives --remove fgconsole fgconsole.${PN}
-}
+bindir_progs = "chvt deallocvt fgconsole openvt"
+ALTERNATIVE_LINKS = "${bindir}/${@' ${bindir}/'.join((d.getVar('bindir_progs', True)).split())}"
 
 RDEPENDS_${PN} = "bash"
-- 
1.7.3.4



