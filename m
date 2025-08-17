Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11944CA0EE4
	for <webhook@archiver.kernel.org>; Sun, 17 Aug 2025 20:50:43 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.60585.1755463839555623486
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Aug 2025 13:50:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dNJParXE;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45a1b05fe23so19881035e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Aug 2025 13:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755463838; x=1756068638; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=haHlDiB2C4DbL+ctmFTKki/dSJZv/BKf+xzdjoAt+NM=;
        b=dNJParXE4zQoCopWBquK+/ok9HZuoySG418lmQO3vePDGo+gOfNJvTKUowe+DOir2Y
         EflMRzBoOlMsrYLtsRp6v+NhxX28KmIM9k+4OKvypOTzy3OqGYJ9awZelDZcArVZDB3C
         p5pBmVmF515IGytKXMvUlfuntCzj/h+G/2aPwVx00TT+QUq8+MWCkmDqg1yl3pZIIOgr
         rhwoVCR1/jPVUBiLvgYkSvnFzO5Qj7MGPJZRJ6WKprDygp2eRdRADEQJhtGjqrks5JFP
         jgD5Q97UPT795IMRc1YgXjiZuGUUtNiyuYNE2X0EIVo7k8QsU9F7F+Vaq3me3RqXE8m1
         6rQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755463838; x=1756068638;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=haHlDiB2C4DbL+ctmFTKki/dSJZv/BKf+xzdjoAt+NM=;
        b=gBTNaN/L+TtFCls3ZpqAbNjOuRamYRfk2BS312+QHtGriqI22Mta30N1OFE3ILNr/g
         t5KVmlPTa2NcJkxku7z53OviYCv7EVUKkkNr3qmndGxMn2Vfqz1CxrYiEqZmoBr8nIuj
         /RrxOrLrftCzCPWSoRK12vl0WGod7sPU1qttFsov9pM1ODpbhhumJmoWbBFRg9rNQNh3
         FX/QtmRnlQuRE395PXjUROKhccs8+a8o3YPBzbNXhYpb+lX4SLORuVAlOz7hfJ94/8hr
         z401BfSjisSq72w9FcIR/EkcovgU5zIXh4/sTl0B1Zg0RJR+xcofyjnHpg/EBvV33T+S
         Pu2w==
X-Gm-Message-State: AOJu0Yz4FFdh6OiEl59TkyzNWzzONX/GzRNjB/IXGkX10qGWdduVNJVd
	XGdwoo/68R3jXJRFwQtaGJLY/fXSl7TyW84d0h95rPIOZEx+5DKN60r+NEhw1g==
X-Gm-Gg: ASbGncvtK0CPGVICmZCSyWUDZDGQhmYG57wfNkgj+rG5W/cwrtMhbGsuTxmZdCZaI9p
	yLLDYQPThGOCcx7tjcJ5eqlcsScea0aUSGFRq27Nu4/AjZFLxWKbAj59N25OxqrN0jYtqbK6vKE
	5jYmWoIDrxh1fuyjhoMwwkl1FFzgcxAe2DBEr7C0fFe7boOC0rD4AgE950Yp6FoJBdGPcEMMtLI
	+ibr7pofZ313o0SsmDYyJFIqRs/JRPBobN/ePZcZyaQEhyDR4utQubI7rpmWvjruYguxmSsfOEs
	AwtGDrrnAJn78dQPEG+lsKrabZkBYZdr5SIlUQErlnrhoAMVrukdFSERGuiF668K0l4THuN2cPo
	ZJ7cbtGJzZ/M3OHQ5sThfTZDzfQ==
X-Google-Smtp-Source: AGHT+IGGjU7PBZrvrHnLNf5obKj5kBUB8XFB1rd4PE+sHNfAWE9hvO3yrhYZmNlmnVSym+rgcrTvpw==
X-Received: by 2002:a05:600c:4f84:b0:456:25aa:e9c0 with SMTP id 5b1f17b1804b1-45a2180d6b0mr58856545e9.14.1755463837641;
        Sun, 17 Aug 2025 13:50:37 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3bb7f02578dsm10592058f8f.62.2025.08.17.13.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 13:50:37 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [scarthgap][PATCH 1/3] e2fsprogs: Fix build failure with gcc 15
Date: Sun, 17 Aug 2025 22:50:31 +0200
Message-ID: <20250817205033.3845672-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Aug 2025 20:50:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222018

From: Khem Raj <raj.khem@gmail.com>

Backport a needed fix

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ...-libext2fs-fix-std-c23-build-failure.patch | 42 +++++++++++++++++++
 .../e2fsprogs/e2fsprogs_1.47.0.bb             |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-libext2fs-fix-std-c23-build-failure.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-libext2fs-fix-std-c23-build-failure.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-libext2fs-fix-std-c23-build-failure.patch
new file mode 100644
index 0000000000..01ab9d5afb
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-libext2fs-fix-std-c23-build-failure.patch
@@ -0,0 +1,42 @@
+From 72dcef02bee9924c4d5b3dc6e7ef4d07becebcc6 Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Fri, 22 Nov 2024 12:36:32 +0000
+Subject: [PATCH] libext2fs: fix -std=c23 build failure
+
+gcc-15 switched to -std=c23 by default:
+
+    https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=55e3bd376b2214e200fa76d12b67ff259b06c212
+
+As a result `e2fsprogs` fails the build so only typedef int bool
+for __STDC_VERSION__ <= 201710L (C17)
+
+    ../../../lib/ext2fs/tdb.c:113:13: error: two or more data types in declaration specifiers
+    ../../../lib/ext2fs/tdb.c:113:1: warning: useless type name in empty declaration
+      113 | typedef int bool;
+          | ^~~~~~~
+
+https://github.com/tytso/e2fsprogs/issues/202
+
+Upstream-Status: Backport [https://github.com/tytso/e2fsprogs/commit/49fd04d77b3244c6c6990be41142168eef373aef]
+Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
+Link: https://lore.kernel.org/r/Z0B60JhdvT9bpSQ6@6f91903e89da
+Signed-off-by: Theodore Ts'o <tytso@mit.edu>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/ext2fs/tdb.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/lib/ext2fs/tdb.c b/lib/ext2fs/tdb.c
+index b07b2917..98dc95d8 100644
+--- a/lib/ext2fs/tdb.c
++++ b/lib/ext2fs/tdb.c
+@@ -110,7 +110,9 @@ static char *rep_strdup(const char *s)
+ #endif
+ #endif
+ 
++#if defined __STDC__ && defined __STDC_VERSION__ && __STDC_VERSION__ <= 201710L
+ typedef int bool;
++#endif
+ 
+ #include "tdb.h"
+ 
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
index 940b47c155..0288854527 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
@@ -4,6 +4,7 @@ SRC_URI += "file://remove.ldconfig.call.patch \
            file://run-ptest \
            file://ptest.patch \
            file://mkdir_p.patch \
+           file://0001-libext2fs-fix-std-c23-build-failure.patch \
            "
 SRC_URI:append:class-native = " \
            file://e2fsprogs-fix-missing-check-for-permission-denied.patch \

