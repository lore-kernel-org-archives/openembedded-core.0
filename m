Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1TI7N1-0001my-CO
	for openembedded-core@lists.openembedded.org;
	Sun, 30 Sep 2012 02:26:55 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q8U0DsUZ027486
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2012 17:13:55 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.309.2;
	Sat, 29 Sep 2012 17:13:54 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 29 Sep 2012 19:19:13 -0500
Message-ID: <82c8b22ec4952ac7e38e029618a36c12288b8be3.1348963477.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1348963477.git.mark.hatle@windriver.com>
References: <cover.1348963477.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 07/12] Cleanup: fix PN == BPN cases
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
X-List-Received-Date: Sun, 30 Sep 2012 00:26:55 -0000
Content-Type: text/plain

When building target packages, it used to be enought to check for PN == BPN, however
with the multilib configurations, this can lead to subtle errors.  Change instances
of PN == BPN, to ${CLASSOVERRIDE} == 'cross-target'.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/distutils-base.bbclass        |    2 +-
 meta/recipes-core/ncurses/ncurses.inc      |    6 +++---
 meta/recipes-extended/pigz/pigz.inc        |    4 +++-
 meta/recipes-support/apr/apr-util_1.4.1.bb |    4 ++--
 4 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/meta/classes/distutils-base.bbclass b/meta/classes/distutils-base.bbclass
index c761b36..3b43e76 100644
--- a/meta/classes/distutils-base.bbclass
+++ b/meta/classes/distutils-base.bbclass
@@ -1,5 +1,5 @@
 DEPENDS  += "${@["python-native python", ""][(d.getVar('PACKAGES', True) == '')]}"
-RDEPENDS_${PN} += "${@['', 'python-core']['${PN}' == '${BPN}']}"
+RDEPENDS_${PN} += "${@['', 'python-core']['${CLASSOVERRIDE}' == 'class-target']}"
 
 inherit distutils-common-base pythonnative
 
diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 91b1f34..ed7f001 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://ncurses/base/version.c;beginline=1;endline=27;md5=cbc
 SECTION = "libs"
 DEPENDS = "ncurses-native"
 DEPENDS_virtclass-native = ""
-INC_PR = "r10"
+INC_PR = "r11"
 
 inherit autotools binconfig multilib_header
 
@@ -244,8 +244,8 @@ FILES_${PN}-tools = "\
   ${bindir}/infotocap \
   ${bindir}/captoinfo \
   ${bindir}/infocmp \
-  ${bindir}/clear${@['', '.${BPN\x7d'][d.getVar('PN', 1) == 'ncurses']} \
-  ${bindir}/reset${@['', '.${BPN\x7d'][d.getVar('PN', 1) == 'ncurses']} \
+  ${bindir}/clear${@['', '.${BPN\x7d']['${CLASSOVERRIDE}' == 'class-target']} \
+  ${bindir}/reset${@['', '.${BPN\x7d']['${CLASSOVERRIDE}' == 'class-target']} \
   ${bindir}/tack \
   ${bindir}/tabs \
 "
diff --git a/meta/recipes-extended/pigz/pigz.inc b/meta/recipes-extended/pigz/pigz.inc
index be37e8a..3721c97 100644
--- a/meta/recipes-extended/pigz/pigz.inc
+++ b/meta/recipes-extended/pigz/pigz.inc
@@ -7,6 +7,8 @@ HOMEPAGE = "http://zlib.net/pigz/"
 SECTION = "console/utils"
 LICENSE = "Zlib"
 
+PR = "r1"
+
 SRC_URI = "http://zlib.net/pigz/pigz-${PV}.tar.gz \
            file://ldflags.patch"
 
@@ -15,7 +17,7 @@ PROVIDES_virtclass-native += "gzip-native"
 DEPENDS = "zlib"
 
 do_install () {
-	if [ "${PN}" = "${BPN}" ] ; then
+	if [ "${CLASSOVERRIDE}" = "class-target" ] ; then
 		# Install files into /bin (FHS), which is typical place for gzip
 	        install -d ${D}${base_bindir}	        
 		install ${B}/pigz ${D}${base_bindir}/gzip
diff --git a/meta/recipes-support/apr/apr-util_1.4.1.bb b/meta/recipes-support/apr/apr-util_1.4.1.bb
index 0516bc4..238af97 100644
--- a/meta/recipes-support/apr/apr-util_1.4.1.bb
+++ b/meta/recipes-support/apr/apr-util_1.4.1.bb
@@ -9,7 +9,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=519e0a18e03f7c023070568c14b077bb \
                     file://include/apu_version.h;endline=17;md5=806685a84e71f10c80144c48eb35df42"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.gz \
            file://configfix.patch \
@@ -33,7 +33,7 @@ inherit autotools lib_package binconfig
 OE_BINCONFIG_EXTRA_MANGLE = " -e 's:location=source:location=installed:'"
 
 do_configure_append() {
-	if [ "${PN}" == "${BPN}" ]; then
+	if [ "${CLASSOVERRIDE}" = "class-target" ]; then
 		cp ${STAGING_DATADIR}/apr/apr_rules.mk ${S}/build/rules.mk
 	fi
 }
-- 
1.7.3.4



