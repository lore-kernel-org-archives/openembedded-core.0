Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23596C433EF
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 01:28:33 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web08.5742.1645406912483768605
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Feb 2022 17:28:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QcVS/ccY;
 spf=pass (domain: gmail.com, ip: 209.85.214.171,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id u5so11630205ple.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Feb 2022 17:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=JFBDtiyUBEaYHDGlHhmGIqP+Prn5NIIWPCr2pMfnyXo=;
        b=QcVS/ccYmeD0o17Z4A/mbU2ZIeDk8d/eDppjosQw0asun/PtPF7KD81CZrKYKfB2Xq
         fvbfi/FSoGM/gTts7ar9lsaPIdghsORIYUAW+mPCzdihCnOfMf05vDM5efYuuLa2oJUP
         NXA8xwn0KSGk4M3fv5O/qDE5P6bgJ5UoihWVRLENjhFJV6WEdgdZtpKTpExgY/GdoYMB
         Z8V0t/AkhPzSIte2XgPlZZQx0gXS24IB+jwH6GCT0ZIFP++dxZz5mgac+hVVWOLcVcY9
         GgeJTlFjRut5j3v+OOUpfH2YpPHvU2pgbRKY4NQzbh2Xl6vGCtukaDpY0zYo0gUGNxK2
         k6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JFBDtiyUBEaYHDGlHhmGIqP+Prn5NIIWPCr2pMfnyXo=;
        b=hCIbHzPon7St9lwwdR3MclK1jQWLPZHl/085aOaqf6dTVw6/LziOwITG6E2ofXy8Um
         u+2X3cWBeFCAxAK+kuyrZyRIPSLcRxZQKHrfF1MDuGeiH58c73aaYHQW28DXzW71dxSv
         Icd+9Sp72fszL6RVYZ+X6pWKviLiVpq238Y/n+TMhm2usmpUTEdH1HSOxM3kIc45pH/e
         TKfPEbaFxU42kiT59i1Zn65mNTZ0QWJfJg4XqLBRwFvk3DtQhN+hNmedBJFw90rYel3x
         bpfkUzFjJRcbbpfjH9cMqKE06aoeUQk2skegLnYwULJPTdDnAuSvh8WTkjVmfAj3x5Yk
         7TYA==
X-Gm-Message-State: AOAM530UXQ8n6mfNzqrGr4A951lCbu8fq8fnAXhOrn4mao6qLvrH82rN
	vQ8o8qM5tHctFf/er6Hgbl7ssKCkkTyz0Q==
X-Google-Smtp-Source: 
 ABdhPJyienWy88u3Rar/s+3EEnHyAhsLurWIhXD5lZLbYFVvxBSEm58Yzl0v9X8/c+VoTzd5UcVCUA==
X-Received: by 2002:a17:90a:ce12:b0:1b4:dc9b:635e with SMTP id
 f18-20020a17090ace1200b001b4dc9b635emr19163214pju.129.1645406911520;
        Sun, 20 Feb 2022 17:28:31 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:f2b0:3951:ce8:8dfd])
        by smtp.gmail.com with ESMTPSA id
 e20sm10252937pfn.4.2022.02.20.17.28.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 17:28:31 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 18/19] setuptools3.bbclass: refactor for wheels
Date: Sun, 20 Feb 2022 17:27:47 -0800
Message-Id: 
 <b03ab412f6c5bbb621edec3b50bb681bb475a0ec.1645405471.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645405471.git.tim.orling@konsulko.com>
References: <cover.1645405471.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 01:28:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162010

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


