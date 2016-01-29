Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id C4CB37680A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 14:06:24 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u0TE6Ocb024166; Fri, 29 Jan 2016 08:06:24 -0600
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016012908062417-437121 ;
	Fri, 29 Jan 2016 08:06:24 -0600 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Jan 2016 16:06:09 +0200
Message-Id: <1454076369-9139-1-git-send-email-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.7.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 01/29/2016 08:06:24 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 01/29/2016 08:06:24 AM,
	Serialize complete at 01/29/2016 08:06:24 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-01-29_05:, , signatures=0
Cc: Adam Chappell <adam.chappell@ni.com>,
	Jacob Champion <jacob.champion@ni.com>
Subject: [PATCH v2 1/1] apr-util: add ldap crypto and sqlite3 to PACKAGECONFIG
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
X-List-Received-Date: Fri, 29 Jan 2016 14:06:25 -0000

Enable apr-util's cryptographic routines so that the apache2 package
can encrypt session data. Also add sqlite3 and ldap modules, disabled
by default.

Signed-off-by: Adam Chappell <adam.chappell@ni.com>
Signed-off-by: Jacob Champion <jacob.champion@ni.com>
Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Acked-by: Ken Sharp <ken.sharp@ni.com>
---
 meta/recipes-support/apr/apr-util_1.5.4.bb | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-support/apr/apr-util_1.5.4.bb b/meta/recipes-support/apr/apr-util_1.5.4.bb
index 6856db9..f2a7d96 100644
--- a/meta/recipes-support/apr/apr-util_1.5.4.bb
+++ b/meta/recipes-support/apr/apr-util_1.5.4.bb
@@ -24,7 +24,6 @@ EXTRA_OECONF = "--with-apr=${STAGING_BINDIR_CROSS}/apr-1-config \
 		--with-dbm=gdbm \
 		--with-gdbm=${STAGING_DIR_HOST}${prefix} \
 		--without-sqlite2 \
-		--without-sqlite3 \
 		--with-expat=${STAGING_DIR_HOST}${prefix}"
 
 
@@ -66,9 +65,17 @@ do_install_append_class-target() {
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
+FILES_${PN}     += "${libdir}/apr-util-1/lib*${SOLIBS}"
+FILES_${PN}-dev += "${libdir}/aprutil.exp \
+	${libdir}/apr-util-1/lib*${SOLIBSDEV} \
+	${libdir}/apr-util-1/apr_dbm_gdbm*${SOLIBSDEV} \
+	${libdir}/apr-util-1/*.la"
+FILES_${PN}-staticdev += "${libdir}/apr-util-1/*.a"
 
 inherit ptest
 
-- 
2.7.0


