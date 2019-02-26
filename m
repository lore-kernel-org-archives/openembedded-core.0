Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8FD6E7C85D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2019 11:36:05 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id a15so7337041qkc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2019 03:36:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:organization:content-transfer-encoding;
	bh=m8f/nsDDu2RyaTXUBduJVNvfxy8+8cyF0t0DoBEkvCw=;
	b=oTGkY9qmcrhVZwxV7G5ucGwhPAVKhpOI5+GAlJ3OKREa5mDim3WEZPtQTR64tayDv5
	9DcuGU6SIwcrB8RX1QFlgTBQszRfbAWMgzzlyeIMvDvkAXqK70HsNf5hOt6lpjpxs9c6
	Tn4fYdJkamdmWzFySNCFhZmGrZTE6JzN3yDy5kwplOwPG0r29CTxv0WBXVXAMwMPKm0a
	8t4KFBRtnLHTSkymQKCYIoNsf0pE5ZhC+rHCWnTC6Kir7UyWGdyDQM1rnyMsTqYqRern
	U+VVt/PH/Rop5QvtjJEHN63C7KNf0BL1JC9f1pgcpEir7RuUP5jowtO3oMFv37lXnkzf
	xouA==
X-Gm-Message-State: AHQUAuZhYPdNAEU3FSS3G8MJxIUpieFiGlwt2Ly1QwVhXxYocL8AqGXu
	AW9YOqp1mqxz7TmOBVjj2Ri5nbuX
X-Google-Smtp-Source: AHgI3IYRq3+s9bERqwVdn0pKxZJb3gkTaJnOdzZbMGEc4TH99OZexsESZPfsUKTh5Ka1QJavmc+R9g==
X-Received: by 2002:a37:a556:: with SMTP id o83mr17089737qke.78.1551180966037; 
	Tue, 26 Feb 2019 03:36:06 -0800 (PST)
Received: from localhost.localdomain ([177.194.204.148])
	by smtp.gmail.com with ESMTPSA id
	t129sm6488251qkd.16.2019.02.26.03.36.03
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 26 Feb 2019 03:36:05 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 26 Feb 2019 08:36:00 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Feb 2019 08:35:58 -0300
Message-Id: <20190226113559.9398-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] openssl: Use the c_rehash shell re-implementation for target
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
X-List-Received-Date: Tue, 26 Feb 2019 11:36:05 -0000
Content-Transfer-Encoding: 8bit

We had a c_rehash shell re-implementation being used for the native
package and there is no reason to not use it as well for the
target. This allows it to be available without the need of perl being
installed.

This partially reverts OE-Core:d2b1a889ef (openssl: move c_rehash pkg
to avoid perl dep) but still allows the removal of perl dependency.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 .../openssl/openssl_1.1.1a.bb                    | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
index 9f6e26bcf5..3e9e45e4a4 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
@@ -122,7 +122,13 @@ do_install () {
 
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
@@ -143,12 +149,6 @@ do_install_append_class-native () {
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
@@ -190,7 +190,7 @@ FILES_libcrypto = "${libdir}/libcrypto${SOLIBS}"
 FILES_libssl = "${libdir}/libssl${SOLIBS}"
 FILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf"
 FILES_${PN}-engines = "${libdir}/engines-1.1"
-FILES_${PN}-misc = "${libdir}/ssl-1.1/misc ${bindir}/c_rehash"
+FILES_${PN}-misc = "${libdir}/ssl-1.1/misc"
 FILES_${PN} =+ "${libdir}/ssl-1.1/*"
 FILES_${PN}_append_class-nativesdk = " ${SDKPATHNATIVE}/environment-setup.d/openssl.sh"
 
-- 
2.20.1


