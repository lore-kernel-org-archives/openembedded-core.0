Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BB41C47073
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 08:29:56 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web10.25111.1704184187891465390
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jan 2024 00:29:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LtO83cmG;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3bc0fe6e60fso633175b6e.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 00:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704184187; x=1704788987; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJc5Jluh6b2nFW/z4npDUdoRc0M/lyU/cTcNzjxTAy8=;
        b=LtO83cmGb+G9D2AUsdo3KpNvLUaIgBiwUXCOzN0lSiPdwBkURnca76HPNzX5SqPEEK
         tZjjEFw7Tfp5tQNqtCF8/t/uFmEqSU1I5YR5z3FGBJ2tXexVS399otxbRYC1wYII5V+t
         j0XUw6kjaLOoeA4PdhxovL8iXzoKCGKOuSWSOL95YCcQJL/+WSmNU6fv2uUbVjCt3EGt
         K9gcjLOkUm0oP/gNTc+/n87dhweWHyiFDHW7j96EiOtGbMmjSBDY5HdIII1h/PIhzU2v
         Uen+DyCildiqkZ83WMPGhliEd13EKS5NrjPrlfi/Q1Rjcf6a/Ib81sqwG6XNsTa+ThsP
         QoFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704184187; x=1704788987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FJc5Jluh6b2nFW/z4npDUdoRc0M/lyU/cTcNzjxTAy8=;
        b=MZQWC2OlfQmQvMVLuZ1tXCmIfHdktFBEeVlCvFbv42gWYqSHhFfdNvK4UHuesa+d03
         vu7mChQDjPxedHXre3m7QI7SRKGVMGhIH1GDRxbAnz7N5d0wjIwGA45g2uUuQOmDzDUe
         RjSTt80YIOZj+4XyP4KLeOTmnslp5vfPqsBPZ6zNa73m9dpm6jLr4jQHwFKaauYTxYRg
         i4sAUnh/saOiazEp/61naVAragYOwU97tjsv8pjDSb9TWzZRWFN+UBjJ/c+vXqRm67fi
         tubTiSmYXu0RTP3Y2Eb/tzLEdK2yVdbbnUVjbv8QJJZf56mAwT9Cku7nFimwTJd93Cs4
         /qzw==
X-Gm-Message-State: AOJu0YzK9B4ctWazqzCmkdq8/c0iWqLWmHrG+nRtC6LMfmJ+E6fVXV0k
	OABlzd3HPILdeTHv5TxJdGq+dW+b6qc=
X-Google-Smtp-Source: AGHT+IHZhd0RVK25MemwBi0hgfy046oameV/cLhBRiK4At5fNg4z/Ua1FxJN+rZmLByQuekGHFQKyA==
X-Received: by 2002:a05:6358:3a0e:b0:175:4048:c590 with SMTP id g14-20020a0563583a0e00b001754048c590mr2599417rwe.58.1704184186599;
        Tue, 02 Jan 2024 00:29:46 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id f30-20020aa79d9e000000b006d9ae6fe867sm15572202pfq.110.2024.01.02.00.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 00:29:45 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] rpm: Fix build with musl
Date: Tue,  2 Jan 2024 00:29:42 -0800
Message-ID: <20240102082942.799830-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240102082942.799830-1-raj.khem@gmail.com>
References: <20240102082942.799830-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 08:29:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193219

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...lename-before-passing-it-to-basename.patch | 40 +++++++++++++++++++
 ...ix-missing-basename-include-on-macOS.patch | 26 ++++++++++++
 meta/recipes-devtools/rpm/rpm_4.18.1.bb       |  2 +
 3 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/files/0001-Duplicate-filename-before-passing-it-to-basename.patch
 create mode 100644 meta/recipes-devtools/rpm/files/0001-Fix-missing-basename-include-on-macOS.patch

