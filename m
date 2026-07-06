Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87877C44507
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 17:17:12 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.156290.1783358231496225607
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 10:17:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=g21jCx/+;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so1371124f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 10:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783358230; x=1783963030; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YPmqa10LIOJC3kkYhcrR9WP5dlB61CQOFLIcAwr6iOk=;
        b=g21jCx/+EDMjDP0Xzz+6Q5BmaqXsBVzLgOG7QsqH9szG9UDXf/xHtTtom4mY+25Vah
         XPZj0ccsL3RmWxkV6HbSPkJ9z24H1g7u5Q4NJbTJMBqcM6hWyzpecocZjjEYUMdObD6t
         9RWRb5aNmrSLYI1u2zaCRknB5sMWITx2PUktgss2zya8COBzGIPuFWlqWIprUxPpjsDq
         /X1oLzNke4R8Nr6fxUeq1y3VJ70yNUuDZDTh/BRx2qnf26GDFQnR++5L8riQLRIy5CkL
         5ybeZDhCMVR9u32B3gUhqc/XlvpzUJ4DPUgVBkZ6aLivWuzRAoYKIt9GNPO86UHqe1By
         k7SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783358230; x=1783963030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YPmqa10LIOJC3kkYhcrR9WP5dlB61CQOFLIcAwr6iOk=;
        b=sYqk+a0A+MzhxaekHsEq3UxpfQ7bim+yzmKmKgOkcMh0ODAD4VdmcvosvNpPCkoG+5
         ejncbc2rVZejTxxpVnG8qyLM45kDff5CCj0l0mUZtDICDj4aU33ARQiWjxmGgWun8ZiG
         AgBrZnotgaqsGBPpo+tBD0NEYfUHsGmCznHSLPdCto/JGeBPJD4qEHdCClrS79gLqRXO
         L5H8VBkVmBXMqU8tEjGDvCKv6QA/nfyc2flveUNM6ZG4CbWFFncKd+PNckqDPD64KwQE
         xEu/OBbcntNiltI5qiXHvWfAyNxbQ2Mj8vfzWgpWHJ+5Rjc320RJ0dT+4c157cxuzQBR
         Gslw==
X-Gm-Message-State: AOJu0Yzz/eYqrAMOOomBYS2F5uc/foFKSfq7yeDJRzcvt+q7ARKt/Us1
	FRhnNpmkN3KtgVaE8N5wPJol9KSP9r5kM8T4+5zCNYiTXHKkROxcdtqCcnoZnQ==
X-Gm-Gg: AfdE7cmq4dtU2aRaB3vzEzu51VSDF5s8rMRWRhnrz1HDVzWiT2Y6mxhKUyBy0CTCILe
	dWenxRVyRuQcTsosuvcMJKqU9cH2zbKmBcJwOAleitNQRW06D+LeaOu/Q9yOoLtoQj2OQQMbcgw
	BAL4pXO7uLdcLMQ5X8ZMBHBspnWoNGEYzy1TI9eYwgP3ve6OCMwQyR9KRUgKOWRHo3WqvM4JAEi
	Kv23dJFW1ZDOyjrS3Vw9TBAP9yhfDyMiW+ZyT4i+2Z2q7g43V8Zqk3vEbCk4l7yN2FJGt7ks+8k
	MmTp0eEumREdSUX6nc0LGl2gGqQs8OnboUnzb80o8HbecW5/JiZonJ2L0opXvv53NR5ck0yeVkH
	xS1iAtgtXkmX8HJ0KDFjPKXFwnZB2qCFzODd5uSgC4cXLYVCXJIl8FszTc8v3aRCJNWX7bNdcDe
	3Er0SiWvvvUNs1i4EfCWEFC2PsF7Vidh6cEVsZmyJJn42J5OjJ
X-Received: by 2002:a05:600c:548b:b0:493:c337:db0e with SMTP id 5b1f17b1804b1-493df080c83mr20099115e9.18.1783358229545;
        Mon, 06 Jul 2026 10:17:09 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba971sm640541005e9.13.2026.07.06.10.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:17:09 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/45] attr: upgrade 2.5.2 -> 2.6.0
Date: Mon,  6 Jul 2026 19:16:20 +0200
Message-ID: <20260706171701.70536-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260706171701.70536-1-alex.kanavin@gmail.com>
References: <20260706171701.70536-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 17:17:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240292

From: Alexander Kanavin <alex@linutronix.de>

Drop patch (issue fixed upstream).

