Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.4385.1614046134642630377
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 18:08:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tuYUQbjU;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id o22so826042pjs.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Feb 2021 18:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wXCZOWk+PqE4K8qdm2Qs+4TVZa7dvpkEwucUAnx97SE=;
        b=tuYUQbjU7YB3ze9DRIKKcfr7GWFT6wWnoKaPY+IGgIrpSZ3Gl+0R3wI6XTV3Ub/LGL
         nIam3ChmOtuqf3DEajzFs4h+UbQkcX+FimLtZ5/KGWX8rPy6Rv19t/oZ1OhC9JkiCIYK
         dfrb18Ewx5uI0xs0kH4l1KRle410SC+zZDvepdwMO8U/WCJI8nsvqtN/Ypq1RUCGBt5R
         4JUzTMqXMsh+mXGVVhv+6OrCC5H50cpMbVt9yPHlSDb+Y+0kg5iZiUsFunAU6oSJthJ3
         dTejVoj/pHbV3R8FMdBwmgYPixHH+8R1EeEJOI3VjqVrPfHWKff/z42GAN2dI9TMXKXW
         C5aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wXCZOWk+PqE4K8qdm2Qs+4TVZa7dvpkEwucUAnx97SE=;
        b=hMyAdalebFpx+VZPRsnm5TWjNpx1TrlXDEnQbxSo/V3C4XbK6nIlnP6rNeojJFHzFm
         BEIkj3CDkP1egg25sCy3y1UemN6bPQi0P+AOTBh4r0vz1UAjc5PWWa+hE970jtQEruJt
         ivGsP77KtiY0IQfHsKvR1mPTc9Bz98Sl84kSd3y9opwHytgbEIlpR9VRjQUWQdH7gUoi
         bWUOlIiyKy4ExR+izYoP5pxUWXeE2RROpOOTJQeCX6LF0ebmgVsSdd2/AijhI68zeuz7
         6NNE4p7PlXeInn1zMRHvK+H8lf+TOvFV7CVW6D5pPVbe7a0ETMKhwt3LhJZUKmKpKtl1
         Rc3g==
X-Gm-Message-State: AOAM532w0UOJ4m9aZPyZUHgNQSfRSAbpl5VstIUjlYs42A+4NXF8cJMt
	6T8n8fu5NqmwzsFC7LjYkrtwo95Rzjow6w==
X-Google-Smtp-Source: ABdhPJxmGi873hSOd1ECtGJGuAoIYd1IJ/l6giKbiVIqoRRJyFipWFWSulQPG8gOqf13g/8IwwCaQA==
X-Received: by 2002:a17:902:ced2:b029:e2:8db8:266f with SMTP id d18-20020a170902ced2b02900e28db8266fmr25214661plg.34.1614046133794;
        Mon, 22 Feb 2021 18:08:53 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0:db81:2f56:60e4:2c64])
        by smtp.gmail.com with ESMTPSA id gd18sm864362pjb.5.2021.02.22.18.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 18:08:53 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] go: Enable CGO and pie buildmode on rv64
Date: Mon, 22 Feb 2021 18:08:51 -0800
Message-Id: <20210223020851.3496147-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

go1.16 has added CGO support for riscv64 arch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/go.bbclass                     | 5 ++---
 meta/recipes-devtools/go/go-runtime_1.16.bb | 1 -
 meta/recipes-devtools/go/go_1.16.bb         | 5 ++---
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index fa147892b0..77ec98dd51 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -54,7 +54,6 @@ GOTOOLDIR_class-native = "${STAGING_LIBDIR_NATIVE}/go/pkg/tool/${BUILD_GOTUPLE}"
 export GOTOOLDIR
 
 export CGO_ENABLED ?= "1"
-export CGO_ENABLED_riscv64 = "0"
 export CGO_CFLAGS ?= "${CFLAGS}"
 export CGO_CPPFLAGS ?= "${CPPFLAGS}"
 export CGO_CXXFLAGS ?= "${CXXFLAGS}"
@@ -147,10 +146,10 @@ FILES_${PN}-staticdev = "${libdir}/go/pkg"
 INSANE_SKIP_${PN} += "ldflags"
 
 # Add -buildmode=pie to GOBUILDFLAGS to satisfy "textrel" QA checking, but mips
-# doesn't support -buildmode=pie, so skip the QA checking for mips and its
+# doesn't support -buildmode=pie, so skip the QA checking for mips/rv32 and its
 # variants.
 python() {
-    if 'mips' in d.getVar('TARGET_ARCH') or 'riscv' in d.getVar('TARGET_ARCH'):
+    if 'mips' in d.getVar('TARGET_ARCH') or 'riscv32' in d.getVar('TARGET_ARCH'):
         d.appendVar('INSANE_SKIP_%s' % d.getVar('PN'), " textrel")
     else:
         d.appendVar('GOBUILDFLAGS', ' -buildmode=pie')
diff --git a/meta/recipes-devtools/go/go-runtime_1.16.bb b/meta/recipes-devtools/go/go-runtime_1.16.bb
index d6ddb31ed4..63464a1501 100644
--- a/meta/recipes-devtools/go/go-runtime_1.16.bb
+++ b/meta/recipes-devtools/go/go-runtime_1.16.bb
@@ -1,4 +1,3 @@
-export CGO_ENABLED_riscv64 = ""
 require go-${PV}.inc
 require go-runtime.inc
 
diff --git a/meta/recipes-devtools/go/go_1.16.bb b/meta/recipes-devtools/go/go_1.16.bb
index d4812c0f0a..4e9e0ebec8 100644
--- a/meta/recipes-devtools/go/go_1.16.bb
+++ b/meta/recipes-devtools/go/go_1.16.bb
@@ -4,15 +4,14 @@ require go-target.inc
 inherit linuxloader
 
 export GOBUILDMODE=""
-export CGO_ENABLED_riscv64 = ""
 export GO_LDSO = "${@get_linuxloader(d)}"
 export CC_FOR_TARGET = "gcc"
 export CXX_FOR_TARGET = "g++"
 
-# mips/rv64 doesn't support -buildmode=pie, so skip the QA checking for mips/riscv and its
+# mips/rv64 doesn't support -buildmode=pie, so skip the QA checking for mips/riscv32 and its
 # variants.
 python() {
-    if 'mips' in d.getVar('TARGET_ARCH',True) or 'riscv' in d.getVar('TARGET_ARCH',True):
+    if 'mips' in d.getVar('TARGET_ARCH',True) or 'riscv32' in d.getVar('TARGET_ARCH',True):
         d.appendVar('INSANE_SKIP_%s' % d.getVar('PN',True), " textrel")
 }
 
-- 
2.30.1

