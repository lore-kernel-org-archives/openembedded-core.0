Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3DABC636D4
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 22:30:23 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.7232.1676500215367210050
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 14:30:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eWOHa3nP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id j32-20020a05600c1c2000b003dc4fd6e61dso2765055wms.5
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 14:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jE1okcNbh/e39DtCOg5u2p0QFNnU7H2za3IjZOK0DxU=;
        b=eWOHa3nPlo3WwIwX7OXay2YRIIEIzwLi6YjgFHbuowmJDUZnP/KbuuOaniAcfEWpPA
         8Jjsap7T8VDl9nkEpvdUNi9pRQ204/YZXqkOmKbVtLak5kRx43rHXTNWge2HJNbidpPJ
         aZe1DvpzfDmIjGRI2HIoYzx4k7D4ZGfHV1NV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jE1okcNbh/e39DtCOg5u2p0QFNnU7H2za3IjZOK0DxU=;
        b=wN7OnuIQNR8mtZyvAdKZM12k4Ld2z+Omucm0IdqAfcpZdYTy6GVOvC2bUG/W0R7TXa
         OEf44XQ3jtPM1VjjU1vXC4sMEqbUfEAMw1n4S2/k4KIIv/aEJhMiher/trL2RHJSBdWd
         IDygbbqhMxAIS0AkNHwmggiW/aMpSWmJiIqpIJ4bxuchTSC7Ho4VH0kN1iG4qbGqm7mb
         aBUtZQW6ITlJzJkibxSpqLvjhA4Uqnq9vxBUPkNanONRRX+INw4rLs9dEu6BMGyjPC6G
         Kd5nQrqPeb6nqWAJyUbThrjB4+LruvTZhR2VUMTAt1g8U0QUNLVLIByjIvcL1Hb/N58Z
         O2AA==
X-Gm-Message-State: AO0yUKWcP6g8w680MhNeyWx3fxXWolAXQIW2iaeDZHg3SBep6ngHizIf
	lQMoNnZqnlTSjhhWXeWeyBl1Q3PmnDJWMwu8
X-Google-Smtp-Source: AK7set8KLyaax8nUfM3F6hRWUAzfkM4/kepdNPjlS6GPnDW22LTCiUmo5eWPUKfzv9i9mBv313jRUw==
X-Received: by 2002:a05:600c:80f:b0:3db:fc3:6de4 with SMTP id k15-20020a05600c080f00b003db0fc36de4mr3177955wmp.35.1676500212906;
        Wed, 15 Feb 2023 14:30:12 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:d39a:5560:699e:2da6])
        by smtp.gmail.com with ESMTPSA id p7-20020a7bcc87000000b003e11f280b8bsm3259951wma.44.2023.02.15.14.30.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 14:30:12 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libssh2: Clean up ptest patch/coverage
Date: Wed, 15 Feb 2023 22:30:11 +0000
Message-Id: <20230215223011.251480-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 22:30:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177222

Martin Jansa spotted patchreview.py reports Malformed Upstream-Status in a
patch in this recipe. The patch is not being applied since there is no ptest
override.

The test in question was also disabled due to an issue with new versions of
openssh.

Add a workaround for the broken test, enable it, drop the broken patch.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...nviroment-to-decide-if-a-test-is-bui.patch | 44 -------------------
 .../libssh2/libssh2/fix-ssh2-test.patch       | 23 ++++++++++
 .../libssh2/{files => libssh2}/run-ptest      |  3 +-
 .../recipes-support/libssh2/libssh2_1.10.0.bb |  3 +-
 4 files changed, 25 insertions(+), 48 deletions(-)
 delete mode 100644 meta/recipes-support/libssh2/files/0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch
 create mode 100644 meta/recipes-support/libssh2/libssh2/fix-ssh2-test.patch
 rename meta/recipes-support/libssh2/{files => libssh2}/run-ptest (67%)

