Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CE63CA0EEB
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 16:02:54 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.18536.1755619372486113426
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 09:02:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hMIn0sH8;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-76e34c4ce54so50775b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 09:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755619371; x=1756224171; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Kj9TiFvT8KXG2P2EfbcoN5ZXYXmme+j5VE3pI5nIIic=;
        b=hMIn0sH8a1PockD/yVxT1eKDY3idEMXa7gjsjjD5iU4OViXRJV2lxnSvIM0IsUYqYY
         uJ2WHwofBSxakUkv8aNRDa+JMv70LXkNZxI+r4HdYOw/00G6XmNEhSbUmkbT62Uykuq2
         SxEy67u3CpITXgKDH+LedXFhqUiamLsOWsFCjLGX2KrtAsSFolPrWNhtYHZTgheELSK4
         YCjip42WN9R53B2cfmND/UOXEnMEYnz1nW4f3Ese+8Ze1Kk7/1n1I1B9NrV8r80oE5pU
         z4Au0ID1sRzRDPVp9A1e/KSIE+UUr2NhbvfkQfChJOvHj4nGry8dTIB+HCgetVgLQRdw
         bOZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755619371; x=1756224171;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kj9TiFvT8KXG2P2EfbcoN5ZXYXmme+j5VE3pI5nIIic=;
        b=qWdafEGF5VB7oVLBCIU+Fb442v7DwYwU78WCXSBf7eyl9WeOc62rEIocqa4jegF1q5
         0rz3NS1SWjkx4p8FdsxH+pPmsl9MFoD7RL6M2nSaDLTPgHv8zwR1ye0r6CPXlj1mydqa
         zSvZsagHtYTCtCpQg/4j2USg6yvqa+m7Mu21Te+S5MC8L8i9wQS/YoD9I+lVnd6QVROf
         g6yfYijvz+EjAwaZf5uD6kWKIPgMynOB6x0fc0lTA7kwjM7U9A9/G4YoCA6Nr1mGaX82
         3C+u3z1OdFffSSbn1G6120PFOHczqiJbKFfc+8H1RtgNPT6zLyFNdEjiUiSpkbx6p6V0
         jv0Q==
X-Gm-Message-State: AOJu0Yzy+cfnN/5JO+hU514IgWk5kd3ssA1TxQEg1N+cmMFQuvBpIG4Q
	T/81DL8lg4IYb3JykSMltEBRPWr9Zzx6GeqQdOTHYeJ++LQvKlxNZwH6e24O9MJ1
X-Gm-Gg: ASbGncvIT6MLKIuzmpW0AyHgm9fE5b52Ov9yN/AImQYwoAWdq5ZlCsnV1fTyzGShzOH
	x6NcWF4ErQlTHB/242N543GqRebpqV+Kn9RQmZkPPlq3jfKQYwJdAqHJfHMXuZUVuUj1kPWoYMC
	XVRF2vFejCv+1a6tXg4j8jeeIryKfl0OHVsioVZkAuqYeL1Y6bfV/J6ZwRhmU0/FMzeSZhi1yH+
	96SxcyKZ+iVtiF7Bk8WHM40e8PjqETtkmT9hdUDYeMxJkMxS1EtJCArPW+23qbOq7shV5PKpmHf
	LiC4ATPvrqieFVpNT6Q/B94Ecj3f1o9O2S3I8ZUDEoBlhARp0ZnNU6MTLTvWXv95oeYuTC+9x1e
	ua06A6F+iEoAGM1se2urarA==
X-Google-Smtp-Source: AGHT+IEv9Il7Cw/pqFfARcDiiR7M84CxEzyJa2Dw2ekm7lUu7KoLAM7AoUCpqd88ufd15ZMvliaoKQ==
X-Received: by 2002:a05:6a00:1988:b0:76c:44b5:4f62 with SMTP id d2e1a72fcca58-76e812cab1bmr3303058b3a.0.1755619371111;
        Tue, 19 Aug 2025 09:02:51 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::adc2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e84756106sm1994899b3a.78.2025.08.19.09.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 09:02:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] strace: Fix uio test and ignore pwritev|pwrite64 tests on musl
