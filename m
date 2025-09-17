Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37013CAC59A
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 20:05:35 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.33530.1758139531142432050
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Sep 2025 13:05:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=MUmv++6Z;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-77796ad4c13so193939b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 13:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1758139530; x=1758744330; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a7qe/8nJmGCUzM9WKw7PBwIx6ypcb3LypCi24zm3mx4=;
        b=MUmv++6ZSkYE9D2eFX7VH5X42rM0co2BAfaSSYldQ6daZnn3NoDJPo+UiPxsPdXTHK
         s+d4QaE2RexBNg8u+XqnwHkWWFHEa8Y3Vlp1G3VFvW65BTnHl/HilBvMmW1rEiMYr2P5
         u9NaCP2X+C3D8IZR6EMO2XeKV9COcl1IYYNuV4/gbPqo7yVNtjEcAoownQqERjPLqaMZ
         GzgShWgUUB5mz2Yn/3UhJF8N8rSg8D2Cnw5iYAHfDof+z5F5ZteALi+ZukLt/5hAa4EK
         RriS7L1Dz2EbLi0kq9iLSjpoHkQ7mI6dDBNivVZiXxCrCo5tw3NQfegeAI0F9e1tJCSF
         XGXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758139530; x=1758744330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a7qe/8nJmGCUzM9WKw7PBwIx6ypcb3LypCi24zm3mx4=;
        b=ePsgIcJbN67R/GwxyQQT5JxP0kfVHDPUT5YtrRoLm6fmxSgpQ3OTgBy3eEfuAgo/cu
         rNiZE8H84x3gvFMUUgAl7xZYHvFL0q636F3rF1z94dhG1z4iZlWJmdLg3KwyAqfJXtdH
         nbKH3O1T9JgHqOWlA5g5QQFRFaGCAS58I8OoGBqIlYdiHg9rOYu82eNjwChyvy0/OLWt
         iK6E1Y7FF8ejV9j8VCnxdYO+sNgTlKRxBsoU/mH5GKv35TtVZkj1ljgFuhfBtMSLLWQ9
         OC6R+Vi1bJ/D3yN1w6HJeC+YbGrSOX3BR6sZIV9IuRKgwembrvV7K0IgiSGLKSeGi/1k
         Ih4A==
X-Gm-Message-State: AOJu0YwDAeSaH0fwtHBrstZkroPQcbnkOD7E1tQ25oam5r7Y4Od8+ZSl
	pmj49znsFzIR++V2q0x+0W426kgqSu4m+ZKXEaFuBhEoW8N5cqiFwolz7QfQs16W76MF0qaP0XO
	bexSQ
X-Gm-Gg: ASbGncumLej5sQ0COQnxE6f1BNNhZ94kJb1vqFKguqIEMzGcqahzs7I7izP6iqP2sBG
	+v5uDvjPJmGJX1wzGCvgR1rlnMRlOGCrp/oEs6jXmLgb5s+n9HH+3lEiP8XxLILL2hh9bnkv3oe
	y1MYIsVZ9gtoF6YL0Uel/xXtXCGIxfKuIjZ859tyqpSNZWXOmqRITgIYYHWKQ4gNob2MVMZSakH
	GHPBs8xnuT74HLiyPdshPac91ONyMWskKi3SSiVM6TTjKlerfMgx5eelE09AKJV8tD5QJEuYCcC
	ef+17V0OtMTa20hgrbmHVeD5WdQLY3nKt/CJpEviUXXBkLET31yPaxccOMn/2FAqxhMAewnFNs6
	HTM/BPRWW0/F3tRFrX2YEjfGs
