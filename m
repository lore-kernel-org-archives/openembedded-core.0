Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 8BC496D76F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 14:32:09 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAQEW3dw018503 for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 14:32:03 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id X602C8xbbQQ8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 14:32:02 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAQEVwRX018483
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 14:32:00 GMT
Message-ID: <1385476316.11246.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Nov 2013 14:31:56 +0000
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: harfbuzz: Add PACKAGECONFIG for icu
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
X-List-Received-Date: Tue, 26 Nov 2013 14:32:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

harfbuzz can be built without icu. We don't need harfbuzz-icu for any
default OE-Core configuration so default to icu being disabled for
performance improvements.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.22.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.22.bb
index e315f78..26f3f38 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.22.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_0.9.22.bb
@@ -18,11 +18,14 @@ SRC_URI[sha256sum] = "989680807e76197418338e44f226e02f155f33031efd9aff14dbc4dc14
 
 inherit autotools pkgconfig
 
-DEPENDS = "icu glib-2.0 cairo freetype"
+DEPENDS = "glib-2.0 cairo freetype"
 
 BBCLASSEXTEND = "native"
 
-EXTRA_OECONF = "--with-glib --with-freetype --with-cairo --with-icu --without-graphite2"
+EXTRA_OECONF = "--with-glib --with-freetype --with-cairo --without-graphite2"
+
+PACKAGECONFIG = ""
+PACKAGECONFIG[icu] = "--with-icu,--without-icu,icu"
 
 PACKAGES =+ "${PN}-icu ${PN}-icu-dbg ${PN}-icu-dev"
 



