Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9172109E548
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 15:03:03 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49651.1774537376281735515
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 08:02:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=P4a91h29;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43b4f48c47cso793796f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 08:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774537374; x=1775142174; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/MCvP8XcaBoA5QZfGrh5/9pURwh22T/ybtF05fVpIT4=;
        b=P4a91h29w3fajqvy79LEoW1dyb+1leIlPcMOxEW0biVYP2U94W29o+otYq4Oz2sQ/b
         5x47gvYRMKbbk9i7mWL20xoqxzbbmder1X4mnZrTRHo6kiM+IekJs7U/eDpSW14Act8K
         NxnwYLwDb4SOpEEhWw2/ydnyCJj2ORHstqm8NfOXh+pKuyK1BnwO09bfcuI11/adRht+
         zxEPZYcFjL8h5xe8+CsRVB+QEiVdPUOcQcQdvcJ8shcmb01SOF90asxC3swwTRlbl2+r
         W+bWDuzREwwReSzo1H2ppdg+Vl36f98et1gVx3HDlq9kmuKAm9kRw6mNWa/9ZvqkkHq/
         fh2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774537374; x=1775142174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/MCvP8XcaBoA5QZfGrh5/9pURwh22T/ybtF05fVpIT4=;
        b=TTSTcuIleqK5RO7yPxBgC7qhnDspIFCbRTDK3YmpnvjNYD5DHFfhoy5xb9+JiekbZL
         m6hAehJjUGNceX3g1XXmLa+dqaHI+ZGs1B3DEnq7RXiyCbQ9AD35IW2tFPBfT/gJGdKS
         dIjE9J3YxqssKzo+WXZf3fg8QcLNH0v3Qf6lKbL2HD1gUbVcHbjwkthsoCoC7l/xIZAx
         o+KsHNAVQqU8cLT2Y9elhMd4HUOjgyGl0gLgz7qpQHJx1jp3XQQHSYWQDt9HZXm8c3ai
         MVqS3GB67rvYeUg6+boCX/5htwnvR7MkMpn3+/OhiBM22TTosa9I5+AHF0ILAZhQWw7z
         N4hA==
X-Gm-Message-State: AOJu0Yxw6YgqA5TViRICoVGE9PhqwIDkk5QLMkZnALNjWKdMiKYRPBi+
	FRWhb5OPFor7AWvIkZni/F0EgPl73ZpXNQBSs3vq07Wr7PTYzhtPzrBcLaYlbg==
X-Gm-Gg: ATEYQzymWd+LxDlFCM0K2njz9hDmTRbBmX7DTN6E5mYYCcstg6z/sIF6tmAur569278
	xAPSIdantpLE+hNd2PazpM4j2UQtNMfJHR7VjnLCpLH7UeKcKt5YkQEtjeadQ0qzzQk6HqNuvxo
	J/QJPT7R2oEZMVIOr3gqL+LLrSxyyMG5pj9ps7YiuDAwV1u1jHbWtItAbPGyjH6Ykhvt8e9wVBK
	QQdn4vumcaSJ9QBKDKyglpVvl414SduZEyjtLz6FAqolAOWkzxlm+2DqwUMcqalPiis23UPmock
	B6nPh4axhPpiDMd6y9MQPHKp0cDJ9dIK2y1T+62BDyvCgN1DP4Ldz3lKFGCY0HScmTkSWb6qihZ
	xFN1xYQcW61jeFqn89xm/1VeS1PVSK1/IIydRLzRkXJ76ZpYb5uxcvsreLX4Ifwq/ODU10LOPdd
	mZ2cNaktnAYLn+Tw==
X-Received: by 2002:a05:6000:2512:b0:43b:4e01:4aa9 with SMTP id ffacd0b85a97d-43b8898d49emr12546919f8f.10.1774537373599;
        Thu, 26 Mar 2026 08:02:53 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e352sm9022321f8f.3.2026.03.26.08.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 08:02:51 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [RFC][PATCH 2/4] rpm: Support Python freethreading
Date: Thu, 26 Mar 2026 15:35:52 +0100
Message-ID: <20260326150225.2083962-3-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326150225.2083962-1-zboszor@gmail.com>
References: <20260326150225.2083962-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 15:03:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234018

Added a patch to stop using the stable CPython API (of 3.7!)
as it prevents building rpm against a Python build with
freethreading enabled.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 .../files/0001-rpm-Don-t-use-stable-API.patch | 37 +++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_4.20.1.bb       |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/0001-rpm-Don-t-use-stable-API.patch

diff --git a/meta/recipes-devtools/rpm/files/0001-rpm-Don-t-use-stable-API.patch b/meta/recipes-devtools/rpm/files/0001-rpm-Don-t-use-stable-API.patch
new file mode 100644
index 0000000000..3d82fdab3f
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-rpm-Don-t-use-stable-API.patch
@@ -0,0 +1,37 @@
+From 2fb202730b49538bbe6d1439d419c18a89eb4c91 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?=
+ <zboszor@gmail.com>
+Date: Wed, 25 Mar 2026 08:20:13 +0100
+Subject: [PATCH] rpm: Don't use stable API
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+With Python freethreading enabled, these explicit errors are
+triggered in the Python headers:
+
+  #error "The limited API is not currently supported in the free-threaded build"
+
+Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
+Upstream-Status: Inappropriate [python freethreading specific]
+---
+ python/CMakeLists.txt | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/python/CMakeLists.txt b/python/CMakeLists.txt
+index acc003ad6..3f21205c8 100644
+--- a/python/CMakeLists.txt
++++ b/python/CMakeLists.txt
+@@ -18,9 +18,6 @@ Python3_add_library(_rpm
+ 	spec-py.c spec-py.h
+ )
+ 
+-# Select Python stable ABI
+-target_compile_definitions(_rpm PRIVATE Py_LIMITED_API=0x03070000)
+-
+ target_link_libraries(_rpm PRIVATE librpmio librpm librpmbuild librpmsign)
+ 
+ install(TARGETS _rpm
+-- 
+2.53.0
+
diff --git a/meta/recipes-devtools/rpm/rpm_4.20.1.bb b/meta/recipes-devtools/rpm/rpm_4.20.1.bb
index ba967ec1fa..05be3933e0 100644
--- a/meta/recipes-devtools/rpm/rpm_4.20.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.20.1.bb
@@ -39,6 +39,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.20.x;protoc
            file://0002-rpmio-rpmglob.c-avoid-using-GLOB_BRACE-if-undefined-.patch \
            file://0001-CMakeLists.txt-set-libdir-to-CMAKE_INSTALL_FULL_LIBD.patch \
            file://0001-CMakeLists.txt-Fix-checking-for-CFLAGS.patch \
+           file://0001-rpm-Don-t-use-stable-API.patch \
            "
 
 PE = "1"
-- 
2.53.0


