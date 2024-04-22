Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9327C4345F
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 11:03:31 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.15754.1713783806644953833
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Apr 2024 04:03:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h0hbdw7P;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-572040691c9so1716261a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Apr 2024 04:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713783805; x=1714388605; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dS3KvdVZ3NNYjpI3MAUaAveS704FvOAB5qAuK1TACus=;
        b=h0hbdw7PP5cbA1pt0c69VzvwrU6v7mlseQWLI6ttiDzU9h893BBlIPqWT4Y0abvdpA
         iECtxjzPM20ClpN2xpuvLIZ2hFBtQqevHTiDzVnSOJ2lKpWLj9wNz0mCNy6z5acyI68d
         6aE/ogLxmjorMZGy/naD3vyaWvRImXAeS+cvGdIDqgME0f2zd6OwtT+zg4AdTCKJBIxp
         Q8stKqRj1p92W1twKlI4DTiNDFSlHODJh4ty38dh7mQ23YpRitT9moOtwYJLfOXchy4m
         T03g5tr9EsjLaSvAfmHmeihlDKtBI4IoGOz9Vq2EFJPOtP/BUT1WLxLOHZtFw2du+EjN
         4LvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713783805; x=1714388605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dS3KvdVZ3NNYjpI3MAUaAveS704FvOAB5qAuK1TACus=;
        b=D8OLqb/F/pt5CiOT7H3O4HyVtvI3gNrY8+KmL5vRnb6EfBCC/sBxc4ZGpmCy/PhoX5
         P33IZg0uwtU9czXILRwdt59jIdgyjwB5T9mCTyyJoI0xNirLK+UW4a9GLKKDTNsBFQRz
         bMWeRebxzHZncblp3swlDkDJ9AD9vDsUIYzNyQ7K6bKG2f7lIbVwA3Qvbd6P6RsS9zcm
         U3KtPeh0Phgyv5gRm1u7AwvTi0m/Cy0U0wk28gXreEzd47pVFleLgyMazJ1orerc75QD
         /tCdT4BvKyYuE/emZOmdBBPkEchwImZNm7szEQG7zWeqm6upYz7EtW1c5+4/HQRrTqoA
         FchQ==
X-Gm-Message-State: AOJu0YwXoSehViFdmbhEz1UX33ToCEonqL1LneowsRqr9hD/pdtce7G/
	Ecil3SXQTWYoofFTRXebN4f0NHDiJoRKHPQEmeDUVDZ3YTJucITgf+qHhQ==
X-Google-Smtp-Source: AGHT+IFfG+q4meCAwL6HpsLAdIs0TcwFXDdER/EMaRPC1JO0eO4CMev2omrif/OL4VQCGQkXi0bNNw==
X-Received: by 2002:aa7:df07:0:b0:571:bbad:32b7 with SMTP id c7-20020aa7df07000000b00571bbad32b7mr12221999edy.4.1713783804738;
        Mon, 22 Apr 2024 04:03:24 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id u15-20020aa7d0cf000000b005704b18ed2fsm5416508edo.83.2024.04.22.04.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 04:03:24 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 1/2] swig: merge .inc into .bb
Date: Mon, 22 Apr 2024 13:03:17 +0200
Message-Id: <20240422110318.181856-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Apr 2024 11:03:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198584

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-devtools/swig/swig.inc      | 67 -----------------------
 meta/recipes-devtools/swig/swig_4.2.1.bb | 69 +++++++++++++++++++++++-
 2 files changed, 67 insertions(+), 69 deletions(-)
 delete mode 100644 meta/recipes-devtools/swig/swig.inc