X-Google-Smtp-Source: AGHT+IGZNIgzV1qp07uqg/yqebFhFgdtMPRy4UWK/+dAWBzo97aoub0+LQpFzQ3pz3Z3V+PjNveqxA==
X-Received: by 2002:a05:6a20:12c7:b0:249:3006:7573 with SMTP id adf61e73a8af0-27a9005e456mr5097822637.5.1758139530316;
        Wed, 17 Sep 2025 13:05:30 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:3ed6:a4e8:9109:79e1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77cfbb79b81sm247452b3a.10.2025.09.17.13.05.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 13:05:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 8/8] buildtools-tarball: fix unbound variable issues under 'set -u'
Date: Wed, 17 Sep 2025 13:04:45 -0700
Message-ID: <4cf131ebd157b79226533b5a5074691dd0e1a4ab.1758139278.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1758139278.git.steve@sakoman.com>
References: <cover.1758139278.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Sep 2025 20:05:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223623

From: Haixiao Yan <haixiao.yan.cn@windriver.com>

When Bash runs with 'set -u' (nounset), accessing an unset variable
directly (e.g. [ -z "$SSL_CERT_FILE" ]) causes a fatal "unbound variable"
error. As a result, the fallback logic to set SSL_CERT_FILE/SSL_CERT_DIR
is never triggered and the script aborts.

The current code assumes these variables may be unset or empty, but does
not guard against 'set -u'. This breaks builds in stricter shell
environments or when users explicitly enable 'set -u'.

Fix this by using parameter expansion with a default value, e.g.
"${SSL_CERT_FILE:-}", so that unset variables are treated as empty
strings. This preserves the intended logic (respect host env first, then
CAFILE/CAPATH, then buildtools defaults) and makes the script robust
under 'set -u'.

Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4d880c2eccd534133a2a4e6579d955605c0956ec)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../openssl/files/environment.d-openssl.sh    | 24 +++++++++----------
 .../git/git/environment.d-git.sh              |  8 +++----
 .../environment.d-python3-requests.sh         |  4 ++--
 .../curl/curl/environment.d-curl.sh           |  8 +++----
 4 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
index c635be8aca..d72edcb5ed 100644
--- a/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
+++ b/meta/recipes-connectivity/openssl/files/environment.d-openssl.sh
@@ -4,20 +4,20 @@ export OPENSSL_ENGINES="$OECORE_NATIVE_SYSROOT/usr/lib/engines-3"
 
 # Respect host env SSL_CERT_FILE/SSL_CERT_DIR first, then auto-detected host cert, then cert in buildtools
 # CAFILE/CAPATH is auto-deteced when source buildtools
-if [ -z "$SSL_CERT_FILE" ]; then
-   if [ -n "$CAFILE" ];then
-       export SSL_CERT_FILE="$CAFILE"
-   elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
-       export SSL_CERT_FILE="$OECORE_NATIVE_SYSROOT/usr/lib/ssl/certs/ca-certificates.crt"
-   fi
+if [ -z "${SSL_CERT_FILE:-}" ]; then
+	if [ -n "${CAFILE:-}" ];then
+		export SSL_CERT_FILE="$CAFILE"
+	elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
+		export SSL_CERT_FILE="$OECORE_NATIVE_SYSROOT/usr/lib/ssl/certs/ca-certificates.crt"
+	fi
 fi
 
-if [ -z "$SSL_CERT_DIR" ]; then
-   if [ -n "$CAPATH" ];then
-       export SSL_CERT_DIR="$CAPATH"
-   elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
-       export SSL_CERT_DIR="$OECORE_NATIVE_SYSROOT/usr/lib/ssl/certs"
-   fi
+if [ -z "${SSL_CERT_DIR:-}" ]; then
+	if [ -n "${CAPATH:-}" ];then
+		export SSL_CERT_DIR="$CAPATH"
+	elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
+		export SSL_CERT_DIR="$OECORE_NATIVE_SYSROOT/usr/lib/ssl/certs"
+	fi
 fi
 
 export BB_ENV_PASSTHROUGH_ADDITIONS="${BB_ENV_PASSTHROUGH_ADDITIONS:-} SSL_CERT_DIR SSL_CERT_FILE"
