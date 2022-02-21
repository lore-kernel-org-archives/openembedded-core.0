Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34142C43217
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 21:24:30 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.4750.1645478669778505100
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=obGZsyAt;
 spf=pass (domain: gmail.com, ip: 209.85.210.182,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id y11so9955600pfi.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=JFBDtiyUBEaYHDGlHhmGIqP+Prn5NIIWPCr2pMfnyXo=;
        b=obGZsyAt6cIQ6HHqWO0Sy5fnMhEeJs8S2Sb/KC4CWs96xGI4TzRnMR6YcGn1qaDOTF
         u+KKSf0WuALi7DquCRhQsXfdAaBITnwLwAeDma6bb/L90sOBSy1qDgTBDzDW74365u0Y
         CvUmt5aCStNcBu8AH7meWG+RK3yxNAc+hcJ9ItwdoRMWecwOCTToAb0Jj8IwF6IT+z8l
         91Ow6tjK7IIjg7SHNmbN6VujYt3UfLxTK/xGR4WKxCdF+HnRwz8hz3le6A1SoSHISlWu
         VngUjLRVKwsQRFGXaXVzmT1FvV9/Ire5MCKd7T01RSMh4LP5GOuqr0fZVHMjF0Z1g8AG
         Plgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JFBDtiyUBEaYHDGlHhmGIqP+Prn5NIIWPCr2pMfnyXo=;
        b=DLQcmQpJyooI3moV0Y6Ee9Wq/u/3gwV7EajZQLUXFjLNWwnNMbkFY2+oRVvc3eKCRM
         nAgB01LnJLimu35Rp+/bmaGEJ9MZC7IiFIPT/Z+pCXqfF3PrIVGd3rPYpo07Sn5n1NcE
         hjWckYzZEI/vtCDmakh/N8qS3zdZbvkZIDuy4T1WsBuq7qxjP9dsMrvKtT6Zy8IrmwXa
         ZZ8+jf4xWQ+iqRx/PQ5frwp9M1stt6aGi9rrauWz8gLX/RU2npQtRBRtlU3Ruu/eS39C
         WgNNkxOT/MhcF0FTwWAK9m5gHr6h7YxJcWjxUoRKeXQvp+DteT73fZ2aDKp54sX4Hr7b
         tlxQ==
X-Gm-Message-State: AOAM532FWFDPof0WdRmQTGKxf8E1pn6pUzdloX1LDr7pXmN123TVUVIo
	4rMTeF2wJNKm7XYZjcwMUb5SELMGclLezQ==
X-Google-Smtp-Source: 
 ABdhPJzeeiE+qanItBNXo+8viIHOshZT8/13TkZL5SXzzcgrOLrXq0xCgs4o2pIYCUCiMFTWrIs+hQ==
X-Received: by 2002:a05:6a00:2182:b0:4e1:a254:668 with SMTP id
 h2-20020a056a00218200b004e1a2540668mr21559625pfi.73.1645478668828;
        Mon, 21 Feb 2022 13:24:28 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d01c:96b7:6393:8c56])
        by smtp.gmail.com with ESMTPSA id
 n85sm14081529pfd.142.2022.02.21.13.24.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 13:24:28 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 17/32] setuptools3.bbclass: refactor for wheels
Date: Mon, 21 Feb 2022 13:23:32 -0800
Message-Id: 
 <30311601ac7c33a799f8d13cdce4de90f780a4e9.1645478020.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645478020.git.tim.orling@konsulko.com>
References: <cover.1645478020.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 21:24:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162093

Depend on python3-wheel-native so that we can build with 'setup.py
bdist_wheel'.

Use pip_install_wheel class to install the built wheels with pip, as
intended by upstream Python.

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/classes/setuptools3.bbclass | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/meta/classes/setuptools3.bbclass b/meta/classes/setuptools3.bbclass
index fd8499d26c7..12561340b07 100644
--- a/meta/classes/setuptools3.bbclass
+++ b/meta/classes/setuptools3.bbclass
@@ -1,6 +1,7 @@
-inherit setuptools3-base
+inherit setuptools3-base pip_install_wheel
 
-B = "${WORKDIR}/build"
+# bdist_wheel builds in ./dist
+#B = "${WORKDIR}/build"
 
 SETUPTOOLS_BUILD_ARGS ?= ""
 SETUPTOOLS_INSTALL_ARGS ?= "--root=${D} \
@@ -23,20 +24,15 @@ setuptools3_do_compile() {
         STAGING_INCDIR=${STAGING_INCDIR} \
         STAGING_LIBDIR=${STAGING_LIBDIR} \
         ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py \
-        build --build-base=${B} ${SETUPTOOLS_BUILD_ARGS} || \
-        bbfatal_log "'${PYTHON_PN} setup.py build ${SETUPTOOLS_BUILD_ARGS}' execution failed."
+        bdist_wheel ${SETUPTOOLS_BUILD_ARGS} || \
+        bbfatal_log "'${PYTHON_PN} setup.py bdist_wheel ${SETUPTOOLS_BUILD_ARGS}' execution failed."
 }
 setuptools3_do_compile[vardepsexclude] = "MACHINE"
 
 setuptools3_do_install() {
         cd ${SETUPTOOLS_SETUP_PATH}
-        install -d ${D}${PYTHON_SITEPACKAGES_DIR}
-        STAGING_INCDIR=${STAGING_INCDIR} \
-        STAGING_LIBDIR=${STAGING_LIBDIR} \
-        PYTHONPATH=${D}${PYTHON_SITEPACKAGES_DIR} \
-        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py \
-        build --build-base=${B} install --skip-build ${SETUPTOOLS_INSTALL_ARGS} || \
-        bbfatal_log "'${PYTHON_PN} setup.py install ${SETUPTOOLS_INSTALL_ARGS}' execution failed."
+
+        pip_install_wheel_do_install
 
         # support filenames with *spaces*
         find ${D} -name "*.py" -exec grep -q ${D} {} \; \
@@ -64,5 +60,5 @@ setuptools3_do_install[vardepsexclude] = "MACHINE"
 EXPORT_FUNCTIONS do_configure do_compile do_install
 
 export LDSHARED="${CCLD} -shared"
-DEPENDS += "python3-setuptools-native"
+DEPENDS += "python3-setuptools-native python3-wheel-native"
 
-- 
2.30.2


