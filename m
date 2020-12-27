Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
 by mx.groups.io with SMTP id smtpd.web12.29668.1609046654010852494
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Dec 2020 21:24:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uPu0tGZB;
 spf=pass (domain: gmail.com, ip: 209.85.166.170, mailfrom: twoerner@gmail.com)
Received: by mail-il1-f170.google.com with SMTP id v3so6862892ilo.5
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Dec 2020 21:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F4VmZvU1329qUspGmUUFdlHBM8VbkCjfbrlSsSVlVAQ=;
        b=uPu0tGZBDOXnb3Y2bnZAw/ICxWO/fzsTdh8OqyZH7PhwFwyKXDiLjDqsaiYJCF60dr
         LvIz5wfSEdSzJCIEGDoad70scST2a4OQvFY7Yo3UJtr9ZH7ZPtjq995aWsZ1U4kxaYMK
         DAsNKOmPVoMCy0khavW/q5zocv40DIQiIas85tmfTXY3ViQF+3HN3ANnJSC6BcrJwsoD
         dIilPBNXUFT8zCWpZfxUZUWEdzuVqURtflPyU0l9+6XJhvTTUhvA8wqzUS2MZtzJSujT
         vcJz2RHSniYqjGxwUmM52JoUa4hqqEFd4WUMI5LmLM5rz1ZlFX6FULPrT1iMaWPFubcG
         D1sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F4VmZvU1329qUspGmUUFdlHBM8VbkCjfbrlSsSVlVAQ=;
        b=FjvKS152w3mkImcYfAoJWlwahF+RgKL+xkqQ72XnUDAWKrHMHO+c8eDBMBDfe9NYs5
         S9Dg0bLjtoHCWhCcTjSQxlBxDSjUgrg+hntPrD1INTqT+SKpqaM//beXj4V5pXEtKndD
         QGCM84TIRi2FXS+0De0cVHAgUTF/3momO79K8TXIj7Zp+dEIdg+r1+rb/FTWjoOnvm3v
         dDm7rnZ1jswfYz/4CcFWPReFBYLCuo168NJOZjTfko8tMyIw6cGeQmEjcnU+THtoU6/p
         +3aOF4QBnlvaNq3kUNUbmr0JoIVR0cAPnhxAgHiT5v2Vbv52yQWRfTUTX1w5VMApoFrb
         hw2w==
X-Gm-Message-State: AOAM532ztjvyAj77KdvuukgIbpgyyiFte7Z3EThzenrCi1O2d8Ik9/CJ
	c84QgrDKS8kHY63B7mKB0n2+C9FhR2SXtA==
X-Google-Smtp-Source: ABdhPJzjSpcsLZ6JnfeHgTSyXnrowoP8odTqQr1FtjU4xj/mNvOReJ24mDQ8ueDar34HtijeD9NPhA==
X-Received: by 2002:a92:ad05:: with SMTP id w5mr36862299ilh.96.1609046653084;
        Sat, 26 Dec 2020 21:24:13 -0800 (PST)
Return-Path: <twoerner@gmail.com>
Received: from localhost.localdomain ([206.248.190.95])
        by smtp.gmail.com with ESMTPSA id e89sm25639803ill.44.2020.12.26.21.24.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Dec 2020 21:24:12 -0800 (PST)
From: "Trevor Woerner" <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta-selftest][PATCH] selftest-chown: add test for fifos
Date: Sun, 27 Dec 2020 00:24:01 -0500
Message-Id: <20201227052401.40000-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.30.0.rc0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Verify that fifos are properly handled by the build system.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta-selftest/recipes-test/selftest-chown/selftest-chown.bb | 5 +++++
 meta/lib/oeqa/selftest/cases/package.py                     | 3 ++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-selftest/recipes-test/selftest-chown/selftest-chown.bb b/meta-selftest/recipes-test/selftest-chown/selftest-chown.bb
index 87bf9438b8..440471fe80 100644
--- a/meta-selftest/recipes-test/selftest-chown/selftest-chown.bb
+++ b/meta-selftest/recipes-test/selftest-chown/selftest-chown.bb
@@ -3,6 +3,8 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
 
 LICENSE = "MIT"
 
+DEPENDS += "coreutils-native"
+
 S = "${WORKDIR}"
 
 inherit useradd allarch
@@ -16,10 +18,13 @@ do_install() {
 	install -d   ${TESTDIR}/dir
 	touch        ${TESTDIR}/file
 	ln -s ./file ${TESTDIR}/symlink
+	install -d   ${TESTDIR}/fifotest
+	mkfifo       ${TESTDIR}/fifotest/fifo
 
 	chown    test:test ${TESTDIR}/file
 	chown -R test:test ${TESTDIR}/dir
 	chown -h test:test ${TESTDIR}/symlink
+	chown -R test:test ${TESTDIR}/fifotest
 }
 
 FILES_${PN} = "${sysconfdir}/selftest-chown/*"
diff --git a/meta/lib/oeqa/selftest/cases/package.py b/meta/lib/oeqa/selftest/cases/package.py
index 3010b1af49..7166c3991f 100644
--- a/meta/lib/oeqa/selftest/cases/package.py
+++ b/meta/lib/oeqa/selftest/cases/package.py
@@ -168,6 +168,7 @@ class PackageTests(OESelftestTestCase):
         with runqemu('core-image-minimal') as qemu:
             for path in [ sysconfdir + "/selftest-chown/file",
                           sysconfdir + "/selftest-chown/dir",
-                          sysconfdir + "/selftest-chown/symlink"]:
+                          sysconfdir + "/selftest-chown/symlink",
+                          sysconfdir + "/selftest-chown/fifotest/fifo"]:
                 if not check_ownership(qemu, "test", "test", path):
                     self.fail('Test ownership %s failed' % path)
-- 
2.30.0.rc0

