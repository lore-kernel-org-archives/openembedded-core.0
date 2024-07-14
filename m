Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C05CC3DA49
	for <webhook@archiver.kernel.org>; Sun, 14 Jul 2024 19:01:41 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.21793.1720983697525089122
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jul 2024 12:01:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DFERmZQA;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2cb0f5ee745so131316a91.2
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 12:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720983697; x=1721588497; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UR/WfdD9ylh1nAwT+76m9z+TiC6b2e5dm+T3fRrn4FI=;
        b=DFERmZQA7C5Bcikmd9Nu06dqjEHIvwMjPRJhPbmZ0Amgnq425gPLgpMFk6QjOtHOlH
         p1PA1mQ4jOW0zVAG44ffRpLoIQbe+daAyOgLyiVbItHy2HG66VAib6CoxAtK1swWNxH8
         J5spo7xdVtzebBakp8ASt4tmDuyEl+h/m+1GHj9+QSIQZkLbkhlCO976mLGofHXfw/I3
         655UxwKPDzosDaTblrV5MtizCMzLljmc78j6nAWuRDQicgEJdWxE++014xCPTy02o1G1
         1v+RBcH3xFgni4NlYPI/S0cfDuBCZ4zXkjs0J3FLzlyiRDlDJ3vl4bMDEF5u2A9uRSPb
         MPiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720983697; x=1721588497;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UR/WfdD9ylh1nAwT+76m9z+TiC6b2e5dm+T3fRrn4FI=;
        b=XkMUZRvm9+iflTjde2rMpxnuNQxKg+2E/jPiNCFuVvJeJV674iiyGG4C3ZZ7pzDKXk
         mDDilMghbV/lvrBwu1FO37xoaQeUTVqFY84p78KXd1KWclrqKqFHjnr4qectSmM9luZf
         IdJ0112YdULHRPtBh4STzhwr1CMCzHwnOlB5bG+xuPq1Z9UmGlA/AZ52mXWMb5T716AW
         qkDY2TqoqWXudK6J9io6ENR+jhWj1QNjpkD1KFDI9hv4o7d8QBEzDHFUReR6CInphKiW
         I90fm8HTIjB0BVUGHSTcszsousltYXX3caECr4rciSOtGDlnRqikKgoIb+X9ihJbL4Si
         vjyA==
X-Gm-Message-State: AOJu0Ywlvb90Mp6QiR/UXRR3BQqF2J2DxGvnn2LCuM5XDPrEA07R1QVj
	r0Uzg3ZA8GE8lXNImT2VIPXIFo6WiC9zkZMJxpjQMLHZ5lYg8ybSZOydt+G0
X-Google-Smtp-Source: AGHT+IHwCb2JHqdIs15/CZ1123MAb/wZeGpDSs5ZoIsjZFbwsawulJwY7Hkr9rtvNYBkfR0ZwkjSIw==
X-Received: by 2002:a17:902:daca:b0:1fb:32fd:8d8d with SMTP id d9443c01a7336-1fbb6ef5429mr130272535ad.68.1720983696666;
        Sun, 14 Jul 2024 12:01:36 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::f6de])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bb6fde3sm26620625ad.56.2024.07.14.12.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jul 2024 12:01:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] busybox: Add fix for CVE-2023-42366
Date: Sun, 14 Jul 2024 12:01:33 -0700
Message-ID: <20240714190133.946311-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jul 2024 19:01:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201895

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...1-awk.c-fix-CVE-2023-42366-bug-15874.patch | 37 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.36.1.bb   |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-awk.c-fix-CVE-2023-42366-bug-15874.patch

diff --git a/meta/recipes-core/busybox/busybox/0001-awk.c-fix-CVE-2023-42366-bug-15874.patch b/meta/recipes-core/busybox/busybox/0001-awk.c-fix-CVE-2023-42366-bug-15874.patch
new file mode 100644
index 00000000000..282c2fde5a5
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-awk.c-fix-CVE-2023-42366-bug-15874.patch
@@ -0,0 +1,37 @@
+From 8542236894a8d5f7393327117bc7f64787444efc Mon Sep 17 00:00:00 2001
+From: Valery Ushakov <uwe@stderr.spb.ru>
+Date: Wed, 24 Jan 2024 22:24:41 +0300
+Subject: [PATCH] awk.c: fix CVE-2023-42366 (bug #15874)
+
+Make sure we don't read past the end of the string in next_token()
+when backslash is the last character in an (invalid) regexp.
+a fix and issue reported in bugzilla
+
+https://bugs.busybox.net/show_bug.cgi?id=15874
+
+Upstream-Status: Submitted [http://lists.busybox.net/pipermail/busybox/2024-May/090766.html]
+
+CVE: CVE-2023-42366
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ editors/awk.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/editors/awk.c b/editors/awk.c
+index f320d8c..a53b193 100644
+--- a/editors/awk.c
++++ b/editors/awk.c
+@@ -1168,9 +1168,11 @@ static uint32_t next_token(uint32_t expected)
+ 					s[-1] = bb_process_escape_sequence((const char **)&pp);
+ 					if (*p == '\\')
+ 						*s++ = '\\';
+-					if (pp == p)
++					if (pp == p) {
++						if (*p == '\0')
++							syntax_error(EMSG_UNEXP_EOS);
+ 						*s++ = *p++;
+-					else
++					} else
+ 						p = pp;
+ 				}
+ 			}
diff --git a/meta/recipes-core/busybox/busybox_1.36.1.bb b/meta/recipes-core/busybox/busybox_1.36.1.bb
index 6972eef81ff..980a96b88ae 100644
--- a/meta/recipes-core/busybox/busybox_1.36.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.36.1.bb
@@ -55,6 +55,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://busybox-1.36.1-no-cbq.patch \
            file://0001-awk-fix-precedence-of-relative-to.patch \
            file://0002-awk-fix-ternary-operator-and-precedence-of.patch \
+           file://0001-awk.c-fix-CVE-2023-42366-bug-15874.patch \
            "
 SRC_URI:append:libc-musl = " file://musl.cfg "
 # TODO http://lists.busybox.net/pipermail/busybox/2023-January/090078.html

