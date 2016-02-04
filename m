Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 42D927713C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 12:33:16 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u14CXGnA004151; Thu, 4 Feb 2016 06:33:16 -0600
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016020406331676-646231 ;
	Thu, 4 Feb 2016 06:33:16 -0600 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 4 Feb 2016 14:32:53 +0200
Message-Id: <6c3995a7b9068dd7fc182d31a1d6a8e59a7c5628.1454589019.git.adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <a46be4b91332be16e33749bccf73901f400575f0.1454589019.git.adrian.ratiu@ni.com>
References: <a46be4b91332be16e33749bccf73901f400575f0.1454589019.git.adrian.ratiu@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 02/04/2016 06:33:16 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 02/04/2016 06:33:17 AM,
	Serialize complete at 02/04/2016 06:33:17 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-02-04_02:, , signatures=0
Subject: [PATCH v4 2/2] apr-util: add ldap crypto and sqlite3 to PACKAGECONFIG
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
X-List-Received-Date: Thu, 04 Feb 2016 12:33:17 -0000

Enable apr-util's cryptographic routines so that the apache2 package
can encrypt session data. Also add sqlite3 and ldap modules, disabled
by default.

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta/recipes-support/apr/apr-util_1.5.4.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/apr/apr-util_1.5.4.bb b/meta/recipes-support/apr/apr-util_1.5.4.bb
index 381daad..28962bd 100644
--- a/meta/recipes-support/apr/apr-util_1.5.4.bb
+++ b/meta/recipes-support/apr/apr-util_1.5.4.bb
@@ -24,7 +24,6 @@ EXTRA_OECONF = "--with-apr=${STAGING_BINDIR_CROSS}/apr-1-config \
 		--with-dbm=gdbm \
 		--with-gdbm=${STAGING_DIR_HOST}${prefix} \
 		--without-sqlite2 \
-		--without-sqlite3 \
 		--with-expat=${STAGING_DIR_HOST}${prefix}"
 
 
@@ -66,6 +65,11 @@ do_install_append_class-target() {
 	       -e 's,APU_BUILD_DIR=.*,APR_BUILD_DIR=,g' ${D}${bindir}/apu-1-config
 }
 
+PACKAGECONFIG ??= "crypto"
+PACKAGECONFIG[ldap] = "--with-ldap,--without-ldap,openldap"
+PACKAGECONFIG[crypto] = "--with-openssl=${STAGING_DIR_HOST}${prefix} --with-crypto,--without-crypto,openssl"
+PACKAGECONFIG[sqlite3] = "--with-sqlite3=${STAGING_DIR_HOST}${prefix},--without-sqlite3,sqlite3"
+
 #files ${libdir}/apr-util-1/*.so are not symlinks but loadable modules thus they are packaged in ${PN}
 FILES_${PN}     += "${libdir}/apr-util-1/apr*${SOLIBS} ${libdir}/apr-util-1/apr*${SOLIBSDEV}"
 FILES_${PN}-dev += "${libdir}/aprutil.exp ${libdir}/apr-util-1/*.la"
-- 
2.7.0


