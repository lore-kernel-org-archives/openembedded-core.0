Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DCB7D6A4A9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2013 08:09:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5E89JIc018590
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2013 01:09:19 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Fri, 14 Jun 2013 01:09:19 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Jun 2013 16:09:17 +0800
Message-ID: <1371197357-10706-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Subject: [PATCH] acl attr libcap: mark shared libraries executable
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
X-List-Received-Date: Fri, 14 Jun 2013 08:09:19 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

While it is not necessary that shared libraries be executable,
if they are not marked as such bitbake will not examine them
for debug information.  So, we make them executable at the end of
installation.

Signed-off-by: Joe Slater <jslater@windriver.com>
Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-support/attr/acl.inc      |    4 ++++
 meta/recipes-support/attr/attr.inc     |    4 ++++
 meta/recipes-support/libcap/libcap.inc |    7 ++++++-
 3 files changed, 14 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-support/attr/acl.inc b/meta/recipes-support/attr/acl.inc
index b504517..060d09b 100644
--- a/meta/recipes-support/attr/acl.inc
+++ b/meta/recipes-support/attr/acl.inc
@@ -20,7 +20,11 @@ do_configure_append() {
 }

 # libdir should point to .la
+# install somehow leaves the actual shared library 644 instead of 755
+# this means it will be ignored for debug info extraction
+#
 do_install_append() {
 	sed -i ${D}${libdir}/libacl.la -e \
 	    s,^libdir=\'${base_libdir}\'$,libdir=\'${libdir}\',
+	chmod a+x ${D}${base_libdir}/*.so.*.*
 }
diff --git a/meta/recipes-support/attr/attr.inc b/meta/recipes-support/attr/attr.inc
index eaed7af..375d2e9 100644
--- a/meta/recipes-support/attr/attr.inc
+++ b/meta/recipes-support/attr/attr.inc
@@ -18,7 +18,11 @@ SRC_URI = "http://download.savannah.gnu.org/releases/attr/${BP}.src.tar.gz \
 require ea-acl.inc

 # libdir should point to .la
+# install somehow leaves the actual shared library 644 instead of 755
+# this means it will be ignored for debug info extraction
+#
 do_install_append() {
 	sed -i ${D}${libdir}/libattr.la -e \
 	    s,^libdir=\'${base_libdir}\'$,libdir=\'${libdir}\',
+	chmod a+x ${D}${base_libdir}/*.so.*.*
 }
diff --git a/meta/recipes-support/libcap/libcap.inc b/meta/recipes-support/libcap/libcap.inc
index 7f16a56..2fd5718 100644
--- a/meta/recipes-support/libcap/libcap.inc
+++ b/meta/recipes-support/libcap/libcap.inc
@@ -12,7 +12,7 @@ DEPENDS_class-native = "perl-native-runtime"

 SRC_URI = "${DEBIAN_MIRROR}/main/libc/libcap2/${BPN}2_${PV}.orig.tar.gz"

-PR = "r1"
+PR = "r2"

 inherit lib_package

@@ -51,6 +51,11 @@ do_install_append() {
 		mv ${D}${libdir}/* ${D}${base_libdir}
 		rmdir ${D}${libdir}
 	fi
+
+	# install somehow leaves the actual shared library 644 instead of 755
+	# this means it will be ignored for debug info extraction
+	#
+	chmod a+x ${D}${base_libdir}/*.so.*.*
 }

 FILES_${PN}-dev += "${base_libdir}/*.so"
--
1.7.4.1


