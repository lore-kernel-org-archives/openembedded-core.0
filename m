Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0601DC433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 05:31:01 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.3708.1645767059892536806
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 21:31:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QcWRTq1f;
 spf=pass (domain: gmail.com, ip: 209.85.215.170,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id c1so3674776pgk.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 21:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h4UgEPPG1aS3g83E9YdNbiTz3xExppRlZq5EGERndow=;
        b=QcWRTq1fT+MVyAdZoqICQm/ZR/1XOzlb+0cz6mEXybYQkF6EHhj5oej9qMNDY34yvG
         4cPD69SHRCHKj0YVP7w2zofWAkm+g1Dq+KysiCLJs8XXsdZ0LWfhABxsRQCPWQkwwlVh
         8HC4bMWOaRVom5GQGn2/6uXE8nhIp27PCS7MQoEgjIV0+hJPgx5z/KBpuH2GS74aOjym
         INIGXZXW6DynZSV2xHEobGUCyCTCEQHy15yv3+jPBxoCTu8XUqtuy027DTdb+9KvCkM8
         yjjoKasWuVWwAertVrpK0Li6ZyPdg39E8C6dBrrYcQJcMund1kpEO+1cusuXATR7fr5p
         PmRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h4UgEPPG1aS3g83E9YdNbiTz3xExppRlZq5EGERndow=;
        b=oO8yy4VmRfBAj7lNOuvneRKefXEz8d+lJbTR6frurTHjFGjQtkUCkq+Xxe8oFDExG3
         Gyg0rxD9D6PFEJVbIEdRGUCWnAboZQ2m57R85S2mUqOwuSgbLav8tPZ11v1hQkZAE/rJ
         a6FpdPApKbaOFCU4Mp0HsXohKjf6Vf/hWcA1mIHtHTZyMnRoC36gvhmI4MYhkpUwCvTi
         AuePA7Rzf4s28Xhb0A46apv+p0Hl15QRGLBxmm0ncoEfUypVaMMiOF8NNmWDcSDkmtzr
         IH+iuVVf5y4QYm2VdNGXPj6fSEU5z1WI86A2X5ZgU73Nm6qIV0QF7ftB272VsAR7qk0C
         SMTg==
X-Gm-Message-State: AOAM5317HJhmZin81VYHgftd868YqYTqAfxO1RQ22NA+ONzYzJo3kAeV
	VaLqMsdWQGYaxPziImra3aTUP7ATJypHiQ==
X-Google-Smtp-Source: 
 ABdhPJzlftXlefggOZmgRfLAEUEETgrU0t5BKNseLWzdP1h/6yuRHAP1Er5YfeIh2bhbtB3AkiqcJA==
X-Received: by 2002:a63:500e:0:b0:36c:3697:7aab with SMTP id
 e14-20020a63500e000000b0036c36977aabmr4859183pgb.98.1645767058689;
        Thu, 24 Feb 2022 21:30:58 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:263d:523e:139c:a040])
        by smtp.gmail.com with ESMTPSA id
 d5-20020a056a0010c500b004e1b283a072sm1375634pfu.76.2022.02.24.21.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 21:30:58 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 1/2] disutils*.bbclasses: move to meta-python
Date: Thu, 24 Feb 2022 21:30:50 -0800
Message-Id: <20220225053051.1000603-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 05:31:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162338

distutils has been deprecated in Python 3.10 and will be removed in
Python 3.12 (predicted release date October 2023). For now, move these
classes from oe-core to meta-python to allow users to migrate.

