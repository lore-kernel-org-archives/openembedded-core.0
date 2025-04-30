Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EAFBC3ABAA
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 03:00:37 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.8295.1745982033320117414
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 20:00:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=A0kTStSn;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2264aefc45dso101174405ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 20:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1745982032; x=1746586832; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fhKohCH7L77Go4zY2y+9uWz1biEt0hBm50Ba+Ja0t5Y=;
        b=A0kTStSnyuSfOKCt88j7dahZuoBejWmeNwSNefcX57Takfw7ZKNNKm3Rp6ha7E3SXr
         72UObemlmi8NTKVm9vTGw43psRAF2xrUdtSuKaXu5JQpfGbxoxSa8CjVbnAuKZHVVilC
         IgXQSvvGaQlY/khhUKpjwIloXZQsX8tUMqAQS9QG2vTgddGXx2xUJjbO+fwuyXTalqq5
         78RtpHTfx6Ww4z1vbWH6E/RPHNoQIyfPPdB8b5sh4wcUNefJhoz1jAYbyFMbPzAVhJc4
         DPvx5yixEMnTOSBR4ZvPDNsJNCoJdNVgV5e8iqZh1O7g6xqtTmBSjKgVPydNIURT7HXK
         5uvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745982032; x=1746586832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fhKohCH7L77Go4zY2y+9uWz1biEt0hBm50Ba+Ja0t5Y=;
        b=AXmG9XpiMAFNmksbktMViAacmInelmlevplP5Y+lf0y6B+AJlvO43fYrOgh1VSc+fZ
         X94Q5SmkxV1iLEkVNMiso/RmiBiOIDuMrNNIx1bI5a/u4X/HSMHX0kqdTfSB94ZkOkuR
         hVZyGJsrwNAtBaa4yyOYpe41OMzOGiBh7PR35mNEUO0G6gZQ/I3JB+e8LU7woS9a52Ca
         TxWxcw6wg1a4SQ8gKg/qlZOeaXNcA9+rm4IDi5v9EWvS/Zfp9RdqLC6Ac4ps/ps71hlR
         5LjvcynQ4rP27kkkpKY+5+FlYReFJ+dfpRmn/s1GEhRP/URz3dK8V1pYpyKF5eeMJoPv
         qxdg==
X-Gm-Message-State: AOJu0Yx1Jnxy8eQ7hPISJozDfIiIrrcNU2V0PVxp8ajbudgv6aPfIOvZ
	IdnQr++W8yZjOcihLJSzFm38aQwS4asE6+0qjm1pM29Et0rKjx1SmlzCYm2IKVL2DAinHIYqqL1
	P
X-Gm-Gg: ASbGncvbqKZdgKIr+LYKIGstHXPIjpMfnCgLmLmbf0ZThfbUiqDfBltog9HYgmDRNrK
	ZpVjhoBdATp8N3X+Kezu3AlJv5VLBb7ptEJPwOiQtakpMjeTKk2ZiF0zguwkZC99fM+lPO2hPax
	z4EY3gmrM+TOvUwQeYRKMz9d8lk0O/Tg/VT3XhECQl+NPLKVW+yrVGizeMmSjbgEhWT9rZqbG0w
	4LjshHf5hkq5ZzTSCDKg6zCThyScQQQEwTM1wO74+2AULjKK7MlW5dQ2WomksZQjF/Ff2AQnlGZ
	4hh2FfJ2OFjX+uE4eQ5CVRX6N08ue1o=
X-Google-Smtp-Source: AGHT+IErs1/ThYTowi1jCvEWbQxAK8FLd6LjG58brosLBikG4+5XEk+XohWk93OPAaXsms+TYn50kw==
X-Received: by 2002:a17:902:f68f:b0:220:e9ef:ec98 with SMTP id d9443c01a7336-22df34d8324mr24795395ad.19.1745982032431;
        Tue, 29 Apr 2025 20:00:32 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:34b:e5e0:c38a:7e03])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22de49dccd3sm30461175ad.123.2025.04.29.20.00.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 20:00:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/15] buildtools-tarball: move setting of envvars to respective envfile
Date: Tue, 29 Apr 2025 20:00:00 -0700
Message-ID: <5f4fd544d3df7365224599c9efdce4e545f51d5e.1745981742.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745981742.git.steve@sakoman.com>
References: <cover.1745981742.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 03:00:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215718

From: Changqing Li <changqing.li@windriver.com>

* make git,curl,python3-requests align with openssl, move the setting of
  envvars into respective envfile
