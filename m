Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Syeew-0007iS-FD
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 09:56:58 +0200
Received: by mail-ee0-f47.google.com with SMTP id b57so1124315eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Aug 2012 00:45:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=OvneXOn4JIC6ZvxcT2dneK/hXr+FSUd/XQSKV3yTBYY=;
	b=MJMZOoaQzCpqFsIq+XpZlHCvFi5N0z74Rpd0SfPZ0Xhip0CtKziHvy7nHP1fMYGOej
	WISTNE7gwJo9QPjUQn28ETCvweD2TiIbsW/HihS5o343s2ScA1ZMDh52+d2jA0kxEbnw
	3AOJd3YUzsm8uaekFztkh3DW7Egg1cFZLaWD1fvu4mFuBDTIXPQR1QCH42vSft4IXLVI
	xEc78GmnRgVyh3nlJSPZcZWEuOpWnN7ugYlovKj77WuFFxITw7mZFyL5yQp3i/gXuxIK
	fcUf4a5fs2e17t8VYSyNGsdQ6meXQ2w7f0Y75Rxi4yVczH5AUyEyGojHxepZGijF6C3J
	ePXQ==
Received: by 10.14.208.133 with SMTP id q5mr16530887eeo.9.1344325515134;
	Tue, 07 Aug 2012 00:45:15 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id u47sm21303044eeo.9.2012.08.07.00.45.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Aug 2012 00:45:13 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Aug 2012 09:44:42 +0200
Message-Id: <1344325488-20479-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1344325488-20479-1-git-send-email-koen@dominion.thruhere.net>
References: <1344325488-20479-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQm368n9W2N8O+9BEDxz0zfLBG6Jo8d8B47To3Yr5fZ6xyU4+65b/U2UpBe/34dPGtu8yPlW
Subject: [PATCH][for-denzil 2/8] curl: enable ssl support
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
X-List-Received-Date: Tue, 07 Aug 2012 07:56:58 -0000

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



