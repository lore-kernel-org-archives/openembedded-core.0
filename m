Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5ED2FB5E9F
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 00:03:45 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.65252.1773705822599562241
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 17:03:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ucd0Sd6o;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: michalwsieron@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-665634cb208so2791357a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 17:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773705821; x=1774310621; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V+z8IASVIIs3LpgdHFriQ31CK9Jd8cUbVLDw5qQfdI4=;
        b=Ucd0Sd6o+Kkya7M25a9CPEGfopf4/fTBd3Ptd36LDt26SwtpUCwBfa1gTid0/orn5I
         e9Clryj7PxnzmCa/Ft5fSzZM+tl/epgxH5fATyerptk8ithS+xwegSo5MhnGac9UFzh/
         QQdVW0N+tBTN6N032suz+16korV05NYzfW4Iz4OV4xe9PJSTIS7k3Zyh1pPUYuFOotfO
         jaN3JvbB34LlxUxUGq0vNNdSGWyQj+wLMnHjHAW9otRkU/X5d0m03Y0gQX+ZQQ8xMi8v
         5RZEUN2VM/gbppk2gecLRoEQ+azD3/NbbBiX4xzovZWcg7xYB9aXu0pdRdMxDPpYRcdC
         7rgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773705821; x=1774310621;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V+z8IASVIIs3LpgdHFriQ31CK9Jd8cUbVLDw5qQfdI4=;
        b=O6set7VA1QniQOpXrr74f5QqKSNiLugexRUBWRpBGD1/68FoUaZzPEZwQBi7uiL5PH
         fgiORt1VlKIyBKfELNX2s5KSQJUf7gB0h9Y6vrYK2wSQBGpWM1VXVdx+0wYxkBOAxrp2
         apbzTV8mXgSxe7BsNIgHJqsq2CtEHqloZo7XlRx1Eqcfn4HTWPRrb4qUPfNju8ueEuYU
         vOISNkZkGSP2tX2Hu+D0S9O5uBEfvLveHqskE5higDrP6LgfUXBAK+XccebnAmklX8QC
         3e7r1KUeoH3epqEu6oW8nY7E+zEBUsMW+iCU/M6xsUtaSSvfgzXc9drbrcTGkxjgOpTO
         ACvA==
X-Gm-Message-State: AOJu0YyhT6xMGHfqWJvHLqV2qPBgdINR5087ZfMUxZ0xIYBohB7yxEsn
	xGtTsHufm1u/lB+37atlBW1KJwqTF13I/g+bX1QeHqggwbquZ0FIXBRrox26pOwR
X-Gm-Gg: ATEYQzyRLMA6C8mjmURg8vVBq7xjLRgGedR0ymRf/kyRgonoI2x7LPT+tnVo6FukP4X
	hoiIsmywnAgsjb3Aa4WlEQyjU4hQQOo45plR88/48wG1wbwAxR+/dPGukNEyqwdx/3EU/69poeN
	RYg0r+dPYhS2NGDY9+5MaCKY6nXqIF3FNc/uUJ3rSEjns8ysmvI9TXtzXUn0XjkftpN2zPwZn+w
	gT4NA96JYh1iSGE/9d8AWnZuyR7KmsQM+wDODDG3OqYEMXm3hZflKFK7CuoZfqFesnBfvVtKLYb
	1YhcVQvSUL5W+0Sf07HdCawwixcsKRJK7qoncg6O6tprPKWDdG8iZyAfbHO1d/zCIC9yrvZvU89
	c0dCS3woZkwv6cNyGlWSZLlBoOSOqHb0p90H0fEvJYiJxNyeD/0nXyonH4Vz0d/kWbaJ910yD+g
	nq88l25w/Z6W6wFBpCGe6q7WOLic4P6w5Vpihza/H9dzH4MEnS0xjtdyA=
X-Received: by 2002:a17:907:9408:b0:b97:b210:a91a with SMTP id a640c23a62f3a-b97b210c0b3mr399640666b.13.1773705820770;
        Mon, 16 Mar 2026 17:03:40 -0700 (PDT)