diff --git a/meta/recipes-devtools/swig/swig.inc b/meta/recipes-devtools/swig/swig.inc
deleted file mode 100644
index 7a6c4d7359c..00000000000
--- a/meta/recipes-devtools/swig/swig.inc
+++ /dev/null
@@ -1,67 +0,0 @@
-SUMMARY = "SWIG - Simplified Wrapper and Interface Generator"
-DESCRIPTION = "SWIG is a compiler that makes it easy to integrate C and C++ \
-code with other languages including Perl, Tcl, Ruby, Python, Java, Guile, \
-Mzscheme, Chicken, OCaml, Pike, and C#."
-HOMEPAGE = "http://swig.sourceforge.net/"
-LICENSE = "BSD-3-Clause & GPL-3.0-only"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e7807a6282784a7dde4c846626b08fc6 \
-                    file://LICENSE-GPL;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://LICENSE-UNIVERSITIES;md5=8ce9dcc8f7c994de4a408b205c72ba08"
-
-SECTION = "devel"
-
-DEPENDS = "libpcre2 bison-native"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz"
-UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/swig/files/swig/"
-UPSTREAM_CHECK_REGEX = "swig-(?P<pver>\d+(\.\d+)+)"
-
-inherit autotools python3native pkgconfig
-
-EXTRA_OECONF = " \
-    --with-python3=${PYTHON} \
-    --without-allegrocl \
-    --without-android \
-    --without-boost \
-    --without-chicken \
-    --without-clisp \
-    --without-csharp \
-    --without-d \
-    --without-gcj \
-    --without-go \
-    --without-guile \
-    --without-java \
-    --without-lua \
-    --without-mzscheme \
-    --without-ocaml \
-    --without-octave \
-    --without-perl5 \
-    --without-pike \
-    --without-php \
-    --without-r \
-    --without-ruby \
-    --without-tcl \
-"
-
-EXTRA_AUTORECONF += "-I Tools/config"
-
-BBCLASSEXTEND = "native nativesdk"
-
-# necessary together with bison dependency until a new upstream version after
-# 3.0.12 includes 0001-Fix-generated-code-for-constant-expressions-containi.patch
-do_configure:append() {
-    mkdir -p ${B}/Source/CParse
-}
-
-do_install:append:class-nativesdk() {
-    cd ${D}${bindir}
-    ln -s swig swig2.0
-}
-
-def swiglib_relpath(d):
-    swiglib = d.getVar('datadir') + "/" + d.getVar('BPN') + "/" + d.getVar('PV')
-    return os.path.relpath(swiglib, d.getVar('bindir'))
-
-do_install:append:class-native() {
-    create_wrapper ${D}${bindir}/swig SWIG_LIB='`dirname $''realpath`'/${@swiglib_relpath(d)}
-}
diff --git a/meta/recipes-devtools/swig/swig_4.2.1.bb b/meta/recipes-devtools/swig/swig_4.2.1.bb
index 4b438a72982..7062d4e9aa3 100644
--- a/meta/recipes-devtools/swig/swig_4.2.1.bb
+++ b/meta/recipes-devtools/swig/swig_4.2.1.bb
@@ -1,7 +1,72 @@
-require ${BPN}.inc
+SUMMARY = "SWIG - Simplified Wrapper and Interface Generator"
+DESCRIPTION = "SWIG is a compiler that makes it easy to integrate C and C++ \
+code with other languages including Perl, Tcl, Ruby, Python, Java, Guile, \
+Mzscheme, Chicken, OCaml, Pike, and C#."
+HOMEPAGE = "http://swig.sourceforge.net/"
+LICENSE = "BSD-3-Clause & GPL-3.0-only"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e7807a6282784a7dde4c846626b08fc6 \
+                    file://LICENSE-GPL;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://LICENSE-UNIVERSITIES;md5=8ce9dcc8f7c994de4a408b205c72ba08"
 
-SRC_URI += "file://0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch \
+SECTION = "devel"
+
+DEPENDS = "libpcre2 bison-native"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
+            file://0001-Use-proc-self-exe-for-swig-swiglib-on-non-Win32-plat.patch \
             file://0001-configure-use-pkg-config-for-pcre-detection.patch \
             file://determinism.patch \
            "
 SRC_URI[sha256sum] = "fa045354e2d048b2cddc69579e4256245d4676894858fcf0bab2290ecf59b7d8"
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/swig/files/swig/"
+UPSTREAM_CHECK_REGEX = "swig-(?P<pver>\d+(\.\d+)+)"
+
+inherit autotools python3native pkgconfig
+
+EXTRA_OECONF = " \
+    --with-python3=${PYTHON} \
+    --without-allegrocl \
+    --without-android \
+    --without-boost \
+    --without-chicken \
+    --without-clisp \
+    --without-csharp \
+    --without-d \
+    --without-gcj \
+    --without-go \
+    --without-guile \
+    --without-java \
+    --without-lua \
+    --without-mzscheme \
+    --without-ocaml \
+    --without-octave \
+    --without-perl5 \
+    --without-pike \
+    --without-php \
+    --without-r \
+    --without-ruby \
+    --without-tcl \
+"
+
+EXTRA_AUTORECONF += "-I Tools/config"
+
+BBCLASSEXTEND = "native nativesdk"
+
+# necessary together with bison dependency until a new upstream version after
+# 3.0.12 includes 0001-Fix-generated-code-for-constant-expressions-containi.patch
+do_configure:append() {
+    mkdir -p ${B}/Source/CParse
+}
+
+do_install:append:class-nativesdk() {
+    cd ${D}${bindir}
+    ln -s swig swig2.0
+}
+
+def swiglib_relpath(d):
+    swiglib = d.getVar('datadir') + "/" + d.getVar('BPN') + "/" + d.getVar('PV')
+    return os.path.relpath(swiglib, d.getVar('bindir'))
+
+do_install:append:class-native() {
+    create_wrapper ${D}${bindir}/swig SWIG_LIB='`dirname $''realpath`'/${@swiglib_relpath(d)}
+}
-- 
2.39.2


