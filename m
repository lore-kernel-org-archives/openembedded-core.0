Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C817C3ABCD
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 15:24:13 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.1425.1746804249244862273
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 May 2025 08:24:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Ft0CpqsK;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so2294688b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 08:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1746804248; x=1747409048; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OHZH+MVBn1fsuDh6HW3uHGu4h5OM1IDI9Hh1Iqs7Efo=;
        b=Ft0CpqsKdm6DcvUgwCtSlzNr9if9et7i1XG/PSCIaHtSNe4u2oPHsITOZjOedulOpf
         yQD35nC5wsW2KZOdTjYIZnyHnDsKtPdEiXanPFnZpt7wTcKGRMnKKpYF/g1srDPJuEL2
         mqk+dTcPw3PIF3X/3zpeho/cgEjvKk14yn9885F7hHfSEZwp1Pj/tOojYYHij7PG2hjg
         Ef5/tIBcIpIHnA7elihxaqd2t4WHl5Zq5V8k6oNG/SkjFUo4SCiwE30sBbEV0YSddPkL
         t/QPh4FmUK6I/z10FbKF0LrHospWlDcZgwGN6GZWgqXkHCjBjHeV5P21giWXioSyl0qE
         7j0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746804248; x=1747409048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OHZH+MVBn1fsuDh6HW3uHGu4h5OM1IDI9Hh1Iqs7Efo=;
        b=KUVFcuONhd+X0wY2yz4jNS7y4CLWVwl/jsbfuHHzCDn2ex7nCjZnF/waPiAc5kfGT0
         ZxUOA2rNMiuca7vpQe6Pc9wHN3wzX52g+SSRqsOeYDOCUEB+6FeTsX9FIR9WamP7RQ/H
         OJgRBtzJL/65FVQZeaVrve73DD0SiEqn3bDHzvRJ6R6e6PYPLFnU1vJlFVM7jCwn07bQ
         eVg5hZhZTnSrLsNzeL3EsHEwbqNpJZAaGkBMi4otpRBq2FS82RSeUFqe3sFXxnbnNyHJ
         4h/DJhbzOcog5iyPIQh6XuQAbpqS1gygAugkodjo1+AbkbIMfPnV59lWlp1cnX3kv8Id
         HMAQ==
X-Gm-Message-State: AOJu0YxDM9hXWkdu01Ymeq00zfK8bPT9Kec0/sxSiqgGNOgdO4iNFO/n
	yldToKXaaFE+9A6xIESSVgichEh2XcH5wRC24Xun9C24/lTiH6GfB7SXDR62A7lrQ8ynVTDbgiX
	T
X-Gm-Gg: ASbGncvlPF18/B/k4eNKPv+TBNPuzP0EpxaOE2AKxZYX5kN1kdj5StHTQVBwrU0vat/
	nuvtiXVsRoeBkga6E8XKzelvpGfKkM4lYbgzQU9jTBtxqhF9UIFKz+tE+3tvhBlEHDqlL5zq2nJ
	QxSu3MtJmb6odtizJOVNx7P76c779fIcb84FrVoVxqtGEyWqTqgTWLo35xFW1JIK3FlzgYkkBPq
	JyLV49wUy61dN4Mnlk4X1sQ3wcYqbCtXbmzioRWpIPlyL1kWLwJ1BUlCP07eVR+PSpPPCb6+8fx
	B5r7kpEE8wBPSmBMnBd2TCjdGfwGC81v
X-Google-Smtp-Source: AGHT+IH3S+7X4ZfPFss+mTccLBlUBTCWPd8eKf4GiH6l2BjlBa1c5Vpdjz0mG3WI+QeV8q8QUCtb/g==
X-Received: by 2002:a05:6a21:4610:b0:1f5:7ea8:a791 with SMTP id adf61e73a8af0-215abb8df29mr5309144637.10.1746804248350;
        Fri, 09 May 2025 08:24:08 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:1912:b658:11a7:402c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a108fbsm1848319b3a.115.2025.05.09.08.24.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 08:24:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 11/17] buildtools-tarball: move setting of envvars to respective envfile
Date: Fri,  9 May 2025 08:23:27 -0700
Message-ID: <5c915fcada5868bdbb8aa3e28c18a26cfc41914f.1746804035.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746804035.git.steve@sakoman.com>
References: <cover.1746804035.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 15:24:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216219

From: Changqing Li <changqing.li@windriver.com>

* make git,curl,python3-requests align with openssl, move the setting of
  envvars into respective envfile
* for environment.d-openssl.sh, also check if ca-certificates.crt exist
  before export envvars

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssl/files/environment.d-openssl.sh            |  9 ++++++---
 meta/recipes-core/meta/buildtools-tarball.bb          |  6 ------
 meta/recipes-devtools/git/git/environment.d-git.sh    |  3 +++
 meta/recipes-devtools/git/git_2.49.0.bb               |  9 +++++++++
 .../environment.d-python3-requests.sh                 |  3 +++
 .../python/python3-requests_2.32.3.bb                 | 11 +++++++++++
 meta/recipes-support/curl/curl/environment.d-curl.sh  |  3 +++
 meta/recipes-support/curl/curl_8.12.1.bb              |  9 +++++++++
 8 files changed, 44 insertions(+), 9 deletions(-)
 create mode 100644 meta/recipes-devtools/git/git/environment.d-git.sh
 create mode 100644 meta/recipes-devtools/python/python3-requests/environment.d-python3-requests.sh
 create mode 100644 meta/recipes-support/curl/curl/environment.d-curl.sh

