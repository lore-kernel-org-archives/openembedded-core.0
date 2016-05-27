Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8FB6B6E668
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2016 09:55:50 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id l68so12198860qkf.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2016 02:55:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=ROPanvUGqt+Q/7RSulg9h6x2MM2+tKhmvUZ5elcHUJA=;
	b=RGNkYd5EQ35a8eL486enf7jauUAadxMiC9C0GGdMryI3TYEeHqD5zWXF1FdStf9PO+
	FZuSJuCLOAFxVl7jdYjo5USfpQltPp05WJXw7pdlXA9ew95NWVEeIqHLGbfDCc/qU+5Q
	1YdooKKj2Wcp1luhPQbq79p4g16IXfL38LLxcxIv2rOwG24xtaSBmErCZWJ/x0x0je0J
	3qCiCJDcGQ8ERw1zBXe1ADsSuGa42OVTnQdbFv4ZgPjOVFoWUlq10CKTKIZlEfuy2Bfi
	cGU9U28q0SSoYdpXSAN9cGB3HbM9dTNGMf+Suxs32QX9vj3ncA8ZICA1HZLSz7dFtXyj
	/5wg==
X-Gm-Message-State: ALyK8tKKA3J+FNaT9VLF13OyqJJQooVGEOvsDNX5MytFXPWD7MgTN5cKLeDNY0uqePijcQ==
X-Received: by 10.55.76.84 with SMTP id z81mr13147144qka.17.1464342951374;
	Fri, 27 May 2016 02:55:51 -0700 (PDT)
Received: from localhost ([187.23.154.250]) by smtp.gmail.com with ESMTPSA id
	y64sm4686545qkb.26.2016.05.27.02.55.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 May 2016 02:55:50 -0700 (PDT)
Received: by localhost (sSMTP sendmail emulation);
	Fri, 27 May 2016 06:55:44 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri, 27 May 2016 06:55:18 -0300
Message-Id: <20160527095518.21761-4-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.8.3
In-Reply-To: <20160527095518.21761-1-otavio@ossystems.com.br>
References: <20160527095518.21761-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 3/3] openssl: Ensure SSL certificates are stored on sysconfdir
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
X-List-Received-Date: Fri, 27 May 2016 09:55:50 -0000

Debian and other generic distributions has moved the certificates for
sysconfdir (/etc/ssl) and made the libdir content to link for it.

This provides several advantages specially for read-only
rootfs. Another benefit is that it ensures foreign implementations
(e.g: BoringSSL, from Chromium, when running with OpenSSL backend for
the certificates) to find the content correctly.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2: None

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
2.8.3


