Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE157D15D9D
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 05:13:22 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.11603.1729573994793641500
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Oct 2024 22:13:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kEbaGUJJ;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-71f5208217dso9098b3a.2
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Oct 2024 22:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729573994; x=1730178794; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=279A60gXi8HE/CmZKJfRgCmDiNCYoZzgfndMpytuUNM=;
        b=kEbaGUJJkWTeQu9xDf0xkT0RdQEtM0JO0TFJuuHf5OwUxxX9r+145jCY2ObXr27RFN
         q87Fzj6/lQkAnI2vtwrIFnRhvVq5FD713GtgE0XQ/cNy82cead3bol2rzlpZcDgW8+YO
         lhSrNpl/6bOSfSzk6lCOpkhEmrv+RtZifXsrVJ+G4igKxImm2ZRdY+5vwh20Tv7ux5uK
         BX9DQywS0xxrjKpo3+Ki0iiKqVcYKPj0plivmfdOLVTMA5Hoo1nxEcEhxSgNna70Ja0f
         AehmnVfAKialWycdOhZ9vSoF4Cgftnl3L3TMYGJLCNZlvFxLT3yJrr6J3ZGI5+Wm+96f
         2ArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729573994; x=1730178794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=279A60gXi8HE/CmZKJfRgCmDiNCYoZzgfndMpytuUNM=;
        b=u2zvsaVDzGzc+dwLQ6waaMUpY7VNKLpejpBBylzAkqPuMRIZsw1Hlz7XnFAjRIZHQ9
         7/j2WmNnhh85WRi5Zrga7ibLZZzZ59i3p+Fu+EAuAuItz6C26EUjc9hawXwB963by/+j
         8zwtrdqYFhdc27oXDlOwyJ6q9adQpDdrSz8uqbLobJSXypnOh9zPFbCcu7M3p+tvWUd3
         Z9aeV2isk8DzuN8gXVjA9cMtTHmBE5+49N56cRi3axzccM2XW79tJP56P+/0lNP6TsXm
         Bu32Fm3rj9+PUhx6M8sKjugiNKiRVDlm9GsUfjhco8zPSsVHp34F4YvA8NCkgknekkq9
         94PA==
X-Gm-Message-State: AOJu0YwrflpCFCTbbjXuCg79ckKNIIz938Fqj6EJ9k6EM+OlnNSXq6NT
	yxXKdKWa4LbdB2dR+RtWbYn0hRKKsoj8B0oOGtTD3rSPpFnTynbJJw9/zVLz
X-Google-Smtp-Source: AGHT+IFt7UANaK3dBsfzubHJ8wlje26+A2K50ULeTW+JrwcCRfstoQ7lpjcTProKCpzfQb2REMv+cg==
X-Received: by 2002:a05:6a20:b22:b0:1d9:3456:b799 with SMTP id adf61e73a8af0-1d93456bec9mr12158101637.46.1729573993905;
        Mon, 21 Oct 2024 22:13:13 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::2fbb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec1407eafsm3831095b3a.208.2024.10.21.22.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 22:13:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 2/3] python3-packaging: Ignore old glibc tests on musl
Date: Mon, 21 Oct 2024 22:13:09 -0700
Message-ID: <20241022051310.1846604-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241022051310.1846604-1-raj.khem@gmail.com>
References: <20241022051310.1846604-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Oct 2024 05:13:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206136

These tests expect glibc to be the system C library
ignore them for musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Use bitbake variable for ignored tests

 meta/recipes-devtools/python/python3-packaging/run-ptest    | 3 ---
 meta/recipes-devtools/python/python3-packaging/run-ptest.in | 2 ++
 meta/recipes-devtools/python/python3-packaging_24.1.bb      | 6 +++++-
 3 files changed, 7 insertions(+), 4 deletions(-)
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
index 20bcd55fbad..ac8fa4b73f9 100644
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
@@ -23,6 +26,7 @@ do_install_ptest() {
     cp -r ${S}/tests ${D}${PTEST_PATH}/
     # We don't need this script which is used to build the binaries
     rm -f ${D}${PTEST_PATH}/tests/manylinux/build.sh
+    sed -e 's|IGNOREDTESTS|${SKIPLIST}|' ${UNPACKDIR}/run-ptest.in > ${D}${PTEST_PATH}/run-ptest
 }
 
 RDEPENDS:${PN}-ptest = "\

