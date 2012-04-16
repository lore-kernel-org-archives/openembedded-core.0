Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SJun6-0007tP-PV
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Apr 2012 00:53:01 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q3GMhZir000282
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 15:43:35 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 16 Apr 2012 15:42:43 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Apr 2012 17:45:07 -0500
Message-ID: <e4178ec1b28712fd0e491f18bed5a3d6eb6ad261.1334616144.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1334616144.git.mark.hatle@windriver.com>
References: <cover.1334616144.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 04/17] grep: Use update-alternatives
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
X-List-Received-Date: Mon, 16 Apr 2012 22:53:01 -0000
Content-Type: text/plain

Use ALTERNATIVE_LINKS to be sure the links and provide info is setup
properly.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-extended/grep/grep_2.5.1a.bb |   25 +++++++++----------------
 meta/recipes-extended/grep/grep_2.9.bb    |   22 ++++++++--------------
 2 files changed, 17 insertions(+), 30 deletions(-)

diff --git a/meta/recipes-extended/grep/grep_2.5.1a.bb b/meta/recipes-extended/grep/grep_2.5.1a.bb
index 64064fc..332a4d0 100644
--- a/meta/recipes-extended/grep/grep_2.5.1a.bb
+++ b/meta/recipes-extended/grep/grep_2.5.1a.bb
@@ -5,7 +5,7 @@ SECTION = "console/utils"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${GNU_MIRROR}/grep/grep-${PV}.tar.bz2 \
            file://uclibc-fix.patch"
@@ -21,23 +21,16 @@ do_configure_prepend () {
 	rm -f ${S}/m4/init.m4
 }
 
+inherit update-alternatives
+
+ALTERNATIVE_LINKS = "${base_bindir}/grep ${base_bindir}/egrep ${base_bindir}/fgrep"
+ALTERNATIVE_PRIORITY = "100"
+
 do_install () {
 	autotools_do_install
 	install -d ${D}${base_bindir}
-	mv ${D}${bindir}/grep ${D}${base_bindir}/grep.${PN}
-	mv ${D}${bindir}/egrep ${D}${base_bindir}/egrep.${PN}
-	mv ${D}${bindir}/fgrep ${D}${base_bindir}/fgrep.${PN}
+	mv ${D}${bindir}/grep ${D}${base_bindir}/grep
+	mv ${D}${bindir}/egrep ${D}${base_bindir}/egrep
+	mv ${D}${bindir}/fgrep ${D}${base_bindir}/fgrep
 	rmdir ${D}${bindir}/
 }
-
-pkg_postinst_${PN} () {
-	update-alternatives --install ${base_bindir}/grep grep grep.${PN} 100
-	update-alternatives --install ${base_bindir}/egrep egrep egrep.${PN} 100
-	update-alternatives --install ${base_bindir}/fgrep fgrep fgrep.${PN} 100
-}
-
-pkg_prerm_${PN} () {
-	update-alternatives --remove grep grep.${PN}
-	update-alternatives --remove egrep egrep.${PN}
-	update-alternatives --remove fgrep fgrep.${PN}
-}
diff --git a/meta/recipes-extended/grep/grep_2.9.bb b/meta/recipes-extended/grep/grep_2.9.bb
index 1bc79f2..7710e65 100644
--- a/meta/recipes-extended/grep/grep_2.9.bb
+++ b/meta/recipes-extended/grep/grep_2.9.bb
@@ -21,23 +21,17 @@ do_configure_prepend () {
 	rm -f ${S}/m4/init.m4
 }
 
+inherit update-alternatives
+
+ALTERNATIVE_LINKS = "${base_bindir}/grep ${base_bindir}/egrep ${base_bindir}/fgrep"
+ALTERNATIVE_PRIORITY = "100"
+
 do_install () {
 	autotools_do_install
 	install -d ${D}${base_bindir}
-	mv ${D}${bindir}/grep ${D}${base_bindir}/grep.${PN}
-	mv ${D}${bindir}/egrep ${D}${base_bindir}/egrep.${PN}
-	mv ${D}${bindir}/fgrep ${D}${base_bindir}/fgrep.${PN}
+	mv ${D}${bindir}/grep ${D}${base_bindir}/grep
+	mv ${D}${bindir}/egrep ${D}${base_bindir}/egrep
+	mv ${D}${bindir}/fgrep ${D}${base_bindir}/fgrep
 	rmdir ${D}${bindir}/
 }
 
-pkg_postinst_${PN} () {
-	update-alternatives --install ${base_bindir}/grep grep grep.${PN} 100
-	update-alternatives --install ${base_bindir}/egrep egrep egrep.${PN} 100
-	update-alternatives --install ${base_bindir}/fgrep fgrep fgrep.${PN} 100
-}
-
-pkg_prerm_${PN} () {
-	update-alternatives --remove grep grep.${PN}
-	update-alternatives --remove egrep egrep.${PN}
-	update-alternatives --remove fgrep fgrep.${PN}
-}
-- 
1.7.3.4



