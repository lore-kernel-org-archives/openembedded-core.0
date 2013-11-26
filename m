Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id BAE406D76F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 14:32:42 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAQEW3dx018503 for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 14:32:36 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ScqGPLIh6Bqr
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 14:32:36 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAQEWVB5018520
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 14:32:32 GMT
Message-ID: <1385476348.11246.4.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Nov 2013 14:32:28 +0000
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] beecrypt: Add PACKAGECONFIG for cplusplus
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
X-List-Received-Date: Tue, 26 Nov 2013 14:32:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Add a PACKGECONFIG to control the building of the beecrypt C++
bindings. The only user of beecrypt in OE-Core is rpm and this doesn't
need the C++ bindings so default the option to be off. This means
we can lose the icu dependency by default which is a significant
performance win.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb b/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb
index 0a8ff4b..a917201 100644
--- a/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb
+++ b/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb
@@ -16,8 +16,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9894370afd5dfe7d02b8d14319e729a1 \
                     file://COPYING.LIB;md5=dcf3c825659e82539645da41a7908589 \
                     file://include/beecrypt/beecrypt.h;endline=20;md5=47a93eef539aac237eef86297a4d71c1"
 
-DEPENDS = "icu"
-
 PR = "r3"
 
 inherit autotools multilib_header
@@ -29,6 +27,9 @@ do_install_append() {
 
 EXTRA_OECONF="--without-python --enable-shared --enable-static --disable-openmp --with-java=no"
 
+PACKAGECONFIG = ""
+PACKAGECONFIG[cplusplus] = "--with-cplusplus,--without-cplusplus,icu"
+
 FILES_${PN} = "${sysconfdir} ${libdir}/*.so.* ${libdir}/${BPN}/*.so.*"
 FILES_${PN}-dev += "${libdir}/${BPN}/*.so ${libdir}/${BPN}/*.la"
 FILES_${PN}-staticdev += "${libdir}/${BPN}/*.a"



