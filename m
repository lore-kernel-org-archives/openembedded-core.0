Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACD67C77B7C
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 23:28:20 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web10.15257.1683242898675074744
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 May 2023 16:28:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=m+5c6rwW;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-51452556acdso689589a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 16:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683242898; x=1685834898;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qIfPB519cB6OGTfdt1kDyjaLTbBqFIBBi6Pt1MC5wZY=;
        b=m+5c6rwWYwzZkKNtosEITFPzrd+L+y1motmvW7yK4c9oS5WTAPCkCBpm9hTrht/aFC
         PbdgqBjDro3pie5zhT8Wumdxrn+C2pKpuSQeg9oRo3g+EPepEMHbsKkWuSShc95OxAIv
         hprJzDGgJYLVmh8vlfKlYAo00+hM5/1kvygGEnqi7Z9hWOsbicawhnhRmzR05q6P1lHN
         05GTQLjpMg3Yw5vectg7T/r5Chj6vjabHgn5PKxgOAPQM0X5RyDn99HSqmKuKEAxhMzE
         XfmMRCjVtbUtd59ec+E2Smu3uQW4XJOCNs+M+sSDwhrFBE0wZvqY5j8HZI+qvCdv+dDd
         5gXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683242898; x=1685834898;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qIfPB519cB6OGTfdt1kDyjaLTbBqFIBBi6Pt1MC5wZY=;
        b=D+MZkFPuw9BR3R7LeqM2Ht7dOXnACxBLLojpCsgkFAFkSJu4QFy88LXBchjVrt7DsJ
         xUJnQMWNnwrUy7yKevNCr2SP4/6Qblh7r7tn9D0R6M/VH08unyFviNCjRBrj0Y8RIKIZ
         AeABDVXMMQPylRJNYtRphsVaLhmnEHl5x1kxD4hMH84Z5V+MI2YHcB205WJo68wySgtF
         ln5NKXMG2VuvH9Z3oVDvdbbXkSOLEqsJ39sgc6h5xioHmzKLJ57Qb9crTY2vNbzza5Ew
         Gg/R860kPgrMK6qF8y1BRZkcFm9MXTPY9qrUv8vCcOsBqqtIpBirORtlvhlXn8izjbK5
         p8/g==
X-Gm-Message-State: AC+VfDyamfaeyV8QCMCkIkSEm4m9t0rXf2x/5R3X3n91gIkNqxMAQSdw
	3HrxCdJf6lkhufzBviJ0K8d62f0E9GLmBA==
X-Google-Smtp-Source: ACHHUZ429eaT/i1jTUWA7VrYHRNEIvi/CCQA0Z0wmcZzbAVBmnfOfzrCI+nQTxvnBpTOomCoWRbH9g==
X-Received: by 2002:a17:902:a716:b0:1a9:20d6:3c3f with SMTP id w22-20020a170902a71600b001a920d63c3fmr4456184plq.55.1683242897749;
        Thu, 04 May 2023 16:28:17 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::ade2])
        by smtp.gmail.com with ESMTPSA id bg12-20020a1709028e8c00b0019ef86c2574sm79373plb.270.2023.05.04.16.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 16:28:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] cpio: Run ptests under ptest user
Date: Thu,  4 May 2023 16:28:15 -0700
Message-Id: <20230504232815.3630026-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 23:28:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180888

Running these tests under root user on musl works ok but it emits
additional diagnostic

cpio: dir: Cannot change ownership to uid 0, gid 0: Not supported

Ideally its better to run this test suite under non-root user which
is often how these are run. Moreover, tests work on musl as well.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2:
- @PTEST_PATH@ should be substituted in test.sh now instead of run-ptest
  script

 meta/recipes-extended/cpio/cpio-2.13/run-ptest |  9 +--------
 .../cpio/cpio-2.13/{run-ptest => test.sh}      |  0
 meta/recipes-extended/cpio/cpio_2.13.bb        | 18 +++++++++++++++++-
 3 files changed, 18 insertions(+), 9 deletions(-)
 mode change 100644 => 100755 meta/recipes-extended/cpio/cpio-2.13/run-ptest
 copy meta/recipes-extended/cpio/cpio-2.13/{run-ptest => test.sh} (100%)

