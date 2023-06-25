Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF261C0502B
	for <webhook@archiver.kernel.org>; Sun, 25 Jun 2023 21:22:57 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.20173.1687728176964885362
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Jun 2023 14:22:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=AyfbXdJj;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-31126037f41so3180983f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Jun 2023 14:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687728175; x=1690320175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r5c9D2KNB8yN70lE3u0G6XJDMxeggAOsJixRN9fQd2w=;
        b=AyfbXdJjkH2FwFfRW+t11O439jdGMrFVq9Pv4YUbWVZrG5mVwubd3CmGRz/jn3p5M5
         JeDTufhyUB3gBSG3E0zZluaLlASm2MRm0u5wxaY6quB19oSO15aQvhWllf18t48ntCnc
         lDJXN/bhwBQqyezVOyVOidab5qf5K+LNIUcLu6iXGSw8FoFqpxF0VZAwSFJ559W9wYHw
         pE/YEy35IJmd4S7wTW/D738qySVvf6tEeaCu1OtMukdaFGPff/mHrFgjlQGiW+JQWjib
         iFvGKG88oEGwII4tfvNNmF/c1hXtJdvGEbTlnQeXHH3ZKDKqfLzto86J+Ld/f/QYmpyA
         dkjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687728175; x=1690320175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r5c9D2KNB8yN70lE3u0G6XJDMxeggAOsJixRN9fQd2w=;
        b=h7YAgpVb6wv3Kd99aEHl2AcDfm2rq6N3i7dgyvz/PHTq2KjIx7iM7J+z+HtneTWMd9
         b+ITU04Pa0pqK3FQKBEs3BO7JnkWPJ/9RL37wMbud7wdFvxfOyA3ZgXGMcr5bYxNPVog
         z+rCOv4Sx1FNSuwrK09mT4KuNMSWC6vBBylC3WHzM9emqDDr/7Ag7iXOnBYrj6lPMCuk
         4WPDs3Tzo7A3jn632X/LrNSdsBL4nCExPXnNNhUQ8s0R2UseXkQysQC3SsAqBPdUF/Sc
         uGVH5bpewMTKeHJCuHyWIqSBS5Y7FI96Lh56jeS7ZaZ1mM0up7BiyFrX6W/+SZhsHkJC
         mQDg==
X-Gm-Message-State: AC+VfDzzCrE0yiintAGH4CfjS4Oewdw2kkfm6NE5zBlm6UZqSbB7BIbQ
	NLFIVVm3jnQcdj9doJYKWrsRnf4MhiJvdQ==
X-Google-Smtp-Source: ACHHUZ6WCZlNqrXEsZdTw7b2u0xOfBE8+8bc/VoFjc67aEmuaqH25Q3xMJKMU6y3fdNB8RPDRQoVQQ==
X-Received: by 2002:a5d:6505:0:b0:30f:d2af:d62b with SMTP id x5-20020a5d6505000000b0030fd2afd62bmr21493408wru.19.1687728175418;
        Sun, 25 Jun 2023 14:22:55 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id q9-20020a056000136900b0030f9c3219aasm5426736wrz.47.2023.06.25.14.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 14:22:55 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 21/21] libssh2: update 1.10.0 -> 1.11.0
Date: Sun, 25 Jun 2023 23:22:41 +0200
Message-Id: <20230625212241.915739-21-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230625212241.915739-1-alex@linutronix.de>
References: <20230625212241.915739-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Jun 2023 21:22:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183396

License-update: copyright years

Enable static libs as some tests need them.

Fix up ptests; the set being run is the same.
test_simple is statically linked, hence DISABLE_STATIC is overriden.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libssh2/libssh2/fix-ssh2-test.patch       | 23 -------------------
 .../recipes-support/libssh2/libssh2/run-ptest |  2 +-
 .../{libssh2_1.10.0.bb => libssh2_1.11.0.bb}  | 14 ++++++-----
 3 files changed, 9 insertions(+), 30 deletions(-)
 delete mode 100644 meta/recipes-support/libssh2/libssh2/fix-ssh2-test.patch
 rename meta/recipes-support/libssh2/{libssh2_1.10.0.bb => libssh2_1.11.0.bb} (73%)