* for environment.d-openssl.sh, also check if ca-certificates.crt exist
  before export envvars

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssl/files/environment.d-openssl.sh            |  7 +++++--
 meta/recipes-core/meta/buildtools-tarball.bb          |  6 ------
 meta/recipes-devtools/git/git/environment.d-git.sh    |  3 +++
 meta/recipes-devtools/git/git_2.44.3.bb               |  8 ++++++++
 .../environment.d-python3-requests.sh                 |  3 +++
 .../python/python3-requests_2.32.3.bb                 | 11 +++++++++++
 meta/recipes-support/curl/curl/environment.d-curl.sh  |  3 +++
 meta/recipes-support/curl/curl_8.7.1.bb               |  9 +++++++++
 8 files changed, 42 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-devtools/git/git/environment.d-git.sh
 create mode 100644 meta/recipes-devtools/python/python3-requests/environment.d-python3-requests.sh
 create mode 100644 meta/recipes-support/curl/curl/environment.d-curl.sh

diff --git a/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
index 6f23490c87..6cb82d7386 100644
--- a/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
+++ b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
@@ -1,5 +1,8 @@
 export OPENSSL_CONF="$OECORE_NATIVE_SYSROOT/usr/lib/ssl/openssl.cnf"
-export SSL_CERT_DIR="$OECORE_NATIVE_SYSROOT/usr/lib/ssl/certs"
-export SSL_CERT_FILE="$OECORE_NATIVE_SYSROOT/usr/lib/ssl/certs/ca-certificates.crt"
+if [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
+    export SSL_CERT_DIR="$OECORE_NATIVE_SYSROOT/usr/lib/ssl/certs"
+    export SSL_CERT_FILE="$OECORE_NATIVE_SYSROOT/usr/lib/ssl/certs/ca-certificates.crt"
+    export BB_ENV_PASSTHROUGH_ADDITIONS="${BB_ENV_PASSTHROUGH_ADDITIONS:-} SSL_CERT_DIR SSL_CERT_FILE"
+fi
 export OPENSSL_MODULES="$OECORE_NATIVE_SYSROOT/usr/lib/ossl-modules/"
 export OPENSSL_ENGINES="$OECORE_NATIVE_SYSROOT/usr/lib/engines-3"
diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index e2ce5b3ecf..414c266663 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -73,12 +73,6 @@ create_sdk_files:append () {
 	touch $script
 	echo 'export PATH="${SDKPATHNATIVE}${bindir_nativesdk}:${SDKPATHNATIVE}${sbindir_nativesdk}:${SDKPATHNATIVE}${base_bindir_nativesdk}:${SDKPATHNATIVE}${base_sbindir_nativesdk}:$PATH"' >> $script
 	echo 'export OECORE_NATIVE_SYSROOT="${SDKPATHNATIVE}"' >> $script
-	if [ -e "${SDK_OUTPUT}${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt" ]; then
-		echo 'export GIT_SSL_CAINFO="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
-		echo 'export SSL_CERT_FILE="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
-		echo 'export REQUESTS_CA_BUNDLE="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
-		echo 'export CURL_CA_BUNDLE="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
-	fi
 	echo 'HOST_PKG_PATH=$(command -p pkg-config --variable=pc_path pkg-config 2>/dev/null)' >>$script
 	echo 'export PKG_CONFIG_LIBDIR=${SDKPATHNATIVE}/${libdir}/pkgconfig:${SDKPATHNATIVE}/${datadir}/pkgconfig:${HOST_PKG_PATH:-/usr/lib/pkgconfig:/usr/share/pkgconfig}' >>$script
 	echo 'unset HOST_PKG_PATH'
diff --git a/meta/recipes-devtools/git/git/environment.d-git.sh b/meta/recipes-devtools/git/git/environment.d-git.sh
new file mode 100644
index 0000000000..18104f0528
--- /dev/null
+++ b/meta/recipes-devtools/git/git/environment.d-git.sh
@@ -0,0 +1,3 @@
+if [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
+    export GIT_SSL_CAINFO="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt"
+fi
diff --git a/meta/recipes-devtools/git/git_2.44.3.bb b/meta/recipes-devtools/git/git_2.44.3.bb
index a5afd36168..7b33d6071e 100644
--- a/meta/recipes-devtools/git/git_2.44.3.bb
+++ b/meta/recipes-devtools/git/git_2.44.3.bb
@@ -13,6 +13,10 @@ SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=tarball \
            file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch \
            "
 
+SRC_URI:append:class-nativesdk = " \
+           file://environment.d-git.sh \
+           "
+
 S = "${WORKDIR}/git-${PV}"
 
 LIC_FILES_CHKSUM = "\
@@ -115,6 +119,9 @@ do_install:append:class-nativesdk() {
 		GIT_EXEC_PATH='`dirname $''realpath`'/${REL_GIT_EXEC_PATH} \
 		GIT_TEMPLATE_DIR='`dirname $''realpath`'/${REL_GIT_TEMPLATE_DIR}
 	perl_native_fixup
+
+	mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
+	install -m 644 ${WORKDIR}/environment.d-git.sh ${D}${SDKPATHNATIVE}/environment-setup.d/git.sh
 }
 
 FILES:${PN} += "${datadir}/git-core ${libexecdir}/git-core/"
@@ -155,6 +162,7 @@ FILES:${PN}-tk = " \
 
 PACKAGES =+ "gitweb"
 FILES:gitweb = "${datadir}/gitweb/"
+FILES:${PN}:append:class-nativesdk = " ${SDKPATHNATIVE}/environment-setup.d/git.sh"
 RDEPENDS:gitweb = "perl"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-requests/environment.d-python3-requests.sh b/meta/recipes-devtools/python/python3-requests/environment.d-python3-requests.sh
new file mode 100644
index 0000000000..f2eee203ca
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-requests/environment.d-python3-requests.sh
@@ -0,0 +1,3 @@
+if [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
+    export REQUESTS_CA_BUNDLE="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt"
+fi
diff --git a/meta/recipes-devtools/python/python3-requests_2.32.3.bb b/meta/recipes-devtools/python/python3-requests_2.32.3.bb
index 4f0638b50c..36ff75f87d 100644
--- a/meta/recipes-devtools/python/python3-requests_2.32.3.bb
+++ b/meta/recipes-devtools/python/python3-requests_2.32.3.bb
@@ -3,10 +3,19 @@ HOMEPAGE = "https://requests.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
+SRC_URI:append:class-nativesdk = " \
+           file://environment.d-python3-requests.sh \
+"
+
 SRC_URI[sha256sum] = "55365417734eb18255590a9ff9eb97e9e1da868d4ccd6402399eaf68af20a760"
 
 inherit pypi python_setuptools_build_meta
 
+do_install:append:class-nativesdk() {
+	mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
+	install -m 644 ${WORKDIR}/environment.d-python3-requests.sh ${D}${SDKPATHNATIVE}/environment-setup.d/python3-requests.sh
+}
+
 RDEPENDS:${PN} += " \
     python3-certifi \
     python3-email \
@@ -19,6 +28,8 @@ RDEPENDS:${PN} += " \
     python3-compression \
 "
 
+FILES:${PN}:append:class-nativesdk = " ${SDKPATHNATIVE}/environment-setup.d/python3-requests.sh"
+
 CVE_PRODUCT = "requests"
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-support/curl/curl/environment.d-curl.sh b/meta/recipes-support/curl/curl/environment.d-curl.sh
new file mode 100644
index 0000000000..0d53aabb8e
--- /dev/null
+++ b/meta/recipes-support/curl/curl/environment.d-curl.sh
@@ -0,0 +1,3 @@
+if [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
+    export CURL_CA_BUNDLE="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt"
+fi
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 8ce8caadf0..2f5bf8c8fd 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -25,6 +25,11 @@ SRC_URI = " \
     file://CVE-2024-11053-0003.patch \
     file://CVE-2025-0167.patch \
 "
+
+SRC_URI:append:class-nativesdk = " \
+           file://environment.d-curl.sh \
+"
+
 SRC_URI[sha256sum] = "6fea2aac6a4610fbd0400afb0bcddbe7258a64c63f1f68e5855ebc0c659710cd"
 
 # Curl has used many names over the years...
@@ -108,6 +113,8 @@ do_install:append:class-target() {
 
 do_install:append:class-nativesdk() {
 	fix_absolute_paths
+	mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
+	install -m 644 ${WORKDIR}/environment.d-curl.sh ${D}${SDKPATHNATIVE}/environment-setup.d/curl.sh
 }
 
 do_compile_ptest() {
@@ -156,6 +163,8 @@ RRECOMMENDS:lib${BPN} += "ca-certificates"
 
 FILES:${PN} += "${datadir}/zsh"
 
+FILES:${PN}:append:class-nativesdk = " ${SDKPATHNATIVE}/environment-setup.d/curl.sh"
+
 inherit multilib_script
 MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/curl-config"
 
-- 
2.43.0


