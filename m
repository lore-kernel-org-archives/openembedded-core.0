Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 013A07701D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 07:59:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8U7xZNi003067
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Sep 2015 00:59:35 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 30 Sep 2015 00:59:34 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Sep 2015 03:59:33 -0400
Message-ID: <1443599973-94590-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] apr-utils: cleanup buildpaths for target stuffs
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
X-List-Received-Date: Wed, 30 Sep 2015 07:59:35 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

* cleanup buildpaths from apu-1-config:
  - remove ${STAGING_DIR_HOST} from CC, CPP ...
  - set APU_SOURCE_DIR, APU_BUILD_DIR as empty

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta/recipes-support/apr/apr-util_1.5.4.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-support/apr/apr-util_1.5.4.bb b/meta/recipes-support/apr/apr-util_1.5.4.bb
index 6a14d14..a36f13d 100644
--- a/meta/recipes-support/apr/apr-util_1.5.4.bb
+++ b/meta/recipes-support/apr/apr-util_1.5.4.bb
@@ -60,6 +60,12 @@ do_configure_append_class-nativesdk() {
 	sed -i "s#\(LIBTOOL=\$(apr_builddir)\).*#\1/libtool#" ${S}/build/rules.mk
 }
 
+do_install_append_class-target() {
+	sed -i -e 's,${STAGING_DIR_HOST},,g' \
+	       -e 's,APU_SOURCE_DIR=.*,APR_SOURCE_DIR=,g' \
+	       -e 's,APU_BUILD_DIR=.*,APR_BUILD_DIR=,g' ${D}${bindir}/apu-1-config
+}
+
 FILES_${PN}     += "${libdir}/apr-util-1/apr_dbm_gdbm-1.so"
 FILES_${PN}-dev += "${libdir}/aprutil.exp ${libdir}/apr-util-1/apr_dbm_gdbm.so* ${libdir}/apr-util-1/apr_dbm_gdbm.la"
 FILES_${PN}-dbg += "${libdir}/apr-util-1/.debug/*"
-- 
1.9.1


