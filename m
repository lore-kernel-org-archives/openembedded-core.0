Return-Path: <sudipm.mukherjee@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71DAAEB64D7
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 20:52:21 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.2075.1686689537745079449
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jun 2023 13:52:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=DUJ+lcX7;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: sudipm.mukherjee@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-3f8cec6641bso89725e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Jun 2023 13:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686689536; x=1689281536;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZSbfC+EucEmdZdknL+Bvo5xzt6ptIB9seBZbOJYYavQ=;
        b=DUJ+lcX7DibvhgqhFK6OlAkkrxOUZDWHXsnsw1m2AX1xZd0I5xQ2H9AnVnVrvMXPwP
         ySM1DZ7gUUJvU5cu6w3Zi6Yt2Hm1iSMgLXYBfUVeSR2tQj8HMTFw5IiW4x/gYaRbGCYO
         d8i6+KI07BRvYgJs6yOE57wcFwCpbcZag+BuY5lQvs/+j4pIdvxZEqB4qAYX1W/ySUp6
         dZ9HBX3epBQVwmY81onbYzgSAGvfUFPX2qw39whu9VyW1zIblHMkzAr4A6OCUe/lH4Gv
         fVspFnOY0SgGxGUXOfhqW/W5a+zGLq/XTBxGbN5T2olK8QQzSKl9KCV4J2vK2NfOznXM
         5zoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686689536; x=1689281536;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZSbfC+EucEmdZdknL+Bvo5xzt6ptIB9seBZbOJYYavQ=;
        b=WN+kQ/xPDDMtvcj0j/kV+rHgp407IKoO9w7iVMKDRwDpFyk+WFjkYA6A/0mt3THBei
         e1L/0EbTcg3sLUtOWAO/wkH0YJS+qLaUiYSwD4dBCQ+fk80+r882XjfOvZSadmzYagx2
         x4xr4Jue3a5bBbFI2xmCUy0tUtl5hmsppPyRNBvW3ft+/tfNksOUBQGRBWoGXZM2qrwL
         RUgyWXIjQKPWz/XXma7snIb/Bmjr73RHrIH+F0DZTjdIm2uqXumc9pxvzV+HSQ5kX3rM
         4x9SBYJ9rudv2ZIBXFF/oEQgdFOyhF5GKm1MVWhXhtPL2/6ReEf/MYuStWOEMA05ur7X
         BasQ==
X-Gm-Message-State: AC+VfDxaGqBBTbjDRMPkIAXTLI/Vj4JoIsGsZpAG9UiI25jstf+cTS7X
	kboNiKhfqL5Q+ZxnFg++LEiR7DWm5iI=
X-Google-Smtp-Source: ACHHUZ5YaleW07YS6tlbtMO8ExYgggVBkE+LliB7nZC3rDDVDq/FEqjAFBPPpuwhakKg1GPwmO9WVA==
X-Received: by 2002:a05:600c:2144:b0:3f7:5e07:ea54 with SMTP id v4-20020a05600c214400b003f75e07ea54mr10582068wml.13.1686689535766;
        Tue, 13 Jun 2023 13:52:15 -0700 (PDT)
Received: from localhost.localdomain ([63.135.72.41])
        by smtp.gmail.com with ESMTPSA id c21-20020a05600c0ad500b003f7310a3ffasm15432639wmr.2.2023.06.13.13.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 13:52:15 -0700 (PDT)
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
X-Google-Original-From: Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>
To: openembedded-core@lists.openembedded.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH v2] libssh2: Upgrade to v1.11.0
Date: Tue, 13 Jun 2023 21:52:12 +0100
Message-Id: <20230613205212.7548-1-sudip.mukherjee@codethink.co.uk>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jun 2023 20:52:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182724

From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>

Changes:
Update license checksum: change in copyright year.
Remove patch fixed by upstream.
Disable rpath, hardcoded rpath failed curl-native build.
Adjust ptests.
Remove --disable-static from OECONF

Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
---

