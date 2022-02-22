Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55392C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 19:17:32 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web08.1977.1645557451790352305
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:17:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=d5Gjvqs0;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id
 m1-20020a17090a668100b001bc023c6f34so485305pjj.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Feb 2022 11:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=JFBDtiyUBEaYHDGlHhmGIqP+Prn5NIIWPCr2pMfnyXo=;
        b=d5Gjvqs058hUTNNydmtDFhAtERGEqAwaoH5UqYXr6bwt8wykKqoSAYkHlfqTIst2w2
         EJIq+SzX7LCbAaidCOVT6s8l/VBYIkxPtLdxtwAEC/Yaj2dF9UmLnqgqSaywRTqmLNgu
         D5Lu0/g3Nwm+/yK9xIdPS2TLQNEeQQx6rGkEjlYXwjepdRFEx3vb+qrsyps+uKw3xPbw
         B+K9q23bZWmdRNsoMcHyuZRbHZ8iWpvBxzUqA/7h4BLWFDWN3m1eotEcr4ZNd2cq3tk3
         0qZ9XCghHmW9syS6mcvDiG6xkCbBdrrH0MBj6bcCM00X2zdMzQeCQKV/CHm+wrp7Mv1t
         hPtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JFBDtiyUBEaYHDGlHhmGIqP+Prn5NIIWPCr2pMfnyXo=;
        b=we4z3Y4ody9Lm3akx6m0pEjIp3Oe7af8iLbSEu8YBbhsVNqE22Hnli5SrxqktJKEkW
         OwNFN/8tJBmE9pChhJ7/kmWlZjQKCKCFJIxSJanPWVfceElCm35ig1m7IHz8tXyn8PeA
         +NKMDcw+3MfaKV9rdTzwQ5DWeUsD6Y05CS+evBX3ChZXBNPUhuccd95wrqLqfQhy0B6a
         VU3NLd8sL7hOUzrlcOZ61lnhuB3NohWLoLOo3c7O8dhI0pztqvsCEuKgQrr/qS9crItX
         /uQsbqqvn+nWE29dW9Knor4PaYnu6G5jo+NhPdcTWAWJHSUDKeBEnBMSFvOStVtPxVse
         D9+w==
X-Gm-Message-State: AOAM5309DDtlqPlNrzKfUMs5Re3MF5j13Ab6QztBUfvz13yK2EiNdZY2
	VT6OQ8Y89TXdwNPD4Vc1UHkdByZchPN4Sg==
X-Google-Smtp-Source: 
 ABdhPJzaKOio4f3WBTvjrs6BZ4juFC6iebYJA+Y4AAwkyisF007SK0fVrzbLhXxs5YxRAGslV7c53A==
X-Received: by 2002:a17:902:b116:b0:14f:460d:bf42 with SMTP id
 q22-20020a170902b11600b0014f460dbf42mr24527454plr.108.1645557450904;
        Tue, 22 Feb 2022 11:17:30 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d208:bddf:2b06:2b5a])
        by smtp.gmail.com with ESMTPSA id
 z13sm18402700pfe.20.2022.02.22.11.17.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 11:17:30 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v3 17/32] setuptools3.bbclass: refactor for wheels
Date: Tue, 22 Feb 2022 11:16:43 -0800
Message-Id: 
 <2a1f3ff2f418837246a4f93beeaec394ca49a611.1645557032.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645557032.git.tim.orling@konsulko.com>
References: <cover.1645557032.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Feb 2022 19:17:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162208

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


