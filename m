Return-Path: <kirgene@gmail.com>
Received: from mail-la0-f43.google.com (mail-la0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2B6E56AF9F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2013 23:42:47 +0000 (UTC)
Received: by mail-la0-f43.google.com with SMTP id n7so1408370lam.30
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Nov 2013 15:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=uNFplb6W0E6MdSaYxkwFG3uFW6+WWIHCh2LJe8tZZ4I=;
	b=seoSPiwsaAosgRsaLIK6roIEyp+Qi7/HqN+YCkOKeR5hxoCWYgO6Eo7WgPXKIZBtSa
	nuvtzsNiT/cbwncrDIkke7+K5AnfiqoREeDE+FpyaPMpv7DvNRsm6zWnFt0bMLEpjNWE
	aoMFU0DRxABs3ECwld9S+7Y3xtGE67xbpatUEzRr6xeph2M42reu515dRq8MpW/Jz6cP
	3r9CYCpVnSY2KIUHpXBuaFLbt8B+7uwsKu6xsZi6wN0lWdq4O6fnaVp1i7ife8fuYN+Z
	BvUmKRemVJcvVQxSKcgm0pO82xUGCOPpDTSTJS5u2bqVhIgCUoF30iw5U+7WRmyATJ68
	wx5g==
X-Received: by 10.112.138.164 with SMTP id qr4mr53801lbb.49.1383954168135;
	Fri, 08 Nov 2013 15:42:48 -0800 (PST)
Received: from ubuntu.datv.net ([194.44.224.212])
	by mx.google.com with ESMTPSA id x7sm10536843lad.7.2013.11.08.15.42.46
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 08 Nov 2013 15:42:47 -0800 (PST)
From: Yevhen Kyriukha <kirgene@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Nov 2013 01:42:30 +0200
Message-Id: <1383954150-59537-1-git-send-email-kirgene@gmail.com>
X-Mailer: git-send-email 1.8.1.2
Cc: Yevhen Kyriukha <kirgene@gmail.com>
Subject: [PATCH] curl: build with c-ares library support.
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
X-List-Received-Date: Fri, 08 Nov 2013 23:42:48 -0000

Also added c-ares library recipe.

In libcurl there is an issue with DNS lookups that cause crash on some platforms:
http://curl.haxx.se/mail/lib-2008-09/0197.html
To avoid this issue libcurl has to be built with c-ares name resolver.

Signed-off-by: Yevhen Kyriukha <kirgene@gmail.com>
---
 meta/recipes-support/c-ares/c-ares_1.10.0.bb | 22 ++++++++++++++++++++++
 meta/recipes-support/curl/curl_7.33.0.bb     |  3 ++-
 2 files changed, 24 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/c-ares/c-ares_1.10.0.bb

diff --git a/meta/recipes-support/c-ares/c-ares_1.10.0.bb b/meta/recipes-support/c-ares/c-ares_1.10.0.bb
new file mode 100644
index 0000000..27bedf4
--- /dev/null
+++ b/meta/recipes-support/c-ares/c-ares_1.10.0.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "c-ares is a C library that resolves names asynchronously."
+HOMEPAGE = "http://daniel.haxx.se/projects/c-ares/"
+SECTION = "libs"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://README;beginline=17;endline=18;md5=b320556568bc067d215a1e34c5b34a14"
+
+inherit autotools
+inherit pkgconfig
+
+SRC_URI = "http://c-ares.haxx.se/download/${BP}.tar.gz"
+SRC_URI[md5sum] = "1196067641411a75d3cbebe074fd36d8"
+SRC_URI[sha256sum] = "3d701674615d1158e56a59aaede7891f2dde3da0f46a6d3c684e0ae70f52d3db"
+
+EXTRA_OECONF = "--enable-shared"
+
+# install private headers to ares subdirectory
+do_install_append() {
+    install -d ${D}/${includedir}/ares
+    install -m 0644 ares*.h ${D}/${includedir}/ares/
+}
+
+FILES_${PN}-dev += "${includedir}/ares/*.h"
diff --git a/meta/recipes-support/curl/curl_7.33.0.bb b/meta/recipes-support/curl/curl_7.33.0.bb
index 8539fec..1af320e 100644
--- a/meta/recipes-support/curl/curl_7.33.0.bb
+++ b/meta/recipes-support/curl/curl_7.33.0.bb
@@ -5,7 +5,7 @@ SECTION = "console/network"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;beginline=7;md5=3a34942f4ae3fbf1a303160714e664ac"
 
-DEPENDS = "zlib gnutls"
+DEPENDS = "zlib gnutls c-ares"
 DEPENDS_class-native = "zlib-native openssl-native"
 DEPENDS_class-nativesdk = "nativesdk-zlib"
 
@@ -30,6 +30,7 @@ EXTRA_OECONF = "--with-zlib=${STAGING_LIBDIR}/../ \
                 --enable-crypto-auth \
                 --disable-ldap \
                 --disable-ldaps \
+                --enable-ares \
                 ${CURLGNUTLS} \
                 "
 
-- 
1.8.1.2


