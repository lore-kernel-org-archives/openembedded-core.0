Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59323C433F5
	for <webhook@archiver.kernel.org>; Sat, 26 Feb 2022 15:02:23 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web09.6296.1645887742065812280
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Feb 2022 07:02:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UvmuCNkM;
 spf=pass (domain: gmail.com, ip: 209.85.208.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id i11so11261412eda.9
        for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Feb 2022 07:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jCCY/EWAIioOSl8v+G1Ev2ZC+I4N9dtIoz79nH/2TWg=;
        b=UvmuCNkMLCq0WUONRSN5oBjOKrTVDzABpp8pCLgdzChe1i9gJ1p7uvtLz5JKXXdZCV
         zHtp3E1sTCauSsVgbMrbf/Nludw9UjHiRs8ivP8CiKN8mM1iSQbh/4w9QaqujR1rZoH5
         UkVoFWQ9ZwNaNU9uHwchRGIR5E4eqAgjz50y8NF1+x7Niu6d3lCykzXSc3gAtaUlYF56
         NGUk8nYD0mz+gmQi86Nob8KAzWlq0Nen+14LtMvun06H84T/Jgxe0wUX99AEnqCFlPl7
         2dg04pK+rs2Cnft4nJIDxk9FBIqRwJXq5bDtJ6OVS6lcSPfKjNd0cK+efS4Sq4R8Kq2L
         3zTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jCCY/EWAIioOSl8v+G1Ev2ZC+I4N9dtIoz79nH/2TWg=;
        b=CgfX/kKrNkPJ0rN1OHbbrn9/yKiV41vidD87rzuDyAAXMl80ptWDAMovwgksj4UnyF
         Sm5tTS/C+sHsG+7UeeraoMFnMRxSDPjQPqL33ETKWK6bfzP2rcXGFelB4rzUDqB+GBEC
         PZBQncgG6GeohlM0YpO6q7OwPj0qP19ouU8QL4RAVQ/CQoQzE3+KeUIPSwz06ZejReM1
         HylvhkD2WAvtM7hvCBllJJbbqOkwTyeNx9U3SAep3lL2cq4ajhCAIdiQSOAlDntTLQsf
         NG4ia6hGtcOb/xzjVilQYLF9idmk7on7UFnJsYh/LtMPWXXd02I43zE4D0i/wUPgCVvx
         7anQ==
X-Gm-Message-State: AOAM532pVL9TQ6awp/HchJoKIli/eORWpclNrwjJFkbFkD0tqPiZ/mIP
	dsbT+n5XtC2QhMqqLFzkq9Tu02RWb6A=
X-Google-Smtp-Source: 
 ABdhPJzkb5vhU9SAZzF88TXp2plpD0ZM7wjPbwm+/m5lY+Ifc2aoIjpjTtfgD8d41vBUIZbwGL0OvA==
X-Received: by 2002:a50:d711:0:b0:410:a51a:77c5 with SMTP id
 t17-20020a50d711000000b00410a51a77c5mr12110364edi.154.1645887740326;
        Sat, 26 Feb 2022 07:02:20 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 hc43-20020a17090716ab00b006c7622abe73sm2306847ejc.216.2022.02.26.07.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Feb 2022 07:02:19 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/2] sstate: do not add TARGET_ARCH to pkgarch for cross
 recipes.
Date: Sat, 26 Feb 2022 16:02:16 +0100
Message-Id: <20220226150217.2793953-1-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Feb 2022 15:02:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162425

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


