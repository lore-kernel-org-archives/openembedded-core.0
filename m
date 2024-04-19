Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA044C10F15
	for <webhook@archiver.kernel.org>; Fri, 19 Apr 2024 12:20:01 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.19150.1713529193227109598
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Apr 2024 05:19:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GPnCMUAb;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d895e2c6efso27846741fa.0
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 05:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713529191; x=1714133991; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gtwEgtchS+DznfJWbs/L6nvFqxaOpeTJysZMF2nqUpQ=;
        b=GPnCMUAbNYcHPmKXkC/eH7iWzmngvVA/EugouZAmGFeCJNfpdUHiOp7/RIrAeFwrm3
         fkfj/c7AxxCkRRka/5Qy2c/o3iDQR7FT9RdItY9CZK5dc7/anxDpVeca3ekpLEKkUhoL
         soJa/0Botzh66l4BM3b4AAe0x+7g/0ZhUOk6j7Ult2Jt6oz8w4XWDO0G9wkZfieY8NSI
         VXrv8oMwPFXXZfAcyg/n3fhJL0C5qiR7ZQtWKgcKZ2wwaIK3JD5aGHANBQ2+3fdCQQ5S
         WnZj3lUru0WjzghFHU+yDpiJO2nXNF+Y0K0kVynV1tmzOUZ2NTKOV+KEEqpMKOM4VAlw
         10rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713529191; x=1714133991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gtwEgtchS+DznfJWbs/L6nvFqxaOpeTJysZMF2nqUpQ=;
        b=ffFjLcLNofMsAAU0PU4g0mZLbfxgeR+tXDr+Svxbi6vebTE7664conlEO8ol0F4QYW
         zkgk9nvuNekXqwX6qUyA2odddwjUMtlyQoTmlDxJXbmZ3iRs2kb0DDClMoIU531+nUWE
         aQEVznAa5jhIY9ztKOrDXKafDrTYG0032gH/sKmzyrSnLymwv546/b/uiHftTbLdZnBQ
         ZP7V4w73Ej45s09K20Px40p9fTeuweHAW+4cjwS9p0SeDuIPKSnzoKJeWYHpoD+XA55P
         1oU3leO7nBGWicpxGfNdH6UiMn9P1FcQ2WM+yblHh53ZabjbNQ7a3p4it9NgLfD4TYaH
         XICA==
X-Gm-Message-State: AOJu0Yw9Lr1vZm+zIb/9doKx5enyLIi2oFbEGp1eIAjhQuUKUouTlEu8
	jKf1trp9Z6v9cfO75Z0EfraBD60Jv+3XgVnqg7BgisWmyr5Wn/uHZANBIw==
X-Google-Smtp-Source: AGHT+IEJzvkoYlBUzIqKtAqDrXKYJmNKkm0JudjoCo+Fc9gzy9tTTdNNox4AMqiXFymreFb/vkTuAQ==
X-Received: by 2002:a2e:9c46:0:b0:2d8:2799:fbcf with SMTP id t6-20020a2e9c46000000b002d82799fbcfmr1146493ljj.34.1713529191119;
        Fri, 19 Apr 2024 05:19:51 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id w22-20020aa7cb56000000b00571c1070edfsm1608415edt.17.2024.04.19.05.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 05:19:50 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 04/19] swig: merge .inc into .bb
Date: Fri, 19 Apr 2024 14:19:30 +0200
Message-Id: <20240419121945.1920944-4-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240419121945.1920944-1-alex@linutronix.de>
References: <20240419121945.1920944-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 12:20:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198532

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


