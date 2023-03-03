Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F519C64EC4
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 16:18:17 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.27625.1677860291226399531
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Mar 2023 08:18:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=5brhR5ti;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id l1so3048913pjt.2
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 08:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1677860290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BzZDvQhb20sSm0dLc6YC8XOiEpUO2kkao8AplX4LZLo=;
        b=5brhR5tiDmnGFFSt8wQOknZmh9VdtpE3XDO8FzzbGwvpVt+oK+MJ85vHnzECdFyigo
         Y1mZrGh2w3iT/1+S8XbBDo2kT3QPb8Gyqlg6+2kdicUK6lmd7Qct+40B7cp15K9Uto0b
         eyWxGzH2tbPdLAxdKUaszDH7seelUh/KSVFHVMdX+6cYDI7b/dovXTShHnjs+uhBZ1bL
         ZhJAUP51SX6WeVRhyOT1A9WRI2ebalBMiZColLT6Jylc9A/xS4UbG0uSSrnp1ke1Dv9d
         X9TpLIC/KEPh2apjKEqIQ/J/Mk/ou9Qe/7oQX1Ox9UvK7nzh8h8aNmgaOGZ3kBHXbouc
         PLWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677860290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BzZDvQhb20sSm0dLc6YC8XOiEpUO2kkao8AplX4LZLo=;
        b=Li35WVu0RnuWCFNO7CLM3JSnfQNKGZ0ktLhj68QIT38qh7CajLmlnjO5DQ4pBGBo92
         IQ4bMisWfia81/3V3qFVXIc+/O1QgHT8sdLfalE7hu0d1YxneSJygSshmXs5MeDqi0lF
         KkEj4cyiqk8h94ia7TZkoyqGr2Tr/BQwmb7CFXH+M+TuJtjLHwZLwMiHvB5dhqB/pdBn
         S7xsa8po4OnUAp7Vg63/HzLTLRbDt2GawgYyjqs1Fupqqf0kUkAjyI6weJxR6cTYvD3u
         EJrdI28zsE8SlIX9Qw7GT5QPaRe0FcVL9FEWfYi0zvA4HtScE9oF2jUtr4pDKpCtJJdM
         vj2Q==
X-Gm-Message-State: AO0yUKWO7/+9k15ICBF63NuMK+cdmhbh/M5Hk4630zWH2ECxB7WQ9n9x
	CRYnDi2kY8cd7tx08mMdpAm9YN3K7uAY1PHvIc8=
X-Google-Smtp-Source: AK7set9A66iEuHWIS39w231TXRLY9EKkjwxtP9Jj+7JVgjT202777MxltwdGNu3hLD32sOkagDQArw==
X-Received: by 2002:a17:903:1cf:b0:196:2ade:6e21 with SMTP id e15-20020a17090301cf00b001962ade6e21mr2291184plh.14.1677860290226;
        Fri, 03 Mar 2023 08:18:10 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id ko4-20020a17090307c400b00186b7443082sm1702474plb.195.2023.03.03.08.18.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 08:18:09 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 22/29] libssh2: Clean up ptest patch/coverage
Date: Fri,  3 Mar 2023 06:17:20 -1000
Message-Id: <69b660e76c30e4bcc355be19cbe560db275e90b1.1677859897.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677859897.git.steve@sakoman.com>
References: <cover.1677859897.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 16:18:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178011

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Martin Jansa spotted patchreview.py reports Malformed Upstream-Status in a
patch in this recipe. The patch is not being applied since there is no ptest
override.

The test in question was also disabled due to an issue with new versions of
openssh.

Add a workaround for the broken test, enable it, drop the broken patch.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e9f2cc084638ce9cb5339df611e473c30f0e40b1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
index b1204e49eb..0000000000
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
index 0000000000..ee916c42d4
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
index 9e2fce2d24..5e7426f79d 100644
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
index 072d6819c0..d5513373b0 100644
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
2.34.1