diff --git a/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
index d4b9047565..79b9bc77ec 100644
--- a/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
+++ b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
@@ -1,6 +1,9 @@
 export OPENSSL_CONF="$OECORE_NATIVE_SYSROOT/usr/lib/ssl-3/openssl.cnf"
-export SSL_CERT_DIR="$OECORE_NATIVE_SYSROOT/usr/lib/ssl-3/certs"
-export SSL_CERT_FILE="$OECORE_NATIVE_SYSROOT/usr/lib/ssl-3/certs/ca-certificates.crt"
+if [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
+    export SSL_CERT_DIR="$OECORE_NATIVE_SYSROOT/usr/lib/ssl-3/certs"
+    export SSL_CERT_FILE="$OECORE_NATIVE_SYSROOT/usr/lib/ssl-3/certs/ca-certificates.crt"
+    export BB_ENV_PASSTHROUGH_ADDITIONS="${BB_ENV_PASSTHROUGH_ADDITIONS:-} SSL_CERT_DIR SSL_CERT_FILE"
+fi
 export OPENSSL_MODULES="$OECORE_NATIVE_SYSROOT/usr/lib/ossl-modules/"
 export OPENSSL_ENGINES="$OECORE_NATIVE_SYSROOT/usr/lib/engines-3"
-export BB_ENV_PASSTHROUGH_ADDITIONS="${BB_ENV_PASSTHROUGH_ADDITIONS:-} SSL_CERT_DIR SSL_CERT_FILE OPENSSL_CONF OPENSSL_MODULES OPENSSL_ENGINES"
+export BB_ENV_PASSTHROUGH_ADDITIONS="${BB_ENV_PASSTHROUGH_ADDITIONS:-} OPENSSL_CONF OPENSSL_MODULES OPENSSL_ENGINES"
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
diff --git a/meta/recipes-devtools/git/git_2.49.0.bb b/meta/recipes-devtools/git/git_2.49.0.bb
index 2ca8711f75..3538170d08 100644
--- a/meta/recipes-devtools/git/git_2.49.0.bb
+++ b/meta/recipes-devtools/git/git_2.49.0.bb
@@ -12,6 +12,10 @@ SRC_URI = "${KERNELORG_MIRROR}/software/scm/git/git-${PV}.tar.gz;name=tarball \
            file://0001-config.mak.uname-do-not-force-RHEL-7-specific-build-.patch \
            "
 
+SRC_URI:append:class-nativesdk = " \
+           file://environment.d-git.sh \
+           "
+
 S = "${WORKDIR}/git-${PV}"
 
 LIC_FILES_CHKSUM = "\
@@ -112,6 +116,9 @@ do_install:append:class-nativesdk() {
 		GIT_EXEC_PATH='`dirname $''realpath`'/${REL_GIT_EXEC_PATH} \
 		GIT_TEMPLATE_DIR='`dirname $''realpath`'/${REL_GIT_TEMPLATE_DIR}
 	perl_native_fixup
+
+	mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
+	install -m 644 ${UNPACKDIR}/environment.d-git.sh ${D}${SDKPATHNATIVE}/environment-setup.d/git.sh
 }
 
 FILES:${PN} += "${datadir}/git-core ${libexecdir}/git-core/"
@@ -152,6 +159,8 @@ FILES:${PN}-tk = " \
 
 PACKAGES =+ "gitweb"
 FILES:gitweb = "${datadir}/gitweb/"
+
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
index 4f0638b50c..bc9b2289f6 100644
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
+	install -m 644 ${UNPACKDIR}/environment.d-python3-requests.sh ${D}${SDKPATHNATIVE}/environment-setup.d/python3-requests.sh
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
diff --git a/meta/recipes-support/curl/curl_8.12.1.bb b/meta/recipes-support/curl/curl_8.12.1.bb
index dd1c89979a..4192693da8 100644
--- a/meta/recipes-support/curl/curl_8.12.1.bb
+++ b/meta/recipes-support/curl/curl_8.12.1.bb
@@ -15,6 +15,11 @@ SRC_URI = " \
     file://disable-tests \
     file://no-test-timeout.patch \
 "
+
+SRC_URI:append:class-nativesdk = " \
+           file://environment.d-curl.sh \
+"
+
 SRC_URI[sha256sum] = "0341f1ed97a26c811abaebd37d62b833956792b7607ea3f15d001613c76de202"
 
 # Curl has used many names over the years...
@@ -97,6 +102,9 @@ do_install:append:class-target() {
 
 do_install:append:class-nativesdk() {
 	fix_absolute_paths
+
+	mkdir -p ${D}${SDKPATHNATIVE}/environment-setup.d
+	install -m 644 ${UNPACKDIR}/environment.d-curl.sh ${D}${SDKPATHNATIVE}/environment-setup.d/curl.sh
 }
 
 do_compile_ptest() {
@@ -150,6 +158,7 @@ FILES:lib${BPN} = "${libdir}/lib*.so.*"
 RRECOMMENDS:lib${BPN} += "ca-certificates"
 
 FILES:${PN} += "${datadir}/zsh"
+FILES:${PN}:append:class-nativesdk = " ${SDKPATHNATIVE}/environment-setup.d/curl.sh"
 
 inherit multilib_script
 MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/curl-config"
-- 
2.43.0