diff --git a/meta/recipes-support/libssh2/libssh2/fix-ssh2-test.patch b/meta/recipes-support/libssh2/libssh2/fix-ssh2-test.patch
deleted file mode 100644
index ee916c42d43..00000000000
--- a/meta/recipes-support/libssh2/libssh2/fix-ssh2-test.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-In 8.8 OpenSSH disabled sha1 rsa-sha keys out of the box,
-so we need to re-enable them as a workaround for the test
-suite until upstream updates the tests.
-
-See: https://github.com/libssh2/libssh2/issues/630
-
-Upstream-Status: Backport [alternative fixes merged upstream]
-
-Patch taken from https://github.com/mirror-rpm/libssh2/commit/47f7114f7d0780f3075bad51a71881f45cc933c5
-
---- a/tests/ssh2.sh
-+++ b/tests/ssh2.sh
-@@ -25,7 +25,8 @@ $SSHD -f /dev/null -h "$srcdir"/etc/host
-     -o 'Port 4711' \
-     -o 'Protocol 2' \
-     -o "AuthorizedKeysFile $srcdir/etc/user.pub" \
--    -o 'UsePrivilegeSeparation no' \
-+    -o 'HostKeyAlgorithms +ssh-rsa' \
-+    -o 'PubkeyAcceptedAlgorithms +ssh-rsa' \
-     -o 'StrictModes no' \
-     -D \
-     $libssh2_sshd_params &
-
diff --git a/meta/recipes-support/libssh2/libssh2/run-ptest b/meta/recipes-support/libssh2/libssh2/run-ptest
index 5e7426f79df..0f5526e316d 100644
--- a/meta/recipes-support/libssh2/libssh2/run-ptest
+++ b/meta/recipes-support/libssh2/libssh2/run-ptest
@@ -2,7 +2,7 @@
 
 ptestdir=$(dirname "$(readlink -f "$0")")
 cd tests
-for test in simple mansyntax.sh ssh2.sh
+for test in mansyntax.sh test_simple test_sshd.test
 do
 	./../test-driver --test-name $test --log-file ../$test.log --trs-file ../$test.trs --color-tests no --enable-hard-errors yes --expect-failure no -- ./$test
 done
diff --git a/meta/recipes-support/libssh2/libssh2_1.10.0.bb b/meta/recipes-support/libssh2/libssh2_1.11.0.bb
similarity index 73%
rename from meta/recipes-support/libssh2/libssh2_1.10.0.bb
rename to meta/recipes-support/libssh2/libssh2_1.11.0.bb
index d5513373b08..711bf937f52 100644
--- a/meta/recipes-support/libssh2/libssh2_1.10.0.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.0.bb
@@ -5,14 +5,13 @@ SECTION = "libs"
 DEPENDS = "zlib"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3e089ad0cf27edf1e7f261dfcd06acc7"
+LIC_FILES_CHKSUM = "file://COPYING;md5=24a33237426720395ebb1dd1349ca225"
 
 SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz \
-           file://fix-ssh2-test.patch \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "2d64e90f3ded394b91d3a2e774ca203a4179f69aebee03003e5a6fa621e41d51"
+SRC_URI[sha256sum] = "3736161e41e2693324deb38c26cfdc3efe6209d634ba4258db1cecff6a5ad461"
 
 inherit autotools pkgconfig ptest
 
@@ -20,6 +19,7 @@ EXTRA_OECONF += "\
                  --with-libz \
                  --with-libz-prefix=${STAGING_LIBDIR} \
                 "
+DISABLE_STATIC = ""
 
 # only one of openssl and gcrypt could be set
 PACKAGECONFIG ??= "openssl"
@@ -29,7 +29,7 @@ PACKAGECONFIG[gcrypt] = "--with-crypto=libgcrypt --with-libgcrypt-prefix=${STAGI
 BBCLASSEXTEND = "native nativesdk"
 
 # required for ptest on documentation
-RDEPENDS:${PN}-ptest = "man-db openssh util-linux-col"
+RDEPENDS:${PN}-ptest = "bash man-db openssh util-linux-col"
 RDEPENDS:${PN}-ptest:append:libc-glibc = " locale-base-en-us"
 
 do_compile_ptest() {
@@ -41,9 +41,11 @@ do_install_ptest() {
 	install -d ${D}${PTEST_PATH}/tests
 	install -m 0755 ${S}/test-driver ${D}${PTEST_PATH}/
 	cp -rf ${B}/tests/.libs/* ${D}${PTEST_PATH}/tests/
+	cp -rf ${B}/tests/test_simple ${D}${PTEST_PATH}/tests/
 	cp -rf ${S}/tests/mansyntax.sh  ${D}${PTEST_PATH}/tests/
-	cp -rf ${S}/tests/ssh2.sh  ${D}${PTEST_PATH}/tests/
-	cp -rf ${S}/tests/etc ${D}${PTEST_PATH}/tests/
+	cp -rf ${S}/tests/key*  ${D}${PTEST_PATH}/tests/
+	cp -rf ${S}/tests/openssh_server/  ${D}${PTEST_PATH}/tests/
+	cp -rf ${S}/tests/*.test  ${D}${PTEST_PATH}/tests/
 	mkdir -p ${D}${PTEST_PATH}/docs
 	cp -r ${S}/docs/* ${D}${PTEST_PATH}/docs/
 }
-- 
2.30.2


