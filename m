Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 554D1C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 19:17:31 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web08.1975.1645557450451608065
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:17:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=N+zWkgUd;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id
 j10-20020a17090a94ca00b001bc2a9596f6so409765pjw.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Io8PgCmDlTZyyvDqmbFEsfKf0u12OM5JWyMWxv8+SUE=;
        b=N+zWkgUdwmafwS6BCHdLwE0QQRjvTWpqNidTOJS5AFgNkcDw7ALE1VwxIea1euDpc3
         mQDr6RPfDff6K20bVW8k/zWTs+Vja6Gci7PMlVix+yTbimtxnhSfDvF6pQqPUfS4IRyV
         oNLzzSisaOwDuiApadoPccIphabl4bECZmLchiA+qbtdv+v0ACbPxYGqPdIJ0DF77NKa
         j0JDebINuhqg+mRqvy4xm2iw8YqhSjIJjIy6MZr0MEMY+sQxxJnGgDliJh462wDfX6uk
         9uE3chT+c9M9RdX9/j75X2b0qVa2kkb6STxz42IaUU0hLF3+TiUcdE3I7u4FDmi+6K36
         PB6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Io8PgCmDlTZyyvDqmbFEsfKf0u12OM5JWyMWxv8+SUE=;
        b=ETx3MnYW0HFR1wO9pWNsxswmMGVcu47GoM0Rmkne386HMSAsqk8OL22IhMyQtwUHfK
         Ddij8ki1DBWii9pyYc/f10C3CqarlqixXne21L/X/E+iecU8VyMRDChVXWUGl8KHFvge
         5XdBaCD1PhLjp5eNr8LAKAsBtjjKFnrk0F6z66snnl9wJKp2jicHfmu0Vzvps1u3C53+
         11opSHOvb700eU9dYivoui6aca9pPkjAaUdYSsoyI8p0a36eFfwR4FFTV+edagsBfZHp
         q3W9cKet6/pCrsEOuIwuZ79ckYfkvdXPm6M4yn9YjXF2E+aIVDpjBLwWOeg3n518cvGj
         YcdA==
X-Gm-Message-State: AOAM53399m3jmOKvPXAFtJqWRJdrw8OBySfqYAEY0HqcW8ISOVfhVxXD
	HTBUN3GAX9bIZ8yh6R8ThvwJwfo0aQS76A==
X-Google-Smtp-Source: 
 ABdhPJweLjhw0ZmjsveY1eB+R/qUAI0qXEDvfCaBpR3uIKG1UbXQYHREfUR8LE/zpWIkzBwr/Gl3DQ==
X-Received: by 2002:a17:90a:a510:b0:1bc:5887:d957 with SMTP id
 a16-20020a17090aa51000b001bc5887d957mr5648483pjq.38.1645557449367;
        Tue, 22 Feb 2022 11:17:29 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d208:bddf:2b06:2b5a])
        by smtp.gmail.com with ESMTPSA id
 z13sm18402700pfe.20.2022.02.22.11.17.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 11:17:28 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 16/32] python3-setuptools: inherit setuptools_base_meta
Date: Tue, 22 Feb 2022 11:16:42 -0800
Message-Id: 
 <2aadb4286ebfe84c1978dc6c36837b20eedeaa9c.1645557032.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645557032.git.tim.orling@konsulko.com>
References: <cover.1645557032.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 19:17:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162207

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