Adjust file names in ptest packaging.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ibgen.h-for-posix-version-of-basenam.patch | 35 -------------------
 meta/recipes-support/attr/attr/run-ptest      |  2 +-
 .../attr/{attr_2.5.2.bb => attr_2.6.0.bb}     |  7 ++--
 3 files changed, 4 insertions(+), 40 deletions(-)
 delete mode 100644 meta/recipes-support/attr/attr/0001-attr.c-Include-libgen.h-for-posix-version-of-basenam.patch
 rename meta/recipes-support/attr/{attr_2.5.2.bb => attr_2.6.0.bb} (88%)

diff --git a/meta/recipes-support/attr/attr/0001-attr.c-Include-libgen.h-for-posix-version-of-basenam.patch b/meta/recipes-support/attr/attr/0001-attr.c-Include-libgen.h-for-posix-version-of-basenam.patch
deleted file mode 100644
index 1e2bea5067..0000000000
--- a/meta/recipes-support/attr/attr/0001-attr.c-Include-libgen.h-for-posix-version-of-basenam.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 6d9e827bcacf387bb3cfae64bd4fe520168ccad4 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 3 Dec 2023 19:29:27 -0800
-Subject: [PATCH] attr.c: Include libgen.h for posix version of basename API
-
-Musl has removed the definition from string.h [1] which results in
-compile failures with clang
-
-| ../attr-2.5.1/tools/attr.c:69:13: error: call to undeclared function 'basename'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
-|    69 |         progname = basename(argv[0]);
-|       |                    ^
-
-[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
-
-Upstream-Status: Submitted [https://savannah.nongnu.org/bugs/index.php?64972]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- tools/attr.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/tools/attr.c b/tools/attr.c
-index 312aef1..90dab83 100644
---- a/tools/attr.c
-+++ b/tools/attr.c
-@@ -26,6 +26,7 @@
- #include <stdlib.h>
- #include <unistd.h>
- #include <errno.h>
-+#include <libgen.h>
- #include <string.h>
- #include <locale.h>
- 
--- 
-2.43.0
-
diff --git a/meta/recipes-support/attr/attr/run-ptest b/meta/recipes-support/attr/attr/run-ptest
index 028671a9bd..50970d5b65 100644
--- a/meta/recipes-support/attr/attr/run-ptest
+++ b/meta/recipes-support/attr/attr/run-ptest
@@ -3,7 +3,7 @@
 failed=0
 all=0
 
-for f in *.test; do
+for f in *.run; do
     ./run $f
     case "$?" in
         0)
diff --git a/meta/recipes-support/attr/attr_2.5.2.bb b/meta/recipes-support/attr/attr_2.6.0.bb
similarity index 88%
rename from meta/recipes-support/attr/attr_2.5.2.bb
rename to meta/recipes-support/attr/attr_2.6.0.bb
index 390445b959..aa5e7eb98f 100644
--- a/meta/recipes-support/attr/attr_2.5.2.bb
+++ b/meta/recipes-support/attr/attr_2.6.0.bb
@@ -16,10 +16,9 @@ LIC_FILES_CHKSUM = "file://doc/COPYING;md5=2d0aa14b3fce4694e4f615e30186335f \
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/attr/${BP}.tar.gz \
            file://run-ptest \
-           file://0001-attr.c-Include-libgen.h-for-posix-version-of-basenam.patch \
 "
 
-SRC_URI[sha256sum] = "39bf67452fa41d0948c2197601053f48b3d78a029389734332a6309a680c6c87"
+SRC_URI[sha256sum] = "d42fa374513180bb48cb11a46696f488240e5124ff1e6ad88b0abff706985612"
 
 inherit ptest update-alternatives autotools gettext
 
@@ -35,7 +34,7 @@ ALTERNATIVE_TARGET[getfattr] = "${bindir}/getfattr"
 do_install_ptest() {
     install -m755 ${S}/test/run ${S}/test/sort-getfattr-output ${D}${PTEST_PATH}/
 
-    for t in $(makefile-getvar ${S}/test/Makemodule.am TESTS); do
+    for t in $(makefile-getvar ${B}/Makefile TESTS); do
         install -m644 ${S}/$t ${D}${PTEST_PATH}/
     done
 }
@@ -44,7 +43,7 @@ do_install_ptest:append:libc-musl() {
     # With glibc strerror(ENOTSUP) is "Operation not supported" but
     # musl is "Not supported".
     # https://savannah.nongnu.org/bugs/?62370
-    sed -i -e 's|f: Operation not supported|f: Not supported|g' ${D}${PTEST_PATH}/attr.test
+    sed -i -e 's|f: Operation not supported|f: Not supported|g' ${D}${PTEST_PATH}/attr.run
 }
 
 RDEPENDS:${PN}-ptest = "attr \
-- 
2.47.3


