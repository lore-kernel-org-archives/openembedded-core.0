Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
	[209.85.160.180])
	by mail.openembedded.org (Postfix) with ESMTP id C42467C6B5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 13:36:24 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id w5so9566963qtb.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 06:36:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=hEpdXwDhyyhQzB6dvW6INRUa7vJbopqgNp8oXs2OR6c=;
	b=Bz5shw3RgvQjVk+KqS8SheKOT/IjTANBCi+DSYx7Potqx5S74k1MJABGEGINufGggM
	gIwsbESXmGU8V0ubVJvl53CltE2qQt1u3CrJ+B7knnvbKpy89amjIB5lNga8XFUk1Bq9
	ZRCZP5EHAoGGoV3exXerGYNYfkdk39RGSYKfkgwsWiMLzCGD2RBnY1sYDKCV4tylTePZ
	UsiUyIMfj+P8jBo3qnnKL4RuB1d1w0ktf7KE4lPSUiBouUF9eebAEY8fRO0PqCNWctH/
	fXSzSlzI9kNfusxR9J6Fn55Hq9AHGDJwDHgaYkpnCle6nbww0nMMnHjti8SL636TZ0dn
	2sOA==
X-Gm-Message-State: APjAAAWqYlJozqGzhfM+bjNZiOD7jXGsHSFAeDR5nOD8j2XTZanGXoxs
	+mNDtIjYqCFQSWuPUy5Yyu6cJWUk
X-Google-Smtp-Source: APXvYqyandWoncKxihtFxDL/X8D/WpD367r3eEGcVt+zpQnFc1QwMJCyOR3uJDIWNdTt4sImmkaa9A==
X-Received: by 2002:ac8:2697:: with SMTP id 23mr13525134qto.71.1552916185116; 
	Mon, 18 Mar 2019 06:36:25 -0700 (PDT)
Received: from localhost.localdomain ([177.194.204.148])
	by smtp.gmail.com with ESMTPSA id 55sm6720401qtq.25.2019.03.18.06.36.21
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Mar 2019 06:36:23 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 18 Mar 2019 10:36:19 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Mar 2019 10:36:18 -0300
Message-Id: <20190318133618.4022-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2] openssl: Use the c_rehash shell re-implementation for target
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
X-List-Received-Date: Mon, 18 Mar 2019 13:36:25 -0000
Content-Transfer-Encoding: 8bit

We had a c_rehash shell re-implementation being used for the native
package and there is no reason to not use it as well for the
target. This allows it to be available without the need of perl being
installed.

This partially reverts OE-Core:d2b1a889ef (openssl: move c_rehash pkg
to avoid perl dep) but still allows the removal of perl
dependency.

The respective re-implementation was already in use here at OE-Core by
the OpenSSL 1.0 recipe (since 2016) and were removed from the target
recipe during the upgrade to the 1.1 release. So it now aligns the
native and target recipes.

,----
| Author: Otavio Salvador <otavio@ossystems.com.br>
| Date:   Mon May 23 17:45:25 2016 -0300
|
|     openssl: Add Shell-Script based c_rehash utility
|
|     The PLD Linux distribution has ported the c_rehash[1] utility from
|     Perl to Shell-Script, allowing it to be shipped by default.
|
|     1. https://git.pld-linux.org/?p=packages/openssl.git;a=blob;f=openssl-c_rehash.sh;h=0ea22637ee6dbce845a9e2caf62540aaaf5d0761
|
|     The OpenSSL upstream intends[2] to convert the utility for C
|     however did not yet finished the conversion.
|
|     2. https://rt.openssl.org/Ticket/Display.html?id=2324
|
|     This patch adds this script and thus removed the Perl requirement
|     for it.
|
|     Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
|     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
`----

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2:
- updated commit log

 .../openssl/openssl_1.1.1a.bb                    | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
index 4a626a4fcd..a6f920e15b 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
@@ -128,7 +128,13 @@ do_install () {
 
 	oe_multilib_header openssl/opensslconf.h
 
-	# Create SSL structure for packages such as ca-certificates which
+	# Install a custom version of c_rehash that can handle sysroots properly.
+	# This version is used for example when installing ca-certificates during
+	# image creation.
+	install -Dm 0755 ${WORKDIR}/openssl-c_rehash.sh ${D}${bindir}/c_rehash
+	sed -i -e 's,/etc/openssl,${sysconfdir}/ssl,g' ${D}${bindir}/c_rehash
+
+        # Create SSL structure for packages such as ca-certificates which
 	# contain hard-coded paths to /etc/ssl. Debian does the same.
 	install -d ${D}${sysconfdir}/ssl
 	mv ${D}${libdir}/ssl-1.1/certs \
@@ -149,12 +155,6 @@ do_install_append_class-native () {
 	    SSL_CERT_DIR=${libdir}/ssl-1.1/certs \
 	    SSL_CERT_FILE=${libdir}/ssl-1.1/cert.pem \
 	    OPENSSL_ENGINES=${libdir}/ssl-1.1/engines
-
-	# Install a custom version of c_rehash that can handle sysroots properly.
-	# This version is used for example when installing ca-certificates during
-	# image creation.
-	install -Dm 0755 ${WORKDIR}/openssl-c_rehash.sh ${D}${bindir}/c_rehash
-	sed -i -e 's,/etc/openssl,${sysconfdir}/ssl,g' ${D}${bindir}/c_rehash
 }
 
 do_install_append_class-nativesdk () {
@@ -196,7 +196,7 @@ FILES_libcrypto = "${libdir}/libcrypto${SOLIBS}"
 FILES_libssl = "${libdir}/libssl${SOLIBS}"
 FILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf"
 FILES_${PN}-engines = "${libdir}/engines-1.1"
-FILES_${PN}-misc = "${libdir}/ssl-1.1/misc ${bindir}/c_rehash"
+FILES_${PN}-misc = "${libdir}/ssl-1.1/misc"
 FILES_${PN} =+ "${libdir}/ssl-1.1/*"
 FILES_${PN}_append_class-nativesdk = " ${SDKPATHNATIVE}/environment-setup.d/openssl.sh"
 
-- 
2.21.0


