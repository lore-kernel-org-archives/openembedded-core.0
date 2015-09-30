Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 949DB76DF8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 07:59:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8U7xP6v007146
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 00:59:25 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 30 Sep 2015 00:59:25 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Sep 2015 03:59:23 -0400
Message-ID: <1443599963-94511-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] apr: cleanup buildpaths from target stuffs
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
X-List-Received-Date: Wed, 30 Sep 2015 07:59:28 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

* cleanup buildpaths from apr_rules.mk and apr-1-config:
  - remove ${STAGING_DIR_HOST} from CC, CPP ...
  - set APR_SOURCE_DIR, APR_BUILD_DIR as empty

* install ${HOST_SYS}-libtool to sysroot only, it's required for
  building apache2 but not suitable for target.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta/recipes-support/apr/apr_1.5.2.bb | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/apr/apr_1.5.2.bb b/meta/recipes-support/apr/apr_1.5.2.bb
index c1f7f38..e12a176 100644
--- a/meta/recipes-support/apr/apr_1.5.2.bb
+++ b/meta/recipes-support/apr/apr_1.5.2.bb
@@ -55,7 +55,13 @@ do_configure_append() {
 do_install_append() {
 	oe_multilib_header apr.h
 	install -d ${D}${datadir}/apr
-	cp ${S}/${HOST_SYS}-libtool ${D}${datadir}/build-1/libtool
+}
+
+do_install_append_class-target() {
+	sed -i -e 's,${STAGING_DIR_HOST},,g' ${D}${datadir}/build-1/apr_rules.mk
+	sed -i -e 's,${STAGING_DIR_HOST},,g' \
+	       -e 's,APR_SOURCE_DIR=.*,APR_SOURCE_DIR=,g' \
+	       -e 's,APR_BUILD_DIR=.*,APR_BUILD_DIR=,g' ${D}${bindir}/apr-1-config
 }
 
 SSTATE_SCAN_FILES += "apr_rules.mk libtool"
@@ -73,6 +79,7 @@ apr_sysroot_preprocess () {
 	cp ${S}/build/mkdir.sh $d/
 	cp ${S}/build/make_exports.awk $d/
 	cp ${S}/build/make_var_export.awk $d/
+	cp ${S}/${HOST_SYS}-libtool ${SYSROOT_DESTDIR}${datadir}/build-1/libtool
 }
 
 do_compile_ptest() {
-- 
1.9.1