diff --git a/meta/recipes-extended/cpio/cpio-2.13/run-ptest b/meta/recipes-extended/cpio/cpio-2.13/run-ptest
old mode 100644
new mode 100755
index f027574e86..f35a756d6b
--- a/meta/recipes-extended/cpio/cpio-2.13/run-ptest
+++ b/meta/recipes-extended/cpio/cpio-2.13/run-ptest
@@ -1,10 +1,3 @@
 #!/bin/sh
 
-# Define cpio test work dir
-WORKDIR=@PTEST_PATH@/tests/
-
-# Run test
-cd ${WORKDIR}
-./atconfig ./atlocal ./testsuite
-
-./testsuite 2>&1 | grep -E '[0-9]{1,3}: ' | sed -e 's/^.....//' -e '/[ok]$/s/^/PASS: /;/FAILED (.*)/s/^/FAIL: /;/skipped (.*)/s/^/SKIP: /;/expected failure/ s/^/PASS: /;/UNEXPECTED PASS/s/^/FAIL: /' -e 's/ok$//g' -e 's/FAILED.*//g' -e 's/skipped.*//g' -e 's/expected failure.*//g' -e 's/UNEXPECTED PASS.*//g'
+su -c ./test.sh ptest
diff --git a/meta/recipes-extended/cpio/cpio-2.13/run-ptest b/meta/recipes-extended/cpio/cpio-2.13/test.sh
similarity index 100%
copy from meta/recipes-extended/cpio/cpio-2.13/run-ptest
copy to meta/recipes-extended/cpio/cpio-2.13/test.sh
diff --git a/meta/recipes-extended/cpio/cpio_2.13.bb b/meta/recipes-extended/cpio/cpio_2.13.bb
index df5e09cae8..55bcc606b3 100644
--- a/meta/recipes-extended/cpio/cpio_2.13.bb
+++ b/meta/recipes-extended/cpio/cpio_2.13.bb
@@ -14,6 +14,7 @@ SRC_URI = "${GNU_MIRROR}/cpio/cpio-${PV}.tar.gz \
            file://0001-Use-__alignof__-with-clang.patch \
            file://0001-Wrong-CRC-with-ASCII-CRC-for-large-files.patch \
            file://run-ptest \
+           file://test.sh \
            "
 
 SRC_URI[md5sum] = "389c5452d667c23b5eceb206f5000810"
@@ -57,9 +58,24 @@ do_install_ptest() {
     install --mode=755 ${B}/tests/atlocal ${D}${PTEST_PATH}/tests/
     install --mode=755 ${B}/tests/genfile ${D}${PTEST_PATH}/tests/
     install --mode=755 ${S}/tests/testsuite ${D}${PTEST_PATH}/tests/
-    sed -i "s#@PTEST_PATH@#${PTEST_PATH}#g" ${D}${PTEST_PATH}/run-ptest
+    install --mode=755 ${WORKDIR}/test.sh ${D}${PTEST_PATH}/test.sh
+    sed -i "s#@PTEST_PATH@#${PTEST_PATH}#g" ${D}${PTEST_PATH}/test.sh
 }
 
+# ptest.bbclass currently chowns the ptest directory explicitly, so we need to
+# change permission after that has happened so the ptest user can write a
+# temporary directory.
+do_install_ptest_base:append() {
+    chgrp -R ptest ${D}${PTEST_PATH}/
+    chmod -R g+w ${D}${PTEST_PATH}/
+}
+
+# The tests need to run as a non-root user, so pull in the ptest user
+DEPENDS:append:class-target = "${@bb.utils.contains('PTEST_ENABLED', '1', ' ptest-runner', '', d)}"
+PACKAGE_WRITE_DEPS += "ptest-runner"
+
+RDEPENDS:${PN}-ptest += "ptest-runner"
+
 PACKAGES =+ "${PN}-rmt"
 
 FILES:${PN}-rmt = "${sbindir}/rmt*"
-- 
2.40.1


