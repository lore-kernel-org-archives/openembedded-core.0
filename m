Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19BA0C0015E
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 13:27:10 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.12166.1688736423004064015
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jul 2023 06:27:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=DxO3K/1l;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-992b2249d82so238614666b.1
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Jul 2023 06:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688736421; x=1691328421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QaGyTTGaKExfFg8Od3a8GzFOv+78r8tloL9B87gmpnc=;
        b=DxO3K/1lG0DBESmEGS13FX2ZQdkSroN/n0ZG5Mk1rc95dmqf017lhco6klkEATkjbp
         1MY4h2eMp9ZGdwwuQtfSIGo8MfwcPG1r9ko+P4xzpqO91ujnoP1sf+OsPWWj7pvouZmb
         bwhMTDb/fRrd+L8sQQOSWh+sLil83i+O0C+SM7ycF9LtPJFMkQWDnkFf0Jwra1dQhGYe
         JHm82G/ZAUmyUxhzqggNLdklA4Na6w2LQHC3Aab9YY4kGxMytWCQTjU59vwV5JwhdcRc
         Rl0yCQtg8Au2TxgbLBAjTKH4WDm9aduBrQMfzWRO5JKh+UbRqQUk9+cfAudKcBh9952M
         KIbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688736421; x=1691328421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QaGyTTGaKExfFg8Od3a8GzFOv+78r8tloL9B87gmpnc=;
        b=gDpOG9J9sWAuaKPCT15Cr0Wz2/PLCkfqVlzZDt247LYh55PRPihIV3bqCEzgqcCZIi
         pV7uu3QFPlnx/VlnM2TzYyw1k7nG6DT+X9QC6CYL4X6iYg/sabJX7Lo37ejCGxp0D98j
         YQ2S/t1vnR5yBlYmZoAxAHOsI68RidFhim4npWpxrHWbYFAJJjv/KeAIqMljpToEvQm/
         zeT61SBeF83JCRcWN9BiWYjXnSyQRtPRjvlURL3zEjIz9fqxeD5q2r0LMmVjwsuyubl3
         fnqyXhdXajw1myRVwotQHgGtTSE3TpqTQZ1GR4FPLAyeaMNjbkExhZnWcLJ6rt/D0oWr
         PjxQ==
X-Gm-Message-State: ABy/qLZDKPp9DUPPDK9+kgvjx1yUr0eWKSxomMv05mLKl6t4ZpfuMWZU
	m8P31/2bL9JOGpkbehmQw4esLk6LVqU=
X-Google-Smtp-Source: APBJJlFZGIENOEDsEd9P4XLtH6jUaLJkwNq/yBoJuoHPsxKYKthwFs8fAzeuzCp58ua99fxTNJb6ag==
X-Received: by 2002:a17:906:51d4:b0:974:1e0e:91ee with SMTP id v20-20020a17090651d400b009741e0e91eemr4594327ejk.13.1688736421150;
        Fri, 07 Jul 2023 06:27:01 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id j16-20020a170906831000b00985ed2f1584sm2175848ejx.187.2023.07.07.06.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 06:27:00 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] python3: rework ptest handling
Date: Fri,  7 Jul 2023 15:26:49 +0200
Message-Id: <20230707132649.3841870-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jul 2023 13:27:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184011

There are several issues handled here:

- a number of tests were failing due to missing dependencies, which
are added (thanks Trevor Gamblin for identifying the fixes)

- worse, these failures were not reported due to a combination
of regressed sed processing that relies on brittle, unstable verbose
output of python's test module, and shell pipeline obscuring a non-zero
exit code from python itself. This is changed to a direct handling
of python's exit code into a single PASS or FAIL, and changing full verbosity (-v)
into verbose output only for items that did fail (-W).

- bonus improvement: python can run its tests in parallel, so take advantage
of that, and indeed that makes a complete ptest run four times faster (just over
five minutes). There's also extra memory required for that.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-core/images/core-image-ptest.bb   | 1 +
 meta/recipes-devtools/python/python3/run-ptest | 2 +-
 meta/recipes-devtools/python/python3_3.11.4.bb | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recipes-core/images/core-image-ptest.bb
index 90c26641ba3..563fdb4731f 100644
--- a/meta/recipes-core/images/core-image-ptest.bb
+++ b/meta/recipes-core/images/core-image-ptest.bb
@@ -25,6 +25,7 @@ IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-lttng-tools = "1524288"
 # ptests need more memory than standard to avoid the OOM killer
 QB_MEM = "-m 1024"
 QB_MEM:virtclass-mcextend-lttng-tools = "-m 4096"
+QB_MEM:virtclass-mcextend-python3 = "-m 2048"
 QB_MEM:virtclass-mcextend-python3-cryptography = "-m 4096"
 
 TEST_SUITES = "ping ssh parselogs ptest"
diff --git a/meta/recipes-devtools/python/python3/run-ptest b/meta/recipes-devtools/python/python3/run-ptest
index 05396e91abb..4271a7c94ea 100644
--- a/meta/recipes-devtools/python/python3/run-ptest
+++ b/meta/recipes-devtools/python/python3/run-ptest
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-SETUPTOOLS_USE_DISTUTILS=nonlocal python3 -m test -v | sed -u -e '/\.\.\. ok/ s/^/PASS: /g' -r -e '/\.\.\. (ERROR|FAIL)/ s/^/FAIL: /g' -e '/\.\.\. skipped/ s/^/SKIP: /g' -e 's/ \.\.\. ok//g' -e 's/ \.\.\. ERROR//g' -e 's/ \.\.\. FAIL//g' -e 's/ \.\.\. skipped//g'
+SETUPTOOLS_USE_DISTUTILS=nonlocal python3 -m test -W -j 4 && echo "PASS: python3" || echo "FAIL: python3"
diff --git a/meta/recipes-devtools/python/python3_3.11.4.bb b/meta/recipes-devtools/python/python3_3.11.4.bb
index 6b074c48cf2..bc03986e175 100644
--- a/meta/recipes-devtools/python/python3_3.11.4.bb
+++ b/meta/recipes-devtools/python/python3_3.11.4.bb
@@ -426,7 +426,7 @@ FILES:${PN}-man = "${datadir}/man"
 # See https://bugs.python.org/issue18748 and https://bugs.python.org/issue37395
 RDEPENDS:libpython3:append:libc-glibc = " libgcc"
 RDEPENDS:${PN}-ctypes:append:libc-glibc = " ${MLPREFIX}ldconfig"
-RDEPENDS:${PN}-ptest = "${PN}-modules ${PN}-tests ${PN}-dev unzip bzip2 libgcc tzdata coreutils sed"
+RDEPENDS:${PN}-ptest = "${PN}-modules ${PN}-tests ${PN}-dev ${PN}-cgitb ${PN}-zipapp unzip bzip2 libgcc tzdata coreutils sed gcc g++ binutils"
 RDEPENDS:${PN}-ptest:append:libc-glibc = " locale-base-fr-fr locale-base-en-us locale-base-tr-tr locale-base-de-de"
 RDEPENDS:${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', '${MLPREFIX}tk ${MLPREFIX}tk-lib', '', d)}"
 RDEPENDS:${PN}-idle += "${@bb.utils.contains('PACKAGECONFIG', 'tk', '${PN}-tkinter ${MLPREFIX}tcl', '', d)}"
-- 
2.30.2