diff --git a/meta/recipes-devtools/git/git/environment.d-git.sh b/meta/recipes-devtools/git/git/environment.d-git.sh
index 9c7b5a9251..fdfa721c3b 100644
--- a/meta/recipes-devtools/git/git/environment.d-git.sh
+++ b/meta/recipes-devtools/git/git/environment.d-git.sh
@@ -1,15 +1,15 @@
 # Respect host env GIT_SSL_CAINFO/GIT_SSL_CAPATH first, then auto-detected host cert, then cert in buildtools
 # CAFILE/CAPATH is auto-deteced when source buildtools
-if [ -z "$GIT_SSL_CAINFO" ]; then
-	if [ -n "$CAFILE" ];then
+if [ -z "${GIT_SSL_CAINFO:-}" ]; then
+	if [ -n "${CAFILE:-}" ];then
 		export GIT_SSL_CAINFO="$CAFILE"
 	elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
 		export GIT_SSL_CAINFO="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt"
 	fi
 fi
 
-if [ -z "$GIT_SSL_CAPATH" ]; then
-	if [ -n "$CAPATH" ];then
+if [ -z "${GIT_SSL_CAPATH:-}" ]; then
+	if [ -n "${CAPATH:-}" ];then
 		export GIT_SSL_CAPATH="$CAPATH"
 	elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
 		export GIT_SSL_CAPATH="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs"
diff --git a/meta/recipes-devtools/python/python3-requests/environment.d-python3-requests.sh b/meta/recipes-devtools/python/python3-requests/environment.d-python3-requests.sh
index 492177a9c3..400972814b 100644
--- a/meta/recipes-devtools/python/python3-requests/environment.d-python3-requests.sh
+++ b/meta/recipes-devtools/python/python3-requests/environment.d-python3-requests.sh
@@ -1,7 +1,7 @@
 # Respect host env REQUESTS_CA_BUNDLE first, then auto-detected host cert, then cert in buildtools
 # CAFILE/CAPATH is auto-deteced when source buildtools
-if [ -z "$REQUESTS_CA_BUNDLE" ]; then
-	if [ -n "$CAFILE" ];then
+if [ -z "${REQUESTS_CA_BUNDLE:-}" ]; then
+	if [ -n "${CAFILE:-}" ];then
 		export REQUESTS_CA_BUNDLE="$CAFILE"
 	elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
 		export REQUESTS_CA_BUNDLE="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt"
diff --git a/meta/recipes-support/curl/curl/environment.d-curl.sh b/meta/recipes-support/curl/curl/environment.d-curl.sh
index 7c2971b3da..581108ef35 100644
--- a/meta/recipes-support/curl/curl/environment.d-curl.sh
+++ b/meta/recipes-support/curl/curl/environment.d-curl.sh
@@ -1,15 +1,15 @@
 # Respect host env CURL_CA_BUNDLE/CURL_CA_PATH first, then auto-detected host cert, then cert in buildtools
 # CAFILE/CAPATH is auto-deteced when source buildtools
-if [ -z "$CURL_CA_PATH" ]; then
-	if [ -n "$CAFILE" ];then
+if [ -z "${CURL_CA_PATH:-}" ]; then
+	if [ -n "${CAFILE:-}" ];then
 		export CURL_CA_BUNDLE="$CAFILE"
 	elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
 		export CURL_CA_BUNDLE="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt"
 	fi
 fi
 
-if [ -z "$CURL_CA_PATH" ]; then
-	if [ -n "$CAPATH" ];then
+if [ -z "${CURL_CA_PATH:-}" ]; then
+	if [ -n "${CAPATH:-}" ];then
 		export CURL_CA_PATH="$CAPATH"
 	elif [ -e "${OECORE_NATIVE_SYSROOT}/etc/ssl/certs/ca-certificates.crt" ];then
 		export CURL_CA_PATH="${OECORE_NATIVE_SYSROOT}/etc/ssl/certs"
-- 
2.43.0


