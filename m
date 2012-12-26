Received: from mail-bk0-f42.google.com ([209.85.214.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1Tnfkn-00005e-23
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Dec 2012 02:25:53 +0100
Received: by mail-bk0-f42.google.com with SMTP id ji2so3715244bkc.29
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Dec 2012 17:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=A0nqefLG49wAgF/SHFtwi5qdtPB7FTkHdZxhfGcCyiM=;
	b=uWrsvGtpMZ4+8zUD8fa9YWieNwI0PO0dQ3CWV2WMoCuWZ462e9VtbD3gpgJuimfUql
	TJcEeXQBmGN8cyb5h+T9MKGevi6nFYV5bYJMXxUwVbvhvHcuiRgS+/8eCAIEOUNPzVCG
	9wpAKtLsR48m+J/gFqGuAk0Dko6/EoG4pHpSAo87Wk7XKNAfz8vgHhjQ6OUGXiqyKmls
	dssEvGiyrodsQOirtBcKRCybrl5yy9PwoanCi6fq1klcrTx2gdz/2qydR5DXJewu2R6Y
	TIYuGHwf6cH7RfW8P4XiUYgK+9uVCjlFKlx4ILKSQXluzzeNA9pNipdLyG7dt20hSkrc
	aU5Q==
X-Received: by 10.204.5.202 with SMTP id 10mr12206045bkw.135.1356484260853;
	Tue, 25 Dec 2012 17:11:00 -0800 (PST)
Received: from prime (a91-153-5-18.elisa-laajakaista.fi. [91.153.5.18])
	by mx.google.com with ESMTPS id m20sm17709396bkw.4.2012.12.25.17.10.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 25 Dec 2012 17:10:59 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TnfWL-0003ZI-Ae; Wed, 26 Dec 2012 03:10:57 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Dec 2012 03:10:56 +0200
Message-Id: <1356484256-12329-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] curl: update to upstream version 7.28.1
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
X-List-Received-Date: Wed, 26 Dec 2012 01:25:55 -0000
X-List-Received-Date: Wed, 26 Dec 2012 01:25:55 -0000

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 meta/recipes-support/curl/curl/pkgconfig_fix.patch |   45 +++++++++-----------
 .../curl/{curl_7.26.0.bb => curl_7.28.1.bb}        |    4 +-
 2 files changed, 23 insertions(+), 26 deletions(-)
 rename meta/recipes-support/curl/{curl_7.26.0.bb => curl_7.28.1.bb} (93%)

diff --git a/meta/recipes-support/curl/curl/pkgconfig_fix.patch b/meta/recipes-support/curl/curl/pkgconfig_fix.patch
index ad73c00..7f4ef7d 100644
--- a/meta/recipes-support/curl/curl/pkgconfig_fix.patch
+++ b/meta/recipes-support/curl/curl/pkgconfig_fix.patch
@@ -1,25 +1,9 @@
 Upstream-Status: Inappropriate [packaging]
 
-
-Index: curl-7.20.0/libcurl.pc.in
-===================================================================
---- curl-7.20.0.orig/libcurl.pc.in	2009-11-17 18:11:07.000000000 +0000
-+++ curl-7.20.0/libcurl.pc.in	2010-03-25 12:13:26.814051066 +0000
-@@ -35,6 +35,7 @@
- URL: http://curl.haxx.se/
- Description: Library to transfer files with ftp, http, etc.
- Version: @CURLVERSION@
--Libs: -L${libdir} -lcurl @LIBS@
--Libs.private: @LIBCURL_LIBS@ @LIBS@
-+Requires.private: @GNUTLS_REQUIRED@
-+Libs: -L${libdir} -lcurl
-+Libs.private: -ldl -lz
- Cflags: -I${includedir}
-Index: curl-7.20.0/configure.ac
-===================================================================
---- curl-7.20.0.orig/configure.ac	2010-02-04 21:41:46.000000000 +0000
-+++ curl-7.20.0/configure.ac	2010-03-25 12:12:18.673129001 +0000
-@@ -1668,6 +1668,7 @@
+diff -Nurd curl-7.28.1/configure.ac curl-7.28.1/configure.ac
+--- curl-7.28.1/configure.ac	2012-09-08 23:39:18.000000000 +0300
++++ curl-7.28.1/configure.ac	2012-12-25 03:41:29.948026351 +0200
+@@ -1863,6 +1863,7 @@
         AC_SUBST(USE_GNUTLS, [1])
         GNUTLS_ENABLED=1
         USE_GNUTLS="yes"
@@ -27,12 +11,25 @@ Index: curl-7.20.0/configure.ac
         curl_ssl_msg="enabled (GnuTLS)"
         ],
         [
-@@ -1696,6 +1697,8 @@
- 
- fi dnl OPENSSL != 1
+@@ -1933,6 +1934,8 @@
+    ])
+ fi
  
 +AC_SUBST(GNUTLS_REQUIRED)
 +
  dnl ----------------------------------------------------
- dnl NSS. Only check if GnuTLS and OpenSSL are not enabled
+ dnl check for PolarSSL
  dnl ----------------------------------------------------
+diff -Nurd curl-7.28.1/libcurl.pc.in curl-7.28.1/libcurl.pc.in
+--- curl-7.28.1/libcurl.pc.in	2012-08-08 23:45:18.000000000 +0300
++++ curl-7.28.1/libcurl.pc.in	2012-12-25 03:43:23.564023858 +0200
+@@ -34,6 +34,7 @@
+ URL: http://curl.haxx.se/
+ Description: Library to transfer files with ftp, http, etc.
+ Version: @CURLVERSION@
+-Libs: -L${libdir} -lcurl @LIBS@
+-Libs.private: @LIBCURL_LIBS@ @LIBS@
++Requires.private: @GNUTLS_REQUIRED@
++Libs: -L${libdir} -lcurl
++Libs.private: -ldl -lz
+ Cflags: -I${includedir} @CPPFLAG_CURL_STATICLIB@
diff --git a/meta/recipes-support/curl/curl_7.26.0.bb b/meta/recipes-support/curl/curl_7.28.1.bb
similarity index 93%
rename from meta/recipes-support/curl/curl_7.26.0.bb
rename to meta/recipes-support/curl/curl_7.28.1.bb
index c95788b..1f20066 100644
--- a/meta/recipes-support/curl/curl_7.26.0.bb
+++ b/meta/recipes-support/curl/curl_7.28.1.bb
@@ -18,8 +18,8 @@ SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
 #
 SRC_URI += " file://configure_ac.patch"
 
-SRC_URI[md5sum] = "bfa80f01b3d300359cfb4d409b6136a3"
-SRC_URI[sha256sum] = "fced262f16eb6bfcdcea15e04a7905ffcb5ff04b14a19ca35b9df86d6720d26a"
+SRC_URI[md5sum] = "26eb081c999b0e203770869427e9a93d"
+SRC_URI[sha256sum] = "e569d6deb58a516e6858cd4c348949e0397433e1354666bafde1a52d1ea77367"
 
 inherit autotools pkgconfig binconfig
 
-- 
1.7.10.4



