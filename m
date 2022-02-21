Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32E8EC433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 21:24:29 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.4749.1645478668099604157
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VXPCwa12;
 spf=pass (domain: gmail.com, ip: 209.85.210.180,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id p8so9955616pfh.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Io8PgCmDlTZyyvDqmbFEsfKf0u12OM5JWyMWxv8+SUE=;
        b=VXPCwa12oC5aQsMEwB/KZki85L1gnAVzgssDZiasZ/FjlLM2wJsYHBtI4BeqGdYprh
         euldlWJg0As4ZwI0Qv+NcgAQHcFkqsmYKcL93qEQ1FvevH5zAasqyM4Whn1Looqrt4CR
         H6CtvvVW6zwtEn0WW0NqfoVl2nvfb3wWArHVPwKT0gUw7FGdSYfGb/VY/F4uqi+YBLfY
         3npC/gKLGaKEweEt8ZYfw7xehHGUk1X7oVM5gdBZy1s0MJjHC/512w02ulYL7iIwbyAX
         l2xZhjzorQnTH+HYNppsOB4wxjRQfsmTQxss1UOwN5FzlobQtsUcUDOM0BExU3cIEwmP
         e1Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Io8PgCmDlTZyyvDqmbFEsfKf0u12OM5JWyMWxv8+SUE=;
        b=p3AU/7r0adQkCZHt56WKhLXyIWsp6pW6K1CEREXRkIlg0YIL6EP15YjRvI9xzbCmSf
         jEnVSR1+84Wa690DUVoGuAx5WTvUeMVTxAxQDJdYoSti9eF0/xWE5J+/2sMUQSbtdtfB
         HjZKc6GAFbIkXDydJz/gmZ9Ur590NrsEg6Q0lSF3ylmRsouDnF33a5xnobbyCqGiHyvj
         TCUsLge5+aDEZYvYmOdWDv/B4gysDEfsdbsDq3qAFKZOgj6lXAnpA2rVT1O5PLqPwthJ
         Fk6E6r6TqxAIuocL5BT76JiAZ68BkewLKTd1zkuZB+jcPsmI0/8y6o2Zdlj0QS677cNp
         jcow==
X-Gm-Message-State: AOAM531WWofACPUlz/Nyzh9Z6afU5WAdXHiX5ZwMtHqYYpVggcl4Ul5S
	+0qxgqqZbAi6LQZY1x2ycS2QGHqVorO5Eg==
X-Google-Smtp-Source: 
 ABdhPJxVwvH/wcdVnHcH0d2gKRpnElHjo6O96pkF7Hg7po2XolJ//61uOs9xDJiCalY5CtBpBeG5Qw==
X-Received: by 2002:a05:6a00:2181:b0:4f0:e8c5:aec2 with SMTP id
 h1-20020a056a00218100b004f0e8c5aec2mr17407058pfi.40.1645478667160;
        Mon, 21 Feb 2022 13:24:27 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d01c:96b7:6393:8c56])
        by smtp.gmail.com with ESMTPSA id
 n85sm14081529pfd.142.2022.02.21.13.24.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 13:24:26 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 16/32] python3-setuptools: inherit setuptools_base_meta
Date: Mon, 21 Feb 2022 13:23:31 -0800
Message-Id: 
 <0006a170a7d9555574892e752bfbc02e75c6690e.1645478020.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645478020.git.tim.orling@konsulko.com>
References: <cover.1645478020.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 21:24:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162092

Upstream provides a pyproject.toml which declares the
setuptools.build_meta backend for PEP-517 packaging.

We need to bootstrap python3-setuptools-native, simply installing by
unzipping the built wheel. This avoids a dependency loop.

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 .../python/python3-setuptools_59.5.0.bb       | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb b/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
index 33ca928c3e5..2155101d305 100644
--- a/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_59.5.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;beginline=1;endline=19;md5=7a7126e068206290f3fe9f8d6c713ea6"
 
-inherit pypi setuptools3
+inherit pypi setuptools_build_meta
 
 SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-easy_install.patch"
 
@@ -17,6 +17,19 @@ SRC_URI[sha256sum] = "d144f85102f999444d06f9c0e8c737fd0194f10f2f7e5fdb77573f6e2f
 
 DEPENDS += "${PYTHON_PN}"
 
+# Avoid dependency loop; we bootstrap -native
+DEPENDS:remove:class-native = "python3-pip-native python3-setuptools-native"
+DEPENDS:append:class-native = " unzip-native"
+
+PYPA_WHEEL ?= "${B}/dist/${PYPI_PACKAGE}-${PV}-*.whl"
+
+do_install:class-native() {
+    # Bootstrap to prevent dependency loop in python3-pip-native
+    install -d ${D}${PYTHON_SITEPACKAGES_DIR}
+    unzip -d ${D}${PYTHON_SITEPACKAGES_DIR} ${PYPA_WHEEL} || \
+    bbfatal_log "Failed to unzip wheel: ${PYPA_WHEEL}. Check the logs."
+}
+
 RDEPENDS:${PN} = "\
     ${PYTHON_PN}-2to3 \
     ${PYTHON_PN}-compile \
@@ -38,10 +51,6 @@ RDEPENDS:${PN} = "\
     ${PYTHON_PN}-xml \
 "
 
-do_install:prepend() {
-    install -d ${D}${PYTHON_SITEPACKAGES_DIR}
-}
-
 BBCLASSEXTEND = "native nativesdk"
 
 # The pkg-resources module can be used by itself, without the package downloader
-- 
2.30.2


