Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F311C4167B
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 05:06:13 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.web11.7346.1651727155417544331
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PVKLcfac;
 spf=pass (domain: gmail.com, ip: 209.85.208.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id p18so3901289edr.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8kfLiaVkZ+RDBfOL4xxAcGmdG1CqV/V31N9ggfFSGeY=;
        b=PVKLcfacnnNM/U+M3imzShjXW9wuMIgT59r8PVXklrpIr3qy2eHAt8gS5Q/aJFrFMq
         LuPTSuafaHRqWgS0jd9+RsGTwIzAorVh98/15RFEj+rclhTnyI/12YAM12HVt/Kjgp+/
         g732gXupPPRvX4qgfy0sLDDBrMtJeoMnR5mK77BizqvuDaCL8hQ82LRivKIVa/zkZ0DP
         2gc/FFIAMorUvHnzqdDWj6aEaE17J+PSvt7wlXcHf3AedXIf10G3IE9ZMIBKYAp6qym0
         kKpEONJvMnfjoVmprH4iuabMuJJUOjYo5Rg7e8G7Og0S3hi0so7g/bMZ/1TwIOVl1stO
         nyNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8kfLiaVkZ+RDBfOL4xxAcGmdG1CqV/V31N9ggfFSGeY=;
        b=X4Z0PwUNl/uLlZT2DbaY1ImzzrdKPP7w80EmqDtCfFY411fMXrM0wSmpgArIDZRbUB
         W2C5RLGUMPd4qlQ5aSI5f/5vLvP1msC2/OP6RkdaLj7VmzoE8b2LkgffbItvipqy4mHw
         FN+YR6EUMNqmxoYPQFCPKRiWpPmGTeKxPQb9GvfUj/3NczLjGlZaupHBnmEGdfRwBN2Q
         No7fsD76mCwAA8upMBoWvmxrcmur8CFwO2DjDy5OyuphP7ErEy+KRm6RSpHN3XcW3Ah4
         6pBzyXRo2Hxv9fa4aw/ObBagFNiqA9ciKs8jYNf19/eH756Ah5MfWhU51Mmby7E92c2F
         bWPg==
X-Gm-Message-State: AOAM5331bqjSNIVqbZXcK5EBnOu66gCJRPJIEixB1AXQ26fFJ5V3K10a
	x14myG3XFwALnuQjimlI7Kcgsm39CnE=
X-Google-Smtp-Source: 
 ABdhPJyXbPJ0OkX9kynQkabTYmeS0q5kRT8bGdSogiFa7inw0cKqi6Cs3n9LqCkCWq6lIysYouKp+w==
X-Received: by 2002:a05:6402:484:b0:415:d931:cb2f with SMTP id
 k4-20020a056402048400b00415d931cb2fmr27898921edv.287.1651727169920;
        Wed, 04 May 2022 22:06:09 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gg19-20020a170906899300b006f3ef214dfbsm313386ejc.97.2022.05.04.22.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 22:06:09 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 29/61] lttng-tools: upgrade 2.13.4 -> 2.13.7
Date: Thu,  5 May 2022 07:05:12 +0200
Message-Id: <20220505050544.651895-29-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220505050544.651895-1-alex@linutronix.de>
References: <20220505050544.651895-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 05:06:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165258

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{lttng-tools_2.13.4.bb => lttng-tools_2.13.7.bb}  | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-tools_2.13.4.bb => lttng-tools_2.13.7.bb} (90%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.13.4.bb b/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb
similarity index 90%
rename from meta/recipes-kernel/lttng/lttng-tools_2.13.4.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb
index 0ea4da05ce..1a972ec836 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.13.4.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.13.7.bb
@@ -39,7 +39,7 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://disable-tests.patch \
            "
 
-SRC_URI[sha256sum] = "565f3102410a53d484f4c8ff517978f1dc59f67f9d16f872f4357f3ca12200f6"
+SRC_URI[sha256sum] = "d17a02e8f178a7cf3403e3c9edfb90ad3a1628e20aa0b5131408ae47f722f08d"
 
 inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
 
@@ -113,7 +113,7 @@ do_install_ptest () {
         for f in $(find "${B}/tests/$d" -maxdepth 1 -executable -type f -printf '%P ') ; do
             cp ${B}/tests/$d/$f ${D}${PTEST_PATH}/tests/`dirname $d`/$f
             case $f in
-                *.so|userspace-probe-elf-binary)
+                *.so|userspace-probe-elf-*)
                     install -d ${D}${PTEST_PATH}/tests/$d/
                     ln -s  ../$f ${D}${PTEST_PATH}/tests/$d/$f
                     # Remove any rpath/runpath to pass QA check.
@@ -124,6 +124,7 @@ do_install_ptest () {
     done
 
     chrpath --delete ${D}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-binary/userspace-probe-elf-binary
+    chrpath --delete ${D}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-cxx-binary/userspace-probe-elf-cxx-binary
     chrpath --delete ${D}${PTEST_PATH}/tests/regression/ust/ust-dl/libbar.so
     chrpath --delete ${D}${PTEST_PATH}/tests/regression/ust/ust-dl/libfoo.so
 
@@ -185,4 +186,10 @@ do_install_ptest () {
 INHIBIT_PACKAGE_STRIP_FILES = "\
     ${PKGD}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-binary/userspace-probe-elf-binary \
     ${PKGD}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-binary/.libs/userspace-probe-elf-binary \
+    ${PKGD}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-cxx-binary/userspace-probe-elf-cxx-binary \
+    ${PKGD}${PTEST_PATH}/tests/utils/testapp/userspace-probe-elf-cxx-binary/.libs/userspace-probe-elf-cxx-binary \
+    ${PKGD}${PTEST_PATH}/tests/utils/testapp/gen-syscall-events/gen-syscall-events \
+    ${PKGD}${PTEST_PATH}/tests/utils/testapp/gen-syscall-events/.libs/gen-syscall-events \
+    ${PKGD}${PTEST_PATH}/tests/utils/testapp/gen-syscall-events-callstack/gen-syscall-events-callstack \
+    ${PKGD}${PTEST_PATH}/tests/utils/testapp/gen-syscall-events-callstack/.libs/gen-syscall-events-callstack \
     "
-- 
2.30.2