Received: from [127.0.1.1] (93-159-20-97.cgnat.inetia.pl. [93.159.20.97])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cf49fa6sm654584766b.58.2026.03.16.17.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 17:03:40 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
Date: Tue, 17 Mar 2026 01:03:16 +0100
Subject: [PATCH v2 12/12] recipes-devtools/python: Convert confusing
 appends to override syntax
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-fix-invalid-appends-v2-12-5c65ae5787d9@gmail.com>
References: <20260317-fix-invalid-appends-v2-0-5c65ae5787d9@gmail.com>
In-Reply-To: <20260317-fix-invalid-appends-v2-0-5c65ae5787d9@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Michal Sieron <michalwsieron@gmail.com>
X-Mailer: b4 0.14.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 00:03:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233285

While in this case `RDEPENDS:class-native +=` wouldn't result in any
unwanted override, there is no guarantee there won't be a change, which
would be hidden by this override. To avoid any surprises in the future
let's use `:append:class-target =` syntax here.

Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
---
 meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb | 2 +-
 meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb     | 2 +-
 meta/recipes-devtools/python/python3-chardet_5.2.0.bb    | 2 +-
 meta/recipes-devtools/python/python3-cython_3.2.4.bb     | 4 ++--
 meta/recipes-devtools/python/python3-ply_3.11.bb         | 2 +-
 meta/recipes-devtools/python/python3-pyasn1_0.6.2.bb     | 2 +-
 meta/recipes-devtools/python/python3-pycparser_3.0.bb    | 4 ++--
 meta/recipes-devtools/python/python3-pysocks_1.7.1.bb    | 2 +-
 meta/recipes-devtools/python/python3-pytz_2025.2.bb      | 2 +-
 9 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb b/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb
index 322497b09b..0449438ebe 100644
--- a/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb
+++ b/meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb
@@ -10,7 +10,7 @@ SRC_URI[sha256sum] = "13ae38502be632115abf8a24cbe5f4da52e3b5231990aff31123c80530
 
 inherit pypi setuptools3
 
-RDEPENDS:${PN}:class-target += " \
+RDEPENDS:${PN}:append:class-target = " \
     python3-codecs \
     python3-crypt \
     python3-ctypes \
diff --git a/meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb b/meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb
index 6397ecd818..f803f28ddf 100644
--- a/meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb
+++ b/meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb
@@ -14,7 +14,7 @@ CARGO_SRC_DIR = "src/_bcrypt"
 
 require ${BPN}-crates.inc
 
-RDEPENDS:${PN}:class-target += "\
+RDEPENDS:${PN}:append:class-target = " \
     python3-cffi \
     python3-ctypes \
     python3-shell \
diff --git a/meta/recipes-devtools/python/python3-chardet_5.2.0.bb b/meta/recipes-devtools/python/python3-chardet_5.2.0.bb
index 9acbeeb3f2..1b4600f00b 100644
--- a/meta/recipes-devtools/python/python3-chardet_5.2.0.bb
+++ b/meta/recipes-devtools/python/python3-chardet_5.2.0.bb
@@ -14,7 +14,7 @@ FILES:${PN}-cli += " \
 
 RDEPENDS:${PN}-cli = "${PN} "
 
-RDEPENDS:${PN}:class-target += " \
+RDEPENDS:${PN}:append:class-target = " \
     python3-logging \
 "
 
diff --git a/meta/recipes-devtools/python/python3-cython_3.2.4.bb b/meta/recipes-devtools/python/python3-cython_3.2.4.bb
index 3e889857e1..c39473be7b 100644
--- a/meta/recipes-devtools/python/python3-cython_3.2.4.bb
+++ b/meta/recipes-devtools/python/python3-cython_3.2.4.bb
@@ -25,7 +25,7 @@ do_install:append() {
     mv ${D}${bindir}/cygdb ${D}${bindir}/cygdb3
 }
 
-RDEPENDS:${PN}:class-target += "\
+RDEPENDS:${PN}:append:class-target = " \
     python3-misc \
     python3-netserver \
     python3-pkgutil \