[YOCTO #14610]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/classes/distutils-common-base.bbclass | 28 ---------
 meta/classes/distutils3-base.bbclass       |  9 ---
 meta/classes/distutils3.bbclass            | 71 ----------------------
 3 files changed, 108 deletions(-)
 delete mode 100644 meta/classes/distutils-common-base.bbclass
 delete mode 100644 meta/classes/distutils3-base.bbclass
 delete mode 100644 meta/classes/distutils3.bbclass

diff --git a/meta/classes/distutils-common-base.bbclass b/meta/classes/distutils-common-base.bbclass
deleted file mode 100644
index 59c750a3cf7..00000000000
--- a/meta/classes/distutils-common-base.bbclass
+++ /dev/null
@@ -1,28 +0,0 @@
-export STAGING_INCDIR
-export STAGING_LIBDIR
-
-# LDSHARED is the ld *command* used to create shared library
-export LDSHARED  = "${CCLD} -shared"
-# LDXXSHARED is the ld *command* used to create shared library of C++
-# objects
-export LDCXXSHARED  = "${CXX} -shared"
-# CCSHARED are the C *flags* used to create objects to go into a shared
-# library (module)
-export CCSHARED  = "-fPIC -DPIC"
-# LINKFORSHARED are the flags passed to the $(CC) command that links
-# the python executable
-export LINKFORSHARED = "${SECURITY_CFLAGS} -Xlinker -export-dynamic"
-
-FILES:${PN} += "${libdir}/* ${libdir}/${PYTHON_DIR}/*"
-
-FILES:${PN}-staticdev += "\
-  ${PYTHON_SITEPACKAGES_DIR}/*.a \
-"
-FILES:${PN}-dev += "\
-  ${datadir}/pkgconfig \
-  ${libdir}/pkgconfig \
-  ${PYTHON_SITEPACKAGES_DIR}/*.la \
-"
-python __anonymous() {
-    bb.warn("distutils-common-base.bbclass is deprecated, please use setuptools3-base.bbclass instead")
-}
diff --git a/meta/classes/distutils3-base.bbclass b/meta/classes/distutils3-base.bbclass
deleted file mode 100644
index 850c535bb17..00000000000
--- a/meta/classes/distutils3-base.bbclass
+++ /dev/null
@@ -1,9 +0,0 @@
-DEPENDS:append:class-target = " ${PYTHON_PN}-native ${PYTHON_PN}"
-DEPENDS:append:class-nativesdk = " ${PYTHON_PN}-native ${PYTHON_PN}"
-RDEPENDS:${PN} += "${@['', '${PYTHON_PN}-core']['${CLASSOVERRIDE}' == 'class-target']}"
-
-inherit distutils-common-base python3native python3targetconfig
-
-python __anonymous() {
-    bb.warn("distutils3-base.bbclass is deprecated, please use setuptools3-base.bbclass instead")
-
diff --git a/meta/classes/distutils3.bbclass b/meta/classes/distutils3.bbclass
deleted file mode 100644
index a6d8e8763f3..00000000000
--- a/meta/classes/distutils3.bbclass
+++ /dev/null
@@ -1,71 +0,0 @@
-inherit distutils3-base
-
-B = "${WORKDIR}/build"
-distutils_do_configure[cleandirs] = "${B}"
-
-DISTUTILS_BUILD_ARGS ?= ""
-DISTUTILS_INSTALL_ARGS ?= "--root=${D} \
-    --prefix=${prefix} \
-    --install-lib=${PYTHON_SITEPACKAGES_DIR} \
-    --install-data=${datadir}"
-
-DISTUTILS_PYTHON = "python3"
-DISTUTILS_PYTHON:class-native = "nativepython3"
-
-DISTUTILS_SETUP_PATH ?= "${S}"
-
-python __anonymous() {
-    bb.warn("distutils3.bbclass is deprecated, please use setuptools3.bbclass instead")
-}
-
-distutils3_do_configure() {
-    :
-}
-
-distutils3_do_compile() {
-        cd ${DISTUTILS_SETUP_PATH}
-        NO_FETCH_BUILD=1 \
-        STAGING_INCDIR=${STAGING_INCDIR} \
-        STAGING_LIBDIR=${STAGING_LIBDIR} \
-        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py \
-        build --build-base=${B} ${DISTUTILS_BUILD_ARGS} || \
-        bbfatal_log "'${PYTHON_PN} setup.py build ${DISTUTILS_BUILD_ARGS}' execution failed."
-}
-distutils3_do_compile[vardepsexclude] = "MACHINE"
-
-distutils3_do_install() {
-        cd ${DISTUTILS_SETUP_PATH}
-        install -d ${D}${PYTHON_SITEPACKAGES_DIR}
-        STAGING_INCDIR=${STAGING_INCDIR} \
-        STAGING_LIBDIR=${STAGING_LIBDIR} \
-        PYTHONPATH=${D}${PYTHON_SITEPACKAGES_DIR} \
-        ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py \
-        build --build-base=${B} install --skip-build ${DISTUTILS_INSTALL_ARGS} || \
-        bbfatal_log "'${PYTHON_PN} setup.py install ${DISTUTILS_INSTALL_ARGS}' execution failed."
-
-        # support filenames with *spaces*
-        find ${D} -name "*.py" -exec grep -q ${D} {} \; \
-                               -exec sed -i -e s:${D}::g {} \;
-
-        for i in ${D}${bindir}/* ${D}${sbindir}/*; do
-            if [ -f "$i" ]; then
-                sed -i -e s:${PYTHON}:${USRBINPATH}/env\ ${DISTUTILS_PYTHON}:g $i
-                sed -i -e s:${STAGING_BINDIR_NATIVE}:${bindir}:g $i
-            fi
-        done
-
-        rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/easy-install.pth
-
-        #
-        # FIXME: Bandaid against wrong datadir computation
-        #
-        if [ -e ${D}${datadir}/share ]; then
-            mv -f ${D}${datadir}/share/* ${D}${datadir}/
-            rmdir ${D}${datadir}/share
-        fi
-}
-distutils3_do_install[vardepsexclude] = "MACHINE"
-
-EXPORT_FUNCTIONS do_configure do_compile do_install
-
-export LDSHARED="${CCLD} -shared"
-- 
2.30.2


