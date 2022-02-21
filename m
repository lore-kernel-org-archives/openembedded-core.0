Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23EC3C433F5
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 01:28:31 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.5699.1645406910592603036
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Feb 2022 17:28:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aTyoeAEU;
 spf=pass (domain: gmail.com, ip: 209.85.215.171,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 139so12956233pge.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Feb 2022 17:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Io8PgCmDlTZyyvDqmbFEsfKf0u12OM5JWyMWxv8+SUE=;
        b=aTyoeAEUZB7Zs9W05ZaQwzhMNTWL6tezaqWi7byIRnYwVIJWaqq+XbbEjjGSqL+a9y
         rA37kJ3jY/h+6Ggq2euWmmp1Smei3F7QPng28itWXI3UwAHkbqqlV93QEjRpYUooQ/hr
         buZm4JX/yAEX35jM2DU45v3oAame+9bRJmAgGthmQGvXJCnMNRW8q/BYkS1dKwdVq1+w
         a5FNag0dpBoCvrAL1Kwh0eDW/hq0i0se0L8nZLxC0VcB8Uur8qDxEVraBLsCeYQCfOyi
         MjyAuIea0xPMsaQCqu24Ab38Hetwnlu7/fLGWFabtdZ+/4Eh7X8SATl6fpwKPueUKsAH
         x1Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Io8PgCmDlTZyyvDqmbFEsfKf0u12OM5JWyMWxv8+SUE=;
        b=7TyZfGIj91KWpT/aCyOexFwsOEvSBjmac428/acoMj95k8lzb7nr+A2pUOdFfJMA/z
         TZ32YyAuK/SHnVp89GLCha9Sw0wpZC9Oa83bP+mQSyHVu0meW7TUEruwcnikZGgDFaij
         8URvYx/Le/7jlPFDZ+zLL5II9CghVZVHKQb3GuUuwt6kon4GgWDelwsDpwi0tnGDAqcP
         LTQnxTy0n0spMzE4TPvDIqzs2GuNo0VMc+RzABMyHM4ykXn51hmw35NwBPh4sd6IxDwj
         qxY5Bqi07/b5jx4HjqlcQjLK5XBS5mtLrOlFDKZIJhdJsnKnU1I1U8EdjZqWo5y9TbjC
         8e1g==
X-Gm-Message-State: AOAM531oyNx6QQBcCDSiooWTHPyVBrn9QuX7/kRKGsHFplPx8gCAjH8M
	JVtTC4hmEX6C9BO7i4hSZb9o+byDLYp1Ow==
X-Google-Smtp-Source: 
 ABdhPJxezC5J5HfXWShxTFz4s3FtvZP77dY8i3SJBmLg6EMzwQerTLRmiOOMi9aGfjd+ytyKHg1ebQ==
X-Received: by 2002:a63:2356:0:b0:372:c64f:ab1a with SMTP id
 u22-20020a632356000000b00372c64fab1amr14018763pgm.230.1645406909682;
        Sun, 20 Feb 2022 17:28:29 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:f2b0:3951:ce8:8dfd])
        by smtp.gmail.com with ESMTPSA id
 e20sm10252937pfn.4.2022.02.20.17.28.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 17:28:29 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 17/19] python3-setuptools: inherit setuptools_base_meta
Date: Sun, 20 Feb 2022 17:27:46 -0800
Message-Id: 
 <a8b10ab67e9d2c3f3bd2b085d9f2541ede92c5c1.1645405471.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645405471.git.tim.orling@konsulko.com>
References: <cover.1645405471.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 01:28:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162009

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


