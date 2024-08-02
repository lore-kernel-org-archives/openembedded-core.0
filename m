Return-Path: <corentin.levy@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D434C52D6F
	for <webhook@archiver.kernel.org>; Fri,  2 Aug 2024 15:10:44 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.95167.1722611439846638950
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Aug 2024 08:10:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=34fuyxtY;
 spf=pass (domain: smile.fr, ip: 209.85.221.46, mailfrom: corentin.levy@smile.fr)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3685a5e7d3cso4818780f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Aug 2024 08:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1722611438; x=1723216238; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2iHSIQKzvF3Bdrl4aO2m5B10nS3mhOcEeHOOY+no6b4=;
        b=34fuyxtY0XH9kS+XUS17drjKCdM4S+kFUoOXz/MrGAjlXzjDSCp/a5nkJl/y/WaCLA
         IEW/uNg3YvGDzhoVWh7kcVqqFLviethBeMHo6o0HnXtAOCzCuYKt62voIqeLKSwisRB9
         qHuzHnYrmJF/8GMa2basNWBWWJWIlAki3fHI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722611438; x=1723216238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2iHSIQKzvF3Bdrl4aO2m5B10nS3mhOcEeHOOY+no6b4=;
        b=uhN0vqTF/ZzxTZIqfxjA+6ssGxNPoOgZUaUO2vVcNzAeGIxZ5J4andW5viNxgFmYgT
         AvixOTv0kcFNNzY2SNjuKl86Q1pdF91IvkV/S5WmLubUTm9T7ayRBpAf+U0a4hm5RO/6
         wQIInoVWoM/bu4Z2R6O9sYzUCtgOYTkTpOznsCNkQ6VXN9JNZLh5p7M0FRgSJ0HQ1fL7
         ogHTzuL4VLwlZ+4e985DZ1Xt60UcbLB/RExj0jpL1sFCQ//oagSGqK1adM9J3sUXQCy7
         B3gwW9bhpknqaigOMRzmh4lf1NGaL9C0tk8txKCBtnb+YTeGruzLYD7EqIeyChV92Fs4
         fXnw==
X-Gm-Message-State: AOJu0Yzq5kbUsh3/1OGMsaeACLYN64KpBydxF4DxXRdMXFapB+NrJ9wu
	R1wWCXYIlhJiNr+HxMJKzgwFES9n4gzsjuwP3qyuO4d/hBws4ALllz469WWzBRYGGnrNFybnxza
	2
X-Google-Smtp-Source: AGHT+IG+ocK8E0hw7w4LE90oFrOxkoTxCLSbkFVYL5jXtAJxEiU5QAE4F+4fEvM2s34P1vigwQTWlA==
X-Received: by 2002:adf:e412:0:b0:366:e9f3:c242 with SMTP id ffacd0b85a97d-36bbc0f81afmr2693456f8f.12.1722611437420;
        Fri, 02 Aug 2024 08:10:37 -0700 (PDT)
Received: from PT-ASN-SOULO.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbd013f09sm2193521f8f.27.2024.08.02.08.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 08:10:37 -0700 (PDT)
From: corentin.levy@smile.fr
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Corentin=20L=C3=A9vy?= <corentin.levy@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH] python3-libarchive-c: add ptest
Date: Fri,  2 Aug 2024 17:10:21 +0200
Message-Id: <20240802151021.2495138-1-corentin.levy@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Aug 2024 15:10:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202919

From: Corentin Lévy <corentin.levy@smile.fr>

test added to the fast-list
result of ptest-runner:
Testsuite summary
TOTAL: 36
PASS: 36
SKIP: 0
XFAIL: 0
FAIL: 0
XPASS: 0
ERROR: 0
DURATION: 11
END: /usr/lib/python3-libarchive-c/ptest
2024-08-01T11:44
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Corentin Lévy <corentin.levy@smile.fr>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../distro/include/ptest-packagelists.inc     |  1 +
 .../python/python3-libarchive-c/run-ptest     |  6 ++++++
 .../python/python3-libarchive-c_5.1.bb        | 20 ++++++++++++++++++-
 3 files changed, 26 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-libarchive-c/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index e3ab7e8629..7b8418654a 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -63,6 +63,7 @@ PTESTS_FAST = "\
     python3-idna \
     python3-jinja2 \
     python3-jsonpointer \
+    python3-libarchive-c \
     python3-license-expression \
     python3-mako \
     python3-markupsafe \
diff --git a/meta/recipes-devtools/python/python3-libarchive-c/run-ptest b/meta/recipes-devtools/python/python3-libarchive-c/run-ptest
new file mode 100644
index 0000000000..ddfbba7f94
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-libarchive-c/run-ptest
@@ -0,0 +1,6 @@
+#!/bin/sh
+
+# export needed to set the locale to support accentuated and non-latin chars in tests
+export LC_ALL=en_US.UTF-8
+
+pytest --automake
diff --git a/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb b/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb
index 4e318e52f4..c8aff3defe 100644
--- a/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb
+++ b/meta/recipes-devtools/python/python3-libarchive-c_5.1.bb
@@ -5,9 +5,13 @@ HOMEPAGE = "https://github.com/Changaco/python-libarchive-c"
 LICENSE = "CC0-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=bcab380227a83bc147350b40a81e6ffc"
 
+SRC_URI += " \
+        file://run-ptest \
+"
+
 PYPI_PACKAGE = "libarchive-c"
 
-inherit pypi setuptools3
+inherit pypi setuptools3 ptest
 
 SRC_URI[sha256sum] = "7bcce24ea6c0fa3bc62468476c6d2f6264156db2f04878a372027c10615a2721"
 
@@ -18,4 +22,18 @@ RDEPENDS:${PN} += "\
   python3-logging \
 "
 
+RDEPENDS:${PN}-ptest += " \
+        locale-base-en-us \
+        python3-pytest \
+        python3-unittest-automake-output \
+"
+
 BBCLASSEXTEND = "native"
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    install -d ${D}${PTEST_PATH}/libarchive
+    cp -r ${S}/tests/* ${D}${PTEST_PATH}/tests/
+    cp ${S}/libarchive/* ${D}${PTEST_PATH}/libarchive/
+    cp ${S}/README.rst ${D}${PTEST_PATH}/README.rst
+}

