Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FF41C3ABCC
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 15:24:13 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.1428.1746804253211681096
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 May 2025 08:24:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=QONxwUEi;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7423df563d6so941189b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 08:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1746804252; x=1747409052; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oZshGgVqUWDYA/M6R3aHTbvJQo3F+EopkBjJSj4/3hE=;
        b=QONxwUEigXvU7FoGygLLKIwPpjjGNzfola17JlXrH/B4xyMKM/4xLbXD6hsvjenivT
         nAQBnAs1Fix08ww+baHPtDX/1++J5enQYovQeVUWl8uJ24fs2dx1IkbrrmKWqwpJT5vb
         cUuIToQdHllbvcUfrpwPDyNnTQE51L2roUdoso6HCcaXKoChCPE9nfd8haz4nPmPKAG5
         XCX6wWjaKI3rcw4V2+vM1LmP3uRaU7NUnUm7kcGS79tY+VWbusrpAimytvcnft9PG7JS
         k1B3lmzNHJ7fSktnLm8dN/4mxXMkXgD7Z575RjgN6hDkgueuJ3AXz9FwsOkFXMTBo1mG
         lv3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746804252; x=1747409052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oZshGgVqUWDYA/M6R3aHTbvJQo3F+EopkBjJSj4/3hE=;
        b=ZrHwM6deBU0DlAu4ujwHIm8jCA6fpI8ZZCCruHbMWImoakx6kXHP1mkDWsP1tPI6PG
         Z7mAAWyijR/XKCF47MH31EX3UlGxOQ2DoBkO0M5va9rOg+9h9DcAIpt1elPmsK+4E5jp
         UUtbM5b1CK/vtEt79+Bld/JRdsztpstyKRIykJCgeoZpoWzj6rCQEimo2//hlsaCI4ss
         txlikth0HfVIF9tm4Ykp8HydhYJA/QhRujkCofaUHskVQD68jfJIaHf1VzsMq8NgIu9h
         8a/2no3kzJFQLHNfZWUqZCcv6w1fXsZ/NQtuON9WQL6ud7JkVLMs3Fbh9/Zq9qoVwKnu
         B1RQ==
X-Gm-Message-State: AOJu0YzRH8Xc23N4J5DAtHPUSi5oYfjWYRCA5Hcn68pWkSl4ULcVjhWi
	sKC2KXlxoDgJsPwplokABYmeazlhULwn0HMCL7ZNzQ+ryDY6TLrKpYCdeZWIHJk5C/hsQGfi43b
	3
X-Gm-Gg: ASbGncvvzhQ0/h0h+w2xv/YIi9ls7Z3v4Fyj0srKVhg8YywNQ/7YMLxShV++KZKMCio
	2yv9Y+VIJOSIBUVwlKHwYYHapFcv4bT12qtus7eXDLCN1sT5B0TGXcbrzm79v62Ji8ne6p9TKlF
	JZ81csC2UU58vW4n8SPvOMmuRycbAGaRGJU59i3QPElH1QcBybg4ROrqoMRg3rGjuVIFl4AUH0M
	wNAXQz/5laFA2G7ceLi0VVDkOy5Ui2LEuhfs1pYmY7DBcRfKsjyHOD9EBxSNgMe9vz/Ot4MZLBV
	zjpZb/6VxK0b3vM5xWHjQ3Tl/bVyhH/s
X-Google-Smtp-Source: AGHT+IEpcehLN2lFpk65ZMCAD6kXMmpFw2nq6qlBvaYA30Z81Mo3yfeku2oYeYPEOea/CHSsCYHEBQ==
X-Received: by 2002:a05:6a00:1488:b0:736:34ca:dee2 with SMTP id d2e1a72fcca58-7423ba81707mr5719106b3a.4.1746804252375;
        Fri, 09 May 2025 08:24:12 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:1912:b658:11a7:402c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a108fbsm1848319b3a.115.2025.05.09.08.24.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 08:24:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 13/17] buildtools-tarball: Make buildtools respects host CA certificates
Date: Fri,  9 May 2025 08:23:29 -0700
Message-ID: <0d5f241eee19c0dff9f9f59949485414935edaa2.1746804035.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746804035.git.steve@sakoman.com>
References: <cover.1746804035.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 15:24:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216221

From: Changqing Li <changqing.li@windriver.com>

To adapt user network enviroment, buildtools should first try to use
the user configured envs like SSL_CERT_FILE/CURL_CA_BUNDLE/..., if these
envs is not set, then use the auto-detected ca file and ca path, and
finally use the CA certificates in buildtools.

nativesdk-openssl set OPENSSLDIR as "/not/builtin", need set SSL_CERT_FILE/SSL_CERT_DIR to work

