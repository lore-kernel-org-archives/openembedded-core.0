Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 6AD706FF93
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 15:07:36 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u0TF7arj022575; Fri, 29 Jan 2016 09:07:36 -0600
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016012909073628-440974 ;
	Fri, 29 Jan 2016 09:07:36 -0600 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Jan 2016 17:07:21 +0200
Message-Id: <1454080041-28576-1-git-send-email-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.7.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 01/29/2016 09:07:36 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 01/29/2016 09:07:36 AM,
	Serialize complete at 01/29/2016 09:07:36 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-01-29_06:, , signatures=0
Cc: Adam Chappell <adam.chappell@ni.com>,
	Jacob Champion <jacob.champion@ni.com>
Subject: [PATCH v3 1/1] apr-util: add ldap crypto and sqlite3 to PACKAGECONFIG
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
X-List-Received-Date: Fri, 29 Jan 2016 15:07:37 -0000

Enable apr-util's cryptographic routines so that the apache2 package
can encrypt session data. Also add sqlite3 and ldap modules, disabled
by default.

Signed-off-by: Adam Chappell <adam.chappell@ni.com>
Signed-off-by: Jacob Champion <jacob.champion@ni.com>
Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Acked-by: Ken Sharp <ken.sharp@ni.com>
---
 meta/recipes-support/apr/apr-util_1.5.4.bb | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/apr/apr-util_1.5.4.bb b/meta/recipes-support/apr/apr-util_1.5.4.bb
index 6856db9..eb920b9 100644
--- a/meta/recipes-support/apr/apr-util_1.5.4.bb
+++ b/meta/recipes-support/apr/apr-util_1.5.4.bb
@@ -24,7 +24,6 @@ EXTRA_OECONF = "--with-apr=${STAGING_BINDIR_CROSS}/apr-1-config \
 		--with-dbm=gdbm \
 		--with-gdbm=${STAGING_DIR_HOST}${prefix} \
 		--without-sqlite2 \
-		--without-sqlite3 \
 		--with-expat=${STAGING_DIR_HOST}${prefix}"
 
 
@@ -66,9 +65,16 @@ do_install_append_class-target() {
 	       -e 's,APU_BUILD_DIR=.*,APR_BUILD_DIR=,g' ${D}${bindir}/apu-1-config
 }
 
-FILES_${PN}     += "${libdir}/apr-util-1/apr_dbm_gdbm-1.so"
-FILES_${PN}-dev += "${libdir}/aprutil.exp ${libdir}/apr-util-1/apr_dbm_gdbm.so* ${libdir}/apr-util-1/apr_dbm_gdbm.la"
-FILES_${PN}-staticdev += "${libdir}/apr-util-1/apr_dbm_gdbm.a"
+PACKAGECONFIG ??= "crypto"
+PACKAGECONFIG[ldap] = "--with-ldap,--without-ldap,openldap"
+PACKAGECONFIG[crypto] = "--with-crypto,--without-crypto"
+PACKAGECONFIG[sqlite3] = "--with-sqlite3=${STAGING_DIR_HOST}${prefix},--without-sqlite3,sqlite3"
+
+FILES_${PN}     += "${libdir}/apr-util-1/apr*${SOLIBS}"
+FILES_${PN}-dev += "${libdir}/aprutil.exp \
+	${libdir}/apr-util-1/apr*${SOLIBSDEV} \
+	${libdir}/apr-util-1/*.la"
+FILES_${PN}-staticdev += "${libdir}/apr-util-1/*.a"
 
 inherit ptest
 
-- 
2.7.0