diff --git a/meta/recipes-devtools/rpm/files/0001-Duplicate-filename-before-passing-it-to-basename.patch b/meta/recipes-devtools/rpm/files/0001-Duplicate-filename-before-passing-it-to-basename.patch
new file mode 100644
index 00000000000..f9b809d1676
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-Duplicate-filename-before-passing-it-to-basename.patch
@@ -0,0 +1,40 @@
+From 3fa2ae78db9b31edb4c22f3b5cd36c6c972947f1 Mon Sep 17 00:00:00 2001
+From: Florian Festi <ffesti@redhat.com>
+Date: Wed, 26 Jul 2023 15:01:35 +0200
+Subject: [PATCH] Duplicate filename before passing it to basename
+
+basename is allowed change the string passed to it. While we don't need
+the filename after that just casting away the const seems a bit too
+hacky.
+
+Upstream-Status: Backport [https://github.com/rpm-software-management/rpm/commit/3fa2ae78db9b31edb4c22f3b5cd36c6c972947f1]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tools/rpmuncompress.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/tools/rpmuncompress.c b/tools/rpmuncompress.c
+index 58ddf5683..e13cc6a66 100644
+--- a/tools/rpmuncompress.c
++++ b/tools/rpmuncompress.c
+@@ -98,7 +98,8 @@ static char *doUntar(const char *fn)
+ 	if (needtar) {
+ 	    rasprintf(&buf, "%s '%s' | %s %s -", zipper, fn, tar, taropts);
+ 	} else if (at->compressed == COMPRESSED_GEM) {
+-	    const char *bn = basename(fn);
++	    char *tmp = xstrdup(fn);
++	    const char *bn = basename(tmp);
+ 	    size_t nvlen = strlen(bn) - 3;
+ 	    char *gem = rpmGetPath("%{__gem}", NULL);
+ 	    char *gemspec = NULL;
+@@ -112,6 +113,7 @@ static char *doUntar(const char *fn)
+ 
+ 	    free(gemspec);
+ 	    free(gem);
++	    free(tmp);
+ 	} else {
+ 	    rasprintf(&buf, "%s '%s'", zipper, fn);
+ 	}
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/rpm/files/0001-Fix-missing-basename-include-on-macOS.patch b/meta/recipes-devtools/rpm/files/0001-Fix-missing-basename-include-on-macOS.patch
new file mode 100644
index 00000000000..a93597a8352
--- /dev/null
+++ b/meta/recipes-devtools/rpm/files/0001-Fix-missing-basename-include-on-macOS.patch
@@ -0,0 +1,26 @@
+From b2e67642fd8cb64d8cb1cca9e759396c1c10807d Mon Sep 17 00:00:00 2001
+From: Calvin Buckley <calvin@cmpct.info>
+Date: Tue, 11 Jul 2023 19:22:41 -0300
+Subject: [PATCH] Fix missing basename include on macOS
+
+Upstream-Status: Backport [https://github.com/rpm-software-management/rpm/commit/b2e67642fd8cb64d8cb1cca9e759396c1c10807d]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tools/rpmuncompress.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tools/rpmuncompress.c b/tools/rpmuncompress.c
+index bd4146d54..58ddf5683 100644
+--- a/tools/rpmuncompress.c
++++ b/tools/rpmuncompress.c
+@@ -1,6 +1,7 @@
+ #include "system.h"
+ 
+ #include <popt.h>
++#include <libgen.h>
+ #include <errno.h>
+ #include <stdio.h>
+ #include <string.h>
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/rpm/rpm_4.18.1.bb b/meta/recipes-devtools/rpm/rpm_4.18.1.bb
index 95a9e92f96b..3e85cbb8efe 100644
--- a/meta/recipes-devtools/rpm/rpm_4.18.1.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.18.1.bb
@@ -40,6 +40,8 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.18.x;protoc
            file://0001-python-Use-Py_hash_t-instead-of-long-in-hdr_hash.patch \
            file://fix-declaration.patch \
            file://ea3187cfcf9cac87e5bc5e7db79b0338da9e355e.patch \
+           file://0001-Duplicate-filename-before-passing-it-to-basename.patch \
+           file://0001-Fix-missing-basename-include-on-macOS.patch \
            "
 
 PE = "1"
-- 
2.43.0