v2: Remove --disable-static from OECONF.
Only needed for poky as its using --disable-static and that fails ptest builds.


 .../libssh2/libssh2/fix-ssh2-test.patch       | 23 -------------------
 .../recipes-support/libssh2/libssh2/run-ptest |  2 +-
 .../{libssh2_1.10.0.bb => libssh2_1.11.0.bb}  | 17 +++++++++-----
 3 files changed, 12 insertions(+), 30 deletions(-)
 delete mode 100644 meta/recipes-support/libssh2/libssh2/fix-ssh2-test.patch
 rename meta/recipes-support/libssh2/{libssh2_1.10.0.bb => libssh2_1.11.0.bb} (65%)

diff --git a/meta/recipes-support/libssh2/libssh2/fix-ssh2-test.patch b/meta/recipes-support/libssh2/libssh2/fix-ssh2-test.patch
deleted file mode 100644
index ee916c42d4..0000000000
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
index 5e7426f79d..ed87074fcd 100644
--- a/meta/recipes-support/libssh2/libssh2/run-ptest
+++ b/meta/recipes-support/libssh2/libssh2/run-ptest
@@ -2,7 +2,7 @@
 
 ptestdir=$(dirname "$(readlink -f "$0")")
 cd tests
-for test in simple mansyntax.sh ssh2.sh
+for test in test_simple mansyntax.sh test_sshd.test
 do
 	./../test-driver --test-name $test --log-file ../$test.log --trs-file ../$test.trs --color-tests no --enable-hard-errors yes --expect-failure no -- ./$test
 done
diff --git a/meta/recipes-support/libssh2/libssh2_1.10.0.bb b/meta/recipes-support/libssh2/libssh2_1.11.0.bb
similarity index 65%
rename from meta/recipes-support/libssh2/libssh2_1.10.0.bb
rename to meta/recipes-support/libssh2/libssh2_1.11.0.bb
index d5513373b0..eff2f043a5 100644
--- a/meta/recipes-support/libssh2/libssh2_1.10.0.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.11.0.bb
@@ -5,21 +5,22 @@ SECTION = "libs"
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
 
 EXTRA_OECONF += "\
                  --with-libz \
                  --with-libz-prefix=${STAGING_LIBDIR} \
+                 --disable-rpath \
                 "
+EXTRA_OECONF:remove = "--disable-static"
 
 # only one of openssl and gcrypt could be set
 PACKAGECONFIG ??= "openssl"
@@ -41,9 +42,13 @@ do_install_ptest() {
 	install -d ${D}${PTEST_PATH}/tests
 	install -m 0755 ${S}/test-driver ${D}${PTEST_PATH}/
 	cp -rf ${B}/tests/.libs/* ${D}${PTEST_PATH}/tests/
-	cp -rf ${S}/tests/mansyntax.sh  ${D}${PTEST_PATH}/tests/
-	cp -rf ${S}/tests/ssh2.sh  ${D}${PTEST_PATH}/tests/
-	cp -rf ${S}/tests/etc ${D}${PTEST_PATH}/tests/
+	cp -rf ${B}/tests/test_simple ${D}${PTEST_PATH}/tests/
+	cp -rf ${S}/tests/mansyntax.sh ${D}${PTEST_PATH}/tests/
+	cp -rf ${S}/tests/test_sshd.test  ${D}${PTEST_PATH}/tests/
+	cp -rf ${S}/tests/openssh_server ${D}${PTEST_PATH}/tests/
+	cp -rf ${S}/tests/key* ${D}${PTEST_PATH}/tests/
+# Makefile.inc required as test_sshd.test generates the list of test from this
+	cp -rf ${S}/tests/Makefile.inc ${D}${PTEST_PATH}/tests/
 	mkdir -p ${D}${PTEST_PATH}/docs
 	cp -r ${S}/docs/* ${D}${PTEST_PATH}/docs/
 }
-- 
2.30.2