@@ -35,7 +35,7 @@ RDEPENDS:${PN}:class-target += "\
     python3-xml \
 "
 
-RDEPENDS:${PN}:class-nativesdk += "\
+RDEPENDS:${PN}:append:class-nativesdk = " \
     nativesdk-python3-misc \
     nativesdk-python3-netserver \
     nativesdk-python3-pkgutil \
diff --git a/meta/recipes-devtools/python/python3-ply_3.11.bb b/meta/recipes-devtools/python/python3-ply_3.11.bb
index 2c5fa3f215..69c0b839c6 100644
--- a/meta/recipes-devtools/python/python3-ply_3.11.bb
+++ b/meta/recipes-devtools/python/python3-ply_3.11.bb
@@ -9,7 +9,7 @@ SRC_URI[sha256sum] = "00c7c1aaa88358b9c765b6d3000c6eec0ba42abca5351b095321aef446
 
 inherit pypi setuptools3
 
-RDEPENDS:${PN}:class-target += "\
+RDEPENDS:${PN}:append:class-target = " \
     python3-netclient \
     python3-shell \
 "
diff --git a/meta/recipes-devtools/python/python3-pyasn1_0.6.2.bb b/meta/recipes-devtools/python/python3-pyasn1_0.6.2.bb
index 01157e251e..a6eb561bf4 100644
--- a/meta/recipes-devtools/python/python3-pyasn1_0.6.2.bb
+++ b/meta/recipes-devtools/python/python3-pyasn1_0.6.2.bb
@@ -7,7 +7,7 @@ SRC_URI[sha256sum] = "9b59a2b25ba7e4f8197db7686c09fb33e658b98339fadb826e95126290
 
 inherit pypi python_setuptools_build_meta ptest-python-pytest
 
-RDEPENDS:${PN}:class-target += " \
+RDEPENDS:${PN}:append:class-target = " \
     python3-codecs \
     python3-logging \
     python3-math \
diff --git a/meta/recipes-devtools/python/python3-pycparser_3.0.bb b/meta/recipes-devtools/python/python3-pycparser_3.0.bb
index c17be9b2d4..ef6f48d0e5 100644
--- a/meta/recipes-devtools/python/python3-pycparser_3.0.bb
+++ b/meta/recipes-devtools/python/python3-pycparser_3.0.bb
@@ -9,11 +9,11 @@ inherit pypi python_setuptools_build_meta
 
 BBCLASSEXTEND = "native nativesdk"
 
-RDEPENDS:${PN}:class-target += "\
+RDEPENDS:${PN}:append:class-target = " \
     python3-netclient \
 "
 
-RSUGGESTS:${PN}:class-target += "\
+RSUGGESTS:${PN}:append:class-target = " \
     cpp \
     cpp-symlinks \
     "
diff --git a/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb b/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb
index 207d15d702..db1410ce82 100644
--- a/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb
+++ b/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb
@@ -9,7 +9,7 @@ PYPI_PACKAGE = "PySocks"
 
 inherit pypi setuptools3
 
-RDEPENDS:${PN}:class-target += "\
+RDEPENDS:${PN}:append:class-target = " \
     python3-email \
     python3-io \
     python3-logging \
diff --git a/meta/recipes-devtools/python/python3-pytz_2025.2.bb b/meta/recipes-devtools/python/python3-pytz_2025.2.bb
index 86bfceadc8..07ae7ac702 100644
--- a/meta/recipes-devtools/python/python3-pytz_2025.2.bb
+++ b/meta/recipes-devtools/python/python3-pytz_2025.2.bb
@@ -9,7 +9,7 @@ PTEST_PYTEST_DIR = "pytz/tests"
 
 SRC_URI[sha256sum] = "360b9e3dbb49a209c21ad61809c7fb453643e048b38924c765813546746e81c3"
 
-RDEPENDS:${PN}:class-target += "\
+RDEPENDS:${PN}:append:class-target = " \
     python3-datetime \
     python3-doctest \
     python3-io \

-- 
2.53.0


