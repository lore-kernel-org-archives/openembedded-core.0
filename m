Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACBC7C77B75
	for <webhook@archiver.kernel.org>; Fri, 21 Apr 2023 04:52:29 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.4799.1682052743172941778
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Apr 2023 21:52:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=T23Ej2E0;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1a66e7a52d3so15405605ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Apr 2023 21:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682052742; x=1684644742;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zuMnkc3lLxCPV/3PJ+dpA80tmfRw7hTisECHmSq3Rb8=;
        b=T23Ej2E0iPWuRERkbvG5YnlnX5oEp1DM07t1H58MiyxN0+vskOwOW8HwrUoseKmlMu
         pfWmfHgYTDoGeYxZLd1YAROgj856iSSRx1bpey72lSKVVX4gmS8Z5mc1qXEiUT/WJcOX
         JBqSqJWLEKNfCt3sjrVUExqe2TAhh0uEXpEGl6131LQFQkDaOW3weapi9ezKmbLUI26Q
         oMVSWHLyB7dSBsKFvNETqf/Ebh51arbfyCJRZze0bdtermjDpGEMm1JChzP0i0qPftJE
         zx4OwifHFtSCE0HsWKyFeQuiQdvAGviOzqE2dEpxmce0F1tkULQzK0na22iIva360BuD
         JBeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682052742; x=1684644742;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zuMnkc3lLxCPV/3PJ+dpA80tmfRw7hTisECHmSq3Rb8=;
        b=ZTTyiAU12ScdV/UPlzoxLIAoOIhAufzsBBkzqkbxnABdsHN11k6SH5eO/lQvgahXrc
         s5KQ2h0P+78tXtwybhgWyG5Q4DqYlvVfczsX0tnPgnJzddJj/5iGx5nlpsh0e2/XIYE+
         bbvIY475pWFfufkxanunovHR/4ISlP+ja/JNzOJrLesRJh8rJ+ap5JDSZnJpiEDt2s1a
         h1DJFUtcN6VbOyTUXyH+LmFQYmn1xRw1OirdrqJNYNR52Q7hMDobLywxWR4Asf2i7F67
         NDsxuOByO+jCOV8muCgSykTdr+DKuT8cxkg3Iq+UMl2+xok4/ZKSUnyZ4qwSOQsSb3w3
         YZIA==
X-Gm-Message-State: AAQBX9fAXMwr+mBiO9LqU9OMq8zz5nfpx9TOHzpKgciG3phX/rY++EcZ
	PRV5+Z/tckZCqt5iRfr2S4cReGBRLObPkg==
X-Google-Smtp-Source: AKy350Yv56KQ6lNdP7OQ2DaRS20pq2cfV6dfdb4NMS3xMbLURZhFmGnBBVDm0BGIW5PUrpRl6WldMw==
X-Received: by 2002:a17:903:189:b0:1a6:4c34:98bb with SMTP id z9-20020a170903018900b001a64c3498bbmr3856413plg.57.1682052742085;
        Thu, 20 Apr 2023 21:52:22 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::ebd0])
        by smtp.gmail.com with ESMTPSA id y23-20020a1709029b9700b001a69c1c78e7sm1888311plp.71.2023.04.20.21.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 21:52:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] cpio: Run ptests under ptest user
Date: Thu, 20 Apr 2023 21:52:19 -0700
Message-Id: <20230421045219.1333150-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Apr 2023 04:52:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180269

Running these tests under root user on musl works ok but it emits
additional diagnostic

cpio: dir: Cannot change ownership to uid 0, gid 0: Not supported

Ideally its better to run this test suite under non-root user which
is often how these are run. Moreover, tests work on musl as well.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/cpio/cpio-2.13/run-ptest   |  9 +--------
 .../cpio/cpio-2.13/{run-ptest => test.sh}        |  0
 meta/recipes-extended/cpio/cpio_2.13.bb          | 16 ++++++++++++++++
 3 files changed, 17 insertions(+), 8 deletions(-)
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
index df5e09cae8..943fa9b3ab 100644
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
+    install --mode=755 ${WORKDIR}/test.sh ${D}${PTEST_PATH}/test.sh
     sed -i "s#@PTEST_PATH@#${PTEST_PATH}#g" ${D}${PTEST_PATH}/run-ptest
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
2.40.0


