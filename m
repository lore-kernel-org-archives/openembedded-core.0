Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DBC5D1CDA7
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 06:27:33 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.12378.1729578446753927276
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Oct 2024 23:27:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QV5sYGJw;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7ea76a12c32so4273766a12.1
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 23:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729578446; x=1730183246; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T6EA9FZZpjFxUw6jDMo5tClZUtC0Ja8iMXvpVxqInIg=;
        b=QV5sYGJwDXvsz91+IhZDoqoYWL5ph75EdeVcRTQSdXmApK5eOKINUzZY11XpzxqgXf
         dL4wE10Ui0Vn64DqLpx801hey6bJiY8WlhVS/B0ul8LKpI6KhuF32tip1MtVhto2bBdt
         DKHdR24x3Pj4ItxzHL1GCEN8LdVHgQC2sQWuu2Pbb8udNN5pz16WRKqQmLhapCJ51LYD
         3jildnVE6emuW302d8w4CbrktYFZAaL7fS5Lbn8mF85KIYVrR3FwNQaSV/gRYDmwdRUa
         gXiKGI0q83dpDVP6CCvscpf0KEKn8aJIYORBhvvlzdhWDoz67MllH1eCUEHR3HpLPF+w
         bS8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729578446; x=1730183246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T6EA9FZZpjFxUw6jDMo5tClZUtC0Ja8iMXvpVxqInIg=;
        b=ZPdwenqHK/EscESHFmTCHOaDqYiKbW6cb4P5cUM5RgLTWwgB3U54Zi+r8+XnIyFMO/
         AfchfUTVmb9TpzqiCXDo+KyrgJMHKrpqofYyM4A2LLkdUUJwQvOoCEfSpuhDXJkqEhtw
         IwFGv+7KDBv2Y8KMX4jeiMm+KJncW0yQr6RkTKwkh4Da4Qm95kWY/xA9hJM5645Lk8ny
         Lue5izZpxyJ8Ox0hURlPq317I6GBZx9ZkDcH4LJ17WP2WtfZGyYYoOmF280tj3WIAv2l
         tmDAy3fG5LlgYuZrZO8dcuGaKERYgNPDzXuJZWVNvyLiYndavHXAqJ2cMaV3yMyr3g4l
         FSWQ==
X-Gm-Message-State: AOJu0YzuM7f/qYncafH7WwWqN/y3ND9ay0C7O7fPuIj9i2mii6WHupwj
	P8XQ3EoLEU5DyWg5UOLPtL+eKziebCIofqKsi89M4X+pzhLI+gDpoFVsKb8p
X-Google-Smtp-Source: AGHT+IHgANgyJFX4449CAwEC5sZF7lt+ZCBnJnx8iaA/d313IkNiPddxKPP+xZtEhRDBOSswkOLZfw==
X-Received: by 2002:a05:6a00:9282:b0:71e:7604:a76 with SMTP id d2e1a72fcca58-71ee413deb6mr1980554b3a.1.1729578445910;
        Mon, 21 Oct 2024 23:27:25 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::2fbb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec13336c6sm3948775b3a.76.2024.10.21.23.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 23:27:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 2/3] python3-packaging: Ignore old glibc tests on musl
Date: Mon, 21 Oct 2024 23:27:20 -0700
Message-ID: <20241022062721.4131585-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241022062721.4131585-1-raj.khem@gmail.com>
References: <20241022062721.4131585-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Oct 2024 06:27:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206139

These tests expect glibc to be the system C library
ignore them for musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Use bitbake variable for ignored tests
v3: apply chmod to make the script executable

 meta/recipes-devtools/python/python3-packaging/run-ptest   | 3 ---
 .../recipes-devtools/python/python3-packaging/run-ptest.in | 2 ++
 meta/recipes-devtools/python/python3-packaging_24.1.bb     | 7 ++++++-
 3 files changed, 8 insertions(+), 4 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-packaging/run-ptest
 create mode 100644 meta/recipes-devtools/python/python3-packaging/run-ptest.in

diff --git a/meta/recipes-devtools/python/python3-packaging/run-ptest b/meta/recipes-devtools/python/python3-packaging/run-ptest
deleted file mode 100644
index 8d2017d39ce..00000000000
--- a/meta/recipes-devtools/python/python3-packaging/run-ptest
+++ /dev/null
@@ -1,3 +0,0 @@
-#!/bin/sh
-
-pytest --automake
diff --git a/meta/recipes-devtools/python/python3-packaging/run-ptest.in b/meta/recipes-devtools/python/python3-packaging/run-ptest.in
new file mode 100644
index 00000000000..508538463bb
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-packaging/run-ptest.in
@@ -0,0 +1,2 @@
+#!/bin/sh
+pytest --automake IGNOREDTESTS
diff --git a/meta/recipes-devtools/python/python3-packaging_24.1.bb b/meta/recipes-devtools/python/python3-packaging_24.1.bb
index 20bcd55fbad..6986880ac51 100644
--- a/meta/recipes-devtools/python/python3-packaging_24.1.bb
+++ b/meta/recipes-devtools/python/python3-packaging_24.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=faadaedca9251a90b205c9167578ce91"
 
 SRC_URI[sha256sum] = "026ed72c8ed3fcce5bf8950572258698927fd1dbda10a5e981cdf0ac37f4f002"
 
-SRC_URI += "file://run-ptest"
+SRC_URI += "file://run-ptest.in"
 
 inherit pypi python_flit_core ptest
 
@@ -15,6 +15,9 @@ BBCLASSEXTEND = "native nativesdk"
 DEPENDS:remove:class-native = "python3-build-native"
 RDEPENDS:${PN} += "python3-profile"
 
+SKIPLIST ?= ""
+SKIPLIST:libc-musl = "--deselect tests/test_manylinux.py::test_is_manylinux_compatible_old --ignore=tests/test_tags.py"
+
 do_compile:class-native () {
     python_flit_core_do_manual_build
 }
@@ -23,6 +26,8 @@ do_install_ptest() {
     cp -r ${S}/tests ${D}${PTEST_PATH}/
     # We don't need this script which is used to build the binaries
     rm -f ${D}${PTEST_PATH}/tests/manylinux/build.sh
+    sed -e 's|IGNOREDTESTS|${SKIPLIST}|' ${UNPACKDIR}/run-ptest.in > ${D}${PTEST_PATH}/run-ptest
+    chmod 0755 ${D}${PTEST_PATH}/run-ptest
 }
 
 RDEPENDS:${PN}-ptest = "\

