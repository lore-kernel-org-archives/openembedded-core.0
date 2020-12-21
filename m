Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.38021.1608548425364203371
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Dec 2020 03:00:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=jDt92DAD;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1608548426;
  x=1640084426;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4ihvhyL+kMwdTV7in7MTMZUcWr3D/dkkHfQ6EesPJyI=;
  b=jDt92DADpiOe3xb+l2B5bmn0UvkBTRXMi0V8DlQXIft72q9zNAJBs8ZE
   hJSeCZWXKIoolJW+/G7R2E7bzE6+TMbI54rh577uMIPFhaCckbWX9dbnH
   f+sHw72gOpk/cvBdFWsvN2T+bQSKu8HdjA2hd4NbKeSufYSUWgWHLdA/4
   Q7EI3EJENXp03vxXICMJqKFh1EqRXe6HfeKIaL04LmXtPMXK4MDE9sWLg
   xxQNGtwOAjdP7GpZ0cfJk2rLCvY7OD7w4OGsLW2OYTkQ7eSZX4SaLAR5g
   n4+1JaIB+MyDKAnGj62MbN1pJZOP9QmGzCbVoFspbktBGtmqrbsKGDN1N
   w==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] apr-util: Only specify --with-dbm=gdbm if gdbm support is enabled
Date: Mon, 21 Dec 2020 12:00:12 +0100
Message-ID: <20201221110012.6627-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Support for gdbm was made optional in 3260ad9e, but it was still being
used unconditionally.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-support/apr/apr-util_1.6.1.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/apr/apr-util_1.6.1.bb b/meta/recipes-support/apr/apr-util_1.6.1.bb
index 0dd8f025e8..f7d827a1d8 100644
--- a/meta/recipes-support/apr/apr-util_1.6.1.bb
+++ b/meta/recipes-support/apr/apr-util_1.6.1.bb
@@ -19,10 +19,9 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.gz \
 SRC_URI[md5sum] = "bd502b9a8670a8012c4d90c31a84955f"
 SRC_URI[sha256sum] = "b65e40713da57d004123b6319828be7f1273fbc6490e145874ee1177e112c459"
 
-EXTRA_OECONF = "--with-apr=${STAGING_BINDIR_CROSS}/apr-1-config \ 
+EXTRA_OECONF = "--with-apr=${STAGING_BINDIR_CROSS}/apr-1-config \
 		--without-odbc \
 		--without-pgsql \
-		--with-dbm=gdbm \
 		--without-sqlite2 \
 		--with-expat=${STAGING_DIR_HOST}${prefix}"
 
@@ -69,7 +68,7 @@ PACKAGECONFIG ??= "crypto gdbm"
 PACKAGECONFIG[ldap] = "--with-ldap,--without-ldap,openldap"
 PACKAGECONFIG[crypto] = "--with-openssl=${STAGING_DIR_HOST}${prefix} --with-crypto,--without-crypto,openssl"
 PACKAGECONFIG[sqlite3] = "--with-sqlite3=${STAGING_DIR_HOST}${prefix},--without-sqlite3,sqlite3"
-PACKAGECONFIG[gdbm] = "--with-gdbm=${STAGING_DIR_HOST}${prefix},--without-gdbm,gdbm"
+PACKAGECONFIG[gdbm] = "--with-dbm=gdbm --with-gdbm=${STAGING_DIR_HOST}${prefix},--without-gdbm,gdbm"
 
 #files ${libdir}/apr-util-1/*.so are not symlinks but loadable modules thus they are packaged in ${PN}
 FILES_${PN}     += "${libdir}/apr-util-1/apr*${SOLIBS} ${libdir}/apr-util-1/apr*${SOLIBSDEV}"
