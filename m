Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.295.1619279803147138568
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Apr 2021 08:56:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YQ9L93rR;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id e8-20020a17090a7288b029014e51f5a6baso2759557pjg.2
        for <openembedded-core@lists.openembedded.org>; Sat, 24 Apr 2021 08:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=LRYjP0nAUsafZ4p0C0lNgR3gIvgopYtXGKbH3XXcDdg=;
        b=YQ9L93rRl36XBoXtm7NW84vQv+SmDB1y5gI5wZTQ/SCmLtQgDgw5Qt+7WH6RqBVxaE
         h9lCdctcoKCmrlSTsgNNrNA413h3S+juMHnFX2pOw6J5ZcunXjwrTarqJ2ybtMqxNhsc
         OLkSFvGGbBYidt1hostoIfv2CiSXpkiE3NUnwnwSFeljrt3UAL/w1ypDjGzmd6W13VxB
         a1NUyQrpwi4QQrBaSz1fktUucYyfbOiOn7739T3lubK1+hOW1941t6KJRIkuVW8jMB+S
         /LMU77CFx0TVd2/30/jGqal4dOo5YuxsCWwNhaxJyWNxqi7CFZM/tEKPpBwRZrnPEN9H
         koLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LRYjP0nAUsafZ4p0C0lNgR3gIvgopYtXGKbH3XXcDdg=;
        b=c5eQYBRSO4KYsFl/gvl38DEG5zp4vNsz71+3nrPAHJ3YYoPPOsrl31uVVpjv9Bygg+
         1jZMC4+JI5SyTNz1u4bds9CxIsRft18RQUC0DjUCJ9hikyCD993pRmd0G85WxsFoMG3A
         xovHrmxxuUj8bm0DJOLmhkyCUR5TOoVL4w3M+00oKUnBbpkmfrqr3dQ4IdxEaqqdCO9G
         hrZMiCRfSEjYhRDZ1afkiDYEr9hjG0A4f+Q2mKW31NcniBwSkOv9o8/SIhyFGZQQ+OFN
         RWWur+lTpGGVOXoVGk0hX+LiDBgID4ljqeyhyiGP07+wPI7g6T6mlfGLTEQZhBtPPmUS
         152Q==
X-Gm-Message-State: AOAM532B/Ky7nyUJOJKGmheC8LCXRK1ZQ/hQoF5eHeFSD6PyZax4u0k1
	04Ru4a7hrOz9H+QjXp9UH0c41MXj5XhPFg==
X-Google-Smtp-Source: ABdhPJy62DQ9Q7nzMxLZapael7EeHdhMlZNRZ2NWTdweHtcqa2jBFc5TJ5e5XRLxpef1mqyLHdiV3Q==
X-Received: by 2002:a17:90a:ea86:: with SMTP id h6mr11932697pjz.52.1619279802547;
        Sat, 24 Apr 2021 08:56:42 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from hilo.hsdl.ca.comcast.net (c-67-181-203-136.hsd1.ca.comcast.net. [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id a20sm7198299pfi.138.2021.04.24.08.56.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 08:56:42 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/6] libseccomp: move recipe from meta-security to core
Date: Sat, 24 Apr 2021 15:56:34 +0000
Message-Id: <20210424155639.1131482-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210424155639.1131482-1-akuster808@gmail.com>
References: <20210424155639.1131482-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ptest results:
Regression Test Summary
 tests run: 1404
 tests skipped: 369
 tests passed: 1402
 tests failed: 2
 tests errored: 154

Add feature_check so that the other recipes who can take
advantage of this funtionality can enable it.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../libseccomp/files/run-ptest                |  4 ++
 .../libseccomp/libseccomp_2.5.1.bb            | 49 +++++++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-support/libseccomp/files/run-ptest
 create mode 100644 meta/recipes-support/libseccomp/libseccomp_2.5.1.bb

diff --git a/meta/recipes-support/libseccomp/files/run-ptest b/meta/recipes-support/libseccomp/files/run-ptest
new file mode 100644
index 00000000000..54b4a63cd2c
--- /dev/null
+++ b/meta/recipes-support/libseccomp/files/run-ptest
@@ -0,0 +1,4 @@
+#!/bin/sh
+
+cd tests
+./regression -a
diff --git a/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb b/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb
new file mode 100644
index 00000000000..667d5da8242
--- /dev/null
+++ b/meta/recipes-support/libseccomp/libseccomp_2.5.1.bb
@@ -0,0 +1,49 @@
+SUMMARY = "interface to seccomp filtering mechanism"
+DESCRIPTION = "The libseccomp library provides and easy to use, platform independent,interface to the Linux Kernel's syscall filtering mechanism: seccomp."
+SECTION = "security"
+LICENSE = "LGPL-2.1"
+LIC_FILES_CHKSUM = "file://LICENSE;beginline=0;endline=1;md5=8eac08d22113880357ceb8e7c37f989f"
+
+DEPENDS += "gperf-native"
+
+SRCREV = "4bf70431a339a2886ab8c82e9a45378f30c6e6c7"
+
+SRC_URI = "git://github.com/seccomp/libseccomp.git;branch=release-2.5 \
+           file://run-ptest \
+           "
+
+COMPATIBLE_HOST_riscv32 = "null"
+
+S = "${WORKDIR}/git"
+
+inherit autotools-brokensep pkgconfig ptest features_check
+
+REQUIRED_DISTRO_FEATURES = "seccomp"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[python] = "--enable-python, --disable-python, python3"
+
+DISABLE_STATIC = ""
+
+do_compile_ptest() {
+    oe_runmake -C tests check-build
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    install -d ${D}${PTEST_PATH}/tools
+    for file in $(find tests/* -executable -type f); do
+        install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tests
+    done
+    for file in $(find tests/*.tests -type f); do
+        install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tests
+    done
+    for file in $(find tools/* -executable -type f); do
+        install -m 744 ${S}/${file} ${D}/${PTEST_PATH}/tools
+    done
+}
+
+FILES_${PN} = "${bindir} ${libdir}/${BPN}.so*"
+FILES_${PN}-dbg += "${libdir}/${PN}/tests/.debug/* ${libdir}/${PN}/tools/.debug"
+
+RDEPENDS_${PN}-ptest = "coreutils bash"
-- 
2.25.1