diff --git a/meta/recipes-support/libssh2/files/0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch b/meta/recipes-support/libssh2/files/0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch
deleted file mode 100644
index b1204e49eb8..00000000000
--- a/meta/recipes-support/libssh2/files/0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From f6abce5ba41a412a247250dcd80e387e53474466 Mon Sep 17 00:00:00 2001
-From: Your Name <you@example.com>
-Date: Mon, 28 Dec 2020 02:08:03 +0000
-Subject: [PATCH] Don't let host enviroment to decide if a test is build
-
-test ssh2.sh need sshd, for cross compile, we need it on target, so
-don't use SSHD on host to decide weither to build a test
-
-Upstream-Status: Inappropriate[oe specific]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
-
----
- tests/Makefile.am | 6 +-----
- 1 file changed, 1 insertion(+), 5 deletions(-)
-
-diff --git a/tests/Makefile.am b/tests/Makefile.am
-index dc0922f..6cbc35d 100644
---- a/tests/Makefile.am
-+++ b/tests/Makefile.am
-@@ -1,16 +1,12 @@
- AM_CPPFLAGS = -I$(top_srcdir)/src -I$(top_srcdir)/include -I$(top_builddir)/src
- LDADD = ../src/libssh2.la
- 
--if SSHD
- noinst_PROGRAMS = ssh2
- ssh2_SOURCES = ssh2.c
--endif
- 
- ctests = simple$(EXEEXT)
- TESTS = $(ctests) mansyntax.sh
--if SSHD
- TESTS += ssh2.sh
--endif
- check_PROGRAMS = $(ctests)
- 
- TESTS_ENVIRONMENT = SSHD=$(SSHD) EXEEXT=$(EXEEXT)
-@@ -38,4 +34,4 @@ if OPENSSL
- # EXTRA_DIST += test_public_key_auth_succeeds_with_correct_encrypted_ed25519_key.c
- # EXTRA_DIST += test_public_key_auth_succeeds_with_correct_ed25519_key_from_mem.c
- EXTRA_DIST += test_public_key_auth_succeeds_with_correct_rsa_openssh_key.c
--endif
-\ No newline at end of file
-+endif
diff --git a/meta/recipes-support/libssh2/libssh2/fix-ssh2-test.patch b/meta/recipes-support/libssh2/libssh2/fix-ssh2-test.patch
new file mode 100644
index 00000000000..ee916c42d43
--- /dev/null
+++ b/meta/recipes-support/libssh2/libssh2/fix-ssh2-test.patch
@@ -0,0 +1,23 @@
+In 8.8 OpenSSH disabled sha1 rsa-sha keys out of the box,
+so we need to re-enable them as a workaround for the test
+suite until upstream updates the tests.
+
+See: https://github.com/libssh2/libssh2/issues/630
+
+Upstream-Status: Backport [alternative fixes merged upstream]
+
+Patch taken from https://github.com/mirror-rpm/libssh2/commit/47f7114f7d0780f3075bad51a71881f45cc933c5
+
+--- a/tests/ssh2.sh
++++ b/tests/ssh2.sh
+@@ -25,7 +25,8 @@ $SSHD -f /dev/null -h "$srcdir"/etc/host
+     -o 'Port 4711' \
+     -o 'Protocol 2' \
+     -o "AuthorizedKeysFile $srcdir/etc/user.pub" \
+-    -o 'UsePrivilegeSeparation no' \
++    -o 'HostKeyAlgorithms +ssh-rsa' \
++    -o 'PubkeyAcceptedAlgorithms +ssh-rsa' \
+     -o 'StrictModes no' \
+     -D \
+     $libssh2_sshd_params &
+
diff --git a/meta/recipes-support/libssh2/files/run-ptest b/meta/recipes-support/libssh2/libssh2/run-ptest
similarity index 67%
rename from meta/recipes-support/libssh2/files/run-ptest
rename to meta/recipes-support/libssh2/libssh2/run-ptest
index 9e2fce2d24a..5e7426f79df 100644
--- a/meta/recipes-support/libssh2/files/run-ptest
+++ b/meta/recipes-support/libssh2/libssh2/run-ptest
@@ -2,8 +2,7 @@
 
 ptestdir=$(dirname "$(readlink -f "$0")")
 cd tests
-# omit ssh2.sh until https://github.com/libssh2/libssh2/issues/630 is fixed
-for test in simple mansyntax.sh
+for test in simple mansyntax.sh ssh2.sh
 do
 	./../test-driver --test-name $test --log-file ../$test.log --trs-file ../$test.trs --color-tests no --enable-hard-errors yes --expect-failure no -- ./$test
 done
diff --git a/meta/recipes-support/libssh2/libssh2_1.10.0.bb b/meta/recipes-support/libssh2/libssh2_1.10.0.bb
index 072d6819c0c..d5513373b08 100644
--- a/meta/recipes-support/libssh2/libssh2_1.10.0.bb
+++ b/meta/recipes-support/libssh2/libssh2_1.10.0.bb
@@ -8,11 +8,10 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3e089ad0cf27edf1e7f261dfcd06acc7"
 
 SRC_URI = "http://www.libssh2.org/download/${BP}.tar.gz \
+           file://fix-ssh2-test.patch \
            file://run-ptest \
            "
 
-SRC_URI:append:ptest = " file://0001-Don-t-let-host-enviroment-to-decide-if-a-test-is-bui.patch"
-
 SRC_URI[sha256sum] = "2d64e90f3ded394b91d3a2e774ca203a4179f69aebee03003e5a6fa621e41d51"
 
 inherit autotools pkgconfig ptest
-- 
2.37.2


