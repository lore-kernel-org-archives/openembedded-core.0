Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDDC3C433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 19:52:57 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web09.1814.1645818776211134549
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 11:52:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jkGyU6+w;
 spf=pass (domain: gmail.com, ip: 209.85.218.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id hw13so12824577ejc.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 11:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jCCY/EWAIioOSl8v+G1Ev2ZC+I4N9dtIoz79nH/2TWg=;
        b=jkGyU6+wqzJZS/5GOp5OkNcTTjn9ON9lLgID8465nVR57GG9yl6F15QEBfSxKR9EkP
         DdIo29bvTJSuZQknum7ULXdXmDdOV5DH4dDkDBTP63bnRjVuOydze1Tzwt/gMzEN8ppG
         WEeMRj94I7eCmG9/91b7hH68kQkPgMJ0iqDsRKkxOdT2LA6WlZQuj/wdewKIyqVhovDt
         wRZYsZ++JKuwYK1dalViCY0TXY9JlGqKWGtZTRoeBQEW1iBkQ8Dr2smWlkFjTHw5mW1T
         /F8AiT7cblfuwAVOM0XnSNCc5JSLHwVPesWLgYsm7IDiJ6AT5CaHugkQCOsSEFlLsjdA
         PN8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jCCY/EWAIioOSl8v+G1Ev2ZC+I4N9dtIoz79nH/2TWg=;
        b=XHUc68HLQjKnCSRk4uAfi08J51dfpx2nJ601vArAK+zTO57FyakU8GI0jbStWV8uqq
         lcCXI+RJQ8U+QTHyu8/I/cgIqmN8waWj9fULI5xTz0QSnDuUwf3S2DDDZ4TjtRDf+uGT
         3EA0owTQOkBHq7FoCAdluQRUjmETs4n0EbYokfvkCNvmGVPDjJjs+tZy47zO2RIGBw/H
         qw9TRxQVgSs8wLlimfFfq4hp2YlaFG5Wz/qiXonMO2wv3Q3pza6fKfJUwRF0iQyiRYJF
         ecvsHEV+CVfMFqpVUyIlVE/Z9970EvQd63rbVqBePSeKb1Y+DFbV8H9WvoxJDPOBks4k
         pVpg==
X-Gm-Message-State: AOAM532w6p5SR9u1PhHYwIDgtTdKFc6bVRyHvNCoELma72YlZx8IlWwn
	7Ei1Mp1b3dK9zNANDWoma0uFteCwfhY=
X-Google-Smtp-Source: 
 ABdhPJx4wS8yUNb7Jiejv/IbAdDxwaxerKj2TJzdKauBzyyxvSB/LjySFWXBvDjZ4dgmn13EtZ8cpw==
X-Received: by 2002:a17:906:1603:b0:6ce:362:c938 with SMTP id
 m3-20020a170906160300b006ce0362c938mr7422061ejd.253.1645818774640;
        Fri, 25 Feb 2022 11:52:54 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 d25-20020aa7d699000000b004128cfcc228sm1839387edr.5.2022.02.25.11.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 11:52:54 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/2] sstate: do not add TARGET_ARCH to pkgarch for cross
 recipes.
Date: Fri, 25 Feb 2022 20:52:50 +0100
Message-Id: <20220225195251.2433615-1-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 19:52:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162409

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