nativesdk-curl don't set default ca file, need
SSL_CERT_FILE/SSL_CERT_DIR or CURL_CA_BUNDLE/CURL_CA_PATH to work

nativesdk-git actually use libcurl, and GIT_SSL_CAPATH/GIT_SSL_CAINFO
also works

nativesdk-python3-requests will use cacert.pem under python module certifi by
default, need to set REQUESTS_CA_BUNDLE

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssl/files/environment.d-openssl.sh    | 25 +++++++++++++++----
 meta/recipes-core/meta/buildtools-tarball.bb  | 23 ++++++++++++++++-
 .../git/git/environment.d-git.sh              | 21 +++++++++++++---
 .../environment.d-python3-requests.sh         | 13 +++++++---
 .../curl/curl/environment.d-curl.sh           | 21 +++++++++++++---
 5 files changed, 88 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
index 79b9bc77ec..71d378734c 100644
--- a/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
+++ b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
@@ -1,9 +1,24 @@
 export OPENSSL_CONF="$OECORE_NATIVE_SYSROOT/usr/lib/ssl-3/openssl.cnf"
-if [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
-    export SSL_CERT_DIR="$OECORE_NATIVE_SYSROOT/usr/lib/ssl-3/certs"
-    export SSL_CERT_FILE="$OECORE_NATIVE_SYSROOT/usr/lib/ssl-3/certs/ca-certificates.crt"
-    export BB_ENV_PASSTHROUGH_ADDITIONS="${BB_ENV_PASSTHROUGH_ADDITIONS:-} SSL_CERT_DIR SSL_CERT_FILE"
-fi
 export OPENSSL_MODULES="$OECORE_NATIVE_SYSROOT/usr/lib/ossl-modules/"
 export OPENSSL_ENGINES="$OECORE_NATIVE_SYSROOT/usr/lib/engines-3"
 export BB_ENV_PASSTHROUGH_ADDITIONS="${BB_ENV_PASSTHROUGH_ADDITIONS:-} OPENSSL_CONF OPENSSL_MODULES OPENSSL_ENGINES"
+
+# Respect host env SSL_CERT_FILE/SSL_CERT_DIR first, then auto-detected host cert, then cert in buildtools
+# CAFILE/CAPATH is auto-deteced when source buildtools
+if [ -z "$SSL_CERT_FILE" ]; then
+	if [ -n "$CAFILE" ];then
+		export SSL_CERT_FILE="$CAFILE"
+	elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
+		export SSL_CERT_FILE="$OECORE_NATIVE_SYSROOT/usr/lib/ssl-3/certs/ca-certificates.crt"
+	fi
+fi
+
+if [ -z "$SSL_CERT_DIR" ]; then
+	if [ -n "$CAPATH" ];then
+		export SSL_CERT_DIR="$CAPATH"
+	elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
+		export SSL_CERT_DIR="$OECORE_NATIVE_SYSROOT/usr/lib/ssl-3/certs"
+	fi
+fi
+
+export BB_ENV_PASSTHROUGH_ADDITIONS="${BB_ENV_PASSTHROUGH_ADDITIONS:-} SSL_CERT_DIR SSL_CERT_FILE"
diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index 414c266663..8e78169e23 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -80,14 +80,35 @@ create_sdk_files:append () {
 	toolchain_create_sdk_version ${SDK_OUTPUT}/${SDKPATH}/version-${SDK_SYS}
 
 	cat >> $script <<EOF
+# Detect host ca file/path, export for envfile to use
+# /etc/ssl/certs/ca-certificates.crt Debian systems
+# /etc/pki/tls/certs/ca-bundle.crt Fedora systems
+# /etc/ssl/ca-bundle.pem Suse systems
+export CAFILE
+export CAPATH
+for a in /etc/ssl/certs/ca-certificates.crt \
+    /etc/pki/tls/certs/ca-bundle.crt \
+    /etc/ssl/ca-bundle.pem ; do
+    if test -f "\$a"; then
+        CAFILE="\$a"
+        break
+    fi
+done
+
+a="/etc/ssl/certs"
+if test -d "\$a" && ls "\$a"/[0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f][0-9a-f].0 >/dev/null 2>/dev/null; then
+    CAPATH="\$a"
+fi
+
 if [ -d "\$OECORE_NATIVE_SYSROOT/environment-setup.d" ]; then
 	for envfile in \$OECORE_NATIVE_SYSROOT/environment-setup.d/*.sh; do
 		. \$envfile
 	done
 fi
+
 # We have to unset this else it can confuse oe-selftest and other tools
 # which may also use the overlapping namespace.
-unset OECORE_NATIVE_SYSROOT
+unset OECORE_NATIVE_SYSROOT CAFILE CAPATH
 EOF
 
 	if [ "${SDKMACHINE}" = "i686" ]; then
diff --git a/meta/recipes-devtools/git/git/environment.d-git.sh b/meta/recipes-devtools/git/git/environment.d-git.sh
index f8e3221510..9c7b5a9251 100644
--- a/meta/recipes-devtools/git/git/environment.d-git.sh
+++ b/meta/recipes-devtools/git/git/environment.d-git.sh
@@ -1,4 +1,19 @@
-if [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
-    export GIT_SSL_CAINFO="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt"
-    export BB_ENV_PASSTHROUGH_ADDITIONS="${BB_ENV_PASSTHROUGH_ADDITIONS:-} GIT_SSL_CAINFO"
+# Respect host env GIT_SSL_CAINFO/GIT_SSL_CAPATH first, then auto-detected host cert, then cert in buildtools
+# CAFILE/CAPATH is auto-deteced when source buildtools
+if [ -z "$GIT_SSL_CAINFO" ]; then
+	if [ -n "$CAFILE" ];then
+		export GIT_SSL_CAINFO="$CAFILE"
+	elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
+		export GIT_SSL_CAINFO="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt"
+	fi
 fi
+
+if [ -z "$GIT_SSL_CAPATH" ]; then
+	if [ -n "$CAPATH" ];then
+		export GIT_SSL_CAPATH="$CAPATH"
+	elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
+		export GIT_SSL_CAPATH="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs"
+	fi
+fi
+
+export BB_ENV_PASSTHROUGH_ADDITIONS="${BB_ENV_PASSTHROUGH_ADDITIONS:-} GIT_SSL_CAINFO GIT_SSL_CAPATH"
diff --git a/meta/recipes-devtools/python/python3-requests/environment.d-python3-requests.sh b/meta/recipes-devtools/python/python3-requests/environment.d-python3-requests.sh
index c7faec127d..492177a9c3 100644
--- a/meta/recipes-devtools/python/python3-requests/environment.d-python3-requests.sh
+++ b/meta/recipes-devtools/python/python3-requests/environment.d-python3-requests.sh
@@ -1,4 +1,11 @@
-if [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
-    export REQUESTS_CA_BUNDLE="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt"
-    export BB_ENV_PASSTHROUGH_ADDITIONS="${BB_ENV_PASSTHROUGH_ADDITIONS:-} REQUESTS_CA_BUNDLE"
+# Respect host env REQUESTS_CA_BUNDLE first, then auto-detected host cert, then cert in buildtools
+# CAFILE/CAPATH is auto-deteced when source buildtools
+if [ -z "$REQUESTS_CA_BUNDLE" ]; then
+	if [ -n "$CAFILE" ];then
+		export REQUESTS_CA_BUNDLE="$CAFILE"
+	elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
+		export REQUESTS_CA_BUNDLE="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt"
+	fi
 fi
+
+export BB_ENV_PASSTHROUGH_ADDITIONS="${BB_ENV_PASSTHROUGH_ADDITIONS:-} REQUESTS_CA_BUNDLE"
diff --git a/meta/recipes-support/curl/curl/environment.d-curl.sh b/meta/recipes-support/curl/curl/environment.d-curl.sh
index 0ab83a267d..7c2971b3da 100644
--- a/meta/recipes-support/curl/curl/environment.d-curl.sh
+++ b/meta/recipes-support/curl/curl/environment.d-curl.sh
@@ -1,4 +1,19 @@
-if [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
-    export CURL_CA_BUNDLE="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt"
-    export BB_ENV_PASSTHROUGH_ADDITIONS="${BB_ENV_PASSTHROUGH_ADDITIONS:-} CURL_CA_BUNDLE"
+# Respect host env CURL_CA_BUNDLE/CURL_CA_PATH first, then auto-detected host cert, then cert in buildtools
+# CAFILE/CAPATH is auto-deteced when source buildtools
+if [ -z "$CURL_CA_PATH" ]; then
+	if [ -n "$CAFILE" ];then
+		export CURL_CA_BUNDLE="$CAFILE"
+	elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
+		export CURL_CA_BUNDLE="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt"
+	fi
 fi
+
+if [ -z "$CURL_CA_PATH" ]; then
+	if [ -n "$CAPATH" ];then
+		export CURL_CA_PATH="$CAPATH"
+	elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
+		export CURL_CA_PATH="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs"
+	fi
+fi
+
+export BB_ENV_PASSTHROUGH_ADDITIONS="${BB_ENV_PASSTHROUGH_ADDITIONS:-} CURL_CA_BUNDLE CURL_CA_PATH"
-- 
2.43.0


