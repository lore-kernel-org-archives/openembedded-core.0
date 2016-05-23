Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f67.google.com (mail-qg0-f67.google.com
	[209.85.192.67])
	by mail.openembedded.org (Postfix) with ESMTP id A752D6B6EA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 20:45:59 +0000 (UTC)
Received: by mail-qg0-f67.google.com with SMTP id e35so15915626qge.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 13:46:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=bh35VpYbZ6Waw1/P8cn8jxWKq3kfAbfeI35DGxa8mTc=;
	b=f/2AJy8C/kS+nyuVxDagasCbqFhPfD+uzUWQmvcGsE3E6mHLUQeQKLPPRdKCqHjpfF
	ZRa4MBufas+IeTbf2ZHSsVEgQx98CJbI7mcIBgQXYbaWAEZB3zVXMPTOoNkatLsCMUu9
	4WwBZxuVTsxzW1J1Hh/7R8PjOPcX7NMxk1w0dJzQOJsx1b6TkPZ5Up4UXTXn0goVa212
	X9Sb9FIfP4yATjP4OlGffhLUh7+0rqC8tK+x/etNqrqNaakF1nMt4hz6TyjLbDUcgA3y
	0JIhRej0gPIKGJKPZ3OSdq8FlJAL8f16qR+f9+mTkpo6VKolNx8o+QHwtTApVYQqdEQZ
	iBKw==
X-Gm-Message-State: ALyK8tLZFoQIchs8umXBH6+Hs5CkcqBQQm5sdyOMXJOgHqlryA4ka2Wtt0Kz4h1NRlNOYw==
X-Received: by 10.140.81.167 with SMTP id f36mr92974qgd.63.1464036359559;
	Mon, 23 May 2016 13:45:59 -0700 (PDT)
Received: from localhost ([187.23.154.250])
	by smtp.gmail.com with ESMTPSA id b34sm835523qtd.32.2016.05.23.13.45.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 May 2016 13:45:58 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Mon, 23 May 2016 17:45:52 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 23 May 2016 17:45:27 -0300
Message-Id: <1464036327-4826-4-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1464036327-4826-1-git-send-email-otavio@ossystems.com.br>
References: <1464036327-4826-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 3/3] openssl: Ensure SSL certificates are stored on sysconfdir
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
X-List-Received-Date: Mon, 23 May 2016 20:45:59 -0000

Debian and other generic distributions has moved the certificates for
sysconfdir (/etc/ssl) and made the libdir content to link for it.

This provides several advantages specially for read-only
rootfs. Another benefit is that it ensures foreign implementations
(e.g: BoringSSL, from Chromium, when running with OpenSSL backend for
the certificates) to find the content correctly.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-connectivity/openssl/openssl.inc | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index 668e34e..3412c66 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -43,8 +43,8 @@ RDEPENDS_${PN}-misc = "${@bb.utils.contains('PACKAGECONFIG', 'perl', 'perl', '',
 # package RRECOMMENDS on this package.  This will enable the configuration
 # file to be installed for both the base openssl package and the libcrypto
 # package since the base openssl package depends on the libcrypto package.
-FILES_openssl-conf = "${libdir}/ssl/openssl.cnf"
-CONFFILES_openssl-conf = "${libdir}/ssl/openssl.cnf"
+FILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf"
+CONFFILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf"
 RRECOMMENDS_libcrypto += "openssl-conf"
 RDEPENDS_${PN}-ptest += "${PN}-misc make perl perl-module-filehandle bc"
 
@@ -178,6 +178,17 @@ do_install () {
 	else
 		rm -f ${D}${libdir}/ssl/misc/CA.pl ${D}${libdir}/ssl/misc/tsget
 	fi
+
+	# Create SSL structure
+	install -d ${D}${sysconfdir}/ssl/
+	mv ${D}${libdir}/ssl/openssl.cnf \
+	   ${D}${libdir}/ssl/certs \
+	   ${D}${libdir}/ssl/private \
+	   \
+	   ${D}${sysconfdir}/ssl/
+	ln -sf ${sysconfdir}/ssl/certs ${D}${libdir}/ssl/certs
+	ln -sf ${sysconfdir}/ssl/private ${D}${libdir}/ssl/private
+	ln -sf ${sysconfdir}/ssl/openssl.cnf ${D}${libdir}/ssl/openssl.cnf
 }
 
 do_install_ptest () {
@@ -191,7 +202,7 @@ do_install_ptest () {
 	cp -r certs ${D}${PTEST_PATH}
 	mkdir -p ${D}${PTEST_PATH}/apps
 	ln -sf ${libdir}/ssl/misc/CA.sh  ${D}${PTEST_PATH}/apps
-	ln -sf ${libdir}/ssl/openssl.cnf ${D}${PTEST_PATH}/apps
+	ln -sf ${sysconfdir}/ssl/openssl.cnf ${D}${PTEST_PATH}/apps
 	ln -sf ${bindir}/openssl         ${D}${PTEST_PATH}/apps
 	cp apps/server2.pem             ${D}${PTEST_PATH}/apps
 	mkdir -p ${D}${PTEST_PATH}/util
-- 
2.8.2


