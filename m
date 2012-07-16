Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SqmiQ-0004Ba-B3
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 16:56:02 +0200
Received: by eeit10 with SMTP id t10so929142eei.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2012 07:44:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=OvneXOn4JIC6ZvxcT2dneK/hXr+FSUd/XQSKV3yTBYY=;
	b=GUKxzhASAPYOY37wD8Hrsi2HOmaLAFiAqTQEZr0FkOtrApjtRYFuQ+3et5/VsDwNSK
	kn43SI/rL7u1/CGme89sO9HfZ6KEsD2Bee9SkA/c0CXybrWad59UcG81sU9fuQAyxRSe
	TiV5umR6IRVEapGH6+2zC7ZCetFMNsb5VfVDxU4VjiprgR4VDAQlA5TX1I+YRAmznwLn
	HKM411QVd5ptE4BRs2MmD80/zhnNC0PUQvFCtFnpLAAhK9sDPitu+RoXEKK+yyb6YdXQ
	94mTyTwnRz1KqnkwMmsBJJGkdgor0gYLc50A4fe4Ifc3q2QRhGy9ZbvcU899mQ+HONYP
	lkAA==
Received: by 10.14.178.133 with SMTP id f5mr9634930eem.32.1342449884051;
	Mon, 16 Jul 2012 07:44:44 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id j4sm19400183eeo.11.2012.07.16.07.44.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Jul 2012 07:44:32 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jul 2012 16:44:21 +0200
Message-Id: <1342449862-26387-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQkQ5tSY/gmxHgCZXBPMe2hmlANgI5Kv4XEKX8iMQIa1fLo6q5P6JGstn4XGhQ9Y+Uw8w4Kr
Subject: [for-denzil][PATCH 1/2] curl: enable ssl support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Jul 2012 14:56:02 -0000

From: Saul Wold <sgw@linux.intel.com>

This patch enables ssl support for curl to allow git to clone from
https / ssl sites. We do not want to enable gnutls for native or
nativesdk, as it adds additional dependency and increase build time

[YOCTO #2532]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/curl/curl_7.24.0.bb |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-support/curl/curl_7.24.0.bb b/meta/recipes-support/curl/curl_7.24.0.bb
index 12e95c9..f9dce7d 100644
--- a/meta/recipes-support/curl/curl_7.24.0.bb
+++ b/meta/recipes-support/curl/curl_7.24.0.bb
@@ -5,10 +5,10 @@ SECTION = "console/network"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;beginline=7;md5=3a34942f4ae3fbf1a303160714e664ac"
 
-DEPENDS = "zlib gnutls"
-DEPENDS_virtclass-native = "zlib-native"
-DEPENDS_virtclass-nativesdk = "zlib-nativesdk"
-PR = "r0"
+DEPENDS = "zlib gnutls openssl"
+DEPENDS_virtclass-native = "zlib-native openssl-native"
+DEPENDS_virtclass-nativesdk = "zlib-nativesdk openssl-nativesdk"
+PR = "r1"
 
 SRC_URI = "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://noldlibpath.patch \
@@ -20,7 +20,7 @@ SRC_URI[sha256sum] = "ebdb111088ff8b0e05b1d1b075e9f1608285e8105cc51e21caacf33d01
 inherit autotools pkgconfig binconfig
 
 EXTRA_OECONF = "--with-zlib=${STAGING_LIBDIR}/../ \
-                --without-ssl \
+		--with-ssl \
                 --without-libssh2 \
 		--with-random=/dev/urandom \
 		--without-libidn \
-- 
1.7.10