Date: Tue, 19 Aug 2025 09:02:44 -0700
Message-ID: <20250819160244.1712340-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 16:02:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222118

The pwritev and pwrite64 are wrappers over pwritev2 syscall in
musl but strace assumes glibc behavior, ignore them for now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Add note about upstream issue

 ...gnore-pwritev-pwrite64-tests-on-musl.patch | 56 +++++++++++++++++++
 ...01-tests-fix-uio.test-with-musl-libc.patch | 30 ++++++++++
 meta/recipes-devtools/strace/strace_6.16.bb   |  4 ++
 3 files changed, 90 insertions(+)
 create mode 100644 meta/recipes-devtools/strace/strace/0001-Ignore-pwritev-pwrite64-tests-on-musl.patch
 create mode 100644 meta/recipes-devtools/strace/strace/0001-tests-fix-uio.test-with-musl-libc.patch

diff --git a/meta/recipes-devtools/strace/strace/0001-Ignore-pwritev-pwrite64-tests-on-musl.patch b/meta/recipes-devtools/strace/strace/0001-Ignore-pwritev-pwrite64-tests-on-musl.patch
new file mode 100644
index 00000000000..f21f68001f6
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/0001-Ignore-pwritev-pwrite64-tests-on-musl.patch
@@ -0,0 +1,56 @@
+From 13fd22ad0df5b80c428d3ecc0114fb340f3b3894 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 18 Aug 2025 22:18:58 -0700
+Subject: [PATCH] Ignore pwritev/pwrite64 tests on musl
+
+musl uses wrappers for pwritev and pwrite64 using
+pwritev2 syscall [1], however the test exepcts that the
+program will call pwritev and pwrite64 ( glibc behavior )
+
+This can be fixed if the function calls are changed to
+use syscall() API directly, but that needs change upstream [2]
+
+Issue is reported upstream [3]
+
+[1] https://git.musl-libc.org/cgit/musl/commit/src?id=5370070fded61b569196764673a4fc8440aac79e
+[2] https://github.com/strace/strace/pull/347
+[3] https://github.com/strace/strace/issues/349
+
+Upstream-Status: Inappropriate [Musl Specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests/pread64-pwrite64.gen.test | 2 ++
+ tests/preadv-pwritev.gen.test   | 2 ++
+ tests/pwritev.gen.test          | 2 ++
+ 3 files changed, 6 insertions(+)
+
+--- a/tests/pread64-pwrite64.gen.test
++++ b/tests/pread64-pwrite64.gen.test
+@@ -1,4 +1,7 @@
+ #!/bin/sh -efu
+ # Generated by ./tests/gen_tests.sh from ./tests/gen_tests.in (pread64-pwrite64 -a21 -eread=0 -ewrite=1 -e trace=pread64,pwrite64 -P pread64-pwrite64-tmpfile -P /dev/zero -P /dev/null); do not edit.
+ . "${srcdir=.}/init.sh"
++
++skip_ "Test not ported to musl, musl generates pwritev2"
++
+ run_strace_match_diff -a21 -eread=0 -ewrite=1 -e trace=pread64,pwrite64 -P pread64-pwrite64-tmpfile -P /dev/zero -P /dev/null
+--- a/tests/preadv-pwritev.gen.test
++++ b/tests/preadv-pwritev.gen.test
+@@ -1,4 +1,7 @@
+ #!/bin/sh -efu
+ # Generated by ./tests/gen_tests.sh from ./tests/gen_tests.in (preadv-pwritev -a19 -eread=0 -ewrite=1 -e trace=preadv,pwritev); do not edit.
+ . "${srcdir=.}/init.sh"
++
++skip_ "Test not ported to musl, musl generates pwritev2"
++
+ run_strace_match_diff -a19 -eread=0 -ewrite=1 -e trace=preadv,pwritev
+--- a/tests/pwritev.gen.test
++++ b/tests/pwritev.gen.test
+@@ -1,4 +1,7 @@
+ #!/bin/sh -efu
+ # Generated by ./tests/gen_tests.sh from ./tests/gen_tests.in (pwritev -a22 -s7); do not edit.
+ . "${srcdir=.}/init.sh"
++
++skip_ "Test not ported to musl, musl generates pwritev2"
++
+ run_strace_match_diff -a22 -s7
diff --git a/meta/recipes-devtools/strace/strace/0001-tests-fix-uio.test-with-musl-libc.patch b/meta/recipes-devtools/strace/strace/0001-tests-fix-uio.test-with-musl-libc.patch
new file mode 100644
index 00000000000..a879ca50ca2
--- /dev/null
+++ b/meta/recipes-devtools/strace/strace/0001-tests-fix-uio.test-with-musl-libc.patch
@@ -0,0 +1,30 @@
+From 7fadf6947761cc5248aa4a376bb9517481dbaa52 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Tue, 12 Aug 2025 20:02:31 +0200
+Subject: [PATCH] tests: fix uio.test with musl-libc
+
+musl-libc handles the pwrite calls differently than glibc, making
+the uio test fail.  Using glibc, there are separated pwrite and pwritev
+calls, however musl uses only pwritev2 for both pwrite and pwritev.
+
+To account to this difference, modify the expected matching regexp
+to also match the musl output (append it with an OR).
+
+Upstream-Status: Backport [https://github.com/strace/strace/pull/347]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests/uio.expected | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/tests/uio.expected b/tests/uio.expected
+index 98d5c06..2a712a1 100644
+--- a/tests/uio.expected
++++ b/tests/uio.expected
+@@ -1,4 +1,4 @@
+ pread(64)?\(0, "\\0\\0\\0\\0", 4, 1004211379570065135\) += 4
+ preadv\(0, \[\{iov_base="\\0\\0\\0\\0", iov_len=4\}\], 1, 1004211379570065135\) += 4
+-pwrite(64)?\(0, "\\0\\0\\0\\0", 4, 1004211379570065135\) += 4
+-pwritev\(0, \[\{iov_base="\\0\\0\\0\\0", iov_len=4\}\], 1, 1004211379570065135\) += 4
++pwrite(64)?\(0, "\\0\\0\\0\\0", 4, 1004211379570065135\) += 4|pwritev2\(0, \[\{iov_base="\\0\\0\\0\\0", iov_len=4}], 1, 1004211379570065135, RWF_NOAPPEND\) += 4
++pwritev\(0, \[\{iov_base="\\0\\0\\0\\0", iov_len=4\}\], 1, 1004211379570065135\) += 4|pwritev2\(0, \[\{iov_base="\\0\\0\\0\\0", iov_len=4}], 1, 1004211379570065135, RWF_NOAPPEND\) += 4
diff --git a/meta/recipes-devtools/strace/strace_6.16.bb b/meta/recipes-devtools/strace/strace_6.16.bb
index 3e6b855df06..0552caa2b6d 100644
--- a/meta/recipes-devtools/strace/strace_6.16.bb
+++ b/meta/recipes-devtools/strace/strace_6.16.bb
@@ -14,6 +14,10 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/strace-${PV}.tar.xz \
            file://skip-load.patch \
            file://0001-configure-Use-autoconf-macro-to-detect-largefile-sup.patch \
            file://0002-tests-Replace-off64_t-with-off_t.patch \
+           file://0001-tests-fix-uio.test-with-musl-libc.patch \
+           "
+SRC_URI:append:libc-musl = "\
+           file://0001-Ignore-pwritev-pwrite64-tests-on-musl.patch \
            "
 SRC_URI[sha256sum] = "3d7aee7e4f044b2f67f3d51a8a76eda18076e9fb2774de54ac351d777d4ebffa"
 

