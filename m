Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 84C4A6EEDF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 02:56:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s1D2uVLf021799
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 12 Feb 2014 18:56:33 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Wed, 12 Feb 2014 18:55:22 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Feb 2014 10:54:06 +0800
Message-ID: <44d5a04a1b2ed639f0f65a05418a63d4cfe7b6d5.1392259689.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1392259689.git.hongxu.jia@windriver.com>
References: <cover.1392259689.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 2/2] socat: enable ptest
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
X-List-Received-Date: Thu, 13 Feb 2014 02:56:34 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-connectivity/socat/socat/run-ptest  |  5 +++++
 meta/recipes-connectivity/socat/socat_1.7.2.3.bb | 12 ++++++++++--
 2 files changed, 15 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/socat/socat/run-ptest

diff --git a/meta/recipes-connectivity/socat/socat/run-ptest b/meta/recipes-connectivity/socat/socat/run-ptest
new file mode 100644
index 0000000..1fffab1
--- /dev/null
+++ b/meta/recipes-connectivity/socat/socat/run-ptest
@@ -0,0 +1,5 @@
+#!/bin/bash
+
+export SOCAT="/usr/bin/socat"
+
+./test.sh
diff --git a/meta/recipes-connectivity/socat/socat_1.7.2.3.bb b/meta/recipes-connectivity/socat/socat_1.7.2.3.bb
index 99060b1..2e763bb 100644
--- a/meta/recipes-connectivity/socat/socat_1.7.2.3.bb
+++ b/meta/recipes-connectivity/socat/socat_1.7.2.3.bb
@@ -7,6 +7,8 @@ SECTION = "console/network"
 
 DEPENDS = "openssl readline"
 
+RDEPENDS_${PN}-ptest += "bash"
+
 LICENSE = "GPL-2.0+-with-OpenSSL-exception"
 LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760 \
                     file://README;beginline=252;endline=282;md5=79246f11a1db0b6ccec54d1fb711c01e"
@@ -14,7 +16,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760 \
 
 SRC_URI = "http://www.dest-unreach.org/socat/download/socat-${PV}.tar.bz2 \
            file://compile.patch \
-           file://fix-xxx_SHIFT-autoheader.patch"
+           file://fix-xxx_SHIFT-autoheader.patch \
+           file://run-ptest \
+"
 
 SRC_URI[md5sum] = "75008d8baf7c6c9e27aa7afb34a622de"
 SRC_URI[sha256sum] = "0598ac54af7b138cda9e3c141bcf0cc63eeb2ab31f468a772dc3f7eb3896aad0"
@@ -27,7 +31,7 @@ EXTRA_OECONF += "ac_cv_have_z_modifier=yes sc_cv_sys_crdly_shift=9 \
         ac_cv_ispeed_offset=13 \
 "
 
-inherit autotools
+inherit autotools ptest
 
 do_configure_prepend() {
     sed '/AC_DEFINE_UNQUOTED(ISPEED_OFFSET/a\AC_DEFINE(OSPEED_OFFSET,\
@@ -38,3 +42,7 @@ do_install_prepend () {
     mkdir -p ${D}${bindir}
     install -d ${D}${bindir} ${D}${mandir}/man1
 }
+
+do_install_ptest() {
+    cp -r ${S}/*.sh ${D}${PTEST_PATH}
+}
-- 
1.8.1.2


