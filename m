Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C1DFEE49B9
	for <webhook@archiver.kernel.org>; Fri, 25 Aug 2023 22:27:43 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.2558.1693002460822761874
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Aug 2023 15:27:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=N0JeF4kp;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-4fe21e7f3d1so2164573e87.3
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 15:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693002459; x=1693607259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yi4WNTZvdI78aiIZIn+4I6MOZzcT6449uApeCStXHmA=;
        b=N0JeF4kpBoij+XaFDKQeuF36Z2afn/uEcDD+J5ToMLbCovruPjhaakvLMMPTcdOC9p
         edKBzYy2n4YaxSRxm/RmxDU96iTYvHZZgvcKetqt5YgutI/4ZCMr0F23O+ZA71IO9F0Z
         XggzrVhQQedzxD3nS59kPFYgVlUdaDFTxGRMQ1pChBICiOW5qydjC5mTQ5wADT0jjbPA
         t11JIWyWFpTybsODO7R8t+C4FZp25ASJpp17pOpfkUhBuHOaXKeFBmybMRwC8Jv3Wp5i
         JyyFOf7mOT26U2v9wnqAoaZ2cL/FNMitgKkdFJk8DvreypMnvICi3gba07ZHa96Uqr/3
         mAVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693002459; x=1693607259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yi4WNTZvdI78aiIZIn+4I6MOZzcT6449uApeCStXHmA=;
        b=HtSakxlGFXsm5Yn87xRMCqHrx/7uT9XI5zONPlOYxGF9azrsoG/FhTRF2qIxs2iFKA
         RfvQ433jd7EWWIABpP+fctMh0YnMJev3zwWVt0wZT9XOgmEK0fmYtfvTeUo30IUyAb6W
         Bl5cUeBkQ91qkffGS2+zsyLCbwUQ4ltsMpeWipOqJ5zvAdbZdxLMd3NMDdcEj6WptloO
         RTJ/+VM0Gejt1ghUmWtkwVSWNdV1Ih8F6JMZKoxjt16RK5W4ij35JevVNKBgdzuo7Aio
         LqWFYFGIASnr36o9/ev3KH1S2tUBaqm+JMSF1M/+7N7V/FPahuVJunEMuktOIHvs7W+A
         4g5g==
X-Gm-Message-State: AOJu0YyVeGnuLAORkqrQikq6Mm2GrzuOCMyslor3ejhIREsEg3jBKrTk
	qRw8ie5M2RiyT0lBKafd4xEpldve0uM=
X-Google-Smtp-Source: AGHT+IF4jiQGorD7aP4Jv8pIR1QECi/CuvZthSHgQZTTX6lXHWzv1QHTjHKP3iZiGoVzX8yGe8cALg==
X-Received: by 2002:a19:6d1b:0:b0:4fb:8939:d95c with SMTP id i27-20020a196d1b000000b004fb8939d95cmr12856542lfc.30.1693002458402;
        Fri, 25 Aug 2023 15:27:38 -0700 (PDT)
Received: from t14s-af.fritz.box ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id n24-20020aa7d058000000b0050488d1d376sm1449057edo.0.2023.08.25.15.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 15:27:37 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v3 03/13] cmake.bbclass: cleanup spaces and tabs
Date: Sat, 26 Aug 2023 00:25:43 +0200
Message-ID: <20230825222711.2735745-4-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230825222711.2735745-1-adrian.freihofer@siemens.com>
References: <20230825222711.2735745-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Aug 2023 22:27:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186731

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta/classes-recipe/cmake.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/cmake.bbclass b/meta/classes-recipe/cmake.bbclass
index 7c40df4cdbf..c63b0a80b18 100644
--- a/meta/classes-recipe/cmake.bbclass
+++ b/meta/classes-recipe/cmake.bbclass
@@ -90,12 +90,14 @@ def map_host_arch_to_uname_arch(host_arch):
         return "ppc64"
     return host_arch
 
+
 cmake_do_generate_toolchain_file() {
 	if [ "${BUILD_SYS}" = "${HOST_SYS}" ]; then
 		cmake_crosscompiling="set( CMAKE_CROSSCOMPILING FALSE )"
-       else
-               cmake_sysroot="set( CMAKE_SYSROOT \"${RECIPE_SYSROOT}\" )"
+	else
+		cmake_sysroot="set( CMAKE_SYSROOT \"${RECIPE_SYSROOT}\" )"
 	fi
+
 	cat > ${WORKDIR}/toolchain.cmake <<EOF
 # CMake system name must be something like "Linux".
 # This is important for cross-compiling.
-- 
2.41.0


