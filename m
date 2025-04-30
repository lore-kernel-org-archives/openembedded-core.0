Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91098C3ABAC
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 03:00:37 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.8392.1745982036475910469
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 20:00:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Rhx3PKRg;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22c33677183so71087945ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 20:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1745982036; x=1746586836; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LbpCf/2/Rjsl5Z+cH5IiyciA7Bp3/0cQqfZHwGPa0vg=;
        b=Rhx3PKRgr1F6tGRu64xnykRf95uNrQBfWXUqkt/ndag1XwMDMmcFnpUI7/kAaHpBZF
         n8uKrXuKI4YfAoyKBT3QwoO8NHHqc5FX4qd+qMnS5fR5k/7WQZHjtQjJffrHTQuDlA70
         M30s7Q/7qZPWm8BXgwjOIWk8yIa+fF2LKD6+48yURD0Q+rdujeQlVtQS0DNwcUTX0KLT
         KlSz5CTXndb4OXSdTYE90o2FpARHCZpNGBmLR1SHCM0ULpxtFJwWwzLS+V7EtjFKFZt+
         N3+sWYInEQ8Ra7aqratZD2TW54X3i8MLKv7mqitbzY/EiJcLr5CfPwkfi+5UQNTlXQ1r
         medQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745982036; x=1746586836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LbpCf/2/Rjsl5Z+cH5IiyciA7Bp3/0cQqfZHwGPa0vg=;
        b=Ve5+4evBxBSgmTZh+VZ+lq05W2Y1C5/3t/PtnhKMDjB2Ab2LaMV38jrDFo9/eUTScy
         Zpfxq7AojxBW2V6qZtu124ltwoIjClyXQIl+VbMSd359DEDfF8LHLwywrmsPhvsSp6bt
         LJjDsUiSIjmeJVynmiV2Gidaetgx5HgK/g8/DN1ttJmx2VkWECTNltQpQ/IshxDg1nPU
         D/FtqAmKAFUUUvbNxws/AZlmXHpHZxnFjn8dpM7ZhDp/jTw4XoFEkl4O1EUWldR1tp/q
         pkqgb0XodgGtvIvTcAYed8nMRV0YKtWMDnP9mqvfJefLHtKucIhi3ljgRhjlIyhB1rJB
         4NlQ==
X-Gm-Message-State: AOJu0YxABxFjQgjnRbojiGRFtcLTED3nt+TrkdwqyWOQId0CqqTbsjqT
	Tb58Pttbz4ufb/2K2Q08Btl3HMWDPD/rz8yOjfh6b+JQR3eYTqX6eP2EtWB5QmjM1T1BAp77Xtv
	o
X-Gm-Gg: ASbGnctk4s79VUgQWuSpmTdwDiYr+wza6w3GHQkEiOvYJYO2Mu2VQJnXf/lpMOm2wRT
	N3JD1Ewr8vFmGjkuv1AYnJWsp5kTLrr3gz5kuFJ9HvFdc7BTyFP/rPqBfFzm/iJsMm1y1sqeipG
	KF9enWaiXC8g9CNx+OVnGScqCBE89rY5LuY7kvmw2ao+ol1Masn7OJVCnaFh8rsl7jrQ8LX7SHw
	GZxPBKBlNyglN3RNyUCZWtRbvXsWHL2JHWJf3/f5QSUWH+Gw6G7iNB40NCUva92Wdmlr+YPvPc4
	Ifm8a570RsyHM/QPTCXWdUfeRo4sJW8=
X-Google-Smtp-Source: AGHT+IHyoRB9m4/Y/KVMLDZ3dJi0AR6KR74OU/G+DXyTT/xAJdY8h6Cxs+6SdK+vw19hOGZOSPJijg==
X-Received: by 2002:a17:903:3bc4:b0:224:194c:694c with SMTP id d9443c01a7336-22df57ca640mr15791905ad.28.1745982035580;
        Tue, 29 Apr 2025 20:00:35 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:34b:e5e0:c38a:7e03])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22de49dccd3sm30461175ad.123.2025.04.29.20.00.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 20:00:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 14/15] buildtools-tarball: Make buildtools respects host CA certificates
Date: Tue, 29 Apr 2025 20:00:02 -0700
Message-ID: <0653b96bac6d0800dc5154557706a323418808be.1745981742.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745981742.git.steve@sakoman.com>
References: <cover.1745981742.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 03:00:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215720

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
index 6cb82d7386..c635be8aca 100644
--- a/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
+++ b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
@@ -1,8 +1,23 @@
 export OPENSSL_CONF="$OECORE_NATIVE_SYSROOT/usr/lib/ssl/openssl.cnf"
-if [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
-    export SSL_CERT_DIR="$OECORE_NATIVE_SYSROOT/usr/lib/ssl/certs"
-    export SSL_CERT_FILE="$OECORE_NATIVE_SYSROOT/usr/lib/ssl/certs/ca-certificates.crt"
-    export BB_ENV_PASSTHROUGH_ADDITIONS="${BB_ENV_PASSTHROUGH_ADDITIONS:-} SSL_CERT_DIR SSL_CERT_FILE"
-fi
 export OPENSSL_MODULES="$OECORE_NATIVE_SYSROOT/usr/lib/ossl-modules/"
 export OPENSSL_ENGINES="$OECORE_NATIVE_SYSROOT/usr/lib/engines-3"
+
+# Respect host env SSL_CERT_FILE/SSL_CERT_DIR first, then auto-detected host cert, then cert in buildtools
+# CAFILE/CAPATH is auto-deteced when source buildtools
+if [ -z "$SSL_CERT_FILE" ]; then
+   if [ -n "$CAFILE" ];then
+       export SSL_CERT_FILE="$CAFILE"
+   elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
+       export SSL_CERT_FILE="$OECORE_NATIVE_SYSROOT/usr/lib/ssl/certs/ca-certificates.crt"
+   fi
+fi
+
+if [ -z "$SSL_CERT_DIR" ]; then
+   if [ -n "$CAPATH" ];then
+       export SSL_CERT_DIR="$CAPATH"
+   elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
+       export SSL_CERT_DIR="$OECORE_NATIVE_SYSROOT/usr/lib/ssl/certs"
+   fi
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


