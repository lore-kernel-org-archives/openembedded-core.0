Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1C13C433FE
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 15:03:14 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web09.11427.1645714993721919085
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 07:03:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Zlby8deZ;
 spf=pass (domain: gmail.com, ip: 209.85.218.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id bg10so4981040ejb.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 07:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jCCY/EWAIioOSl8v+G1Ev2ZC+I4N9dtIoz79nH/2TWg=;
        b=Zlby8deZAUXWO8VWPz6ECfmuruWMbdYeDK5CuhZac9DGmQcrqrcFR8DX9DMnb+Rvbc
         jpj0KVZP9vqLCAXlQDOQqKW2+nEqY/FrG6serYVFEiseSQZIPQbPjCx4gdHCK5uQEqCu
         rk2c9Bi+bx0MbJQDBFcSzZBIujpo3HDyGEeVxhE9LdCHqhwnLEERIb2Eu8/wmv0Bta6Z
         +jcU+jpKFQqUB6DNM+o8p1qzgUwOsuOt/Fgq484lK3QhKYrWUDEs/J8TTwpM1bG/45BK
         WU9zsYr/r5Zx3A4vATbhWBXJma1xm5hd2YOlaZ0oRqRARz++eroUbjvITxj9yuwl4tZn
         Bi5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jCCY/EWAIioOSl8v+G1Ev2ZC+I4N9dtIoz79nH/2TWg=;
        b=DI7E+y/dz4hJjeF/HkjjI7oN2NhGtk1oXcjH0qIcwwfARmdirfmQR4f3by/mrIZV7G
         muoRvtSckv7luzV8mh9kdrxvfSgUqgx4OV6ZtRXpSxUel1S3fU0E/wagUJjk7spmUFsl
         1GaJ+7HP/kIPatK3cuO/gjutlj5o40QdUD/RvUsJDGxmt5ZPFMWrWMhk8JvNYDELVVrL
         xyp81v/mL/YIvD8hhRDoW12Y11P+up1c7LSEeeZyruibRFRQpJC5x6NZd+FpBBz43M1v
         tK9nZ5FfBulqK7+yaJ1Fp2isNDq7WtRerBKSHnmMBf/qBikTE4AmqcpXpiOgXLzILajn
         956g==
X-Gm-Message-State: AOAM531Cq82KzwmDUblIzv/OjomT5AGXM8WFFRgCO3cc8VTGru8kNpWb
	lpaaKkfXZH3hcPiss+09OT1uATmKmp4=
X-Google-Smtp-Source: 
 ABdhPJzXXvT7tErzGjHIvFwClRee00+AE9e1rdaEmm3rIg9os+4gm3DCHMPXUDTYtVMMuOs0bEEwtQ==
X-Received: by 2002:a17:906:a145:b0:6ae:e45d:15b6 with SMTP id
 bu5-20020a170906a14500b006aee45d15b6mr2626328ejb.714.1645714992303;
        Thu, 24 Feb 2022 07:03:12 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 z12sm1573173edb.77.2022.02.24.07.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 07:03:11 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/3] sstate: do not add TARGET_ARCH to pkgarch for cross
 recipes.
Date: Thu, 24 Feb 2022 16:03:01 +0100
Message-Id: <20220224150302.1341776-3-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220224150302.1341776-1-alex@linutronix.de>
References: <20220224150302.1341776-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Feb 2022 15:03:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162317

This is redundant (target arch is already in PN), and breaks
compiling a cross-canadian toolchain, as that needs populating the
sysroot with two different native-hosted toolchains built from
cross recipes. Inserting TARGET_ARCH allows only one or the other.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes/sstate.bbclass | 3 +--
 meta/lib/oe/sstatesig.py    | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 787172b408..dc9a2c085b 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -83,7 +83,6 @@ SSTATE_ARCHS = " \
     ${BUILD_ARCH} \
     ${BUILD_ARCH}_${ORIGNATIVELSBSTRING} \
     ${BUILD_ARCH}_${SDK_ARCH}_${SDK_OS} \
-    ${BUILD_ARCH}_${TARGET_ARCH} \
     ${SDK_ARCH}_${SDK_OS} \
     ${SDK_ARCH}_${PACKAGE_ARCH} \
     allarch \
@@ -138,7 +137,7 @@ python () {
     elif bb.data.inherits_class('crosssdk', d):
         d.setVar('SSTATE_PKGARCH', d.expand("${BUILD_ARCH}_${SDK_ARCH}_${SDK_OS}"))
     elif bb.data.inherits_class('cross', d):
-        d.setVar('SSTATE_PKGARCH', d.expand("${BUILD_ARCH}_${TARGET_ARCH}"))
+        d.setVar('SSTATE_PKGARCH', d.expand("${BUILD_ARCH}"))
     elif bb.data.inherits_class('nativesdk', d):
         d.setVar('SSTATE_PKGARCH', d.expand("${SDK_ARCH}_${SDK_OS}"))
     elif bb.data.inherits_class('cross-canadian', d):
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index abcd96231e..2cf858e201 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -443,7 +443,7 @@ def find_sstate_manifest(taskdata, taskdata2, taskname, d, multilibcache):
     elif "-cross-canadian" in taskdata:
         pkgarchs = ["${SDK_ARCH}_${SDK_ARCH}-${SDKPKGSUFFIX}"]
     elif "-cross-" in taskdata:
-        pkgarchs = ["${BUILD_ARCH}_${TARGET_ARCH}"]
+        pkgarchs = ["${BUILD_ARCH}"]
     elif "-crosssdk" in taskdata:
         pkgarchs = ["${BUILD_ARCH}_${SDK_ARCH}_${SDK_OS}"]
     else:
-- 
2.20.1


