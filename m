Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98A8FFF6E69
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 20:29:35 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.86401.1773779367485025373
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Mar 2026 13:29:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EZ1n4TCc;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: michalwsieron@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-662fc12ac5bso11570078a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 13:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773779366; x=1774384166; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V+z8IASVIIs3LpgdHFriQ31CK9Jd8cUbVLDw5qQfdI4=;
        b=EZ1n4TCcLObm/Ch3KEylHfYJzJRlIVCFmnWSKC9UPqeaSgyrXlJlE66BndHh2CU7/c
         aTSjfa/vDwdjHIUeeXYI6CwJzH3o514zUDd6eec7hbF+w21HjTtewY9RKCv24QxqpHhH
         X8mxQPmyejAd4Vll7xVvkuCrocryPTqdyI9hWtTmAleTy1IoJIsMnsSTZGsyH8+SDALu
         VK3Pi/O8ekMyY4GDg0CgpP7sfqxz47liVKE/v9oNKVgR2ngA1Rq6n6In624lpgcp+csl
         hJjct/xDpk4sPQSl8tiyCyZ0Jks0TVLBspbU57wc+TSe4fneEE0X+Ef0bMN//DFK3+2N
         YGMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773779366; x=1774384166;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V+z8IASVIIs3LpgdHFriQ31CK9Jd8cUbVLDw5qQfdI4=;
        b=LjYMkskd9/ReDV3lzpkz5mZtbtzKI0iwDp4ndiWuFmh41ALVkpn5/uys+DfuCq8w9Q
         9+2XTIknvfbIYvIaJDJtHGjzSEsLECoxEWM8lDERIdBApP0TjPjLrP05gnW3qpmbVOSq
         DSzQ9HPYZW/hPp432bXc2EfC4I1XGGx0oDzEFZ+cOMtfN3j+0l0+KRj8cNLvG3Lp4Ejh
         Fec+29trWEyUJI+JcA3OlOjW8omNNBOwJXdWvz0UczvgcbK2avPykM2dPKUb6INFinTM
         cirw9/yFun9qb2qEw+4ac0UTUOWG2aoLqsqOxm57Wgn+gc3641euzWO2BFXtpADoJiyH
         UZUQ==
X-Gm-Message-State: AOJu0YwYxOnyH14dD8KzB8RhjrBeIKGB9j1HtHMFjW3TilkTKlsqPPes
	SPucdEvFyUuIXyMyk37JczbF4Za5IRw0yYNSzIiql2jZ52foCc8mPA5A
X-Gm-Gg: ATEYQzwD9/doPtvydbCc+cOin3Cg4JXPlghT1Yymf4ilY6PZ1l0ZgEBUmmuTZg5WKEy
	mXCMzTXoqhKh8qWNwtsFbToTs9gqXEHXtr8k4FAuzR/cInDFbJaDaU4sygZdUsjW1s31Q42KalK
	sseZno1lXfsHqeGqSn0wglggAS3Hzm0h2K+so9rnr0AWIf1qXEiYxa0kDx4hJIAQbUI8H9kbEYt
	qPLU8UZ9nI4m7CU3jM2+F5Hb7LBUT/3V7ceMGULJXT1oCTVdL1PXL+InKfItiGcmIAq02SrIgEf
	khLeiSfQPTfhB8TnBJAlJzXBGlc8sa7zYduLiWBi0vT5sFXIbGwKoEHAEHhvPHV6bgSsBCh53sh
	OEe3vuXaDZjhReqAr/ulgDWdhVSrp1sYDo/vDZcaLVa80oTmQgHa0ik/YdUsnvV/eTzwXFSCUah
	owDOOb2GA9Sg9EweAwJ35HNlE8flvQJ0iMLAf0WuVfb6fEKiaWkzEq3u70a7TmQq95iMKRBKpNF
	Q==
X-Received: by 2002:a05:6402:254d:b0:65a:16fc:d86 with SMTP id 4fb4d7f45d1cf-667b2c1e81cmr627481a12.28.1773779365756;
        Tue, 17 Mar 2026 13:29:25 -0700 (PDT)
Received: from [127.0.1.1] (185-164-141-154.cgnat.inetia.pl. [185.164.141.154])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-667b0eb9c02sm451909a12.19.2026.03.17.13.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 13:29:25 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
Date: Tue, 17 Mar 2026 21:29:11 +0100
Subject: [PATCH v3 12/13] recipes-devtools/python: Convert confusing
 appends to override syntax
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-fix-invalid-appends-v3-12-59452f073f31@gmail.com>
References: <20260317-fix-invalid-appends-v3-0-59452f073f31@gmail.com>
In-Reply-To: <20260317-fix-invalid-appends-v3-0-59452f073f31@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Michal Sieron <michalwsieron@gmail.com>
X-Mailer: b4 0.14.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 20:29:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233347

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


