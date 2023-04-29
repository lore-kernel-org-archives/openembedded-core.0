Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6173DC77B60
	for <webhook@archiver.kernel.org>; Sat, 29 Apr 2023 01:29:12 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.38458.1682731744552820737
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Apr 2023 18:29:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ieOgdRJV;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1a66b9bd7dfso5934405ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 18:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682731743; x=1685323743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PX+CrUFC33qkbcjceYtQGmA8vM1q6xyytEW7AiuoUOw=;
        b=ieOgdRJV+KmZkANfi9CsfWOIhhh67hUZqqzVgIOE2dfhb7inLJUw0beui/y7mgZJGE
         TrM0AcehgJE01m+dUwSWc1kcJ7zJmGxaDsi6ugo+yHIWdUcFMwMqp177wCN7xJvBjfMV
         shnsaut3nu8PS+gCG4qS7FK4TQjiTAaGZMTMb3UL/LrP753xkys6dB40WM2AH7IiUY1j
         icqNuESh0EnLzeUXfG7aBLbGzCxvLozZD8uQ8dwc7i+tlDqoEzpZYOSdvyXKIEVbj1gl
         SJGsan4sZap6A8to19FFJFXzj4qbs4bPB2MwCR60hA0DQQUmpJghSAy7H/A0eDFh/LlX
         +MJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682731743; x=1685323743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PX+CrUFC33qkbcjceYtQGmA8vM1q6xyytEW7AiuoUOw=;
        b=QAA7jIZZooBrE5YIP6REHMUeFggSKe1Lahm5RNUpMenjqHmWbtuzOsBe1hgMtwCYhz
         eY/0wybMr+uEh3ua5MJLP7gU1jyX9vXRHd3F3GANzRYnRshoI9cBwB/37nKxPFzEMpeC
         f7mJtUvL/P6geT/OwnHR0fgOh5G6l5FdIFLvi15BW+45DkMuZCTxBVUerNOILd/MDUTG
         vgOo7YbqBxPjJ2NfPqAlZw3lc6Js6TEBJX1lBCJr8NLj5+0EW8wFU7zFgjmVkogngKaS
         a+QPsu2N5UgufMF+spgjMOJfGME+gKSK1eqgf5ZdDg4tP0ulMEnvvgKUh+HjyczluDUB
         SL9g==
X-Gm-Message-State: AC+VfDz08tr1/vHtJAtEjBPn2co0zbk9nA5iLjOv80RHjOsC84lJklTl
	Ueobo8OYr67AEbMIu0c+GEg3nlVMVynuCQ==
X-Google-Smtp-Source: ACHHUZ7TDdQe521PghLFZCn1giXSfBltoot1s8m6PxFKP5Ivr9kc3gFfPnRT65pRDGZEINCklzOG6w==
X-Received: by 2002:a17:902:cecc:b0:1a5:253f:ace7 with SMTP id d12-20020a170902cecc00b001a5253face7mr8796363plg.29.1682731743147;
        Fri, 28 Apr 2023 18:29:03 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:9181:d380::f98d])
        by smtp.gmail.com with ESMTPSA id x7-20020a17090a788700b002448f08b177sm10636303pjk.22.2023.04.28.18.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Apr 2023 18:29:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] cpio: Run ptests under ptest user
Date: Fri, 28 Apr 2023 18:29:00 -0700
Message-Id: <20230429012900.872374-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Apr 2023 01:29:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180537

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
2.40.1


