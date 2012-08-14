Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Rongqing.Li@windriver.com>) id 1T1AJB-00010F-UC
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 08:08:54 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7E5uwgl000510
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2012 22:56:58 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.163) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Mon, 13 Aug 2012 22:56:57 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Aug 2012 13:56:56 +0800
Message-ID: <1344923816-24673-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Subject: [PATCH] subversion: two small fixes
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
X-List-Received-Date: Tue, 14 Aug 2012 06:08:54 -0000
Content-Type: text/plain

From: Roy.Li <rongqing.li@windriver.com>

Add missing build dependency on sqlite3

Disable Ruby checking. we do not have Ruby, and subversion always
checks ruby on host which leads to build error when ruby-dev is
installed on host.

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 .../subversion/subversion_1.6.15.bb                |    7 ++++---
 .../subversion/subversion_1.7.2.bb                 |    5 +++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/subversion/subversion_1.6.15.bb b/meta/recipes-devtools/subversion/subversion_1.6.15.bb
index 29029ce..244d7ea 100644
--- a/meta/recipes-devtools/subversion/subversion_1.6.15.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.6.15.bb
@@ -1,13 +1,13 @@
 DESCRIPTION = "The Subversion (svn) client"
 SECTION = "console/network"
-DEPENDS = "apr-util neon"
+DEPENDS = "apr-util neon sqlite3"
 RDEPENDS_${PN} = "neon"
 LICENSE = "Apache-2"
 HOMEPAGE = "http://subversion.tigris.org"
 
 BBCLASSEXTEND = "native"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://subversion.tigris.org/downloads/${BPN}-${PV}.tar.bz2 \
            file://disable-revision-install.patch \
@@ -23,7 +23,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2a69fef414e2cb907b4544298569300b"
 EXTRA_OECONF = " \
                 --without-berkeley-db --without-apxs --without-apache \
                 --without-swig --with-apr=${STAGING_BINDIR_CROSS} \
-                --with-apr-util=${STAGING_BINDIR_CROSS}"
+                --with-apr-util=${STAGING_BINDIR_CROSS} \
+                ac_cv_path_RUBY=none"
 
 inherit autotools
 
diff --git a/meta/recipes-devtools/subversion/subversion_1.7.2.bb b/meta/recipes-devtools/subversion/subversion_1.7.2.bb
index 4f71de5..1d36b63 100644
--- a/meta/recipes-devtools/subversion/subversion_1.7.2.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.7.2.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://subversion.tigris.org"
 
 BBCLASSEXTEND = "native"
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://libtool2.patch \
@@ -21,7 +21,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4a14fd2da3134e40a087eb4326a4ecd4"
 EXTRA_OECONF = " \
                 --without-berkeley-db --without-apxs --without-apache \
                 --without-swig --with-apr=${STAGING_BINDIR_CROSS} \
-                --with-apr-util=${STAGING_BINDIR_CROSS}"
+                --with-apr-util=${STAGING_BINDIR_CROSS} \
+                ac_cv_path_RUBY=none"
 
 inherit autotools
 
-- 
1.7.4.1



